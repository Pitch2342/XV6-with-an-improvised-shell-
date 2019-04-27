
_editor:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:



int main(int argc, char *argv[])

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
      11:	81 ec 28 05 00 00    	sub    $0x528,%esp
      17:	8b 41 04             	mov    0x4(%ecx),%eax

	if (argc == 1)
      1a:	83 39 01             	cmpl   $0x1,(%ecx)
{
      1d:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
	if (argc == 1)
      23:	0f 84 c1 05 00 00    	je     5ea <main+0x5ea>

	}

	

	char *text[MAX_LINE_NUMBER] = {};
      29:	31 db                	xor    %ebx,%ebx

	text[0] = malloc(MAX_LINE_LENGTH);
      2b:	83 ec 0c             	sub    $0xc,%esp
	char *text[MAX_LINE_NUMBER] = {};
      2e:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
      34:	b9 00 01 00 00       	mov    $0x100,%ecx
      39:	89 d8                	mov    %ebx,%eax
      3b:	f3 ab                	rep stos %eax,%es:(%edi)
	text[0] = malloc(MAX_LINE_LENGTH);
      3d:	68 00 01 00 00       	push   $0x100
      42:	e8 19 15 00 00       	call   1560 <malloc>

	memset(text[0], 0, MAX_LINE_LENGTH);
      47:	83 c4 0c             	add    $0xc,%esp
      4a:	68 00 01 00 00       	push   $0x100
      4f:	6a 00                	push   $0x0
      51:	50                   	push   %eax
	text[0] = malloc(MAX_LINE_LENGTH);
      52:	89 85 e8 fb ff ff    	mov    %eax,-0x418(%ebp)
	memset(text[0], 0, MAX_LINE_LENGTH);
      58:	e8 93 0f 00 00       	call   ff0 <memset>

	int line_number = 0;

	int fd = open(argv[1], O_RDONLY);
      5d:	8b 85 dc fa ff ff    	mov    -0x524(%ebp),%eax
      63:	5e                   	pop    %esi
      64:	5f                   	pop    %edi
      65:	6a 00                	push   $0x0
      67:	ff 70 04             	pushl  0x4(%eax)
      6a:	e8 62 11 00 00       	call   11d1 <open>

	if (fd != -1)
      6f:	83 c4 10             	add    $0x10,%esp
	int fd = open(argv[1], O_RDONLY);
      72:	89 85 d8 fa ff ff    	mov    %eax,-0x528(%ebp)
	if (fd != -1)
      78:	83 c0 01             	add    $0x1,%eax
      7b:	0f 84 d6 00 00 00    	je     157 <main+0x157>

	{

		printf(1, "file exist\n");
      81:	51                   	push   %ecx

		char buf[BUF_SIZE] = {};
      82:	8d bd e8 fa ff ff    	lea    -0x518(%ebp),%edi
		printf(1, "file exist\n");
      88:	51                   	push   %ecx
      89:	68 8b 17 00 00       	push   $0x178b
      8e:	6a 01                	push   $0x1
      90:	e8 6b 12 00 00       	call   1300 <printf>
		char buf[BUF_SIZE] = {};
      95:	89 fa                	mov    %edi,%edx
      97:	b9 40 00 00 00       	mov    $0x40,%ecx
      9c:	89 d8                	mov    %ebx,%eax
	int line_number = 0;
      9e:	c7 85 e4 fa ff ff 00 	movl   $0x0,-0x51c(%ebp)
      a5:	00 00 00 

		int len = 0;

		while ((len = read(fd, buf, BUF_SIZE)) > 0)
      a8:	83 c4 10             	add    $0x10,%esp
		char buf[BUF_SIZE] = {};
      ab:	89 bd d4 fa ff ff    	mov    %edi,-0x52c(%ebp)
      b1:	f3 ab                	rep stos %eax,%es:(%edi)
		while ((len = read(fd, buf, BUF_SIZE)) > 0)
      b3:	89 d7                	mov    %edx,%edi
      b5:	8d 76 00             	lea    0x0(%esi),%esi
      b8:	83 ec 04             	sub    $0x4,%esp
      bb:	68 00 01 00 00       	push   $0x100
      c0:	57                   	push   %edi
      c1:	ff b5 d8 fa ff ff    	pushl  -0x528(%ebp)
      c7:	e8 dd 10 00 00       	call   11a9 <read>
      cc:	83 c4 10             	add    $0x10,%esp
      cf:	89 c6                	mov    %eax,%esi
      d1:	85 c0                	test   %eax,%eax
      d3:	0f 8e fb 04 00 00    	jle    5d4 <main+0x5d4>

					}

				}

				if (is_full == 1 || i >= len - 1)
      d9:	8d 46 ff             	lea    -0x1(%esi),%eax
			int next = 0;
      dc:	31 d2                	xor    %edx,%edx
				if (is_full == 1 || i >= len - 1)
      de:	89 85 e0 fa ff ff    	mov    %eax,-0x520(%ebp)
      e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				for (i = next; i < len && buf[i] != '\n'; i++)
      e8:	80 bc 15 e8 fa ff ff 	cmpb   $0xa,-0x518(%ebp,%edx,1)
      ef:	0a 
      f0:	89 d3                	mov    %edx,%ebx
      f2:	75 16                	jne    10a <main+0x10a>
      f4:	eb 3b                	jmp    131 <main+0x131>
      f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fd:	8d 76 00             	lea    0x0(%esi),%esi
     100:	80 3c 1f 0a          	cmpb   $0xa,(%edi,%ebx,1)
     104:	0f 84 16 03 00 00    	je     420 <main+0x420>
     10a:	83 c3 01             	add    $0x1,%ebx
     10d:	39 de                	cmp    %ebx,%esi
     10f:	75 ef                	jne    100 <main+0x100>
				strcat_n(text[line_number], buf+next, i-next);
     111:	89 f1                	mov    %esi,%ecx
     113:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     119:	29 d1                	sub    %edx,%ecx
     11b:	8b 84 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%eax

char* strcat_n(char* dest, char* src, int len)

{

	if (len <= 0)
     122:	85 c9                	test   %ecx,%ecx
     124:	7e 92                	jle    b8 <main+0xb8>
				strcat_n(text[line_number], buf+next, i-next);
     126:	01 fa                	add    %edi,%edx
     128:	e8 83 05 00 00       	call   6b0 <strcat_n.part.0>
				if (i < len && buf[i] == '\n')
     12d:	39 de                	cmp    %ebx,%esi
     12f:	7e 87                	jle    b8 <main+0xb8>
     131:	80 bc 1d e8 fa ff ff 	cmpb   $0xa,-0x518(%ebp,%ebx,1)
     138:	0a 
     139:	0f 84 fa 02 00 00    	je     439 <main+0x439>
				if (is_full == 1 || i >= len - 1)
     13f:	39 9d e0 fa ff ff    	cmp    %ebx,-0x520(%ebp)
     145:	0f 8e 6d ff ff ff    	jle    b8 <main+0xb8>
					next = i + 1;
     14b:	8d 53 01             	lea    0x1(%ebx),%edx
				for (i = next; i < len && buf[i] != '\n'; i++)
     14e:	39 f2                	cmp    %esi,%edx
     150:	7c 96                	jl     e8 <main+0xe8>
     152:	e9 61 ff ff ff       	jmp    b8 <main+0xb8>
		printf(1,"File do not exist\n");
     157:	57                   	push   %edi
     158:	57                   	push   %edi
     159:	68 97 17 00 00       	push   $0x1797
     15e:	6a 01                	push   $0x1
     160:	e8 9b 11 00 00       	call   1300 <printf>
		unlink(argv[1]);
     165:	8b 9d dc fa ff ff    	mov    -0x524(%ebp),%ebx
     16b:	58                   	pop    %eax
     16c:	ff 73 04             	pushl  0x4(%ebx)
     16f:	e8 6d 10 00 00       	call   11e1 <unlink>
        fd=open(argv[1],O_CREATE | O_WRONLY);
     174:	58                   	pop    %eax
     175:	5a                   	pop    %edx
     176:	68 01 02 00 00       	push   $0x201
     17b:	ff 73 04             	pushl  0x4(%ebx)
     17e:	e8 4e 10 00 00       	call   11d1 <open>
     183:	8d 85 e8 fa ff ff    	lea    -0x518(%ebp),%eax
     189:	83 c4 10             	add    $0x10,%esp
	int line_number = 0;
     18c:	c7 85 e4 fa ff ff 00 	movl   $0x0,-0x51c(%ebp)
     193:	00 00 00 
     196:	89 85 d4 fa ff ff    	mov    %eax,-0x52c(%ebp)
	show_text(text);
     19c:	83 ec 0c             	sub    $0xc,%esp
     19f:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     1a5:	8d 9d ec fa ff ff    	lea    -0x514(%ebp),%ebx
	show_text(text);
     1ab:	50                   	push   %eax
     1ac:	e8 7f 05 00 00       	call   730 <show_text>
	com_help(text);
     1b1:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     1b7:	89 04 24             	mov    %eax,(%esp)
     1ba:	e8 d1 0a 00 00       	call   c90 <com_help>
	char input[MAX_LINE_LENGTH] = {};
     1bf:	8b bd d4 fa ff ff    	mov    -0x52c(%ebp),%edi
     1c5:	31 c0                	xor    %eax,%eax
     1c7:	83 c4 10             	add    $0x10,%esp
     1ca:	b9 40 00 00 00       	mov    $0x40,%ecx
     1cf:	f3 ab                	rep stos %eax,%es:(%edi)
     1d1:	8b bd d4 fa ff ff    	mov    -0x52c(%ebp),%edi
     1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1de:	66 90                	xchg   %ax,%ax
		printf(1, "\nplease input command:\n");
     1e0:	83 ec 08             	sub    $0x8,%esp
     1e3:	68 aa 17 00 00       	push   $0x17aa
     1e8:	6a 01                	push   $0x1
     1ea:	e8 11 11 00 00       	call   1300 <printf>
		memset(input, 0, MAX_LINE_LENGTH);
     1ef:	83 c4 0c             	add    $0xc,%esp
     1f2:	68 00 01 00 00       	push   $0x100
     1f7:	6a 00                	push   $0x0
     1f9:	57                   	push   %edi
     1fa:	e8 f1 0d 00 00       	call   ff0 <memset>
		gets(input, MAX_LINE_LENGTH);
     1ff:	59                   	pop    %ecx
     200:	5e                   	pop    %esi
     201:	68 00 01 00 00       	push   $0x100
     206:	57                   	push   %edi
		int j = 0;
     207:	31 f6                	xor    %esi,%esi
		gets(input, MAX_LINE_LENGTH);
     209:	e8 42 0e 00 00       	call   1050 <gets>
		int len = strlen(input);
     20e:	89 3c 24             	mov    %edi,(%esp)
     211:	e8 aa 0d 00 00       	call   fc0 <strlen>
		input[len-1] = '\0';
     216:	83 c4 10             	add    $0x10,%esp
     219:	c6 84 05 e7 fa ff ff 	movb   $0x0,-0x519(%ebp,%eax,1)
     220:	00 
		for (; j < 8; j++)
     221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			if (input[j] == ' ')
     228:	0f b6 04 37          	movzbl (%edi,%esi,1),%eax
     22c:	83 c6 01             	add    $0x1,%esi
     22f:	3c 20                	cmp    $0x20,%al
     231:	74 0a                	je     23d <main+0x23d>
		for (; j < 8; j++)
     233:	83 fe 08             	cmp    $0x8,%esi
     236:	75 f0                	jne    228 <main+0x228>
		int pos = MAX_LINE_LENGTH - 1;
     238:	be ff 00 00 00       	mov    $0xff,%esi
		if (input[0] == 'i' && input[1] == 'n' && input[2] == 's')
     23d:	0f b6 85 e8 fa ff ff 	movzbl -0x518(%ebp),%eax
     244:	3c 69                	cmp    $0x69,%al
     246:	0f 84 d4 00 00 00    	je     320 <main+0x320>
		else if (input[0] == 'm' && input[1] == 'o' && input[2] == 'd')
     24c:	3c 6d                	cmp    $0x6d,%al
     24e:	0f 85 4c 01 00 00    	jne    3a0 <main+0x3a0>
     254:	80 bd e9 fa ff ff 6f 	cmpb   $0x6f,-0x517(%ebp)
     25b:	0f 84 bf 02 00 00    	je     520 <main+0x520>
		else if (strcmp(input, "show") == 0)
     261:	83 ec 08             	sub    $0x8,%esp
     264:	68 d4 17 00 00       	push   $0x17d4
     269:	57                   	push   %edi
     26a:	e8 01 0d 00 00       	call   f70 <strcmp>
     26f:	83 c4 10             	add    $0x10,%esp
     272:	85 c0                	test   %eax,%eax
     274:	0f 84 0e 02 00 00    	je     488 <main+0x488>
		else if (strcmp(input, "hide") == 0)
     27a:	83 ec 08             	sub    $0x8,%esp
     27d:	68 d9 17 00 00       	push   $0x17d9
     282:	57                   	push   %edi
     283:	e8 e8 0c 00 00       	call   f70 <strcmp>
     288:	83 c4 10             	add    $0x10,%esp
     28b:	85 c0                	test   %eax,%eax
     28d:	0f 84 1d 02 00 00    	je     4b0 <main+0x4b0>
		else if (strcmp(input, "help") == 0)
     293:	83 ec 08             	sub    $0x8,%esp
     296:	68 de 17 00 00       	push   $0x17de
     29b:	57                   	push   %edi
     29c:	e8 cf 0c 00 00       	call   f70 <strcmp>
     2a1:	83 c4 10             	add    $0x10,%esp
     2a4:	85 c0                	test   %eax,%eax
     2a6:	0f 84 54 02 00 00    	je     500 <main+0x500>
		else if (strcmp(input, "save") == 0 || strcmp(input, "CTRL+S\n") == 0)
     2ac:	83 ec 08             	sub    $0x8,%esp
     2af:	68 e3 17 00 00       	push   $0x17e3
     2b4:	57                   	push   %edi
     2b5:	e8 b6 0c 00 00       	call   f70 <strcmp>
     2ba:	83 c4 10             	add    $0x10,%esp
     2bd:	85 c0                	test   %eax,%eax
     2bf:	0f 84 13 02 00 00    	je     4d8 <main+0x4d8>
     2c5:	83 ec 08             	sub    $0x8,%esp
     2c8:	68 e8 17 00 00       	push   $0x17e8
     2cd:	57                   	push   %edi
     2ce:	e8 9d 0c 00 00       	call   f70 <strcmp>
     2d3:	83 c4 10             	add    $0x10,%esp
     2d6:	85 c0                	test   %eax,%eax
     2d8:	0f 84 fa 01 00 00    	je     4d8 <main+0x4d8>
		else if (strcmp(input, "exit") == 0)
     2de:	83 ec 08             	sub    $0x8,%esp
     2e1:	68 f0 17 00 00       	push   $0x17f0
     2e6:	57                   	push   %edi
     2e7:	e8 84 0c 00 00       	call   f70 <strcmp>
     2ec:	83 c4 10             	add    $0x10,%esp
     2ef:	85 c0                	test   %eax,%eax
     2f1:	0f 84 6d 02 00 00    	je     564 <main+0x564>
			printf(1, "invalid command.\n");
     2f7:	83 ec 08             	sub    $0x8,%esp
     2fa:	68 c2 17 00 00       	push   $0x17c2
     2ff:	6a 01                	push   $0x1
     301:	e8 fa 0f 00 00       	call   1300 <printf>
			com_help(text);
     306:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     30c:	89 04 24             	mov    %eax,(%esp)
     30f:	e8 7c 09 00 00       	call   c90 <com_help>
     314:	83 c4 10             	add    $0x10,%esp
     317:	e9 c4 fe ff ff       	jmp    1e0 <main+0x1e0>
     31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (input[0] == 'i' && input[1] == 'n' && input[2] == 's')
     320:	80 bd e9 fa ff ff 6e 	cmpb   $0x6e,-0x517(%ebp)
     327:	0f 85 34 ff ff ff    	jne    261 <main+0x261>
     32d:	80 bd ea fa ff ff 73 	cmpb   $0x73,-0x516(%ebp)
     334:	0f 85 27 ff ff ff    	jne    261 <main+0x261>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     33a:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     341:	3c 2d                	cmp    $0x2d,%al
     343:	0f 84 32 02 00 00    	je     57b <main+0x57b>
			else if(input[3] == ' '||input[3] == '\0')
     349:	a8 df                	test   $0xdf,%al
     34b:	75 aa                	jne    2f7 <main+0x2f7>
				com_ins(text, line_number+1, &input[pos]);
     34d:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     353:	83 ec 04             	sub    $0x4,%esp
     356:	01 fe                	add    %edi,%esi
     358:	56                   	push   %esi
     359:	83 c0 01             	add    $0x1,%eax
     35c:	50                   	push   %eax
     35d:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     363:	50                   	push   %eax
     364:	e8 27 05 00 00       	call   890 <com_ins>
     369:	83 c4 10             	add    $0x10,%esp

int get_line_number(char *text[])

{

	int i = 0;
     36c:	31 c0                	xor    %eax,%eax
     36e:	eb 0e                	jmp    37e <main+0x37e>

	for (; i < MAX_LINE_NUMBER; i++)
     370:	83 c0 01             	add    $0x1,%eax
     373:	3d 00 01 00 00       	cmp    $0x100,%eax
     378:	0f 84 93 02 00 00    	je     611 <main+0x611>

		if (text[i] == NULL)
     37e:	8b b4 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%esi
     385:	85 f6                	test   %esi,%esi
     387:	75 e7                	jne    370 <main+0x370>

			return i - 1;
     389:	83 e8 01             	sub    $0x1,%eax
     38c:	89 85 e4 fa ff ff    	mov    %eax,-0x51c(%ebp)
     392:	e9 49 fe ff ff       	jmp    1e0 <main+0x1e0>
     397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39e:	66 90                	xchg   %ax,%ax
		else if (input[0] == 'd' && input[1] == 'e' && input[2] == 'l')
     3a0:	3c 64                	cmp    $0x64,%al
     3a2:	0f 85 b9 fe ff ff    	jne    261 <main+0x261>
     3a8:	80 bd e9 fa ff ff 65 	cmpb   $0x65,-0x517(%ebp)
     3af:	0f 85 ac fe ff ff    	jne    261 <main+0x261>
     3b5:	80 bd ea fa ff ff 6c 	cmpb   $0x6c,-0x516(%ebp)
     3bc:	0f 85 9f fe ff ff    	jne    261 <main+0x261>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     3c2:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     3c9:	3c 2d                	cmp    $0x2d,%al
     3cb:	0f 84 e3 01 00 00    	je     5b4 <main+0x5b4>
			else if(input[3]=='\0')
     3d1:	84 c0                	test   %al,%al
     3d3:	0f 85 1e ff ff ff    	jne    2f7 <main+0x2f7>
				com_del(text, line_number + 1);
     3d9:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     3df:	51                   	push   %ecx
     3e0:	51                   	push   %ecx
     3e1:	83 c0 01             	add    $0x1,%eax
     3e4:	50                   	push   %eax
     3e5:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     3eb:	50                   	push   %eax
     3ec:	e8 8f 07 00 00       	call   b80 <com_del>
     3f1:	83 c4 10             	add    $0x10,%esp
	int i = 0;
     3f4:	31 c0                	xor    %eax,%eax
     3f6:	eb 16                	jmp    40e <main+0x40e>
     3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3ff:	90                   	nop
	for (; i < MAX_LINE_NUMBER; i++)
     400:	83 c0 01             	add    $0x1,%eax
     403:	3d 00 01 00 00       	cmp    $0x100,%eax
     408:	0f 84 03 02 00 00    	je     611 <main+0x611>
		if (text[i] == NULL)
     40e:	8b 94 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%edx
     415:	85 d2                	test   %edx,%edx
     417:	75 e7                	jne    400 <main+0x400>
     419:	e9 6b ff ff ff       	jmp    389 <main+0x389>
     41e:	66 90                	xchg   %ax,%ax
				strcat_n(text[line_number], buf+next, i-next);
     420:	89 d9                	mov    %ebx,%ecx
     422:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     428:	29 d1                	sub    %edx,%ecx
     42a:	8b 84 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%eax
	if (len <= 0)
     431:	85 c9                	test   %ecx,%ecx
     433:	0f 8f ed fc ff ff    	jg     126 <main+0x126>
					if (line_number >= MAX_LINE_NUMBER - 1)
     439:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     43f:	3d fe 00 00 00       	cmp    $0xfe,%eax
     444:	0f 8f 8a 01 00 00    	jg     5d4 <main+0x5d4>
						text[line_number] = malloc(MAX_LINE_LENGTH);
     44a:	83 ec 0c             	sub    $0xc,%esp
						line_number++;
     44d:	83 c0 01             	add    $0x1,%eax
						text[line_number] = malloc(MAX_LINE_LENGTH);
     450:	68 00 01 00 00       	push   $0x100
						line_number++;
     455:	89 85 e4 fa ff ff    	mov    %eax,-0x51c(%ebp)
						text[line_number] = malloc(MAX_LINE_LENGTH);
     45b:	e8 00 11 00 00       	call   1560 <malloc>
						memset(text[line_number], 0, MAX_LINE_LENGTH);
     460:	83 c4 0c             	add    $0xc,%esp
						text[line_number] = malloc(MAX_LINE_LENGTH);
     463:	8b 8d e4 fa ff ff    	mov    -0x51c(%ebp),%ecx
						memset(text[line_number], 0, MAX_LINE_LENGTH);
     469:	68 00 01 00 00       	push   $0x100
     46e:	6a 00                	push   $0x0
     470:	50                   	push   %eax
						text[line_number] = malloc(MAX_LINE_LENGTH);
     471:	89 84 8d e8 fb ff ff 	mov    %eax,-0x418(%ebp,%ecx,4)
						memset(text[line_number], 0, MAX_LINE_LENGTH);
     478:	e8 73 0b 00 00       	call   ff0 <memset>
     47d:	83 c4 10             	add    $0x10,%esp
     480:	e9 ba fc ff ff       	jmp    13f <main+0x13f>
     485:	8d 76 00             	lea    0x0(%esi),%esi
			auto_show = 1;
     488:	c7 05 a0 1e 00 00 01 	movl   $0x1,0x1ea0
     48f:	00 00 00 
			printf(1, "enable show current contents after text changed.\n");
     492:	83 ec 08             	sub    $0x8,%esp
     495:	68 34 19 00 00       	push   $0x1934
     49a:	6a 01                	push   $0x1
     49c:	e8 5f 0e 00 00       	call   1300 <printf>
     4a1:	83 c4 10             	add    $0x10,%esp
     4a4:	e9 37 fd ff ff       	jmp    1e0 <main+0x1e0>
     4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			auto_show = 0;
     4b0:	c7 05 a0 1e 00 00 00 	movl   $0x0,0x1ea0
     4b7:	00 00 00 
			printf(1, "disable show current contents after text changed.\n");
     4ba:	83 ec 08             	sub    $0x8,%esp
     4bd:	68 68 19 00 00       	push   $0x1968
     4c2:	6a 01                	push   $0x1
     4c4:	e8 37 0e 00 00       	call   1300 <printf>
     4c9:	83 c4 10             	add    $0x10,%esp
     4cc:	e9 0f fd ff ff       	jmp    1e0 <main+0x1e0>
     4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			com_save(text, argv[1]);
     4d8:	8b 85 dc fa ff ff    	mov    -0x524(%ebp),%eax
     4de:	83 ec 08             	sub    $0x8,%esp
     4e1:	ff 70 04             	pushl  0x4(%eax)
     4e4:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     4ea:	50                   	push   %eax
     4eb:	e8 60 08 00 00       	call   d50 <com_save>
     4f0:	83 c4 10             	add    $0x10,%esp
     4f3:	e9 e8 fc ff ff       	jmp    1e0 <main+0x1e0>
     4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ff:	90                   	nop
			com_help(text);
     500:	83 ec 0c             	sub    $0xc,%esp
     503:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     509:	50                   	push   %eax
     50a:	e8 81 07 00 00       	call   c90 <com_help>
     50f:	83 c4 10             	add    $0x10,%esp
     512:	e9 c9 fc ff ff       	jmp    1e0 <main+0x1e0>
     517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     51e:	66 90                	xchg   %ax,%ax
		else if (input[0] == 'm' && input[1] == 'o' && input[2] == 'd')
     520:	80 bd ea fa ff ff 64 	cmpb   $0x64,-0x516(%ebp)
     527:	0f 85 34 fd ff ff    	jne    261 <main+0x261>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     52d:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     534:	3c 2d                	cmp    $0x2d,%al
     536:	74 63                	je     59b <main+0x59b>
			else if(input[3] == ' '||input[3] == '\0')
     538:	a8 df                	test   $0xdf,%al
     53a:	0f 85 b7 fd ff ff    	jne    2f7 <main+0x2f7>
				com_mod(text, line_number + 1, &input[pos]);
     540:	83 ec 04             	sub    $0x4,%esp
     543:	01 fe                	add    %edi,%esi
     545:	8b 85 e4 fa ff ff    	mov    -0x51c(%ebp),%eax
     54b:	56                   	push   %esi
     54c:	83 c0 01             	add    $0x1,%eax
     54f:	50                   	push   %eax
     550:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     556:	50                   	push   %eax
     557:	e8 14 05 00 00       	call   a70 <com_mod>
     55c:	83 c4 10             	add    $0x10,%esp
     55f:	e9 7c fc ff ff       	jmp    1e0 <main+0x1e0>
			com_exit(text, argv[1]);
     564:	50                   	push   %eax
     565:	50                   	push   %eax
     566:	8b 85 dc fa ff ff    	mov    -0x524(%ebp),%eax
     56c:	ff 70 04             	pushl  0x4(%eax)
     56f:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     575:	50                   	push   %eax
     576:	e8 c5 08 00 00       	call   e40 <com_exit>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     57b:	83 ec 0c             	sub    $0xc,%esp
     57e:	53                   	push   %ebx
     57f:	e8 8c 02 00 00       	call   810 <stringtonumber>
     584:	83 c4 10             	add    $0x10,%esp
     587:	85 c0                	test   %eax,%eax
     589:	0f 89 91 00 00 00    	jns    620 <main+0x620>
     58f:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     596:	e9 ae fd ff ff       	jmp    349 <main+0x349>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     59b:	83 ec 0c             	sub    $0xc,%esp
     59e:	53                   	push   %ebx
     59f:	e8 6c 02 00 00       	call   810 <stringtonumber>
     5a4:	83 c4 10             	add    $0x10,%esp
     5a7:	85 c0                	test   %eax,%eax
     5a9:	79 52                	jns    5fd <main+0x5fd>
     5ab:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     5b2:	eb 84                	jmp    538 <main+0x538>
			if (input[3] == '-'&&stringtonumber(&input[4])>=0)
     5b4:	83 ec 0c             	sub    $0xc,%esp
     5b7:	53                   	push   %ebx
     5b8:	e8 53 02 00 00       	call   810 <stringtonumber>
     5bd:	83 c4 10             	add    $0x10,%esp
     5c0:	85 c0                	test   %eax,%eax
     5c2:	0f 89 9a 00 00 00    	jns    662 <main+0x662>
     5c8:	0f b6 85 eb fa ff ff 	movzbl -0x515(%ebp),%eax
     5cf:	e9 fd fd ff ff       	jmp    3d1 <main+0x3d1>
		close(fd);
     5d4:	83 ec 0c             	sub    $0xc,%esp
     5d7:	ff b5 d8 fa ff ff    	pushl  -0x528(%ebp)
     5dd:	e8 d7 0b 00 00       	call   11b9 <close>
     5e2:	83 c4 10             	add    $0x10,%esp
     5e5:	e9 b2 fb ff ff       	jmp    19c <main+0x19c>
		printf(1, "please input the command as [editor file_name]\n");
     5ea:	50                   	push   %eax
     5eb:	50                   	push   %eax
     5ec:	68 04 19 00 00       	push   $0x1904
     5f1:	6a 01                	push   $0x1
     5f3:	e8 08 0d 00 00       	call   1300 <printf>
		exit();
     5f8:	e8 94 0b 00 00       	call   1191 <exit>
				com_mod(text, atoi(&input[4]), &input[pos]);
     5fd:	83 ec 0c             	sub    $0xc,%esp
     600:	01 fe                	add    %edi,%esi
     602:	53                   	push   %ebx
     603:	e8 18 0b 00 00       	call   1120 <atoi>
     608:	83 c4 0c             	add    $0xc,%esp
     60b:	56                   	push   %esi
     60c:	e9 3e ff ff ff       	jmp    54f <main+0x54f>

	return i - 1;
     611:	c7 85 e4 fa ff ff ff 	movl   $0xff,-0x51c(%ebp)
     618:	00 00 00 
     61b:	e9 c0 fb ff ff       	jmp    1e0 <main+0x1e0>
				com_ins(text, stringtonumber(&input[4]), &input[pos]);
     620:	83 ec 0c             	sub    $0xc,%esp
     623:	01 fe                	add    %edi,%esi
     625:	53                   	push   %ebx
     626:	e8 e5 01 00 00       	call   810 <stringtonumber>
     62b:	83 c4 0c             	add    $0xc,%esp
     62e:	56                   	push   %esi
     62f:	50                   	push   %eax
     630:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     636:	50                   	push   %eax
     637:	e8 54 02 00 00       	call   890 <com_ins>
     63c:	83 c4 10             	add    $0x10,%esp
	int i = 0;
     63f:	31 c0                	xor    %eax,%eax
     641:	eb 0f                	jmp    652 <main+0x652>
     643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     647:	90                   	nop
	for (; i < MAX_LINE_NUMBER; i++)
     648:	83 c0 01             	add    $0x1,%eax
     64b:	3d 00 01 00 00       	cmp    $0x100,%eax
     650:	74 bf                	je     611 <main+0x611>
		if (text[i] == NULL)
     652:	8b 94 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%edx
     659:	85 d2                	test   %edx,%edx
     65b:	75 eb                	jne    648 <main+0x648>
     65d:	e9 27 fd ff ff       	jmp    389 <main+0x389>
				com_del(text, atoi(&input[4]));
     662:	83 ec 0c             	sub    $0xc,%esp
     665:	53                   	push   %ebx
     666:	e8 b5 0a 00 00       	call   1120 <atoi>
     66b:	5a                   	pop    %edx
     66c:	59                   	pop    %ecx
     66d:	50                   	push   %eax
     66e:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     674:	50                   	push   %eax
     675:	e8 06 05 00 00       	call   b80 <com_del>
     67a:	83 c4 10             	add    $0x10,%esp
	int i = 0;
     67d:	31 c0                	xor    %eax,%eax
     67f:	eb 15                	jmp    696 <main+0x696>
     681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	for (; i < MAX_LINE_NUMBER; i++)
     688:	83 c0 01             	add    $0x1,%eax
     68b:	3d 00 01 00 00       	cmp    $0x100,%eax
     690:	0f 84 7b ff ff ff    	je     611 <main+0x611>
		if (text[i] == NULL)
     696:	8b b4 85 e8 fb ff ff 	mov    -0x418(%ebp,%eax,4),%esi
     69d:	85 f6                	test   %esi,%esi
     69f:	75 e7                	jne    688 <main+0x688>
     6a1:	e9 e3 fc ff ff       	jmp    389 <main+0x389>
     6a6:	66 90                	xchg   %ax,%ax
     6a8:	66 90                	xchg   %ax,%ax
     6aa:	66 90                	xchg   %ax,%ax
     6ac:	66 90                	xchg   %ax,%ax
     6ae:	66 90                	xchg   %ax,%ax

000006b0 <strcat_n.part.0>:
char* strcat_n(char* dest, char* src, int len)
     6b0:	55                   	push   %ebp
     6b1:	89 e5                	mov    %esp,%ebp
     6b3:	57                   	push   %edi
     6b4:	89 cf                	mov    %ecx,%edi
     6b6:	56                   	push   %esi
     6b7:	89 c6                	mov    %eax,%esi
     6b9:	53                   	push   %ebx
     6ba:	89 d3                	mov    %edx,%ebx
     6bc:	83 ec 18             	sub    $0x18,%esp
	int pos = strlen(dest);
     6bf:	50                   	push   %eax
     6c0:	e8 fb 08 00 00       	call   fc0 <strlen>
	if (len + pos >= MAX_LINE_LENGTH)
     6c5:	83 c4 10             	add    $0x10,%esp
     6c8:	8d 0c 38             	lea    (%eax,%edi,1),%ecx
     6cb:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
     6d1:	7f 21                	jg     6f4 <strcat_n.part.0+0x44>
	for (; i < len; i++)
     6d3:	85 ff                	test   %edi,%edi
     6d5:	7e 19                	jle    6f0 <strcat_n.part.0+0x40>
     6d7:	89 da                	mov    %ebx,%edx
     6d9:	01 f0                	add    %esi,%eax
     6db:	01 df                	add    %ebx,%edi
     6dd:	8d 76 00             	lea    0x0(%esi),%esi
		dest[i+pos] = src[i];
     6e0:	0f b6 1a             	movzbl (%edx),%ebx
     6e3:	83 c2 01             	add    $0x1,%edx
     6e6:	83 c0 01             	add    $0x1,%eax
     6e9:	88 58 ff             	mov    %bl,-0x1(%eax)
	for (; i < len; i++)
     6ec:	39 fa                	cmp    %edi,%edx
     6ee:	75 f0                	jne    6e0 <strcat_n.part.0+0x30>
	dest[len+pos] = '\0';
     6f0:	c6 04 0e 00          	movb   $0x0,(%esi,%ecx,1)
}
     6f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6f7:	5b                   	pop    %ebx
     6f8:	5e                   	pop    %esi
     6f9:	5f                   	pop    %edi
     6fa:	5d                   	pop    %ebp
     6fb:	c3                   	ret    
     6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <strcat_n>:
{
     700:	55                   	push   %ebp
     701:	89 e5                	mov    %esp,%ebp
     703:	53                   	push   %ebx
     704:	83 ec 04             	sub    $0x4,%esp
     707:	8b 4d 10             	mov    0x10(%ebp),%ecx
     70a:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (len <= 0)
     70d:	85 c9                	test   %ecx,%ecx
     70f:	7e 0a                	jle    71b <strcat_n+0x1b>
     711:	8b 55 0c             	mov    0xc(%ebp),%edx
     714:	89 d8                	mov    %ebx,%eax
     716:	e8 95 ff ff ff       	call   6b0 <strcat_n.part.0>
}
     71b:	83 c4 04             	add    $0x4,%esp
     71e:	89 d8                	mov    %ebx,%eax
     720:	5b                   	pop    %ebx
     721:	5d                   	pop    %ebp
     722:	c3                   	ret    
     723:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000730 <show_text>:
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	83 ec 14             	sub    $0x14,%esp
     739:	8b 7d 08             	mov    0x8(%ebp),%edi
	printf(1, "**************\n");
     73c:	68 68 16 00 00       	push   $0x1668
     741:	6a 01                	push   $0x1
     743:	e8 b8 0b 00 00       	call   1300 <printf>
	printf(1, "the contents of the file are:\n");
     748:	58                   	pop    %eax
     749:	5a                   	pop    %edx
     74a:	68 f8 17 00 00       	push   $0x17f8
     74f:	6a 01                	push   $0x1
     751:	e8 aa 0b 00 00       	call   1300 <printf>
	for (; text[j] != NULL; j++)
     756:	8b 07                	mov    (%edi),%eax
     758:	83 c4 10             	add    $0x10,%esp
     75b:	85 c0                	test   %eax,%eax
     75d:	74 5b                	je     7ba <show_text+0x8a>
	int j = 0;
     75f:	31 db                	xor    %ebx,%ebx
		printf(1, "%d%d%d:%s\n", (j+1)/100, ((j+1)%100)/10, (j+1)%10, text[j]);
     761:	be cd cc cc cc       	mov    $0xcccccccd,%esi
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
     770:	83 ec 08             	sub    $0x8,%esp
     773:	83 c3 01             	add    $0x1,%ebx
     776:	50                   	push   %eax
     777:	89 d8                	mov    %ebx,%eax
     779:	89 d9                	mov    %ebx,%ecx
     77b:	f7 e6                	mul    %esi
     77d:	c1 ea 03             	shr    $0x3,%edx
     780:	8d 04 92             	lea    (%edx,%edx,4),%eax
     783:	01 c0                	add    %eax,%eax
     785:	29 c1                	sub    %eax,%ecx
     787:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     78c:	f7 e3                	mul    %ebx
     78e:	51                   	push   %ecx
     78f:	89 d1                	mov    %edx,%ecx
     791:	89 da                	mov    %ebx,%edx
     793:	c1 e9 05             	shr    $0x5,%ecx
     796:	6b c1 64             	imul   $0x64,%ecx,%eax
     799:	29 c2                	sub    %eax,%edx
     79b:	89 d0                	mov    %edx,%eax
     79d:	f7 e6                	mul    %esi
     79f:	c1 ea 03             	shr    $0x3,%edx
     7a2:	52                   	push   %edx
     7a3:	51                   	push   %ecx
     7a4:	68 78 16 00 00       	push   $0x1678
     7a9:	6a 01                	push   $0x1
     7ab:	e8 50 0b 00 00       	call   1300 <printf>
	for (; text[j] != NULL; j++)
     7b0:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
     7b3:	83 c4 20             	add    $0x20,%esp
     7b6:	85 c0                	test   %eax,%eax
     7b8:	75 b6                	jne    770 <show_text+0x40>
}
     7ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7bd:	5b                   	pop    %ebx
     7be:	5e                   	pop    %esi
     7bf:	5f                   	pop    %edi
     7c0:	5d                   	pop    %ebp
     7c1:	c3                   	ret    
     7c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007d0 <get_line_number>:
{
     7d0:	55                   	push   %ebp
	int i = 0;
     7d1:	31 c0                	xor    %eax,%eax
{
     7d3:	89 e5                	mov    %esp,%ebp
     7d5:	8b 55 08             	mov    0x8(%ebp),%edx
     7d8:	eb 10                	jmp    7ea <get_line_number+0x1a>
     7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	for (; i < MAX_LINE_NUMBER; i++)
     7e0:	83 c0 01             	add    $0x1,%eax
     7e3:	3d 00 01 00 00       	cmp    $0x100,%eax
     7e8:	74 16                	je     800 <get_line_number+0x30>
		if (text[i] == NULL)
     7ea:	8b 0c 82             	mov    (%edx,%eax,4),%ecx
     7ed:	85 c9                	test   %ecx,%ecx
     7ef:	75 ef                	jne    7e0 <get_line_number+0x10>
			return i - 1;
     7f1:	83 e8 01             	sub    $0x1,%eax

}
     7f4:	5d                   	pop    %ebp
     7f5:	c3                   	ret    
     7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7fd:	8d 76 00             	lea    0x0(%esi),%esi
	return i - 1;
     800:	b8 ff 00 00 00       	mov    $0xff,%eax
}
     805:	5d                   	pop    %ebp
     806:	c3                   	ret    
     807:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     80e:	66 90                	xchg   %ax,%ax

00000810 <stringtonumber>:



int stringtonumber(char* src)

{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	57                   	push   %edi
     814:	56                   	push   %esi
     815:	53                   	push   %ebx
     816:	83 ec 18             	sub    $0x18,%esp
     819:	8b 5d 08             	mov    0x8(%ebp),%ebx

	int number = 0; 

	int i=0;

	int pos = strlen(src);
     81c:	53                   	push   %ebx
     81d:	e8 9e 07 00 00       	call   fc0 <strlen>

	for(;i<pos;i++)
     822:	83 c4 10             	add    $0x10,%esp
     825:	85 c0                	test   %eax,%eax
     827:	7e 54                	jle    87d <stringtonumber+0x6d>

	{

		if(src[i]==' ') break;
     829:	0f be 13             	movsbl (%ebx),%edx
     82c:	80 fa 20             	cmp    $0x20,%dl
     82f:	74 4c                	je     87d <stringtonumber+0x6d>

		if(src[i]>57||src[i]<48) return -1;
     831:	8d 4a d0             	lea    -0x30(%edx),%ecx
     834:	80 f9 09             	cmp    $0x9,%cl
     837:	77 37                	ja     870 <stringtonumber+0x60>
     839:	8d 3c 03             	lea    (%ebx,%eax,1),%edi
     83c:	8d 4b 01             	lea    0x1(%ebx),%ecx
	int number = 0; 
     83f:	31 c0                	xor    %eax,%eax
     841:	eb 1a                	jmp    85d <stringtonumber+0x4d>
     843:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     847:	90                   	nop
		if(src[i]==' ') break;
     848:	0f be 11             	movsbl (%ecx),%edx
     84b:	80 fa 20             	cmp    $0x20,%dl
     84e:	74 18                	je     868 <stringtonumber+0x58>
		if(src[i]>57||src[i]<48) return -1;
     850:	8d 72 d0             	lea    -0x30(%edx),%esi
     853:	83 c1 01             	add    $0x1,%ecx
     856:	89 f3                	mov    %esi,%ebx
     858:	80 fb 09             	cmp    $0x9,%bl
     85b:	77 13                	ja     870 <stringtonumber+0x60>

		number=10*number+(src[i]-48);
     85d:	8d 04 80             	lea    (%eax,%eax,4),%eax
     860:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	for(;i<pos;i++)
     864:	39 f9                	cmp    %edi,%ecx
     866:	75 e0                	jne    848 <stringtonumber+0x38>

	}

	return number;

}
     868:	8d 65 f4             	lea    -0xc(%ebp),%esp
     86b:	5b                   	pop    %ebx
     86c:	5e                   	pop    %esi
     86d:	5f                   	pop    %edi
     86e:	5d                   	pop    %ebp
     86f:	c3                   	ret    
     870:	8d 65 f4             	lea    -0xc(%ebp),%esp
		if(src[i]>57||src[i]<48) return -1;
     873:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     878:	5b                   	pop    %ebx
     879:	5e                   	pop    %esi
     87a:	5f                   	pop    %edi
     87b:	5d                   	pop    %ebp
     87c:	c3                   	ret    
	int number = 0; 
     87d:	31 c0                	xor    %eax,%eax
     87f:	eb e7                	jmp    868 <stringtonumber+0x58>
     881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     88f:	90                   	nop

00000890 <com_ins>:



void com_ins(char *text[], int n, char *extra)

{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	81 ec 0c 01 00 00    	sub    $0x10c,%esp

	if (n < 0 || n > get_line_number(text) + 1)
     89c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
{
     89f:	8b 75 08             	mov    0x8(%ebp),%esi
	if (n < 0 || n > get_line_number(text) + 1)
     8a2:	85 c9                	test   %ecx,%ecx
     8a4:	0f 88 4e 01 00 00    	js     9f8 <com_ins+0x168>
	int i = 0;
     8aa:	31 c0                	xor    %eax,%eax
     8ac:	eb 0c                	jmp    8ba <com_ins+0x2a>
     8ae:	66 90                	xchg   %ax,%ax
	for (; i < MAX_LINE_NUMBER; i++)
     8b0:	83 c0 01             	add    $0x1,%eax
     8b3:	3d 00 01 00 00       	cmp    $0x100,%eax
     8b8:	74 07                	je     8c1 <com_ins+0x31>
		if (text[i] == NULL)
     8ba:	8b 14 86             	mov    (%esi,%eax,4),%edx
     8bd:	85 d2                	test   %edx,%edx
     8bf:	75 ef                	jne    8b0 <com_ins+0x20>
	if (n < 0 || n > get_line_number(text) + 1)
     8c1:	39 45 0c             	cmp    %eax,0xc(%ebp)
     8c4:	0f 8f 2e 01 00 00    	jg     9f8 <com_ins+0x168>

		return;

	}

	char input[MAX_LINE_LENGTH] = {};
     8ca:	31 c0                	xor    %eax,%eax
     8cc:	b9 40 00 00 00       	mov    $0x40,%ecx
     8d1:	8d bd e8 fe ff ff    	lea    -0x118(%ebp),%edi
     8d7:	f3 ab                	rep stos %eax,%es:(%edi)

	if (*extra == '\0')
     8d9:	8b 45 10             	mov    0x10(%ebp),%eax
     8dc:	80 38 00             	cmpb   $0x0,(%eax)
     8df:	74 7f                	je     960 <com_ins+0xd0>

	}

	else

		strcpy(input, extra);
     8e1:	83 ec 08             	sub    $0x8,%esp
     8e4:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     8ea:	ff 75 10             	pushl  0x10(%ebp)
     8ed:	50                   	push   %eax
     8ee:	e8 4d 06 00 00       	call   f40 <strcpy>
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	8b 45 0c             	mov    0xc(%ebp),%eax
     8f9:	8d 9e fc 03 00 00    	lea    0x3fc(%esi),%ebx
     8ff:	8d 3c 86             	lea    (%esi,%eax,4),%edi

	int i = MAX_LINE_NUMBER - 1;

	for (; i > n; i--)
     902:	3d fe 00 00 00       	cmp    $0xfe,%eax
     907:	7e 2d                	jle    936 <com_ins+0xa6>
     909:	e9 92 00 00 00       	jmp    9a0 <com_ins+0x110>
     90e:	66 90                	xchg   %ax,%ax

		else if (text[i] != NULL && text[i-1] != NULL)

		{

			memset(text[i], 0, MAX_LINE_LENGTH);
     910:	83 ec 04             	sub    $0x4,%esp
     913:	68 00 01 00 00       	push   $0x100
     918:	6a 00                	push   $0x0
     91a:	50                   	push   %eax
     91b:	e8 d0 06 00 00       	call   ff0 <memset>

			strcpy(text[i], text[i-1]);
     920:	58                   	pop    %eax
     921:	5a                   	pop    %edx
     922:	ff 73 fc             	pushl  -0x4(%ebx)
     925:	ff 33                	pushl  (%ebx)
     927:	e8 14 06 00 00       	call   f40 <strcpy>
     92c:	83 c4 10             	add    $0x10,%esp
     92f:	83 eb 04             	sub    $0x4,%ebx
	for (; i > n; i--)
     932:	39 fb                	cmp    %edi,%ebx
     934:	74 6a                	je     9a0 <com_ins+0x110>
		if (text[i-1] == NULL)
     936:	8b 4b fc             	mov    -0x4(%ebx),%ecx
     939:	85 c9                	test   %ecx,%ecx
     93b:	74 f2                	je     92f <com_ins+0x9f>
		else if (text[i] == NULL && text[i-1] != NULL)
     93d:	8b 03                	mov    (%ebx),%eax
     93f:	85 c0                	test   %eax,%eax
     941:	75 cd                	jne    910 <com_ins+0x80>
			text[i] = malloc(MAX_LINE_LENGTH);
     943:	83 ec 0c             	sub    $0xc,%esp
     946:	68 00 01 00 00       	push   $0x100
     94b:	e8 10 0c 00 00       	call   1560 <malloc>
			memset(text[i], 0, MAX_LINE_LENGTH);
     950:	83 c4 0c             	add    $0xc,%esp
			text[i] = malloc(MAX_LINE_LENGTH);
     953:	89 03                	mov    %eax,(%ebx)
			memset(text[i], 0, MAX_LINE_LENGTH);
     955:	eb bc                	jmp    913 <com_ins+0x83>
     957:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     95e:	66 90                	xchg   %ax,%ax
		printf(1, "please input content:\n");
     960:	83 ec 08             	sub    $0x8,%esp
     963:	68 98 16 00 00       	push   $0x1698
     968:	6a 01                	push   $0x1
     96a:	e8 91 09 00 00       	call   1300 <printf>
		gets(input, MAX_LINE_LENGTH);
     96f:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     975:	5b                   	pop    %ebx
     976:	5f                   	pop    %edi
     977:	68 00 01 00 00       	push   $0x100
     97c:	50                   	push   %eax
     97d:	e8 ce 06 00 00       	call   1050 <gets>
		input[strlen(input)-1] = '\0';
     982:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     988:	89 04 24             	mov    %eax,(%esp)
     98b:	e8 30 06 00 00       	call   fc0 <strlen>
     990:	83 c4 10             	add    $0x10,%esp
     993:	c6 84 05 e7 fe ff ff 	movb   $0x0,-0x119(%ebp,%eax,1)
     99a:	00 
     99b:	e9 56 ff ff ff       	jmp    8f6 <com_ins+0x66>

		}

	}

	if (text[n] == NULL)
     9a0:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a3:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
     9aa:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
     9ad:	8b 07                	mov    (%edi),%eax
     9af:	85 c0                	test   %eax,%eax
     9b1:	74 65                	je     a18 <com_ins+0x188>

		}

	}

	memset(text[n], 0, MAX_LINE_LENGTH);
     9b3:	83 ec 04             	sub    $0x4,%esp
     9b6:	68 00 01 00 00       	push   $0x100
     9bb:	6a 00                	push   $0x0
     9bd:	50                   	push   %eax
     9be:	e8 2d 06 00 00       	call   ff0 <memset>

	strcpy(text[n], input);
     9c3:	58                   	pop    %eax
     9c4:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     9ca:	5a                   	pop    %edx
     9cb:	50                   	push   %eax
     9cc:	ff 37                	pushl  (%edi)
			strcpy(text[n-1], input);
     9ce:	e8 6d 05 00 00       	call   f40 <strcpy>
			if (auto_show == 1)
     9d3:	83 c4 10             	add    $0x10,%esp
     9d6:	83 3d a0 1e 00 00 01 	cmpl   $0x1,0x1ea0
			changed = 1;
     9dd:	c7 05 a4 1e 00 00 01 	movl   $0x1,0x1ea4
     9e4:	00 00 00 
			if (auto_show == 1)
     9e7:	74 70                	je     a59 <com_ins+0x1c9>

	if (auto_show == 1)

		show_text(text);

}
     9e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9ec:	5b                   	pop    %ebx
     9ed:	5e                   	pop    %esi
     9ee:	5f                   	pop    %edi
     9ef:	5d                   	pop    %ebp
     9f0:	c3                   	ret    
     9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		printf(1, "invalid line number\n");
     9f8:	83 ec 08             	sub    $0x8,%esp
     9fb:	68 83 16 00 00       	push   $0x1683
     a00:	6a 01                	push   $0x1
     a02:	e8 f9 08 00 00       	call   1300 <printf>
		return;
     a07:	83 c4 10             	add    $0x10,%esp
}
     a0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a0d:	5b                   	pop    %ebx
     a0e:	5e                   	pop    %esi
     a0f:	5f                   	pop    %edi
     a10:	5d                   	pop    %ebp
     a11:	c3                   	ret    
     a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		text[n] = malloc(MAX_LINE_LENGTH);
     a18:	83 ec 0c             	sub    $0xc,%esp
		if (text[n-1][0] == '\0')
     a1b:	8d 5c 1e fc          	lea    -0x4(%esi,%ebx,1),%ebx
		text[n] = malloc(MAX_LINE_LENGTH);
     a1f:	68 00 01 00 00       	push   $0x100
     a24:	e8 37 0b 00 00       	call   1560 <malloc>
		if (text[n-1][0] == '\0')
     a29:	83 c4 10             	add    $0x10,%esp
		text[n] = malloc(MAX_LINE_LENGTH);
     a2c:	89 07                	mov    %eax,(%edi)
		if (text[n-1][0] == '\0')
     a2e:	8b 0b                	mov    (%ebx),%ecx
     a30:	80 39 00             	cmpb   $0x0,(%ecx)
     a33:	0f 85 7a ff ff ff    	jne    9b3 <com_ins+0x123>
			memset(text[n], 0, MAX_LINE_LENGTH);
     a39:	83 ec 04             	sub    $0x4,%esp
     a3c:	68 00 01 00 00       	push   $0x100
     a41:	6a 00                	push   $0x0
     a43:	50                   	push   %eax
     a44:	e8 a7 05 00 00       	call   ff0 <memset>
			strcpy(text[n-1], input);
     a49:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     a4f:	59                   	pop    %ecx
     a50:	5f                   	pop    %edi
     a51:	50                   	push   %eax
     a52:	ff 33                	pushl  (%ebx)
     a54:	e9 75 ff ff ff       	jmp    9ce <com_ins+0x13e>
				show_text(text);
     a59:	83 ec 0c             	sub    $0xc,%esp
     a5c:	56                   	push   %esi
     a5d:	e8 ce fc ff ff       	call   730 <show_text>
     a62:	83 c4 10             	add    $0x10,%esp
}
     a65:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a68:	5b                   	pop    %ebx
     a69:	5e                   	pop    %esi
     a6a:	5f                   	pop    %edi
     a6b:	5d                   	pop    %ebp
     a6c:	c3                   	ret    
     a6d:	8d 76 00             	lea    0x0(%esi),%esi

00000a70 <com_mod>:



void com_mod(char *text[], int n, char *extra)

{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	57                   	push   %edi
     a74:	56                   	push   %esi
     a75:	53                   	push   %ebx
     a76:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
     a7c:	8b 55 0c             	mov    0xc(%ebp),%edx
     a7f:	8b 5d 08             	mov    0x8(%ebp),%ebx

	if (n <= 0 || n > get_line_number(text) + 1)
     a82:	85 d2                	test   %edx,%edx
     a84:	0f 8e c6 00 00 00    	jle    b50 <com_mod+0xe0>
	int i = 0;
     a8a:	31 c0                	xor    %eax,%eax
     a8c:	eb 0c                	jmp    a9a <com_mod+0x2a>
     a8e:	66 90                	xchg   %ax,%ax
	for (; i < MAX_LINE_NUMBER; i++)
     a90:	83 c0 01             	add    $0x1,%eax
     a93:	3d 00 01 00 00       	cmp    $0x100,%eax
     a98:	74 07                	je     aa1 <com_mod+0x31>
		if (text[i] == NULL)
     a9a:	8b 0c 83             	mov    (%ebx,%eax,4),%ecx
     a9d:	85 c9                	test   %ecx,%ecx
     a9f:	75 ef                	jne    a90 <com_mod+0x20>
	if (n <= 0 || n > get_line_number(text) + 1)
     aa1:	39 c2                	cmp    %eax,%edx
     aa3:	0f 8f a7 00 00 00    	jg     b50 <com_mod+0xe0>

		return;

	}

	char input[MAX_LINE_LENGTH] = {};
     aa9:	8d b5 e8 fe ff ff    	lea    -0x118(%ebp),%esi
     aaf:	31 c0                	xor    %eax,%eax
     ab1:	b9 40 00 00 00       	mov    $0x40,%ecx
     ab6:	89 f7                	mov    %esi,%edi
     ab8:	f3 ab                	rep stos %eax,%es:(%edi)

	if (*extra == '\0')
     aba:	8b 45 10             	mov    0x10(%ebp),%eax
     abd:	80 38 00             	cmpb   $0x0,(%eax)
     ac0:	74 56                	je     b18 <com_mod+0xa8>

	}

	else

		strcpy(input, extra);
     ac2:	83 ec 08             	sub    $0x8,%esp
     ac5:	ff 75 10             	pushl  0x10(%ebp)
     ac8:	56                   	push   %esi
     ac9:	89 55 0c             	mov    %edx,0xc(%ebp)
     acc:	e8 6f 04 00 00       	call   f40 <strcpy>
     ad1:	8b 55 0c             	mov    0xc(%ebp),%edx
     ad4:	83 c4 10             	add    $0x10,%esp

	memset(text[n-1], 0, MAX_LINE_LENGTH);
     ad7:	83 ec 04             	sub    $0x4,%esp
     ada:	8d 7c 93 fc          	lea    -0x4(%ebx,%edx,4),%edi
     ade:	68 00 01 00 00       	push   $0x100
     ae3:	6a 00                	push   $0x0
     ae5:	ff 37                	pushl  (%edi)
     ae7:	e8 04 05 00 00       	call   ff0 <memset>

	strcpy(text[n-1], input);
     aec:	58                   	pop    %eax
     aed:	5a                   	pop    %edx
     aee:	56                   	push   %esi
     aef:	ff 37                	pushl  (%edi)
     af1:	e8 4a 04 00 00       	call   f40 <strcpy>

	changed = 1;

	if (auto_show == 1)
     af6:	83 c4 10             	add    $0x10,%esp
     af9:	83 3d a0 1e 00 00 01 	cmpl   $0x1,0x1ea0
	changed = 1;
     b00:	c7 05 a4 1e 00 00 01 	movl   $0x1,0x1ea4
     b07:	00 00 00 
	if (auto_show == 1)
     b0a:	74 5e                	je     b6a <com_mod+0xfa>

		show_text(text);

}
     b0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b0f:	5b                   	pop    %ebx
     b10:	5e                   	pop    %esi
     b11:	5f                   	pop    %edi
     b12:	5d                   	pop    %ebp
     b13:	c3                   	ret    
     b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		printf(1, "please input content:\n");
     b18:	83 ec 08             	sub    $0x8,%esp
     b1b:	89 55 0c             	mov    %edx,0xc(%ebp)
     b1e:	68 98 16 00 00       	push   $0x1698
     b23:	6a 01                	push   $0x1
     b25:	e8 d6 07 00 00       	call   1300 <printf>
		gets(input, MAX_LINE_LENGTH);
     b2a:	59                   	pop    %ecx
     b2b:	5f                   	pop    %edi
     b2c:	68 00 01 00 00       	push   $0x100
     b31:	56                   	push   %esi
     b32:	e8 19 05 00 00       	call   1050 <gets>
		input[strlen(input)-1] = '\0';
     b37:	89 34 24             	mov    %esi,(%esp)
     b3a:	e8 81 04 00 00       	call   fc0 <strlen>
     b3f:	83 c4 10             	add    $0x10,%esp
     b42:	8b 55 0c             	mov    0xc(%ebp),%edx
     b45:	c6 84 05 e7 fe ff ff 	movb   $0x0,-0x119(%ebp,%eax,1)
     b4c:	00 
     b4d:	eb 88                	jmp    ad7 <com_mod+0x67>
     b4f:	90                   	nop
		printf(1, "invalid line number\n");
     b50:	83 ec 08             	sub    $0x8,%esp
     b53:	68 83 16 00 00       	push   $0x1683
     b58:	6a 01                	push   $0x1
     b5a:	e8 a1 07 00 00       	call   1300 <printf>
     b5f:	83 c4 10             	add    $0x10,%esp
}
     b62:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b65:	5b                   	pop    %ebx
     b66:	5e                   	pop    %esi
     b67:	5f                   	pop    %edi
     b68:	5d                   	pop    %ebp
     b69:	c3                   	ret    
		show_text(text);
     b6a:	83 ec 0c             	sub    $0xc,%esp
     b6d:	53                   	push   %ebx
     b6e:	e8 bd fb ff ff       	call   730 <show_text>
     b73:	83 c4 10             	add    $0x10,%esp
}
     b76:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b79:	5b                   	pop    %ebx
     b7a:	5e                   	pop    %esi
     b7b:	5f                   	pop    %edi
     b7c:	5d                   	pop    %ebp
     b7d:	c3                   	ret    
     b7e:	66 90                	xchg   %ax,%ax

00000b80 <com_del>:



void com_del(char *text[], int n)

{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	56                   	push   %esi
     b85:	53                   	push   %ebx
     b86:	83 ec 1c             	sub    $0x1c,%esp
     b89:	8b 7d 0c             	mov    0xc(%ebp),%edi
     b8c:	8b 5d 08             	mov    0x8(%ebp),%ebx

	if (n <= 0 || n > get_line_number(text) + 1)
     b8f:	85 ff                	test   %edi,%edi
     b91:	7e 22                	jle    bb5 <com_del+0x35>
	int i = 0;
     b93:	31 c0                	xor    %eax,%eax
     b95:	eb 13                	jmp    baa <com_del+0x2a>
     b97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9e:	66 90                	xchg   %ax,%ax
	for (; i < MAX_LINE_NUMBER; i++)
     ba0:	83 c0 01             	add    $0x1,%eax
     ba3:	3d 00 01 00 00       	cmp    $0x100,%eax
     ba8:	74 07                	je     bb1 <com_del+0x31>
		if (text[i] == NULL)
     baa:	8b 14 83             	mov    (%ebx,%eax,4),%edx
     bad:	85 d2                	test   %edx,%edx
     baf:	75 ef                	jne    ba0 <com_del+0x20>
	if (n <= 0 || n > get_line_number(text) + 1)
     bb1:	39 c7                	cmp    %eax,%edi
     bb3:	7e 1b                	jle    bd0 <com_del+0x50>

	{

		printf(1, "invalid line number\n");
     bb5:	c7 45 0c 83 16 00 00 	movl   $0x1683,0xc(%ebp)
     bbc:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)

	if (auto_show == 1)

		show_text(text);

}
     bc3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bc6:	5b                   	pop    %ebx
     bc7:	5e                   	pop    %esi
     bc8:	5f                   	pop    %edi
     bc9:	5d                   	pop    %ebp
		printf(1, "invalid line number\n");
     bca:	e9 31 07 00 00       	jmp    1300 <printf>
     bcf:	90                   	nop
	memset(text[n-1], 0, MAX_LINE_LENGTH);
     bd0:	83 ec 04             	sub    $0x4,%esp
     bd3:	8d 87 ff ff ff 3f    	lea    0x3fffffff(%edi),%eax
	int i = n - 1;
     bd9:	8d 77 ff             	lea    -0x1(%edi),%esi
	memset(text[n-1], 0, MAX_LINE_LENGTH);
     bdc:	68 00 01 00 00       	push   $0x100
     be1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     be8:	6a 00                	push   $0x0
     bea:	ff 34 83             	pushl  (%ebx,%eax,4)
     bed:	89 55 e4             	mov    %edx,-0x1c(%ebp)
     bf0:	e8 fb 03 00 00       	call   ff0 <memset>
	for (; text[i+1] != NULL; i++)
     bf5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     bf8:	83 c4 10             	add    $0x10,%esp
     bfb:	8d 4c 13 04          	lea    0x4(%ebx,%edx,1),%ecx
     bff:	8b 01                	mov    (%ecx),%eax
     c01:	85 c0                	test   %eax,%eax
     c03:	74 50                	je     c55 <com_del+0xd5>
     c05:	8d 14 bd 00 00 00 00 	lea    0x0(,%edi,4),%edx
     c0c:	29 d1                	sub    %edx,%ecx
     c0e:	89 cf                	mov    %ecx,%edi
		strcpy(text[i], text[i+1]);
     c10:	83 ec 08             	sub    $0x8,%esp
     c13:	50                   	push   %eax
     c14:	ff 34 b3             	pushl  (%ebx,%esi,4)
     c17:	e8 24 03 00 00       	call   f40 <strcpy>
		memset(text[i+1], 0, MAX_LINE_LENGTH);
     c1c:	83 c4 0c             	add    $0xc,%esp
     c1f:	68 00 01 00 00       	push   $0x100
     c24:	6a 00                	push   $0x0
     c26:	ff 74 b7 04          	pushl  0x4(%edi,%esi,4)
	for (; text[i+1] != NULL; i++)
     c2a:	83 c6 01             	add    $0x1,%esi
		memset(text[i+1], 0, MAX_LINE_LENGTH);
     c2d:	e8 be 03 00 00       	call   ff0 <memset>
	for (; text[i+1] != NULL; i++)
     c32:	8b 44 b3 04          	mov    0x4(%ebx,%esi,4),%eax
     c36:	83 c4 10             	add    $0x10,%esp
     c39:	85 c0                	test   %eax,%eax
     c3b:	75 d3                	jne    c10 <com_del+0x90>
		free(text[i]);
     c3d:	8d 34 b3             	lea    (%ebx,%esi,4),%esi
     c40:	83 ec 0c             	sub    $0xc,%esp
     c43:	ff 36                	pushl  (%esi)
     c45:	e8 86 08 00 00       	call   14d0 <free>
		text[i] = 0;
     c4a:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     c50:	83 c4 10             	add    $0x10,%esp
     c53:	eb 04                	jmp    c59 <com_del+0xd9>
	if (i != 0)
     c55:	85 f6                	test   %esi,%esi
     c57:	75 e4                	jne    c3d <com_del+0xbd>
	if (auto_show == 1)
     c59:	83 3d a0 1e 00 00 01 	cmpl   $0x1,0x1ea0
	changed = 1;
     c60:	c7 05 a4 1e 00 00 01 	movl   $0x1,0x1ea4
     c67:	00 00 00 
	if (auto_show == 1)
     c6a:	74 08                	je     c74 <com_del+0xf4>
}
     c6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c6f:	5b                   	pop    %ebx
     c70:	5e                   	pop    %esi
     c71:	5f                   	pop    %edi
     c72:	5d                   	pop    %ebp
     c73:	c3                   	ret    
		show_text(text);
     c74:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     c77:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7a:	5b                   	pop    %ebx
     c7b:	5e                   	pop    %esi
     c7c:	5f                   	pop    %edi
     c7d:	5d                   	pop    %ebp
		show_text(text);
     c7e:	e9 ad fa ff ff       	jmp    730 <show_text>
     c83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c90 <com_help>:



void com_help(char *text[])

{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	83 ec 10             	sub    $0x10,%esp

	printf(1, "**************\n");
     c96:	68 68 16 00 00       	push   $0x1668
     c9b:	6a 01                	push   $0x1
     c9d:	e8 5e 06 00 00       	call   1300 <printf>

	printf(1, "show, enable show current contents after executing a command.\n");
     ca2:	58                   	pop    %eax
     ca3:	5a                   	pop    %edx
     ca4:	68 18 18 00 00       	push   $0x1818
     ca9:	6a 01                	push   $0x1
     cab:	e8 50 06 00 00       	call   1300 <printf>

	printf(1, "hide, disable show current contents after executing a command.\n");
     cb0:	59                   	pop    %ecx
     cb1:	58                   	pop    %eax
     cb2:	68 58 18 00 00       	push   $0x1858
     cb7:	6a 01                	push   $0x1
     cb9:	e8 42 06 00 00       	call   1300 <printf>

	printf(1, "instructions for use:\n");
     cbe:	58                   	pop    %eax
     cbf:	5a                   	pop    %edx
     cc0:	68 af 16 00 00       	push   $0x16af
     cc5:	6a 01                	push   $0x1
     cc7:	e8 34 06 00 00       	call   1300 <printf>

	printf(1, "ins-n, insert a line after line n\n");
     ccc:	59                   	pop    %ecx
     ccd:	58                   	pop    %eax
     cce:	68 98 18 00 00       	push   $0x1898
     cd3:	6a 01                	push   $0x1
     cd5:	e8 26 06 00 00       	call   1300 <printf>

	printf(1, "mod-n, modify line n\n");
     cda:	58                   	pop    %eax
     cdb:	5a                   	pop    %edx
     cdc:	68 c6 16 00 00       	push   $0x16c6
     ce1:	6a 01                	push   $0x1
     ce3:	e8 18 06 00 00       	call   1300 <printf>

	printf(1, "del-n, delete line n\n");
     ce8:	59                   	pop    %ecx
     ce9:	58                   	pop    %eax
     cea:	68 dc 16 00 00       	push   $0x16dc
     cef:	6a 01                	push   $0x1
     cf1:	e8 0a 06 00 00       	call   1300 <printf>

	printf(1, "ins, insert a line after the last line\n");
     cf6:	58                   	pop    %eax
     cf7:	5a                   	pop    %edx
     cf8:	68 bc 18 00 00       	push   $0x18bc
     cfd:	6a 01                	push   $0x1
     cff:	e8 fc 05 00 00       	call   1300 <printf>

	printf(1, "mod, modify the last line\n");
     d04:	59                   	pop    %ecx
     d05:	58                   	pop    %eax
     d06:	68 f2 16 00 00       	push   $0x16f2
     d0b:	6a 01                	push   $0x1
     d0d:	e8 ee 05 00 00       	call   1300 <printf>

	printf(1, "del, delete the last line\n");
     d12:	58                   	pop    %eax
     d13:	5a                   	pop    %edx
     d14:	68 0d 17 00 00       	push   $0x170d
     d19:	6a 01                	push   $0x1
     d1b:	e8 e0 05 00 00       	call   1300 <printf>

	printf(1, "save, save the file\n");
     d20:	59                   	pop    %ecx
     d21:	58                   	pop    %eax
     d22:	68 28 17 00 00       	push   $0x1728
     d27:	6a 01                	push   $0x1
     d29:	e8 d2 05 00 00       	call   1300 <printf>

	printf(1, "exit, exit editor\n");
     d2e:	58                   	pop    %eax
     d2f:	5a                   	pop    %edx
     d30:	68 3d 17 00 00       	push   $0x173d
     d35:	6a 01                	push   $0x1
     d37:	e8 c4 05 00 00       	call   1300 <printf>

}
     d3c:	83 c4 10             	add    $0x10,%esp
     d3f:	c9                   	leave  
     d40:	c3                   	ret    
     d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d4f:	90                   	nop

00000d50 <com_save>:



void com_save(char *text[], char *path)

{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	57                   	push   %edi
     d54:	56                   	push   %esi
     d55:	53                   	push   %ebx
     d56:	83 ec 18             	sub    $0x18,%esp
     d59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     d5c:	8b 7d 08             	mov    0x8(%ebp),%edi

	unlink(path);
     d5f:	53                   	push   %ebx
     d60:	e8 7c 04 00 00       	call   11e1 <unlink>

	int fd = open(path, O_WRONLY|O_CREATE);
     d65:	58                   	pop    %eax
     d66:	5a                   	pop    %edx
     d67:	68 01 02 00 00       	push   $0x201
     d6c:	53                   	push   %ebx
     d6d:	e8 5f 04 00 00       	call   11d1 <open>

	if (fd == -1)
     d72:	83 c4 10             	add    $0x10,%esp
     d75:	83 f8 ff             	cmp    $0xffffffff,%eax
     d78:	0f 84 a1 00 00 00    	je     e1f <com_save+0xcf>
     d7e:	89 c6                	mov    %eax,%esi

		exit();

	}

	if (text[0] == NULL)
     d80:	8b 07                	mov    (%edi),%eax
     d82:	85 c0                	test   %eax,%eax
     d84:	0f 84 86 00 00 00    	je     e10 <com_save+0xc0>

		return;

	}

	write(fd, text[0], strlen(text[0]));
     d8a:	83 ec 0c             	sub    $0xc,%esp

	int i = 1;

	for (; text[i] != NULL; i++)
     d8d:	8d 5f 04             	lea    0x4(%edi),%ebx
	write(fd, text[0], strlen(text[0]));
     d90:	50                   	push   %eax
     d91:	e8 2a 02 00 00       	call   fc0 <strlen>
     d96:	83 c4 0c             	add    $0xc,%esp
     d99:	50                   	push   %eax
     d9a:	ff 37                	pushl  (%edi)
     d9c:	56                   	push   %esi
     d9d:	e8 0f 04 00 00       	call   11b1 <write>
	for (; text[i] != NULL; i++)
     da2:	8b 47 04             	mov    0x4(%edi),%eax
     da5:	83 c4 10             	add    $0x10,%esp
     da8:	85 c0                	test   %eax,%eax
     daa:	74 34                	je     de0 <com_save+0x90>
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

	{

		printf(fd, "\n");
     db0:	83 ec 08             	sub    $0x8,%esp
     db3:	83 c3 04             	add    $0x4,%ebx
     db6:	68 76 16 00 00       	push   $0x1676
     dbb:	56                   	push   %esi
     dbc:	e8 3f 05 00 00       	call   1300 <printf>

		write(fd, text[i], strlen(text[i]));
     dc1:	59                   	pop    %ecx
     dc2:	ff 73 fc             	pushl  -0x4(%ebx)
     dc5:	e8 f6 01 00 00       	call   fc0 <strlen>
     dca:	83 c4 0c             	add    $0xc,%esp
     dcd:	50                   	push   %eax
     dce:	ff 73 fc             	pushl  -0x4(%ebx)
     dd1:	56                   	push   %esi
     dd2:	e8 da 03 00 00       	call   11b1 <write>
	for (; text[i] != NULL; i++)
     dd7:	8b 3b                	mov    (%ebx),%edi
     dd9:	83 c4 10             	add    $0x10,%esp
     ddc:	85 ff                	test   %edi,%edi
     dde:	75 d0                	jne    db0 <com_save+0x60>

	}

	close(fd);
     de0:	83 ec 0c             	sub    $0xc,%esp
     de3:	56                   	push   %esi
     de4:	e8 d0 03 00 00       	call   11b9 <close>

	printf(1, "saved successfully\n");
     de9:	58                   	pop    %eax
     dea:	5a                   	pop    %edx
     deb:	68 50 17 00 00       	push   $0x1750
     df0:	6a 01                	push   $0x1
     df2:	e8 09 05 00 00       	call   1300 <printf>

	changed = 0;

	return;
     df7:	83 c4 10             	add    $0x10,%esp
	changed = 0;
     dfa:	c7 05 a4 1e 00 00 00 	movl   $0x0,0x1ea4
     e01:	00 00 00 

}
     e04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e07:	5b                   	pop    %ebx
     e08:	5e                   	pop    %esi
     e09:	5f                   	pop    %edi
     e0a:	5d                   	pop    %ebp
     e0b:	c3                   	ret    
     e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		close(fd);
     e10:	89 75 08             	mov    %esi,0x8(%ebp)
}
     e13:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e16:	5b                   	pop    %ebx
     e17:	5e                   	pop    %esi
     e18:	5f                   	pop    %edi
     e19:	5d                   	pop    %ebp
		close(fd);
     e1a:	e9 9a 03 00 00       	jmp    11b9 <close>
		printf(1, "save failed, file can't open:\n");
     e1f:	50                   	push   %eax
     e20:	50                   	push   %eax
     e21:	68 e4 18 00 00       	push   $0x18e4
     e26:	6a 01                	push   $0x1
     e28:	e8 d3 04 00 00       	call   1300 <printf>
		exit();
     e2d:	e8 5f 03 00 00       	call   1191 <exit>
     e32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e40 <com_exit>:



void com_exit(char *text[], char *path)

{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	81 ec 0c 01 00 00    	sub    $0x10c,%esp

	while (changed == 1)
     e4c:	83 3d a4 1e 00 00 01 	cmpl   $0x1,0x1ea4
{
     e53:	8b 75 08             	mov    0x8(%ebp),%esi
	while (changed == 1)
     e56:	0f 85 ae 00 00 00    	jne    f0a <com_exit+0xca>
     e5c:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     e62:	89 c3                	mov    %eax,%ebx
     e64:	89 c6                	mov    %eax,%esi
     e66:	eb 22                	jmp    e8a <com_exit+0x4a>
     e68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e6f:	90                   	nop

		input[strlen(input)-1] = '\0';

		if (strcmp(input, "y") == 0)

			com_save(text, path);
     e70:	83 ec 08             	sub    $0x8,%esp
     e73:	ff 75 0c             	pushl  0xc(%ebp)
     e76:	ff 75 08             	pushl  0x8(%ebp)
     e79:	e8 d2 fe ff ff       	call   d50 <com_save>
     e7e:	83 c4 10             	add    $0x10,%esp
	while (changed == 1)
     e81:	83 3d a4 1e 00 00 01 	cmpl   $0x1,0x1ea4
     e88:	75 7d                	jne    f07 <com_exit+0xc7>
		printf(1, "save the file? y/n\n");
     e8a:	83 ec 08             	sub    $0x8,%esp
		char input[MAX_LINE_LENGTH] = {};
     e8d:	89 f7                	mov    %esi,%edi
		gets(input, MAX_LINE_LENGTH);
     e8f:	89 de                	mov    %ebx,%esi
		printf(1, "save the file? y/n\n");
     e91:	68 64 17 00 00       	push   $0x1764
     e96:	6a 01                	push   $0x1
     e98:	e8 63 04 00 00       	call   1300 <printf>
		char input[MAX_LINE_LENGTH] = {};
     e9d:	31 c0                	xor    %eax,%eax
     e9f:	b9 40 00 00 00       	mov    $0x40,%ecx
     ea4:	f3 ab                	rep stos %eax,%es:(%edi)
		gets(input, MAX_LINE_LENGTH);
     ea6:	58                   	pop    %eax
     ea7:	5a                   	pop    %edx
     ea8:	68 00 01 00 00       	push   $0x100
     ead:	53                   	push   %ebx
     eae:	e8 9d 01 00 00       	call   1050 <gets>
		input[strlen(input)-1] = '\0';
     eb3:	89 1c 24             	mov    %ebx,(%esp)
     eb6:	e8 05 01 00 00       	call   fc0 <strlen>
		if (strcmp(input, "y") == 0)
     ebb:	59                   	pop    %ecx
     ebc:	5f                   	pop    %edi
     ebd:	68 78 17 00 00       	push   $0x1778
     ec2:	53                   	push   %ebx
		input[strlen(input)-1] = '\0';
     ec3:	c6 84 05 e7 fe ff ff 	movb   $0x0,-0x119(%ebp,%eax,1)
     eca:	00 
		if (strcmp(input, "y") == 0)
     ecb:	e8 a0 00 00 00       	call   f70 <strcmp>
     ed0:	83 c4 10             	add    $0x10,%esp
     ed3:	85 c0                	test   %eax,%eax
     ed5:	74 99                	je     e70 <com_exit+0x30>

		else if(strcmp(input, "n") == 0)
     ed7:	83 ec 08             	sub    $0x8,%esp
     eda:	68 7a 17 00 00       	push   $0x177a
     edf:	53                   	push   %ebx
     ee0:	e8 8b 00 00 00       	call   f70 <strcmp>
     ee5:	83 c4 10             	add    $0x10,%esp
     ee8:	85 c0                	test   %eax,%eax
     eea:	74 1b                	je     f07 <com_exit+0xc7>

			break;

		else

		printf(2, "wrong answer?\n");
     eec:	83 ec 08             	sub    $0x8,%esp
     eef:	68 7c 17 00 00       	push   $0x177c
     ef4:	6a 02                	push   $0x2
     ef6:	e8 05 04 00 00       	call   1300 <printf>
     efb:	83 c4 10             	add    $0x10,%esp
	while (changed == 1)
     efe:	83 3d a4 1e 00 00 01 	cmpl   $0x1,0x1ea4
     f05:	74 83                	je     e8a <com_exit+0x4a>
     f07:	8b 75 08             	mov    0x8(%ebp),%esi

	}

	int i = 0;

	for (; text[i] != NULL; i++)
     f0a:	8b 06                	mov    (%esi),%eax
     f0c:	85 c0                	test   %eax,%eax
     f0e:	74 1c                	je     f2c <com_exit+0xec>

	{

		free(text[i]);
     f10:	83 ec 0c             	sub    $0xc,%esp
     f13:	83 c6 04             	add    $0x4,%esi
     f16:	50                   	push   %eax
     f17:	e8 b4 05 00 00       	call   14d0 <free>

		text[i] = 0;
     f1c:	c7 46 fc 00 00 00 00 	movl   $0x0,-0x4(%esi)
	for (; text[i] != NULL; i++)
     f23:	8b 06                	mov    (%esi),%eax
     f25:	83 c4 10             	add    $0x10,%esp
     f28:	85 c0                	test   %eax,%eax
     f2a:	75 e4                	jne    f10 <com_exit+0xd0>

	}

	exit();
     f2c:	e8 60 02 00 00       	call   1191 <exit>
     f31:	66 90                	xchg   %ax,%ax
     f33:	66 90                	xchg   %ax,%ax
     f35:	66 90                	xchg   %ax,%ax
     f37:	66 90                	xchg   %ax,%ax
     f39:	66 90                	xchg   %ax,%ax
     f3b:	66 90                	xchg   %ax,%ax
     f3d:	66 90                	xchg   %ax,%ax
     f3f:	90                   	nop

00000f40 <strcpy>:
     f40:	55                   	push   %ebp
     f41:	31 d2                	xor    %edx,%edx
     f43:	89 e5                	mov    %esp,%ebp
     f45:	53                   	push   %ebx
     f46:	8b 45 08             	mov    0x8(%ebp),%eax
     f49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f50:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     f54:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     f57:	83 c2 01             	add    $0x1,%edx
     f5a:	84 c9                	test   %cl,%cl
     f5c:	75 f2                	jne    f50 <strcpy+0x10>
     f5e:	5b                   	pop    %ebx
     f5f:	5d                   	pop    %ebp
     f60:	c3                   	ret    
     f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f6f:	90                   	nop

00000f70 <strcmp>:
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	56                   	push   %esi
     f74:	53                   	push   %ebx
     f75:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f78:	8b 75 0c             	mov    0xc(%ebp),%esi
     f7b:	0f b6 13             	movzbl (%ebx),%edx
     f7e:	0f b6 0e             	movzbl (%esi),%ecx
     f81:	84 d2                	test   %dl,%dl
     f83:	74 1e                	je     fa3 <strcmp+0x33>
     f85:	b8 01 00 00 00       	mov    $0x1,%eax
     f8a:	38 ca                	cmp    %cl,%dl
     f8c:	74 09                	je     f97 <strcmp+0x27>
     f8e:	eb 20                	jmp    fb0 <strcmp+0x40>
     f90:	83 c0 01             	add    $0x1,%eax
     f93:	38 ca                	cmp    %cl,%dl
     f95:	75 19                	jne    fb0 <strcmp+0x40>
     f97:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     f9b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
     f9f:	84 d2                	test   %dl,%dl
     fa1:	75 ed                	jne    f90 <strcmp+0x20>
     fa3:	31 c0                	xor    %eax,%eax
     fa5:	5b                   	pop    %ebx
     fa6:	5e                   	pop    %esi
     fa7:	29 c8                	sub    %ecx,%eax
     fa9:	5d                   	pop    %ebp
     faa:	c3                   	ret    
     fab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     faf:	90                   	nop
     fb0:	0f b6 c2             	movzbl %dl,%eax
     fb3:	5b                   	pop    %ebx
     fb4:	5e                   	pop    %esi
     fb5:	29 c8                	sub    %ecx,%eax
     fb7:	5d                   	pop    %ebp
     fb8:	c3                   	ret    
     fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000fc0 <strlen>:
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fc6:	80 39 00             	cmpb   $0x0,(%ecx)
     fc9:	74 15                	je     fe0 <strlen+0x20>
     fcb:	31 d2                	xor    %edx,%edx
     fcd:	8d 76 00             	lea    0x0(%esi),%esi
     fd0:	83 c2 01             	add    $0x1,%edx
     fd3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     fd7:	89 d0                	mov    %edx,%eax
     fd9:	75 f5                	jne    fd0 <strlen+0x10>
     fdb:	5d                   	pop    %ebp
     fdc:	c3                   	ret    
     fdd:	8d 76 00             	lea    0x0(%esi),%esi
     fe0:	31 c0                	xor    %eax,%eax
     fe2:	5d                   	pop    %ebp
     fe3:	c3                   	ret    
     fe4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     feb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fef:	90                   	nop

00000ff0 <memset>:
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	57                   	push   %edi
     ff4:	8b 55 08             	mov    0x8(%ebp),%edx
     ff7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ffa:	8b 45 0c             	mov    0xc(%ebp),%eax
     ffd:	89 d7                	mov    %edx,%edi
     fff:	fc                   	cld    
    1000:	f3 aa                	rep stos %al,%es:(%edi)
    1002:	89 d0                	mov    %edx,%eax
    1004:	5f                   	pop    %edi
    1005:	5d                   	pop    %ebp
    1006:	c3                   	ret    
    1007:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100e:	66 90                	xchg   %ax,%ax

00001010 <strchr>:
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	53                   	push   %ebx
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	8b 55 0c             	mov    0xc(%ebp),%edx
    101a:	0f b6 18             	movzbl (%eax),%ebx
    101d:	84 db                	test   %bl,%bl
    101f:	74 1d                	je     103e <strchr+0x2e>
    1021:	89 d1                	mov    %edx,%ecx
    1023:	38 d3                	cmp    %dl,%bl
    1025:	75 0d                	jne    1034 <strchr+0x24>
    1027:	eb 17                	jmp    1040 <strchr+0x30>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1030:	38 ca                	cmp    %cl,%dl
    1032:	74 0c                	je     1040 <strchr+0x30>
    1034:	83 c0 01             	add    $0x1,%eax
    1037:	0f b6 10             	movzbl (%eax),%edx
    103a:	84 d2                	test   %dl,%dl
    103c:	75 f2                	jne    1030 <strchr+0x20>
    103e:	31 c0                	xor    %eax,%eax
    1040:	5b                   	pop    %ebx
    1041:	5d                   	pop    %ebp
    1042:	c3                   	ret    
    1043:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001050 <gets>:
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	31 f6                	xor    %esi,%esi
    1057:	53                   	push   %ebx
    1058:	89 f3                	mov    %esi,%ebx
    105a:	83 ec 1c             	sub    $0x1c,%esp
    105d:	8b 7d 08             	mov    0x8(%ebp),%edi
    1060:	eb 2f                	jmp    1091 <gets+0x41>
    1062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1068:	83 ec 04             	sub    $0x4,%esp
    106b:	8d 45 e7             	lea    -0x19(%ebp),%eax
    106e:	6a 01                	push   $0x1
    1070:	50                   	push   %eax
    1071:	6a 00                	push   $0x0
    1073:	e8 31 01 00 00       	call   11a9 <read>
    1078:	83 c4 10             	add    $0x10,%esp
    107b:	85 c0                	test   %eax,%eax
    107d:	7e 1c                	jle    109b <gets+0x4b>
    107f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1083:	83 c7 01             	add    $0x1,%edi
    1086:	88 47 ff             	mov    %al,-0x1(%edi)
    1089:	3c 0a                	cmp    $0xa,%al
    108b:	74 23                	je     10b0 <gets+0x60>
    108d:	3c 0d                	cmp    $0xd,%al
    108f:	74 1f                	je     10b0 <gets+0x60>
    1091:	83 c3 01             	add    $0x1,%ebx
    1094:	89 fe                	mov    %edi,%esi
    1096:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1099:	7c cd                	jl     1068 <gets+0x18>
    109b:	89 f3                	mov    %esi,%ebx
    109d:	8b 45 08             	mov    0x8(%ebp),%eax
    10a0:	c6 03 00             	movb   $0x0,(%ebx)
    10a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10a6:	5b                   	pop    %ebx
    10a7:	5e                   	pop    %esi
    10a8:	5f                   	pop    %edi
    10a9:	5d                   	pop    %ebp
    10aa:	c3                   	ret    
    10ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10af:	90                   	nop
    10b0:	8b 75 08             	mov    0x8(%ebp),%esi
    10b3:	8b 45 08             	mov    0x8(%ebp),%eax
    10b6:	01 de                	add    %ebx,%esi
    10b8:	89 f3                	mov    %esi,%ebx
    10ba:	c6 03 00             	movb   $0x0,(%ebx)
    10bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10c0:	5b                   	pop    %ebx
    10c1:	5e                   	pop    %esi
    10c2:	5f                   	pop    %edi
    10c3:	5d                   	pop    %ebp
    10c4:	c3                   	ret    
    10c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010d0 <stat>:
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	56                   	push   %esi
    10d4:	53                   	push   %ebx
    10d5:	83 ec 08             	sub    $0x8,%esp
    10d8:	6a 00                	push   $0x0
    10da:	ff 75 08             	pushl  0x8(%ebp)
    10dd:	e8 ef 00 00 00       	call   11d1 <open>
    10e2:	83 c4 10             	add    $0x10,%esp
    10e5:	85 c0                	test   %eax,%eax
    10e7:	78 27                	js     1110 <stat+0x40>
    10e9:	83 ec 08             	sub    $0x8,%esp
    10ec:	ff 75 0c             	pushl  0xc(%ebp)
    10ef:	89 c3                	mov    %eax,%ebx
    10f1:	50                   	push   %eax
    10f2:	e8 f2 00 00 00       	call   11e9 <fstat>
    10f7:	89 1c 24             	mov    %ebx,(%esp)
    10fa:	89 c6                	mov    %eax,%esi
    10fc:	e8 b8 00 00 00       	call   11b9 <close>
    1101:	83 c4 10             	add    $0x10,%esp
    1104:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1107:	89 f0                	mov    %esi,%eax
    1109:	5b                   	pop    %ebx
    110a:	5e                   	pop    %esi
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
    110d:	8d 76 00             	lea    0x0(%esi),%esi
    1110:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1115:	eb ed                	jmp    1104 <stat+0x34>
    1117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111e:	66 90                	xchg   %ax,%ax

00001120 <atoi>:
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1127:	0f be 11             	movsbl (%ecx),%edx
    112a:	8d 42 d0             	lea    -0x30(%edx),%eax
    112d:	3c 09                	cmp    $0x9,%al
    112f:	b8 00 00 00 00       	mov    $0x0,%eax
    1134:	77 1f                	ja     1155 <atoi+0x35>
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi
    1140:	83 c1 01             	add    $0x1,%ecx
    1143:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1146:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
    114a:	0f be 11             	movsbl (%ecx),%edx
    114d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1150:	80 fb 09             	cmp    $0x9,%bl
    1153:	76 eb                	jbe    1140 <atoi+0x20>
    1155:	5b                   	pop    %ebx
    1156:	5d                   	pop    %ebp
    1157:	c3                   	ret    
    1158:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115f:	90                   	nop

00001160 <memmove>:
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	8b 55 10             	mov    0x10(%ebp),%edx
    1167:	8b 45 08             	mov    0x8(%ebp),%eax
    116a:	56                   	push   %esi
    116b:	8b 75 0c             	mov    0xc(%ebp),%esi
    116e:	85 d2                	test   %edx,%edx
    1170:	7e 13                	jle    1185 <memmove+0x25>
    1172:	01 c2                	add    %eax,%edx
    1174:	89 c7                	mov    %eax,%edi
    1176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117d:	8d 76 00             	lea    0x0(%esi),%esi
    1180:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    1181:	39 fa                	cmp    %edi,%edx
    1183:	75 fb                	jne    1180 <memmove+0x20>
    1185:	5e                   	pop    %esi
    1186:	5f                   	pop    %edi
    1187:	5d                   	pop    %ebp
    1188:	c3                   	ret    

00001189 <fork>:
    1189:	b8 01 00 00 00       	mov    $0x1,%eax
    118e:	cd 40                	int    $0x40
    1190:	c3                   	ret    

00001191 <exit>:
    1191:	b8 02 00 00 00       	mov    $0x2,%eax
    1196:	cd 40                	int    $0x40
    1198:	c3                   	ret    

00001199 <wait>:
    1199:	b8 03 00 00 00       	mov    $0x3,%eax
    119e:	cd 40                	int    $0x40
    11a0:	c3                   	ret    

000011a1 <pipe>:
    11a1:	b8 04 00 00 00       	mov    $0x4,%eax
    11a6:	cd 40                	int    $0x40
    11a8:	c3                   	ret    

000011a9 <read>:
    11a9:	b8 05 00 00 00       	mov    $0x5,%eax
    11ae:	cd 40                	int    $0x40
    11b0:	c3                   	ret    

000011b1 <write>:
    11b1:	b8 10 00 00 00       	mov    $0x10,%eax
    11b6:	cd 40                	int    $0x40
    11b8:	c3                   	ret    

000011b9 <close>:
    11b9:	b8 15 00 00 00       	mov    $0x15,%eax
    11be:	cd 40                	int    $0x40
    11c0:	c3                   	ret    

000011c1 <kill>:
    11c1:	b8 06 00 00 00       	mov    $0x6,%eax
    11c6:	cd 40                	int    $0x40
    11c8:	c3                   	ret    

000011c9 <exec>:
    11c9:	b8 07 00 00 00       	mov    $0x7,%eax
    11ce:	cd 40                	int    $0x40
    11d0:	c3                   	ret    

000011d1 <open>:
    11d1:	b8 0f 00 00 00       	mov    $0xf,%eax
    11d6:	cd 40                	int    $0x40
    11d8:	c3                   	ret    

000011d9 <mknod>:
    11d9:	b8 11 00 00 00       	mov    $0x11,%eax
    11de:	cd 40                	int    $0x40
    11e0:	c3                   	ret    

000011e1 <unlink>:
    11e1:	b8 12 00 00 00       	mov    $0x12,%eax
    11e6:	cd 40                	int    $0x40
    11e8:	c3                   	ret    

000011e9 <fstat>:
    11e9:	b8 08 00 00 00       	mov    $0x8,%eax
    11ee:	cd 40                	int    $0x40
    11f0:	c3                   	ret    

000011f1 <link>:
    11f1:	b8 13 00 00 00       	mov    $0x13,%eax
    11f6:	cd 40                	int    $0x40
    11f8:	c3                   	ret    

000011f9 <mkdir>:
    11f9:	b8 14 00 00 00       	mov    $0x14,%eax
    11fe:	cd 40                	int    $0x40
    1200:	c3                   	ret    

00001201 <chdir>:
    1201:	b8 09 00 00 00       	mov    $0x9,%eax
    1206:	cd 40                	int    $0x40
    1208:	c3                   	ret    

00001209 <dup>:
    1209:	b8 0a 00 00 00       	mov    $0xa,%eax
    120e:	cd 40                	int    $0x40
    1210:	c3                   	ret    

00001211 <getpid>:
    1211:	b8 0b 00 00 00       	mov    $0xb,%eax
    1216:	cd 40                	int    $0x40
    1218:	c3                   	ret    

00001219 <sbrk>:
    1219:	b8 0c 00 00 00       	mov    $0xc,%eax
    121e:	cd 40                	int    $0x40
    1220:	c3                   	ret    

00001221 <sleep>:
    1221:	b8 0d 00 00 00       	mov    $0xd,%eax
    1226:	cd 40                	int    $0x40
    1228:	c3                   	ret    

00001229 <uptime>:
    1229:	b8 0e 00 00 00       	mov    $0xe,%eax
    122e:	cd 40                	int    $0x40
    1230:	c3                   	ret    
    1231:	66 90                	xchg   %ax,%ax
    1233:	66 90                	xchg   %ax,%ax
    1235:	66 90                	xchg   %ax,%ax
    1237:	66 90                	xchg   %ax,%ax
    1239:	66 90                	xchg   %ax,%ax
    123b:	66 90                	xchg   %ax,%ax
    123d:	66 90                	xchg   %ax,%ax
    123f:	90                   	nop

00001240 <printint>:
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	57                   	push   %edi
    1244:	56                   	push   %esi
    1245:	53                   	push   %ebx
    1246:	89 d3                	mov    %edx,%ebx
    1248:	83 ec 3c             	sub    $0x3c,%esp
    124b:	89 45 bc             	mov    %eax,-0x44(%ebp)
    124e:	85 d2                	test   %edx,%edx
    1250:	0f 89 92 00 00 00    	jns    12e8 <printint+0xa8>
    1256:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    125a:	0f 84 88 00 00 00    	je     12e8 <printint+0xa8>
    1260:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    1267:	f7 db                	neg    %ebx
    1269:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1270:	8d 75 d7             	lea    -0x29(%ebp),%esi
    1273:	eb 08                	jmp    127d <printint+0x3d>
    1275:	8d 76 00             	lea    0x0(%esi),%esi
    1278:	89 7d c4             	mov    %edi,-0x3c(%ebp)
    127b:	89 c3                	mov    %eax,%ebx
    127d:	89 d8                	mov    %ebx,%eax
    127f:	31 d2                	xor    %edx,%edx
    1281:	8b 7d c4             	mov    -0x3c(%ebp),%edi
    1284:	f7 f1                	div    %ecx
    1286:	83 c7 01             	add    $0x1,%edi
    1289:	0f b6 92 a4 19 00 00 	movzbl 0x19a4(%edx),%edx
    1290:	88 14 3e             	mov    %dl,(%esi,%edi,1)
    1293:	39 d9                	cmp    %ebx,%ecx
    1295:	76 e1                	jbe    1278 <printint+0x38>
    1297:	8b 45 c0             	mov    -0x40(%ebp),%eax
    129a:	85 c0                	test   %eax,%eax
    129c:	74 0d                	je     12ab <printint+0x6b>
    129e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    12a3:	ba 2d 00 00 00       	mov    $0x2d,%edx
    12a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
    12ab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    12ae:	8b 7d bc             	mov    -0x44(%ebp),%edi
    12b1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    12b5:	eb 0f                	jmp    12c6 <printint+0x86>
    12b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12be:	66 90                	xchg   %ax,%ax
    12c0:	0f b6 13             	movzbl (%ebx),%edx
    12c3:	83 eb 01             	sub    $0x1,%ebx
    12c6:	83 ec 04             	sub    $0x4,%esp
    12c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    12cc:	6a 01                	push   $0x1
    12ce:	56                   	push   %esi
    12cf:	57                   	push   %edi
    12d0:	e8 dc fe ff ff       	call   11b1 <write>
    12d5:	83 c4 10             	add    $0x10,%esp
    12d8:	39 de                	cmp    %ebx,%esi
    12da:	75 e4                	jne    12c0 <printint+0x80>
    12dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12df:	5b                   	pop    %ebx
    12e0:	5e                   	pop    %esi
    12e1:	5f                   	pop    %edi
    12e2:	5d                   	pop    %ebp
    12e3:	c3                   	ret    
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12e8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    12ef:	e9 75 ff ff ff       	jmp    1269 <printint+0x29>
    12f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop

00001300 <printf>:
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	57                   	push   %edi
    1304:	56                   	push   %esi
    1305:	53                   	push   %ebx
    1306:	83 ec 2c             	sub    $0x2c,%esp
    1309:	8b 75 0c             	mov    0xc(%ebp),%esi
    130c:	0f b6 1e             	movzbl (%esi),%ebx
    130f:	84 db                	test   %bl,%bl
    1311:	0f 84 b9 00 00 00    	je     13d0 <printf+0xd0>
    1317:	8d 45 10             	lea    0x10(%ebp),%eax
    131a:	83 c6 01             	add    $0x1,%esi
    131d:	8d 7d e7             	lea    -0x19(%ebp),%edi
    1320:	31 d2                	xor    %edx,%edx
    1322:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1325:	eb 38                	jmp    135f <printf+0x5f>
    1327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132e:	66 90                	xchg   %ax,%ax
    1330:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    1333:	ba 25 00 00 00       	mov    $0x25,%edx
    1338:	83 f8 25             	cmp    $0x25,%eax
    133b:	74 17                	je     1354 <printf+0x54>
    133d:	83 ec 04             	sub    $0x4,%esp
    1340:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1343:	6a 01                	push   $0x1
    1345:	57                   	push   %edi
    1346:	ff 75 08             	pushl  0x8(%ebp)
    1349:	e8 63 fe ff ff       	call   11b1 <write>
    134e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1351:	83 c4 10             	add    $0x10,%esp
    1354:	83 c6 01             	add    $0x1,%esi
    1357:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    135b:	84 db                	test   %bl,%bl
    135d:	74 71                	je     13d0 <printf+0xd0>
    135f:	0f be cb             	movsbl %bl,%ecx
    1362:	0f b6 c3             	movzbl %bl,%eax
    1365:	85 d2                	test   %edx,%edx
    1367:	74 c7                	je     1330 <printf+0x30>
    1369:	83 fa 25             	cmp    $0x25,%edx
    136c:	75 e6                	jne    1354 <printf+0x54>
    136e:	83 f8 64             	cmp    $0x64,%eax
    1371:	0f 84 99 00 00 00    	je     1410 <printf+0x110>
    1377:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    137d:	83 f9 70             	cmp    $0x70,%ecx
    1380:	74 5e                	je     13e0 <printf+0xe0>
    1382:	83 f8 73             	cmp    $0x73,%eax
    1385:	0f 84 d5 00 00 00    	je     1460 <printf+0x160>
    138b:	83 f8 63             	cmp    $0x63,%eax
    138e:	0f 84 8c 00 00 00    	je     1420 <printf+0x120>
    1394:	83 f8 25             	cmp    $0x25,%eax
    1397:	0f 84 b3 00 00 00    	je     1450 <printf+0x150>
    139d:	83 ec 04             	sub    $0x4,%esp
    13a0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    13a4:	6a 01                	push   $0x1
    13a6:	57                   	push   %edi
    13a7:	ff 75 08             	pushl  0x8(%ebp)
    13aa:	e8 02 fe ff ff       	call   11b1 <write>
    13af:	88 5d e7             	mov    %bl,-0x19(%ebp)
    13b2:	83 c4 0c             	add    $0xc,%esp
    13b5:	6a 01                	push   $0x1
    13b7:	83 c6 01             	add    $0x1,%esi
    13ba:	57                   	push   %edi
    13bb:	ff 75 08             	pushl  0x8(%ebp)
    13be:	e8 ee fd ff ff       	call   11b1 <write>
    13c3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    13c7:	83 c4 10             	add    $0x10,%esp
    13ca:	31 d2                	xor    %edx,%edx
    13cc:	84 db                	test   %bl,%bl
    13ce:	75 8f                	jne    135f <printf+0x5f>
    13d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13d3:	5b                   	pop    %ebx
    13d4:	5e                   	pop    %esi
    13d5:	5f                   	pop    %edi
    13d6:	5d                   	pop    %ebp
    13d7:	c3                   	ret    
    13d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13df:	90                   	nop
    13e0:	83 ec 0c             	sub    $0xc,%esp
    13e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    13e8:	6a 00                	push   $0x0
    13ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    13ed:	8b 45 08             	mov    0x8(%ebp),%eax
    13f0:	8b 13                	mov    (%ebx),%edx
    13f2:	e8 49 fe ff ff       	call   1240 <printint>
    13f7:	89 d8                	mov    %ebx,%eax
    13f9:	83 c4 10             	add    $0x10,%esp
    13fc:	31 d2                	xor    %edx,%edx
    13fe:	83 c0 04             	add    $0x4,%eax
    1401:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1404:	e9 4b ff ff ff       	jmp    1354 <printf+0x54>
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1410:	83 ec 0c             	sub    $0xc,%esp
    1413:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1418:	6a 01                	push   $0x1
    141a:	eb ce                	jmp    13ea <printf+0xea>
    141c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1420:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1423:	83 ec 04             	sub    $0x4,%esp
    1426:	8b 03                	mov    (%ebx),%eax
    1428:	6a 01                	push   $0x1
    142a:	83 c3 04             	add    $0x4,%ebx
    142d:	57                   	push   %edi
    142e:	ff 75 08             	pushl  0x8(%ebp)
    1431:	88 45 e7             	mov    %al,-0x19(%ebp)
    1434:	e8 78 fd ff ff       	call   11b1 <write>
    1439:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    143c:	83 c4 10             	add    $0x10,%esp
    143f:	31 d2                	xor    %edx,%edx
    1441:	e9 0e ff ff ff       	jmp    1354 <printf+0x54>
    1446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    144d:	8d 76 00             	lea    0x0(%esi),%esi
    1450:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1453:	83 ec 04             	sub    $0x4,%esp
    1456:	e9 5a ff ff ff       	jmp    13b5 <printf+0xb5>
    145b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    145f:	90                   	nop
    1460:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1463:	8b 18                	mov    (%eax),%ebx
    1465:	83 c0 04             	add    $0x4,%eax
    1468:	89 45 d0             	mov    %eax,-0x30(%ebp)
    146b:	85 db                	test   %ebx,%ebx
    146d:	74 17                	je     1486 <printf+0x186>
    146f:	0f b6 03             	movzbl (%ebx),%eax
    1472:	31 d2                	xor    %edx,%edx
    1474:	84 c0                	test   %al,%al
    1476:	0f 84 d8 fe ff ff    	je     1354 <printf+0x54>
    147c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    147f:	89 de                	mov    %ebx,%esi
    1481:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1484:	eb 1a                	jmp    14a0 <printf+0x1a0>
    1486:	bb 9c 19 00 00       	mov    $0x199c,%ebx
    148b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    148e:	b8 28 00 00 00       	mov    $0x28,%eax
    1493:	89 de                	mov    %ebx,%esi
    1495:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149f:	90                   	nop
    14a0:	83 ec 04             	sub    $0x4,%esp
    14a3:	83 c6 01             	add    $0x1,%esi
    14a6:	88 45 e7             	mov    %al,-0x19(%ebp)
    14a9:	6a 01                	push   $0x1
    14ab:	57                   	push   %edi
    14ac:	53                   	push   %ebx
    14ad:	e8 ff fc ff ff       	call   11b1 <write>
    14b2:	0f b6 06             	movzbl (%esi),%eax
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	84 c0                	test   %al,%al
    14ba:	75 e4                	jne    14a0 <printf+0x1a0>
    14bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    14bf:	31 d2                	xor    %edx,%edx
    14c1:	e9 8e fe ff ff       	jmp    1354 <printf+0x54>
    14c6:	66 90                	xchg   %ax,%ax
    14c8:	66 90                	xchg   %ax,%ax
    14ca:	66 90                	xchg   %ax,%ax
    14cc:	66 90                	xchg   %ax,%ax
    14ce:	66 90                	xchg   %ax,%ax

000014d0 <free>:
    14d0:	55                   	push   %ebp
    14d1:	a1 a8 1e 00 00       	mov    0x1ea8,%eax
    14d6:	89 e5                	mov    %esp,%ebp
    14d8:	57                   	push   %edi
    14d9:	56                   	push   %esi
    14da:	53                   	push   %ebx
    14db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14de:	8b 10                	mov    (%eax),%edx
    14e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    14e3:	39 c8                	cmp    %ecx,%eax
    14e5:	73 19                	jae    1500 <free+0x30>
    14e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ee:	66 90                	xchg   %ax,%ax
    14f0:	39 d1                	cmp    %edx,%ecx
    14f2:	72 14                	jb     1508 <free+0x38>
    14f4:	39 d0                	cmp    %edx,%eax
    14f6:	73 10                	jae    1508 <free+0x38>
    14f8:	89 d0                	mov    %edx,%eax
    14fa:	8b 10                	mov    (%eax),%edx
    14fc:	39 c8                	cmp    %ecx,%eax
    14fe:	72 f0                	jb     14f0 <free+0x20>
    1500:	39 d0                	cmp    %edx,%eax
    1502:	72 f4                	jb     14f8 <free+0x28>
    1504:	39 d1                	cmp    %edx,%ecx
    1506:	73 f0                	jae    14f8 <free+0x28>
    1508:	8b 73 fc             	mov    -0x4(%ebx),%esi
    150b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    150e:	39 fa                	cmp    %edi,%edx
    1510:	74 1e                	je     1530 <free+0x60>
    1512:	89 53 f8             	mov    %edx,-0x8(%ebx)
    1515:	8b 50 04             	mov    0x4(%eax),%edx
    1518:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    151b:	39 f1                	cmp    %esi,%ecx
    151d:	74 28                	je     1547 <free+0x77>
    151f:	89 08                	mov    %ecx,(%eax)
    1521:	5b                   	pop    %ebx
    1522:	a3 a8 1e 00 00       	mov    %eax,0x1ea8
    1527:	5e                   	pop    %esi
    1528:	5f                   	pop    %edi
    1529:	5d                   	pop    %ebp
    152a:	c3                   	ret    
    152b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    152f:	90                   	nop
    1530:	03 72 04             	add    0x4(%edx),%esi
    1533:	89 73 fc             	mov    %esi,-0x4(%ebx)
    1536:	8b 10                	mov    (%eax),%edx
    1538:	8b 12                	mov    (%edx),%edx
    153a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    153d:	8b 50 04             	mov    0x4(%eax),%edx
    1540:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1543:	39 f1                	cmp    %esi,%ecx
    1545:	75 d8                	jne    151f <free+0x4f>
    1547:	03 53 fc             	add    -0x4(%ebx),%edx
    154a:	a3 a8 1e 00 00       	mov    %eax,0x1ea8
    154f:	89 50 04             	mov    %edx,0x4(%eax)
    1552:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1555:	89 10                	mov    %edx,(%eax)
    1557:	5b                   	pop    %ebx
    1558:	5e                   	pop    %esi
    1559:	5f                   	pop    %edi
    155a:	5d                   	pop    %ebp
    155b:	c3                   	ret    
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001560 <malloc>:
    1560:	55                   	push   %ebp
    1561:	89 e5                	mov    %esp,%ebp
    1563:	57                   	push   %edi
    1564:	56                   	push   %esi
    1565:	53                   	push   %ebx
    1566:	83 ec 1c             	sub    $0x1c,%esp
    1569:	8b 45 08             	mov    0x8(%ebp),%eax
    156c:	8b 3d a8 1e 00 00    	mov    0x1ea8,%edi
    1572:	8d 70 07             	lea    0x7(%eax),%esi
    1575:	c1 ee 03             	shr    $0x3,%esi
    1578:	83 c6 01             	add    $0x1,%esi
    157b:	85 ff                	test   %edi,%edi
    157d:	0f 84 ad 00 00 00    	je     1630 <malloc+0xd0>
    1583:	8b 17                	mov    (%edi),%edx
    1585:	8b 4a 04             	mov    0x4(%edx),%ecx
    1588:	39 f1                	cmp    %esi,%ecx
    158a:	73 72                	jae    15fe <malloc+0x9e>
    158c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1592:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1597:	0f 43 de             	cmovae %esi,%ebx
    159a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    15a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    15a4:	eb 1b                	jmp    15c1 <malloc+0x61>
    15a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ad:	8d 76 00             	lea    0x0(%esi),%esi
    15b0:	8b 02                	mov    (%edx),%eax
    15b2:	8b 48 04             	mov    0x4(%eax),%ecx
    15b5:	39 f1                	cmp    %esi,%ecx
    15b7:	73 4f                	jae    1608 <malloc+0xa8>
    15b9:	8b 3d a8 1e 00 00    	mov    0x1ea8,%edi
    15bf:	89 c2                	mov    %eax,%edx
    15c1:	39 d7                	cmp    %edx,%edi
    15c3:	75 eb                	jne    15b0 <malloc+0x50>
    15c5:	83 ec 0c             	sub    $0xc,%esp
    15c8:	ff 75 e4             	pushl  -0x1c(%ebp)
    15cb:	e8 49 fc ff ff       	call   1219 <sbrk>
    15d0:	83 c4 10             	add    $0x10,%esp
    15d3:	83 f8 ff             	cmp    $0xffffffff,%eax
    15d6:	74 1c                	je     15f4 <malloc+0x94>
    15d8:	89 58 04             	mov    %ebx,0x4(%eax)
    15db:	83 ec 0c             	sub    $0xc,%esp
    15de:	83 c0 08             	add    $0x8,%eax
    15e1:	50                   	push   %eax
    15e2:	e8 e9 fe ff ff       	call   14d0 <free>
    15e7:	8b 15 a8 1e 00 00    	mov    0x1ea8,%edx
    15ed:	83 c4 10             	add    $0x10,%esp
    15f0:	85 d2                	test   %edx,%edx
    15f2:	75 bc                	jne    15b0 <malloc+0x50>
    15f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15f7:	31 c0                	xor    %eax,%eax
    15f9:	5b                   	pop    %ebx
    15fa:	5e                   	pop    %esi
    15fb:	5f                   	pop    %edi
    15fc:	5d                   	pop    %ebp
    15fd:	c3                   	ret    
    15fe:	89 d0                	mov    %edx,%eax
    1600:	89 fa                	mov    %edi,%edx
    1602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1608:	39 ce                	cmp    %ecx,%esi
    160a:	74 54                	je     1660 <malloc+0x100>
    160c:	29 f1                	sub    %esi,%ecx
    160e:	89 48 04             	mov    %ecx,0x4(%eax)
    1611:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1614:	89 70 04             	mov    %esi,0x4(%eax)
    1617:	89 15 a8 1e 00 00    	mov    %edx,0x1ea8
    161d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1620:	83 c0 08             	add    $0x8,%eax
    1623:	5b                   	pop    %ebx
    1624:	5e                   	pop    %esi
    1625:	5f                   	pop    %edi
    1626:	5d                   	pop    %ebp
    1627:	c3                   	ret    
    1628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
    1630:	c7 05 a8 1e 00 00 ac 	movl   $0x1eac,0x1ea8
    1637:	1e 00 00 
    163a:	bf ac 1e 00 00       	mov    $0x1eac,%edi
    163f:	c7 05 ac 1e 00 00 ac 	movl   $0x1eac,0x1eac
    1646:	1e 00 00 
    1649:	89 fa                	mov    %edi,%edx
    164b:	c7 05 b0 1e 00 00 00 	movl   $0x0,0x1eb0
    1652:	00 00 00 
    1655:	e9 32 ff ff ff       	jmp    158c <malloc+0x2c>
    165a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1660:	8b 08                	mov    (%eax),%ecx
    1662:	89 0a                	mov    %ecx,(%edx)
    1664:	eb b1                	jmp    1617 <malloc+0xb7>
