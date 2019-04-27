
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}


int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	81 ec 18 04 00 00    	sub    $0x418,%esp
	static char buf[100];
	int fd;
  // Assumes three file descriptors open.
	while((fd = open("console", O_RDWR)) >= 0){
      17:	eb 10                	jmp    29 <main+0x29>
      19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f ba 02 00 00    	jg     2e3 <main+0x2e3>
	while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 fd 18 00 00       	push   $0x18fd
      33:	e8 89 13 00 00       	call   13c1 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
			close(fd);
			break;
		}
	}
	struct directory *Head_Directory  =  CreateNode("/");
      3f:	83 ec 0c             	sub    $0xc,%esp
      42:	68 05 19 00 00       	push   $0x1905
      47:	e8 a4 06 00 00       	call   6f0 <CreateNode>
	struct directory *Curr = Head_Directory;
	struct directory *prev = NULL;

  // Read and run input commands.
	while(getcmd(buf, sizeof(buf)) >= 0){
      4c:	83 c4 10             	add    $0x10,%esp
	struct directory *prev = NULL;
      4f:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
      56:	00 00 00 
	struct directory *Head_Directory  =  CreateNode("/");
      59:	89 85 dc fb ff ff    	mov    %eax,-0x424(%ebp)
      5f:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
	while(getcmd(buf, sizeof(buf)) >= 0){
      65:	83 ec 08             	sub    $0x8,%esp
      68:	6a 64                	push   $0x64
      6a:	68 60 20 00 00       	push   $0x2060
      6f:	e8 ac 06 00 00       	call   720 <getcmd>
      74:	83 c4 10             	add    $0x10,%esp
      77:	85 c0                	test   %eax,%eax
      79:	0f 88 4a 03 00 00    	js     3c9 <main+0x3c9>
		if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      7f:	0f b6 05 60 20 00 00 	movzbl 0x2060,%eax
      86:	3c 63                	cmp    $0x63,%al
      88:	0f 84 42 01 00 00    	je     1d0 <main+0x1d0>
      Next->Before = Curr;
      Curr = Curr->Next;
  }
  continue;
}
if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd')
      8e:	3c 70                	cmp    $0x70,%al
      90:	75 17                	jne    a9 <main+0xa9>
      92:	0f b6 05 61 20 00 00 	movzbl 0x2061,%eax
      99:	3c 77                	cmp    $0x77,%al
      9b:	0f 84 53 02 00 00    	je     2f4 <main+0x2f4>
		iter = iter->Next;
	}
	printf(1,"\n");
	continue;
}
if(buf[0] == 'p' && buf[1] == 's')
      a1:	3c 73                	cmp    $0x73,%al
      a3:	0f 84 b6 02 00 00    	je     35f <main+0x35f>
int
fork1(void)
{
	int pid;

	pid = fork();
      a9:	e8 cb 12 00 00       	call   1379 <fork>
	if(pid == -1)
      ae:	83 f8 ff             	cmp    $0xffffffff,%eax
      b1:	0f 84 b5 05 00 00    	je     66c <main+0x66c>
if(fork1() == 0)
      b7:	85 c0                	test   %eax,%eax
      b9:	74 0d                	je     c8 <main+0xc8>
wait();
      bb:	e8 c9 12 00 00       	call   1389 <wait>
      c0:	eb a3                	jmp    65 <main+0x65>
      c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	if(buf[0] == '.' && buf[1] == '/' && buf[strlen(buf)-2] == 'h' && buf[strlen(buf)-3] == 's' && buf[strlen(buf)-4] == '.')
      c8:	80 3d 60 20 00 00 2e 	cmpb   $0x2e,0x2060
      cf:	0f 85 5e 02 00 00    	jne    333 <main+0x333>
      d5:	80 3d 61 20 00 00 2f 	cmpb   $0x2f,0x2061
      dc:	0f 85 51 02 00 00    	jne    333 <main+0x333>
      e2:	83 ec 0c             	sub    $0xc,%esp
      e5:	68 60 20 00 00       	push   $0x2060
      ea:	e8 c1 10 00 00       	call   11b0 <strlen>
      ef:	83 c4 10             	add    $0x10,%esp
      f2:	80 b8 5e 20 00 00 68 	cmpb   $0x68,0x205e(%eax)
      f9:	0f 85 34 02 00 00    	jne    333 <main+0x333>
      ff:	83 ec 0c             	sub    $0xc,%esp
     102:	68 60 20 00 00       	push   $0x2060
     107:	e8 a4 10 00 00       	call   11b0 <strlen>
     10c:	83 c4 10             	add    $0x10,%esp
     10f:	80 b8 5d 20 00 00 73 	cmpb   $0x73,0x205d(%eax)
     116:	0f 85 17 02 00 00    	jne    333 <main+0x333>
     11c:	83 ec 0c             	sub    $0xc,%esp
     11f:	68 60 20 00 00       	push   $0x2060
     124:	e8 87 10 00 00       	call   11b0 <strlen>
     129:	83 c4 10             	add    $0x10,%esp
     12c:	80 b8 5c 20 00 00 2e 	cmpb   $0x2e,0x205c(%eax)
     133:	0f 85 fa 01 00 00    	jne    333 <main+0x333>
		buf[strlen(buf)-1] = '\0';
     139:	83 ec 0c             	sub    $0xc,%esp
     13c:	68 60 20 00 00       	push   $0x2060
     141:	e8 6a 10 00 00       	call   11b0 <strlen>
		if((fd = open(&buf[2],O_RDONLY)) < 0)
     146:	5a                   	pop    %edx
     147:	59                   	pop    %ecx
     148:	6a 00                	push   $0x0
     14a:	68 62 20 00 00       	push   $0x2062
		buf[strlen(buf)-1] = '\0';
     14f:	c6 80 5f 20 00 00 00 	movb   $0x0,0x205f(%eax)
		if((fd = open(&buf[2],O_RDONLY)) < 0)
     156:	e8 66 12 00 00       	call   13c1 <open>
     15b:	83 c4 10             	add    $0x10,%esp
     15e:	89 c6                	mov    %eax,%esi
     160:	85 c0                	test   %eax,%eax
     162:	0f 88 68 01 00 00    	js     2d0 <main+0x2d0>
		int n, Counter = 0;
     168:	31 db                	xor    %ebx,%ebx
     16a:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
			n = read(fd,buff,1);
     170:	83 ec 04             	sub    $0x4,%esp
     173:	6a 01                	push   $0x1
     175:	57                   	push   %edi
     176:	56                   	push   %esi
     177:	e8 1d 12 00 00       	call   1399 <read>
			if(n < 0)
     17c:	83 c4 10             	add    $0x10,%esp
     17f:	85 c0                	test   %eax,%eax
     181:	0f 88 49 01 00 00    	js     2d0 <main+0x2d0>
			else if (n == 0)
     187:	0f 84 2e ff ff ff    	je     bb <main+0xbb>
				if(buff[0] != '\n')
     18d:	0f b6 85 e8 fb ff ff 	movzbl -0x418(%ebp),%eax
     194:	3c 0a                	cmp    $0xa,%al
     196:	74 10                	je     1a8 <main+0x1a8>
					Cmd[Counter++] = buff[0];
     198:	88 84 1d e8 fd ff ff 	mov    %al,-0x218(%ebp,%ebx,1)
     19f:	83 c3 01             	add    $0x1,%ebx
     1a2:	eb cc                	jmp    170 <main+0x170>
     1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
					Cmd[Counter] = '\0';
     1a8:	c6 84 1d e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%ebx,1)
     1af:	00 
	pid = fork();
     1b0:	e8 c4 11 00 00       	call   1379 <fork>
	if(pid == -1)
     1b5:	83 f8 ff             	cmp    $0xffffffff,%eax
     1b8:	0f 84 ae 04 00 00    	je     66c <main+0x66c>
					if(fork1() == 0)
     1be:	85 c0                	test   %eax,%eax
     1c0:	0f 84 82 01 00 00    	je     348 <main+0x348>
						wait();
     1c6:	e8 be 11 00 00       	call   1389 <wait>
					Counter = 0;
     1cb:	31 db                	xor    %ebx,%ebx
     1cd:	eb a1                	jmp    170 <main+0x170>
     1cf:	90                   	nop
		if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     1d0:	80 3d 61 20 00 00 64 	cmpb   $0x64,0x2061
     1d7:	0f 85 cc fe ff ff    	jne    a9 <main+0xa9>
     1dd:	80 3d 62 20 00 00 20 	cmpb   $0x20,0x2062
     1e4:	0f 85 bf fe ff ff    	jne    a9 <main+0xa9>
      buf[strlen(buf)-1] = 0;  // chop \n
     1ea:	83 ec 0c             	sub    $0xc,%esp
     1ed:	68 60 20 00 00       	push   $0x2060
     1f2:	e8 b9 0f 00 00       	call   11b0 <strlen>
      int returnStatus = chdir(buf+3);
     1f7:	c7 04 24 63 20 00 00 	movl   $0x2063,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     1fe:	c6 80 5f 20 00 00 00 	movb   $0x0,0x205f(%eax)
      int returnStatus = chdir(buf+3);
     205:	e8 e7 11 00 00       	call   13f1 <chdir>
      if(returnStatus < 0) {
     20a:	83 c4 10             	add    $0x10,%esp
     20d:	85 c0                	test   %eax,%eax
     20f:	0f 88 04 02 00 00    	js     419 <main+0x419>
      	if(buf[3] == '/' && buf[4] == NULL)
     215:	0f b6 05 63 20 00 00 	movzbl 0x2063,%eax
     21c:	bb 04 00 00 00       	mov    $0x4,%ebx
     221:	3c 2f                	cmp    $0x2f,%al
     223:	0f 84 a5 01 00 00    	je     3ce <main+0x3ce>
      	if(buf[3] == '.' && buf[4] == '.')
     229:	3c 2e                	cmp    $0x2e,%al
     22b:	75 15                	jne    242 <main+0x242>
     22d:	e9 cb 01 00 00       	jmp    3fd <main+0x3fd>
      		if(buf[i] == '/')
     232:	80 bb 60 20 00 00 2f 	cmpb   $0x2f,0x2060(%ebx)
     239:	0f 84 f4 01 00 00    	je     433 <main+0x433>
      	for(int i = 4;i<strlen(buf);i++)
     23f:	83 c3 01             	add    $0x1,%ebx
     242:	83 ec 0c             	sub    $0xc,%esp
     245:	68 60 20 00 00       	push   $0x2060
     24a:	e8 61 0f 00 00       	call   11b0 <strlen>
     24f:	83 c4 10             	add    $0x10,%esp
     252:	39 d8                	cmp    %ebx,%eax
     254:	77 dc                	ja     232 <main+0x232>
      if (buf[3] == '/' )
     256:	80 3d 63 20 00 00 2f 	cmpb   $0x2f,0x2063
     25d:	0f 84 92 03 00 00    	je     5f5 <main+0x5f5>
      if (Curr != Head_Directory && buf[3] != '/'){
     263:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
     269:	8b bd e0 fb ff ff    	mov    -0x420(%ebp),%edi
     26f:	89 c3                	mov    %eax,%ebx
     271:	39 c7                	cmp    %eax,%edi
     273:	74 28                	je     29d <main+0x29d>
      	Next = CreateNode("/");
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	68 05 19 00 00       	push   $0x1905
     27d:	e8 6e 04 00 00       	call   6f0 <CreateNode>
      	Curr->Before = prev;
     282:	8b 8d e4 fb ff ff    	mov    -0x41c(%ebp),%ecx
      	Curr = Curr->Next;
     288:	83 c4 10             	add    $0x10,%esp
     28b:	89 bd e4 fb ff ff    	mov    %edi,-0x41c(%ebp)
      	Curr->Next = Next;
     291:	89 47 64             	mov    %eax,0x64(%edi)
      	Curr->Before = prev;
     294:	89 4f 68             	mov    %ecx,0x68(%edi)
      	Next->Before = Curr;
     297:	89 78 68             	mov    %edi,0x68(%eax)
      	Curr = Curr->Next;
     29a:	8b 5f 64             	mov    0x64(%edi),%ebx
      Next = CreateNode(buf+3);
     29d:	83 ec 0c             	sub    $0xc,%esp
     2a0:	68 63 20 00 00       	push   $0x2063
     2a5:	e8 46 04 00 00       	call   6f0 <CreateNode>
      Curr->Before = prev;
     2aa:	8b 8d e4 fb ff ff    	mov    -0x41c(%ebp),%ecx
      Curr = Curr->Next;
     2b0:	83 c4 10             	add    $0x10,%esp
     2b3:	89 9d e4 fb ff ff    	mov    %ebx,-0x41c(%ebp)
      Curr->Next = Next;
     2b9:	89 43 64             	mov    %eax,0x64(%ebx)
      Curr->Before = prev;
     2bc:	89 4b 68             	mov    %ecx,0x68(%ebx)
      Next->Before = Curr;
     2bf:	89 58 68             	mov    %ebx,0x68(%eax)
      Curr = Curr->Next;
     2c2:	8b 43 64             	mov    0x64(%ebx),%eax
     2c5:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
     2cb:	e9 95 fd ff ff       	jmp    65 <main+0x65>
			printf(2,"Error while reading the script\n");
     2d0:	50                   	push   %eax
     2d1:	50                   	push   %eax
     2d2:	68 f0 19 00 00       	push   $0x19f0
     2d7:	6a 02                	push   $0x2
     2d9:	e8 12 12 00 00       	call   14f0 <printf>
			exit();
     2de:	e8 9e 10 00 00       	call   1381 <exit>
			close(fd);
     2e3:	83 ec 0c             	sub    $0xc,%esp
     2e6:	50                   	push   %eax
     2e7:	e8 bd 10 00 00       	call   13a9 <close>
			break;
     2ec:	83 c4 10             	add    $0x10,%esp
     2ef:	e9 4b fd ff ff       	jmp    3f <main+0x3f>
if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd')
     2f4:	80 3d 62 20 00 00 64 	cmpb   $0x64,0x2062
     2fb:	0f 85 a8 fd ff ff    	jne    a9 <main+0xa9>
	struct directory *Head_Directory  =  CreateNode("/");
     301:	8b 9d dc fb ff ff    	mov    -0x424(%ebp),%ebx
     307:	eb 10                	jmp    319 <main+0x319>
		printf(1,iter->string);
     309:	57                   	push   %edi
     30a:	57                   	push   %edi
     30b:	53                   	push   %ebx
     30c:	6a 01                	push   $0x1
     30e:	e8 dd 11 00 00       	call   14f0 <printf>
		iter = iter->Next;
     313:	8b 5b 64             	mov    0x64(%ebx),%ebx
     316:	83 c4 10             	add    $0x10,%esp
	while(iter)
     319:	85 db                	test   %ebx,%ebx
     31b:	75 ec                	jne    309 <main+0x309>
	printf(1,"\n");
     31d:	56                   	push   %esi
     31e:	56                   	push   %esi
     31f:	68 70 18 00 00       	push   $0x1870
     324:	6a 01                	push   $0x1
     326:	e8 c5 11 00 00       	call   14f0 <printf>
	continue;
     32b:	83 c4 10             	add    $0x10,%esp
     32e:	e9 32 fd ff ff       	jmp    65 <main+0x65>
		runcmd(parsecmd(buf));
     333:	83 ec 0c             	sub    $0xc,%esp
     336:	68 60 20 00 00       	push   $0x2060
     33b:	e8 80 0d 00 00       	call   10c0 <parsecmd>
     340:	89 04 24             	mov    %eax,(%esp)
     343:	e8 48 04 00 00       	call   790 <runcmd>
						runcmd(parsecmd(Cmd));
     348:	83 ec 0c             	sub    $0xc,%esp
     34b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     351:	50                   	push   %eax
     352:	e8 69 0d 00 00       	call   10c0 <parsecmd>
     357:	89 04 24             	mov    %eax,(%esp)
     35a:	e8 31 04 00 00       	call   790 <runcmd>
	printf(1, "F    S    UID    PID    PPID    SZ    WCHAN    COMD\n");
     35f:	53                   	push   %ebx
     360:	be 80 40 00 00       	mov    $0x4080,%esi
			state = "???"; 
     365:	bf f9 18 00 00       	mov    $0x18f9,%edi
	printf(1, "F    S    UID    PID    PPID    SZ    WCHAN    COMD\n");
     36a:	53                   	push   %ebx
     36b:	bb 80 21 00 00       	mov    $0x2180,%ebx
     370:	68 88 19 00 00       	push   $0x1988
     375:	6a 01                	push   $0x1
     377:	e8 74 11 00 00       	call   14f0 <printf>
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
     37c:	83 c4 10             	add    $0x10,%esp
     37f:	90                   	nop
		if (p->state == UNUSED)
     380:	8b 43 a0             	mov    -0x60(%ebx),%eax
     383:	85 c0                	test   %eax,%eax
     385:	74 36                	je     3bd <main+0x3bd>
			state = "???"; 
     387:	ba f9 18 00 00       	mov    $0x18f9,%edx
		if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
     38c:	83 f8 05             	cmp    $0x5,%eax
     38f:	77 0c                	ja     39d <main+0x39d>
     391:	8b 14 85 70 19 00 00 	mov    0x1970(,%eax,4),%edx
			state = "???"; 
     398:	85 d2                	test   %edx,%edx
     39a:	0f 44 d7             	cmove  %edi,%edx
		printf(1, "2    %s    Root    %d    %d    %d    %d    %s\n", state, p->pid, p->parent->pid,p->sz,p->chan, p->name);
     39d:	53                   	push   %ebx
     39e:	ff 73 b4             	pushl  -0x4c(%ebx)
     3a1:	ff 73 94             	pushl  -0x6c(%ebx)
     3a4:	8b 43 a8             	mov    -0x58(%ebx),%eax
     3a7:	ff 70 10             	pushl  0x10(%eax)
     3aa:	ff 73 a4             	pushl  -0x5c(%ebx)
     3ad:	52                   	push   %edx
     3ae:	68 c0 19 00 00       	push   $0x19c0
     3b3:	6a 01                	push   $0x1
     3b5:	e8 36 11 00 00       	call   14f0 <printf>
     3ba:	83 c4 20             	add    $0x20,%esp
     3bd:	83 c3 7c             	add    $0x7c,%ebx
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
     3c0:	39 de                	cmp    %ebx,%esi
     3c2:	75 bc                	jne    380 <main+0x380>
     3c4:	e9 9c fc ff ff       	jmp    65 <main+0x65>
exit();
     3c9:	e8 b3 0f 00 00       	call   1381 <exit>
      	if(buf[3] == '/' && buf[4] == NULL)
     3ce:	80 3d 64 20 00 00 00 	cmpb   $0x0,0x2064
     3d5:	0f 85 67 fe ff ff    	jne    242 <main+0x242>
      		prev = NULL;
     3db:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
     3e2:	00 00 00 
      		Curr->Next = NULL;
     3e5:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
     3eb:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
      		continue;
     3f2:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
     3f8:	e9 68 fc ff ff       	jmp    65 <main+0x65>
      	if(buf[3] == '.' && buf[4] == '.')
     3fd:	0f b6 05 64 20 00 00 	movzbl 0x2064,%eax
     404:	3c 2e                	cmp    $0x2e,%al
     406:	0f 84 27 02 00 00    	je     633 <main+0x633>
      	if(buf[3] == '.' && buf[4] == NULL)
     40c:	84 c0                	test   %al,%al
     40e:	0f 84 51 fc ff ff    	je     65 <main+0x65>
     414:	e9 29 fe ff ff       	jmp    242 <main+0x242>
      	printf(2, "cannot cd %s\n", buf + 3);
     419:	50                   	push   %eax
     41a:	68 63 20 00 00       	push   $0x2063
     41f:	68 07 19 00 00       	push   $0x1907
     424:	6a 02                	push   $0x2
     426:	e8 c5 10 00 00       	call   14f0 <printf>
     42b:	83 c4 10             	add    $0x10,%esp
     42e:	e9 32 fc ff ff       	jmp    65 <main+0x65>
      		if (buf[3] == '/')
     433:	80 3d 63 20 00 00 2f 	cmpb   $0x2f,0x2063
     43a:	75 1d                	jne    459 <main+0x459>
      			prev = NULL;
     43c:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
     443:	00 00 00 
      			Curr->Next = NULL;
     446:	8b 85 dc fb ff ff    	mov    -0x424(%ebp),%eax
     44c:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
     453:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
          		buffer[k++] = buf[i];
     459:	31 ff                	xor    %edi,%edi
     45b:	bb 03 00 00 00       	mov    $0x3,%ebx
     460:	8b b5 e0 fb ff ff    	mov    -0x420(%ebp),%esi
     466:	e9 98 00 00 00       	jmp    503 <main+0x503>
          	if ((strlen(buf) == i || i == 3) && buf[i] == '/'){
     46b:	83 fb 03             	cmp    $0x3,%ebx
     46e:	0f 84 bb 00 00 00    	je     52f <main+0x52f>
          	if (buffer[k-1] == '\0')
     474:	80 bc 3d e7 fd ff ff 	cmpb   $0x0,-0x219(%ebp,%edi,1)
     47b:	00 
     47c:	75 02                	jne    480 <main+0x480>
          		k=0;
     47e:	31 ff                	xor    %edi,%edi
          	if(buf[i] != '/'){
     480:	0f b6 83 60 20 00 00 	movzbl 0x2060(%ebx),%eax
     487:	8d 4f 01             	lea    0x1(%edi),%ecx
     48a:	89 8d e0 fb ff ff    	mov    %ecx,-0x420(%ebp)
     490:	3c 2f                	cmp    $0x2f,%al
     492:	0f 85 b5 00 00 00    	jne    54d <main+0x54d>
          		buffer[k++] = '\0';
     498:	c6 84 3d e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%edi,1)
     49f:	00 
          		if((i != 3 && buf[i] == '/') && Curr != Head_Directory)
     4a0:	3b b5 dc fb ff ff    	cmp    -0x424(%ebp),%esi
     4a6:	74 28                	je     4d0 <main+0x4d0>
          			Next = CreateNode("/");
     4a8:	83 ec 0c             	sub    $0xc,%esp
     4ab:	68 05 19 00 00       	push   $0x1905
     4b0:	e8 3b 02 00 00       	call   6f0 <CreateNode>
          			Curr->Before = prev;
     4b5:	8b 8d e4 fb ff ff    	mov    -0x41c(%ebp),%ecx
          			Curr = Curr->Next;
     4bb:	83 c4 10             	add    $0x10,%esp
     4be:	89 b5 e4 fb ff ff    	mov    %esi,-0x41c(%ebp)
          			Curr->Next = Next;
     4c4:	89 46 64             	mov    %eax,0x64(%esi)
          			Curr->Before = prev;
     4c7:	89 4e 68             	mov    %ecx,0x68(%esi)
          			Next->Before = Curr;
     4ca:	89 70 68             	mov    %esi,0x68(%eax)
          			Curr = Curr->Next;
     4cd:	8b 76 64             	mov    0x64(%esi),%esi
          		Next = CreateNode(buffer);
     4d0:	83 ec 0c             	sub    $0xc,%esp
     4d3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     4d9:	50                   	push   %eax
     4da:	e8 11 02 00 00       	call   6f0 <CreateNode>
          		Curr->Before = prev;
     4df:	8b 8d e4 fb ff ff    	mov    -0x41c(%ebp),%ecx
          		Curr = Curr->Next;
     4e5:	8b bd e0 fb ff ff    	mov    -0x420(%ebp),%edi
     4eb:	83 c4 10             	add    $0x10,%esp
          		Curr->Next = Next;
     4ee:	89 46 64             	mov    %eax,0x64(%esi)
          		Curr->Before = prev;
     4f1:	89 4e 68             	mov    %ecx,0x68(%esi)
          		Curr = Curr->Next;
     4f4:	89 b5 e4 fb ff ff    	mov    %esi,-0x41c(%ebp)
          		Next->Before = Curr;
     4fa:	89 70 68             	mov    %esi,0x68(%eax)
          		Curr = Curr->Next;
     4fd:	8b 76 64             	mov    0x64(%esi),%esi
          for(int i=3,k=0;i<strlen(buf);i++)// YET TO BE PERFECTED(several directory climb)
     500:	83 c3 01             	add    $0x1,%ebx
     503:	83 ec 0c             	sub    $0xc,%esp
     506:	68 60 20 00 00       	push   $0x2060
     50b:	e8 a0 0c 00 00       	call   11b0 <strlen>
     510:	83 c4 10             	add    $0x10,%esp
     513:	39 d8                	cmp    %ebx,%eax
     515:	76 6a                	jbe    581 <main+0x581>
          	if ((strlen(buf) == i || i == 3) && buf[i] == '/'){
     517:	83 ec 0c             	sub    $0xc,%esp
     51a:	68 60 20 00 00       	push   $0x2060
     51f:	e8 8c 0c 00 00       	call   11b0 <strlen>
     524:	83 c4 10             	add    $0x10,%esp
     527:	39 d8                	cmp    %ebx,%eax
     529:	0f 85 3c ff ff ff    	jne    46b <main+0x46b>
     52f:	0f b6 83 60 20 00 00 	movzbl 0x2060(%ebx),%eax
     536:	3c 2f                	cmp    $0x2f,%al
     538:	74 c6                	je     500 <main+0x500>
          	if (buffer[k-1] == '\0')
     53a:	80 bc 3d e7 fd ff ff 	cmpb   $0x0,-0x219(%ebp,%edi,1)
     541:	00 
     542:	74 2f                	je     573 <main+0x573>
     544:	8d 4f 01             	lea    0x1(%edi),%ecx
     547:	89 8d e0 fb ff ff    	mov    %ecx,-0x420(%ebp)
          		buffer[k++] = buf[i];
     54d:	88 84 3d e8 fd ff ff 	mov    %al,-0x218(%ebp,%edi,1)
          		printf(1,"%s\n",buffer);
     554:	50                   	push   %eax
     555:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     55b:	50                   	push   %eax
     55c:	68 f5 18 00 00       	push   $0x18f5
     561:	6a 01                	push   $0x1
     563:	e8 88 0f 00 00       	call   14f0 <printf>
          		continue;
     568:	83 c4 10             	add    $0x10,%esp
          		buffer[k++] = buf[i];
     56b:	8b bd e0 fb ff ff    	mov    -0x420(%ebp),%edi
          		continue;
     571:	eb 8d                	jmp    500 <main+0x500>
     573:	c7 85 e0 fb ff ff 01 	movl   $0x1,-0x420(%ebp)
     57a:	00 00 00 
          		k=0;
     57d:	31 ff                	xor    %edi,%edi
     57f:	eb cc                	jmp    54d <main+0x54d>
          if (buf[strlen(buf)] != '/'){
     581:	83 ec 0c             	sub    $0xc,%esp
     584:	89 b5 e0 fb ff ff    	mov    %esi,-0x420(%ebp)
     58a:	89 f7                	mov    %esi,%edi
     58c:	68 60 20 00 00       	push   $0x2060
     591:	e8 1a 0c 00 00       	call   11b0 <strlen>
     596:	83 c4 10             	add    $0x10,%esp
     599:	80 b8 60 20 00 00 2f 	cmpb   $0x2f,0x2060(%eax)
     5a0:	0f 84 bf fa ff ff    	je     65 <main+0x65>
          	Next = CreateNode("/");
     5a6:	83 ec 0c             	sub    $0xc,%esp
     5a9:	68 05 19 00 00       	push   $0x1905
     5ae:	e8 3d 01 00 00       	call   6f0 <CreateNode>
          	Curr->Before = prev;
     5b3:	8b 8d e4 fb ff ff    	mov    -0x41c(%ebp),%ecx
          	Curr->Next = Next;
     5b9:	89 46 64             	mov    %eax,0x64(%esi)
          	Curr->Before = prev;
     5bc:	89 4e 68             	mov    %ecx,0x68(%esi)
          	Next->Before = Curr;
     5bf:	89 70 68             	mov    %esi,0x68(%eax)
          	Curr = Curr->Next;
     5c2:	8b 4e 64             	mov    0x64(%esi),%ecx
          	Next = CreateNode(buffer);
     5c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     5cb:	89 04 24             	mov    %eax,(%esp)
          	Curr = Curr->Next;
     5ce:	89 ce                	mov    %ecx,%esi
     5d0:	89 8d e4 fb ff ff    	mov    %ecx,-0x41c(%ebp)
          	Next = CreateNode(buffer);
     5d6:	e8 15 01 00 00       	call   6f0 <CreateNode>
          	Curr->Before = prev;
     5db:	89 7e 68             	mov    %edi,0x68(%esi)
          	Curr = Curr->Next;
     5de:	83 c4 10             	add    $0x10,%esp
          	Curr->Next = Next;
     5e1:	89 46 64             	mov    %eax,0x64(%esi)
          	Next->Before = Curr;
     5e4:	89 70 68             	mov    %esi,0x68(%eax)
          	Curr = Curr->Next;
     5e7:	8b 46 64             	mov    0x64(%esi),%eax
     5ea:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
          continue;
     5f0:	e9 70 fa ff ff       	jmp    65 <main+0x65>
      	Curr->Next = NULL;
     5f5:	8b bd dc fb ff ff    	mov    -0x424(%ebp),%edi
      	Next = CreateNode(buf+4);
     5fb:	83 ec 0c             	sub    $0xc,%esp
      	Curr->Next = NULL;
     5fe:	c7 47 64 00 00 00 00 	movl   $0x0,0x64(%edi)
      	Next = CreateNode(buf+4);
     605:	68 64 20 00 00       	push   $0x2064
     60a:	e8 e1 00 00 00       	call   6f0 <CreateNode>
      	Curr->Before = prev;
     60f:	c7 47 68 00 00 00 00 	movl   $0x0,0x68(%edi)
      	continue;
     616:	83 c4 10             	add    $0x10,%esp
      	Curr->Next = Next;
     619:	89 47 64             	mov    %eax,0x64(%edi)
      	Next->Before = Curr;
     61c:	89 78 68             	mov    %edi,0x68(%eax)
      	Curr = Curr->Next;
     61f:	8b 4f 64             	mov    0x64(%edi),%ecx
      	continue;
     622:	89 bd e4 fb ff ff    	mov    %edi,-0x41c(%ebp)
      	Curr = Curr->Next;
     628:	89 8d e0 fb ff ff    	mov    %ecx,-0x420(%ebp)
      	continue;
     62e:	e9 32 fa ff ff       	jmp    65 <main+0x65>
      		if(Curr != Head_Directory)
     633:	8b 85 e0 fb ff ff    	mov    -0x420(%ebp),%eax
     639:	8b 8d dc fb ff ff    	mov    -0x424(%ebp),%ecx
     63f:	39 c8                	cmp    %ecx,%eax
     641:	0f 84 1e fa ff ff    	je     65 <main+0x65>
      			if(Curr->Before == Head_Directory)
     647:	8b 40 68             	mov    0x68(%eax),%eax
     64a:	39 c8                	cmp    %ecx,%eax
     64c:	74 2b                	je     679 <main+0x679>
      			Curr = Curr->Before->Before;
     64e:	8b 40 68             	mov    0x68(%eax),%eax
     651:	89 85 e0 fb ff ff    	mov    %eax,-0x420(%ebp)
      			Curr->Next = NULL;
     657:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
      			prev = Curr->Before;
     65e:	8b 40 68             	mov    0x68(%eax),%eax
     661:	89 85 e4 fb ff ff    	mov    %eax,-0x41c(%ebp)
     667:	e9 f9 f9 ff ff       	jmp    65 <main+0x65>
		panic("fork");
     66c:	83 ec 0c             	sub    $0xc,%esp
     66f:	68 82 18 00 00       	push   $0x1882
     674:	e8 f7 00 00 00       	call   770 <panic>
      				Curr->Next = NULL;
     679:	c7 41 64 00 00 00 00 	movl   $0x0,0x64(%ecx)
      				continue;
     680:	89 8d e0 fb ff ff    	mov    %ecx,-0x420(%ebp)
      				prev = NULL;
     686:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
     68d:	00 00 00 
      				continue;
     690:	e9 d0 f9 ff ff       	jmp    65 <main+0x65>
     695:	66 90                	xchg   %ax,%ax
     697:	66 90                	xchg   %ax,%ax
     699:	66 90                	xchg   %ax,%ax
     69b:	66 90                	xchg   %ax,%ax
     69d:	66 90                	xchg   %ax,%ax
     69f:	90                   	nop

000006a0 <strcat>:
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	53                   	push   %ebx
     6a4:	8b 45 08             	mov    0x8(%ebp),%eax
     6a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	while(*strg1 != '\0')
     6aa:	80 38 00             	cmpb   $0x0,(%eax)
     6ad:	89 c2                	mov    %eax,%edx
     6af:	74 27                	je     6d8 <strcat+0x38>
     6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		strg1++;
     6b8:	83 c2 01             	add    $0x1,%edx
	while(*strg1 != '\0')
     6bb:	80 3a 00             	cmpb   $0x0,(%edx)
     6be:	75 f8                	jne    6b8 <strcat+0x18>
	while(*strg2 != '\0')
     6c0:	0f b6 0b             	movzbl (%ebx),%ecx
     6c3:	84 c9                	test   %cl,%cl
     6c5:	74 18                	je     6df <strcat+0x3f>
     6c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6ce:	66 90                	xchg   %ax,%ax
		*strg1 = *strg2;
     6d0:	88 0a                	mov    %cl,(%edx)
		strg2++;
     6d2:	83 c3 01             	add    $0x1,%ebx
		strg1++;
     6d5:	83 c2 01             	add    $0x1,%edx
	while(*strg2 != '\0')
     6d8:	0f b6 0b             	movzbl (%ebx),%ecx
     6db:	84 c9                	test   %cl,%cl
     6dd:	75 f1                	jne    6d0 <strcat+0x30>
	*strg1 = '\0';
     6df:	c6 02 00             	movb   $0x0,(%edx)
}
     6e2:	5b                   	pop    %ebx
     6e3:	5d                   	pop    %ebp
     6e4:	c3                   	ret    
     6e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006f0 <CreateNode>:
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	53                   	push   %ebx
     6f4:	83 ec 10             	sub    $0x10,%esp
	struct directory* Temp = malloc(sizeof(struct directory));
     6f7:	6a 6c                	push   $0x6c
     6f9:	e8 52 10 00 00       	call   1750 <malloc>
     6fe:	89 c3                	mov    %eax,%ebx
	strcpy(Temp->string,Str);
     700:	58                   	pop    %eax
     701:	5a                   	pop    %edx
     702:	ff 75 08             	pushl  0x8(%ebp)
     705:	53                   	push   %ebx
     706:	e8 25 0a 00 00       	call   1130 <strcpy>
	Temp->Before = Temp->Next = NULL;
     70b:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
}
     712:	89 d8                	mov    %ebx,%eax
	Temp->Before = Temp->Next = NULL;
     714:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
}
     71b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     71e:	c9                   	leave  
     71f:	c3                   	ret    

00000720 <getcmd>:
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	56                   	push   %esi
     724:	53                   	push   %ebx
     725:	8b 75 0c             	mov    0xc(%ebp),%esi
     728:	8b 5d 08             	mov    0x8(%ebp),%ebx
	printf(2, "$ ");
     72b:	83 ec 08             	sub    $0x8,%esp
     72e:	68 58 18 00 00       	push   $0x1858
     733:	6a 02                	push   $0x2
     735:	e8 b6 0d 00 00       	call   14f0 <printf>
	memset(buf, 0, nbuf);
     73a:	83 c4 0c             	add    $0xc,%esp
     73d:	56                   	push   %esi
     73e:	6a 00                	push   $0x0
     740:	53                   	push   %ebx
     741:	e8 9a 0a 00 00       	call   11e0 <memset>
	gets(buf, nbuf);
     746:	58                   	pop    %eax
     747:	5a                   	pop    %edx
     748:	56                   	push   %esi
     749:	53                   	push   %ebx
     74a:	e8 f1 0a 00 00       	call   1240 <gets>
  if(buf[0] == 0) // EOF
     74f:	83 c4 10             	add    $0x10,%esp
     752:	31 c0                	xor    %eax,%eax
     754:	80 3b 00             	cmpb   $0x0,(%ebx)
     757:	0f 94 c0             	sete   %al
}
     75a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     75d:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
     75e:	f7 d8                	neg    %eax
}
     760:	5e                   	pop    %esi
     761:	5d                   	pop    %ebp
     762:	c3                   	ret    
     763:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000770 <panic>:
{
     770:	55                   	push   %ebp
     771:	89 e5                	mov    %esp,%ebp
     773:	83 ec 0c             	sub    $0xc,%esp
	printf(2, "%s\n", s);
     776:	ff 75 08             	pushl  0x8(%ebp)
     779:	68 f5 18 00 00       	push   $0x18f5
     77e:	6a 02                	push   $0x2
     780:	e8 6b 0d 00 00       	call   14f0 <printf>
	exit();
     785:	e8 f7 0b 00 00       	call   1381 <exit>
     78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000790 <runcmd>:
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
	char Point[] = "/" ;
     795:	be 2f 00 00 00       	mov    $0x2f,%esi
{
     79a:	53                   	push   %ebx
     79b:	83 ec 1c             	sub    $0x1c,%esp
     79e:	8b 5d 08             	mov    0x8(%ebp),%ebx
	char Point[] = "/" ;
     7a1:	66 89 75 de          	mov    %si,-0x22(%ebp)
	if(cmd == 0)
     7a5:	85 db                	test   %ebx,%ebx
     7a7:	74 77                	je     820 <runcmd+0x90>
	switch(cmd->type){
     7a9:	83 3b 05             	cmpl   $0x5,(%ebx)
     7ac:	0f 87 2c 01 00 00    	ja     8de <runcmd+0x14e>
     7b2:	8b 03                	mov    (%ebx),%eax
     7b4:	ff 24 85 40 19 00 00 	jmp    *0x1940(,%eax,4)
		if(pipe(p) < 0)
     7bb:	83 ec 0c             	sub    $0xc,%esp
     7be:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7c1:	50                   	push   %eax
     7c2:	e8 ca 0b 00 00       	call   1391 <pipe>
     7c7:	83 c4 10             	add    $0x10,%esp
     7ca:	85 c0                	test   %eax,%eax
     7cc:	0f 88 2e 01 00 00    	js     900 <runcmd+0x170>
	pid = fork();
     7d2:	e8 a2 0b 00 00       	call   1379 <fork>
	if(pid == -1)
     7d7:	83 f8 ff             	cmp    $0xffffffff,%eax
     7da:	0f 84 89 01 00 00    	je     969 <runcmd+0x1d9>
		if(fork1() == 0){
     7e0:	85 c0                	test   %eax,%eax
     7e2:	0f 84 25 01 00 00    	je     90d <runcmd+0x17d>
	pid = fork();
     7e8:	e8 8c 0b 00 00       	call   1379 <fork>
	if(pid == -1)
     7ed:	83 f8 ff             	cmp    $0xffffffff,%eax
     7f0:	0f 84 73 01 00 00    	je     969 <runcmd+0x1d9>
		if(fork1() == 0){
     7f6:	85 c0                	test   %eax,%eax
     7f8:	0f 84 3d 01 00 00    	je     93b <runcmd+0x1ab>
		close(p[0]);
     7fe:	83 ec 0c             	sub    $0xc,%esp
     801:	ff 75 e0             	pushl  -0x20(%ebp)
     804:	e8 a0 0b 00 00       	call   13a9 <close>
		close(p[1]);
     809:	58                   	pop    %eax
     80a:	ff 75 e4             	pushl  -0x1c(%ebp)
     80d:	e8 97 0b 00 00       	call   13a9 <close>
		wait();
     812:	e8 72 0b 00 00       	call   1389 <wait>
		wait();
     817:	e8 6d 0b 00 00       	call   1389 <wait>
		break;
     81c:	83 c4 10             	add    $0x10,%esp
     81f:	90                   	nop
		exit();
     820:	e8 5c 0b 00 00       	call   1381 <exit>
	pid = fork();
     825:	e8 4f 0b 00 00       	call   1379 <fork>
	if(pid == -1)
     82a:	83 f8 ff             	cmp    $0xffffffff,%eax
     82d:	0f 84 36 01 00 00    	je     969 <runcmd+0x1d9>
		if(fork1() == 0)
     833:	85 c0                	test   %eax,%eax
     835:	75 e9                	jne    820 <runcmd+0x90>
     837:	eb 78                	jmp    8b1 <runcmd+0x121>
		if(ecmd->argv[0] == 0)
     839:	8b 53 04             	mov    0x4(%ebx),%edx
     83c:	85 d2                	test   %edx,%edx
     83e:	74 e0                	je     820 <runcmd+0x90>
		exec(strcat(Point,ecmd->argv[0]), ecmd->argv);
     840:	8d 75 de             	lea    -0x22(%ebp),%esi
     843:	8d 7b 04             	lea    0x4(%ebx),%edi
     846:	89 f0                	mov    %esi,%eax
     848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     84f:	90                   	nop
		strg1++;
     850:	83 c0 01             	add    $0x1,%eax
	while(*strg1 != '\0')
     853:	80 38 00             	cmpb   $0x0,(%eax)
     856:	75 f8                	jne    850 <runcmd+0xc0>
     858:	eb 0e                	jmp    868 <runcmd+0xd8>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		*strg1 = *strg2;
     860:	88 08                	mov    %cl,(%eax)
		strg2++;
     862:	83 c2 01             	add    $0x1,%edx
		strg1++;
     865:	83 c0 01             	add    $0x1,%eax
	while(*strg2 != '\0')
     868:	0f b6 0a             	movzbl (%edx),%ecx
     86b:	84 c9                	test   %cl,%cl
     86d:	75 f1                	jne    860 <runcmd+0xd0>
	*strg1 = '\0';
     86f:	c6 00 00             	movb   $0x0,(%eax)
		exec(strcat(Point,ecmd->argv[0]), ecmd->argv);
     872:	51                   	push   %ecx
     873:	51                   	push   %ecx
     874:	57                   	push   %edi
     875:	56                   	push   %esi
     876:	e8 3e 0b 00 00       	call   13b9 <exec>
		printf(2, "exec %s failed\n", ecmd->argv[0]);
     87b:	83 c4 0c             	add    $0xc,%esp
     87e:	ff 73 04             	pushl  0x4(%ebx)
     881:	68 62 18 00 00       	push   $0x1862
     886:	6a 02                	push   $0x2
     888:	e8 63 0c 00 00       	call   14f0 <printf>
		break;
     88d:	83 c4 10             	add    $0x10,%esp
     890:	eb 8e                	jmp    820 <runcmd+0x90>
		close(rcmd->fd);
     892:	83 ec 0c             	sub    $0xc,%esp
     895:	ff 73 14             	pushl  0x14(%ebx)
     898:	e8 0c 0b 00 00       	call   13a9 <close>
		if(open(rcmd->file, rcmd->mode) < 0){
     89d:	58                   	pop    %eax
     89e:	5a                   	pop    %edx
     89f:	ff 73 10             	pushl  0x10(%ebx)
     8a2:	ff 73 08             	pushl  0x8(%ebx)
     8a5:	e8 17 0b 00 00       	call   13c1 <open>
     8aa:	83 c4 10             	add    $0x10,%esp
     8ad:	85 c0                	test   %eax,%eax
     8af:	78 3a                	js     8eb <runcmd+0x15b>
			runcmd(bcmd->cmd);
     8b1:	83 ec 0c             	sub    $0xc,%esp
     8b4:	ff 73 04             	pushl  0x4(%ebx)
     8b7:	e8 d4 fe ff ff       	call   790 <runcmd>
	pid = fork();
     8bc:	e8 b8 0a 00 00       	call   1379 <fork>
	if(pid == -1)
     8c1:	83 f8 ff             	cmp    $0xffffffff,%eax
     8c4:	0f 84 9f 00 00 00    	je     969 <runcmd+0x1d9>
		if(fork1() == 0)
     8ca:	85 c0                	test   %eax,%eax
     8cc:	74 e3                	je     8b1 <runcmd+0x121>
		wait();
     8ce:	e8 b6 0a 00 00       	call   1389 <wait>
		runcmd(lcmd->right);
     8d3:	83 ec 0c             	sub    $0xc,%esp
     8d6:	ff 73 08             	pushl  0x8(%ebx)
     8d9:	e8 b2 fe ff ff       	call   790 <runcmd>
		panic("runcmd");
     8de:	83 ec 0c             	sub    $0xc,%esp
     8e1:	68 5b 18 00 00       	push   $0x185b
     8e6:	e8 85 fe ff ff       	call   770 <panic>
			printf(2, "open %s failed\n", rcmd->file);
     8eb:	50                   	push   %eax
     8ec:	ff 73 08             	pushl  0x8(%ebx)
     8ef:	68 72 18 00 00       	push   $0x1872
     8f4:	6a 02                	push   $0x2
     8f6:	e8 f5 0b 00 00       	call   14f0 <printf>
			exit();
     8fb:	e8 81 0a 00 00       	call   1381 <exit>
			panic("pipe");
     900:	83 ec 0c             	sub    $0xc,%esp
     903:	68 87 18 00 00       	push   $0x1887
     908:	e8 63 fe ff ff       	call   770 <panic>
			close(1);
     90d:	83 ec 0c             	sub    $0xc,%esp
     910:	6a 01                	push   $0x1
     912:	e8 92 0a 00 00       	call   13a9 <close>
			dup(p[1]);
     917:	58                   	pop    %eax
     918:	ff 75 e4             	pushl  -0x1c(%ebp)
     91b:	e8 d9 0a 00 00       	call   13f9 <dup>
			close(p[0]);
     920:	58                   	pop    %eax
     921:	ff 75 e0             	pushl  -0x20(%ebp)
     924:	e8 80 0a 00 00       	call   13a9 <close>
			close(p[1]);
     929:	58                   	pop    %eax
     92a:	ff 75 e4             	pushl  -0x1c(%ebp)
     92d:	e8 77 0a 00 00       	call   13a9 <close>
			runcmd(pcmd->left);
     932:	58                   	pop    %eax
     933:	ff 73 04             	pushl  0x4(%ebx)
     936:	e8 55 fe ff ff       	call   790 <runcmd>
			close(0);
     93b:	83 ec 0c             	sub    $0xc,%esp
     93e:	6a 00                	push   $0x0
     940:	e8 64 0a 00 00       	call   13a9 <close>
			dup(p[0]);
     945:	5a                   	pop    %edx
     946:	ff 75 e0             	pushl  -0x20(%ebp)
     949:	e8 ab 0a 00 00       	call   13f9 <dup>
			close(p[0]);
     94e:	59                   	pop    %ecx
     94f:	ff 75 e0             	pushl  -0x20(%ebp)
     952:	e8 52 0a 00 00       	call   13a9 <close>
			close(p[1]);
     957:	5e                   	pop    %esi
     958:	ff 75 e4             	pushl  -0x1c(%ebp)
     95b:	e8 49 0a 00 00       	call   13a9 <close>
			runcmd(pcmd->right);
     960:	5f                   	pop    %edi
     961:	ff 73 08             	pushl  0x8(%ebx)
     964:	e8 27 fe ff ff       	call   790 <runcmd>
		panic("fork");
     969:	83 ec 0c             	sub    $0xc,%esp
     96c:	68 82 18 00 00       	push   $0x1882
     971:	e8 fa fd ff ff       	call   770 <panic>
     976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     97d:	8d 76 00             	lea    0x0(%esi),%esi

00000980 <fork1>:
{
     980:	55                   	push   %ebp
     981:	89 e5                	mov    %esp,%ebp
     983:	83 ec 08             	sub    $0x8,%esp
	pid = fork();
     986:	e8 ee 09 00 00       	call   1379 <fork>
	if(pid == -1)
     98b:	83 f8 ff             	cmp    $0xffffffff,%eax
     98e:	74 02                	je     992 <fork1+0x12>
	return pid;
}
     990:	c9                   	leave  
     991:	c3                   	ret    
		panic("fork");
     992:	83 ec 0c             	sub    $0xc,%esp
     995:	68 82 18 00 00       	push   $0x1882
     99a:	e8 d1 fd ff ff       	call   770 <panic>
     99f:	90                   	nop

000009a0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	53                   	push   %ebx
     9a4:	83 ec 10             	sub    $0x10,%esp
	struct execcmd *cmd;
	cmd = malloc(sizeof(*cmd));
     9a7:	6a 54                	push   $0x54
     9a9:	e8 a2 0d 00 00       	call   1750 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     9ae:	83 c4 0c             	add    $0xc,%esp
     9b1:	6a 54                	push   $0x54
	cmd = malloc(sizeof(*cmd));
     9b3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     9b5:	6a 00                	push   $0x0
     9b7:	50                   	push   %eax
     9b8:	e8 23 08 00 00       	call   11e0 <memset>
	cmd->type = EXEC;
     9bd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
	return (struct cmd*)cmd;
}
     9c3:	89 d8                	mov    %ebx,%eax
     9c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9c8:	c9                   	leave  
     9c9:	c3                   	ret    
     9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	53                   	push   %ebx
     9d4:	83 ec 10             	sub    $0x10,%esp
	struct redircmd *cmd;

	cmd = malloc(sizeof(*cmd));
     9d7:	6a 18                	push   $0x18
     9d9:	e8 72 0d 00 00       	call   1750 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     9de:	83 c4 0c             	add    $0xc,%esp
     9e1:	6a 18                	push   $0x18
	cmd = malloc(sizeof(*cmd));
     9e3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     9e5:	6a 00                	push   $0x0
     9e7:	50                   	push   %eax
     9e8:	e8 f3 07 00 00       	call   11e0 <memset>
	cmd->type = REDIR;
	cmd->cmd = subcmd;
     9ed:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = REDIR;
     9f0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
	cmd->cmd = subcmd;
     9f6:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->file = file;
     9f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     9fc:	89 43 08             	mov    %eax,0x8(%ebx)
	cmd->efile = efile;
     9ff:	8b 45 10             	mov    0x10(%ebp),%eax
     a02:	89 43 0c             	mov    %eax,0xc(%ebx)
	cmd->mode = mode;
     a05:	8b 45 14             	mov    0x14(%ebp),%eax
     a08:	89 43 10             	mov    %eax,0x10(%ebx)
	cmd->fd = fd;
     a0b:	8b 45 18             	mov    0x18(%ebp),%eax
     a0e:	89 43 14             	mov    %eax,0x14(%ebx)
	return (struct cmd*)cmd;
}
     a11:	89 d8                	mov    %ebx,%eax
     a13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a16:	c9                   	leave  
     a17:	c3                   	ret    
     a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a1f:	90                   	nop

00000a20 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	53                   	push   %ebx
     a24:	83 ec 10             	sub    $0x10,%esp
	struct pipecmd *cmd;

	cmd = malloc(sizeof(*cmd));
     a27:	6a 0c                	push   $0xc
     a29:	e8 22 0d 00 00       	call   1750 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     a2e:	83 c4 0c             	add    $0xc,%esp
     a31:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     a33:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     a35:	6a 00                	push   $0x0
     a37:	50                   	push   %eax
     a38:	e8 a3 07 00 00       	call   11e0 <memset>
	cmd->type = PIPE;
	cmd->left = left;
     a3d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = PIPE;
     a40:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
	cmd->left = left;
     a46:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     a49:	8b 45 0c             	mov    0xc(%ebp),%eax
     a4c:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd*)cmd;
}
     a4f:	89 d8                	mov    %ebx,%eax
     a51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a54:	c9                   	leave  
     a55:	c3                   	ret    
     a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a5d:	8d 76 00             	lea    0x0(%esi),%esi

00000a60 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	53                   	push   %ebx
     a64:	83 ec 10             	sub    $0x10,%esp
	struct listcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     a67:	6a 0c                	push   $0xc
     a69:	e8 e2 0c 00 00       	call   1750 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     a6e:	83 c4 0c             	add    $0xc,%esp
     a71:	6a 0c                	push   $0xc
	cmd = malloc(sizeof(*cmd));
     a73:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     a75:	6a 00                	push   $0x0
     a77:	50                   	push   %eax
     a78:	e8 63 07 00 00       	call   11e0 <memset>
	cmd->type = LIST;
	cmd->left = left;
     a7d:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = LIST;
     a80:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
	cmd->left = left;
     a86:	89 43 04             	mov    %eax,0x4(%ebx)
	cmd->right = right;
     a89:	8b 45 0c             	mov    0xc(%ebp),%eax
     a8c:	89 43 08             	mov    %eax,0x8(%ebx)
	return (struct cmd*)cmd;
}
     a8f:	89 d8                	mov    %ebx,%eax
     a91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a94:	c9                   	leave  
     a95:	c3                   	ret    
     a96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a9d:	8d 76 00             	lea    0x0(%esi),%esi

00000aa0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	83 ec 10             	sub    $0x10,%esp
	struct backcmd *cmd;

	cmd = malloc(sizeof(*cmd));
     aa7:	6a 08                	push   $0x8
     aa9:	e8 a2 0c 00 00       	call   1750 <malloc>
	memset(cmd, 0, sizeof(*cmd));
     aae:	83 c4 0c             	add    $0xc,%esp
     ab1:	6a 08                	push   $0x8
	cmd = malloc(sizeof(*cmd));
     ab3:	89 c3                	mov    %eax,%ebx
	memset(cmd, 0, sizeof(*cmd));
     ab5:	6a 00                	push   $0x0
     ab7:	50                   	push   %eax
     ab8:	e8 23 07 00 00       	call   11e0 <memset>
	cmd->type = BACK;
	cmd->cmd = subcmd;
     abd:	8b 45 08             	mov    0x8(%ebp),%eax
	cmd->type = BACK;
     ac0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
	cmd->cmd = subcmd;
     ac6:	89 43 04             	mov    %eax,0x4(%ebx)
	return (struct cmd*)cmd;
}
     ac9:	89 d8                	mov    %ebx,%eax
     acb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ace:	c9                   	leave  
     acf:	c3                   	ret    

00000ad0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	57                   	push   %edi
     ad4:	56                   	push   %esi
     ad5:	53                   	push   %ebx
     ad6:	83 ec 0c             	sub    $0xc,%esp
	char *s;
	int ret;

	s = *ps;
     ad9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     adc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     adf:	8b 7d 10             	mov    0x10(%ebp),%edi
	s = *ps;
     ae2:	8b 30                	mov    (%eax),%esi
	while(s < es && strchr(whitespace, *s))
     ae4:	39 de                	cmp    %ebx,%esi
     ae6:	72 0f                	jb     af7 <gettoken+0x27>
     ae8:	eb 25                	jmp    b0f <gettoken+0x3f>
     aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		s++;
     af0:	83 c6 01             	add    $0x1,%esi
	while(s < es && strchr(whitespace, *s))
     af3:	39 f3                	cmp    %esi,%ebx
     af5:	74 18                	je     b0f <gettoken+0x3f>
     af7:	0f be 06             	movsbl (%esi),%eax
     afa:	83 ec 08             	sub    $0x8,%esp
     afd:	50                   	push   %eax
     afe:	68 4c 20 00 00       	push   $0x204c
     b03:	e8 f8 06 00 00       	call   1200 <strchr>
     b08:	83 c4 10             	add    $0x10,%esp
     b0b:	85 c0                	test   %eax,%eax
     b0d:	75 e1                	jne    af0 <gettoken+0x20>
	if(q)
     b0f:	85 ff                	test   %edi,%edi
     b11:	74 02                	je     b15 <gettoken+0x45>
		*q = s;
     b13:	89 37                	mov    %esi,(%edi)
	ret = *s;
     b15:	0f be 06             	movsbl (%esi),%eax
	switch(*s){
     b18:	3c 29                	cmp    $0x29,%al
     b1a:	0f 8f b8 00 00 00    	jg     bd8 <gettoken+0x108>
     b20:	3c 28                	cmp    $0x28,%al
     b22:	0f 8d de 00 00 00    	jge    c06 <gettoken+0x136>
     b28:	31 ff                	xor    %edi,%edi
     b2a:	84 c0                	test   %al,%al
     b2c:	75 42                	jne    b70 <gettoken+0xa0>
		ret = 'a';
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
			s++;
		break;
	}
	if(eq)
     b2e:	8b 55 14             	mov    0x14(%ebp),%edx
     b31:	85 d2                	test   %edx,%edx
     b33:	74 05                	je     b3a <gettoken+0x6a>
		*eq = s;
     b35:	8b 45 14             	mov    0x14(%ebp),%eax
     b38:	89 30                	mov    %esi,(%eax)

	while(s < es && strchr(whitespace, *s))
     b3a:	39 de                	cmp    %ebx,%esi
     b3c:	72 09                	jb     b47 <gettoken+0x77>
     b3e:	eb 1f                	jmp    b5f <gettoken+0x8f>
		s++;
     b40:	83 c6 01             	add    $0x1,%esi
	while(s < es && strchr(whitespace, *s))
     b43:	39 f3                	cmp    %esi,%ebx
     b45:	74 18                	je     b5f <gettoken+0x8f>
     b47:	0f be 06             	movsbl (%esi),%eax
     b4a:	83 ec 08             	sub    $0x8,%esp
     b4d:	50                   	push   %eax
     b4e:	68 4c 20 00 00       	push   $0x204c
     b53:	e8 a8 06 00 00       	call   1200 <strchr>
     b58:	83 c4 10             	add    $0x10,%esp
     b5b:	85 c0                	test   %eax,%eax
     b5d:	75 e1                	jne    b40 <gettoken+0x70>
	*ps = s;
     b5f:	8b 45 08             	mov    0x8(%ebp),%eax
     b62:	89 30                	mov    %esi,(%eax)
	return ret;
}
     b64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b67:	89 f8                	mov    %edi,%eax
     b69:	5b                   	pop    %ebx
     b6a:	5e                   	pop    %esi
     b6b:	5f                   	pop    %edi
     b6c:	5d                   	pop    %ebp
     b6d:	c3                   	ret    
     b6e:	66 90                	xchg   %ax,%ax
	switch(*s){
     b70:	3c 26                	cmp    $0x26,%al
     b72:	0f 84 8e 00 00 00    	je     c06 <gettoken+0x136>
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     b78:	39 f3                	cmp    %esi,%ebx
     b7a:	77 36                	ja     bb2 <gettoken+0xe2>
	if(eq)
     b7c:	8b 45 14             	mov    0x14(%ebp),%eax
     b7f:	bf 61 00 00 00       	mov    $0x61,%edi
     b84:	85 c0                	test   %eax,%eax
     b86:	75 ad                	jne    b35 <gettoken+0x65>
     b88:	eb d5                	jmp    b5f <gettoken+0x8f>
     b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     b90:	0f be 06             	movsbl (%esi),%eax
     b93:	83 ec 08             	sub    $0x8,%esp
     b96:	50                   	push   %eax
     b97:	68 44 20 00 00       	push   $0x2044
     b9c:	e8 5f 06 00 00       	call   1200 <strchr>
     ba1:	83 c4 10             	add    $0x10,%esp
     ba4:	85 c0                	test   %eax,%eax
     ba6:	75 1f                	jne    bc7 <gettoken+0xf7>
			s++;
     ba8:	83 c6 01             	add    $0x1,%esi
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     bab:	39 f3                	cmp    %esi,%ebx
     bad:	74 cd                	je     b7c <gettoken+0xac>
     baf:	0f be 06             	movsbl (%esi),%eax
     bb2:	83 ec 08             	sub    $0x8,%esp
     bb5:	50                   	push   %eax
     bb6:	68 4c 20 00 00       	push   $0x204c
     bbb:	e8 40 06 00 00       	call   1200 <strchr>
     bc0:	83 c4 10             	add    $0x10,%esp
     bc3:	85 c0                	test   %eax,%eax
     bc5:	74 c9                	je     b90 <gettoken+0xc0>
		ret = 'a';
     bc7:	bf 61 00 00 00       	mov    $0x61,%edi
     bcc:	e9 5d ff ff ff       	jmp    b2e <gettoken+0x5e>
     bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	switch(*s){
     bd8:	3c 3e                	cmp    $0x3e,%al
     bda:	75 1c                	jne    bf8 <gettoken+0x128>
		if(*s == '>'){
     bdc:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
		s++;
     be0:	8d 46 01             	lea    0x1(%esi),%eax
		if(*s == '>'){
     be3:	74 3c                	je     c21 <gettoken+0x151>
		s++;
     be5:	89 c6                	mov    %eax,%esi
     be7:	bf 3e 00 00 00       	mov    $0x3e,%edi
     bec:	e9 3d ff ff ff       	jmp    b2e <gettoken+0x5e>
     bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	switch(*s){
     bf8:	7f 1e                	jg     c18 <gettoken+0x148>
     bfa:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     bfd:	80 f9 01             	cmp    $0x1,%cl
     c00:	0f 87 72 ff ff ff    	ja     b78 <gettoken+0xa8>
	ret = *s;
     c06:	0f be f8             	movsbl %al,%edi
		s++;
     c09:	83 c6 01             	add    $0x1,%esi
		break;
     c0c:	e9 1d ff ff ff       	jmp    b2e <gettoken+0x5e>
     c11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	switch(*s){
     c18:	3c 7c                	cmp    $0x7c,%al
     c1a:	74 ea                	je     c06 <gettoken+0x136>
     c1c:	e9 57 ff ff ff       	jmp    b78 <gettoken+0xa8>
			s++;
     c21:	83 c6 02             	add    $0x2,%esi
			ret = '+';
     c24:	bf 2b 00 00 00       	mov    $0x2b,%edi
     c29:	e9 00 ff ff ff       	jmp    b2e <gettoken+0x5e>
     c2e:	66 90                	xchg   %ax,%ax

00000c30 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	57                   	push   %edi
     c34:	56                   	push   %esi
     c35:	53                   	push   %ebx
     c36:	83 ec 0c             	sub    $0xc,%esp
     c39:	8b 7d 08             	mov    0x8(%ebp),%edi
     c3c:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *s;

	s = *ps;
     c3f:	8b 1f                	mov    (%edi),%ebx
	while(s < es && strchr(whitespace, *s))
     c41:	39 f3                	cmp    %esi,%ebx
     c43:	72 12                	jb     c57 <peek+0x27>
     c45:	eb 28                	jmp    c6f <peek+0x3f>
     c47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c4e:	66 90                	xchg   %ax,%ax
		s++;
     c50:	83 c3 01             	add    $0x1,%ebx
	while(s < es && strchr(whitespace, *s))
     c53:	39 de                	cmp    %ebx,%esi
     c55:	74 18                	je     c6f <peek+0x3f>
     c57:	0f be 03             	movsbl (%ebx),%eax
     c5a:	83 ec 08             	sub    $0x8,%esp
     c5d:	50                   	push   %eax
     c5e:	68 4c 20 00 00       	push   $0x204c
     c63:	e8 98 05 00 00       	call   1200 <strchr>
     c68:	83 c4 10             	add    $0x10,%esp
     c6b:	85 c0                	test   %eax,%eax
     c6d:	75 e1                	jne    c50 <peek+0x20>
	*ps = s;
     c6f:	89 1f                	mov    %ebx,(%edi)
	return *s && strchr(toks, *s);
     c71:	0f be 13             	movsbl (%ebx),%edx
     c74:	31 c0                	xor    %eax,%eax
     c76:	84 d2                	test   %dl,%dl
     c78:	75 0e                	jne    c88 <peek+0x58>
}
     c7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7d:	5b                   	pop    %ebx
     c7e:	5e                   	pop    %esi
     c7f:	5f                   	pop    %edi
     c80:	5d                   	pop    %ebp
     c81:	c3                   	ret    
     c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	return *s && strchr(toks, *s);
     c88:	83 ec 08             	sub    $0x8,%esp
     c8b:	52                   	push   %edx
     c8c:	ff 75 10             	pushl  0x10(%ebp)
     c8f:	e8 6c 05 00 00       	call   1200 <strchr>
     c94:	83 c4 10             	add    $0x10,%esp
     c97:	85 c0                	test   %eax,%eax
     c99:	0f 95 c0             	setne  %al
}
     c9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c9f:	5b                   	pop    %ebx
	return *s && strchr(toks, *s);
     ca0:	0f b6 c0             	movzbl %al,%eax
}
     ca3:	5e                   	pop    %esi
     ca4:	5f                   	pop    %edi
     ca5:	5d                   	pop    %ebp
     ca6:	c3                   	ret    
     ca7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cae:	66 90                	xchg   %ax,%ax

00000cb0 <parseredirs>:
	return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	57                   	push   %edi
     cb4:	56                   	push   %esi
     cb5:	53                   	push   %ebx
     cb6:	83 ec 1c             	sub    $0x1c,%esp
     cb9:	8b 75 0c             	mov    0xc(%ebp),%esi
     cbc:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int tok;
	char *q, *eq;

	while(peek(ps, es, "<>")){
     cbf:	90                   	nop
     cc0:	83 ec 04             	sub    $0x4,%esp
     cc3:	68 a9 18 00 00       	push   $0x18a9
     cc8:	53                   	push   %ebx
     cc9:	56                   	push   %esi
     cca:	e8 61 ff ff ff       	call   c30 <peek>
     ccf:	83 c4 10             	add    $0x10,%esp
     cd2:	85 c0                	test   %eax,%eax
     cd4:	74 6a                	je     d40 <parseredirs+0x90>
		tok = gettoken(ps, es, 0, 0);
     cd6:	6a 00                	push   $0x0
     cd8:	6a 00                	push   $0x0
     cda:	53                   	push   %ebx
     cdb:	56                   	push   %esi
     cdc:	e8 ef fd ff ff       	call   ad0 <gettoken>
     ce1:	89 c7                	mov    %eax,%edi
		if(gettoken(ps, es, &q, &eq) != 'a')
     ce3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     ce6:	50                   	push   %eax
     ce7:	8d 45 e0             	lea    -0x20(%ebp),%eax
     cea:	50                   	push   %eax
     ceb:	53                   	push   %ebx
     cec:	56                   	push   %esi
     ced:	e8 de fd ff ff       	call   ad0 <gettoken>
     cf2:	83 c4 20             	add    $0x20,%esp
     cf5:	83 f8 61             	cmp    $0x61,%eax
     cf8:	75 51                	jne    d4b <parseredirs+0x9b>
			panic("missing file for redirection");
		switch(tok){
     cfa:	83 ff 3c             	cmp    $0x3c,%edi
     cfd:	74 31                	je     d30 <parseredirs+0x80>
     cff:	83 ff 3e             	cmp    $0x3e,%edi
     d02:	74 05                	je     d09 <parseredirs+0x59>
     d04:	83 ff 2b             	cmp    $0x2b,%edi
     d07:	75 b7                	jne    cc0 <parseredirs+0x10>
			break;
			case '>':
			cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
			break;
    case '+':  // >>
    cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     d09:	83 ec 0c             	sub    $0xc,%esp
     d0c:	6a 01                	push   $0x1
     d0e:	68 01 02 00 00       	push   $0x201
     d13:	ff 75 e4             	pushl  -0x1c(%ebp)
     d16:	ff 75 e0             	pushl  -0x20(%ebp)
     d19:	ff 75 08             	pushl  0x8(%ebp)
     d1c:	e8 af fc ff ff       	call   9d0 <redircmd>
    break;
     d21:	83 c4 20             	add    $0x20,%esp
    cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     d24:	89 45 08             	mov    %eax,0x8(%ebp)
    break;
     d27:	eb 97                	jmp    cc0 <parseredirs+0x10>
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     d30:	83 ec 0c             	sub    $0xc,%esp
     d33:	6a 00                	push   $0x0
     d35:	6a 00                	push   $0x0
     d37:	eb da                	jmp    d13 <parseredirs+0x63>
     d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
}
return cmd;
}
     d40:	8b 45 08             	mov    0x8(%ebp),%eax
     d43:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d46:	5b                   	pop    %ebx
     d47:	5e                   	pop    %esi
     d48:	5f                   	pop    %edi
     d49:	5d                   	pop    %ebp
     d4a:	c3                   	ret    
			panic("missing file for redirection");
     d4b:	83 ec 0c             	sub    $0xc,%esp
     d4e:	68 8c 18 00 00       	push   $0x188c
     d53:	e8 18 fa ff ff       	call   770 <panic>
     d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5f:	90                   	nop

00000d60 <parseexec>:
	return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	57                   	push   %edi
     d64:	56                   	push   %esi
     d65:	53                   	push   %ebx
     d66:	83 ec 30             	sub    $0x30,%esp
     d69:	8b 75 08             	mov    0x8(%ebp),%esi
     d6c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	char *q, *eq;
	int tok, argc;
	struct execcmd *cmd;
	struct cmd *ret;

	if(peek(ps, es, "("))
     d6f:	68 ac 18 00 00       	push   $0x18ac
     d74:	57                   	push   %edi
     d75:	56                   	push   %esi
     d76:	e8 b5 fe ff ff       	call   c30 <peek>
     d7b:	83 c4 10             	add    $0x10,%esp
     d7e:	85 c0                	test   %eax,%eax
     d80:	0f 85 92 00 00 00    	jne    e18 <parseexec+0xb8>
     d86:	89 c3                	mov    %eax,%ebx
		return parseblock(ps, es);

	ret = execcmd();
     d88:	e8 13 fc ff ff       	call   9a0 <execcmd>
	cmd = (struct execcmd*)ret;

	argc = 0;
	ret = parseredirs(ret, ps, es);
     d8d:	83 ec 04             	sub    $0x4,%esp
     d90:	57                   	push   %edi
     d91:	56                   	push   %esi
     d92:	50                   	push   %eax
	ret = execcmd();
     d93:	89 45 d0             	mov    %eax,-0x30(%ebp)
	ret = parseredirs(ret, ps, es);
     d96:	e8 15 ff ff ff       	call   cb0 <parseredirs>
     d9b:	83 c4 10             	add    $0x10,%esp
     d9e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	while(!peek(ps, es, "|)&;")){
     da1:	eb 18                	jmp    dbb <parseexec+0x5b>
     da3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     da7:	90                   	nop
		cmd->argv[argc] = q;
		cmd->eargv[argc] = eq;
		argc++;
		if(argc >= MAXARGS)
			panic("too many args");
		ret = parseredirs(ret, ps, es);
     da8:	83 ec 04             	sub    $0x4,%esp
     dab:	57                   	push   %edi
     dac:	56                   	push   %esi
     dad:	ff 75 d4             	pushl  -0x2c(%ebp)
     db0:	e8 fb fe ff ff       	call   cb0 <parseredirs>
     db5:	83 c4 10             	add    $0x10,%esp
     db8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	while(!peek(ps, es, "|)&;")){
     dbb:	83 ec 04             	sub    $0x4,%esp
     dbe:	68 c3 18 00 00       	push   $0x18c3
     dc3:	57                   	push   %edi
     dc4:	56                   	push   %esi
     dc5:	e8 66 fe ff ff       	call   c30 <peek>
     dca:	83 c4 10             	add    $0x10,%esp
     dcd:	85 c0                	test   %eax,%eax
     dcf:	75 67                	jne    e38 <parseexec+0xd8>
		if((tok=gettoken(ps, es, &q, &eq)) == 0)
     dd1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     dd4:	50                   	push   %eax
     dd5:	8d 45 e0             	lea    -0x20(%ebp),%eax
     dd8:	50                   	push   %eax
     dd9:	57                   	push   %edi
     dda:	56                   	push   %esi
     ddb:	e8 f0 fc ff ff       	call   ad0 <gettoken>
     de0:	83 c4 10             	add    $0x10,%esp
     de3:	85 c0                	test   %eax,%eax
     de5:	74 51                	je     e38 <parseexec+0xd8>
		if(tok != 'a')
     de7:	83 f8 61             	cmp    $0x61,%eax
     dea:	75 6b                	jne    e57 <parseexec+0xf7>
		cmd->argv[argc] = q;
     dec:	8b 45 e0             	mov    -0x20(%ebp),%eax
     def:	8b 55 d0             	mov    -0x30(%ebp),%edx
     df2:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
		cmd->eargv[argc] = eq;
     df6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     df9:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
		argc++;
     dfd:	83 c3 01             	add    $0x1,%ebx
		if(argc >= MAXARGS)
     e00:	83 fb 0a             	cmp    $0xa,%ebx
     e03:	75 a3                	jne    da8 <parseexec+0x48>
			panic("too many args");
     e05:	83 ec 0c             	sub    $0xc,%esp
     e08:	68 b5 18 00 00       	push   $0x18b5
     e0d:	e8 5e f9 ff ff       	call   770 <panic>
     e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		return parseblock(ps, es);
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	57                   	push   %edi
     e1c:	56                   	push   %esi
     e1d:	e8 5e 01 00 00       	call   f80 <parseblock>
     e22:	83 c4 10             	add    $0x10,%esp
     e25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	}
	cmd->argv[argc] = 0;
	cmd->eargv[argc] = 0;
	return ret;
}
     e28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e2e:	5b                   	pop    %ebx
     e2f:	5e                   	pop    %esi
     e30:	5f                   	pop    %edi
     e31:	5d                   	pop    %ebp
     e32:	c3                   	ret    
     e33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e37:	90                   	nop
	cmd->argv[argc] = 0;
     e38:	8b 45 d0             	mov    -0x30(%ebp),%eax
     e3b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
     e3e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	cmd->eargv[argc] = 0;
     e45:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     e4c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e52:	5b                   	pop    %ebx
     e53:	5e                   	pop    %esi
     e54:	5f                   	pop    %edi
     e55:	5d                   	pop    %ebp
     e56:	c3                   	ret    
			panic("syntax");
     e57:	83 ec 0c             	sub    $0xc,%esp
     e5a:	68 ae 18 00 00       	push   $0x18ae
     e5f:	e8 0c f9 ff ff       	call   770 <panic>
     e64:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e6f:	90                   	nop

00000e70 <parsepipe>:
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	56                   	push   %esi
     e75:	53                   	push   %ebx
     e76:	83 ec 14             	sub    $0x14,%esp
     e79:	8b 5d 08             	mov    0x8(%ebp),%ebx
     e7c:	8b 75 0c             	mov    0xc(%ebp),%esi
	cmd = parseexec(ps, es);
     e7f:	56                   	push   %esi
     e80:	53                   	push   %ebx
     e81:	e8 da fe ff ff       	call   d60 <parseexec>
	if(peek(ps, es, "|")){
     e86:	83 c4 0c             	add    $0xc,%esp
     e89:	68 c8 18 00 00       	push   $0x18c8
	cmd = parseexec(ps, es);
     e8e:	89 c7                	mov    %eax,%edi
	if(peek(ps, es, "|")){
     e90:	56                   	push   %esi
     e91:	53                   	push   %ebx
     e92:	e8 99 fd ff ff       	call   c30 <peek>
     e97:	83 c4 10             	add    $0x10,%esp
     e9a:	85 c0                	test   %eax,%eax
     e9c:	75 12                	jne    eb0 <parsepipe+0x40>
}
     e9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ea1:	89 f8                	mov    %edi,%eax
     ea3:	5b                   	pop    %ebx
     ea4:	5e                   	pop    %esi
     ea5:	5f                   	pop    %edi
     ea6:	5d                   	pop    %ebp
     ea7:	c3                   	ret    
     ea8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eaf:	90                   	nop
		gettoken(ps, es, 0, 0);
     eb0:	6a 00                	push   $0x0
     eb2:	6a 00                	push   $0x0
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	e8 15 fc ff ff       	call   ad0 <gettoken>
		cmd = pipecmd(cmd, parsepipe(ps, es));
     ebb:	58                   	pop    %eax
     ebc:	5a                   	pop    %edx
     ebd:	56                   	push   %esi
     ebe:	53                   	push   %ebx
     ebf:	e8 ac ff ff ff       	call   e70 <parsepipe>
     ec4:	89 7d 08             	mov    %edi,0x8(%ebp)
     ec7:	83 c4 10             	add    $0x10,%esp
     eca:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     ecd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ed0:	5b                   	pop    %ebx
     ed1:	5e                   	pop    %esi
     ed2:	5f                   	pop    %edi
     ed3:	5d                   	pop    %ebp
		cmd = pipecmd(cmd, parsepipe(ps, es));
     ed4:	e9 47 fb ff ff       	jmp    a20 <pipecmd>
     ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ee0 <parseline>:
{
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	57                   	push   %edi
     ee4:	56                   	push   %esi
     ee5:	53                   	push   %ebx
     ee6:	83 ec 14             	sub    $0x14,%esp
     ee9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     eec:	8b 75 0c             	mov    0xc(%ebp),%esi
	cmd = parsepipe(ps, es);
     eef:	56                   	push   %esi
     ef0:	53                   	push   %ebx
     ef1:	e8 7a ff ff ff       	call   e70 <parsepipe>
	while(peek(ps, es, "&")){
     ef6:	83 c4 10             	add    $0x10,%esp
	cmd = parsepipe(ps, es);
     ef9:	89 c7                	mov    %eax,%edi
	while(peek(ps, es, "&")){
     efb:	eb 1b                	jmp    f18 <parseline+0x38>
     efd:	8d 76 00             	lea    0x0(%esi),%esi
		gettoken(ps, es, 0, 0);
     f00:	6a 00                	push   $0x0
     f02:	6a 00                	push   $0x0
     f04:	56                   	push   %esi
     f05:	53                   	push   %ebx
     f06:	e8 c5 fb ff ff       	call   ad0 <gettoken>
		cmd = backcmd(cmd);
     f0b:	89 3c 24             	mov    %edi,(%esp)
     f0e:	e8 8d fb ff ff       	call   aa0 <backcmd>
     f13:	83 c4 10             	add    $0x10,%esp
     f16:	89 c7                	mov    %eax,%edi
	while(peek(ps, es, "&")){
     f18:	83 ec 04             	sub    $0x4,%esp
     f1b:	68 ca 18 00 00       	push   $0x18ca
     f20:	56                   	push   %esi
     f21:	53                   	push   %ebx
     f22:	e8 09 fd ff ff       	call   c30 <peek>
     f27:	83 c4 10             	add    $0x10,%esp
     f2a:	85 c0                	test   %eax,%eax
     f2c:	75 d2                	jne    f00 <parseline+0x20>
	if(peek(ps, es, ";")){
     f2e:	83 ec 04             	sub    $0x4,%esp
     f31:	68 c6 18 00 00       	push   $0x18c6
     f36:	56                   	push   %esi
     f37:	53                   	push   %ebx
     f38:	e8 f3 fc ff ff       	call   c30 <peek>
     f3d:	83 c4 10             	add    $0x10,%esp
     f40:	85 c0                	test   %eax,%eax
     f42:	75 0c                	jne    f50 <parseline+0x70>
}
     f44:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f47:	89 f8                	mov    %edi,%eax
     f49:	5b                   	pop    %ebx
     f4a:	5e                   	pop    %esi
     f4b:	5f                   	pop    %edi
     f4c:	5d                   	pop    %ebp
     f4d:	c3                   	ret    
     f4e:	66 90                	xchg   %ax,%ax
		gettoken(ps, es, 0, 0);
     f50:	6a 00                	push   $0x0
     f52:	6a 00                	push   $0x0
     f54:	56                   	push   %esi
     f55:	53                   	push   %ebx
     f56:	e8 75 fb ff ff       	call   ad0 <gettoken>
		cmd = listcmd(cmd, parseline(ps, es));
     f5b:	58                   	pop    %eax
     f5c:	5a                   	pop    %edx
     f5d:	56                   	push   %esi
     f5e:	53                   	push   %ebx
     f5f:	e8 7c ff ff ff       	call   ee0 <parseline>
     f64:	89 7d 08             	mov    %edi,0x8(%ebp)
     f67:	83 c4 10             	add    $0x10,%esp
     f6a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     f6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f70:	5b                   	pop    %ebx
     f71:	5e                   	pop    %esi
     f72:	5f                   	pop    %edi
     f73:	5d                   	pop    %ebp
		cmd = listcmd(cmd, parseline(ps, es));
     f74:	e9 e7 fa ff ff       	jmp    a60 <listcmd>
     f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f80 <parseblock>:
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	57                   	push   %edi
     f84:	56                   	push   %esi
     f85:	53                   	push   %ebx
     f86:	83 ec 10             	sub    $0x10,%esp
     f89:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f8c:	8b 75 0c             	mov    0xc(%ebp),%esi
	if(!peek(ps, es, "("))
     f8f:	68 ac 18 00 00       	push   $0x18ac
     f94:	56                   	push   %esi
     f95:	53                   	push   %ebx
     f96:	e8 95 fc ff ff       	call   c30 <peek>
     f9b:	83 c4 10             	add    $0x10,%esp
     f9e:	85 c0                	test   %eax,%eax
     fa0:	74 4a                	je     fec <parseblock+0x6c>
	gettoken(ps, es, 0, 0);
     fa2:	6a 00                	push   $0x0
     fa4:	6a 00                	push   $0x0
     fa6:	56                   	push   %esi
     fa7:	53                   	push   %ebx
     fa8:	e8 23 fb ff ff       	call   ad0 <gettoken>
	cmd = parseline(ps, es);
     fad:	58                   	pop    %eax
     fae:	5a                   	pop    %edx
     faf:	56                   	push   %esi
     fb0:	53                   	push   %ebx
     fb1:	e8 2a ff ff ff       	call   ee0 <parseline>
	if(!peek(ps, es, ")"))
     fb6:	83 c4 0c             	add    $0xc,%esp
     fb9:	68 e8 18 00 00       	push   $0x18e8
	cmd = parseline(ps, es);
     fbe:	89 c7                	mov    %eax,%edi
	if(!peek(ps, es, ")"))
     fc0:	56                   	push   %esi
     fc1:	53                   	push   %ebx
     fc2:	e8 69 fc ff ff       	call   c30 <peek>
     fc7:	83 c4 10             	add    $0x10,%esp
     fca:	85 c0                	test   %eax,%eax
     fcc:	74 2b                	je     ff9 <parseblock+0x79>
	gettoken(ps, es, 0, 0);
     fce:	6a 00                	push   $0x0
     fd0:	6a 00                	push   $0x0
     fd2:	56                   	push   %esi
     fd3:	53                   	push   %ebx
     fd4:	e8 f7 fa ff ff       	call   ad0 <gettoken>
	cmd = parseredirs(cmd, ps, es);
     fd9:	83 c4 0c             	add    $0xc,%esp
     fdc:	56                   	push   %esi
     fdd:	53                   	push   %ebx
     fde:	57                   	push   %edi
     fdf:	e8 cc fc ff ff       	call   cb0 <parseredirs>
}
     fe4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fe7:	5b                   	pop    %ebx
     fe8:	5e                   	pop    %esi
     fe9:	5f                   	pop    %edi
     fea:	5d                   	pop    %ebp
     feb:	c3                   	ret    
		panic("parseblock");
     fec:	83 ec 0c             	sub    $0xc,%esp
     fef:	68 cc 18 00 00       	push   $0x18cc
     ff4:	e8 77 f7 ff ff       	call   770 <panic>
		panic("syntax - missing )");
     ff9:	83 ec 0c             	sub    $0xc,%esp
     ffc:	68 d7 18 00 00       	push   $0x18d7
    1001:	e8 6a f7 ff ff       	call   770 <panic>
    1006:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100d:	8d 76 00             	lea    0x0(%esi),%esi

00001010 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	83 ec 04             	sub    $0x4,%esp
    1017:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct execcmd *ecmd;
	struct listcmd *lcmd;
	struct pipecmd *pcmd;
	struct redircmd *rcmd;

	if(cmd == 0)
    101a:	85 db                	test   %ebx,%ebx
    101c:	74 20                	je     103e <nulterminate+0x2e>
		return 0;

	switch(cmd->type){
    101e:	83 3b 05             	cmpl   $0x5,(%ebx)
    1021:	77 1b                	ja     103e <nulterminate+0x2e>
    1023:	8b 03                	mov    (%ebx),%eax
    1025:	ff 24 85 58 19 00 00 	jmp    *0x1958(,%eax,4)
    102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		nulterminate(lcmd->right);
		break;

		case BACK:
		bcmd = (struct backcmd*)cmd;
		nulterminate(bcmd->cmd);
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 73 04             	pushl  0x4(%ebx)
    1036:	e8 d5 ff ff ff       	call   1010 <nulterminate>
		break;
    103b:	83 c4 10             	add    $0x10,%esp
	}
	return cmd;
}
    103e:	89 d8                	mov    %ebx,%eax
    1040:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1043:	c9                   	leave  
    1044:	c3                   	ret    
    1045:	8d 76 00             	lea    0x0(%esi),%esi
		nulterminate(lcmd->left);
    1048:	83 ec 0c             	sub    $0xc,%esp
    104b:	ff 73 04             	pushl  0x4(%ebx)
    104e:	e8 bd ff ff ff       	call   1010 <nulterminate>
		nulterminate(lcmd->right);
    1053:	58                   	pop    %eax
    1054:	ff 73 08             	pushl  0x8(%ebx)
    1057:	e8 b4 ff ff ff       	call   1010 <nulterminate>
}
    105c:	89 d8                	mov    %ebx,%eax
		break;
    105e:	83 c4 10             	add    $0x10,%esp
}
    1061:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1064:	c9                   	leave  
    1065:	c3                   	ret    
    1066:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106d:	8d 76 00             	lea    0x0(%esi),%esi
		for(i=0; ecmd->argv[i]; i++)
    1070:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1073:	8d 43 08             	lea    0x8(%ebx),%eax
    1076:	85 c9                	test   %ecx,%ecx
    1078:	74 c4                	je     103e <nulterminate+0x2e>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			*ecmd->eargv[i] = 0;
    1080:	8b 50 24             	mov    0x24(%eax),%edx
    1083:	83 c0 04             	add    $0x4,%eax
    1086:	c6 02 00             	movb   $0x0,(%edx)
		for(i=0; ecmd->argv[i]; i++)
    1089:	8b 50 fc             	mov    -0x4(%eax),%edx
    108c:	85 d2                	test   %edx,%edx
    108e:	75 f0                	jne    1080 <nulterminate+0x70>
}
    1090:	89 d8                	mov    %ebx,%eax
    1092:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1095:	c9                   	leave  
    1096:	c3                   	ret    
    1097:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109e:	66 90                	xchg   %ax,%ax
		nulterminate(rcmd->cmd);
    10a0:	83 ec 0c             	sub    $0xc,%esp
    10a3:	ff 73 04             	pushl  0x4(%ebx)
    10a6:	e8 65 ff ff ff       	call   1010 <nulterminate>
		*rcmd->efile = 0;
    10ab:	8b 43 0c             	mov    0xc(%ebx),%eax
		break;
    10ae:	83 c4 10             	add    $0x10,%esp
		*rcmd->efile = 0;
    10b1:	c6 00 00             	movb   $0x0,(%eax)
}
    10b4:	89 d8                	mov    %ebx,%eax
    10b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10b9:	c9                   	leave  
    10ba:	c3                   	ret    
    10bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop

000010c0 <parsecmd>:
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	56                   	push   %esi
    10c4:	53                   	push   %ebx
	es = s + strlen(s);
    10c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10c8:	83 ec 0c             	sub    $0xc,%esp
    10cb:	53                   	push   %ebx
    10cc:	e8 df 00 00 00       	call   11b0 <strlen>
	cmd = parseline(&s, es);
    10d1:	59                   	pop    %ecx
    10d2:	5e                   	pop    %esi
	es = s + strlen(s);
    10d3:	01 c3                	add    %eax,%ebx
	cmd = parseline(&s, es);
    10d5:	8d 45 08             	lea    0x8(%ebp),%eax
    10d8:	53                   	push   %ebx
    10d9:	50                   	push   %eax
    10da:	e8 01 fe ff ff       	call   ee0 <parseline>
	peek(&s, es, "");
    10df:	83 c4 0c             	add    $0xc,%esp
	cmd = parseline(&s, es);
    10e2:	89 c6                	mov    %eax,%esi
	peek(&s, es, "");
    10e4:	8d 45 08             	lea    0x8(%ebp),%eax
    10e7:	68 71 18 00 00       	push   $0x1871
    10ec:	53                   	push   %ebx
    10ed:	50                   	push   %eax
    10ee:	e8 3d fb ff ff       	call   c30 <peek>
	if(s != es){
    10f3:	8b 45 08             	mov    0x8(%ebp),%eax
    10f6:	83 c4 10             	add    $0x10,%esp
    10f9:	39 d8                	cmp    %ebx,%eax
    10fb:	75 12                	jne    110f <parsecmd+0x4f>
	nulterminate(cmd);
    10fd:	83 ec 0c             	sub    $0xc,%esp
    1100:	56                   	push   %esi
    1101:	e8 0a ff ff ff       	call   1010 <nulterminate>
}
    1106:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1109:	89 f0                	mov    %esi,%eax
    110b:	5b                   	pop    %ebx
    110c:	5e                   	pop    %esi
    110d:	5d                   	pop    %ebp
    110e:	c3                   	ret    
		printf(2, "leftovers: %s\n", s);
    110f:	52                   	push   %edx
    1110:	50                   	push   %eax
    1111:	68 ea 18 00 00       	push   $0x18ea
    1116:	6a 02                	push   $0x2
    1118:	e8 d3 03 00 00       	call   14f0 <printf>
		panic("syntax");
    111d:	c7 04 24 ae 18 00 00 	movl   $0x18ae,(%esp)
    1124:	e8 47 f6 ff ff       	call   770 <panic>
    1129:	66 90                	xchg   %ax,%ax
    112b:	66 90                	xchg   %ax,%ax
    112d:	66 90                	xchg   %ax,%ax
    112f:	90                   	nop

00001130 <strcpy>:
    1130:	55                   	push   %ebp
    1131:	31 d2                	xor    %edx,%edx
    1133:	89 e5                	mov    %esp,%ebp
    1135:	53                   	push   %ebx
    1136:	8b 45 08             	mov    0x8(%ebp),%eax
    1139:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1140:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
    1144:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1147:	83 c2 01             	add    $0x1,%edx
    114a:	84 c9                	test   %cl,%cl
    114c:	75 f2                	jne    1140 <strcpy+0x10>
    114e:	5b                   	pop    %ebx
    114f:	5d                   	pop    %ebp
    1150:	c3                   	ret    
    1151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1158:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115f:	90                   	nop

00001160 <strcmp>:
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	56                   	push   %esi
    1164:	53                   	push   %ebx
    1165:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1168:	8b 75 0c             	mov    0xc(%ebp),%esi
    116b:	0f b6 13             	movzbl (%ebx),%edx
    116e:	0f b6 0e             	movzbl (%esi),%ecx
    1171:	84 d2                	test   %dl,%dl
    1173:	74 1e                	je     1193 <strcmp+0x33>
    1175:	b8 01 00 00 00       	mov    $0x1,%eax
    117a:	38 ca                	cmp    %cl,%dl
    117c:	74 09                	je     1187 <strcmp+0x27>
    117e:	eb 20                	jmp    11a0 <strcmp+0x40>
    1180:	83 c0 01             	add    $0x1,%eax
    1183:	38 ca                	cmp    %cl,%dl
    1185:	75 19                	jne    11a0 <strcmp+0x40>
    1187:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    118b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
    118f:	84 d2                	test   %dl,%dl
    1191:	75 ed                	jne    1180 <strcmp+0x20>
    1193:	31 c0                	xor    %eax,%eax
    1195:	5b                   	pop    %ebx
    1196:	5e                   	pop    %esi
    1197:	29 c8                	sub    %ecx,%eax
    1199:	5d                   	pop    %ebp
    119a:	c3                   	ret    
    119b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    119f:	90                   	nop
    11a0:	0f b6 c2             	movzbl %dl,%eax
    11a3:	5b                   	pop    %ebx
    11a4:	5e                   	pop    %esi
    11a5:	29 c8                	sub    %ecx,%eax
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011b0 <strlen>:
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11b6:	80 39 00             	cmpb   $0x0,(%ecx)
    11b9:	74 15                	je     11d0 <strlen+0x20>
    11bb:	31 d2                	xor    %edx,%edx
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    11c0:	83 c2 01             	add    $0x1,%edx
    11c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11c7:	89 d0                	mov    %edx,%eax
    11c9:	75 f5                	jne    11c0 <strlen+0x10>
    11cb:	5d                   	pop    %ebp
    11cc:	c3                   	ret    
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    11d0:	31 c0                	xor    %eax,%eax
    11d2:	5d                   	pop    %ebp
    11d3:	c3                   	ret    
    11d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11df:	90                   	nop

000011e0 <memset>:
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	8b 55 08             	mov    0x8(%ebp),%edx
    11e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ed:	89 d7                	mov    %edx,%edi
    11ef:	fc                   	cld    
    11f0:	f3 aa                	rep stos %al,%es:(%edi)
    11f2:	89 d0                	mov    %edx,%eax
    11f4:	5f                   	pop    %edi
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11fe:	66 90                	xchg   %ax,%ax

00001200 <strchr>:
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	53                   	push   %ebx
    1204:	8b 45 08             	mov    0x8(%ebp),%eax
    1207:	8b 55 0c             	mov    0xc(%ebp),%edx
    120a:	0f b6 18             	movzbl (%eax),%ebx
    120d:	84 db                	test   %bl,%bl
    120f:	74 1d                	je     122e <strchr+0x2e>
    1211:	89 d1                	mov    %edx,%ecx
    1213:	38 d3                	cmp    %dl,%bl
    1215:	75 0d                	jne    1224 <strchr+0x24>
    1217:	eb 17                	jmp    1230 <strchr+0x30>
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1220:	38 ca                	cmp    %cl,%dl
    1222:	74 0c                	je     1230 <strchr+0x30>
    1224:	83 c0 01             	add    $0x1,%eax
    1227:	0f b6 10             	movzbl (%eax),%edx
    122a:	84 d2                	test   %dl,%dl
    122c:	75 f2                	jne    1220 <strchr+0x20>
    122e:	31 c0                	xor    %eax,%eax
    1230:	5b                   	pop    %ebx
    1231:	5d                   	pop    %ebp
    1232:	c3                   	ret    
    1233:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001240 <gets>:
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
    1245:	31 f6                	xor    %esi,%esi
    1247:	53                   	push   %ebx
    1248:	89 f3                	mov    %esi,%ebx
    124a:	83 ec 1c             	sub    $0x1c,%esp
    124d:	8b 7d 08             	mov    0x8(%ebp),%edi
    1250:	eb 2f                	jmp    1281 <gets+0x41>
    1252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1258:	83 ec 04             	sub    $0x4,%esp
    125b:	8d 45 e7             	lea    -0x19(%ebp),%eax
    125e:	6a 01                	push   $0x1
    1260:	50                   	push   %eax
    1261:	6a 00                	push   $0x0
    1263:	e8 31 01 00 00       	call   1399 <read>
    1268:	83 c4 10             	add    $0x10,%esp
    126b:	85 c0                	test   %eax,%eax
    126d:	7e 1c                	jle    128b <gets+0x4b>
    126f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1273:	83 c7 01             	add    $0x1,%edi
    1276:	88 47 ff             	mov    %al,-0x1(%edi)
    1279:	3c 0a                	cmp    $0xa,%al
    127b:	74 23                	je     12a0 <gets+0x60>
    127d:	3c 0d                	cmp    $0xd,%al
    127f:	74 1f                	je     12a0 <gets+0x60>
    1281:	83 c3 01             	add    $0x1,%ebx
    1284:	89 fe                	mov    %edi,%esi
    1286:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1289:	7c cd                	jl     1258 <gets+0x18>
    128b:	89 f3                	mov    %esi,%ebx
    128d:	8b 45 08             	mov    0x8(%ebp),%eax
    1290:	c6 03 00             	movb   $0x0,(%ebx)
    1293:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1296:	5b                   	pop    %ebx
    1297:	5e                   	pop    %esi
    1298:	5f                   	pop    %edi
    1299:	5d                   	pop    %ebp
    129a:	c3                   	ret    
    129b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    129f:	90                   	nop
    12a0:	8b 75 08             	mov    0x8(%ebp),%esi
    12a3:	8b 45 08             	mov    0x8(%ebp),%eax
    12a6:	01 de                	add    %ebx,%esi
    12a8:	89 f3                	mov    %esi,%ebx
    12aa:	c6 03 00             	movb   $0x0,(%ebx)
    12ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12b0:	5b                   	pop    %ebx
    12b1:	5e                   	pop    %esi
    12b2:	5f                   	pop    %edi
    12b3:	5d                   	pop    %ebp
    12b4:	c3                   	ret    
    12b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012c0 <stat>:
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	56                   	push   %esi
    12c4:	53                   	push   %ebx
    12c5:	83 ec 08             	sub    $0x8,%esp
    12c8:	6a 00                	push   $0x0
    12ca:	ff 75 08             	pushl  0x8(%ebp)
    12cd:	e8 ef 00 00 00       	call   13c1 <open>
    12d2:	83 c4 10             	add    $0x10,%esp
    12d5:	85 c0                	test   %eax,%eax
    12d7:	78 27                	js     1300 <stat+0x40>
    12d9:	83 ec 08             	sub    $0x8,%esp
    12dc:	ff 75 0c             	pushl  0xc(%ebp)
    12df:	89 c3                	mov    %eax,%ebx
    12e1:	50                   	push   %eax
    12e2:	e8 f2 00 00 00       	call   13d9 <fstat>
    12e7:	89 1c 24             	mov    %ebx,(%esp)
    12ea:	89 c6                	mov    %eax,%esi
    12ec:	e8 b8 00 00 00       	call   13a9 <close>
    12f1:	83 c4 10             	add    $0x10,%esp
    12f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12f7:	89 f0                	mov    %esi,%eax
    12f9:	5b                   	pop    %ebx
    12fa:	5e                   	pop    %esi
    12fb:	5d                   	pop    %ebp
    12fc:	c3                   	ret    
    12fd:	8d 76 00             	lea    0x0(%esi),%esi
    1300:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1305:	eb ed                	jmp    12f4 <stat+0x34>
    1307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    130e:	66 90                	xchg   %ax,%ax

00001310 <atoi>:
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	53                   	push   %ebx
    1314:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1317:	0f be 11             	movsbl (%ecx),%edx
    131a:	8d 42 d0             	lea    -0x30(%edx),%eax
    131d:	3c 09                	cmp    $0x9,%al
    131f:	b8 00 00 00 00       	mov    $0x0,%eax
    1324:	77 1f                	ja     1345 <atoi+0x35>
    1326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132d:	8d 76 00             	lea    0x0(%esi),%esi
    1330:	83 c1 01             	add    $0x1,%ecx
    1333:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1336:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    133a:	0f be 11             	movsbl (%ecx),%edx
    133d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1340:	80 fb 09             	cmp    $0x9,%bl
    1343:	76 eb                	jbe    1330 <atoi+0x20>
    1345:	5b                   	pop    %ebx
    1346:	5d                   	pop    %ebp
    1347:	c3                   	ret    
    1348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    134f:	90                   	nop

00001350 <memmove>:
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	8b 55 10             	mov    0x10(%ebp),%edx
    1357:	8b 45 08             	mov    0x8(%ebp),%eax
    135a:	56                   	push   %esi
    135b:	8b 75 0c             	mov    0xc(%ebp),%esi
    135e:	85 d2                	test   %edx,%edx
    1360:	7e 13                	jle    1375 <memmove+0x25>
    1362:	01 c2                	add    %eax,%edx
    1364:	89 c7                	mov    %eax,%edi
    1366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136d:	8d 76 00             	lea    0x0(%esi),%esi
    1370:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    1371:	39 fa                	cmp    %edi,%edx
    1373:	75 fb                	jne    1370 <memmove+0x20>
    1375:	5e                   	pop    %esi
    1376:	5f                   	pop    %edi
    1377:	5d                   	pop    %ebp
    1378:	c3                   	ret    

00001379 <fork>:
    1379:	b8 01 00 00 00       	mov    $0x1,%eax
    137e:	cd 40                	int    $0x40
    1380:	c3                   	ret    

00001381 <exit>:
    1381:	b8 02 00 00 00       	mov    $0x2,%eax
    1386:	cd 40                	int    $0x40
    1388:	c3                   	ret    

00001389 <wait>:
    1389:	b8 03 00 00 00       	mov    $0x3,%eax
    138e:	cd 40                	int    $0x40
    1390:	c3                   	ret    

00001391 <pipe>:
    1391:	b8 04 00 00 00       	mov    $0x4,%eax
    1396:	cd 40                	int    $0x40
    1398:	c3                   	ret    

00001399 <read>:
    1399:	b8 05 00 00 00       	mov    $0x5,%eax
    139e:	cd 40                	int    $0x40
    13a0:	c3                   	ret    

000013a1 <write>:
    13a1:	b8 10 00 00 00       	mov    $0x10,%eax
    13a6:	cd 40                	int    $0x40
    13a8:	c3                   	ret    

000013a9 <close>:
    13a9:	b8 15 00 00 00       	mov    $0x15,%eax
    13ae:	cd 40                	int    $0x40
    13b0:	c3                   	ret    

000013b1 <kill>:
    13b1:	b8 06 00 00 00       	mov    $0x6,%eax
    13b6:	cd 40                	int    $0x40
    13b8:	c3                   	ret    

000013b9 <exec>:
    13b9:	b8 07 00 00 00       	mov    $0x7,%eax
    13be:	cd 40                	int    $0x40
    13c0:	c3                   	ret    

000013c1 <open>:
    13c1:	b8 0f 00 00 00       	mov    $0xf,%eax
    13c6:	cd 40                	int    $0x40
    13c8:	c3                   	ret    

000013c9 <mknod>:
    13c9:	b8 11 00 00 00       	mov    $0x11,%eax
    13ce:	cd 40                	int    $0x40
    13d0:	c3                   	ret    

000013d1 <unlink>:
    13d1:	b8 12 00 00 00       	mov    $0x12,%eax
    13d6:	cd 40                	int    $0x40
    13d8:	c3                   	ret    

000013d9 <fstat>:
    13d9:	b8 08 00 00 00       	mov    $0x8,%eax
    13de:	cd 40                	int    $0x40
    13e0:	c3                   	ret    

000013e1 <link>:
    13e1:	b8 13 00 00 00       	mov    $0x13,%eax
    13e6:	cd 40                	int    $0x40
    13e8:	c3                   	ret    

000013e9 <mkdir>:
    13e9:	b8 14 00 00 00       	mov    $0x14,%eax
    13ee:	cd 40                	int    $0x40
    13f0:	c3                   	ret    

000013f1 <chdir>:
    13f1:	b8 09 00 00 00       	mov    $0x9,%eax
    13f6:	cd 40                	int    $0x40
    13f8:	c3                   	ret    

000013f9 <dup>:
    13f9:	b8 0a 00 00 00       	mov    $0xa,%eax
    13fe:	cd 40                	int    $0x40
    1400:	c3                   	ret    

00001401 <getpid>:
    1401:	b8 0b 00 00 00       	mov    $0xb,%eax
    1406:	cd 40                	int    $0x40
    1408:	c3                   	ret    

00001409 <sbrk>:
    1409:	b8 0c 00 00 00       	mov    $0xc,%eax
    140e:	cd 40                	int    $0x40
    1410:	c3                   	ret    

00001411 <sleep>:
    1411:	b8 0d 00 00 00       	mov    $0xd,%eax
    1416:	cd 40                	int    $0x40
    1418:	c3                   	ret    

00001419 <uptime>:
    1419:	b8 0e 00 00 00       	mov    $0xe,%eax
    141e:	cd 40                	int    $0x40
    1420:	c3                   	ret    
    1421:	66 90                	xchg   %ax,%ax
    1423:	66 90                	xchg   %ax,%ax
    1425:	66 90                	xchg   %ax,%ax
    1427:	66 90                	xchg   %ax,%ax
    1429:	66 90                	xchg   %ax,%ax
    142b:	66 90                	xchg   %ax,%ax
    142d:	66 90                	xchg   %ax,%ax
    142f:	90                   	nop

00001430 <printint>:
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	89 d3                	mov    %edx,%ebx
    1438:	83 ec 3c             	sub    $0x3c,%esp
    143b:	89 45 bc             	mov    %eax,-0x44(%ebp)
    143e:	85 d2                	test   %edx,%edx
    1440:	0f 89 92 00 00 00    	jns    14d8 <printint+0xa8>
    1446:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    144a:	0f 84 88 00 00 00    	je     14d8 <printint+0xa8>
    1450:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    1457:	f7 db                	neg    %ebx
    1459:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1460:	8d 75 d7             	lea    -0x29(%ebp),%esi
    1463:	eb 08                	jmp    146d <printint+0x3d>
    1465:	8d 76 00             	lea    0x0(%esi),%esi
    1468:	89 7d c4             	mov    %edi,-0x3c(%ebp)
    146b:	89 c3                	mov    %eax,%ebx
    146d:	89 d8                	mov    %ebx,%eax
    146f:	31 d2                	xor    %edx,%edx
    1471:	8b 7d c4             	mov    -0x3c(%ebp),%edi
    1474:	f7 f1                	div    %ecx
    1476:	83 c7 01             	add    $0x1,%edi
    1479:	0f b6 92 18 1a 00 00 	movzbl 0x1a18(%edx),%edx
    1480:	88 14 3e             	mov    %dl,(%esi,%edi,1)
    1483:	39 d9                	cmp    %ebx,%ecx
    1485:	76 e1                	jbe    1468 <printint+0x38>
    1487:	8b 45 c0             	mov    -0x40(%ebp),%eax
    148a:	85 c0                	test   %eax,%eax
    148c:	74 0d                	je     149b <printint+0x6b>
    148e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1493:	ba 2d 00 00 00       	mov    $0x2d,%edx
    1498:	89 7d c4             	mov    %edi,-0x3c(%ebp)
    149b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    149e:	8b 7d bc             	mov    -0x44(%ebp),%edi
    14a1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    14a5:	eb 0f                	jmp    14b6 <printint+0x86>
    14a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ae:	66 90                	xchg   %ax,%ax
    14b0:	0f b6 13             	movzbl (%ebx),%edx
    14b3:	83 eb 01             	sub    $0x1,%ebx
    14b6:	83 ec 04             	sub    $0x4,%esp
    14b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14bc:	6a 01                	push   $0x1
    14be:	56                   	push   %esi
    14bf:	57                   	push   %edi
    14c0:	e8 dc fe ff ff       	call   13a1 <write>
    14c5:	83 c4 10             	add    $0x10,%esp
    14c8:	39 de                	cmp    %ebx,%esi
    14ca:	75 e4                	jne    14b0 <printint+0x80>
    14cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14cf:	5b                   	pop    %ebx
    14d0:	5e                   	pop    %esi
    14d1:	5f                   	pop    %edi
    14d2:	5d                   	pop    %ebp
    14d3:	c3                   	ret    
    14d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14d8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    14df:	e9 75 ff ff ff       	jmp    1459 <printint+0x29>
    14e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14ef:	90                   	nop

000014f0 <printf>:
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	57                   	push   %edi
    14f4:	56                   	push   %esi
    14f5:	53                   	push   %ebx
    14f6:	83 ec 2c             	sub    $0x2c,%esp
    14f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    14fc:	0f b6 1e             	movzbl (%esi),%ebx
    14ff:	84 db                	test   %bl,%bl
    1501:	0f 84 b9 00 00 00    	je     15c0 <printf+0xd0>
    1507:	8d 45 10             	lea    0x10(%ebp),%eax
    150a:	83 c6 01             	add    $0x1,%esi
    150d:	8d 7d e7             	lea    -0x19(%ebp),%edi
    1510:	31 d2                	xor    %edx,%edx
    1512:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1515:	eb 38                	jmp    154f <printf+0x5f>
    1517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151e:	66 90                	xchg   %ax,%ax
    1520:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1523:	ba 25 00 00 00       	mov    $0x25,%edx
    1528:	83 f8 25             	cmp    $0x25,%eax
    152b:	74 17                	je     1544 <printf+0x54>
    152d:	83 ec 04             	sub    $0x4,%esp
    1530:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1533:	6a 01                	push   $0x1
    1535:	57                   	push   %edi
    1536:	ff 75 08             	pushl  0x8(%ebp)
    1539:	e8 63 fe ff ff       	call   13a1 <write>
    153e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1541:	83 c4 10             	add    $0x10,%esp
    1544:	83 c6 01             	add    $0x1,%esi
    1547:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    154b:	84 db                	test   %bl,%bl
    154d:	74 71                	je     15c0 <printf+0xd0>
    154f:	0f be cb             	movsbl %bl,%ecx
    1552:	0f b6 c3             	movzbl %bl,%eax
    1555:	85 d2                	test   %edx,%edx
    1557:	74 c7                	je     1520 <printf+0x30>
    1559:	83 fa 25             	cmp    $0x25,%edx
    155c:	75 e6                	jne    1544 <printf+0x54>
    155e:	83 f8 64             	cmp    $0x64,%eax
    1561:	0f 84 99 00 00 00    	je     1600 <printf+0x110>
    1567:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    156d:	83 f9 70             	cmp    $0x70,%ecx
    1570:	74 5e                	je     15d0 <printf+0xe0>
    1572:	83 f8 73             	cmp    $0x73,%eax
    1575:	0f 84 d5 00 00 00    	je     1650 <printf+0x160>
    157b:	83 f8 63             	cmp    $0x63,%eax
    157e:	0f 84 8c 00 00 00    	je     1610 <printf+0x120>
    1584:	83 f8 25             	cmp    $0x25,%eax
    1587:	0f 84 b3 00 00 00    	je     1640 <printf+0x150>
    158d:	83 ec 04             	sub    $0x4,%esp
    1590:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1594:	6a 01                	push   $0x1
    1596:	57                   	push   %edi
    1597:	ff 75 08             	pushl  0x8(%ebp)
    159a:	e8 02 fe ff ff       	call   13a1 <write>
    159f:	88 5d e7             	mov    %bl,-0x19(%ebp)
    15a2:	83 c4 0c             	add    $0xc,%esp
    15a5:	6a 01                	push   $0x1
    15a7:	83 c6 01             	add    $0x1,%esi
    15aa:	57                   	push   %edi
    15ab:	ff 75 08             	pushl  0x8(%ebp)
    15ae:	e8 ee fd ff ff       	call   13a1 <write>
    15b3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    15b7:	83 c4 10             	add    $0x10,%esp
    15ba:	31 d2                	xor    %edx,%edx
    15bc:	84 db                	test   %bl,%bl
    15be:	75 8f                	jne    154f <printf+0x5f>
    15c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15c3:	5b                   	pop    %ebx
    15c4:	5e                   	pop    %esi
    15c5:	5f                   	pop    %edi
    15c6:	5d                   	pop    %ebp
    15c7:	c3                   	ret    
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
    15d0:	83 ec 0c             	sub    $0xc,%esp
    15d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15d8:	6a 00                	push   $0x0
    15da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15dd:	8b 45 08             	mov    0x8(%ebp),%eax
    15e0:	8b 13                	mov    (%ebx),%edx
    15e2:	e8 49 fe ff ff       	call   1430 <printint>
    15e7:	89 d8                	mov    %ebx,%eax
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	31 d2                	xor    %edx,%edx
    15ee:	83 c0 04             	add    $0x4,%eax
    15f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15f4:	e9 4b ff ff ff       	jmp    1544 <printf+0x54>
    15f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1600:	83 ec 0c             	sub    $0xc,%esp
    1603:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1608:	6a 01                	push   $0x1
    160a:	eb ce                	jmp    15da <printf+0xea>
    160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1610:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1613:	83 ec 04             	sub    $0x4,%esp
    1616:	8b 03                	mov    (%ebx),%eax
    1618:	6a 01                	push   $0x1
    161a:	83 c3 04             	add    $0x4,%ebx
    161d:	57                   	push   %edi
    161e:	ff 75 08             	pushl  0x8(%ebp)
    1621:	88 45 e7             	mov    %al,-0x19(%ebp)
    1624:	e8 78 fd ff ff       	call   13a1 <write>
    1629:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    162c:	83 c4 10             	add    $0x10,%esp
    162f:	31 d2                	xor    %edx,%edx
    1631:	e9 0e ff ff ff       	jmp    1544 <printf+0x54>
    1636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163d:	8d 76 00             	lea    0x0(%esi),%esi
    1640:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1643:	83 ec 04             	sub    $0x4,%esp
    1646:	e9 5a ff ff ff       	jmp    15a5 <printf+0xb5>
    164b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    164f:	90                   	nop
    1650:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1653:	8b 18                	mov    (%eax),%ebx
    1655:	83 c0 04             	add    $0x4,%eax
    1658:	89 45 d0             	mov    %eax,-0x30(%ebp)
    165b:	85 db                	test   %ebx,%ebx
    165d:	74 17                	je     1676 <printf+0x186>
    165f:	0f b6 03             	movzbl (%ebx),%eax
    1662:	31 d2                	xor    %edx,%edx
    1664:	84 c0                	test   %al,%al
    1666:	0f 84 d8 fe ff ff    	je     1544 <printf+0x54>
    166c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    166f:	89 de                	mov    %ebx,%esi
    1671:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1674:	eb 1a                	jmp    1690 <printf+0x1a0>
    1676:	bb 10 1a 00 00       	mov    $0x1a10,%ebx
    167b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    167e:	b8 28 00 00 00       	mov    $0x28,%eax
    1683:	89 de                	mov    %ebx,%esi
    1685:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    168f:	90                   	nop
    1690:	83 ec 04             	sub    $0x4,%esp
    1693:	83 c6 01             	add    $0x1,%esi
    1696:	88 45 e7             	mov    %al,-0x19(%ebp)
    1699:	6a 01                	push   $0x1
    169b:	57                   	push   %edi
    169c:	53                   	push   %ebx
    169d:	e8 ff fc ff ff       	call   13a1 <write>
    16a2:	0f b6 06             	movzbl (%esi),%eax
    16a5:	83 c4 10             	add    $0x10,%esp
    16a8:	84 c0                	test   %al,%al
    16aa:	75 e4                	jne    1690 <printf+0x1a0>
    16ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    16af:	31 d2                	xor    %edx,%edx
    16b1:	e9 8e fe ff ff       	jmp    1544 <printf+0x54>
    16b6:	66 90                	xchg   %ax,%ax
    16b8:	66 90                	xchg   %ax,%ax
    16ba:	66 90                	xchg   %ax,%ax
    16bc:	66 90                	xchg   %ax,%ax
    16be:	66 90                	xchg   %ax,%ax

000016c0 <free>:
    16c0:	55                   	push   %ebp
    16c1:	a1 c4 20 00 00       	mov    0x20c4,%eax
    16c6:	89 e5                	mov    %esp,%ebp
    16c8:	57                   	push   %edi
    16c9:	56                   	push   %esi
    16ca:	53                   	push   %ebx
    16cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16ce:	8b 10                	mov    (%eax),%edx
    16d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    16d3:	39 c8                	cmp    %ecx,%eax
    16d5:	73 19                	jae    16f0 <free+0x30>
    16d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16de:	66 90                	xchg   %ax,%ax
    16e0:	39 d1                	cmp    %edx,%ecx
    16e2:	72 14                	jb     16f8 <free+0x38>
    16e4:	39 d0                	cmp    %edx,%eax
    16e6:	73 10                	jae    16f8 <free+0x38>
    16e8:	89 d0                	mov    %edx,%eax
    16ea:	8b 10                	mov    (%eax),%edx
    16ec:	39 c8                	cmp    %ecx,%eax
    16ee:	72 f0                	jb     16e0 <free+0x20>
    16f0:	39 d0                	cmp    %edx,%eax
    16f2:	72 f4                	jb     16e8 <free+0x28>
    16f4:	39 d1                	cmp    %edx,%ecx
    16f6:	73 f0                	jae    16e8 <free+0x28>
    16f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16fe:	39 fa                	cmp    %edi,%edx
    1700:	74 1e                	je     1720 <free+0x60>
    1702:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1705:	8b 50 04             	mov    0x4(%eax),%edx
    1708:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    170b:	39 f1                	cmp    %esi,%ecx
    170d:	74 28                	je     1737 <free+0x77>
    170f:	89 08                	mov    %ecx,(%eax)
    1711:	5b                   	pop    %ebx
    1712:	a3 c4 20 00 00       	mov    %eax,0x20c4
    1717:	5e                   	pop    %esi
    1718:	5f                   	pop    %edi
    1719:	5d                   	pop    %ebp
    171a:	c3                   	ret    
    171b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    171f:	90                   	nop
    1720:	03 72 04             	add    0x4(%edx),%esi
    1723:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1726:	8b 10                	mov    (%eax),%edx
    1728:	8b 12                	mov    (%edx),%edx
    172a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    172d:	8b 50 04             	mov    0x4(%eax),%edx
    1730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1733:	39 f1                	cmp    %esi,%ecx
    1735:	75 d8                	jne    170f <free+0x4f>
    1737:	03 53 fc             	add    -0x4(%ebx),%edx
    173a:	a3 c4 20 00 00       	mov    %eax,0x20c4
    173f:	89 50 04             	mov    %edx,0x4(%eax)
    1742:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1745:	89 10                	mov    %edx,(%eax)
    1747:	5b                   	pop    %ebx
    1748:	5e                   	pop    %esi
    1749:	5f                   	pop    %edi
    174a:	5d                   	pop    %ebp
    174b:	c3                   	ret    
    174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001750 <malloc>:
    1750:	55                   	push   %ebp
    1751:	89 e5                	mov    %esp,%ebp
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	53                   	push   %ebx
    1756:	83 ec 1c             	sub    $0x1c,%esp
    1759:	8b 45 08             	mov    0x8(%ebp),%eax
    175c:	8b 3d c4 20 00 00    	mov    0x20c4,%edi
    1762:	8d 70 07             	lea    0x7(%eax),%esi
    1765:	c1 ee 03             	shr    $0x3,%esi
    1768:	83 c6 01             	add    $0x1,%esi
    176b:	85 ff                	test   %edi,%edi
    176d:	0f 84 ad 00 00 00    	je     1820 <malloc+0xd0>
    1773:	8b 17                	mov    (%edi),%edx
    1775:	8b 4a 04             	mov    0x4(%edx),%ecx
    1778:	39 f1                	cmp    %esi,%ecx
    177a:	73 72                	jae    17ee <malloc+0x9e>
    177c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1782:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1787:	0f 43 de             	cmovae %esi,%ebx
    178a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1791:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1794:	eb 1b                	jmp    17b1 <malloc+0x61>
    1796:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    179d:	8d 76 00             	lea    0x0(%esi),%esi
    17a0:	8b 02                	mov    (%edx),%eax
    17a2:	8b 48 04             	mov    0x4(%eax),%ecx
    17a5:	39 f1                	cmp    %esi,%ecx
    17a7:	73 4f                	jae    17f8 <malloc+0xa8>
    17a9:	8b 3d c4 20 00 00    	mov    0x20c4,%edi
    17af:	89 c2                	mov    %eax,%edx
    17b1:	39 d7                	cmp    %edx,%edi
    17b3:	75 eb                	jne    17a0 <malloc+0x50>
    17b5:	83 ec 0c             	sub    $0xc,%esp
    17b8:	ff 75 e4             	pushl  -0x1c(%ebp)
    17bb:	e8 49 fc ff ff       	call   1409 <sbrk>
    17c0:	83 c4 10             	add    $0x10,%esp
    17c3:	83 f8 ff             	cmp    $0xffffffff,%eax
    17c6:	74 1c                	je     17e4 <malloc+0x94>
    17c8:	89 58 04             	mov    %ebx,0x4(%eax)
    17cb:	83 ec 0c             	sub    $0xc,%esp
    17ce:	83 c0 08             	add    $0x8,%eax
    17d1:	50                   	push   %eax
    17d2:	e8 e9 fe ff ff       	call   16c0 <free>
    17d7:	8b 15 c4 20 00 00    	mov    0x20c4,%edx
    17dd:	83 c4 10             	add    $0x10,%esp
    17e0:	85 d2                	test   %edx,%edx
    17e2:	75 bc                	jne    17a0 <malloc+0x50>
    17e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17e7:	31 c0                	xor    %eax,%eax
    17e9:	5b                   	pop    %ebx
    17ea:	5e                   	pop    %esi
    17eb:	5f                   	pop    %edi
    17ec:	5d                   	pop    %ebp
    17ed:	c3                   	ret    
    17ee:	89 d0                	mov    %edx,%eax
    17f0:	89 fa                	mov    %edi,%edx
    17f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17f8:	39 ce                	cmp    %ecx,%esi
    17fa:	74 54                	je     1850 <malloc+0x100>
    17fc:	29 f1                	sub    %esi,%ecx
    17fe:	89 48 04             	mov    %ecx,0x4(%eax)
    1801:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1804:	89 70 04             	mov    %esi,0x4(%eax)
    1807:	89 15 c4 20 00 00    	mov    %edx,0x20c4
    180d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1810:	83 c0 08             	add    $0x8,%eax
    1813:	5b                   	pop    %ebx
    1814:	5e                   	pop    %esi
    1815:	5f                   	pop    %edi
    1816:	5d                   	pop    %ebp
    1817:	c3                   	ret    
    1818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    181f:	90                   	nop
    1820:	c7 05 c4 20 00 00 c8 	movl   $0x20c8,0x20c4
    1827:	20 00 00 
    182a:	bf c8 20 00 00       	mov    $0x20c8,%edi
    182f:	c7 05 c8 20 00 00 c8 	movl   $0x20c8,0x20c8
    1836:	20 00 00 
    1839:	89 fa                	mov    %edi,%edx
    183b:	c7 05 cc 20 00 00 00 	movl   $0x0,0x20cc
    1842:	00 00 00 
    1845:	e9 32 ff ff ff       	jmp    177c <malloc+0x2c>
    184a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1850:	8b 08                	mov    (%eax),%ecx
    1852:	89 0a                	mov    %ecx,(%edx)
    1854:	eb b1                	jmp    1807 <malloc+0xb7>
