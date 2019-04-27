
_bedit:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
//
#include "types.h"
#include "user.h"
#include "fcntl.h"
int main(int argc,char *argv[])
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
  11:	81 ec d8 00 00 00    	sub    $0xd8,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
    int n;char buf[200];
    int fd;

    if(argc<2)
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 13                	jle    34 <main+0x34>
    {
        printf(2,"arguments are not enough!!\n");
    }
    else
    {
        if(argc==2)
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 af 00 00 00    	je     d9 <main+0xd9>
                    }
                }
                close(fd);
                exit();
        }
        else if(argc==3)
  2a:	83 f8 03             	cmp    $0x3,%eax
  2d:	74 18                	je     47 <main+0x47>
                    close(fd);
                    exit();
                }
            }
        }
        exit();
  2f:	e8 3d 05 00 00       	call   571 <exit>
        printf(2,"arguments are not enough!!\n");
  34:	50                   	push   %eax
  35:	50                   	push   %eax
  36:	68 48 0a 00 00       	push   $0xa48
  3b:	6a 02                	push   $0x2
  3d:	e8 9e 06 00 00       	call   6e0 <printf>
  42:	83 c4 10             	add    $0x10,%esp
  45:	eb e8                	jmp    2f <main+0x2f>
            if(strcmp(argv[2],"R")==0)
  47:	51                   	push   %ecx
  48:	51                   	push   %ecx
  49:	68 8a 0a 00 00       	push   $0xa8a
  4e:	ff 73 08             	pushl  0x8(%ebx)
  51:	e8 fa 02 00 00       	call   350 <strcmp>
  56:	83 c4 10             	add    $0x10,%esp
  59:	85 c0                	test   %eax,%eax
  5b:	0f 85 dc 00 00 00    	jne    13d <main+0x13d>
                close(0);
  61:	83 ec 0c             	sub    $0xc,%esp
  64:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
  6a:	6a 00                	push   $0x0
  6c:	e8 28 05 00 00       	call   599 <close>
                fd=open(argv[1],O_RDONLY);
  71:	58                   	pop    %eax
  72:	5a                   	pop    %edx
  73:	6a 00                	push   $0x0
  75:	ff 73 04             	pushl  0x4(%ebx)
  78:	e8 34 05 00 00       	call   5b1 <open>
                if(fd<0)
  7d:	83 c4 10             	add    $0x10,%esp
                fd=open(argv[1],O_RDONLY);
  80:	89 c7                	mov    %eax,%edi
                if(fd<0)
  82:	85 c0                	test   %eax,%eax
  84:	79 2a                	jns    b0 <main+0xb0>
                    printf(2,"read error\n");
  86:	50                   	push   %eax
  87:	50                   	push   %eax
  88:	68 8c 0a 00 00       	push   $0xa8c
  8d:	6a 02                	push   $0x2
  8f:	e8 4c 06 00 00       	call   6e0 <printf>
                    exit();
  94:	e8 d8 04 00 00       	call   571 <exit>
                        if(n == 0)
  99:	0f 84 90 00 00 00    	je     12f <main+0x12f>
                        if ((write(1, buf, n)) != n) {
  9f:	50                   	push   %eax
  a0:	53                   	push   %ebx
  a1:	56                   	push   %esi
  a2:	6a 01                	push   $0x1
  a4:	e8 e8 04 00 00       	call   591 <write>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	39 d8                	cmp    %ebx,%eax
  ae:	75 16                	jne    c6 <main+0xc6>
                        if ((n = read(fd, buf, sizeof(buf))) < 0) {
  b0:	50                   	push   %eax
  b1:	68 c8 00 00 00       	push   $0xc8
  b6:	56                   	push   %esi
  b7:	57                   	push   %edi
  b8:	e8 cc 04 00 00       	call   589 <read>
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	89 c3                	mov    %eax,%ebx
  c2:	85 c0                	test   %eax,%eax
  c4:	79 d3                	jns    99 <main+0x99>
                            printf(2, "unable to read\n");
  c6:	53                   	push   %ebx
  c7:	53                   	push   %ebx
  c8:	68 7a 0a 00 00       	push   $0xa7a
  cd:	6a 02                	push   $0x2
  cf:	e8 0c 06 00 00       	call   6e0 <printf>
                            exit();
  d4:	e8 98 04 00 00       	call   571 <exit>
            if((fd=open(argv[1],O_RDONLY))<0) {
  d9:	57                   	push   %edi
  da:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
  e0:	57                   	push   %edi
  e1:	6a 00                	push   $0x0
  e3:	ff 73 04             	pushl  0x4(%ebx)
  e6:	e8 c6 04 00 00       	call   5b1 <open>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	89 c7                	mov    %eax,%edi
  f0:	85 c0                	test   %eax,%eax
  f2:	79 21                	jns    115 <main+0x115>
  f4:	e9 05 01 00 00       	jmp    1fe <main+0x1fe>
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                        if(n == 0)
 100:	74 2d                	je     12f <main+0x12f>
                        if ((write(1, buf, n)) != n) {
 102:	83 ec 04             	sub    $0x4,%esp
 105:	50                   	push   %eax
 106:	56                   	push   %esi
 107:	6a 01                	push   $0x1
 109:	e8 83 04 00 00       	call   591 <write>
 10e:	83 c4 10             	add    $0x10,%esp
 111:	39 d8                	cmp    %ebx,%eax
 113:	75 b1                	jne    c6 <main+0xc6>
                        if ((n = read(fd, buf, sizeof(buf))) < 0) {
 115:	83 ec 04             	sub    $0x4,%esp
 118:	68 c8 00 00 00       	push   $0xc8
 11d:	56                   	push   %esi
 11e:	57                   	push   %edi
 11f:	e8 65 04 00 00       	call   589 <read>
 124:	83 c4 10             	add    $0x10,%esp
 127:	89 c3                	mov    %eax,%ebx
 129:	85 c0                	test   %eax,%eax
 12b:	79 d3                	jns    100 <main+0x100>
 12d:	eb 97                	jmp    c6 <main+0xc6>
                    close(fd);
 12f:	83 ec 0c             	sub    $0xc,%esp
 132:	57                   	push   %edi
 133:	e8 61 04 00 00       	call   599 <close>
                    exit();
 138:	e8 34 04 00 00       	call   571 <exit>
            if(strcmp(argv[2],"W")==0)
 13d:	51                   	push   %ecx
 13e:	51                   	push   %ecx
 13f:	68 98 0a 00 00       	push   $0xa98
 144:	ff 73 08             	pushl  0x8(%ebx)
 147:	e8 04 02 00 00       	call   350 <strcmp>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	85 c0                	test   %eax,%eax
 151:	75 6d                	jne    1c0 <main+0x1c0>
                unlink(argv[1]);
 153:	83 ec 0c             	sub    $0xc,%esp
 156:	ff 73 04             	pushl  0x4(%ebx)
 159:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
 15f:	e8 5d 04 00 00       	call   5c1 <unlink>
                fd=open(argv[1],O_CREATE | O_WRONLY);
 164:	58                   	pop    %eax
 165:	5a                   	pop    %edx
 166:	68 01 02 00 00       	push   $0x201
 16b:	ff 73 04             	pushl  0x4(%ebx)
 16e:	e8 3e 04 00 00       	call   5b1 <open>
                if(fd<0) {
 173:	83 c4 10             	add    $0x10,%esp
                fd=open(argv[1],O_CREATE | O_WRONLY);
 176:	89 c7                	mov    %eax,%edi
                if(fd<0) {
 178:	85 c0                	test   %eax,%eax
 17a:	79 1a                	jns    196 <main+0x196>
 17c:	e9 03 01 00 00       	jmp    284 <main+0x284>
                        if(n==1)
 181:	83 f8 01             	cmp    $0x1,%eax
 184:	74 a9                	je     12f <main+0x12f>
                        if ((write(fd, buf, n)) != n) {
 186:	50                   	push   %eax
 187:	53                   	push   %ebx
 188:	56                   	push   %esi
 189:	57                   	push   %edi
 18a:	e8 02 04 00 00       	call   591 <write>
 18f:	83 c4 10             	add    $0x10,%esp
 192:	39 d8                	cmp    %ebx,%eax
 194:	75 17                	jne    1ad <main+0x1ad>
                        if((n=read(0,buf, sizeof(buf)))<0)
 196:	50                   	push   %eax
 197:	68 c8 00 00 00       	push   $0xc8
 19c:	56                   	push   %esi
 19d:	6a 00                	push   $0x0
 19f:	e8 e5 03 00 00       	call   589 <read>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	89 c3                	mov    %eax,%ebx
 1a9:	85 c0                	test   %eax,%eax
 1ab:	79 d4                	jns    181 <main+0x181>
                            printf(2, "unable to write\n");
 1ad:	50                   	push   %eax
 1ae:	50                   	push   %eax
 1af:	68 9a 0a 00 00       	push   $0xa9a
 1b4:	6a 02                	push   $0x2
 1b6:	e8 25 05 00 00       	call   6e0 <printf>
                            exit();
 1bb:	e8 b1 03 00 00       	call   571 <exit>
            if(strcmp(argv[2],"C")==0)
 1c0:	56                   	push   %esi
 1c1:	56                   	push   %esi
 1c2:	68 ab 0a 00 00       	push   $0xaab
 1c7:	ff 73 08             	pushl  0x8(%ebx)
 1ca:	e8 81 01 00 00       	call   350 <strcmp>
 1cf:	83 c4 10             	add    $0x10,%esp
 1d2:	85 c0                	test   %eax,%eax
 1d4:	75 3b                	jne    211 <main+0x211>
                fd=open(argv[1],O_CREATE);
 1d6:	51                   	push   %ecx
 1d7:	51                   	push   %ecx
 1d8:	68 00 02 00 00       	push   $0x200
 1dd:	ff 73 04             	pushl  0x4(%ebx)
 1e0:	e8 cc 03 00 00       	call   5b1 <open>
                if(fd<0) {
 1e5:	83 c4 10             	add    $0x10,%esp
 1e8:	85 c0                	test   %eax,%eax
 1ea:	0f 88 a7 00 00 00    	js     297 <main+0x297>
                    close(fd);
 1f0:	83 ec 0c             	sub    $0xc,%esp
 1f3:	50                   	push   %eax
 1f4:	e8 a0 03 00 00       	call   599 <close>
                    exit();
 1f9:	e8 73 03 00 00       	call   571 <exit>
                printf(2, "File Doesn't Exists!\n");
 1fe:	56                   	push   %esi
 1ff:	56                   	push   %esi
 200:	68 64 0a 00 00       	push   $0xa64
 205:	6a 02                	push   $0x2
 207:	e8 d4 04 00 00       	call   6e0 <printf>
                exit();
 20c:	e8 60 03 00 00       	call   571 <exit>
                if(strcmp(argv[2],"X")==0)
 211:	50                   	push   %eax
 212:	50                   	push   %eax
 213:	68 bd 0a 00 00       	push   $0xabd
 218:	ff 73 08             	pushl  0x8(%ebx)
 21b:	e8 30 01 00 00       	call   350 <strcmp>
 220:	83 c4 10             	add    $0x10,%esp
 223:	85 c0                	test   %eax,%eax
 225:	0f 85 04 fe ff ff    	jne    2f <main+0x2f>
                    fd=open(argv[1],O_RDWR);
 22b:	50                   	push   %eax
 22c:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
 232:	50                   	push   %eax
 233:	6a 02                	push   $0x2
 235:	ff 73 04             	pushl  0x4(%ebx)
 238:	e8 74 03 00 00       	call   5b1 <open>
                    if(fd<0) {
 23d:	83 c4 10             	add    $0x10,%esp
                    fd=open(argv[1],O_RDWR);
 240:	89 c7                	mov    %eax,%edi
                    if(fd<0) {
 242:	85 c0                	test   %eax,%eax
 244:	79 15                	jns    25b <main+0x25b>
 246:	eb 62                	jmp    2aa <main+0x2aa>
                            if (n == 0) {
 248:	74 73                	je     2bd <main+0x2bd>
                            if (write(1, buf, n) != n) {
 24a:	50                   	push   %eax
 24b:	53                   	push   %ebx
 24c:	56                   	push   %esi
 24d:	6a 01                	push   $0x1
 24f:	e8 3d 03 00 00       	call   591 <write>
 254:	83 c4 10             	add    $0x10,%esp
 257:	39 d8                	cmp    %ebx,%eax
 259:	75 16                	jne    271 <main+0x271>
                            if ((n = read(fd, buf, sizeof(buf))) < 0) {
 25b:	50                   	push   %eax
 25c:	68 c8 00 00 00       	push   $0xc8
 261:	56                   	push   %esi
 262:	57                   	push   %edi
 263:	e8 21 03 00 00       	call   589 <read>
 268:	83 c4 10             	add    $0x10,%esp
 26b:	89 c3                	mov    %eax,%ebx
 26d:	85 c0                	test   %eax,%eax
 26f:	79 d7                	jns    248 <main+0x248>
                                printf(2, "unable to read from file\n");
 271:	50                   	push   %eax
 272:	50                   	push   %eax
 273:	68 d1 0a 00 00       	push   $0xad1
 278:	6a 02                	push   $0x2
 27a:	e8 61 04 00 00       	call   6e0 <printf>
                                exit();
 27f:	e8 ed 02 00 00       	call   571 <exit>
                    printf(2, "write error\n");
 284:	50                   	push   %eax
 285:	50                   	push   %eax
 286:	68 c4 0a 00 00       	push   $0xac4
 28b:	6a 02                	push   $0x2
 28d:	e8 4e 04 00 00       	call   6e0 <printf>
                    exit();
 292:	e8 da 02 00 00       	call   571 <exit>
                    printf(2, "creation error\n");
 297:	52                   	push   %edx
 298:	52                   	push   %edx
 299:	68 ad 0a 00 00       	push   $0xaad
 29e:	6a 02                	push   $0x2
 2a0:	e8 3b 04 00 00       	call   6e0 <printf>
                    exit();
 2a5:	e8 c7 02 00 00       	call   571 <exit>
                        printf(2,"read,write error\n");
 2aa:	50                   	push   %eax
 2ab:	50                   	push   %eax
 2ac:	68 bf 0a 00 00       	push   $0xabf
 2b1:	6a 02                	push   $0x2
 2b3:	e8 28 04 00 00       	call   6e0 <printf>
                        exit();
 2b8:	e8 b4 02 00 00       	call   571 <exit>
                        printf(1, "\n");
 2bd:	53                   	push   %ebx
 2be:	53                   	push   %ebx
 2bf:	68 62 0a 00 00       	push   $0xa62
 2c4:	6a 01                	push   $0x1
 2c6:	e8 15 04 00 00       	call   6e0 <printf>
 2cb:	83 c4 10             	add    $0x10,%esp
 2ce:	eb 19                	jmp    2e9 <main+0x2e9>
                            if (n == 1) {
 2d0:	83 f8 01             	cmp    $0x1,%eax
 2d3:	0f 84 56 fe ff ff    	je     12f <main+0x12f>
                            if (write(fd, buf, n) != n) {
 2d9:	52                   	push   %edx
 2da:	50                   	push   %eax
 2db:	56                   	push   %esi
 2dc:	57                   	push   %edi
 2dd:	e8 af 02 00 00       	call   591 <write>
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	39 d8                	cmp    %ebx,%eax
 2e7:	75 1c                	jne    305 <main+0x305>
                            if ((n = read(0, buf, sizeof(buf))) < 0) {
 2e9:	51                   	push   %ecx
 2ea:	68 c8 00 00 00       	push   $0xc8
 2ef:	56                   	push   %esi
 2f0:	6a 00                	push   $0x0
 2f2:	e8 92 02 00 00       	call   589 <read>
 2f7:	83 c4 10             	add    $0x10,%esp
 2fa:	89 c3                	mov    %eax,%ebx
 2fc:	85 c0                	test   %eax,%eax
 2fe:	79 d0                	jns    2d0 <main+0x2d0>
 300:	e9 6c ff ff ff       	jmp    271 <main+0x271>
                                printf(2, "unable to write into file\n");
 305:	50                   	push   %eax
 306:	50                   	push   %eax
 307:	68 eb 0a 00 00       	push   $0xaeb
 30c:	6a 02                	push   $0x2
 30e:	e8 cd 03 00 00       	call   6e0 <printf>
                                exit();
 313:	e8 59 02 00 00       	call   571 <exit>
 318:	66 90                	xchg   %ax,%ax
 31a:	66 90                	xchg   %ax,%ax
 31c:	66 90                	xchg   %ax,%ax
 31e:	66 90                	xchg   %ax,%ax

00000320 <strcpy>:
 320:	55                   	push   %ebp
 321:	31 d2                	xor    %edx,%edx
 323:	89 e5                	mov    %esp,%ebp
 325:	53                   	push   %ebx
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 330:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 334:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 337:	83 c2 01             	add    $0x1,%edx
 33a:	84 c9                	test   %cl,%cl
 33c:	75 f2                	jne    330 <strcpy+0x10>
 33e:	5b                   	pop    %ebx
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <strcmp>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	8b 5d 08             	mov    0x8(%ebp),%ebx
 358:	8b 75 0c             	mov    0xc(%ebp),%esi
 35b:	0f b6 13             	movzbl (%ebx),%edx
 35e:	0f b6 0e             	movzbl (%esi),%ecx
 361:	84 d2                	test   %dl,%dl
 363:	74 1e                	je     383 <strcmp+0x33>
 365:	b8 01 00 00 00       	mov    $0x1,%eax
 36a:	38 ca                	cmp    %cl,%dl
 36c:	74 09                	je     377 <strcmp+0x27>
 36e:	eb 20                	jmp    390 <strcmp+0x40>
 370:	83 c0 01             	add    $0x1,%eax
 373:	38 ca                	cmp    %cl,%dl
 375:	75 19                	jne    390 <strcmp+0x40>
 377:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 37b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 37f:	84 d2                	test   %dl,%dl
 381:	75 ed                	jne    370 <strcmp+0x20>
 383:	31 c0                	xor    %eax,%eax
 385:	5b                   	pop    %ebx
 386:	5e                   	pop    %esi
 387:	29 c8                	sub    %ecx,%eax
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
 390:	0f b6 c2             	movzbl %dl,%eax
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	29 c8                	sub    %ecx,%eax
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strlen>:
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a6:	80 39 00             	cmpb   $0x0,(%ecx)
 3a9:	74 15                	je     3c0 <strlen+0x20>
 3ab:	31 d2                	xor    %edx,%edx
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	83 c2 01             	add    $0x1,%edx
 3b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3b7:	89 d0                	mov    %edx,%eax
 3b9:	75 f5                	jne    3b0 <strlen+0x10>
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	31 c0                	xor    %eax,%eax
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <memset>:
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
 3d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	89 d7                	mov    %edx,%edi
 3df:	fc                   	cld    
 3e0:	f3 aa                	rep stos %al,%es:(%edi)
 3e2:	89 d0                	mov    %edx,%eax
 3e4:	5f                   	pop    %edi
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <strchr>:
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 45 08             	mov    0x8(%ebp),%eax
 3f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 3fa:	0f b6 18             	movzbl (%eax),%ebx
 3fd:	84 db                	test   %bl,%bl
 3ff:	74 1d                	je     41e <strchr+0x2e>
 401:	89 d1                	mov    %edx,%ecx
 403:	38 d3                	cmp    %dl,%bl
 405:	75 0d                	jne    414 <strchr+0x24>
 407:	eb 17                	jmp    420 <strchr+0x30>
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 410:	38 ca                	cmp    %cl,%dl
 412:	74 0c                	je     420 <strchr+0x30>
 414:	83 c0 01             	add    $0x1,%eax
 417:	0f b6 10             	movzbl (%eax),%edx
 41a:	84 d2                	test   %dl,%dl
 41c:	75 f2                	jne    410 <strchr+0x20>
 41e:	31 c0                	xor    %eax,%eax
 420:	5b                   	pop    %ebx
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    
 423:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000430 <gets>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	31 f6                	xor    %esi,%esi
 437:	53                   	push   %ebx
 438:	89 f3                	mov    %esi,%ebx
 43a:	83 ec 1c             	sub    $0x1c,%esp
 43d:	8b 7d 08             	mov    0x8(%ebp),%edi
 440:	eb 2f                	jmp    471 <gets+0x41>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 448:	83 ec 04             	sub    $0x4,%esp
 44b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44e:	6a 01                	push   $0x1
 450:	50                   	push   %eax
 451:	6a 00                	push   $0x0
 453:	e8 31 01 00 00       	call   589 <read>
 458:	83 c4 10             	add    $0x10,%esp
 45b:	85 c0                	test   %eax,%eax
 45d:	7e 1c                	jle    47b <gets+0x4b>
 45f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 463:	83 c7 01             	add    $0x1,%edi
 466:	88 47 ff             	mov    %al,-0x1(%edi)
 469:	3c 0a                	cmp    $0xa,%al
 46b:	74 23                	je     490 <gets+0x60>
 46d:	3c 0d                	cmp    $0xd,%al
 46f:	74 1f                	je     490 <gets+0x60>
 471:	83 c3 01             	add    $0x1,%ebx
 474:	89 fe                	mov    %edi,%esi
 476:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 479:	7c cd                	jl     448 <gets+0x18>
 47b:	89 f3                	mov    %esi,%ebx
 47d:	8b 45 08             	mov    0x8(%ebp),%eax
 480:	c6 03 00             	movb   $0x0,(%ebx)
 483:	8d 65 f4             	lea    -0xc(%ebp),%esp
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
 490:	8b 75 08             	mov    0x8(%ebp),%esi
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	01 de                	add    %ebx,%esi
 498:	89 f3                	mov    %esi,%ebx
 49a:	c6 03 00             	movb   $0x0,(%ebx)
 49d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a0:	5b                   	pop    %ebx
 4a1:	5e                   	pop    %esi
 4a2:	5f                   	pop    %edi
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret    
 4a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <stat>:
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	ff 75 08             	pushl  0x8(%ebp)
 4bd:	e8 ef 00 00 00       	call   5b1 <open>
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	85 c0                	test   %eax,%eax
 4c7:	78 27                	js     4f0 <stat+0x40>
 4c9:	83 ec 08             	sub    $0x8,%esp
 4cc:	ff 75 0c             	pushl  0xc(%ebp)
 4cf:	89 c3                	mov    %eax,%ebx
 4d1:	50                   	push   %eax
 4d2:	e8 f2 00 00 00       	call   5c9 <fstat>
 4d7:	89 1c 24             	mov    %ebx,(%esp)
 4da:	89 c6                	mov    %eax,%esi
 4dc:	e8 b8 00 00 00       	call   599 <close>
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e7:	89 f0                	mov    %esi,%eax
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f5:	eb ed                	jmp    4e4 <stat+0x34>
 4f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fe:	66 90                	xchg   %ax,%ax

00000500 <atoi>:
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	8b 4d 08             	mov    0x8(%ebp),%ecx
 507:	0f be 11             	movsbl (%ecx),%edx
 50a:	8d 42 d0             	lea    -0x30(%edx),%eax
 50d:	3c 09                	cmp    $0x9,%al
 50f:	b8 00 00 00 00       	mov    $0x0,%eax
 514:	77 1f                	ja     535 <atoi+0x35>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	83 c1 01             	add    $0x1,%ecx
 523:	8d 04 80             	lea    (%eax,%eax,4),%eax
 526:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 52a:	0f be 11             	movsbl (%ecx),%edx
 52d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 530:	80 fb 09             	cmp    $0x9,%bl
 533:	76 eb                	jbe    520 <atoi+0x20>
 535:	5b                   	pop    %ebx
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <memmove>:
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	8b 55 10             	mov    0x10(%ebp),%edx
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	56                   	push   %esi
 54b:	8b 75 0c             	mov    0xc(%ebp),%esi
 54e:	85 d2                	test   %edx,%edx
 550:	7e 13                	jle    565 <memmove+0x25>
 552:	01 c2                	add    %eax,%edx
 554:	89 c7                	mov    %eax,%edi
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 561:	39 fa                	cmp    %edi,%edx
 563:	75 fb                	jne    560 <memmove+0x20>
 565:	5e                   	pop    %esi
 566:	5f                   	pop    %edi
 567:	5d                   	pop    %ebp
 568:	c3                   	ret    

00000569 <fork>:
 569:	b8 01 00 00 00       	mov    $0x1,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <exit>:
 571:	b8 02 00 00 00       	mov    $0x2,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <wait>:
 579:	b8 03 00 00 00       	mov    $0x3,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <pipe>:
 581:	b8 04 00 00 00       	mov    $0x4,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <read>:
 589:	b8 05 00 00 00       	mov    $0x5,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <write>:
 591:	b8 10 00 00 00       	mov    $0x10,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <close>:
 599:	b8 15 00 00 00       	mov    $0x15,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <kill>:
 5a1:	b8 06 00 00 00       	mov    $0x6,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <exec>:
 5a9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <open>:
 5b1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <mknod>:
 5b9:	b8 11 00 00 00       	mov    $0x11,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <unlink>:
 5c1:	b8 12 00 00 00       	mov    $0x12,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <fstat>:
 5c9:	b8 08 00 00 00       	mov    $0x8,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <link>:
 5d1:	b8 13 00 00 00       	mov    $0x13,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <mkdir>:
 5d9:	b8 14 00 00 00       	mov    $0x14,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <chdir>:
 5e1:	b8 09 00 00 00       	mov    $0x9,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <dup>:
 5e9:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <getpid>:
 5f1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <sbrk>:
 5f9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <sleep>:
 601:	b8 0d 00 00 00       	mov    $0xd,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <uptime>:
 609:	b8 0e 00 00 00       	mov    $0xe,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    
 611:	66 90                	xchg   %ax,%ax
 613:	66 90                	xchg   %ax,%ax
 615:	66 90                	xchg   %ax,%ax
 617:	66 90                	xchg   %ax,%ax
 619:	66 90                	xchg   %ax,%ax
 61b:	66 90                	xchg   %ax,%ax
 61d:	66 90                	xchg   %ax,%ax
 61f:	90                   	nop

00000620 <printint>:
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	89 d3                	mov    %edx,%ebx
 628:	83 ec 3c             	sub    $0x3c,%esp
 62b:	89 45 bc             	mov    %eax,-0x44(%ebp)
 62e:	85 d2                	test   %edx,%edx
 630:	0f 89 92 00 00 00    	jns    6c8 <printint+0xa8>
 636:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 63a:	0f 84 88 00 00 00    	je     6c8 <printint+0xa8>
 640:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 647:	f7 db                	neg    %ebx
 649:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 650:	8d 75 d7             	lea    -0x29(%ebp),%esi
 653:	eb 08                	jmp    65d <printint+0x3d>
 655:	8d 76 00             	lea    0x0(%esi),%esi
 658:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 65b:	89 c3                	mov    %eax,%ebx
 65d:	89 d8                	mov    %ebx,%eax
 65f:	31 d2                	xor    %edx,%edx
 661:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 664:	f7 f1                	div    %ecx
 666:	83 c7 01             	add    $0x1,%edi
 669:	0f b6 92 10 0b 00 00 	movzbl 0xb10(%edx),%edx
 670:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 673:	39 d9                	cmp    %ebx,%ecx
 675:	76 e1                	jbe    658 <printint+0x38>
 677:	8b 45 c0             	mov    -0x40(%ebp),%eax
 67a:	85 c0                	test   %eax,%eax
 67c:	74 0d                	je     68b <printint+0x6b>
 67e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 683:	ba 2d 00 00 00       	mov    $0x2d,%edx
 688:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 68b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 68e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 691:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 695:	eb 0f                	jmp    6a6 <printint+0x86>
 697:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69e:	66 90                	xchg   %ax,%ax
 6a0:	0f b6 13             	movzbl (%ebx),%edx
 6a3:	83 eb 01             	sub    $0x1,%ebx
 6a6:	83 ec 04             	sub    $0x4,%esp
 6a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ac:	6a 01                	push   $0x1
 6ae:	56                   	push   %esi
 6af:	57                   	push   %edi
 6b0:	e8 dc fe ff ff       	call   591 <write>
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	39 de                	cmp    %ebx,%esi
 6ba:	75 e4                	jne    6a0 <printint+0x80>
 6bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 6cf:	e9 75 ff ff ff       	jmp    649 <printint+0x29>
 6d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop

000006e0 <printf>:
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 2c             	sub    $0x2c,%esp
 6e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6ec:	0f b6 1e             	movzbl (%esi),%ebx
 6ef:	84 db                	test   %bl,%bl
 6f1:	0f 84 b9 00 00 00    	je     7b0 <printf+0xd0>
 6f7:	8d 45 10             	lea    0x10(%ebp),%eax
 6fa:	83 c6 01             	add    $0x1,%esi
 6fd:	8d 7d e7             	lea    -0x19(%ebp),%edi
 700:	31 d2                	xor    %edx,%edx
 702:	89 45 d0             	mov    %eax,-0x30(%ebp)
 705:	eb 38                	jmp    73f <printf+0x5f>
 707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70e:	66 90                	xchg   %ax,%ax
 710:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 713:	ba 25 00 00 00       	mov    $0x25,%edx
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	74 17                	je     734 <printf+0x54>
 71d:	83 ec 04             	sub    $0x4,%esp
 720:	88 5d e7             	mov    %bl,-0x19(%ebp)
 723:	6a 01                	push   $0x1
 725:	57                   	push   %edi
 726:	ff 75 08             	pushl  0x8(%ebp)
 729:	e8 63 fe ff ff       	call   591 <write>
 72e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 731:	83 c4 10             	add    $0x10,%esp
 734:	83 c6 01             	add    $0x1,%esi
 737:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 73b:	84 db                	test   %bl,%bl
 73d:	74 71                	je     7b0 <printf+0xd0>
 73f:	0f be cb             	movsbl %bl,%ecx
 742:	0f b6 c3             	movzbl %bl,%eax
 745:	85 d2                	test   %edx,%edx
 747:	74 c7                	je     710 <printf+0x30>
 749:	83 fa 25             	cmp    $0x25,%edx
 74c:	75 e6                	jne    734 <printf+0x54>
 74e:	83 f8 64             	cmp    $0x64,%eax
 751:	0f 84 99 00 00 00    	je     7f0 <printf+0x110>
 757:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 75d:	83 f9 70             	cmp    $0x70,%ecx
 760:	74 5e                	je     7c0 <printf+0xe0>
 762:	83 f8 73             	cmp    $0x73,%eax
 765:	0f 84 d5 00 00 00    	je     840 <printf+0x160>
 76b:	83 f8 63             	cmp    $0x63,%eax
 76e:	0f 84 8c 00 00 00    	je     800 <printf+0x120>
 774:	83 f8 25             	cmp    $0x25,%eax
 777:	0f 84 b3 00 00 00    	je     830 <printf+0x150>
 77d:	83 ec 04             	sub    $0x4,%esp
 780:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 784:	6a 01                	push   $0x1
 786:	57                   	push   %edi
 787:	ff 75 08             	pushl  0x8(%ebp)
 78a:	e8 02 fe ff ff       	call   591 <write>
 78f:	88 5d e7             	mov    %bl,-0x19(%ebp)
 792:	83 c4 0c             	add    $0xc,%esp
 795:	6a 01                	push   $0x1
 797:	83 c6 01             	add    $0x1,%esi
 79a:	57                   	push   %edi
 79b:	ff 75 08             	pushl  0x8(%ebp)
 79e:	e8 ee fd ff ff       	call   591 <write>
 7a3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7a7:	83 c4 10             	add    $0x10,%esp
 7aa:	31 d2                	xor    %edx,%edx
 7ac:	84 db                	test   %bl,%bl
 7ae:	75 8f                	jne    73f <printf+0x5f>
 7b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c8:	6a 00                	push   $0x0
 7ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	8b 13                	mov    (%ebx),%edx
 7d2:	e8 49 fe ff ff       	call   620 <printint>
 7d7:	89 d8                	mov    %ebx,%eax
 7d9:	83 c4 10             	add    $0x10,%esp
 7dc:	31 d2                	xor    %edx,%edx
 7de:	83 c0 04             	add    $0x4,%eax
 7e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e4:	e9 4b ff ff ff       	jmp    734 <printf+0x54>
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f8:	6a 01                	push   $0x1
 7fa:	eb ce                	jmp    7ca <printf+0xea>
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 800:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 803:	83 ec 04             	sub    $0x4,%esp
 806:	8b 03                	mov    (%ebx),%eax
 808:	6a 01                	push   $0x1
 80a:	83 c3 04             	add    $0x4,%ebx
 80d:	57                   	push   %edi
 80e:	ff 75 08             	pushl  0x8(%ebp)
 811:	88 45 e7             	mov    %al,-0x19(%ebp)
 814:	e8 78 fd ff ff       	call   591 <write>
 819:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	31 d2                	xor    %edx,%edx
 821:	e9 0e ff ff ff       	jmp    734 <printf+0x54>
 826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82d:	8d 76 00             	lea    0x0(%esi),%esi
 830:	88 5d e7             	mov    %bl,-0x19(%ebp)
 833:	83 ec 04             	sub    $0x4,%esp
 836:	e9 5a ff ff ff       	jmp    795 <printf+0xb5>
 83b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
 840:	8b 45 d0             	mov    -0x30(%ebp),%eax
 843:	8b 18                	mov    (%eax),%ebx
 845:	83 c0 04             	add    $0x4,%eax
 848:	89 45 d0             	mov    %eax,-0x30(%ebp)
 84b:	85 db                	test   %ebx,%ebx
 84d:	74 17                	je     866 <printf+0x186>
 84f:	0f b6 03             	movzbl (%ebx),%eax
 852:	31 d2                	xor    %edx,%edx
 854:	84 c0                	test   %al,%al
 856:	0f 84 d8 fe ff ff    	je     734 <printf+0x54>
 85c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 85f:	89 de                	mov    %ebx,%esi
 861:	8b 5d 08             	mov    0x8(%ebp),%ebx
 864:	eb 1a                	jmp    880 <printf+0x1a0>
 866:	bb 06 0b 00 00       	mov    $0xb06,%ebx
 86b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 86e:	b8 28 00 00 00       	mov    $0x28,%eax
 873:	89 de                	mov    %ebx,%esi
 875:	8b 5d 08             	mov    0x8(%ebp),%ebx
 878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
 880:	83 ec 04             	sub    $0x4,%esp
 883:	83 c6 01             	add    $0x1,%esi
 886:	88 45 e7             	mov    %al,-0x19(%ebp)
 889:	6a 01                	push   $0x1
 88b:	57                   	push   %edi
 88c:	53                   	push   %ebx
 88d:	e8 ff fc ff ff       	call   591 <write>
 892:	0f b6 06             	movzbl (%esi),%eax
 895:	83 c4 10             	add    $0x10,%esp
 898:	84 c0                	test   %al,%al
 89a:	75 e4                	jne    880 <printf+0x1a0>
 89c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 89f:	31 d2                	xor    %edx,%edx
 8a1:	e9 8e fe ff ff       	jmp    734 <printf+0x54>
 8a6:	66 90                	xchg   %ax,%ax
 8a8:	66 90                	xchg   %ax,%ax
 8aa:	66 90                	xchg   %ax,%ax
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <free>:
 8b0:	55                   	push   %ebp
 8b1:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8be:	8b 10                	mov    (%eax),%edx
 8c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8c3:	39 c8                	cmp    %ecx,%eax
 8c5:	73 19                	jae    8e0 <free+0x30>
 8c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ce:	66 90                	xchg   %ax,%ax
 8d0:	39 d1                	cmp    %edx,%ecx
 8d2:	72 14                	jb     8e8 <free+0x38>
 8d4:	39 d0                	cmp    %edx,%eax
 8d6:	73 10                	jae    8e8 <free+0x38>
 8d8:	89 d0                	mov    %edx,%eax
 8da:	8b 10                	mov    (%eax),%edx
 8dc:	39 c8                	cmp    %ecx,%eax
 8de:	72 f0                	jb     8d0 <free+0x20>
 8e0:	39 d0                	cmp    %edx,%eax
 8e2:	72 f4                	jb     8d8 <free+0x28>
 8e4:	39 d1                	cmp    %edx,%ecx
 8e6:	73 f0                	jae    8d8 <free+0x28>
 8e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ee:	39 fa                	cmp    %edi,%edx
 8f0:	74 1e                	je     910 <free+0x60>
 8f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8f5:	8b 50 04             	mov    0x4(%eax),%edx
 8f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8fb:	39 f1                	cmp    %esi,%ecx
 8fd:	74 28                	je     927 <free+0x77>
 8ff:	89 08                	mov    %ecx,(%eax)
 901:	5b                   	pop    %ebx
 902:	a3 c4 0d 00 00       	mov    %eax,0xdc4
 907:	5e                   	pop    %esi
 908:	5f                   	pop    %edi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    
 90b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
 910:	03 72 04             	add    0x4(%edx),%esi
 913:	89 73 fc             	mov    %esi,-0x4(%ebx)
 916:	8b 10                	mov    (%eax),%edx
 918:	8b 12                	mov    (%edx),%edx
 91a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 91d:	8b 50 04             	mov    0x4(%eax),%edx
 920:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 923:	39 f1                	cmp    %esi,%ecx
 925:	75 d8                	jne    8ff <free+0x4f>
 927:	03 53 fc             	add    -0x4(%ebx),%edx
 92a:	a3 c4 0d 00 00       	mov    %eax,0xdc4
 92f:	89 50 04             	mov    %edx,0x4(%eax)
 932:	8b 53 f8             	mov    -0x8(%ebx),%edx
 935:	89 10                	mov    %edx,(%eax)
 937:	5b                   	pop    %ebx
 938:	5e                   	pop    %esi
 939:	5f                   	pop    %edi
 93a:	5d                   	pop    %ebp
 93b:	c3                   	ret    
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <malloc>:
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 1c             	sub    $0x1c,%esp
 949:	8b 45 08             	mov    0x8(%ebp),%eax
 94c:	8b 3d c4 0d 00 00    	mov    0xdc4,%edi
 952:	8d 70 07             	lea    0x7(%eax),%esi
 955:	c1 ee 03             	shr    $0x3,%esi
 958:	83 c6 01             	add    $0x1,%esi
 95b:	85 ff                	test   %edi,%edi
 95d:	0f 84 ad 00 00 00    	je     a10 <malloc+0xd0>
 963:	8b 17                	mov    (%edi),%edx
 965:	8b 4a 04             	mov    0x4(%edx),%ecx
 968:	39 f1                	cmp    %esi,%ecx
 96a:	73 72                	jae    9de <malloc+0x9e>
 96c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 972:	bb 00 10 00 00       	mov    $0x1000,%ebx
 977:	0f 43 de             	cmovae %esi,%ebx
 97a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 981:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 984:	eb 1b                	jmp    9a1 <malloc+0x61>
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi
 990:	8b 02                	mov    (%edx),%eax
 992:	8b 48 04             	mov    0x4(%eax),%ecx
 995:	39 f1                	cmp    %esi,%ecx
 997:	73 4f                	jae    9e8 <malloc+0xa8>
 999:	8b 3d c4 0d 00 00    	mov    0xdc4,%edi
 99f:	89 c2                	mov    %eax,%edx
 9a1:	39 d7                	cmp    %edx,%edi
 9a3:	75 eb                	jne    990 <malloc+0x50>
 9a5:	83 ec 0c             	sub    $0xc,%esp
 9a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 9ab:	e8 49 fc ff ff       	call   5f9 <sbrk>
 9b0:	83 c4 10             	add    $0x10,%esp
 9b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b6:	74 1c                	je     9d4 <malloc+0x94>
 9b8:	89 58 04             	mov    %ebx,0x4(%eax)
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	83 c0 08             	add    $0x8,%eax
 9c1:	50                   	push   %eax
 9c2:	e8 e9 fe ff ff       	call   8b0 <free>
 9c7:	8b 15 c4 0d 00 00    	mov    0xdc4,%edx
 9cd:	83 c4 10             	add    $0x10,%esp
 9d0:	85 d2                	test   %edx,%edx
 9d2:	75 bc                	jne    990 <malloc+0x50>
 9d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9d7:	31 c0                	xor    %eax,%eax
 9d9:	5b                   	pop    %ebx
 9da:	5e                   	pop    %esi
 9db:	5f                   	pop    %edi
 9dc:	5d                   	pop    %ebp
 9dd:	c3                   	ret    
 9de:	89 d0                	mov    %edx,%eax
 9e0:	89 fa                	mov    %edi,%edx
 9e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9e8:	39 ce                	cmp    %ecx,%esi
 9ea:	74 54                	je     a40 <malloc+0x100>
 9ec:	29 f1                	sub    %esi,%ecx
 9ee:	89 48 04             	mov    %ecx,0x4(%eax)
 9f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 9f4:	89 70 04             	mov    %esi,0x4(%eax)
 9f7:	89 15 c4 0d 00 00    	mov    %edx,0xdc4
 9fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a00:	83 c0 08             	add    $0x8,%eax
 a03:	5b                   	pop    %ebx
 a04:	5e                   	pop    %esi
 a05:	5f                   	pop    %edi
 a06:	5d                   	pop    %ebp
 a07:	c3                   	ret    
 a08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
 a10:	c7 05 c4 0d 00 00 c8 	movl   $0xdc8,0xdc4
 a17:	0d 00 00 
 a1a:	bf c8 0d 00 00       	mov    $0xdc8,%edi
 a1f:	c7 05 c8 0d 00 00 c8 	movl   $0xdc8,0xdc8
 a26:	0d 00 00 
 a29:	89 fa                	mov    %edi,%edx
 a2b:	c7 05 cc 0d 00 00 00 	movl   $0x0,0xdcc
 a32:	00 00 00 
 a35:	e9 32 ff ff ff       	jmp    96c <malloc+0x2c>
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a40:	8b 08                	mov    (%eax),%ecx
 a42:	89 0a                	mov    %ecx,(%edx)
 a44:	eb b1                	jmp    9f7 <malloc+0xb7>
