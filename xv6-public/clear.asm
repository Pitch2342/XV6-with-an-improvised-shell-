
_clear:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		return;
	printf(1,"\xa");
	clear(x+('1'-48));
}
int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	bb 37 00 00 00       	mov    $0x37,%ebx
  13:	51                   	push   %ecx
  14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	printf(1,"\xa");
  18:	83 ec 08             	sub    $0x8,%esp
  1b:	68 98 07 00 00       	push   $0x798
  20:	6a 01                	push   $0x1
  22:	e8 09 04 00 00       	call   430 <printf>
	if(x=='x')
  27:	83 c4 10             	add    $0x10,%esp
  2a:	83 eb 01             	sub    $0x1,%ebx
  2d:	75 e9                	jne    18 <main+0x18>
	clear('A');
	exit();
  2f:	e8 8d 02 00 00       	call   2c1 <exit>
  34:	66 90                	xchg   %ax,%ax
  36:	66 90                	xchg   %ax,%ax
  38:	66 90                	xchg   %ax,%ax
  3a:	66 90                	xchg   %ax,%ax
  3c:	66 90                	xchg   %ax,%ax
  3e:	66 90                	xchg   %ax,%ax

00000040 <clear>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  44:	83 ec 04             	sub    $0x4,%esp
  47:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if(x=='x')
  4a:	83 fb 78             	cmp    $0x78,%ebx
  4d:	74 1b                	je     6a <clear+0x2a>
  4f:	90                   	nop
	printf(1,"\xa");
  50:	83 ec 08             	sub    $0x8,%esp
	clear(x+('1'-48));
  53:	83 c3 01             	add    $0x1,%ebx
	printf(1,"\xa");
  56:	68 98 07 00 00       	push   $0x798
  5b:	6a 01                	push   $0x1
  5d:	e8 ce 03 00 00       	call   430 <printf>
	if(x=='x')
  62:	83 c4 10             	add    $0x10,%esp
  65:	83 fb 78             	cmp    $0x78,%ebx
  68:	75 e6                	jne    50 <clear+0x10>
}
  6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  6d:	c9                   	leave  
  6e:	c3                   	ret    
  6f:	90                   	nop

00000070 <strcpy>:
  70:	55                   	push   %ebp
  71:	31 d2                	xor    %edx,%edx
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  84:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 c9                	test   %cl,%cl
  8c:	75 f2                	jne    80 <strcpy+0x10>
  8e:	5b                   	pop    %ebx
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    
  91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9f:	90                   	nop

000000a0 <strcmp>:
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  ab:	0f b6 13             	movzbl (%ebx),%edx
  ae:	0f b6 0e             	movzbl (%esi),%ecx
  b1:	84 d2                	test   %dl,%dl
  b3:	74 1e                	je     d3 <strcmp+0x33>
  b5:	b8 01 00 00 00       	mov    $0x1,%eax
  ba:	38 ca                	cmp    %cl,%dl
  bc:	74 09                	je     c7 <strcmp+0x27>
  be:	eb 20                	jmp    e0 <strcmp+0x40>
  c0:	83 c0 01             	add    $0x1,%eax
  c3:	38 ca                	cmp    %cl,%dl
  c5:	75 19                	jne    e0 <strcmp+0x40>
  c7:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  cb:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
  cf:	84 d2                	test   %dl,%dl
  d1:	75 ed                	jne    c0 <strcmp+0x20>
  d3:	31 c0                	xor    %eax,%eax
  d5:	5b                   	pop    %ebx
  d6:	5e                   	pop    %esi
  d7:	29 c8                	sub    %ecx,%eax
  d9:	5d                   	pop    %ebp
  da:	c3                   	ret    
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
  e0:	0f b6 c2             	movzbl %dl,%eax
  e3:	5b                   	pop    %ebx
  e4:	5e                   	pop    %esi
  e5:	29 c8                	sub    %ecx,%eax
  e7:	5d                   	pop    %ebp
  e8:	c3                   	ret    
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	31 c0                	xor    %eax,%eax
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 11f:	90                   	nop

00000120 <memset>:
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13e:	66 90                	xchg   %ax,%ax

00000140 <strchr>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
 14a:	0f b6 18             	movzbl (%eax),%ebx
 14d:	84 db                	test   %bl,%bl
 14f:	74 1d                	je     16e <strchr+0x2e>
 151:	89 d1                	mov    %edx,%ecx
 153:	38 d3                	cmp    %dl,%bl
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
 16e:	31 c0                	xor    %eax,%eax
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <gets>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
 185:	31 f6                	xor    %esi,%esi
 187:	53                   	push   %ebx
 188:	89 f3                	mov    %esi,%ebx
 18a:	83 ec 1c             	sub    $0x1c,%esp
 18d:	8b 7d 08             	mov    0x8(%ebp),%edi
 190:	eb 2f                	jmp    1c1 <gets+0x41>
 192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 19e:	6a 01                	push   $0x1
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 31 01 00 00       	call   2d9 <read>
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 1c                	jle    1cb <gets+0x4b>
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	83 c7 01             	add    $0x1,%edi
 1b6:	88 47 ff             	mov    %al,-0x1(%edi)
 1b9:	3c 0a                	cmp    $0xa,%al
 1bb:	74 23                	je     1e0 <gets+0x60>
 1bd:	3c 0d                	cmp    $0xd,%al
 1bf:	74 1f                	je     1e0 <gets+0x60>
 1c1:	83 c3 01             	add    $0x1,%ebx
 1c4:	89 fe                	mov    %edi,%esi
 1c6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c9:	7c cd                	jl     198 <gets+0x18>
 1cb:	89 f3                	mov    %esi,%ebx
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
 1d0:	c6 03 00             	movb   $0x0,(%ebx)
 1d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d6:	5b                   	pop    %ebx
 1d7:	5e                   	pop    %esi
 1d8:	5f                   	pop    %edi
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop
 1e0:	8b 75 08             	mov    0x8(%ebp),%esi
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	01 de                	add    %ebx,%esi
 1e8:	89 f3                	mov    %esi,%ebx
 1ea:	c6 03 00             	movb   $0x0,(%ebx)
 1ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f0:	5b                   	pop    %ebx
 1f1:	5e                   	pop    %esi
 1f2:	5f                   	pop    %edi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    
 1f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <stat>:
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 ef 00 00 00       	call   301 <open>
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	pushl  0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f2 00 00 00       	call   319 <fstat>
 227:	89 1c 24             	mov    %ebx,(%esp)
 22a:	89 c6                	mov    %eax,%esi
 22c:	e8 b8 00 00 00       	call   2e9 <close>
 231:	83 c4 10             	add    $0x10,%esp
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <atoi>:
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 4d 08             	mov    0x8(%ebp),%ecx
 257:	0f be 11             	movsbl (%ecx),%edx
 25a:	8d 42 d0             	lea    -0x30(%edx),%eax
 25d:	3c 09                	cmp    $0x9,%al
 25f:	b8 00 00 00 00       	mov    $0x0,%eax
 264:	77 1f                	ja     285 <atoi+0x35>
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c1 01             	add    $0x1,%ecx
 273:	8d 04 80             	lea    (%eax,%eax,4),%eax
 276:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 27a:	0f be 11             	movsbl (%ecx),%edx
 27d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
 285:	5b                   	pop    %ebx
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
 288:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <memmove>:
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 10             	mov    0x10(%ebp),%edx
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
 29e:	85 d2                	test   %edx,%edx
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 c2                	add    %eax,%edx
 2a4:	89 c7                	mov    %eax,%edi
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2b1:	39 fa                	cmp    %edi,%edx
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
 2b5:	5e                   	pop    %esi
 2b6:	5f                   	pop    %edi
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    

000002b9 <fork>:
 2b9:	b8 01 00 00 00       	mov    $0x1,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <exit>:
 2c1:	b8 02 00 00 00       	mov    $0x2,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <wait>:
 2c9:	b8 03 00 00 00       	mov    $0x3,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <pipe>:
 2d1:	b8 04 00 00 00       	mov    $0x4,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <read>:
 2d9:	b8 05 00 00 00       	mov    $0x5,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <write>:
 2e1:	b8 10 00 00 00       	mov    $0x10,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <close>:
 2e9:	b8 15 00 00 00       	mov    $0x15,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <kill>:
 2f1:	b8 06 00 00 00       	mov    $0x6,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <exec>:
 2f9:	b8 07 00 00 00       	mov    $0x7,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <open>:
 301:	b8 0f 00 00 00       	mov    $0xf,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <mknod>:
 309:	b8 11 00 00 00       	mov    $0x11,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <unlink>:
 311:	b8 12 00 00 00       	mov    $0x12,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <fstat>:
 319:	b8 08 00 00 00       	mov    $0x8,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <link>:
 321:	b8 13 00 00 00       	mov    $0x13,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <mkdir>:
 329:	b8 14 00 00 00       	mov    $0x14,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <chdir>:
 331:	b8 09 00 00 00       	mov    $0x9,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <dup>:
 339:	b8 0a 00 00 00       	mov    $0xa,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <getpid>:
 341:	b8 0b 00 00 00       	mov    $0xb,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <sbrk>:
 349:	b8 0c 00 00 00       	mov    $0xc,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <sleep>:
 351:	b8 0d 00 00 00       	mov    $0xd,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <uptime>:
 359:	b8 0e 00 00 00       	mov    $0xe,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    
 361:	66 90                	xchg   %ax,%ax
 363:	66 90                	xchg   %ax,%ax
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	89 d3                	mov    %edx,%ebx
 378:	83 ec 3c             	sub    $0x3c,%esp
 37b:	89 45 bc             	mov    %eax,-0x44(%ebp)
 37e:	85 d2                	test   %edx,%edx
 380:	0f 89 92 00 00 00    	jns    418 <printint+0xa8>
 386:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38a:	0f 84 88 00 00 00    	je     418 <printint+0xa8>
 390:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 397:	f7 db                	neg    %ebx
 399:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3a0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3a3:	eb 08                	jmp    3ad <printint+0x3d>
 3a5:	8d 76 00             	lea    0x0(%esi),%esi
 3a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	89 d8                	mov    %ebx,%eax
 3af:	31 d2                	xor    %edx,%edx
 3b1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 3b4:	f7 f1                	div    %ecx
 3b6:	83 c7 01             	add    $0x1,%edi
 3b9:	0f b6 92 a4 07 00 00 	movzbl 0x7a4(%edx),%edx
 3c0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 3c3:	39 d9                	cmp    %ebx,%ecx
 3c5:	76 e1                	jbe    3a8 <printint+0x38>
 3c7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 3ca:	85 c0                	test   %eax,%eax
 3cc:	74 0d                	je     3db <printint+0x6b>
 3ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3d3:	ba 2d 00 00 00       	mov    $0x2d,%edx
 3d8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 3db:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3de:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3e1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3e5:	eb 0f                	jmp    3f6 <printint+0x86>
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
 3f0:	0f b6 13             	movzbl (%ebx),%edx
 3f3:	83 eb 01             	sub    $0x1,%ebx
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3fc:	6a 01                	push   $0x1
 3fe:	56                   	push   %esi
 3ff:	57                   	push   %edi
 400:	e8 dc fe ff ff       	call   2e1 <write>
 405:	83 c4 10             	add    $0x10,%esp
 408:	39 de                	cmp    %ebx,%esi
 40a:	75 e4                	jne    3f0 <printint+0x80>
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 418:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 41f:	e9 75 ff ff ff       	jmp    399 <printint+0x29>
 424:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <printf>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 2c             	sub    $0x2c,%esp
 439:	8b 75 0c             	mov    0xc(%ebp),%esi
 43c:	0f b6 1e             	movzbl (%esi),%ebx
 43f:	84 db                	test   %bl,%bl
 441:	0f 84 b9 00 00 00    	je     500 <printf+0xd0>
 447:	8d 45 10             	lea    0x10(%ebp),%eax
 44a:	83 c6 01             	add    $0x1,%esi
 44d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 450:	31 d2                	xor    %edx,%edx
 452:	89 45 d0             	mov    %eax,-0x30(%ebp)
 455:	eb 38                	jmp    48f <printf+0x5f>
 457:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45e:	66 90                	xchg   %ax,%ax
 460:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 463:	ba 25 00 00 00       	mov    $0x25,%edx
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	74 17                	je     484 <printf+0x54>
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	88 5d e7             	mov    %bl,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	ff 75 08             	pushl  0x8(%ebp)
 479:	e8 63 fe ff ff       	call   2e1 <write>
 47e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 481:	83 c4 10             	add    $0x10,%esp
 484:	83 c6 01             	add    $0x1,%esi
 487:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 48b:	84 db                	test   %bl,%bl
 48d:	74 71                	je     500 <printf+0xd0>
 48f:	0f be cb             	movsbl %bl,%ecx
 492:	0f b6 c3             	movzbl %bl,%eax
 495:	85 d2                	test   %edx,%edx
 497:	74 c7                	je     460 <printf+0x30>
 499:	83 fa 25             	cmp    $0x25,%edx
 49c:	75 e6                	jne    484 <printf+0x54>
 49e:	83 f8 64             	cmp    $0x64,%eax
 4a1:	0f 84 99 00 00 00    	je     540 <printf+0x110>
 4a7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ad:	83 f9 70             	cmp    $0x70,%ecx
 4b0:	74 5e                	je     510 <printf+0xe0>
 4b2:	83 f8 73             	cmp    $0x73,%eax
 4b5:	0f 84 d5 00 00 00    	je     590 <printf+0x160>
 4bb:	83 f8 63             	cmp    $0x63,%eax
 4be:	0f 84 8c 00 00 00    	je     550 <printf+0x120>
 4c4:	83 f8 25             	cmp    $0x25,%eax
 4c7:	0f 84 b3 00 00 00    	je     580 <printf+0x150>
 4cd:	83 ec 04             	sub    $0x4,%esp
 4d0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4d4:	6a 01                	push   $0x1
 4d6:	57                   	push   %edi
 4d7:	ff 75 08             	pushl  0x8(%ebp)
 4da:	e8 02 fe ff ff       	call   2e1 <write>
 4df:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4e2:	83 c4 0c             	add    $0xc,%esp
 4e5:	6a 01                	push   $0x1
 4e7:	83 c6 01             	add    $0x1,%esi
 4ea:	57                   	push   %edi
 4eb:	ff 75 08             	pushl  0x8(%ebp)
 4ee:	e8 ee fd ff ff       	call   2e1 <write>
 4f3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	31 d2                	xor    %edx,%edx
 4fc:	84 db                	test   %bl,%bl
 4fe:	75 8f                	jne    48f <printf+0x5f>
 500:	8d 65 f4             	lea    -0xc(%ebp),%esp
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5f                   	pop    %edi
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	8b 13                	mov    (%ebx),%edx
 522:	e8 49 fe ff ff       	call   370 <printint>
 527:	89 d8                	mov    %ebx,%eax
 529:	83 c4 10             	add    $0x10,%esp
 52c:	31 d2                	xor    %edx,%edx
 52e:	83 c0 04             	add    $0x4,%eax
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	e9 4b ff ff ff       	jmp    484 <printf+0x54>
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 0a 00 00 00       	mov    $0xa,%ecx
 548:	6a 01                	push   $0x1
 54a:	eb ce                	jmp    51a <printf+0xea>
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 550:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 553:	83 ec 04             	sub    $0x4,%esp
 556:	8b 03                	mov    (%ebx),%eax
 558:	6a 01                	push   $0x1
 55a:	83 c3 04             	add    $0x4,%ebx
 55d:	57                   	push   %edi
 55e:	ff 75 08             	pushl  0x8(%ebp)
 561:	88 45 e7             	mov    %al,-0x19(%ebp)
 564:	e8 78 fd ff ff       	call   2e1 <write>
 569:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 56c:	83 c4 10             	add    $0x10,%esp
 56f:	31 d2                	xor    %edx,%edx
 571:	e9 0e ff ff ff       	jmp    484 <printf+0x54>
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
 580:	88 5d e7             	mov    %bl,-0x19(%ebp)
 583:	83 ec 04             	sub    $0x4,%esp
 586:	e9 5a ff ff ff       	jmp    4e5 <printf+0xb5>
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop
 590:	8b 45 d0             	mov    -0x30(%ebp),%eax
 593:	8b 18                	mov    (%eax),%ebx
 595:	83 c0 04             	add    $0x4,%eax
 598:	89 45 d0             	mov    %eax,-0x30(%ebp)
 59b:	85 db                	test   %ebx,%ebx
 59d:	74 17                	je     5b6 <printf+0x186>
 59f:	0f b6 03             	movzbl (%ebx),%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	84 c0                	test   %al,%al
 5a6:	0f 84 d8 fe ff ff    	je     484 <printf+0x54>
 5ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5af:	89 de                	mov    %ebx,%esi
 5b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b4:	eb 1a                	jmp    5d0 <printf+0x1a0>
 5b6:	bb 9a 07 00 00       	mov    $0x79a,%ebx
 5bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5be:	b8 28 00 00 00       	mov    $0x28,%eax
 5c3:	89 de                	mov    %ebx,%esi
 5c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	83 c6 01             	add    $0x1,%esi
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
 5d9:	6a 01                	push   $0x1
 5db:	57                   	push   %edi
 5dc:	53                   	push   %ebx
 5dd:	e8 ff fc ff ff       	call   2e1 <write>
 5e2:	0f b6 06             	movzbl (%esi),%eax
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	84 c0                	test   %al,%al
 5ea:	75 e4                	jne    5d0 <printf+0x1a0>
 5ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 8e fe ff ff       	jmp    484 <printf+0x54>
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <free>:
 600:	55                   	push   %ebp
 601:	a1 74 0a 00 00       	mov    0xa74,%eax
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 60e:	8b 10                	mov    (%eax),%edx
 610:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 613:	39 c8                	cmp    %ecx,%eax
 615:	73 19                	jae    630 <free+0x30>
 617:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61e:	66 90                	xchg   %ax,%ax
 620:	39 d1                	cmp    %edx,%ecx
 622:	72 14                	jb     638 <free+0x38>
 624:	39 d0                	cmp    %edx,%eax
 626:	73 10                	jae    638 <free+0x38>
 628:	89 d0                	mov    %edx,%eax
 62a:	8b 10                	mov    (%eax),%edx
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	72 f0                	jb     620 <free+0x20>
 630:	39 d0                	cmp    %edx,%eax
 632:	72 f4                	jb     628 <free+0x28>
 634:	39 d1                	cmp    %edx,%ecx
 636:	73 f0                	jae    628 <free+0x28>
 638:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 fa                	cmp    %edi,%edx
 640:	74 1e                	je     660 <free+0x60>
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64b:	39 f1                	cmp    %esi,%ecx
 64d:	74 28                	je     677 <free+0x77>
 64f:	89 08                	mov    %ecx,(%eax)
 651:	5b                   	pop    %ebx
 652:	a3 74 0a 00 00       	mov    %eax,0xa74
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
 660:	03 72 04             	add    0x4(%edx),%esi
 663:	89 73 fc             	mov    %esi,-0x4(%ebx)
 666:	8b 10                	mov    (%eax),%edx
 668:	8b 12                	mov    (%edx),%edx
 66a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 66d:	8b 50 04             	mov    0x4(%eax),%edx
 670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 673:	39 f1                	cmp    %esi,%ecx
 675:	75 d8                	jne    64f <free+0x4f>
 677:	03 53 fc             	add    -0x4(%ebx),%edx
 67a:	a3 74 0a 00 00       	mov    %eax,0xa74
 67f:	89 50 04             	mov    %edx,0x4(%eax)
 682:	8b 53 f8             	mov    -0x8(%ebx),%edx
 685:	89 10                	mov    %edx,(%eax)
 687:	5b                   	pop    %ebx
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000690 <malloc>:
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 1c             	sub    $0x1c,%esp
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	8b 3d 74 0a 00 00    	mov    0xa74,%edi
 6a2:	8d 70 07             	lea    0x7(%eax),%esi
 6a5:	c1 ee 03             	shr    $0x3,%esi
 6a8:	83 c6 01             	add    $0x1,%esi
 6ab:	85 ff                	test   %edi,%edi
 6ad:	0f 84 ad 00 00 00    	je     760 <malloc+0xd0>
 6b3:	8b 17                	mov    (%edi),%edx
 6b5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6b8:	39 f1                	cmp    %esi,%ecx
 6ba:	73 72                	jae    72e <malloc+0x9e>
 6bc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6c7:	0f 43 de             	cmovae %esi,%ebx
 6ca:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6d4:	eb 1b                	jmp    6f1 <malloc+0x61>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
 6e0:	8b 02                	mov    (%edx),%eax
 6e2:	8b 48 04             	mov    0x4(%eax),%ecx
 6e5:	39 f1                	cmp    %esi,%ecx
 6e7:	73 4f                	jae    738 <malloc+0xa8>
 6e9:	8b 3d 74 0a 00 00    	mov    0xa74,%edi
 6ef:	89 c2                	mov    %eax,%edx
 6f1:	39 d7                	cmp    %edx,%edi
 6f3:	75 eb                	jne    6e0 <malloc+0x50>
 6f5:	83 ec 0c             	sub    $0xc,%esp
 6f8:	ff 75 e4             	pushl  -0x1c(%ebp)
 6fb:	e8 49 fc ff ff       	call   349 <sbrk>
 700:	83 c4 10             	add    $0x10,%esp
 703:	83 f8 ff             	cmp    $0xffffffff,%eax
 706:	74 1c                	je     724 <malloc+0x94>
 708:	89 58 04             	mov    %ebx,0x4(%eax)
 70b:	83 ec 0c             	sub    $0xc,%esp
 70e:	83 c0 08             	add    $0x8,%eax
 711:	50                   	push   %eax
 712:	e8 e9 fe ff ff       	call   600 <free>
 717:	8b 15 74 0a 00 00    	mov    0xa74,%edx
 71d:	83 c4 10             	add    $0x10,%esp
 720:	85 d2                	test   %edx,%edx
 722:	75 bc                	jne    6e0 <malloc+0x50>
 724:	8d 65 f4             	lea    -0xc(%ebp),%esp
 727:	31 c0                	xor    %eax,%eax
 729:	5b                   	pop    %ebx
 72a:	5e                   	pop    %esi
 72b:	5f                   	pop    %edi
 72c:	5d                   	pop    %ebp
 72d:	c3                   	ret    
 72e:	89 d0                	mov    %edx,%eax
 730:	89 fa                	mov    %edi,%edx
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 738:	39 ce                	cmp    %ecx,%esi
 73a:	74 54                	je     790 <malloc+0x100>
 73c:	29 f1                	sub    %esi,%ecx
 73e:	89 48 04             	mov    %ecx,0x4(%eax)
 741:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 744:	89 70 04             	mov    %esi,0x4(%eax)
 747:	89 15 74 0a 00 00    	mov    %edx,0xa74
 74d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 750:	83 c0 08             	add    $0x8,%eax
 753:	5b                   	pop    %ebx
 754:	5e                   	pop    %esi
 755:	5f                   	pop    %edi
 756:	5d                   	pop    %ebp
 757:	c3                   	ret    
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop
 760:	c7 05 74 0a 00 00 78 	movl   $0xa78,0xa74
 767:	0a 00 00 
 76a:	bf 78 0a 00 00       	mov    $0xa78,%edi
 76f:	c7 05 78 0a 00 00 78 	movl   $0xa78,0xa78
 776:	0a 00 00 
 779:	89 fa                	mov    %edi,%edx
 77b:	c7 05 7c 0a 00 00 00 	movl   $0x0,0xa7c
 782:	00 00 00 
 785:	e9 32 ff ff ff       	jmp    6bc <malloc+0x2c>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b1                	jmp    747 <malloc+0xb7>
