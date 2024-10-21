
farm:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 2f 00 00 	mov    0x2fc5(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .plt.got:

0000000000001030 <__cxa_finalize@plt>:
    1030:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1036:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	31 ed                	xor    %ebp,%ebp
    1042:	49 89 d1             	mov    %rdx,%r9
    1045:	5e                   	pop    %rsi
    1046:	48 89 e2             	mov    %rsp,%rdx
    1049:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    104d:	50                   	push   %rax
    104e:	54                   	push   %rsp
    104f:	45 31 c0             	xor    %r8d,%r8d
    1052:	31 c9                	xor    %ecx,%ecx
    1054:	48 8d 3d ce 00 00 00 	lea    0xce(%rip),%rdi        # 1129 <main>
    105b:	ff 15 5f 2f 00 00    	call   *0x2f5f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1061:	f4                   	hlt
    1062:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1069:	00 00 00 
    106c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001070 <deregister_tm_clones>:
    1070:	48 8d 3d 99 2f 00 00 	lea    0x2f99(%rip),%rdi        # 4010 <__TMC_END__>
    1077:	48 8d 05 92 2f 00 00 	lea    0x2f92(%rip),%rax        # 4010 <__TMC_END__>
    107e:	48 39 f8             	cmp    %rdi,%rax
    1081:	74 15                	je     1098 <deregister_tm_clones+0x28>
    1083:	48 8b 05 3e 2f 00 00 	mov    0x2f3e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    108a:	48 85 c0             	test   %rax,%rax
    108d:	74 09                	je     1098 <deregister_tm_clones+0x28>
    108f:	ff e0                	jmp    *%rax
    1091:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1098:	c3                   	ret
    1099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010a0 <register_tm_clones>:
    10a0:	48 8d 3d 69 2f 00 00 	lea    0x2f69(%rip),%rdi        # 4010 <__TMC_END__>
    10a7:	48 8d 35 62 2f 00 00 	lea    0x2f62(%rip),%rsi        # 4010 <__TMC_END__>
    10ae:	48 29 fe             	sub    %rdi,%rsi
    10b1:	48 89 f0             	mov    %rsi,%rax
    10b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10b8:	48 c1 f8 03          	sar    $0x3,%rax
    10bc:	48 01 c6             	add    %rax,%rsi
    10bf:	48 d1 fe             	sar    $1,%rsi
    10c2:	74 14                	je     10d8 <register_tm_clones+0x38>
    10c4:	48 8b 05 0d 2f 00 00 	mov    0x2f0d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10cb:	48 85 c0             	test   %rax,%rax
    10ce:	74 08                	je     10d8 <register_tm_clones+0x38>
    10d0:	ff e0                	jmp    *%rax
    10d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <__do_global_dtors_aux>:
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	80 3d 25 2f 00 00 00 	cmpb   $0x0,0x2f25(%rip)        # 4010 <__TMC_END__>
    10eb:	75 2b                	jne    1118 <__do_global_dtors_aux+0x38>
    10ed:	55                   	push   %rbp
    10ee:	48 83 3d ea 2e 00 00 	cmpq   $0x0,0x2eea(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    10f5:	00 
    10f6:	48 89 e5             	mov    %rsp,%rbp
    10f9:	74 0c                	je     1107 <__do_global_dtors_aux+0x27>
    10fb:	48 8b 3d 06 2f 00 00 	mov    0x2f06(%rip),%rdi        # 4008 <__dso_handle>
    1102:	e8 29 ff ff ff       	call   1030 <__cxa_finalize@plt>
    1107:	e8 64 ff ff ff       	call   1070 <deregister_tm_clones>
    110c:	c6 05 fd 2e 00 00 01 	movb   $0x1,0x2efd(%rip)        # 4010 <__TMC_END__>
    1113:	5d                   	pop    %rbp
    1114:	c3                   	ret
    1115:	0f 1f 00             	nopl   (%rax)
    1118:	c3                   	ret
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <frame_dummy>:
    1120:	f3 0f 1e fa          	endbr64
    1124:	e9 77 ff ff ff       	jmp    10a0 <register_tm_clones>

0000000000001129 <main>:
    1129:	b8 00 00 00 00       	mov    $0x0,%eax
    112e:	c3                   	ret

000000000000112f <start_farm>:
    112f:	b8 01 00 00 00       	mov    $0x1,%eax
    1134:	c3                   	ret

0000000000001135 <addval_353>:
    1135:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
    113b:	c3                   	ret

000000000000113c <getval_426>:
    113c:	b8 78 90 90 c3       	mov    $0xc3909078,%eax
    1141:	c3                   	ret

0000000000001142 <addval_373>:
    1142:	8d 87 40 89 c7 c3    	lea    -0x3c3876c0(%rdi),%eax
    1148:	c3                   	ret

0000000000001149 <getval_332>:
    1149:	b8 09 48 89 c7       	mov    $0xc7894809,%eax
    114e:	c3                   	ret

000000000000114f <addval_188>:
    114f:	8d 87 4c 89 c7 c3    	lea    -0x3c3876b4(%rdi),%eax
    1155:	c3                   	ret

0000000000001156 <addval_484>:
    1156:	8d 87 b0 58 90 c3    	lea    -0x3c6fa750(%rdi),%eax
    115c:	c3                   	ret

000000000000115d <getval_316>:
    115d:	b8 69 78 90 c3       	mov    $0xc3907869,%eax
    1162:	c3                   	ret

0000000000001163 <setval_299>:
    1163:	c7 07 58 90 90 90    	movl   $0x90909058,(%rdi)
    1169:	c3                   	ret

000000000000116a <mid_farm>:
    116a:	b8 01 00 00 00       	mov    $0x1,%eax
    116f:	c3                   	ret

0000000000001170 <add_xy>:
    1170:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
    1174:	c3                   	ret

0000000000001175 <addval_409>:
    1175:	8d 87 3d 48 8b e0    	lea    -0x1f74b7c3(%rdi),%eax
    117b:	c3                   	ret

000000000000117c <addval_344>:
    117c:	8d 87 47 89 d1 90    	lea    -0x6f2e76b9(%rdi),%eax
    1182:	c3                   	ret

0000000000001183 <setval_273>:
    1183:	c7 07 89 ce 78 c0    	movl   $0xc078ce89,(%rdi)
    1189:	c3                   	ret

000000000000118a <getval_247>:
    118a:	b8 88 c2 38 db       	mov    $0xdb38c288,%eax
    118f:	c3                   	ret

0000000000001190 <setval_464>:
    1190:	c7 07 48 88 e0 90    	movl   $0x90e08848,(%rdi)
    1196:	c3                   	ret

0000000000001197 <getval_496>:
    1197:	b8 48 99 e0 c3       	mov    $0xc3e09948,%eax
    119c:	c3                   	ret

000000000000119d <setval_388>:
    119d:	c7 07 58 89 e0 c3    	movl   $0xc3e08958,(%rdi)
    11a3:	c3                   	ret

00000000000011a4 <addval_424>:
    11a4:	8d 87 89 ce a4 d2    	lea    -0x2d5b3177(%rdi),%eax
    11aa:	c3                   	ret

00000000000011ab <getval_488>:
    11ab:	b8 89 c2 94 c0       	mov    $0xc094c289,%eax
    11b0:	c3                   	ret

00000000000011b1 <getval_265>:
    11b1:	b8 31 09 d1 90       	mov    $0x90d10931,%eax
    11b6:	c3                   	ret

00000000000011b7 <setval_365>:
    11b7:	c7 07 99 d1 38 c9    	movl   $0xc938d199,(%rdi)
    11bd:	c3                   	ret

00000000000011be <getval_320>:
    11be:	b8 cc 89 c2 92       	mov    $0x92c289cc,%eax
    11c3:	c3                   	ret

00000000000011c4 <getval_355>:
    11c4:	b8 48 89 e0 92       	mov    $0x92e08948,%eax
    11c9:	c3                   	ret

00000000000011ca <setval_380>:
    11ca:	c7 07 4c a6 8d ce    	movl   $0xce8da64c,(%rdi)
    11d0:	c3                   	ret

00000000000011d1 <getval_118>:
    11d1:	b8 89 ce c4 db       	mov    $0xdbc4ce89,%eax
    11d6:	c3                   	ret

00000000000011d7 <getval_351>:
    11d7:	b8 89 c2 20 c0       	mov    $0xc020c289,%eax
    11dc:	c3                   	ret

00000000000011dd <getval_106>:
    11dd:	b8 89 c2 90 c7       	mov    $0xc790c289,%eax
    11e2:	c3                   	ret

00000000000011e3 <getval_412>:
    11e3:	b8 89 ce c4 c9       	mov    $0xc9c4ce89,%eax
    11e8:	c3                   	ret

00000000000011e9 <addval_473>:
    11e9:	8d 87 81 d1 08 c9    	lea    -0x36f72e7f(%rdi),%eax
    11ef:	c3                   	ret

00000000000011f0 <setval_217>:
    11f0:	c7 07 89 ce 84 c0    	movl   $0xc084ce89,(%rdi)
    11f6:	c3                   	ret

00000000000011f7 <setval_437>:
    11f7:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
    11fd:	c3                   	ret

00000000000011fe <addval_137>:
    11fe:	8d 87 89 ce 20 db    	lea    -0x24df3177(%rdi),%eax
    1204:	c3                   	ret

0000000000001205 <getval_446>:
    1205:	b8 d0 8d c2 c3       	mov    $0xc3c28dd0,%eax
    120a:	c3                   	ret

000000000000120b <addval_211>:
    120b:	8d 87 89 d1 30 c0    	lea    -0x3fcf2e77(%rdi),%eax
    1211:	c3                   	ret

0000000000001212 <setval_311>:
    1212:	c7 07 4a 48 89 e0    	movl   $0xe089484a,(%rdi)
    1218:	c3                   	ret

0000000000001219 <setval_124>:
    1219:	c7 07 89 d1 20 db    	movl   $0xdb20d189,(%rdi)
    121f:	c3                   	ret

0000000000001220 <setval_396>:
    1220:	c7 07 88 d1 90 c3    	movl   $0xc390d188,(%rdi)
    1226:	c3                   	ret

0000000000001227 <getval_139>:
    1227:	b8 89 d1 28 db       	mov    $0xdb28d189,%eax
    122c:	c3                   	ret

000000000000122d <getval_110>:
    122d:	b8 09 c2 08 c9       	mov    $0xc908c209,%eax
    1232:	c3                   	ret

0000000000001233 <addval_476>:
    1233:	8d 87 89 ce 28 d2    	lea    -0x2dd73177(%rdi),%eax
    1239:	c3                   	ret

000000000000123a <addval_444>:
    123a:	8d 87 89 c2 38 db    	lea    -0x24c73d77(%rdi),%eax
    1240:	c3                   	ret

0000000000001241 <getval_160>:
    1241:	b8 48 88 e0 c3       	mov    $0xc3e08848,%eax
    1246:	c3                   	ret

0000000000001247 <end_farm>:
    1247:	b8 01 00 00 00       	mov    $0x1,%eax
    124c:	c3                   	ret

Disassembly of section .fini:

0000000000001250 <_fini>:
    1250:	48 83 ec 08          	sub    $0x8,%rsp
    1254:	48 83 c4 08          	add    $0x8,%rsp
    1258:	c3                   	ret
