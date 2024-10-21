#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <signal.h>
#include <errno.h>
#include <strings.h>
#include <string.h>
#include <limits.h>
#include <unistd.h>
#include <netdb.h>
#include <ifaddrs.h>
#include <pthread.h>
#define NUM_HOSTS 3
#define PORT 0x2222
typedef enum
{
IDLE,
IN_CS,
BLOCKED
} state_t;
typedef enum
{
HELLO,
HELLO_ACK,
REQUEST,
REPLY
} cmd_t;
typedef struct
{
unsigned short cmd; // command, e.g., HELLO | HELLO_ACK | REQUEST | REPLY (HELLO & HELLO_ACK are additional command for debugging purposes)
unsigned short seq; // sequence number of avoid duplicates
unsigned int hostid; // this is optional because you can obtain the host (sender) information from the ip header, we add this fied for the convenience.
unsigned short vector_time[NUM_HOSTS]; // support upto to 5 hosts
// Lazy copy-past
} msg_t;
typedef struct
{
unsigned short count;
unsigned short cond;
} __dst_sema;
typedef __dst_sema* dst_sema_t; // This is our distributed algo spec semaphore
int sendmsg(char*, msg_t*);
int distributed_mutex_unlock(char** hosts, unsigned short num_hosts, unsigned short \ _ts_vec, unsigned short * curr_seq, unsigned short\ rd, int ignr_idx);_
_int distributed_mutex_lock(char hosts, unsigned short num_hosts, unsigned short\ tsvec, unsigned short curr_seq, int ignr_idx, dst_sema_t sph);
_int distributed_mutex_init(void, pthread_t );
dst_sema_t dsem_init(unsigned short); // Initialize counting semaphore with 0;
void dsem_unlock_once(dst_sema_t); // This will increment our counting semaphore with one
int dsem_check_locked(dst_sema_t);
int dsem_reset(dst_sema_t);
void init_sockaddr(struct sockaddr_in);
int load_hosts(char\*);
int init_desc_andcheck(int);
int which_host(char\ _hosts[NUM_HOSTS], char* senderIP);
void update_ts(unsigned short vactor_loc[NUM_HOSTS], unsigned short vector_rec[NUM_HOSTS], int ignr);
int get_my_address(char * my_ifname, char addr_buff[24]);
int find_my_addr_idx(char hosts[NUM_HOSTS], char my_ip[24]);
int mstrcmp(char*, char*);
// this vars will be shared between main thread and listening thread
state_t state = IDLE; // Represents the state of the process
unsigned short curr_seq = 0; // Host sequence counter
int my_index = -1; // Host index in diff arrays
char* hosts[NUM_HOSTS]; // The ip addresses we read from process.hosts
unsigned short ts_vactor[NUM_HOSTS] = {0} ; // THIS is the local timestamp vector
unsigned char reply_cnt = 0; // This is the replies counter , to unblock the host
unsigned short rd[NUM_HOSTS] = {0}; // The Request-Deferred array
unsigned short seqs[NUM_HOSTS] = {0}; // This gonna track seq number to avoid duplicates
char my_addr[24]; // The host address
pthread_t lis_thread_id; // Listener thread id
dst_sema_t sph;
unsigned short wait_time[5] = {0, 2, 3, 5, 7}; // THIS WILL BE USED FOR TEST : SERVER 0 IS THE SENDER, 1: WILL WAIT 2 SECONDS BEFORE REPLYING ....
int test_done = 0;
void run_test(){
msg_t msg;
int j;
msg.cmd = HELLO;
msg.seq = curr_seq;
for(j = 0; j < NUM_HOSTS; ++j)
    if(j != my_index )
        msg.vector_time[j] = ts_vactor[j];


for(j=0; j<NUM_HOSTS; ++j){
    if(j!=my_index){
  printf("INFO : SENDING HELLO TO %s SEQ = %d \\n", hosts[j], msg.seq);
      send_msg(hosts[j], &msg);
}
}

ts_vactor[my_index]++;
curr_seq++;
}
void listen_thread(){
int socket_fd; // The listening socket fd
int fsize, cc;
msg_t msg;
char senderIP; // This one to keep the sender IP address
int tmp_int,i, j;
struct sockaddr_in    server_addr, client_addr;        // This : server ; Others : client
socket_fd = socket (AF_INET, SOCK_DGRAM, 0);     // We're going to use this socket to send and receive
if (socket_fd < 0) {
    printf("recv_udp:socket\\n");
    exit(-1);
}

init_sockaddr(&server_addr);                    // Init server (this) address

if (bind(socket_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
    printf("Listener thread : bind error\\n");
    exit(-1);
}
printf("INFO : LISTENER THREAD INITIALIZED SUCESSFULLY !!\\n");
for(;;){
    fsize = sizeof(client_addr);
    init_desc_and_check(socket_fd);
    printf("INFO : LISTENING !!\\n");
    cc = recvfrom(socket_fd,&msg,sizeof(msg),0,(struct sockaddr *)&client_addr, (socklen_t *)&fsize);
    if( cc < 0){
        printf("recv_udp:~~TIMEOUT\\n");    // error receiving msg
        continue;
    }
    senderIP = inet_ntoa(client_addr.sin_addr);
    tmp_int = which_host(hosts, senderIP);
    if(seqs[tmp_int] > msg.seq){
        printf("INFO : MESSAGE OF %s SEQ = %d is duplicated!\\n", senderIP, msg.seq);
        continue;
    }
    printf("INFO : NEW MESSAGE FROM %s SEQ = %d \\n", senderIP, msg.seq);
    update_ts(ts_vactor, msg.vector_time, my_index);
    seqs[tmp_int] = msg.seq + 1;
    if(msg.cmd == REQUEST){
        printf("INFO : GOT REQUEST FROM %s SEQ = %d \\n", senderIP, msg.seq);
        if(state == IN_CS)
            rd[tmp_int]++;
        else{
            if(state == BLOCKED && ts_vactor[my_index] < ts_vactor[tmp_int])        // If this host is blocked and received a request, the periority is for the one with the lowest TS
                rd[tmp_int]++;

            else{                                                                    // SEND REPLY TO THE SENDER IF ITS TS IS LOWER THAN MINE
                msg.cmd = REPLY;
                msg.seq = curr_seq;
                for(j = 0; j < NUM_HOSTS; ++j)
                    if(j != my_index )
                        msg.vector_time[j] = ts_vactor[j];

                printf("INFO : SENDING REPLY TO %s SEQ = %d \\n", senderIP, msg.seq);
                send_msg(senderIP, &msg);
                ts_vactor[my_index]++;
                curr_seq++;
            }
        }
    }
    else{
        if(msg.cmd == REPLY){
            printf("INFO : A REPLY FROM %s SEQ = %d \\n", senderIP, msg.seq);
            dsem_unlock_once(sph);
        }
        else if(msg.cmd == HELLO){
            printf("INFO : A HELLO MESSAGE FROM %s SEQ = %d \\n", senderIP, msg.seq);
            msg.cmd = HELLO_ACK;
            msg.seq = curr_seq;
            for(j = 0; j < NUM_HOSTS; ++j)
                    if(j != my_index )
                        msg.vector_time[j] = ts_vactor[j];

            sleep(wait_time[my_index]);                                    // SO EVERYONE WILL WAIT AS DECRIBED 2s, 3s, 5s, 7s
            printf("INFO : I WAITED FOR %d \\n", wait_time[my_index]);
            send_msg(senderIP, &msg);
            ts_vactor[my_index]++;                                        // INCREMENT THIS HOST TIMESTAMP
            curr_seq++;                                                    // INCREMENT THE MESSAGES SEQ
            test_done = 1;
        }
        else if(msg.cmd == HELLO_ACK){
            printf("INFO : A HELLO ACK MESSAGE FROM %s SEQ = %d THANK YOU\\n", senderIP, msg.seq);
            test_done = 1;
        }
    }
}
return NULL;
}
int main(int argc, char* argv[]){
unsigned char do_what = 0;                             // According the value of this we decide what we're going to do
struct sockaddr_in    server_addr, client_addr;        // This : server ; Others : client

msg_t msg;                                            // The var that will hold our received message
int tmp_int, i, j;
short cs_cnt = 0;                                    // This gonna semulate time of processing in the cs


if(argc <= 1)
{
    printf("ARGS : No interface specified !!\\n");
    exit (-1);
}
printf("INFO : GOING TO USE %s !!\\n", argv[1]);

if(load_hosts(hosts) < 0)
{
    printf("recv_udp:load hosts\\n");
    exit (-1);
}

printf("INFO : HOSTS LOADED SUCESSFULLY !!\\n");
for(i=0; i<NUM_HOSTS; ++i)
printf("%s\n", hosts[i]);
if(get_my_address(argv[1], my_addr) < 0)
{
    printf("INIT : cannot retreive IP address\\n");
    exit(-1);
}

my_index = find_my_addr_idx(hosts, my_addr) ;
if(my_index < 0)
{
    printf("INIT : Cannot find my address !\\n");
    exit(-1);
}

printf("INFO : MY INDEX IS %d !!\\n", my_index);
state = IDLE;
sph = dsem_init(NUM_HOSTS - 1);
distributed_mutex_init((void*)listen_thread, &lis_thread_id);

// RUN TEST HERE :
if(my_index == 0){
    run_test();
    while(!test_done)
        sleep(1);
}
else{
    while(!test_done)
        sleep(1);
}

printf("INFO : TEST DONE & ENTERING INF LOOP !!\\n");
for(;;)                                            // Infinte loop
{
    do_what = rand() % 11;                        // I want to make the stuff pseudo-random 0-6: just listen ; 7-10 : REQUEST CS

    printf("INFO : DO_WHAT = %d !!\\n", do_what);
    if(do_what == 2)
    {
        state = BLOCKED;
        distributed_mutex_lock(hosts, NUM_HOSTS, ts_vactor, &curr_seq, my_index, sph);
        state = IN_CS;
        printf("TEST : CHANGING BANK BALANCE --------------------------------------------------------\\n");
        sleep(60);
        printf("INFO : RELEASING CS SENDING REPLIES \\n");
        distributed_mutex_unlock(hosts, NUM_HOSTS, ts_vactor, &curr_seq, rd, my_index);

    }
    else if(do_what == 4){                        // suppose this an internal job
     sleep(2);
     ts_vactor[my_index] ++;
    }
    state = IDLE;
    dsem_reset(sph);
    sleep(3);
}

return 0;                // EVERY THING IS OK
}
int mstrcmp(char\ *s1, char* s2){
int i = 0;
int j;
for(j=0; 1 ; ++j)
{
if(*(s1+j) == '\\0' || *(s2+j) == '\\0')
  return 0;

if(*(s1+j) != *(s2+j))
  return 1;
}
return 0;
}
int find_my_addr_idx(char* hosts[NUM_HOSTS], char my_ip[24])
{
int i;
for(i = 0; i < NUM_HOSTS; ++i){
printf("%s\n", hosts[i]);
if(!mstrcmp(hosts[i], my_ip))
return i;
}
return -1;
}
void init_sockaddr(struct sockaddr_in s_in)
{
bzero((char ) s_in, sizeof(struct sockaddr_in));
s_in->sin_family = (short) AF_INET;
(s_in->sin_addr).s_addr = htonl(INADDR_ANY); // Accept all
s_in->sin_port = htons((u_short)PORT); // Set port
}
int load_hosts(char** hosts)
{
int i, sz;
FILE* file = fopen("./process.hosts", "r");
if(file == NULL)
return -1;
size_t line_size = 24;
for(i = 0; i < NUM_HOSTS; ++i)
{
    sz = getline(hosts + i, &line_size, file );
    if(sz == -1)
    {
        hosts[i][0] = '\\0';
        break;
    }
    hosts[i][sz - 1] = '\\0';
printf("%s\\n", hosts[i]);

}
printf("END LOADING HOSTS !!\\n");
fclose(file);
return 0;
}
int init_desc_and_check(int socket_fd)
{
int hits;
fd_set mask;
struct timeval timeout;
FD_ZERO(&mask);
FD_SET(socket_fd,&mask);
timeout.tv_sec = 15;
timeout.tv_usec = 0;
setsockopt(socket_fd, SOL_SOCKET, SO_RCVTIMEO, (const char*)&timeout, sizeof(timeout));
return 1;
}
int which_host(char\ *hosts[NUM_HOSTS], char* senderIP) // find the index of this ip address for timestamp array, seq array ...
{
int i;
for(i = 0; i < NUM_HOSTS; ++i)
if(!strcmp(hosts[i], senderIP))
return i;
return -1;
}
void update_ts(unsigned short vactor_loc[NUM_HOSTS], unsigned short vector_rec[NUM_HOSTS], int ignr) // update ts vector when receiving new message
{
int i;
for(i = 0; i < NUM_HOSTS; ++i)
if(i != ignr)
if(vactor_loc[i] < vector_rec[i])
vactor_loc[i] = vector_rec[i];
}
int get_my_address(char my_ifname, char addr_buff[24]) // find which address is mine
{
struct ifaddrs \ifaddr, *ifa;
int family, s;
char host[NI_MAXHOST];
if (getifaddrs(&ifaddr) == -1) {
    return -1;
}

for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
    if (ifa->ifa_addr == NULL)
        continue;

    s = getnameinfo(ifa->ifa_addr, sizeof(struct sockaddr_in), host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);

    if ((strcmp(ifa->ifa_name, my_ifname) == 0) && (ifa->ifa_addr->sa_family == AF_INET)) {
        if (s != 0) {
            return -1;
        }

        strcpy(addr_buff, host);
        printf("%s\\n", host);
        return 1;
    }
}

return 0;
}
int send_msg(char\ *dist, msg_t* msg)
{
int socket_fd, cc;
struct sockaddr_in dest;
struct hostent *gethostbyname(), *hostptr;
socket_fd = socket (AF_INET, SOCK_DGRAM, 0);
if (socket_fd == -1) {
      perror ("send_udp:socket");
      return (-1);
}

bzero((char ) &dest, sizeof(dest)); / must do this */
dest.sin_family = AF_INET;
dest.sin_addr.s_addr = inet_addr(dist);
dest.sin_port = htons((u_short)PORT);

cc = sendto(socket_fd, msg,sizeof(msg_t),0,(struct sockaddr *)&dest,
              sizeof(dest));
if (cc < 0) {
      perror("send_udp:sendto");
    return (-1);
}
close(socket_fd);

return(0);
}
int distributed_mutex_unlock(char** hosts, unsigned short num_hosts, unsigned short \ *ts_vec, unsigned short * curr_seq, unsigned short *rd, int ignr_idx){
msg_t msg;
int i, j;
int cnt = 0;
for( i = 0; i < num_hosts; ++i)                    // TODO : release cs by sending counted replies to others
{
    if(rd[i] > 0 && i != ignr_idx)
    {
        msg.cmd = REPLY;
        msg.seq = *curr_seq;
        for(j = 0; j < num_hosts; ++j)
            msg.vector_time[j] = ts_vec[j];

        printf("INFO : SENDING REPLY SEQ = %d TO %s !!\\n", *curr_seq, hosts[i]);
        if(send_msg(hosts[i], &msg) == 0)
            ++cnt;
        (*curr_seq)++;
        rd[i] = 0;
    }
}
return cnt;
}
int distributed_mutex_lock(char** hosts, unsigned short num_hosts, unsigned short *ts_vec, unsigned short * curr_seq, int ignr_idx, dst_sema_t sph){
msg_t msg;
int i;
printf("INFO : GOING TO REQUEST CS \\n");
msg.cmd = REQUEST;
msg.seq = *curr_seq;
for(i = 0; i < num_hosts; ++i)
    if(i != ignr_idx)
        msg.vector_time[i] = ts_vec[i];

// Request CS here
for(i = 0; i < num_hosts;  ++i)
{
    if(i != ignr_idx)
    {
        printf("INFO : SENDING REQUEST SEQ = %d TO %s \\n", *curr_seq, hosts[i]);
        send_msg(hosts[i], &msg);
    }
}

ts_vec[ignr_idx]++;
(*curr_seq)++;

while(dsem_check_locked(sph))
{
    continue;
}

return 0;
}
int distributed_mutex_init(void\ *listener_thread, pthread_t* lthid){
return pthread_create(lthid, NULL, listener_thread, NULL);
}
dst_sema_t dseminit(unsigned short cond){
dst_sema_t sph = (dst_sema_t)malloc(sizeof(\_dst_sema));
sph->count = 0;
sph->cond = cond;
return sph;
}
void dsem_unlock_once(dst_sema_t sph){
(sph->count)++;
}
int dsem_check_locked(dst_sema_t sph){
return (sph->count) < (sph->cond);
}
int dsem_reset(dst_sema_t sph){
sph->count = 0;
}
