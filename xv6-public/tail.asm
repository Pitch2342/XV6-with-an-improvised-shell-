
_tail:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
    close(fd);
}
int
main(int argc, char *argv[])
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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
    int fd;

    if(argc <= 1){
  19:	83 fb 01             	cmp    $0x1,%ebx
  1c:	7e 3e                	jle    5c <main+0x5c>
        Tail(0,INT_MAX,".");
        exit();
    }


    if((fd = open(argv[1], 0)) < 0){
  1e:	57                   	push   %edi
  1f:	57                   	push   %edi
  20:	6a 00                	push   $0x0
  22:	ff 76 04             	pushl  0x4(%esi)
  25:	e8 47 04 00 00       	call   471 <open>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	89 c7                	mov    %eax,%edi
  2f:	85 c0                	test   %eax,%eax
  31:	78 40                	js     73 <main+0x73>
        printf(1, "Tail: cannot open %s\n", argv[1]);
        exit();
    }
    if (argc == 2)
  33:	83 fb 02             	cmp    $0x2,%ebx
  36:	74 6e                	je     a6 <main+0xa6>
        Tail(fd,10,argv[1]);
    else if (argc == 3)
  38:	83 fb 03             	cmp    $0x3,%ebx
  3b:	74 4b                	je     88 <main+0x88>
        Tail(fd,atoi(argv[2]),argv[1]);
    else
        printf(2,"Head: Too many args");
  3d:	50                   	push   %eax
  3e:	50                   	push   %eax
  3f:	68 5e 09 00 00       	push   $0x95e
  44:	6a 02                	push   $0x2
  46:	e8 55 05 00 00       	call   5a0 <printf>
  4b:	83 c4 10             	add    $0x10,%esp
    close(fd);
  4e:	83 ec 0c             	sub    $0xc,%esp
  51:	57                   	push   %edi
  52:	e8 02 04 00 00       	call   459 <close>
    exit();
  57:	e8 d5 03 00 00       	call   431 <exit>
        Tail(0,INT_MAX,".");
  5c:	50                   	push   %eax
  5d:	68 46 09 00 00       	push   $0x946
  62:	68 ff ff ff 7f       	push   $0x7fffffff
  67:	6a 00                	push   $0x0
  69:	e8 52 00 00 00       	call   c0 <Tail>
        exit();
  6e:	e8 be 03 00 00       	call   431 <exit>
        printf(1, "Tail: cannot open %s\n", argv[1]);
  73:	51                   	push   %ecx
  74:	ff 76 04             	pushl  0x4(%esi)
  77:	68 48 09 00 00       	push   $0x948
  7c:	6a 01                	push   $0x1
  7e:	e8 1d 05 00 00       	call   5a0 <printf>
        exit();
  83:	e8 a9 03 00 00       	call   431 <exit>
        Tail(fd,atoi(argv[2]),argv[1]);
  88:	8b 5e 04             	mov    0x4(%esi),%ebx
  8b:	83 ec 0c             	sub    $0xc,%esp
  8e:	ff 76 08             	pushl  0x8(%esi)
  91:	e8 2a 03 00 00       	call   3c0 <atoi>
  96:	83 c4 0c             	add    $0xc,%esp
  99:	53                   	push   %ebx
  9a:	50                   	push   %eax
  9b:	57                   	push   %edi
  9c:	e8 1f 00 00 00       	call   c0 <Tail>
  a1:	83 c4 10             	add    $0x10,%esp
  a4:	eb a8                	jmp    4e <main+0x4e>
        Tail(fd,10,argv[1]);
  a6:	52                   	push   %edx
  a7:	ff 76 04             	pushl  0x4(%esi)
  aa:	6a 0a                	push   $0xa
  ac:	50                   	push   %eax
  ad:	e8 0e 00 00 00       	call   c0 <Tail>
  b2:	83 c4 10             	add    $0x10,%esp
  b5:	eb 97                	jmp    4e <main+0x4e>
  b7:	66 90                	xchg   %ax,%ax
  b9:	66 90                	xchg   %ax,%ax
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <Tail>:
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
    int Total_Lines= 0;
  c6:	31 db                	xor    %ebx,%ebx
{
  c8:	83 ec 1c             	sub    $0x1c,%esp
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	8b 75 08             	mov    0x8(%ebp),%esi
  d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d4:	8b 45 10             	mov    0x10(%ebp),%eax
  d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while((n = read(fd, buf, 1)) > 0) {
  da:	eb 12                	jmp    ee <Tail+0x2e>
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            Total_Lines += 1;
  e0:	31 c0                	xor    %eax,%eax
  e2:	80 3d 80 0c 00 00 0a 	cmpb   $0xa,0xc80
  e9:	0f 94 c0             	sete   %al
  ec:	01 c3                	add    %eax,%ebx
    while((n = read(fd, buf, 1)) > 0) {
  ee:	83 ec 04             	sub    $0x4,%esp
  f1:	6a 01                	push   $0x1
  f3:	68 80 0c 00 00       	push   $0xc80
  f8:	56                   	push   %esi
  f9:	e8 4b 03 00 00       	call   449 <read>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	89 c7                	mov    %eax,%edi
 103:	85 c0                	test   %eax,%eax
 105:	7f d9                	jg     e0 <Tail+0x20>
    if(n < 0){
 107:	0f 85 ba 00 00 00    	jne    1c7 <Tail+0x107>
    if (Start < 0)
 10d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
 110:	0f 88 9a 00 00 00    	js     1b0 <Tail+0xf0>
    close(fd);
 116:	83 ec 0c             	sub    $0xc,%esp
 119:	56                   	push   %esi
 11a:	e8 3a 03 00 00       	call   459 <close>
    close(0);
 11f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 126:	e8 2e 03 00 00       	call   459 <close>
    fd = open(Path,0);
 12b:	58                   	pop    %eax
 12c:	5a                   	pop    %edx
 12d:	6a 00                	push   $0x0
 12f:	ff 75 e0             	pushl  -0x20(%ebp)
 132:	e8 3a 03 00 00       	call   471 <open>
    while((n = read(fd, buf, 1)) > 0) {
 137:	83 c4 10             	add    $0x10,%esp
    fd = open(Path,0);
 13a:	89 c6                	mov    %eax,%esi
    while((n = read(fd, buf, 1)) > 0) {
 13c:	eb 10                	jmp    14e <Tail+0x8e>
 13e:	66 90                	xchg   %ax,%ax
            Counter += 1;
 140:	31 c0                	xor    %eax,%eax
 142:	80 3d 80 0c 00 00 0a 	cmpb   $0xa,0xc80
 149:	0f 94 c0             	sete   %al
 14c:	01 c7                	add    %eax,%edi
    while((n = read(fd, buf, 1)) > 0) {
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	6a 01                	push   $0x1
 153:	68 80 0c 00 00       	push   $0xc80
 158:	56                   	push   %esi
 159:	e8 eb 02 00 00       	call   449 <read>
 15e:	83 c4 10             	add    $0x10,%esp
 161:	85 c0                	test   %eax,%eax
 163:	7e 3b                	jle    1a0 <Tail+0xe0>
        if(Counter >= Start)
 165:	39 df                	cmp    %ebx,%edi
 167:	7c d7                	jl     140 <Tail+0x80>
            if((write(1,buf,1)) != 1)
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	6a 01                	push   $0x1
 16e:	68 80 0c 00 00       	push   $0xc80
 173:	6a 01                	push   $0x1
 175:	e8 d7 02 00 00       	call   451 <write>
 17a:	83 c4 10             	add    $0x10,%esp
 17d:	83 f8 01             	cmp    $0x1,%eax
 180:	74 be                	je     140 <Tail+0x80>
                printf(1, "Head: write error\n");
 182:	83 ec 08             	sub    $0x8,%esp
 185:	68 33 09 00 00       	push   $0x933
 18a:	6a 01                	push   $0x1
 18c:	e8 0f 04 00 00       	call   5a0 <printf>
                exit();
 191:	e8 9b 02 00 00       	call   431 <exit>
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    close(fd);
 1a0:	89 75 08             	mov    %esi,0x8(%ebp)
}
 1a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a6:	5b                   	pop    %ebx
 1a7:	5e                   	pop    %esi
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
    close(fd);
 1aa:	e9 aa 02 00 00       	jmp    459 <close>
 1af:	90                   	nop
        printf(1, "Tail:Invalid no of lines");
 1b0:	83 ec 08             	sub    $0x8,%esp
 1b3:	68 1a 09 00 00       	push   $0x91a
 1b8:	6a 01                	push   $0x1
 1ba:	e8 e1 03 00 00       	call   5a0 <printf>
 1bf:	83 c4 10             	add    $0x10,%esp
 1c2:	e9 4f ff ff ff       	jmp    116 <Tail+0x56>
        printf(1,"Tail: read error\n");
 1c7:	51                   	push   %ecx
 1c8:	51                   	push   %ecx
 1c9:	68 08 09 00 00       	push   $0x908
 1ce:	6a 01                	push   $0x1
 1d0:	e8 cb 03 00 00       	call   5a0 <printf>
        exit();
 1d5:	e8 57 02 00 00       	call   431 <exit>
 1da:	66 90                	xchg   %ax,%ax
 1dc:	66 90                	xchg   %ax,%ax
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1e1:	31 d2                	xor    %edx,%edx
{
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	53                   	push   %ebx
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
 1e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1f0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1f4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1f7:	83 c2 01             	add    $0x1,%edx
 1fa:	84 c9                	test   %cl,%cl
 1fc:	75 f2                	jne    1f0 <strcpy+0x10>
    ;
  return os;
}
 1fe:	5b                   	pop    %ebx
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	8b 5d 08             	mov    0x8(%ebp),%ebx
 218:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 21b:	0f b6 13             	movzbl (%ebx),%edx
 21e:	0f b6 0e             	movzbl (%esi),%ecx
 221:	84 d2                	test   %dl,%dl
 223:	74 1e                	je     243 <strcmp+0x33>
 225:	b8 01 00 00 00       	mov    $0x1,%eax
 22a:	38 ca                	cmp    %cl,%dl
 22c:	74 09                	je     237 <strcmp+0x27>
 22e:	eb 20                	jmp    250 <strcmp+0x40>
 230:	83 c0 01             	add    $0x1,%eax
 233:	38 ca                	cmp    %cl,%dl
 235:	75 19                	jne    250 <strcmp+0x40>
 237:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 23b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 23f:	84 d2                	test   %dl,%dl
 241:	75 ed                	jne    230 <strcmp+0x20>
 243:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 245:	5b                   	pop    %ebx
 246:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 247:	29 c8                	sub    %ecx,%eax
}
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop
 250:	0f b6 c2             	movzbl %dl,%eax
 253:	5b                   	pop    %ebx
 254:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 255:	29 c8                	sub    %ecx,%eax
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strlen>:

uint
strlen(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 39 00             	cmpb   $0x0,(%ecx)
 269:	74 15                	je     280 <strlen+0x20>
 26b:	31 d2                	xor    %edx,%edx
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c2 01             	add    $0x1,%edx
 273:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 277:	89 d0                	mov    %edx,%eax
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 280:	31 c0                	xor    %eax,%eax
}
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    
 284:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld    
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	89 d0                	mov    %edx,%eax
 2a4:	5f                   	pop    %edi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2ba:	0f b6 18             	movzbl (%eax),%ebx
 2bd:	84 db                	test   %bl,%bl
 2bf:	74 1d                	je     2de <strchr+0x2e>
 2c1:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 2c3:	38 d3                	cmp    %dl,%bl
 2c5:	75 0d                	jne    2d4 <strchr+0x24>
 2c7:	eb 17                	jmp    2e0 <strchr+0x30>
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2d0:	38 ca                	cmp    %cl,%dl
 2d2:	74 0c                	je     2e0 <strchr+0x30>
  for(; *s; s++)
 2d4:	83 c0 01             	add    $0x1,%eax
 2d7:	0f b6 10             	movzbl (%eax),%edx
 2da:	84 d2                	test   %dl,%dl
 2dc:	75 f2                	jne    2d0 <strchr+0x20>
      return (char*)s;
  return 0;
 2de:	31 c0                	xor    %eax,%eax
}
 2e0:	5b                   	pop    %ebx
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f5:	31 f6                	xor    %esi,%esi
{
 2f7:	53                   	push   %ebx
 2f8:	89 f3                	mov    %esi,%ebx
 2fa:	83 ec 1c             	sub    $0x1c,%esp
 2fd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 300:	eb 2f                	jmp    331 <gets+0x41>
 302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 308:	83 ec 04             	sub    $0x4,%esp
 30b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 30e:	6a 01                	push   $0x1
 310:	50                   	push   %eax
 311:	6a 00                	push   $0x0
 313:	e8 31 01 00 00       	call   449 <read>
    if(cc < 1)
 318:	83 c4 10             	add    $0x10,%esp
 31b:	85 c0                	test   %eax,%eax
 31d:	7e 1c                	jle    33b <gets+0x4b>
      break;
    buf[i++] = c;
 31f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 323:	83 c7 01             	add    $0x1,%edi
 326:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 329:	3c 0a                	cmp    $0xa,%al
 32b:	74 23                	je     350 <gets+0x60>
 32d:	3c 0d                	cmp    $0xd,%al
 32f:	74 1f                	je     350 <gets+0x60>
  for(i=0; i+1 < max; ){
 331:	83 c3 01             	add    $0x1,%ebx
 334:	89 fe                	mov    %edi,%esi
 336:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 339:	7c cd                	jl     308 <gets+0x18>
 33b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 340:	c6 03 00             	movb   $0x0,(%ebx)
}
 343:	8d 65 f4             	lea    -0xc(%ebp),%esp
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
 350:	8b 75 08             	mov    0x8(%ebp),%esi
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	01 de                	add    %ebx,%esi
 358:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 35a:	c6 03 00             	movb   $0x0,(%ebx)
}
 35d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	6a 00                	push   $0x0
 37a:	ff 75 08             	pushl  0x8(%ebp)
 37d:	e8 ef 00 00 00       	call   471 <open>
  if(fd < 0)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	78 27                	js     3b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	ff 75 0c             	pushl  0xc(%ebp)
 38f:	89 c3                	mov    %eax,%ebx
 391:	50                   	push   %eax
 392:	e8 f2 00 00 00       	call   489 <fstat>
  close(fd);
 397:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 39a:	89 c6                	mov    %eax,%esi
  close(fd);
 39c:	e8 b8 00 00 00       	call   459 <close>
  return r;
 3a1:	83 c4 10             	add    $0x10,%esp
}
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	89 f0                	mov    %esi,%eax
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b5:	eb ed                	jmp    3a4 <stat+0x34>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 11             	movsbl (%ecx),%edx
 3ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 3cd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3d4:	77 1f                	ja     3f5 <atoi+0x35>
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 3e0:	83 c1 01             	add    $0x1,%ecx
 3e3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3ea:	0f be 11             	movsbl (%ecx),%edx
 3ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
  return n;
}
 3f5:	5b                   	pop    %ebx
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 10             	mov    0x10(%ebp),%edx
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	56                   	push   %esi
 40b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40e:	85 d2                	test   %edx,%edx
 410:	7e 13                	jle    425 <memmove+0x25>
 412:	01 c2                	add    %eax,%edx
  dst = vdst;
 414:	89 c7                	mov    %eax,%edi
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 420:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 421:	39 fa                	cmp    %edi,%edx
 423:	75 fb                	jne    420 <memmove+0x20>
  return vdst;
}
 425:	5e                   	pop    %esi
 426:	5f                   	pop    %edi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 429:	b8 01 00 00 00       	mov    $0x1,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <exit>:
SYSCALL(exit)
 431:	b8 02 00 00 00       	mov    $0x2,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <wait>:
SYSCALL(wait)
 439:	b8 03 00 00 00       	mov    $0x3,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <pipe>:
SYSCALL(pipe)
 441:	b8 04 00 00 00       	mov    $0x4,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <read>:
SYSCALL(read)
 449:	b8 05 00 00 00       	mov    $0x5,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <write>:
SYSCALL(write)
 451:	b8 10 00 00 00       	mov    $0x10,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <close>:
SYSCALL(close)
 459:	b8 15 00 00 00       	mov    $0x15,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <kill>:
SYSCALL(kill)
 461:	b8 06 00 00 00       	mov    $0x6,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <exec>:
SYSCALL(exec)
 469:	b8 07 00 00 00       	mov    $0x7,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <open>:
SYSCALL(open)
 471:	b8 0f 00 00 00       	mov    $0xf,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <mknod>:
SYSCALL(mknod)
 479:	b8 11 00 00 00       	mov    $0x11,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <unlink>:
SYSCALL(unlink)
 481:	b8 12 00 00 00       	mov    $0x12,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <fstat>:
SYSCALL(fstat)
 489:	b8 08 00 00 00       	mov    $0x8,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <link>:
SYSCALL(link)
 491:	b8 13 00 00 00       	mov    $0x13,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <mkdir>:
SYSCALL(mkdir)
 499:	b8 14 00 00 00       	mov    $0x14,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <chdir>:
SYSCALL(chdir)
 4a1:	b8 09 00 00 00       	mov    $0x9,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <dup>:
SYSCALL(dup)
 4a9:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <getpid>:
SYSCALL(getpid)
 4b1:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <sbrk>:
SYSCALL(sbrk)
 4b9:	b8 0c 00 00 00       	mov    $0xc,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <sleep>:
SYSCALL(sleep)
 4c1:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <uptime>:
SYSCALL(uptime)
 4c9:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    
 4d1:	66 90                	xchg   %ax,%ax
 4d3:	66 90                	xchg   %ax,%ax
 4d5:	66 90                	xchg   %ax,%ax
 4d7:	66 90                	xchg   %ax,%ax
 4d9:	66 90                	xchg   %ax,%ax
 4db:	66 90                	xchg   %ax,%ax
 4dd:	66 90                	xchg   %ax,%ax
 4df:	90                   	nop

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4e6:	89 d3                	mov    %edx,%ebx
{
 4e8:	83 ec 3c             	sub    $0x3c,%esp
 4eb:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 4ee:	85 d2                	test   %edx,%edx
 4f0:	0f 89 92 00 00 00    	jns    588 <printint+0xa8>
 4f6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fa:	0f 84 88 00 00 00    	je     588 <printint+0xa8>
    neg = 1;
 500:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 507:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 509:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 510:	8d 75 d7             	lea    -0x29(%ebp),%esi
 513:	eb 08                	jmp    51d <printint+0x3d>
 515:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 518:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 51b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 51d:	89 d8                	mov    %ebx,%eax
 51f:	31 d2                	xor    %edx,%edx
 521:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 524:	f7 f1                	div    %ecx
 526:	83 c7 01             	add    $0x1,%edi
 529:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 530:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 533:	39 d9                	cmp    %ebx,%ecx
 535:	76 e1                	jbe    518 <printint+0x38>
  if(neg)
 537:	8b 45 c0             	mov    -0x40(%ebp),%eax
 53a:	85 c0                	test   %eax,%eax
 53c:	74 0d                	je     54b <printint+0x6b>
    buf[i++] = '-';
 53e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 543:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 548:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 54b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 54e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 551:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 555:	eb 0f                	jmp    566 <printint+0x86>
 557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55e:	66 90                	xchg   %ax,%ax
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 566:	83 ec 04             	sub    $0x4,%esp
 569:	88 55 d7             	mov    %dl,-0x29(%ebp)
 56c:	6a 01                	push   $0x1
 56e:	56                   	push   %esi
 56f:	57                   	push   %edi
 570:	e8 dc fe ff ff       	call   451 <write>

  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x80>
    putc(fd, buf[i]);
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 58f:	e9 75 ff ff ff       	jmp    509 <printint+0x29>
 594:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5ac:	0f b6 1e             	movzbl (%esi),%ebx
 5af:	84 db                	test   %bl,%bl
 5b1:	0f 84 b9 00 00 00    	je     670 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 5b7:	8d 45 10             	lea    0x10(%ebp),%eax
 5ba:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5bd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5c0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c5:	eb 38                	jmp    5ff <printf+0x5f>
 5c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ce:	66 90                	xchg   %ax,%ax
 5d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	74 17                	je     5f4 <printf+0x54>
  write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	ff 75 08             	pushl  0x8(%ebp)
 5e9:	e8 63 fe ff ff       	call   451 <write>
 5ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5f1:	83 c4 10             	add    $0x10,%esp
 5f4:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5f7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5fb:	84 db                	test   %bl,%bl
 5fd:	74 71                	je     670 <printf+0xd0>
    c = fmt[i] & 0xff;
 5ff:	0f be cb             	movsbl %bl,%ecx
 602:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 605:	85 d2                	test   %edx,%edx
 607:	74 c7                	je     5d0 <printf+0x30>
      }
    } else if(state == '%'){
 609:	83 fa 25             	cmp    $0x25,%edx
 60c:	75 e6                	jne    5f4 <printf+0x54>
      if(c == 'd'){
 60e:	83 f8 64             	cmp    $0x64,%eax
 611:	0f 84 99 00 00 00    	je     6b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 617:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 61d:	83 f9 70             	cmp    $0x70,%ecx
 620:	74 5e                	je     680 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 622:	83 f8 73             	cmp    $0x73,%eax
 625:	0f 84 d5 00 00 00    	je     700 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 62b:	83 f8 63             	cmp    $0x63,%eax
 62e:	0f 84 8c 00 00 00    	je     6c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 634:	83 f8 25             	cmp    $0x25,%eax
 637:	0f 84 b3 00 00 00    	je     6f0 <printf+0x150>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 644:	6a 01                	push   $0x1
 646:	57                   	push   %edi
 647:	ff 75 08             	pushl  0x8(%ebp)
 64a:	e8 02 fe ff ff       	call   451 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 64f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 652:	83 c4 0c             	add    $0xc,%esp
 655:	6a 01                	push   $0x1
 657:	83 c6 01             	add    $0x1,%esi
 65a:	57                   	push   %edi
 65b:	ff 75 08             	pushl  0x8(%ebp)
 65e:	e8 ee fd ff ff       	call   451 <write>
  for(i = 0; fmt[i]; i++){
 663:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 667:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 66a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 66c:	84 db                	test   %bl,%bl
 66e:	75 8f                	jne    5ff <printf+0x5f>
    }
  }
}
 670:	8d 65 f4             	lea    -0xc(%ebp),%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 68d:	8b 45 08             	mov    0x8(%ebp),%eax
 690:	8b 13                	mov    (%ebx),%edx
 692:	e8 49 fe ff ff       	call   4e0 <printint>
        ap++;
 697:	89 d8                	mov    %ebx,%eax
 699:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69c:	31 d2                	xor    %edx,%edx
        ap++;
 69e:	83 c0 04             	add    $0x4,%eax
 6a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a4:	e9 4b ff ff ff       	jmp    5f4 <printf+0x54>
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	eb ce                	jmp    68a <printf+0xea>
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
        ap++;
 6ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6cd:	57                   	push   %edi
 6ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d4:	e8 78 fd ff ff       	call   451 <write>
        ap++;
 6d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6df:	31 d2                	xor    %edx,%edx
 6e1:	e9 0e ff ff ff       	jmp    5f4 <printf+0x54>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
 6f6:	e9 5a ff ff ff       	jmp    655 <printf+0xb5>
 6fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop
        s = (char*)*ap;
 700:	8b 45 d0             	mov    -0x30(%ebp),%eax
 703:	8b 18                	mov    (%eax),%ebx
        ap++;
 705:	83 c0 04             	add    $0x4,%eax
 708:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 70b:	85 db                	test   %ebx,%ebx
 70d:	74 17                	je     726 <printf+0x186>
        while(*s != 0){
 70f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 712:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 714:	84 c0                	test   %al,%al
 716:	0f 84 d8 fe ff ff    	je     5f4 <printf+0x54>
 71c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 71f:	89 de                	mov    %ebx,%esi
 721:	8b 5d 08             	mov    0x8(%ebp),%ebx
 724:	eb 1a                	jmp    740 <printf+0x1a0>
          s = "(null)";
 726:	bb 72 09 00 00       	mov    $0x972,%ebx
        while(*s != 0){
 72b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 72e:	b8 28 00 00 00       	mov    $0x28,%eax
 733:	89 de                	mov    %ebx,%esi
 735:	8b 5d 08             	mov    0x8(%ebp),%ebx
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
          s++;
 743:	83 c6 01             	add    $0x1,%esi
 746:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 749:	6a 01                	push   $0x1
 74b:	57                   	push   %edi
 74c:	53                   	push   %ebx
 74d:	e8 ff fc ff ff       	call   451 <write>
        while(*s != 0){
 752:	0f b6 06             	movzbl (%esi),%eax
 755:	83 c4 10             	add    $0x10,%esp
 758:	84 c0                	test   %al,%al
 75a:	75 e4                	jne    740 <printf+0x1a0>
 75c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 75f:	31 d2                	xor    %edx,%edx
 761:	e9 8e fe ff ff       	jmp    5f4 <printf+0x54>
 766:	66 90                	xchg   %ax,%ax
 768:	66 90                	xchg   %ax,%ax
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 60 0c 00 00       	mov    0xc60,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 77e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 780:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 783:	39 c8                	cmp    %ecx,%eax
 785:	73 19                	jae    7a0 <free+0x30>
 787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78e:	66 90                	xchg   %ax,%ax
 790:	39 d1                	cmp    %edx,%ecx
 792:	72 14                	jb     7a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	39 d0                	cmp    %edx,%eax
 796:	73 10                	jae    7a8 <free+0x38>
{
 798:	89 d0                	mov    %edx,%eax
 79a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79c:	39 c8                	cmp    %ecx,%eax
 79e:	72 f0                	jb     790 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 f4                	jb     798 <free+0x28>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	73 f0                	jae    798 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 fa                	cmp    %edi,%edx
 7b0:	74 1e                	je     7d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7b5:	8b 50 04             	mov    0x4(%eax),%edx
 7b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7bb:	39 f1                	cmp    %esi,%ecx
 7bd:	74 28                	je     7e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7c1:	5b                   	pop    %ebx
  freep = p;
 7c2:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 7c7:	5e                   	pop    %esi
 7c8:	5f                   	pop    %edi
 7c9:	5d                   	pop    %ebp
 7ca:	c3                   	ret    
 7cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 72 04             	add    0x4(%edx),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 12                	mov    (%edx),%edx
 7da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	75 d8                	jne    7bf <free+0x4f>
    p->s.size += bp->s.size;
 7e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ea:	a3 60 0c 00 00       	mov    %eax,0xc60
    p->s.size += bp->s.size;
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7f5:	89 10                	mov    %edx,(%eax)
}
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 3d 60 0c 00 00    	mov    0xc60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 70 07             	lea    0x7(%eax),%esi
 815:	c1 ee 03             	shr    $0x3,%esi
 818:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 81b:	85 ff                	test   %edi,%edi
 81d:	0f 84 ad 00 00 00    	je     8d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 825:	8b 4a 04             	mov    0x4(%edx),%ecx
 828:	39 f1                	cmp    %esi,%ecx
 82a:	73 72                	jae    89e <malloc+0x9e>
 82c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 832:	bb 00 10 00 00       	mov    $0x1000,%ebx
 837:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 83a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 844:	eb 1b                	jmp    861 <malloc+0x61>
 846:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 850:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 852:	8b 48 04             	mov    0x4(%eax),%ecx
 855:	39 f1                	cmp    %esi,%ecx
 857:	73 4f                	jae    8a8 <malloc+0xa8>
 859:	8b 3d 60 0c 00 00    	mov    0xc60,%edi
 85f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 861:	39 d7                	cmp    %edx,%edi
 863:	75 eb                	jne    850 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 865:	83 ec 0c             	sub    $0xc,%esp
 868:	ff 75 e4             	pushl  -0x1c(%ebp)
 86b:	e8 49 fc ff ff       	call   4b9 <sbrk>
  if(p == (char*)-1)
 870:	83 c4 10             	add    $0x10,%esp
 873:	83 f8 ff             	cmp    $0xffffffff,%eax
 876:	74 1c                	je     894 <malloc+0x94>
  hp->s.size = nu;
 878:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 87b:	83 ec 0c             	sub    $0xc,%esp
 87e:	83 c0 08             	add    $0x8,%eax
 881:	50                   	push   %eax
 882:	e8 e9 fe ff ff       	call   770 <free>
  return freep;
 887:	8b 15 60 0c 00 00    	mov    0xc60,%edx
      if((p = morecore(nunits)) == 0)
 88d:	83 c4 10             	add    $0x10,%esp
 890:	85 d2                	test   %edx,%edx
 892:	75 bc                	jne    850 <malloc+0x50>
        return 0;
  }
}
 894:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 897:	31 c0                	xor    %eax,%eax
}
 899:	5b                   	pop    %ebx
 89a:	5e                   	pop    %esi
 89b:	5f                   	pop    %edi
 89c:	5d                   	pop    %ebp
 89d:	c3                   	ret    
    if(p->s.size >= nunits){
 89e:	89 d0                	mov    %edx,%eax
 8a0:	89 fa                	mov    %edi,%edx
 8a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8a8:	39 ce                	cmp    %ecx,%esi
 8aa:	74 54                	je     900 <malloc+0x100>
        p->s.size -= nunits;
 8ac:	29 f1                	sub    %esi,%ecx
 8ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8b7:	89 15 60 0c 00 00    	mov    %edx,0xc60
}
 8bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c0:	83 c0 08             	add    $0x8,%eax
}
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 60 0c 00 00 64 	movl   $0xc64,0xc60
 8d7:	0c 00 00 
    base.s.size = 0;
 8da:	bf 64 0c 00 00       	mov    $0xc64,%edi
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 64 0c 00 00 64 	movl   $0xc64,0xc64
 8e6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8eb:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 8f2:	00 00 00 
    if(p->s.size >= nunits){
 8f5:	e9 32 ff ff ff       	jmp    82c <malloc+0x2c>
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b1                	jmp    8b7 <malloc+0xb7>
