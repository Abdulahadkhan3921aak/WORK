package edu.ufp.inf.sd.rmi.projeto_final.client.bombermanGame.src;

import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

// a cada cliente que entra no servidor, uma nova thread é instanciada para tratá-lo
class ClientManager extends Thread {
   private static List<PrintStream> listOutClients = new ArrayList<>();

   private Socket clientSocket;
   private Scanner in;
   private PrintStream out;
   private int id;
   private Server server;
   private CoordinatesThrower ct;
   private MapUpdatesThrower mt;

   ClientManager(Socket clientSocket, int id, Server server) {
      this.id = id;
      this.clientSocket = clientSocket;
      this.server = server;
      (ct = new CoordinatesThrower(this.id, server)).start();
      (mt = new MapUpdatesThrower(this.id, server)).start();

      try {
         System.out.print("Iniciando conexão com o jogador " + this.id + "...");
         this.in = new Scanner(clientSocket.getInputStream()); // para receber do cliente
         this.out = new PrintStream(clientSocket.getOutputStream(), true); // para enviar ao cliente
      } catch (IOException e) {
         System.out.println(" erro: " + e + "\n");
         System.exit(1);
      }
      System.out.print(" ok\n");

      synchronized (listOutClients) {
         listOutClients.add(out);
      }
      server.getPlayers()[id].logged = true;
      server.getPlayers()[id].alive = true;
      sendInitialSettings(); // envia uma única string

      // notifica aos clientes já logados
      synchronized (listOutClients) {
         for (PrintStream outClient : listOutClients) {
            if (outClient != this.out) {
               outClient.println(id + " playerJoined");
            }
         }
      }
   }

   @Override
   public void run() {
      while (in.hasNextLine()) { // conexão estabelecida com o cliente this.id
         String[] str = in.nextLine().split(" ");

         if (str[0].equals("keyCodePressed") && server.getPlayers()[id].alive) {
            ct.keyCodePressed(Integer.parseInt(str[1]));
         } else if (str[0].equals("keyCodeReleased") && server.getPlayers()[id].alive) {
            ct.keyCodeReleased(Integer.parseInt(str[1]));
         } else if (str[0].equals("pressedSpace") && server.getPlayers()[id].numberOfBombs >= 1) {
            server.getPlayers()[id].numberOfBombs--;
            mt.setBombPlanted(Integer.parseInt(str[1]), Integer.parseInt(str[2]));
         }
      }
      clientDisconnected();
   }

   private void sendInitialSettings() {
      out.print(id);
      for (int i = 0; i < Const.LIN; i++) {
         for (int j = 0; j < Const.COL; j++) {
            out.print(" " + server.getMap()[i][j].img);
         }
      }

      for (int i = 0; i < Const.QTY_PLAYERS; i++) {
         out.print(" " + server.getPlayers()[i].alive);
      }

      for (int i = 0; i < Const.QTY_PLAYERS; i++) {
         out.print(" " + server.getPlayers()[i].x + " " + server.getPlayers()[i].y);
      }
      out.print("\n");
   }

   private void clientDisconnected() {
      synchronized (listOutClients) {
         listOutClients.remove(out);
      }
      server.getPlayers()[id].logged = false;
      try {
         System.out.print("Encerrando conexão com o jogador " + this.id + "...");
         in.close();
         out.close();
         clientSocket.close();
      } catch (IOException e) {
         System.out.println(" erro: " + e + "\n");
         System.exit(1);
      }
      System.out.print(" ok\n");
   }

   static void sendToAllClients(String outputLine) {
      synchronized (listOutClients) {
         for (PrintStream outClient : listOutClients) {
            outClient.println(outputLine);
         }
      }
   }
}
