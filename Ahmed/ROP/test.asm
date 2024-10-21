
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	f3 0f 1e fa          	endbr64
  400c4c:	48 83 ec 08          	sub    $0x8,%rsp
  400c50:	48 8b 05 99 43 20 00 	mov    0x204399(%rip),%rax        # 604ff0 <__gmon_start__@Base>
  400c57:	48 85 c0             	test   %rax,%rax
  400c5a:	74 02                	je     400c5e <_init+0x16>
  400c5c:	ff d0                	call   *%rax
  400c5e:	48 83 c4 08          	add    $0x8,%rsp
  400c62:	c3                   	ret

Disassembly of section .plt:

0000000000400c70 <.plt>:
  400c70:	ff 35 92 43 20 00    	push   0x204392(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c76:	ff 25 94 43 20 00    	jmp    *0x204394(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c80 <strcasecmp@plt>:
  400c80:	ff 25 92 43 20 00    	jmp    *0x204392(%rip)        # 605018 <strcasecmp@GLIBC_2.2.5>
  400c86:	68 00 00 00 00       	push   $0x0
  400c8b:	e9 e0 ff ff ff       	jmp    400c70 <.plt>

0000000000400c90 <__errno_location@plt>:
  400c90:	ff 25 8a 43 20 00    	jmp    *0x20438a(%rip)        # 605020 <__errno_location@GLIBC_2.2.5>
  400c96:	68 01 00 00 00       	push   $0x1
  400c9b:	e9 d0 ff ff ff       	jmp    400c70 <.plt>

0000000000400ca0 <srandom@plt>:
  400ca0:	ff 25 82 43 20 00    	jmp    *0x204382(%rip)        # 605028 <srandom@GLIBC_2.2.5>
  400ca6:	68 02 00 00 00       	push   $0x2
  400cab:	e9 c0 ff ff ff       	jmp    400c70 <.plt>

0000000000400cb0 <strncmp@plt>:
  400cb0:	ff 25 7a 43 20 00    	jmp    *0x20437a(%rip)        # 605030 <strncmp@GLIBC_2.2.5>
  400cb6:	68 03 00 00 00       	push   $0x3
  400cbb:	e9 b0 ff ff ff       	jmp    400c70 <.plt>

0000000000400cc0 <strcpy@plt>:
  400cc0:	ff 25 72 43 20 00    	jmp    *0x204372(%rip)        # 605038 <strcpy@GLIBC_2.2.5>
  400cc6:	68 04 00 00 00       	push   $0x4
  400ccb:	e9 a0 ff ff ff       	jmp    400c70 <.plt>

0000000000400cd0 <puts@plt>:
  400cd0:	ff 25 6a 43 20 00    	jmp    *0x20436a(%rip)        # 605040 <puts@GLIBC_2.2.5>
  400cd6:	68 05 00 00 00       	push   $0x5
  400cdb:	e9 90 ff ff ff       	jmp    400c70 <.plt>

0000000000400ce0 <write@plt>:
  400ce0:	ff 25 62 43 20 00    	jmp    *0x204362(%rip)        # 605048 <write@GLIBC_2.2.5>
  400ce6:	68 06 00 00 00       	push   $0x6
  400ceb:	e9 80 ff ff ff       	jmp    400c70 <.plt>

0000000000400cf0 <mmap@plt>:
  400cf0:	ff 25 5a 43 20 00    	jmp    *0x20435a(%rip)        # 605050 <mmap@GLIBC_2.2.5>
  400cf6:	68 07 00 00 00       	push   $0x7
  400cfb:	e9 70 ff ff ff       	jmp    400c70 <.plt>

0000000000400d00 <printf@plt>:
  400d00:	ff 25 52 43 20 00    	jmp    *0x204352(%rip)        # 605058 <printf@GLIBC_2.2.5>
  400d06:	68 08 00 00 00       	push   $0x8
  400d0b:	e9 60 ff ff ff       	jmp    400c70 <.plt>

0000000000400d10 <memset@plt>:
  400d10:	ff 25 4a 43 20 00    	jmp    *0x20434a(%rip)        # 605060 <memset@GLIBC_2.2.5>
  400d16:	68 09 00 00 00       	push   $0x9
  400d1b:	e9 50 ff ff ff       	jmp    400c70 <.plt>

0000000000400d20 <alarm@plt>:
  400d20:	ff 25 42 43 20 00    	jmp    *0x204342(%rip)        # 605068 <alarm@GLIBC_2.2.5>
  400d26:	68 0a 00 00 00       	push   $0xa
  400d2b:	e9 40 ff ff ff       	jmp    400c70 <.plt>

0000000000400d30 <close@plt>:
  400d30:	ff 25 3a 43 20 00    	jmp    *0x20433a(%rip)        # 605070 <close@GLIBC_2.2.5>
  400d36:	68 0b 00 00 00       	push   $0xb
  400d3b:	e9 30 ff ff ff       	jmp    400c70 <.plt>

0000000000400d40 <read@plt>:
  400d40:	ff 25 32 43 20 00    	jmp    *0x204332(%rip)        # 605078 <read@GLIBC_2.2.5>
  400d46:	68 0c 00 00 00       	push   $0xc
  400d4b:	e9 20 ff ff ff       	jmp    400c70 <.plt>

0000000000400d50 <signal@plt>:
  400d50:	ff 25 2a 43 20 00    	jmp    *0x20432a(%rip)        # 605080 <signal@GLIBC_2.2.5>
  400d56:	68 0d 00 00 00       	push   $0xd
  400d5b:	e9 10 ff ff ff       	jmp    400c70 <.plt>

0000000000400d60 <gethostbyname@plt>:
  400d60:	ff 25 22 43 20 00    	jmp    *0x204322(%rip)        # 605088 <gethostbyname@GLIBC_2.2.5>
  400d66:	68 0e 00 00 00       	push   $0xe
  400d6b:	e9 00 ff ff ff       	jmp    400c70 <.plt>

0000000000400d70 <fprintf@plt>:
  400d70:	ff 25 1a 43 20 00    	jmp    *0x20431a(%rip)        # 605090 <fprintf@GLIBC_2.2.5>
  400d76:	68 0f 00 00 00       	push   $0xf
  400d7b:	e9 f0 fe ff ff       	jmp    400c70 <.plt>

0000000000400d80 <strtol@plt>:
  400d80:	ff 25 12 43 20 00    	jmp    *0x204312(%rip)        # 605098 <strtol@GLIBC_2.2.5>
  400d86:	68 10 00 00 00       	push   $0x10
  400d8b:	e9 e0 fe ff ff       	jmp    400c70 <.plt>

0000000000400d90 <memcpy@plt>:
  400d90:	ff 25 0a 43 20 00    	jmp    *0x20430a(%rip)        # 6050a0 <memcpy@GLIBC_2.14>
  400d96:	68 11 00 00 00       	push   $0x11
  400d9b:	e9 d0 fe ff ff       	jmp    400c70 <.plt>

0000000000400da0 <time@plt>:
  400da0:	ff 25 02 43 20 00    	jmp    *0x204302(%rip)        # 6050a8 <time@GLIBC_2.2.5>
  400da6:	68 12 00 00 00       	push   $0x12
  400dab:	e9 c0 fe ff ff       	jmp    400c70 <.plt>

0000000000400db0 <random@plt>:
  400db0:	ff 25 fa 42 20 00    	jmp    *0x2042fa(%rip)        # 6050b0 <random@GLIBC_2.2.5>
  400db6:	68 13 00 00 00       	push   $0x13
  400dbb:	e9 b0 fe ff ff       	jmp    400c70 <.plt>

0000000000400dc0 <__isoc99_sscanf@plt>:
  400dc0:	ff 25 f2 42 20 00    	jmp    *0x2042f2(%rip)        # 6050b8 <__isoc99_sscanf@GLIBC_2.7>
  400dc6:	68 14 00 00 00       	push   $0x14
  400dcb:	e9 a0 fe ff ff       	jmp    400c70 <.plt>

0000000000400dd0 <munmap@plt>:
  400dd0:	ff 25 ea 42 20 00    	jmp    *0x2042ea(%rip)        # 6050c0 <munmap@GLIBC_2.2.5>
  400dd6:	68 15 00 00 00       	push   $0x15
  400ddb:	e9 90 fe ff ff       	jmp    400c70 <.plt>

0000000000400de0 <memmove@plt>:
  400de0:	ff 25 e2 42 20 00    	jmp    *0x2042e2(%rip)        # 6050c8 <memmove@GLIBC_2.2.5>
  400de6:	68 16 00 00 00       	push   $0x16
  400deb:	e9 80 fe ff ff       	jmp    400c70 <.plt>

0000000000400df0 <fopen@plt>:
  400df0:	ff 25 da 42 20 00    	jmp    *0x2042da(%rip)        # 6050d0 <fopen@GLIBC_2.2.5>
  400df6:	68 17 00 00 00       	push   $0x17
  400dfb:	e9 70 fe ff ff       	jmp    400c70 <.plt>

0000000000400e00 <getopt@plt>:
  400e00:	ff 25 d2 42 20 00    	jmp    *0x2042d2(%rip)        # 6050d8 <getopt@GLIBC_2.2.5>
  400e06:	68 18 00 00 00       	push   $0x18
  400e0b:	e9 60 fe ff ff       	jmp    400c70 <.plt>

0000000000400e10 <strtoul@plt>:
  400e10:	ff 25 ca 42 20 00    	jmp    *0x2042ca(%rip)        # 6050e0 <strtoul@GLIBC_2.2.5>
  400e16:	68 19 00 00 00       	push   $0x19
  400e1b:	e9 50 fe ff ff       	jmp    400c70 <.plt>

0000000000400e20 <gethostname@plt>:
  400e20:	ff 25 c2 42 20 00    	jmp    *0x2042c2(%rip)        # 6050e8 <gethostname@GLIBC_2.2.5>
  400e26:	68 1a 00 00 00       	push   $0x1a
  400e2b:	e9 40 fe ff ff       	jmp    400c70 <.plt>

0000000000400e30 <sprintf@plt>:
  400e30:	ff 25 ba 42 20 00    	jmp    *0x2042ba(%rip)        # 6050f0 <sprintf@GLIBC_2.2.5>
  400e36:	68 1b 00 00 00       	push   $0x1b
  400e3b:	e9 30 fe ff ff       	jmp    400c70 <.plt>

0000000000400e40 <exit@plt>:
  400e40:	ff 25 b2 42 20 00    	jmp    *0x2042b2(%rip)        # 6050f8 <exit@GLIBC_2.2.5>
  400e46:	68 1c 00 00 00       	push   $0x1c
  400e4b:	e9 20 fe ff ff       	jmp    400c70 <.plt>

0000000000400e50 <connect@plt>:
  400e50:	ff 25 aa 42 20 00    	jmp    *0x2042aa(%rip)        # 605100 <connect@GLIBC_2.2.5>
  400e56:	68 1d 00 00 00       	push   $0x1d
  400e5b:	e9 10 fe ff ff       	jmp    400c70 <.plt>

0000000000400e60 <getc@plt>:
  400e60:	ff 25 a2 42 20 00    	jmp    *0x2042a2(%rip)        # 605108 <getc@GLIBC_2.2.5>
  400e66:	68 1e 00 00 00       	push   $0x1e
  400e6b:	e9 00 fe ff ff       	jmp    400c70 <.plt>

0000000000400e70 <socket@plt>:
  400e70:	ff 25 9a 42 20 00    	jmp    *0x20429a(%rip)        # 605110 <socket@GLIBC_2.2.5>
  400e76:	68 1f 00 00 00       	push   $0x1f
  400e7b:	e9 f0 fd ff ff       	jmp    400c70 <.plt>

Disassembly of section .text:

0000000000400e80 <_start>:
  400e80:	f3 0f 1e fa          	endbr64
  400e84:	31 ed                	xor    %ebp,%ebp
  400e86:	49 89 d1             	mov    %rdx,%r9
  400e89:	5e                   	pop    %rsi
  400e8a:	48 89 e2             	mov    %rsp,%rdx
  400e8d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400e91:	50                   	push   %rax
  400e92:	54                   	push   %rsp
  400e93:	49 c7 c0 e0 2c 40 00 	mov    $0x402ce0,%r8
  400e9a:	48 c7 c1 70 2c 40 00 	mov    $0x402c70,%rcx
  400ea1:	48 c7 c7 2f 11 40 00 	mov    $0x40112f,%rdi
  400ea8:	ff 15 3a 41 20 00    	call   *0x20413a(%rip)        # 604fe8 <__libc_start_main@GLIBC_2.2.5>
  400eae:	f4                   	hlt

0000000000400eaf <.annobin_init.c>:
  400eaf:	90                   	nop

0000000000400eb0 <_dl_relocate_static_pie>:
  400eb0:	f3 0f 1e fa          	endbr64
  400eb4:	c3                   	ret

0000000000400eb5 <.annobin__dl_relocate_static_pie.end>:
  400eb5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  400ebc:	00 00 00 
  400ebf:	90                   	nop

0000000000400ec0 <deregister_tm_clones>:
  400ec0:	48 8d 3d c9 45 20 00 	lea    0x2045c9(%rip),%rdi        # 605490 <__TMC_END__>
  400ec7:	48 8d 05 c2 45 20 00 	lea    0x2045c2(%rip),%rax        # 605490 <__TMC_END__>
  400ece:	48 39 f8             	cmp    %rdi,%rax
  400ed1:	74 15                	je     400ee8 <deregister_tm_clones+0x28>
  400ed3:	48 8b 05 06 41 20 00 	mov    0x204106(%rip),%rax        # 604fe0 <_ITM_deregisterTMCloneTable@Base>
  400eda:	48 85 c0             	test   %rax,%rax
  400edd:	74 09                	je     400ee8 <deregister_tm_clones+0x28>
  400edf:	ff e0                	jmp    *%rax
  400ee1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400ee8:	c3                   	ret
  400ee9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400ef0 <register_tm_clones>:
  400ef0:	48 8d 3d 99 45 20 00 	lea    0x204599(%rip),%rdi        # 605490 <__TMC_END__>
  400ef7:	48 8d 35 92 45 20 00 	lea    0x204592(%rip),%rsi        # 605490 <__TMC_END__>
  400efe:	48 29 fe             	sub    %rdi,%rsi
  400f01:	48 c1 fe 03          	sar    $0x3,%rsi
  400f05:	48 89 f0             	mov    %rsi,%rax
  400f08:	48 c1 e8 3f          	shr    $0x3f,%rax
  400f0c:	48 01 c6             	add    %rax,%rsi
  400f0f:	48 d1 fe             	sar    $1,%rsi
  400f12:	74 14                	je     400f28 <register_tm_clones+0x38>
  400f14:	48 8b 05 dd 40 20 00 	mov    0x2040dd(%rip),%rax        # 604ff8 <_ITM_registerTMCloneTable@Base>
  400f1b:	48 85 c0             	test   %rax,%rax
  400f1e:	74 08                	je     400f28 <register_tm_clones+0x38>
  400f20:	ff e0                	jmp    *%rax
  400f22:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400f28:	c3                   	ret
  400f29:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f30 <__do_global_dtors_aux>:
  400f30:	f3 0f 1e fa          	endbr64
  400f34:	80 3d 8d 45 20 00 00 	cmpb   $0x0,0x20458d(%rip)        # 6054c8 <completed.7315>
  400f3b:	75 13                	jne    400f50 <__do_global_dtors_aux+0x20>
  400f3d:	55                   	push   %rbp
  400f3e:	48 89 e5             	mov    %rsp,%rbp
  400f41:	e8 7a ff ff ff       	call   400ec0 <deregister_tm_clones>
  400f46:	c6 05 7b 45 20 00 01 	movb   $0x1,0x20457b(%rip)        # 6054c8 <completed.7315>
  400f4d:	5d                   	pop    %rbp
  400f4e:	c3                   	ret
  400f4f:	90                   	nop
  400f50:	c3                   	ret
  400f51:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  400f58:	00 00 00 00 
  400f5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f60 <frame_dummy>:
  400f60:	f3 0f 1e fa          	endbr64
  400f64:	eb 8a                	jmp    400ef0 <register_tm_clones>

0000000000400f66 <usage>:
  400f66:	48 83 ec 08          	sub    $0x8,%rsp
  400f6a:	48 89 fe             	mov    %rdi,%rsi
  400f6d:	83 3d 94 45 20 00 00 	cmpl   $0x0,0x204594(%rip)        # 605508 <is_checker>
  400f74:	74 41                	je     400fb7 <usage+0x51>
  400f76:	bf 10 2d 40 00       	mov    $0x402d10,%edi
  400f7b:	b8 00 00 00 00       	mov    $0x0,%eax
  400f80:	e8 7b fd ff ff       	call   400d00 <printf@plt>
  400f85:	bf 48 2d 40 00       	mov    $0x402d48,%edi
  400f8a:	e8 41 fd ff ff       	call   400cd0 <puts@plt>
  400f8f:	bf c0 2e 40 00       	mov    $0x402ec0,%edi
  400f94:	e8 37 fd ff ff       	call   400cd0 <puts@plt>
  400f99:	bf 70 2d 40 00       	mov    $0x402d70,%edi
  400f9e:	e8 2d fd ff ff       	call   400cd0 <puts@plt>
  400fa3:	bf da 2e 40 00       	mov    $0x402eda,%edi
  400fa8:	e8 23 fd ff ff       	call   400cd0 <puts@plt>
  400fad:	bf 00 00 00 00       	mov    $0x0,%edi
  400fb2:	e8 89 fe ff ff       	call   400e40 <exit@plt>
  400fb7:	bf f6 2e 40 00       	mov    $0x402ef6,%edi
  400fbc:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc1:	e8 3a fd ff ff       	call   400d00 <printf@plt>
  400fc6:	bf 98 2d 40 00       	mov    $0x402d98,%edi
  400fcb:	e8 00 fd ff ff       	call   400cd0 <puts@plt>
  400fd0:	bf c0 2d 40 00       	mov    $0x402dc0,%edi
  400fd5:	e8 f6 fc ff ff       	call   400cd0 <puts@plt>
  400fda:	bf 14 2f 40 00       	mov    $0x402f14,%edi
  400fdf:	e8 ec fc ff ff       	call   400cd0 <puts@plt>
  400fe4:	eb c7                	jmp    400fad <usage+0x47>

0000000000400fe6 <initialize_target>:
  400fe6:	55                   	push   %rbp
  400fe7:	53                   	push   %rbx
  400fe8:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400fef:	89 f5                	mov    %esi,%ebp
  400ff1:	89 3d 01 45 20 00    	mov    %edi,0x204501(%rip)        # 6054f8 <check_level>
  400ff7:	8b 3d 4b 41 20 00    	mov    0x20414b(%rip),%edi        # 605148 <target_id>
  400ffd:	e8 42 1c 00 00       	call   402c44 <gencookie>
  401002:	89 05 fc 44 20 00    	mov    %eax,0x2044fc(%rip)        # 605504 <cookie>
  401008:	89 c7                	mov    %eax,%edi
  40100a:	e8 35 1c 00 00       	call   402c44 <gencookie>
  40100f:	89 05 eb 44 20 00    	mov    %eax,0x2044eb(%rip)        # 605500 <authkey>
  401015:	8b 05 2d 41 20 00    	mov    0x20412d(%rip),%eax        # 605148 <target_id>
  40101b:	8d 78 01             	lea    0x1(%rax),%edi
  40101e:	e8 7d fc ff ff       	call   400ca0 <srandom@plt>
  401023:	e8 88 fd ff ff       	call   400db0 <random@plt>
  401028:	89 c7                	mov    %eax,%edi
  40102a:	e8 b8 02 00 00       	call   4012e7 <scramble>
  40102f:	89 c3                	mov    %eax,%ebx
  401031:	85 ed                	test   %ebp,%ebp
  401033:	75 3d                	jne    401072 <initialize_target+0x8c>
  401035:	b8 00 00 00 00       	mov    $0x0,%eax
  40103a:	01 d8                	add    %ebx,%eax
  40103c:	0f b7 c0             	movzwl %ax,%eax
  40103f:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  401046:	89 c0                	mov    %eax,%eax
  401048:	48 89 05 31 44 20 00 	mov    %rax,0x204431(%rip)        # 605480 <buf_offset>
  40104f:	c6 05 d2 50 20 00 72 	movb   $0x72,0x2050d2(%rip)        # 606128 <target_prefix>
  401056:	83 3d 2b 44 20 00 00 	cmpl   $0x0,0x20442b(%rip)        # 605488 <notify>
  40105d:	74 09                	je     401068 <initialize_target+0x82>
  40105f:	83 3d a2 44 20 00 00 	cmpl   $0x0,0x2044a2(%rip)        # 605508 <is_checker>
  401066:	74 22                	je     40108a <initialize_target+0xa4>
  401068:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  40106f:	5b                   	pop    %rbx
  401070:	5d                   	pop    %rbp
  401071:	c3                   	ret
  401072:	bf 00 00 00 00       	mov    $0x0,%edi
  401077:	e8 24 fd ff ff       	call   400da0 <time@plt>
  40107c:	89 c7                	mov    %eax,%edi
  40107e:	e8 1d fc ff ff       	call   400ca0 <srandom@plt>
  401083:	e8 28 fd ff ff       	call   400db0 <random@plt>
  401088:	eb b0                	jmp    40103a <initialize_target+0x54>
  40108a:	be 00 01 00 00       	mov    $0x100,%esi
  40108f:	48 89 e7             	mov    %rsp,%rdi
  401092:	e8 89 fd ff ff       	call   400e20 <gethostname@plt>
  401097:	89 c5                	mov    %eax,%ebp
  401099:	85 c0                	test   %eax,%eax
  40109b:	75 23                	jne    4010c0 <initialize_target+0xda>
  40109d:	89 c3                	mov    %eax,%ebx
  40109f:	48 63 c3             	movslq %ebx,%rax
  4010a2:	48 8b 3c c5 60 51 60 	mov    0x605160(,%rax,8),%rdi
  4010a9:	00 
  4010aa:	48 85 ff             	test   %rdi,%rdi
  4010ad:	74 2a                	je     4010d9 <initialize_target+0xf3>
  4010af:	48 89 e6             	mov    %rsp,%rsi
  4010b2:	e8 c9 fb ff ff       	call   400c80 <strcasecmp@plt>
  4010b7:	85 c0                	test   %eax,%eax
  4010b9:	74 19                	je     4010d4 <initialize_target+0xee>
  4010bb:	83 c3 01             	add    $0x1,%ebx
  4010be:	eb df                	jmp    40109f <initialize_target+0xb9>
  4010c0:	bf f0 2d 40 00       	mov    $0x402df0,%edi
  4010c5:	e8 06 fc ff ff       	call   400cd0 <puts@plt>
  4010ca:	bf 08 00 00 00       	mov    $0x8,%edi
  4010cf:	e8 6c fd ff ff       	call   400e40 <exit@plt>
  4010d4:	bd 01 00 00 00       	mov    $0x1,%ebp
  4010d9:	85 ed                	test   %ebp,%ebp
  4010db:	74 36                	je     401113 <initialize_target+0x12d>
  4010dd:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4010e4:	00 
  4010e5:	e8 e4 18 00 00       	call   4029ce <init_driver>
  4010ea:	85 c0                	test   %eax,%eax
  4010ec:	0f 89 76 ff ff ff    	jns    401068 <initialize_target+0x82>
  4010f2:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4010f9:	00 
  4010fa:	bf 68 2e 40 00       	mov    $0x402e68,%edi
  4010ff:	b8 00 00 00 00       	mov    $0x0,%eax
  401104:	e8 f7 fb ff ff       	call   400d00 <printf@plt>
  401109:	bf 08 00 00 00       	mov    $0x8,%edi
  40110e:	e8 2d fd ff ff       	call   400e40 <exit@plt>
  401113:	48 89 e6             	mov    %rsp,%rsi
  401116:	bf 28 2e 40 00       	mov    $0x402e28,%edi
  40111b:	b8 00 00 00 00       	mov    $0x0,%eax
  401120:	e8 db fb ff ff       	call   400d00 <printf@plt>
  401125:	bf 08 00 00 00       	mov    $0x8,%edi
  40112a:	e8 11 fd ff ff       	call   400e40 <exit@plt>

000000000040112f <main>:
  40112f:	41 56                	push   %r14
  401131:	41 55                	push   %r13
  401133:	41 54                	push   %r12
  401135:	55                   	push   %rbp
  401136:	53                   	push   %rbx
  401137:	89 fd                	mov    %edi,%ebp
  401139:	48 89 f3             	mov    %rsi,%rbx
  40113c:	be d3 1d 40 00       	mov    $0x401dd3,%esi
  401141:	bf 0b 00 00 00       	mov    $0xb,%edi
  401146:	e8 05 fc ff ff       	call   400d50 <signal@plt>
  40114b:	be 85 1d 40 00       	mov    $0x401d85,%esi
  401150:	bf 07 00 00 00       	mov    $0x7,%edi
  401155:	e8 f6 fb ff ff       	call   400d50 <signal@plt>
  40115a:	be 21 1e 40 00       	mov    $0x401e21,%esi
  40115f:	bf 04 00 00 00       	mov    $0x4,%edi
  401164:	e8 e7 fb ff ff       	call   400d50 <signal@plt>
  401169:	83 3d 98 43 20 00 00 	cmpl   $0x0,0x204398(%rip)        # 605508 <is_checker>
  401170:	75 25                	jne    401197 <main+0x68>
  401172:	41 bc 2d 2f 40 00    	mov    $0x402f2d,%r12d
  401178:	48 8b 05 21 43 20 00 	mov    0x204321(%rip),%rax        # 6054a0 <stdin@GLIBC_2.2.5>
  40117f:	48 89 05 6a 43 20 00 	mov    %rax,0x20436a(%rip)        # 6054f0 <infile>
  401186:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40118c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401192:	e9 81 00 00 00       	jmp    401218 <main+0xe9>
  401197:	be 6f 1e 40 00       	mov    $0x401e6f,%esi
  40119c:	bf 0e 00 00 00       	mov    $0xe,%edi
  4011a1:	e8 aa fb ff ff       	call   400d50 <signal@plt>
  4011a6:	bf 05 00 00 00       	mov    $0x5,%edi
  4011ab:	e8 70 fb ff ff       	call   400d20 <alarm@plt>
  4011b0:	41 bc 32 2f 40 00    	mov    $0x402f32,%r12d
  4011b6:	eb c0                	jmp    401178 <main+0x49>
  4011b8:	48 8b 3b             	mov    (%rbx),%rdi
  4011bb:	e8 a6 fd ff ff       	call   400f66 <usage>
  4011c0:	be e5 31 40 00       	mov    $0x4031e5,%esi
  4011c5:	48 8b 3d dc 42 20 00 	mov    0x2042dc(%rip),%rdi        # 6054a8 <optarg@GLIBC_2.2.5>
  4011cc:	e8 1f fc ff ff       	call   400df0 <fopen@plt>
  4011d1:	48 89 05 18 43 20 00 	mov    %rax,0x204318(%rip)        # 6054f0 <infile>
  4011d8:	48 85 c0             	test   %rax,%rax
  4011db:	75 3b                	jne    401218 <main+0xe9>
  4011dd:	48 8b 15 c4 42 20 00 	mov    0x2042c4(%rip),%rdx        # 6054a8 <optarg@GLIBC_2.2.5>
  4011e4:	be 3a 2f 40 00       	mov    $0x402f3a,%esi
  4011e9:	48 8b 3d d0 42 20 00 	mov    0x2042d0(%rip),%rdi        # 6054c0 <stderr@GLIBC_2.2.5>
  4011f0:	e8 7b fb ff ff       	call   400d70 <fprintf@plt>
  4011f5:	b8 01 00 00 00       	mov    $0x1,%eax
  4011fa:	e9 c1 00 00 00       	jmp    4012c0 <main+0x191>
  4011ff:	ba 10 00 00 00       	mov    $0x10,%edx
  401204:	be 00 00 00 00       	mov    $0x0,%esi
  401209:	48 8b 3d 98 42 20 00 	mov    0x204298(%rip),%rdi        # 6054a8 <optarg@GLIBC_2.2.5>
  401210:	e8 fb fb ff ff       	call   400e10 <strtoul@plt>
  401215:	41 89 c6             	mov    %eax,%r14d
  401218:	4c 89 e2             	mov    %r12,%rdx
  40121b:	48 89 de             	mov    %rbx,%rsi
  40121e:	89 ef                	mov    %ebp,%edi
  401220:	e8 db fb ff ff       	call   400e00 <getopt@plt>
  401225:	3c ff                	cmp    $0xff,%al
  401227:	74 52                	je     40127b <main+0x14c>
  401229:	0f be f0             	movsbl %al,%esi
  40122c:	83 e8 61             	sub    $0x61,%eax
  40122f:	3c 10                	cmp    $0x10,%al
  401231:	77 31                	ja     401264 <main+0x135>
  401233:	0f b6 c0             	movzbl %al,%eax
  401236:	ff 24 c5 78 2f 40 00 	jmp    *0x402f78(,%rax,8)
  40123d:	ba 0a 00 00 00       	mov    $0xa,%edx
  401242:	be 00 00 00 00       	mov    $0x0,%esi
  401247:	48 8b 3d 5a 42 20 00 	mov    0x20425a(%rip),%rdi        # 6054a8 <optarg@GLIBC_2.2.5>
  40124e:	e8 2d fb ff ff       	call   400d80 <strtol@plt>
  401253:	41 89 c5             	mov    %eax,%r13d
  401256:	eb c0                	jmp    401218 <main+0xe9>
  401258:	c7 05 26 42 20 00 00 	movl   $0x0,0x204226(%rip)        # 605488 <notify>
  40125f:	00 00 00 
  401262:	eb b4                	jmp    401218 <main+0xe9>
  401264:	bf 57 2f 40 00       	mov    $0x402f57,%edi
  401269:	b8 00 00 00 00       	mov    $0x0,%eax
  40126e:	e8 8d fa ff ff       	call   400d00 <printf@plt>
  401273:	48 8b 3b             	mov    (%rbx),%rdi
  401276:	e8 eb fc ff ff       	call   400f66 <usage>
  40127b:	be 01 00 00 00       	mov    $0x1,%esi
  401280:	44 89 ef             	mov    %r13d,%edi
  401283:	e8 5e fd ff ff       	call   400fe6 <initialize_target>
  401288:	83 3d 79 42 20 00 00 	cmpl   $0x0,0x204279(%rip)        # 605508 <is_checker>
  40128f:	74 09                	je     40129a <main+0x16b>
  401291:	44 39 35 68 42 20 00 	cmp    %r14d,0x204268(%rip)        # 605500 <authkey>
  401298:	75 2f                	jne    4012c9 <main+0x19a>
  40129a:	8b 35 64 42 20 00    	mov    0x204264(%rip),%esi        # 605504 <cookie>
  4012a0:	bf 6a 2f 40 00       	mov    $0x402f6a,%edi
  4012a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4012aa:	e8 51 fa ff ff       	call   400d00 <printf@plt>
  4012af:	48 8b 3d ca 41 20 00 	mov    0x2041ca(%rip),%rdi        # 605480 <buf_offset>
  4012b6:	e8 02 0c 00 00       	call   401ebd <launch>
  4012bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c0:	5b                   	pop    %rbx
  4012c1:	5d                   	pop    %rbp
  4012c2:	41 5c                	pop    %r12
  4012c4:	41 5d                	pop    %r13
  4012c6:	41 5e                	pop    %r14
  4012c8:	c3                   	ret
  4012c9:	44 89 f6             	mov    %r14d,%esi
  4012cc:	bf 90 2e 40 00       	mov    $0x402e90,%edi
  4012d1:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d6:	e8 25 fa ff ff       	call   400d00 <printf@plt>
  4012db:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e0:	e8 a4 07 00 00       	call   401a89 <check_fail>
  4012e5:	eb b3                	jmp    40129a <main+0x16b>

00000000004012e7 <scramble>:
  4012e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ec:	83 f8 09             	cmp    $0x9,%eax
  4012ef:	77 13                	ja     401304 <scramble+0x1d>
  4012f1:	69 d0 8e 49 00 00    	imul   $0x498e,%eax,%edx
  4012f7:	01 fa                	add    %edi,%edx
  4012f9:	89 c1                	mov    %eax,%ecx
  4012fb:	89 54 8c d0          	mov    %edx,-0x30(%rsp,%rcx,4)
  4012ff:	83 c0 01             	add    $0x1,%eax
  401302:	eb e8                	jmp    4012ec <scramble+0x5>
  401304:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401308:	69 c0 d8 04 00 00    	imul   $0x4d8,%eax,%eax
  40130e:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401312:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401316:	69 c0 a3 32 00 00    	imul   $0x32a3,%eax,%eax
  40131c:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401320:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401324:	69 c0 26 4d 00 00    	imul   $0x4d26,%eax,%eax
  40132a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40132e:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401332:	69 c0 cf c5 00 00    	imul   $0xc5cf,%eax,%eax
  401338:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40133c:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401340:	69 c0 d8 d6 00 00    	imul   $0xd6d8,%eax,%eax
  401346:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40134a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40134e:	69 c0 ac 98 00 00    	imul   $0x98ac,%eax,%eax
  401354:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401358:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40135c:	69 c0 4d b3 00 00    	imul   $0xb34d,%eax,%eax
  401362:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401366:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40136a:	69 c0 81 ac 00 00    	imul   $0xac81,%eax,%eax
  401370:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401374:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401378:	69 c0 6f 92 00 00    	imul   $0x926f,%eax,%eax
  40137e:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401382:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401386:	69 c0 ff 96 00 00    	imul   $0x96ff,%eax,%eax
  40138c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401390:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401394:	69 c0 e2 28 00 00    	imul   $0x28e2,%eax,%eax
  40139a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40139e:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4013a2:	69 c0 e8 35 00 00    	imul   $0x35e8,%eax,%eax
  4013a8:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4013ac:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4013b0:	69 c0 8c 76 00 00    	imul   $0x768c,%eax,%eax
  4013b6:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4013ba:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4013be:	69 c0 96 b4 00 00    	imul   $0xb496,%eax,%eax
  4013c4:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4013c8:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013cc:	69 c0 b7 8e 00 00    	imul   $0x8eb7,%eax,%eax
  4013d2:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013d6:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4013da:	69 c0 e5 ff 00 00    	imul   $0xffe5,%eax,%eax
  4013e0:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4013e4:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4013e8:	69 c0 74 c2 00 00    	imul   $0xc274,%eax,%eax
  4013ee:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4013f2:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4013f6:	69 c0 04 7e 00 00    	imul   $0x7e04,%eax,%eax
  4013fc:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401400:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401404:	69 c0 4b ed 00 00    	imul   $0xed4b,%eax,%eax
  40140a:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40140e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401412:	69 c0 15 bf 00 00    	imul   $0xbf15,%eax,%eax
  401418:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40141c:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401420:	69 c0 c2 83 00 00    	imul   $0x83c2,%eax,%eax
  401426:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40142a:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40142e:	6b c0 42             	imul   $0x42,%eax,%eax
  401431:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401435:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401439:	69 c0 6e d8 00 00    	imul   $0xd86e,%eax,%eax
  40143f:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401443:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401447:	69 c0 7d df 00 00    	imul   $0xdf7d,%eax,%eax
  40144d:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401451:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401455:	69 c0 fd 3d 00 00    	imul   $0x3dfd,%eax,%eax
  40145b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40145f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401463:	69 c0 af 1c 00 00    	imul   $0x1caf,%eax,%eax
  401469:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40146d:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401471:	69 c0 ce fc 00 00    	imul   $0xfcce,%eax,%eax
  401477:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40147b:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40147f:	69 c0 fc 86 00 00    	imul   $0x86fc,%eax,%eax
  401485:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401489:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40148d:	69 c0 e7 95 00 00    	imul   $0x95e7,%eax,%eax
  401493:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401497:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40149b:	69 c0 b1 29 00 00    	imul   $0x29b1,%eax,%eax
  4014a1:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4014a5:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4014a9:	69 c0 de 61 00 00    	imul   $0x61de,%eax,%eax
  4014af:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4014b3:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014b7:	69 c0 2e b8 00 00    	imul   $0xb82e,%eax,%eax
  4014bd:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014c1:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014c5:	69 c0 1f 5c 00 00    	imul   $0x5c1f,%eax,%eax
  4014cb:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014cf:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4014d3:	69 c0 ed 33 00 00    	imul   $0x33ed,%eax,%eax
  4014d9:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4014dd:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4014e1:	69 c0 06 7a 00 00    	imul   $0x7a06,%eax,%eax
  4014e7:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4014eb:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014ef:	69 c0 8e 0d 00 00    	imul   $0xd8e,%eax,%eax
  4014f5:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014f9:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014fd:	69 c0 c5 4a 00 00    	imul   $0x4ac5,%eax,%eax
  401503:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401507:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40150b:	69 c0 d7 34 00 00    	imul   $0x34d7,%eax,%eax
  401511:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401515:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401519:	69 c0 93 ba 00 00    	imul   $0xba93,%eax,%eax
  40151f:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401523:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401527:	69 c0 11 8e 00 00    	imul   $0x8e11,%eax,%eax
  40152d:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401531:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401535:	69 c0 d2 8a 00 00    	imul   $0x8ad2,%eax,%eax
  40153b:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40153f:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401543:	69 c0 70 5f 00 00    	imul   $0x5f70,%eax,%eax
  401549:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40154d:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401551:	69 c0 58 fd 00 00    	imul   $0xfd58,%eax,%eax
  401557:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40155b:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40155f:	69 c0 fa fa 00 00    	imul   $0xfafa,%eax,%eax
  401565:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401569:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40156d:	69 c0 ff 21 00 00    	imul   $0x21ff,%eax,%eax
  401573:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401577:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40157b:	69 c0 de b7 00 00    	imul   $0xb7de,%eax,%eax
  401581:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401585:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401589:	69 c0 41 4e 00 00    	imul   $0x4e41,%eax,%eax
  40158f:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401593:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401597:	69 c0 2f a8 00 00    	imul   $0xa82f,%eax,%eax
  40159d:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4015a1:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4015a5:	69 c0 3f a6 00 00    	imul   $0xa63f,%eax,%eax
  4015ab:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4015af:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4015b3:	69 c0 cb f3 00 00    	imul   $0xf3cb,%eax,%eax
  4015b9:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4015bd:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015c1:	69 c0 20 cf 00 00    	imul   $0xcf20,%eax,%eax
  4015c7:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015cb:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015cf:	69 c0 0e 1e 00 00    	imul   $0x1e0e,%eax,%eax
  4015d5:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015d9:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015dd:	69 c0 2a 0f 00 00    	imul   $0xf2a,%eax,%eax
  4015e3:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015e7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4015eb:	69 c0 18 3d 00 00    	imul   $0x3d18,%eax,%eax
  4015f1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4015f5:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4015f9:	69 c0 3a 67 00 00    	imul   $0x673a,%eax,%eax
  4015ff:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401603:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401607:	69 c0 4e c2 00 00    	imul   $0xc24e,%eax,%eax
  40160d:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401611:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401615:	69 c0 eb 75 00 00    	imul   $0x75eb,%eax,%eax
  40161b:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40161f:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401623:	69 c0 ac 79 00 00    	imul   $0x79ac,%eax,%eax
  401629:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40162d:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401631:	69 c0 2a 08 00 00    	imul   $0x82a,%eax,%eax
  401637:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40163b:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40163f:	69 c0 83 06 00 00    	imul   $0x683,%eax,%eax
  401645:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401649:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40164d:	69 c0 51 99 00 00    	imul   $0x9951,%eax,%eax
  401653:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401657:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40165b:	69 c0 06 ae 00 00    	imul   $0xae06,%eax,%eax
  401661:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401665:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401669:	69 c0 6e 2e 00 00    	imul   $0x2e6e,%eax,%eax
  40166f:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401673:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401677:	69 c0 f3 91 00 00    	imul   $0x91f3,%eax,%eax
  40167d:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401681:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401685:	69 c0 53 32 00 00    	imul   $0x3253,%eax,%eax
  40168b:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40168f:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401693:	69 c0 f3 f4 00 00    	imul   $0xf4f3,%eax,%eax
  401699:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40169d:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4016a1:	69 c0 18 87 00 00    	imul   $0x8718,%eax,%eax
  4016a7:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4016ab:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4016af:	69 c0 58 1b 00 00    	imul   $0x1b58,%eax,%eax
  4016b5:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016b9:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4016bd:	69 c0 e6 65 00 00    	imul   $0x65e6,%eax,%eax
  4016c3:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4016c7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4016cb:	69 c0 ff 5f 00 00    	imul   $0x5fff,%eax,%eax
  4016d1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4016d5:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4016d9:	69 c0 9a 23 00 00    	imul   $0x239a,%eax,%eax
  4016df:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4016e3:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4016e7:	69 c0 2d bf 00 00    	imul   $0xbf2d,%eax,%eax
  4016ed:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4016f1:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4016f5:	69 c0 0b 44 00 00    	imul   $0x440b,%eax,%eax
  4016fb:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4016ff:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401703:	69 c0 c9 0c 00 00    	imul   $0xcc9,%eax,%eax
  401709:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40170d:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401711:	69 c0 80 ad 00 00    	imul   $0xad80,%eax,%eax
  401717:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40171b:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40171f:	69 c0 5f 76 00 00    	imul   $0x765f,%eax,%eax
  401725:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401729:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40172d:	69 c0 ae d1 00 00    	imul   $0xd1ae,%eax,%eax
  401733:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401737:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40173b:	69 c0 65 2e 00 00    	imul   $0x2e65,%eax,%eax
  401741:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401745:	ba 00 00 00 00       	mov    $0x0,%edx
  40174a:	b8 00 00 00 00       	mov    $0x0,%eax
  40174f:	83 fa 09             	cmp    $0x9,%edx
  401752:	77 0d                	ja     401761 <scramble+0x47a>
  401754:	89 d1                	mov    %edx,%ecx
  401756:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  40175a:	01 c8                	add    %ecx,%eax
  40175c:	83 c2 01             	add    $0x1,%edx
  40175f:	eb ee                	jmp    40174f <scramble+0x468>
  401761:	c3                   	ret

0000000000401762 <getbuf>:
  401762:	48 83 ec 28          	sub    $0x28,%rsp
  401766:	48 89 e7             	mov    %rsp,%rdi
  401769:	e8 4a 03 00 00       	call   401ab8 <Gets>
  40176e:	b8 01 00 00 00       	mov    $0x1,%eax
  401773:	48 83 c4 28          	add    $0x28,%rsp
  401777:	c3                   	ret

0000000000401778 <touch1>:
  401778:	48 83 ec 08          	sub    $0x8,%rsp
  40177c:	c7 05 76 3d 20 00 01 	movl   $0x1,0x203d76(%rip)        # 6054fc <vlevel>
  401783:	00 00 00 
  401786:	bf 3a 30 40 00       	mov    $0x40303a,%edi
  40178b:	e8 40 f5 ff ff       	call   400cd0 <puts@plt>
  401790:	bf 01 00 00 00       	mov    $0x1,%edi
  401795:	e8 11 05 00 00       	call   401cab <validate>
  40179a:	bf 00 00 00 00       	mov    $0x0,%edi
  40179f:	e8 9c f6 ff ff       	call   400e40 <exit@plt>

00000000004017a4 <touch2>:
  4017a4:	48 83 ec 08          	sub    $0x8,%rsp
  4017a8:	89 fe                	mov    %edi,%esi
  4017aa:	c7 05 48 3d 20 00 02 	movl   $0x2,0x203d48(%rip)        # 6054fc <vlevel>
  4017b1:	00 00 00 
  4017b4:	39 3d 4a 3d 20 00    	cmp    %edi,0x203d4a(%rip)        # 605504 <cookie>
  4017ba:	74 23                	je     4017df <touch2+0x3b>
  4017bc:	bf 88 30 40 00       	mov    $0x403088,%edi
  4017c1:	b8 00 00 00 00       	mov    $0x0,%eax
  4017c6:	e8 35 f5 ff ff       	call   400d00 <printf@plt>
  4017cb:	bf 02 00 00 00       	mov    $0x2,%edi
  4017d0:	e8 88 05 00 00       	call   401d5d <fail>
  4017d5:	bf 00 00 00 00       	mov    $0x0,%edi
  4017da:	e8 61 f6 ff ff       	call   400e40 <exit@plt>
  4017df:	bf 60 30 40 00       	mov    $0x403060,%edi
  4017e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4017e9:	e8 12 f5 ff ff       	call   400d00 <printf@plt>
  4017ee:	bf 02 00 00 00       	mov    $0x2,%edi
  4017f3:	e8 b3 04 00 00       	call   401cab <validate>
  4017f8:	eb db                	jmp    4017d5 <touch2+0x31>

00000000004017fa <hexmatch>:
  4017fa:	41 54                	push   %r12
  4017fc:	55                   	push   %rbp
  4017fd:	53                   	push   %rbx
  4017fe:	48 83 ec 70          	sub    $0x70,%rsp
  401802:	89 fd                	mov    %edi,%ebp
  401804:	48 89 f3             	mov    %rsi,%rbx
  401807:	e8 a4 f5 ff ff       	call   400db0 <random@plt>
  40180c:	48 89 c1             	mov    %rax,%rcx
  40180f:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401816:	0a d7 a3 
  401819:	48 f7 ea             	imul   %rdx
  40181c:	48 01 ca             	add    %rcx,%rdx
  40181f:	48 c1 fa 06          	sar    $0x6,%rdx
  401823:	48 89 c8             	mov    %rcx,%rax
  401826:	48 c1 f8 3f          	sar    $0x3f,%rax
  40182a:	48 29 c2             	sub    %rax,%rdx
  40182d:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401831:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401835:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  40183c:	00 
  40183d:	48 29 c1             	sub    %rax,%rcx
  401840:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401844:	89 ea                	mov    %ebp,%edx
  401846:	be 57 30 40 00       	mov    $0x403057,%esi
  40184b:	4c 89 e7             	mov    %r12,%rdi
  40184e:	b8 00 00 00 00       	mov    $0x0,%eax
  401853:	e8 d8 f5 ff ff       	call   400e30 <sprintf@plt>
  401858:	ba 09 00 00 00       	mov    $0x9,%edx
  40185d:	4c 89 e6             	mov    %r12,%rsi
  401860:	48 89 df             	mov    %rbx,%rdi
  401863:	e8 48 f4 ff ff       	call   400cb0 <strncmp@plt>
  401868:	85 c0                	test   %eax,%eax
  40186a:	0f 94 c0             	sete   %al
  40186d:	0f b6 c0             	movzbl %al,%eax
  401870:	48 83 c4 70          	add    $0x70,%rsp
  401874:	5b                   	pop    %rbx
  401875:	5d                   	pop    %rbp
  401876:	41 5c                	pop    %r12
  401878:	c3                   	ret

0000000000401879 <touch3>:
  401879:	53                   	push   %rbx
  40187a:	48 89 fb             	mov    %rdi,%rbx
  40187d:	c7 05 75 3c 20 00 03 	movl   $0x3,0x203c75(%rip)        # 6054fc <vlevel>
  401884:	00 00 00 
  401887:	48 89 fe             	mov    %rdi,%rsi
  40188a:	8b 3d 74 3c 20 00    	mov    0x203c74(%rip),%edi        # 605504 <cookie>
  401890:	e8 65 ff ff ff       	call   4017fa <hexmatch>
  401895:	85 c0                	test   %eax,%eax
  401897:	74 26                	je     4018bf <touch3+0x46>
  401899:	48 89 de             	mov    %rbx,%rsi
  40189c:	bf b0 30 40 00       	mov    $0x4030b0,%edi
  4018a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a6:	e8 55 f4 ff ff       	call   400d00 <printf@plt>
  4018ab:	bf 03 00 00 00       	mov    $0x3,%edi
  4018b0:	e8 f6 03 00 00       	call   401cab <validate>
  4018b5:	bf 00 00 00 00       	mov    $0x0,%edi
  4018ba:	e8 81 f5 ff ff       	call   400e40 <exit@plt>
  4018bf:	48 89 de             	mov    %rbx,%rsi
  4018c2:	bf d8 30 40 00       	mov    $0x4030d8,%edi
  4018c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4018cc:	e8 2f f4 ff ff       	call   400d00 <printf@plt>
  4018d1:	bf 03 00 00 00       	mov    $0x3,%edi
  4018d6:	e8 82 04 00 00       	call   401d5d <fail>
  4018db:	eb d8                	jmp    4018b5 <touch3+0x3c>

00000000004018dd <test>:
  4018dd:	48 83 ec 08          	sub    $0x8,%rsp
  4018e1:	b8 00 00 00 00       	mov    $0x0,%eax
  4018e6:	e8 77 fe ff ff       	call   401762 <getbuf>
  4018eb:	89 c6                	mov    %eax,%esi
  4018ed:	bf 00 31 40 00       	mov    $0x403100,%edi
  4018f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f7:	e8 04 f4 ff ff       	call   400d00 <printf@plt>
  4018fc:	48 83 c4 08          	add    $0x8,%rsp
  401900:	c3                   	ret

0000000000401901 <start_farm>:
  401901:	b8 01 00 00 00       	mov    $0x1,%eax
  401906:	c3                   	ret

0000000000401907 <addval_353>:
  401907:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  40190d:	c3                   	ret

000000000040190e <getval_426>:
  40190e:	b8 78 90 90 c3       	mov    $0xc3909078,%eax
  401913:	c3                   	ret

0000000000401914 <addval_373>:
  401914:	8d 87 40 89 c7 c3    	lea    -0x3c3876c0(%rdi),%eax
  40191a:	c3                   	ret

000000000040191b <getval_332>:
  40191b:	b8 09 48 89 c7       	mov    $0xc7894809,%eax
  401920:	c3                   	ret

0000000000401921 <addval_188>:
  401921:	8d 87 4c 89 c7 c3    	lea    -0x3c3876b4(%rdi),%eax
  401927:	c3                   	ret

0000000000401928 <addval_484>:
  401928:	8d 87 b0 58 90 c3    	lea    -0x3c6fa750(%rdi),%eax
  40192e:	c3                   	ret

000000000040192f <getval_316>:
  40192f:	b8 69 78 90 c3       	mov    $0xc3907869,%eax
  401934:	c3                   	ret

0000000000401935 <setval_299>:
  401935:	c7 07 58 90 90 90    	movl   $0x90909058,(%rdi)
  40193b:	c3                   	ret

000000000040193c <mid_farm>:
  40193c:	b8 01 00 00 00       	mov    $0x1,%eax
  401941:	c3                   	ret

0000000000401942 <add_xy>:
  401942:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401946:	c3                   	ret

0000000000401947 <addval_409>:
  401947:	8d 87 3d 48 8b e0    	lea    -0x1f74b7c3(%rdi),%eax
  40194d:	c3                   	ret

000000000040194e <addval_344>:
  40194e:	8d 87 47 89 d1 90    	lea    -0x6f2e76b9(%rdi),%eax
  401954:	c3                   	ret

0000000000401955 <setval_273>:
  401955:	c7 07 89 ce 78 c0    	movl   $0xc078ce89,(%rdi)
  40195b:	c3                   	ret

000000000040195c <getval_247>:
  40195c:	b8 88 c2 38 db       	mov    $0xdb38c288,%eax
  401961:	c3                   	ret

0000000000401962 <setval_464>:
  401962:	c7 07 48 88 e0 90    	movl   $0x90e08848,(%rdi)
  401968:	c3                   	ret

0000000000401969 <getval_496>:
  401969:	b8 48 99 e0 c3       	mov    $0xc3e09948,%eax
  40196e:	c3                   	ret

000000000040196f <setval_388>:
  40196f:	c7 07 58 89 e0 c3    	movl   $0xc3e08958,(%rdi)
  401975:	c3                   	ret

0000000000401976 <addval_424>:
  401976:	8d 87 89 ce a4 d2    	lea    -0x2d5b3177(%rdi),%eax
  40197c:	c3                   	ret

000000000040197d <getval_488>:
  40197d:	b8 89 c2 94 c0       	mov    $0xc094c289,%eax
  401982:	c3                   	ret

0000000000401983 <getval_265>:
  401983:	b8 31 09 d1 90       	mov    $0x90d10931,%eax
  401988:	c3                   	ret

0000000000401989 <setval_365>:
  401989:	c7 07 99 d1 38 c9    	movl   $0xc938d199,(%rdi)
  40198f:	c3                   	ret

0000000000401990 <getval_320>:
  401990:	b8 cc 89 c2 92       	mov    $0x92c289cc,%eax
  401995:	c3                   	ret

0000000000401996 <getval_355>:
  401996:	b8 48 89 e0 92       	mov    $0x92e08948,%eax
  40199b:	c3                   	ret

000000000040199c <setval_380>:
  40199c:	c7 07 4c a6 8d ce    	movl   $0xce8da64c,(%rdi)
  4019a2:	c3                   	ret

00000000004019a3 <getval_118>:
  4019a3:	b8 89 ce c4 db       	mov    $0xdbc4ce89,%eax
  4019a8:	c3                   	ret

00000000004019a9 <getval_351>:
  4019a9:	b8 89 c2 20 c0       	mov    $0xc020c289,%eax
  4019ae:	c3                   	ret

00000000004019af <getval_106>:
  4019af:	b8 89 c2 90 c7       	mov    $0xc790c289,%eax
  4019b4:	c3                   	ret

00000000004019b5 <getval_412>:
  4019b5:	b8 89 ce c4 c9       	mov    $0xc9c4ce89,%eax
  4019ba:	c3                   	ret

00000000004019bb <addval_473>:
  4019bb:	8d 87 81 d1 08 c9    	lea    -0x36f72e7f(%rdi),%eax
  4019c1:	c3                   	ret

00000000004019c2 <setval_217>:
  4019c2:	c7 07 89 ce 84 c0    	movl   $0xc084ce89,(%rdi)
  4019c8:	c3                   	ret

00000000004019c9 <setval_437>:
  4019c9:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  4019cf:	c3                   	ret

00000000004019d0 <addval_137>:
  4019d0:	8d 87 89 ce 20 db    	lea    -0x24df3177(%rdi),%eax
  4019d6:	c3                   	ret

00000000004019d7 <getval_446>:
  4019d7:	b8 d0 8d c2 c3       	mov    $0xc3c28dd0,%eax
  4019dc:	c3                   	ret

00000000004019dd <addval_211>:
  4019dd:	8d 87 89 d1 30 c0    	lea    -0x3fcf2e77(%rdi),%eax
  4019e3:	c3                   	ret

00000000004019e4 <setval_311>:
  4019e4:	c7 07 4a 48 89 e0    	movl   $0xe089484a,(%rdi)
  4019ea:	c3                   	ret

00000000004019eb <setval_124>:
  4019eb:	c7 07 89 d1 20 db    	movl   $0xdb20d189,(%rdi)
  4019f1:	c3                   	ret

00000000004019f2 <setval_396>:
  4019f2:	c7 07 88 d1 90 c3    	movl   $0xc390d188,(%rdi)
  4019f8:	c3                   	ret

00000000004019f9 <getval_139>:
  4019f9:	b8 89 d1 28 db       	mov    $0xdb28d189,%eax
  4019fe:	c3                   	ret

00000000004019ff <getval_110>:
  4019ff:	b8 09 c2 08 c9       	mov    $0xc908c209,%eax
  401a04:	c3                   	ret

0000000000401a05 <addval_476>:
  401a05:	8d 87 89 ce 28 d2    	lea    -0x2dd73177(%rdi),%eax
  401a0b:	c3                   	ret

0000000000401a0c <addval_444>:
  401a0c:	8d 87 89 c2 38 db    	lea    -0x24c73d77(%rdi),%eax
  401a12:	c3                   	ret

0000000000401a13 <getval_160>:
  401a13:	b8 48 88 e0 c3       	mov    $0xc3e08848,%eax
  401a18:	c3                   	ret

0000000000401a19 <end_farm>:
  401a19:	b8 01 00 00 00       	mov    $0x1,%eax
  401a1e:	c3                   	ret

0000000000401a1f <save_char>:
  401a1f:	8b 05 ff 46 20 00    	mov    0x2046ff(%rip),%eax        # 606124 <gets_cnt>
  401a25:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401a2a:	7f 49                	jg     401a75 <save_char+0x56>
  401a2c:	89 f9                	mov    %edi,%ecx
  401a2e:	c0 e9 04             	shr    $0x4,%cl
  401a31:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401a34:	83 e1 0f             	and    $0xf,%ecx
  401a37:	0f b6 b1 20 34 40 00 	movzbl 0x403420(%rcx),%esi
  401a3e:	48 63 ca             	movslq %edx,%rcx
  401a41:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  401a48:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401a4b:	83 e7 0f             	and    $0xf,%edi
  401a4e:	0f b6 b7 20 34 40 00 	movzbl 0x403420(%rdi),%esi
  401a55:	48 63 c9             	movslq %ecx,%rcx
  401a58:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  401a5f:	83 c2 02             	add    $0x2,%edx
  401a62:	48 63 d2             	movslq %edx,%rdx
  401a65:	c6 82 20 55 60 00 20 	movb   $0x20,0x605520(%rdx)
  401a6c:	83 c0 01             	add    $0x1,%eax
  401a6f:	89 05 af 46 20 00    	mov    %eax,0x2046af(%rip)        # 606124 <gets_cnt>
  401a75:	c3                   	ret

0000000000401a76 <save_term>:
  401a76:	8b 05 a8 46 20 00    	mov    0x2046a8(%rip),%eax        # 606124 <gets_cnt>
  401a7c:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401a7f:	48 98                	cltq
  401a81:	c6 80 20 55 60 00 00 	movb   $0x0,0x605520(%rax)
  401a88:	c3                   	ret

0000000000401a89 <check_fail>:
  401a89:	48 83 ec 08          	sub    $0x8,%rsp
  401a8d:	0f be 35 94 46 20 00 	movsbl 0x204694(%rip),%esi        # 606128 <target_prefix>
  401a94:	b9 20 55 60 00       	mov    $0x605520,%ecx
  401a99:	8b 15 59 3a 20 00    	mov    0x203a59(%rip),%edx        # 6054f8 <check_level>
  401a9f:	bf 23 31 40 00       	mov    $0x403123,%edi
  401aa4:	b8 00 00 00 00       	mov    $0x0,%eax
  401aa9:	e8 52 f2 ff ff       	call   400d00 <printf@plt>
  401aae:	bf 01 00 00 00       	mov    $0x1,%edi
  401ab3:	e8 88 f3 ff ff       	call   400e40 <exit@plt>

0000000000401ab8 <Gets>:
  401ab8:	41 54                	push   %r12
  401aba:	55                   	push   %rbp
  401abb:	53                   	push   %rbx
  401abc:	49 89 fc             	mov    %rdi,%r12
  401abf:	c7 05 5b 46 20 00 00 	movl   $0x0,0x20465b(%rip)        # 606124 <gets_cnt>
  401ac6:	00 00 00 
  401ac9:	48 89 fb             	mov    %rdi,%rbx
  401acc:	48 8b 3d 1d 3a 20 00 	mov    0x203a1d(%rip),%rdi        # 6054f0 <infile>
  401ad3:	e8 88 f3 ff ff       	call   400e60 <getc@plt>
  401ad8:	83 f8 ff             	cmp    $0xffffffff,%eax
  401adb:	74 18                	je     401af5 <Gets+0x3d>
  401add:	83 f8 0a             	cmp    $0xa,%eax
  401ae0:	74 13                	je     401af5 <Gets+0x3d>
  401ae2:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401ae6:	88 03                	mov    %al,(%rbx)
  401ae8:	0f b6 f8             	movzbl %al,%edi
  401aeb:	e8 2f ff ff ff       	call   401a1f <save_char>
  401af0:	48 89 eb             	mov    %rbp,%rbx
  401af3:	eb d7                	jmp    401acc <Gets+0x14>
  401af5:	c6 03 00             	movb   $0x0,(%rbx)
  401af8:	b8 00 00 00 00       	mov    $0x0,%eax
  401afd:	e8 74 ff ff ff       	call   401a76 <save_term>
  401b02:	4c 89 e0             	mov    %r12,%rax
  401b05:	5b                   	pop    %rbx
  401b06:	5d                   	pop    %rbp
  401b07:	41 5c                	pop    %r12
  401b09:	c3                   	ret

0000000000401b0a <notify_server>:
  401b0a:	83 3d f7 39 20 00 00 	cmpl   $0x0,0x2039f7(%rip)        # 605508 <is_checker>
  401b11:	0f 85 93 01 00 00    	jne    401caa <notify_server+0x1a0>
  401b17:	55                   	push   %rbp
  401b18:	53                   	push   %rbx
  401b19:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  401b20:	89 fb                	mov    %edi,%ebx
  401b22:	81 3d f8 45 20 00 9c 	cmpl   $0x1f9c,0x2045f8(%rip)        # 606124 <gets_cnt>
  401b29:	1f 00 00 
  401b2c:	0f 8f ad 00 00 00    	jg     401bdf <notify_server+0xd5>
  401b32:	44 0f be 0d ee 45 20 	movsbl 0x2045ee(%rip),%r9d        # 606128 <target_prefix>
  401b39:	00 
  401b3a:	83 3d 47 39 20 00 00 	cmpl   $0x0,0x203947(%rip)        # 605488 <notify>
  401b41:	0f 84 b1 00 00 00    	je     401bf8 <notify_server+0xee>
  401b47:	44 8b 05 b2 39 20 00 	mov    0x2039b2(%rip),%r8d        # 605500 <authkey>
  401b4e:	85 db                	test   %ebx,%ebx
  401b50:	0f 84 ad 00 00 00    	je     401c03 <notify_server+0xf9>
  401b56:	bd 39 31 40 00       	mov    $0x403139,%ebp
  401b5b:	68 20 55 60 00       	push   $0x605520
  401b60:	56                   	push   %rsi
  401b61:	48 89 e9             	mov    %rbp,%rcx
  401b64:	8b 15 de 35 20 00    	mov    0x2035de(%rip),%edx        # 605148 <target_id>
  401b6a:	be 43 31 40 00       	mov    $0x403143,%esi
  401b6f:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  401b76:	00 
  401b77:	b8 00 00 00 00       	mov    $0x0,%eax
  401b7c:	e8 af f2 ff ff       	call   400e30 <sprintf@plt>
  401b81:	48 83 c4 10          	add    $0x10,%rsp
  401b85:	83 3d fc 38 20 00 00 	cmpl   $0x0,0x2038fc(%rip)        # 605488 <notify>
  401b8c:	0f 84 ab 00 00 00    	je     401c3d <notify_server+0x133>
  401b92:	85 db                	test   %ebx,%ebx
  401b94:	0f 84 8f 00 00 00    	je     401c29 <notify_server+0x11f>
  401b9a:	49 89 e1             	mov    %rsp,%r9
  401b9d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401ba3:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  401baa:	00 
  401bab:	48 8b 15 9e 35 20 00 	mov    0x20359e(%rip),%rdx        # 605150 <lab>
  401bb2:	48 8b 35 9f 35 20 00 	mov    0x20359f(%rip),%rsi        # 605158 <course>
  401bb9:	48 8b 3d 80 35 20 00 	mov    0x203580(%rip),%rdi        # 605140 <user_id>
  401bc0:	e8 e5 0f 00 00       	call   402baa <driver_post>
  401bc5:	85 c0                	test   %eax,%eax
  401bc7:	78 44                	js     401c0d <notify_server+0x103>
  401bc9:	bf 88 32 40 00       	mov    $0x403288,%edi
  401bce:	e8 fd f0 ff ff       	call   400cd0 <puts@plt>
  401bd3:	bf 6b 31 40 00       	mov    $0x40316b,%edi
  401bd8:	e8 f3 f0 ff ff       	call   400cd0 <puts@plt>
  401bdd:	eb 54                	jmp    401c33 <notify_server+0x129>
  401bdf:	bf 58 32 40 00       	mov    $0x403258,%edi
  401be4:	b8 00 00 00 00       	mov    $0x0,%eax
  401be9:	e8 12 f1 ff ff       	call   400d00 <printf@plt>
  401bee:	bf 01 00 00 00       	mov    $0x1,%edi
  401bf3:	e8 48 f2 ff ff       	call   400e40 <exit@plt>
  401bf8:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401bfe:	e9 4b ff ff ff       	jmp    401b4e <notify_server+0x44>
  401c03:	bd 3e 31 40 00       	mov    $0x40313e,%ebp
  401c08:	e9 4e ff ff ff       	jmp    401b5b <notify_server+0x51>
  401c0d:	48 89 e6             	mov    %rsp,%rsi
  401c10:	bf 5f 31 40 00       	mov    $0x40315f,%edi
  401c15:	b8 00 00 00 00       	mov    $0x0,%eax
  401c1a:	e8 e1 f0 ff ff       	call   400d00 <printf@plt>
  401c1f:	bf 01 00 00 00       	mov    $0x1,%edi
  401c24:	e8 17 f2 ff ff       	call   400e40 <exit@plt>
  401c29:	bf 75 31 40 00       	mov    $0x403175,%edi
  401c2e:	e8 9d f0 ff ff       	call   400cd0 <puts@plt>
  401c33:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401c3a:	5b                   	pop    %rbx
  401c3b:	5d                   	pop    %rbp
  401c3c:	c3                   	ret
  401c3d:	48 89 ee             	mov    %rbp,%rsi
  401c40:	bf c0 32 40 00       	mov    $0x4032c0,%edi
  401c45:	b8 00 00 00 00       	mov    $0x0,%eax
  401c4a:	e8 b1 f0 ff ff       	call   400d00 <printf@plt>
  401c4f:	48 8b 35 ea 34 20 00 	mov    0x2034ea(%rip),%rsi        # 605140 <user_id>
  401c56:	bf 7c 31 40 00       	mov    $0x40317c,%edi
  401c5b:	b8 00 00 00 00       	mov    $0x0,%eax
  401c60:	e8 9b f0 ff ff       	call   400d00 <printf@plt>
  401c65:	48 8b 35 ec 34 20 00 	mov    0x2034ec(%rip),%rsi        # 605158 <course>
  401c6c:	bf 89 31 40 00       	mov    $0x403189,%edi
  401c71:	b8 00 00 00 00       	mov    $0x0,%eax
  401c76:	e8 85 f0 ff ff       	call   400d00 <printf@plt>
  401c7b:	48 8b 35 ce 34 20 00 	mov    0x2034ce(%rip),%rsi        # 605150 <lab>
  401c82:	bf 95 31 40 00       	mov    $0x403195,%edi
  401c87:	b8 00 00 00 00       	mov    $0x0,%eax
  401c8c:	e8 6f f0 ff ff       	call   400d00 <printf@plt>
  401c91:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401c98:	00 
  401c99:	bf 9e 31 40 00       	mov    $0x40319e,%edi
  401c9e:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca3:	e8 58 f0 ff ff       	call   400d00 <printf@plt>
  401ca8:	eb 89                	jmp    401c33 <notify_server+0x129>
  401caa:	c3                   	ret

0000000000401cab <validate>:
  401cab:	53                   	push   %rbx
  401cac:	89 fb                	mov    %edi,%ebx
  401cae:	83 3d 53 38 20 00 00 	cmpl   $0x0,0x203853(%rip)        # 605508 <is_checker>
  401cb5:	74 60                	je     401d17 <validate+0x6c>
  401cb7:	39 3d 3f 38 20 00    	cmp    %edi,0x20383f(%rip)        # 6054fc <vlevel>
  401cbd:	75 29                	jne    401ce8 <validate+0x3d>
  401cbf:	8b 35 33 38 20 00    	mov    0x203833(%rip),%esi        # 6054f8 <check_level>
  401cc5:	39 fe                	cmp    %edi,%esi
  401cc7:	75 33                	jne    401cfc <validate+0x51>
  401cc9:	0f be 35 58 44 20 00 	movsbl 0x204458(%rip),%esi        # 606128 <target_prefix>
  401cd0:	b9 20 55 60 00       	mov    $0x605520,%ecx
  401cd5:	89 fa                	mov    %edi,%edx
  401cd7:	bf c8 31 40 00       	mov    $0x4031c8,%edi
  401cdc:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce1:	e8 1a f0 ff ff       	call   400d00 <printf@plt>
  401ce6:	5b                   	pop    %rbx
  401ce7:	c3                   	ret
  401ce8:	bf aa 31 40 00       	mov    $0x4031aa,%edi
  401ced:	e8 de ef ff ff       	call   400cd0 <puts@plt>
  401cf2:	b8 00 00 00 00       	mov    $0x0,%eax
  401cf7:	e8 8d fd ff ff       	call   401a89 <check_fail>
  401cfc:	89 fa                	mov    %edi,%edx
  401cfe:	bf e8 32 40 00       	mov    $0x4032e8,%edi
  401d03:	b8 00 00 00 00       	mov    $0x0,%eax
  401d08:	e8 f3 ef ff ff       	call   400d00 <printf@plt>
  401d0d:	b8 00 00 00 00       	mov    $0x0,%eax
  401d12:	e8 72 fd ff ff       	call   401a89 <check_fail>
  401d17:	39 3d df 37 20 00    	cmp    %edi,0x2037df(%rip)        # 6054fc <vlevel>
  401d1d:	74 18                	je     401d37 <validate+0x8c>
  401d1f:	bf aa 31 40 00       	mov    $0x4031aa,%edi
  401d24:	e8 a7 ef ff ff       	call   400cd0 <puts@plt>
  401d29:	89 de                	mov    %ebx,%esi
  401d2b:	bf 00 00 00 00       	mov    $0x0,%edi
  401d30:	e8 d5 fd ff ff       	call   401b0a <notify_server>
  401d35:	eb af                	jmp    401ce6 <validate+0x3b>
  401d37:	0f be 15 ea 43 20 00 	movsbl 0x2043ea(%rip),%edx        # 606128 <target_prefix>
  401d3e:	89 fe                	mov    %edi,%esi
  401d40:	bf 10 33 40 00       	mov    $0x403310,%edi
  401d45:	b8 00 00 00 00       	mov    $0x0,%eax
  401d4a:	e8 b1 ef ff ff       	call   400d00 <printf@plt>
  401d4f:	89 de                	mov    %ebx,%esi
  401d51:	bf 01 00 00 00       	mov    $0x1,%edi
  401d56:	e8 af fd ff ff       	call   401b0a <notify_server>
  401d5b:	eb 89                	jmp    401ce6 <validate+0x3b>

0000000000401d5d <fail>:
  401d5d:	48 83 ec 08          	sub    $0x8,%rsp
  401d61:	83 3d a0 37 20 00 00 	cmpl   $0x0,0x2037a0(%rip)        # 605508 <is_checker>
  401d68:	75 11                	jne    401d7b <fail+0x1e>
  401d6a:	89 fe                	mov    %edi,%esi
  401d6c:	bf 00 00 00 00       	mov    $0x0,%edi
  401d71:	e8 94 fd ff ff       	call   401b0a <notify_server>
  401d76:	48 83 c4 08          	add    $0x8,%rsp
  401d7a:	c3                   	ret
  401d7b:	b8 00 00 00 00       	mov    $0x0,%eax
  401d80:	e8 04 fd ff ff       	call   401a89 <check_fail>

0000000000401d85 <bushandler>:
  401d85:	48 83 ec 08          	sub    $0x8,%rsp
  401d89:	83 3d 78 37 20 00 00 	cmpl   $0x0,0x203778(%rip)        # 605508 <is_checker>
  401d90:	74 14                	je     401da6 <bushandler+0x21>
  401d92:	bf dd 31 40 00       	mov    $0x4031dd,%edi
  401d97:	e8 34 ef ff ff       	call   400cd0 <puts@plt>
  401d9c:	b8 00 00 00 00       	mov    $0x0,%eax
  401da1:	e8 e3 fc ff ff       	call   401a89 <check_fail>
  401da6:	bf 48 33 40 00       	mov    $0x403348,%edi
  401dab:	e8 20 ef ff ff       	call   400cd0 <puts@plt>
  401db0:	bf e7 31 40 00       	mov    $0x4031e7,%edi
  401db5:	e8 16 ef ff ff       	call   400cd0 <puts@plt>
  401dba:	be 00 00 00 00       	mov    $0x0,%esi
  401dbf:	bf 00 00 00 00       	mov    $0x0,%edi
  401dc4:	e8 41 fd ff ff       	call   401b0a <notify_server>
  401dc9:	bf 01 00 00 00       	mov    $0x1,%edi
  401dce:	e8 6d f0 ff ff       	call   400e40 <exit@plt>

0000000000401dd3 <seghandler>:
  401dd3:	48 83 ec 08          	sub    $0x8,%rsp
  401dd7:	83 3d 2a 37 20 00 00 	cmpl   $0x0,0x20372a(%rip)        # 605508 <is_checker>
  401dde:	74 14                	je     401df4 <seghandler+0x21>
  401de0:	bf fd 31 40 00       	mov    $0x4031fd,%edi
  401de5:	e8 e6 ee ff ff       	call   400cd0 <puts@plt>
  401dea:	b8 00 00 00 00       	mov    $0x0,%eax
  401def:	e8 95 fc ff ff       	call   401a89 <check_fail>
  401df4:	bf 68 33 40 00       	mov    $0x403368,%edi
  401df9:	e8 d2 ee ff ff       	call   400cd0 <puts@plt>
  401dfe:	bf e7 31 40 00       	mov    $0x4031e7,%edi
  401e03:	e8 c8 ee ff ff       	call   400cd0 <puts@plt>
  401e08:	be 00 00 00 00       	mov    $0x0,%esi
  401e0d:	bf 00 00 00 00       	mov    $0x0,%edi
  401e12:	e8 f3 fc ff ff       	call   401b0a <notify_server>
  401e17:	bf 01 00 00 00       	mov    $0x1,%edi
  401e1c:	e8 1f f0 ff ff       	call   400e40 <exit@plt>

0000000000401e21 <illegalhandler>:
  401e21:	48 83 ec 08          	sub    $0x8,%rsp
  401e25:	83 3d dc 36 20 00 00 	cmpl   $0x0,0x2036dc(%rip)        # 605508 <is_checker>
  401e2c:	74 14                	je     401e42 <illegalhandler+0x21>
  401e2e:	bf 10 32 40 00       	mov    $0x403210,%edi
  401e33:	e8 98 ee ff ff       	call   400cd0 <puts@plt>
  401e38:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3d:	e8 47 fc ff ff       	call   401a89 <check_fail>
  401e42:	bf 90 33 40 00       	mov    $0x403390,%edi
  401e47:	e8 84 ee ff ff       	call   400cd0 <puts@plt>
  401e4c:	bf e7 31 40 00       	mov    $0x4031e7,%edi
  401e51:	e8 7a ee ff ff       	call   400cd0 <puts@plt>
  401e56:	be 00 00 00 00       	mov    $0x0,%esi
  401e5b:	bf 00 00 00 00       	mov    $0x0,%edi
  401e60:	e8 a5 fc ff ff       	call   401b0a <notify_server>
  401e65:	bf 01 00 00 00       	mov    $0x1,%edi
  401e6a:	e8 d1 ef ff ff       	call   400e40 <exit@plt>

0000000000401e6f <sigalrmhandler>:
  401e6f:	48 83 ec 08          	sub    $0x8,%rsp
  401e73:	83 3d 8e 36 20 00 00 	cmpl   $0x0,0x20368e(%rip)        # 605508 <is_checker>
  401e7a:	74 14                	je     401e90 <sigalrmhandler+0x21>
  401e7c:	bf 24 32 40 00       	mov    $0x403224,%edi
  401e81:	e8 4a ee ff ff       	call   400cd0 <puts@plt>
  401e86:	b8 00 00 00 00       	mov    $0x0,%eax
  401e8b:	e8 f9 fb ff ff       	call   401a89 <check_fail>
  401e90:	be 05 00 00 00       	mov    $0x5,%esi
  401e95:	bf c0 33 40 00       	mov    $0x4033c0,%edi
  401e9a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e9f:	e8 5c ee ff ff       	call   400d00 <printf@plt>
  401ea4:	be 00 00 00 00       	mov    $0x0,%esi
  401ea9:	bf 00 00 00 00       	mov    $0x0,%edi
  401eae:	e8 57 fc ff ff       	call   401b0a <notify_server>
  401eb3:	bf 01 00 00 00       	mov    $0x1,%edi
  401eb8:	e8 83 ef ff ff       	call   400e40 <exit@plt>

0000000000401ebd <launch>:
  401ebd:	55                   	push   %rbp
  401ebe:	48 89 e5             	mov    %rsp,%rbp
  401ec1:	48 89 fa             	mov    %rdi,%rdx
  401ec4:	48 8d 47 17          	lea    0x17(%rdi),%rax
  401ec8:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401ecc:	48 29 c4             	sub    %rax,%rsp
  401ecf:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401ed4:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401ed8:	be f4 00 00 00       	mov    $0xf4,%esi
  401edd:	e8 2e ee ff ff       	call   400d10 <memset@plt>
  401ee2:	48 8b 05 b7 35 20 00 	mov    0x2035b7(%rip),%rax        # 6054a0 <stdin@GLIBC_2.2.5>
  401ee9:	48 39 05 00 36 20 00 	cmp    %rax,0x203600(%rip)        # 6054f0 <infile>
  401ef0:	74 29                	je     401f1b <launch+0x5e>
  401ef2:	c7 05 00 36 20 00 00 	movl   $0x0,0x203600(%rip)        # 6054fc <vlevel>
  401ef9:	00 00 00 
  401efc:	b8 00 00 00 00       	mov    $0x0,%eax
  401f01:	e8 d7 f9 ff ff       	call   4018dd <test>
  401f06:	83 3d fb 35 20 00 00 	cmpl   $0x0,0x2035fb(%rip)        # 605508 <is_checker>
  401f0d:	75 1d                	jne    401f2c <launch+0x6f>
  401f0f:	bf 44 32 40 00       	mov    $0x403244,%edi
  401f14:	e8 b7 ed ff ff       	call   400cd0 <puts@plt>
  401f19:	c9                   	leave
  401f1a:	c3                   	ret
  401f1b:	bf 2c 32 40 00       	mov    $0x40322c,%edi
  401f20:	b8 00 00 00 00       	mov    $0x0,%eax
  401f25:	e8 d6 ed ff ff       	call   400d00 <printf@plt>
  401f2a:	eb c6                	jmp    401ef2 <launch+0x35>
  401f2c:	bf 39 32 40 00       	mov    $0x403239,%edi
  401f31:	e8 9a ed ff ff       	call   400cd0 <puts@plt>
  401f36:	b8 00 00 00 00       	mov    $0x0,%eax
  401f3b:	e8 49 fb ff ff       	call   401a89 <check_fail>

0000000000401f40 <stable_launch>:
  401f40:	53                   	push   %rbx
  401f41:	48 89 3d a0 35 20 00 	mov    %rdi,0x2035a0(%rip)        # 6054e8 <global_offset>
  401f48:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f4e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f54:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f59:	ba 07 00 00 00       	mov    $0x7,%edx
  401f5e:	be 00 00 10 00       	mov    $0x100000,%esi
  401f63:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f68:	e8 83 ed ff ff       	call   400cf0 <mmap@plt>
  401f6d:	48 89 c3             	mov    %rax,%rbx
  401f70:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f76:	75 43                	jne    401fbb <stable_launch+0x7b>
  401f78:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f7f:	48 89 15 aa 41 20 00 	mov    %rdx,0x2041aa(%rip)        # 606130 <stack_top>
  401f86:	48 89 e0             	mov    %rsp,%rax
  401f89:	48 89 d4             	mov    %rdx,%rsp
  401f8c:	48 89 c2             	mov    %rax,%rdx
  401f8f:	48 89 15 4a 35 20 00 	mov    %rdx,0x20354a(%rip)        # 6054e0 <global_save_stack>
  401f96:	48 8b 3d 4b 35 20 00 	mov    0x20354b(%rip),%rdi        # 6054e8 <global_offset>
  401f9d:	e8 1b ff ff ff       	call   401ebd <launch>
  401fa2:	48 8b 05 37 35 20 00 	mov    0x203537(%rip),%rax        # 6054e0 <global_save_stack>
  401fa9:	48 89 c4             	mov    %rax,%rsp
  401fac:	be 00 00 10 00       	mov    $0x100000,%esi
  401fb1:	48 89 df             	mov    %rbx,%rdi
  401fb4:	e8 17 ee ff ff       	call   400dd0 <munmap@plt>
  401fb9:	5b                   	pop    %rbx
  401fba:	c3                   	ret
  401fbb:	be 00 00 10 00       	mov    $0x100000,%esi
  401fc0:	48 89 c7             	mov    %rax,%rdi
  401fc3:	e8 08 ee ff ff       	call   400dd0 <munmap@plt>
  401fc8:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401fcd:	be f8 33 40 00       	mov    $0x4033f8,%esi
  401fd2:	48 8b 3d e7 34 20 00 	mov    0x2034e7(%rip),%rdi        # 6054c0 <stderr@GLIBC_2.2.5>
  401fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  401fde:	e8 8d ed ff ff       	call   400d70 <fprintf@plt>
  401fe3:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe8:	e8 53 ee ff ff       	call   400e40 <exit@plt>

0000000000401fed <rio_readinitb>:
  401fed:	89 37                	mov    %esi,(%rdi)
  401fef:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401ff6:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401ffa:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401ffe:	c3                   	ret

0000000000401fff <sigalrm_handler>:
  401fff:	48 83 ec 08          	sub    $0x8,%rsp
  402003:	ba 00 00 00 00       	mov    $0x0,%edx
  402008:	be 30 34 40 00       	mov    $0x403430,%esi
  40200d:	48 8b 3d ac 34 20 00 	mov    0x2034ac(%rip),%rdi        # 6054c0 <stderr@GLIBC_2.2.5>
  402014:	b8 00 00 00 00       	mov    $0x0,%eax
  402019:	e8 52 ed ff ff       	call   400d70 <fprintf@plt>
  40201e:	bf 01 00 00 00       	mov    $0x1,%edi
  402023:	e8 18 ee ff ff       	call   400e40 <exit@plt>

0000000000402028 <urlencode>:
  402028:	41 54                	push   %r12
  40202a:	55                   	push   %rbp
  40202b:	53                   	push   %rbx
  40202c:	48 83 ec 10          	sub    $0x10,%rsp
  402030:	48 89 fb             	mov    %rdi,%rbx
  402033:	48 89 f5             	mov    %rsi,%rbp
  402036:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40203d:	b8 00 00 00 00       	mov    $0x0,%eax
  402042:	f2 ae                	repnz scas %es:(%rdi),%al
  402044:	48 89 ce             	mov    %rcx,%rsi
  402047:	48 f7 d6             	not    %rsi
  40204a:	8d 46 ff             	lea    -0x1(%rsi),%eax
  40204d:	eb 0e                	jmp    40205d <urlencode+0x35>
  40204f:	88 55 00             	mov    %dl,0x0(%rbp)
  402052:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402056:	48 83 c3 01          	add    $0x1,%rbx
  40205a:	44 89 e0             	mov    %r12d,%eax
  40205d:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402061:	85 c0                	test   %eax,%eax
  402063:	0f 84 93 00 00 00    	je     4020fc <urlencode+0xd4>
  402069:	0f b6 13             	movzbl (%rbx),%edx
  40206c:	80 fa 2a             	cmp    $0x2a,%dl
  40206f:	0f 94 c1             	sete   %cl
  402072:	80 fa 2d             	cmp    $0x2d,%dl
  402075:	0f 94 c0             	sete   %al
  402078:	08 c1                	or     %al,%cl
  40207a:	75 d3                	jne    40204f <urlencode+0x27>
  40207c:	80 fa 2e             	cmp    $0x2e,%dl
  40207f:	74 ce                	je     40204f <urlencode+0x27>
  402081:	80 fa 5f             	cmp    $0x5f,%dl
  402084:	74 c9                	je     40204f <urlencode+0x27>
  402086:	8d 42 d0             	lea    -0x30(%rdx),%eax
  402089:	3c 09                	cmp    $0x9,%al
  40208b:	76 c2                	jbe    40204f <urlencode+0x27>
  40208d:	8d 42 bf             	lea    -0x41(%rdx),%eax
  402090:	3c 19                	cmp    $0x19,%al
  402092:	76 bb                	jbe    40204f <urlencode+0x27>
  402094:	8d 42 9f             	lea    -0x61(%rdx),%eax
  402097:	3c 19                	cmp    $0x19,%al
  402099:	76 b4                	jbe    40204f <urlencode+0x27>
  40209b:	80 fa 20             	cmp    $0x20,%dl
  40209e:	74 4a                	je     4020ea <urlencode+0xc2>
  4020a0:	8d 42 e0             	lea    -0x20(%rdx),%eax
  4020a3:	3c 5f                	cmp    $0x5f,%al
  4020a5:	0f 96 c1             	setbe  %cl
  4020a8:	80 fa 09             	cmp    $0x9,%dl
  4020ab:	0f 94 c0             	sete   %al
  4020ae:	08 c1                	or     %al,%cl
  4020b0:	74 45                	je     4020f7 <urlencode+0xcf>
  4020b2:	0f b6 d2             	movzbl %dl,%edx
  4020b5:	be c8 34 40 00       	mov    $0x4034c8,%esi
  4020ba:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4020bf:	b8 00 00 00 00       	mov    $0x0,%eax
  4020c4:	e8 67 ed ff ff       	call   400e30 <sprintf@plt>
  4020c9:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  4020ce:	88 45 00             	mov    %al,0x0(%rbp)
  4020d1:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  4020d6:	88 45 01             	mov    %al,0x1(%rbp)
  4020d9:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  4020de:	88 45 02             	mov    %al,0x2(%rbp)
  4020e1:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4020e5:	e9 6c ff ff ff       	jmp    402056 <urlencode+0x2e>
  4020ea:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4020ee:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4020f2:	e9 5f ff ff ff       	jmp    402056 <urlencode+0x2e>
  4020f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020fc:	48 83 c4 10          	add    $0x10,%rsp
  402100:	5b                   	pop    %rbx
  402101:	5d                   	pop    %rbp
  402102:	41 5c                	pop    %r12
  402104:	c3                   	ret

0000000000402105 <rio_writen>:
  402105:	41 55                	push   %r13
  402107:	41 54                	push   %r12
  402109:	55                   	push   %rbp
  40210a:	53                   	push   %rbx
  40210b:	48 83 ec 08          	sub    $0x8,%rsp
  40210f:	41 89 fc             	mov    %edi,%r12d
  402112:	48 89 f5             	mov    %rsi,%rbp
  402115:	49 89 d5             	mov    %rdx,%r13
  402118:	48 89 d3             	mov    %rdx,%rbx
  40211b:	eb 06                	jmp    402123 <rio_writen+0x1e>
  40211d:	48 29 c3             	sub    %rax,%rbx
  402120:	48 01 c5             	add    %rax,%rbp
  402123:	48 85 db             	test   %rbx,%rbx
  402126:	74 24                	je     40214c <rio_writen+0x47>
  402128:	48 89 da             	mov    %rbx,%rdx
  40212b:	48 89 ee             	mov    %rbp,%rsi
  40212e:	44 89 e7             	mov    %r12d,%edi
  402131:	e8 aa eb ff ff       	call   400ce0 <write@plt>
  402136:	48 85 c0             	test   %rax,%rax
  402139:	7f e2                	jg     40211d <rio_writen+0x18>
  40213b:	e8 50 eb ff ff       	call   400c90 <__errno_location@plt>
  402140:	83 38 04             	cmpl   $0x4,(%rax)
  402143:	75 15                	jne    40215a <rio_writen+0x55>
  402145:	b8 00 00 00 00       	mov    $0x0,%eax
  40214a:	eb d1                	jmp    40211d <rio_writen+0x18>
  40214c:	4c 89 e8             	mov    %r13,%rax
  40214f:	48 83 c4 08          	add    $0x8,%rsp
  402153:	5b                   	pop    %rbx
  402154:	5d                   	pop    %rbp
  402155:	41 5c                	pop    %r12
  402157:	41 5d                	pop    %r13
  402159:	c3                   	ret
  40215a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402161:	eb ec                	jmp    40214f <rio_writen+0x4a>

0000000000402163 <rio_read>:
  402163:	41 55                	push   %r13
  402165:	41 54                	push   %r12
  402167:	55                   	push   %rbp
  402168:	53                   	push   %rbx
  402169:	48 83 ec 08          	sub    $0x8,%rsp
  40216d:	48 89 fb             	mov    %rdi,%rbx
  402170:	49 89 f5             	mov    %rsi,%r13
  402173:	49 89 d4             	mov    %rdx,%r12
  402176:	eb 0a                	jmp    402182 <rio_read+0x1f>
  402178:	e8 13 eb ff ff       	call   400c90 <__errno_location@plt>
  40217d:	83 38 04             	cmpl   $0x4,(%rax)
  402180:	75 5a                	jne    4021dc <rio_read+0x79>
  402182:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402185:	85 ed                	test   %ebp,%ebp
  402187:	7f 22                	jg     4021ab <rio_read+0x48>
  402189:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40218d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402192:	48 89 ee             	mov    %rbp,%rsi
  402195:	8b 3b                	mov    (%rbx),%edi
  402197:	e8 a4 eb ff ff       	call   400d40 <read@plt>
  40219c:	89 43 04             	mov    %eax,0x4(%rbx)
  40219f:	85 c0                	test   %eax,%eax
  4021a1:	78 d5                	js     402178 <rio_read+0x15>
  4021a3:	74 40                	je     4021e5 <rio_read+0x82>
  4021a5:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4021a9:	eb d7                	jmp    402182 <rio_read+0x1f>
  4021ab:	89 e8                	mov    %ebp,%eax
  4021ad:	4c 39 e0             	cmp    %r12,%rax
  4021b0:	72 03                	jb     4021b5 <rio_read+0x52>
  4021b2:	44 89 e5             	mov    %r12d,%ebp
  4021b5:	4c 63 e5             	movslq %ebp,%r12
  4021b8:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4021bc:	4c 89 e2             	mov    %r12,%rdx
  4021bf:	4c 89 ef             	mov    %r13,%rdi
  4021c2:	e8 c9 eb ff ff       	call   400d90 <memcpy@plt>
  4021c7:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4021cb:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4021ce:	4c 89 e0             	mov    %r12,%rax
  4021d1:	48 83 c4 08          	add    $0x8,%rsp
  4021d5:	5b                   	pop    %rbx
  4021d6:	5d                   	pop    %rbp
  4021d7:	41 5c                	pop    %r12
  4021d9:	41 5d                	pop    %r13
  4021db:	c3                   	ret
  4021dc:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021e3:	eb ec                	jmp    4021d1 <rio_read+0x6e>
  4021e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ea:	eb e5                	jmp    4021d1 <rio_read+0x6e>

00000000004021ec <rio_readlineb>:
  4021ec:	41 55                	push   %r13
  4021ee:	41 54                	push   %r12
  4021f0:	55                   	push   %rbp
  4021f1:	53                   	push   %rbx
  4021f2:	48 83 ec 18          	sub    $0x18,%rsp
  4021f6:	49 89 fd             	mov    %rdi,%r13
  4021f9:	48 89 f5             	mov    %rsi,%rbp
  4021fc:	49 89 d4             	mov    %rdx,%r12
  4021ff:	bb 01 00 00 00       	mov    $0x1,%ebx
  402204:	4c 39 e3             	cmp    %r12,%rbx
  402207:	73 44                	jae    40224d <rio_readlineb+0x61>
  402209:	ba 01 00 00 00       	mov    $0x1,%edx
  40220e:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402213:	4c 89 ef             	mov    %r13,%rdi
  402216:	e8 48 ff ff ff       	call   402163 <rio_read>
  40221b:	83 f8 01             	cmp    $0x1,%eax
  40221e:	75 19                	jne    402239 <rio_readlineb+0x4d>
  402220:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  402224:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  402229:	88 45 00             	mov    %al,0x0(%rbp)
  40222c:	3c 0a                	cmp    $0xa,%al
  40222e:	74 1a                	je     40224a <rio_readlineb+0x5e>
  402230:	48 83 c3 01          	add    $0x1,%rbx
  402234:	48 89 d5             	mov    %rdx,%rbp
  402237:	eb cb                	jmp    402204 <rio_readlineb+0x18>
  402239:	85 c0                	test   %eax,%eax
  40223b:	75 22                	jne    40225f <rio_readlineb+0x73>
  40223d:	48 83 fb 01          	cmp    $0x1,%rbx
  402241:	75 0a                	jne    40224d <rio_readlineb+0x61>
  402243:	b8 00 00 00 00       	mov    $0x0,%eax
  402248:	eb 0a                	jmp    402254 <rio_readlineb+0x68>
  40224a:	48 89 d5             	mov    %rdx,%rbp
  40224d:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402251:	48 89 d8             	mov    %rbx,%rax
  402254:	48 83 c4 18          	add    $0x18,%rsp
  402258:	5b                   	pop    %rbx
  402259:	5d                   	pop    %rbp
  40225a:	41 5c                	pop    %r12
  40225c:	41 5d                	pop    %r13
  40225e:	c3                   	ret
  40225f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402266:	eb ec                	jmp    402254 <rio_readlineb+0x68>

0000000000402268 <submitr>:
  402268:	41 57                	push   %r15
  40226a:	41 56                	push   %r14
  40226c:	41 55                	push   %r13
  40226e:	41 54                	push   %r12
  402270:	55                   	push   %rbp
  402271:	53                   	push   %rbx
  402272:	48 81 ec 48 a0 00 00 	sub    $0xa048,%rsp
  402279:	49 89 fc             	mov    %rdi,%r12
  40227c:	89 74 24 04          	mov    %esi,0x4(%rsp)
  402280:	49 89 d7             	mov    %rdx,%r15
  402283:	49 89 ce             	mov    %rcx,%r14
  402286:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  40228b:	4d 89 cd             	mov    %r9,%r13
  40228e:	48 8b ac 24 80 a0 00 	mov    0xa080(%rsp),%rbp
  402295:	00 
  402296:	c7 84 24 1c 20 00 00 	movl   $0x0,0x201c(%rsp)
  40229d:	00 00 00 00 
  4022a1:	ba 00 00 00 00       	mov    $0x0,%edx
  4022a6:	be 01 00 00 00       	mov    $0x1,%esi
  4022ab:	bf 02 00 00 00       	mov    $0x2,%edi
  4022b0:	e8 bb eb ff ff       	call   400e70 <socket@plt>
  4022b5:	85 c0                	test   %eax,%eax
  4022b7:	0f 88 8f 02 00 00    	js     40254c <submitr+0x2e4>
  4022bd:	89 c3                	mov    %eax,%ebx
  4022bf:	4c 89 e7             	mov    %r12,%rdi
  4022c2:	e8 99 ea ff ff       	call   400d60 <gethostbyname@plt>
  4022c7:	48 85 c0             	test   %rax,%rax
  4022ca:	0f 84 c8 02 00 00    	je     402598 <submitr+0x330>
  4022d0:	48 c7 84 24 32 a0 00 	movq   $0x0,0xa032(%rsp)
  4022d7:	00 00 00 00 00 
  4022dc:	c7 84 24 3a a0 00 00 	movl   $0x0,0xa03a(%rsp)
  4022e3:	00 00 00 00 
  4022e7:	66 c7 84 24 3e a0 00 	movw   $0x0,0xa03e(%rsp)
  4022ee:	00 00 00 
  4022f1:	66 c7 84 24 30 a0 00 	movw   $0x2,0xa030(%rsp)
  4022f8:	00 02 00 
  4022fb:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4022ff:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402303:	48 8d bc 24 34 a0 00 	lea    0xa034(%rsp),%rdi
  40230a:	00 
  40230b:	48 8b 31             	mov    (%rcx),%rsi
  40230e:	e8 cd ea ff ff       	call   400de0 <memmove@plt>
  402313:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  402318:	66 c1 c0 08          	rol    $0x8,%ax
  40231c:	66 89 84 24 32 a0 00 	mov    %ax,0xa032(%rsp)
  402323:	00 
  402324:	ba 10 00 00 00       	mov    $0x10,%edx
  402329:	48 8d b4 24 30 a0 00 	lea    0xa030(%rsp),%rsi
  402330:	00 
  402331:	89 df                	mov    %ebx,%edi
  402333:	e8 18 eb ff ff       	call   400e50 <connect@plt>
  402338:	85 c0                	test   %eax,%eax
  40233a:	0f 88 c0 02 00 00    	js     402600 <submitr+0x398>
  402340:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402347:	b8 00 00 00 00       	mov    $0x0,%eax
  40234c:	48 89 f1             	mov    %rsi,%rcx
  40234f:	4c 89 ef             	mov    %r13,%rdi
  402352:	f2 ae                	repnz scas %es:(%rdi),%al
  402354:	48 89 ca             	mov    %rcx,%rdx
  402357:	48 f7 d2             	not    %rdx
  40235a:	48 89 f1             	mov    %rsi,%rcx
  40235d:	4c 89 ff             	mov    %r15,%rdi
  402360:	f2 ae                	repnz scas %es:(%rdi),%al
  402362:	48 f7 d1             	not    %rcx
  402365:	49 89 c8             	mov    %rcx,%r8
  402368:	48 89 f1             	mov    %rsi,%rcx
  40236b:	4c 89 f7             	mov    %r14,%rdi
  40236e:	f2 ae                	repnz scas %es:(%rdi),%al
  402370:	48 f7 d1             	not    %rcx
  402373:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402378:	48 89 f1             	mov    %rsi,%rcx
  40237b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402380:	f2 ae                	repnz scas %es:(%rdi),%al
  402382:	48 89 c8             	mov    %rcx,%rax
  402385:	48 f7 d0             	not    %rax
  402388:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  40238d:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402392:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  402399:	00 
  40239a:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4023a0:	0f 87 b4 02 00 00    	ja     40265a <submitr+0x3f2>
  4023a6:	48 8d b4 24 20 40 00 	lea    0x4020(%rsp),%rsi
  4023ad:	00 
  4023ae:	b9 00 04 00 00       	mov    $0x400,%ecx
  4023b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b8:	48 89 f7             	mov    %rsi,%rdi
  4023bb:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4023be:	4c 89 ef             	mov    %r13,%rdi
  4023c1:	e8 62 fc ff ff       	call   402028 <urlencode>
  4023c6:	85 c0                	test   %eax,%eax
  4023c8:	0f 88 ff 02 00 00    	js     4026cd <submitr+0x465>
  4023ce:	4c 8d ac 24 20 60 00 	lea    0x6020(%rsp),%r13
  4023d5:	00 
  4023d6:	4d 89 e1             	mov    %r12,%r9
  4023d9:	4c 8d 84 24 20 40 00 	lea    0x4020(%rsp),%r8
  4023e0:	00 
  4023e1:	4c 89 f9             	mov    %r15,%rcx
  4023e4:	4c 89 f2             	mov    %r14,%rdx
  4023e7:	be 58 34 40 00       	mov    $0x403458,%esi
  4023ec:	4c 89 ef             	mov    %r13,%rdi
  4023ef:	b8 00 00 00 00       	mov    $0x0,%eax
  4023f4:	e8 37 ea ff ff       	call   400e30 <sprintf@plt>
  4023f9:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402400:	b8 00 00 00 00       	mov    $0x0,%eax
  402405:	4c 89 ef             	mov    %r13,%rdi
  402408:	f2 ae                	repnz scas %es:(%rdi),%al
  40240a:	48 89 ca             	mov    %rcx,%rdx
  40240d:	48 f7 d2             	not    %rdx
  402410:	48 8d 52 ff          	lea    -0x1(%rdx),%rdx
  402414:	4c 89 ee             	mov    %r13,%rsi
  402417:	89 df                	mov    %ebx,%edi
  402419:	e8 e7 fc ff ff       	call   402105 <rio_writen>
  40241e:	48 85 c0             	test   %rax,%rax
  402421:	0f 88 31 03 00 00    	js     402758 <submitr+0x4f0>
  402427:	89 de                	mov    %ebx,%esi
  402429:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  402430:	00 
  402431:	e8 b7 fb ff ff       	call   401fed <rio_readinitb>
  402436:	ba 00 20 00 00       	mov    $0x2000,%edx
  40243b:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  402442:	00 
  402443:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  40244a:	00 
  40244b:	e8 9c fd ff ff       	call   4021ec <rio_readlineb>
  402450:	48 85 c0             	test   %rax,%rax
  402453:	0f 8e 6e 03 00 00    	jle    4027c7 <submitr+0x55f>
  402459:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40245e:	48 8d 8c 24 1c 20 00 	lea    0x201c(%rsp),%rcx
  402465:	00 
  402466:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  40246d:	00 
  40246e:	be cf 34 40 00       	mov    $0x4034cf,%esi
  402473:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  40247a:	00 
  40247b:	b8 00 00 00 00       	mov    $0x0,%eax
  402480:	e8 3b e9 ff ff       	call   400dc0 <__isoc99_sscanf@plt>
  402485:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  40248c:	00 
  40248d:	bf e6 34 40 00       	mov    $0x4034e6,%edi
  402492:	b9 03 00 00 00       	mov    $0x3,%ecx
  402497:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402499:	0f 97 c0             	seta   %al
  40249c:	1c 00                	sbb    $0x0,%al
  40249e:	84 c0                	test   %al,%al
  4024a0:	0f 84 9f 03 00 00    	je     402845 <submitr+0x5dd>
  4024a6:	ba 00 20 00 00       	mov    $0x2000,%edx
  4024ab:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  4024b2:	00 
  4024b3:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  4024ba:	00 
  4024bb:	e8 2c fd ff ff       	call   4021ec <rio_readlineb>
  4024c0:	48 85 c0             	test   %rax,%rax
  4024c3:	7f c0                	jg     402485 <submitr+0x21d>
  4024c5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4024cc:	3a 20 43 
  4024cf:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  4024d6:	20 75 6e 
  4024d9:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4024dd:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4024e1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024e8:	74 6f 20 
  4024eb:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  4024f2:	68 65 61 
  4024f5:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4024f9:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4024fd:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402504:	66 72 6f 
  402507:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  40250e:	20 72 65 
  402511:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402515:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402519:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402520:	73 65 72 
  402523:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402527:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  40252e:	89 df                	mov    %ebx,%edi
  402530:	e8 fb e7 ff ff       	call   400d30 <close@plt>
  402535:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40253a:	48 81 c4 48 a0 00 00 	add    $0xa048,%rsp
  402541:	5b                   	pop    %rbx
  402542:	5d                   	pop    %rbp
  402543:	41 5c                	pop    %r12
  402545:	41 5d                	pop    %r13
  402547:	41 5e                	pop    %r14
  402549:	41 5f                	pop    %r15
  40254b:	c3                   	ret
  40254c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402553:	3a 20 43 
  402556:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  40255d:	20 75 6e 
  402560:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402564:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402568:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40256f:	74 6f 20 
  402572:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402579:	65 20 73 
  40257c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402580:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402584:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  40258b:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402591:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402596:	eb a2                	jmp    40253a <submitr+0x2d2>
  402598:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40259f:	3a 20 44 
  4025a2:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  4025a9:	20 75 6e 
  4025ac:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4025b0:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4025b4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025bb:	74 6f 20 
  4025be:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  4025c5:	76 65 20 
  4025c8:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4025cc:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4025d0:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4025d7:	72 20 61 
  4025da:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4025de:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4025e5:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4025eb:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4025ef:	89 df                	mov    %ebx,%edi
  4025f1:	e8 3a e7 ff ff       	call   400d30 <close@plt>
  4025f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025fb:	e9 3a ff ff ff       	jmp    40253a <submitr+0x2d2>
  402600:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402607:	3a 20 55 
  40260a:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  402611:	20 74 6f 
  402614:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402618:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40261c:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402623:	65 63 74 
  402626:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  40262d:	68 65 20 
  402630:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402634:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402638:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  40263f:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  402645:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  402649:	89 df                	mov    %ebx,%edi
  40264b:	e8 e0 e6 ff ff       	call   400d30 <close@plt>
  402650:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402655:	e9 e0 fe ff ff       	jmp    40253a <submitr+0x2d2>
  40265a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402661:	3a 20 52 
  402664:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  40266b:	20 73 74 
  40266e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402672:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402676:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40267d:	74 6f 6f 
  402680:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  402687:	65 2e 20 
  40268a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40268e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402692:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402699:	61 73 65 
  40269c:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  4026a3:	49 54 52 
  4026a6:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4026aa:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4026ae:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4026b5:	55 46 00 
  4026b8:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4026bc:	89 df                	mov    %ebx,%edi
  4026be:	e8 6d e6 ff ff       	call   400d30 <close@plt>
  4026c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026c8:	e9 6d fe ff ff       	jmp    40253a <submitr+0x2d2>
  4026cd:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4026d4:	3a 20 52 
  4026d7:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  4026de:	20 73 74 
  4026e1:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4026e5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4026e9:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4026f0:	63 6f 6e 
  4026f3:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  4026fa:	20 61 6e 
  4026fd:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402701:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402705:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40270c:	67 61 6c 
  40270f:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  402716:	6e 70 72 
  402719:	48 89 45 20          	mov    %rax,0x20(%rbp)
  40271d:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402721:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402728:	6c 65 20 
  40272b:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  402732:	63 74 65 
  402735:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402739:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  40273d:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  402743:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  402747:	89 df                	mov    %ebx,%edi
  402749:	e8 e2 e5 ff ff       	call   400d30 <close@plt>
  40274e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402753:	e9 e2 fd ff ff       	jmp    40253a <submitr+0x2d2>
  402758:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40275f:	3a 20 43 
  402762:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402769:	20 75 6e 
  40276c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402770:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402774:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40277b:	74 6f 20 
  40277e:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  402785:	20 74 6f 
  402788:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40278c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402790:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402797:	72 65 73 
  40279a:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  4027a1:	65 72 76 
  4027a4:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4027a8:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4027ac:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  4027b2:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  4027b6:	89 df                	mov    %ebx,%edi
  4027b8:	e8 73 e5 ff ff       	call   400d30 <close@plt>
  4027bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027c2:	e9 73 fd ff ff       	jmp    40253a <submitr+0x2d2>
  4027c7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027ce:	3a 20 43 
  4027d1:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  4027d8:	20 75 6e 
  4027db:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4027df:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4027e3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027ea:	74 6f 20 
  4027ed:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  4027f4:	66 69 72 
  4027f7:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4027fb:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4027ff:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402806:	61 64 65 
  402809:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  402810:	6d 20 72 
  402813:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402817:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  40281b:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402822:	20 73 65 
  402825:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402829:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  402830:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  402834:	89 df                	mov    %ebx,%edi
  402836:	e8 f5 e4 ff ff       	call   400d30 <close@plt>
  40283b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402840:	e9 f5 fc ff ff       	jmp    40253a <submitr+0x2d2>
  402845:	ba 00 20 00 00       	mov    $0x2000,%edx
  40284a:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  402851:	00 
  402852:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  402859:	00 
  40285a:	e8 8d f9 ff ff       	call   4021ec <rio_readlineb>
  40285f:	48 85 c0             	test   %rax,%rax
  402862:	0f 8e 91 00 00 00    	jle    4028f9 <submitr+0x691>
  402868:	8b 94 24 1c 20 00 00 	mov    0x201c(%rsp),%edx
  40286f:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402875:	0f 85 02 01 00 00    	jne    40297d <submitr+0x715>
  40287b:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  402882:	00 
  402883:	48 89 ef             	mov    %rbp,%rdi
  402886:	e8 35 e4 ff ff       	call   400cc0 <strcpy@plt>
  40288b:	89 df                	mov    %ebx,%edi
  40288d:	e8 9e e4 ff ff       	call   400d30 <close@plt>
  402892:	bf e0 34 40 00       	mov    $0x4034e0,%edi
  402897:	b9 04 00 00 00       	mov    $0x4,%ecx
  40289c:	48 89 ee             	mov    %rbp,%rsi
  40289f:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4028a1:	0f 97 c0             	seta   %al
  4028a4:	1c 00                	sbb    $0x0,%al
  4028a6:	0f be c0             	movsbl %al,%eax
  4028a9:	85 c0                	test   %eax,%eax
  4028ab:	0f 84 89 fc ff ff    	je     40253a <submitr+0x2d2>
  4028b1:	bf e4 34 40 00       	mov    $0x4034e4,%edi
  4028b6:	b9 05 00 00 00       	mov    $0x5,%ecx
  4028bb:	48 89 ee             	mov    %rbp,%rsi
  4028be:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4028c0:	0f 97 c0             	seta   %al
  4028c3:	1c 00                	sbb    $0x0,%al
  4028c5:	0f be c0             	movsbl %al,%eax
  4028c8:	85 c0                	test   %eax,%eax
  4028ca:	0f 84 6a fc ff ff    	je     40253a <submitr+0x2d2>
  4028d0:	bf e9 34 40 00       	mov    $0x4034e9,%edi
  4028d5:	b9 03 00 00 00       	mov    $0x3,%ecx
  4028da:	48 89 ee             	mov    %rbp,%rsi
  4028dd:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4028df:	0f 97 c0             	seta   %al
  4028e2:	1c 00                	sbb    $0x0,%al
  4028e4:	0f be c0             	movsbl %al,%eax
  4028e7:	85 c0                	test   %eax,%eax
  4028e9:	0f 84 4b fc ff ff    	je     40253a <submitr+0x2d2>
  4028ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028f4:	e9 41 fc ff ff       	jmp    40253a <submitr+0x2d2>
  4028f9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402900:	3a 20 43 
  402903:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  40290a:	20 75 6e 
  40290d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402911:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402915:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40291c:	74 6f 20 
  40291f:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  402926:	73 74 61 
  402929:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40292d:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402931:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402938:	65 73 73 
  40293b:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  402942:	72 6f 6d 
  402945:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402949:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  40294d:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402954:	6c 74 20 
  402957:	48 89 45 30          	mov    %rax,0x30(%rbp)
  40295b:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  402962:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  402968:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  40296c:	89 df                	mov    %ebx,%edi
  40296e:	e8 bd e3 ff ff       	call   400d30 <close@plt>
  402973:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402978:	e9 bd fb ff ff       	jmp    40253a <submitr+0x2d2>
  40297d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  402982:	be 98 34 40 00       	mov    $0x403498,%esi
  402987:	48 89 ef             	mov    %rbp,%rdi
  40298a:	b8 00 00 00 00       	mov    $0x0,%eax
  40298f:	e8 9c e4 ff ff       	call   400e30 <sprintf@plt>
  402994:	89 df                	mov    %ebx,%edi
  402996:	e8 95 e3 ff ff       	call   400d30 <close@plt>
  40299b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029a0:	e9 95 fb ff ff       	jmp    40253a <submitr+0x2d2>

00000000004029a5 <init_timeout>:
  4029a5:	85 ff                	test   %edi,%edi
  4029a7:	74 24                	je     4029cd <init_timeout+0x28>
  4029a9:	53                   	push   %rbx
  4029aa:	89 fb                	mov    %edi,%ebx
  4029ac:	78 18                	js     4029c6 <init_timeout+0x21>
  4029ae:	be ff 1f 40 00       	mov    $0x401fff,%esi
  4029b3:	bf 0e 00 00 00       	mov    $0xe,%edi
  4029b8:	e8 93 e3 ff ff       	call   400d50 <signal@plt>
  4029bd:	89 df                	mov    %ebx,%edi
  4029bf:	e8 5c e3 ff ff       	call   400d20 <alarm@plt>
  4029c4:	5b                   	pop    %rbx
  4029c5:	c3                   	ret
  4029c6:	bb 00 00 00 00       	mov    $0x0,%ebx
  4029cb:	eb e1                	jmp    4029ae <init_timeout+0x9>
  4029cd:	c3                   	ret

00000000004029ce <init_driver>:
  4029ce:	55                   	push   %rbp
  4029cf:	53                   	push   %rbx
  4029d0:	48 83 ec 18          	sub    $0x18,%rsp
  4029d4:	48 89 fd             	mov    %rdi,%rbp
  4029d7:	be 01 00 00 00       	mov    $0x1,%esi
  4029dc:	bf 0d 00 00 00       	mov    $0xd,%edi
  4029e1:	e8 6a e3 ff ff       	call   400d50 <signal@plt>
  4029e6:	be 01 00 00 00       	mov    $0x1,%esi
  4029eb:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4029f0:	e8 5b e3 ff ff       	call   400d50 <signal@plt>
  4029f5:	be 01 00 00 00       	mov    $0x1,%esi
  4029fa:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4029ff:	e8 4c e3 ff ff       	call   400d50 <signal@plt>
  402a04:	ba 00 00 00 00       	mov    $0x0,%edx
  402a09:	be 01 00 00 00       	mov    $0x1,%esi
  402a0e:	bf 02 00 00 00       	mov    $0x2,%edi
  402a13:	e8 58 e4 ff ff       	call   400e70 <socket@plt>
  402a18:	85 c0                	test   %eax,%eax
  402a1a:	0f 88 83 00 00 00    	js     402aa3 <init_driver+0xd5>
  402a20:	89 c3                	mov    %eax,%ebx
  402a22:	bf 1d 30 40 00       	mov    $0x40301d,%edi
  402a27:	e8 34 e3 ff ff       	call   400d60 <gethostbyname@plt>
  402a2c:	48 85 c0             	test   %rax,%rax
  402a2f:	0f 84 ba 00 00 00    	je     402aef <init_driver+0x121>
  402a35:	48 c7 44 24 02 00 00 	movq   $0x0,0x2(%rsp)
  402a3c:	00 00 
  402a3e:	c7 44 24 0a 00 00 00 	movl   $0x0,0xa(%rsp)
  402a45:	00 
  402a46:	66 c7 44 24 0e 00 00 	movw   $0x0,0xe(%rsp)
  402a4d:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402a53:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402a57:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402a5b:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402a60:	48 8b 31             	mov    (%rcx),%rsi
  402a63:	e8 78 e3 ff ff       	call   400de0 <memmove@plt>
  402a68:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402a6f:	ba 10 00 00 00       	mov    $0x10,%edx
  402a74:	48 89 e6             	mov    %rsp,%rsi
  402a77:	89 df                	mov    %ebx,%edi
  402a79:	e8 d2 e3 ff ff       	call   400e50 <connect@plt>
  402a7e:	85 c0                	test   %eax,%eax
  402a80:	0f 88 d1 00 00 00    	js     402b57 <init_driver+0x189>
  402a86:	89 df                	mov    %ebx,%edi
  402a88:	e8 a3 e2 ff ff       	call   400d30 <close@plt>
  402a8d:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402a93:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402a97:	b8 00 00 00 00       	mov    $0x0,%eax
  402a9c:	48 83 c4 18          	add    $0x18,%rsp
  402aa0:	5b                   	pop    %rbx
  402aa1:	5d                   	pop    %rbp
  402aa2:	c3                   	ret
  402aa3:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402aaa:	3a 20 43 
  402aad:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402ab4:	20 75 6e 
  402ab7:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402abb:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402abf:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402ac6:	74 6f 20 
  402ac9:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402ad0:	65 20 73 
  402ad3:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ad7:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402adb:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ae2:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ae8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402aed:	eb ad                	jmp    402a9c <init_driver+0xce>
  402aef:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402af6:	3a 20 44 
  402af9:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402b00:	20 75 6e 
  402b03:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b07:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402b0b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b12:	74 6f 20 
  402b15:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402b1c:	76 65 20 
  402b1f:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b23:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402b27:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402b2e:	72 20 61 
  402b31:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402b35:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b3c:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b42:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b46:	89 df                	mov    %ebx,%edi
  402b48:	e8 e3 e1 ff ff       	call   400d30 <close@plt>
  402b4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b52:	e9 45 ff ff ff       	jmp    402a9c <init_driver+0xce>
  402b57:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402b5e:	3a 20 55 
  402b61:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  402b68:	20 74 6f 
  402b6b:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b6f:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402b73:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402b7a:	65 63 74 
  402b7d:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  402b84:	65 72 76 
  402b87:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b8b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402b8f:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402b95:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402b99:	89 df                	mov    %ebx,%edi
  402b9b:	e8 90 e1 ff ff       	call   400d30 <close@plt>
  402ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ba5:	e9 f2 fe ff ff       	jmp    402a9c <init_driver+0xce>

0000000000402baa <driver_post>:
  402baa:	53                   	push   %rbx
  402bab:	4c 89 cb             	mov    %r9,%rbx
  402bae:	45 85 c0             	test   %r8d,%r8d
  402bb1:	75 18                	jne    402bcb <driver_post+0x21>
  402bb3:	48 85 ff             	test   %rdi,%rdi
  402bb6:	74 05                	je     402bbd <driver_post+0x13>
  402bb8:	80 3f 00             	cmpb   $0x0,(%rdi)
  402bbb:	75 30                	jne    402bed <driver_post+0x43>
  402bbd:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402bc2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402bc6:	44 89 c0             	mov    %r8d,%eax
  402bc9:	5b                   	pop    %rbx
  402bca:	c3                   	ret
  402bcb:	48 89 ce             	mov    %rcx,%rsi
  402bce:	bf ec 34 40 00       	mov    $0x4034ec,%edi
  402bd3:	b8 00 00 00 00       	mov    $0x0,%eax
  402bd8:	e8 23 e1 ff ff       	call   400d00 <printf@plt>
  402bdd:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402be2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402be6:	b8 00 00 00 00       	mov    $0x0,%eax
  402beb:	eb dc                	jmp    402bc9 <driver_post+0x1f>
  402bed:	48 83 ec 08          	sub    $0x8,%rsp
  402bf1:	41 51                	push   %r9
  402bf3:	49 89 c9             	mov    %rcx,%r9
  402bf6:	49 89 d0             	mov    %rdx,%r8
  402bf9:	48 89 f9             	mov    %rdi,%rcx
  402bfc:	48 89 f2             	mov    %rsi,%rdx
  402bff:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402c04:	bf 1d 30 40 00       	mov    $0x40301d,%edi
  402c09:	e8 5a f6 ff ff       	call   402268 <submitr>
  402c0e:	48 83 c4 10          	add    $0x10,%rsp
  402c12:	eb b5                	jmp    402bc9 <driver_post+0x1f>

0000000000402c14 <check>:
  402c14:	89 f8                	mov    %edi,%eax
  402c16:	c1 e8 1c             	shr    $0x1c,%eax
  402c19:	74 1d                	je     402c38 <check+0x24>
  402c1b:	b9 00 00 00 00       	mov    $0x0,%ecx
  402c20:	83 f9 1f             	cmp    $0x1f,%ecx
  402c23:	7f 0d                	jg     402c32 <check+0x1e>
  402c25:	89 f8                	mov    %edi,%eax
  402c27:	d3 e8                	shr    %cl,%eax
  402c29:	3c 0a                	cmp    $0xa,%al
  402c2b:	74 11                	je     402c3e <check+0x2a>
  402c2d:	83 c1 08             	add    $0x8,%ecx
  402c30:	eb ee                	jmp    402c20 <check+0xc>
  402c32:	b8 01 00 00 00       	mov    $0x1,%eax
  402c37:	c3                   	ret
  402c38:	b8 00 00 00 00       	mov    $0x0,%eax
  402c3d:	c3                   	ret
  402c3e:	b8 00 00 00 00       	mov    $0x0,%eax
  402c43:	c3                   	ret

0000000000402c44 <gencookie>:
  402c44:	53                   	push   %rbx
  402c45:	83 c7 01             	add    $0x1,%edi
  402c48:	e8 53 e0 ff ff       	call   400ca0 <srandom@plt>
  402c4d:	e8 5e e1 ff ff       	call   400db0 <random@plt>
  402c52:	89 c3                	mov    %eax,%ebx
  402c54:	89 c7                	mov    %eax,%edi
  402c56:	e8 b9 ff ff ff       	call   402c14 <check>
  402c5b:	85 c0                	test   %eax,%eax
  402c5d:	74 ee                	je     402c4d <gencookie+0x9>
  402c5f:	89 d8                	mov    %ebx,%eax
  402c61:	5b                   	pop    %rbx
  402c62:	c3                   	ret
  402c63:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  402c6a:	00 00 00 
  402c6d:	0f 1f 00             	nopl   (%rax)

0000000000402c70 <__libc_csu_init>:
  402c70:	f3 0f 1e fa          	endbr64
  402c74:	41 57                	push   %r15
  402c76:	49 89 d7             	mov    %rdx,%r15
  402c79:	41 56                	push   %r14
  402c7b:	49 89 f6             	mov    %rsi,%r14
  402c7e:	41 55                	push   %r13
  402c80:	41 89 fd             	mov    %edi,%r13d
  402c83:	41 54                	push   %r12
  402c85:	4c 8d 25 74 21 20 00 	lea    0x202174(%rip),%r12        # 604e00 <__frame_dummy_init_array_entry>
  402c8c:	55                   	push   %rbp
  402c8d:	48 8d 2d 74 21 20 00 	lea    0x202174(%rip),%rbp        # 604e08 <__do_global_dtors_aux_fini_array_entry>
  402c94:	53                   	push   %rbx
  402c95:	4c 29 e5             	sub    %r12,%rbp
  402c98:	48 83 ec 08          	sub    $0x8,%rsp
  402c9c:	e8 a7 df ff ff       	call   400c48 <_init>
  402ca1:	48 c1 fd 03          	sar    $0x3,%rbp
  402ca5:	74 1f                	je     402cc6 <__libc_csu_init+0x56>
  402ca7:	31 db                	xor    %ebx,%ebx
  402ca9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402cb0:	4c 89 fa             	mov    %r15,%rdx
  402cb3:	4c 89 f6             	mov    %r14,%rsi
  402cb6:	44 89 ef             	mov    %r13d,%edi
  402cb9:	41 ff 14 dc          	call   *(%r12,%rbx,8)
  402cbd:	48 83 c3 01          	add    $0x1,%rbx
  402cc1:	48 39 dd             	cmp    %rbx,%rbp
  402cc4:	75 ea                	jne    402cb0 <__libc_csu_init+0x40>
  402cc6:	48 83 c4 08          	add    $0x8,%rsp
  402cca:	5b                   	pop    %rbx
  402ccb:	5d                   	pop    %rbp
  402ccc:	41 5c                	pop    %r12
  402cce:	41 5d                	pop    %r13
  402cd0:	41 5e                	pop    %r14
  402cd2:	41 5f                	pop    %r15
  402cd4:	c3                   	ret

0000000000402cd5 <.annobin___libc_csu_fini.start>:
  402cd5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402cdc:	00 00 00 00 

0000000000402ce0 <__libc_csu_fini>:
  402ce0:	f3 0f 1e fa          	endbr64
  402ce4:	c3                   	ret

Disassembly of section .fini:

0000000000402ce8 <_fini>:
  402ce8:	f3 0f 1e fa          	endbr64
  402cec:	48 83 ec 08          	sub    $0x8,%rsp
  402cf0:	48 83 c4 08          	add    $0x8,%rsp
  402cf4:	c3                   	ret
