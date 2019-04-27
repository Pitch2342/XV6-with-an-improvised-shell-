
_mv:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fs.h"


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
  11:	81 ec 38 02 00 00    	sub    $0x238,%esp
    if (argc != 3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)
{
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    if (argc != 3)
  1d:	74 13                	je     32 <main+0x32>
    {
        printf(2, "mv: too many or less args\n");
  1f:	50                   	push   %eax
  20:	50                   	push   %eax
  21:	68 f8 08 00 00       	push   $0x8f8
  26:	6a 02                	push   $0x2
  28:	e8 63 05 00 00       	call   590 <printf>
        exit();
  2d:	e8 ef 03 00 00       	call   421 <exit>
    }
    char buf[512];
    int fd1,fd2,n;
    struct stat st;

    if((fd1 = open(argv[1], O_RDONLY)) < 0){
  32:	50                   	push   %eax
  33:	50                   	push   %eax
  34:	6a 00                	push   $0x0
  36:	ff 73 04             	pushl  0x4(%ebx)
  39:	e8 23 04 00 00       	call   461 <open>
  3e:	83 c4 10             	add    $0x10,%esp
  41:	89 c6                	mov    %eax,%esi
  43:	85 c0                	test   %eax,%eax
  45:	78 65                	js     ac <main+0xac>
        printf(2, "mv: Cannot open %s\n", argv[1]);
        exit();
    }

    if(fstat(fd1, &st) < 0){
  47:	50                   	push   %eax
  48:	50                   	push   %eax
  49:	8d 85 d4 fd ff ff    	lea    -0x22c(%ebp),%eax
  4f:	50                   	push   %eax
  50:	56                   	push   %esi
  51:	e8 23 04 00 00       	call   479 <fstat>
  56:	83 c4 10             	add    $0x10,%esp
  59:	85 c0                	test   %eax,%eax
  5b:	78 32                	js     8f <main+0x8f>
        printf(2, "mv: Cannot stat %s\n", argv[1]);
        close(fd1);
        exit();
    }
    if (st.type == T_FILE)
  5d:	66 83 bd d4 fd ff ff 	cmpw   $0x2,-0x22c(%ebp)
  64:	02 
  65:	74 5a                	je     c1 <main+0xc1>
        }
        close(fd2);
    }
    else
    {
        printf(2, "mv: invalid args");
  67:	52                   	push   %edx
  68:	52                   	push   %edx
  69:	68 3b 09 00 00       	push   $0x93b
  6e:	6a 02                	push   $0x2
  70:	e8 1b 05 00 00       	call   590 <printf>
  75:	83 c4 10             	add    $0x10,%esp
    }
    close(fd1);
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	56                   	push   %esi
  7c:	e8 c8 03 00 00       	call   449 <close>
    unlink(argv[1]);
  81:	58                   	pop    %eax
  82:	ff 73 04             	pushl  0x4(%ebx)
  85:	e8 e7 03 00 00       	call   471 <unlink>
    exit();
  8a:	e8 92 03 00 00       	call   421 <exit>
        printf(2, "mv: Cannot stat %s\n", argv[1]);
  8f:	50                   	push   %eax
  90:	ff 73 04             	pushl  0x4(%ebx)
  93:	68 27 09 00 00       	push   $0x927
  98:	6a 02                	push   $0x2
  9a:	e8 f1 04 00 00       	call   590 <printf>
        close(fd1);
  9f:	89 34 24             	mov    %esi,(%esp)
  a2:	e8 a2 03 00 00       	call   449 <close>
        exit();
  a7:	e8 75 03 00 00       	call   421 <exit>
        printf(2, "mv: Cannot open %s\n", argv[1]);
  ac:	50                   	push   %eax
  ad:	ff 73 04             	pushl  0x4(%ebx)
  b0:	68 13 09 00 00       	push   $0x913
  b5:	6a 02                	push   $0x2
  b7:	e8 d4 04 00 00       	call   590 <printf>
        exit();
  bc:	e8 60 03 00 00       	call   421 <exit>
        if((fd2 = open(argv[2], O_CREATE)) < 0){
  c1:	50                   	push   %eax
  c2:	50                   	push   %eax
  c3:	68 00 02 00 00       	push   $0x200
  c8:	ff 73 08             	pushl  0x8(%ebx)
  cb:	e8 91 03 00 00       	call   461 <open>
  d0:	83 c4 10             	add    $0x10,%esp
  d3:	85 c0                	test   %eax,%eax
  d5:	0f 88 83 00 00 00    	js     15e <main+0x15e>
        close(fd2);
  db:	83 ec 0c             	sub    $0xc,%esp
  de:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
  e4:	50                   	push   %eax
  e5:	e8 5f 03 00 00       	call   449 <close>
        close(0);
  ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  f1:	e8 53 03 00 00       	call   449 <close>
        if((fd2 = open(argv[2], O_WRONLY) < 0)){
  f6:	58                   	pop    %eax
  f7:	5a                   	pop    %edx
  f8:	6a 01                	push   $0x1
  fa:	ff 73 08             	pushl  0x8(%ebx)
  fd:	e8 5f 03 00 00       	call   461 <open>
 102:	83 c4 10             	add    $0x10,%esp
 105:	85 c0                	test   %eax,%eax
 107:	79 2c                	jns    135 <main+0x135>
 109:	e9 80 00 00 00       	jmp    18e <main+0x18e>
            if(n == 0)
 10e:	0f 84 8f 00 00 00    	je     1a3 <main+0x1a3>
            if(write(fd2,buf,n) != n)
 114:	50                   	push   %eax
 115:	52                   	push   %edx
 116:	57                   	push   %edi
 117:	6a 00                	push   $0x0
 119:	89 95 c4 fd ff ff    	mov    %edx,-0x23c(%ebp)
 11f:	e8 1d 03 00 00       	call   441 <write>
 124:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	39 d0                	cmp    %edx,%eax
 12f:	0f 85 80 00 00 00    	jne    1b5 <main+0x1b5>
            if((n = read(fd1,buf,sizeof(buf))) < 0)
 135:	50                   	push   %eax
 136:	68 00 02 00 00       	push   $0x200
 13b:	57                   	push   %edi
 13c:	56                   	push   %esi
 13d:	e8 f7 02 00 00       	call   439 <read>
 142:	83 c4 10             	add    $0x10,%esp
 145:	89 c2                	mov    %eax,%edx
 147:	85 c0                	test   %eax,%eax
 149:	79 c3                	jns    10e <main+0x10e>
                printf(2,"mv: Error while copying contents1\n");
 14b:	50                   	push   %eax
 14c:	50                   	push   %eax
 14d:	68 4c 09 00 00       	push   $0x94c
 152:	6a 02                	push   $0x2
 154:	e8 37 04 00 00       	call   590 <printf>
                exit();
 159:	e8 c3 02 00 00       	call   421 <exit>
            close(fd2);
 15e:	83 ec 0c             	sub    $0xc,%esp
 161:	50                   	push   %eax
 162:	e8 e2 02 00 00       	call   449 <close>
            close(0);
 167:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16e:	e8 d6 02 00 00       	call   449 <close>
            if((fd2 = open(argv[2], O_WRONLY) < 0)){
 173:	59                   	pop    %ecx
 174:	5f                   	pop    %edi
 175:	6a 01                	push   $0x1
 177:	ff 73 08             	pushl  0x8(%ebx)
 17a:	e8 e2 02 00 00       	call   461 <open>
 17f:	83 c4 10             	add    $0x10,%esp
 182:	89 c2                	mov    %eax,%edx
 184:	31 c0                	xor    %eax,%eax
 186:	85 d2                	test   %edx,%edx
 188:	0f 89 4d ff ff ff    	jns    db <main+0xdb>
            printf(2, "mv: Cannot open %s\n", argv[2]);
 18e:	50                   	push   %eax
 18f:	ff 73 08             	pushl  0x8(%ebx)
 192:	68 13 09 00 00       	push   $0x913
 197:	6a 02                	push   $0x2
 199:	e8 f2 03 00 00       	call   590 <printf>
            exit();
 19e:	e8 7e 02 00 00       	call   421 <exit>
        close(fd2);
 1a3:	83 ec 0c             	sub    $0xc,%esp
 1a6:	6a 00                	push   $0x0
 1a8:	e8 9c 02 00 00       	call   449 <close>
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	e9 c3 fe ff ff       	jmp    78 <main+0x78>
                printf(2,"mv: Error while copying contents2\n");
 1b5:	51                   	push   %ecx
 1b6:	51                   	push   %ecx
 1b7:	68 70 09 00 00       	push   $0x970
 1bc:	6a 02                	push   $0x2
 1be:	e8 cd 03 00 00       	call   590 <printf>
                exit();
 1c3:	e8 59 02 00 00       	call   421 <exit>
 1c8:	66 90                	xchg   %ax,%ax
 1ca:	66 90                	xchg   %ax,%ax
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d1:	31 d2                	xor    %edx,%edx
{
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	53                   	push   %ebx
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1e0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1e4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 c9                	test   %cl,%cl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	5b                   	pop    %ebx
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 5d 08             	mov    0x8(%ebp),%ebx
 208:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 20b:	0f b6 13             	movzbl (%ebx),%edx
 20e:	0f b6 0e             	movzbl (%esi),%ecx
 211:	84 d2                	test   %dl,%dl
 213:	74 1e                	je     233 <strcmp+0x33>
 215:	b8 01 00 00 00       	mov    $0x1,%eax
 21a:	38 ca                	cmp    %cl,%dl
 21c:	74 09                	je     227 <strcmp+0x27>
 21e:	eb 20                	jmp    240 <strcmp+0x40>
 220:	83 c0 01             	add    $0x1,%eax
 223:	38 ca                	cmp    %cl,%dl
 225:	75 19                	jne    240 <strcmp+0x40>
 227:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 22b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 22f:	84 d2                	test   %dl,%dl
 231:	75 ed                	jne    220 <strcmp+0x20>
 233:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 235:	5b                   	pop    %ebx
 236:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 237:	29 c8                	sub    %ecx,%eax
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop
 240:	0f b6 c2             	movzbl %dl,%eax
 243:	5b                   	pop    %ebx
 244:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 245:	29 c8                	sub    %ecx,%eax
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 270:	31 c0                	xor    %eax,%eax
}
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    
 274:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2aa:	0f b6 18             	movzbl (%eax),%ebx
 2ad:	84 db                	test   %bl,%bl
 2af:	74 1d                	je     2ce <strchr+0x2e>
 2b1:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 2b3:	38 d3                	cmp    %dl,%bl
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e5:	31 f6                	xor    %esi,%esi
{
 2e7:	53                   	push   %ebx
 2e8:	89 f3                	mov    %esi,%ebx
 2ea:	83 ec 1c             	sub    $0x1c,%esp
 2ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2f0:	eb 2f                	jmp    321 <gets+0x41>
 2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2f8:	83 ec 04             	sub    $0x4,%esp
 2fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2fe:	6a 01                	push   $0x1
 300:	50                   	push   %eax
 301:	6a 00                	push   $0x0
 303:	e8 31 01 00 00       	call   439 <read>
    if(cc < 1)
 308:	83 c4 10             	add    $0x10,%esp
 30b:	85 c0                	test   %eax,%eax
 30d:	7e 1c                	jle    32b <gets+0x4b>
      break;
    buf[i++] = c;
 30f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 313:	83 c7 01             	add    $0x1,%edi
 316:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 319:	3c 0a                	cmp    $0xa,%al
 31b:	74 23                	je     340 <gets+0x60>
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 1f                	je     340 <gets+0x60>
  for(i=0; i+1 < max; ){
 321:	83 c3 01             	add    $0x1,%ebx
 324:	89 fe                	mov    %edi,%esi
 326:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 329:	7c cd                	jl     2f8 <gets+0x18>
 32b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 330:	c6 03 00             	movb   $0x0,(%ebx)
}
 333:	8d 65 f4             	lea    -0xc(%ebp),%esp
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop
 340:	8b 75 08             	mov    0x8(%ebp),%esi
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	01 de                	add    %ebx,%esi
 348:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 34a:	c6 03 00             	movb   $0x0,(%ebx)
}
 34d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5f                   	pop    %edi
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    
 355:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	pushl  0x8(%ebp)
 36d:	e8 ef 00 00 00       	call   461 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	pushl  0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f2 00 00 00       	call   479 <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 b8 00 00 00       	call   449 <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3c4:	77 1f                	ja     3e5 <atoi+0x35>
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 3d0:	83 c1 01             	add    $0x1,%ecx
 3d3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3da:	0f be 11             	movsbl (%ecx),%edx
 3dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	5b                   	pop    %ebx
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 10             	mov    0x10(%ebp),%edx
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	56                   	push   %esi
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 d2                	test   %edx,%edx
 400:	7e 13                	jle    415 <memmove+0x25>
 402:	01 c2                	add    %eax,%edx
  dst = vdst;
 404:	89 c7                	mov    %eax,%edi
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 411:	39 fa                	cmp    %edi,%edx
 413:	75 fb                	jne    410 <memmove+0x20>
  return vdst;
}
 415:	5e                   	pop    %esi
 416:	5f                   	pop    %edi
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 419:	b8 01 00 00 00       	mov    $0x1,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <exit>:
SYSCALL(exit)
 421:	b8 02 00 00 00       	mov    $0x2,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <wait>:
SYSCALL(wait)
 429:	b8 03 00 00 00       	mov    $0x3,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <pipe>:
SYSCALL(pipe)
 431:	b8 04 00 00 00       	mov    $0x4,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <read>:
SYSCALL(read)
 439:	b8 05 00 00 00       	mov    $0x5,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <write>:
SYSCALL(write)
 441:	b8 10 00 00 00       	mov    $0x10,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <close>:
SYSCALL(close)
 449:	b8 15 00 00 00       	mov    $0x15,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <kill>:
SYSCALL(kill)
 451:	b8 06 00 00 00       	mov    $0x6,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <exec>:
SYSCALL(exec)
 459:	b8 07 00 00 00       	mov    $0x7,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <open>:
SYSCALL(open)
 461:	b8 0f 00 00 00       	mov    $0xf,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <mknod>:
SYSCALL(mknod)
 469:	b8 11 00 00 00       	mov    $0x11,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <unlink>:
SYSCALL(unlink)
 471:	b8 12 00 00 00       	mov    $0x12,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <fstat>:
SYSCALL(fstat)
 479:	b8 08 00 00 00       	mov    $0x8,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <link>:
SYSCALL(link)
 481:	b8 13 00 00 00       	mov    $0x13,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <mkdir>:
SYSCALL(mkdir)
 489:	b8 14 00 00 00       	mov    $0x14,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <chdir>:
SYSCALL(chdir)
 491:	b8 09 00 00 00       	mov    $0x9,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <dup>:
SYSCALL(dup)
 499:	b8 0a 00 00 00       	mov    $0xa,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <getpid>:
SYSCALL(getpid)
 4a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <sbrk>:
SYSCALL(sbrk)
 4a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <sleep>:
SYSCALL(sleep)
 4b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <uptime>:
SYSCALL(uptime)
 4b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    
 4c1:	66 90                	xchg   %ax,%ax
 4c3:	66 90                	xchg   %ax,%ax
 4c5:	66 90                	xchg   %ax,%ax
 4c7:	66 90                	xchg   %ax,%ax
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4d6:	89 d3                	mov    %edx,%ebx
{
 4d8:	83 ec 3c             	sub    $0x3c,%esp
 4db:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 4de:	85 d2                	test   %edx,%edx
 4e0:	0f 89 92 00 00 00    	jns    578 <printint+0xa8>
 4e6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ea:	0f 84 88 00 00 00    	je     578 <printint+0xa8>
    neg = 1;
 4f0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 4f7:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 4f9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 500:	8d 75 d7             	lea    -0x29(%ebp),%esi
 503:	eb 08                	jmp    50d <printint+0x3d>
 505:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 508:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 50b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 50d:	89 d8                	mov    %ebx,%eax
 50f:	31 d2                	xor    %edx,%edx
 511:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 514:	f7 f1                	div    %ecx
 516:	83 c7 01             	add    $0x1,%edi
 519:	0f b6 92 9c 09 00 00 	movzbl 0x99c(%edx),%edx
 520:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 523:	39 d9                	cmp    %ebx,%ecx
 525:	76 e1                	jbe    508 <printint+0x38>
  if(neg)
 527:	8b 45 c0             	mov    -0x40(%ebp),%eax
 52a:	85 c0                	test   %eax,%eax
 52c:	74 0d                	je     53b <printint+0x6b>
    buf[i++] = '-';
 52e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 533:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 538:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 53b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 53e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 541:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 545:	eb 0f                	jmp    556 <printint+0x86>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax
 550:	0f b6 13             	movzbl (%ebx),%edx
 553:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 556:	83 ec 04             	sub    $0x4,%esp
 559:	88 55 d7             	mov    %dl,-0x29(%ebp)
 55c:	6a 01                	push   $0x1
 55e:	56                   	push   %esi
 55f:	57                   	push   %edi
 560:	e8 dc fe ff ff       	call   441 <write>

  while(--i >= 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 de                	cmp    %ebx,%esi
 56a:	75 e4                	jne    550 <printint+0x80>
    putc(fd, buf[i]);
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56f:	5b                   	pop    %ebx
 570:	5e                   	pop    %esi
 571:	5f                   	pop    %edi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 57f:	e9 75 ff ff ff       	jmp    4f9 <printint+0x29>
 584:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 75 0c             	mov    0xc(%ebp),%esi
 59c:	0f b6 1e             	movzbl (%esi),%ebx
 59f:	84 db                	test   %bl,%bl
 5a1:	0f 84 b9 00 00 00    	je     660 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 5a7:	8d 45 10             	lea    0x10(%ebp),%eax
 5aa:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5ad:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5b0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b5:	eb 38                	jmp    5ef <printf+0x5f>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
 5c0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5c3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	74 17                	je     5e4 <printf+0x54>
  write(fd, &c, 1);
 5cd:	83 ec 04             	sub    $0x4,%esp
 5d0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5d3:	6a 01                	push   $0x1
 5d5:	57                   	push   %edi
 5d6:	ff 75 08             	pushl  0x8(%ebp)
 5d9:	e8 63 fe ff ff       	call   441 <write>
 5de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5e1:	83 c4 10             	add    $0x10,%esp
 5e4:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5e7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5eb:	84 db                	test   %bl,%bl
 5ed:	74 71                	je     660 <printf+0xd0>
    c = fmt[i] & 0xff;
 5ef:	0f be cb             	movsbl %bl,%ecx
 5f2:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5f5:	85 d2                	test   %edx,%edx
 5f7:	74 c7                	je     5c0 <printf+0x30>
      }
    } else if(state == '%'){
 5f9:	83 fa 25             	cmp    $0x25,%edx
 5fc:	75 e6                	jne    5e4 <printf+0x54>
      if(c == 'd'){
 5fe:	83 f8 64             	cmp    $0x64,%eax
 601:	0f 84 99 00 00 00    	je     6a0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 607:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 60d:	83 f9 70             	cmp    $0x70,%ecx
 610:	74 5e                	je     670 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 612:	83 f8 73             	cmp    $0x73,%eax
 615:	0f 84 d5 00 00 00    	je     6f0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61b:	83 f8 63             	cmp    $0x63,%eax
 61e:	0f 84 8c 00 00 00    	je     6b0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 624:	83 f8 25             	cmp    $0x25,%eax
 627:	0f 84 b3 00 00 00    	je     6e0 <printf+0x150>
  write(fd, &c, 1);
 62d:	83 ec 04             	sub    $0x4,%esp
 630:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 634:	6a 01                	push   $0x1
 636:	57                   	push   %edi
 637:	ff 75 08             	pushl  0x8(%ebp)
 63a:	e8 02 fe ff ff       	call   441 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 63f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 642:	83 c4 0c             	add    $0xc,%esp
 645:	6a 01                	push   $0x1
 647:	83 c6 01             	add    $0x1,%esi
 64a:	57                   	push   %edi
 64b:	ff 75 08             	pushl  0x8(%ebp)
 64e:	e8 ee fd ff ff       	call   441 <write>
  for(i = 0; fmt[i]; i++){
 653:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 657:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 65a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 65c:	84 db                	test   %bl,%bl
 65e:	75 8f                	jne    5ef <printf+0x5f>
    }
  }
}
 660:	8d 65 f4             	lea    -0xc(%ebp),%esp
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
        printint(fd, *ap, 16, 0);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 10 00 00 00       	mov    $0x10,%ecx
 678:	6a 00                	push   $0x0
 67a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	8b 13                	mov    (%ebx),%edx
 682:	e8 49 fe ff ff       	call   4d0 <printint>
        ap++;
 687:	89 d8                	mov    %ebx,%eax
 689:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68c:	31 d2                	xor    %edx,%edx
        ap++;
 68e:	83 c0 04             	add    $0x4,%eax
 691:	89 45 d0             	mov    %eax,-0x30(%ebp)
 694:	e9 4b ff ff ff       	jmp    5e4 <printf+0x54>
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a8:	6a 01                	push   $0x1
 6aa:	eb ce                	jmp    67a <printf+0xea>
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6b0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6b6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
        ap++;
 6ba:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6bd:	57                   	push   %edi
 6be:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6c1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c4:	e8 78 fd ff ff       	call   441 <write>
        ap++;
 6c9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cf:	31 d2                	xor    %edx,%edx
 6d1:	e9 0e ff ff ff       	jmp    5e4 <printf+0x54>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6e3:	83 ec 04             	sub    $0x4,%esp
 6e6:	e9 5a ff ff ff       	jmp    645 <printf+0xb5>
 6eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
        s = (char*)*ap;
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6f5:	83 c0 04             	add    $0x4,%eax
 6f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6fb:	85 db                	test   %ebx,%ebx
 6fd:	74 17                	je     716 <printf+0x186>
        while(*s != 0){
 6ff:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 702:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 704:	84 c0                	test   %al,%al
 706:	0f 84 d8 fe ff ff    	je     5e4 <printf+0x54>
 70c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 70f:	89 de                	mov    %ebx,%esi
 711:	8b 5d 08             	mov    0x8(%ebp),%ebx
 714:	eb 1a                	jmp    730 <printf+0x1a0>
          s = "(null)";
 716:	bb 94 09 00 00       	mov    $0x994,%ebx
        while(*s != 0){
 71b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 71e:	b8 28 00 00 00       	mov    $0x28,%eax
 723:	89 de                	mov    %ebx,%esi
 725:	8b 5d 08             	mov    0x8(%ebp),%ebx
 728:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
          s++;
 733:	83 c6 01             	add    $0x1,%esi
 736:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 739:	6a 01                	push   $0x1
 73b:	57                   	push   %edi
 73c:	53                   	push   %ebx
 73d:	e8 ff fc ff ff       	call   441 <write>
        while(*s != 0){
 742:	0f b6 06             	movzbl (%esi),%eax
 745:	83 c4 10             	add    $0x10,%esp
 748:	84 c0                	test   %al,%al
 74a:	75 e4                	jne    730 <printf+0x1a0>
 74c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 74f:	31 d2                	xor    %edx,%edx
 751:	e9 8e fe ff ff       	jmp    5e4 <printf+0x54>
 756:	66 90                	xchg   %ax,%ax
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 50 0c 00 00       	mov    0xc50,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 76e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 770:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 773:	39 c8                	cmp    %ecx,%eax
 775:	73 19                	jae    790 <free+0x30>
 777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77e:	66 90                	xchg   %ax,%ax
 780:	39 d1                	cmp    %edx,%ecx
 782:	72 14                	jb     798 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 d0                	cmp    %edx,%eax
 786:	73 10                	jae    798 <free+0x38>
{
 788:	89 d0                	mov    %edx,%eax
 78a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78c:	39 c8                	cmp    %ecx,%eax
 78e:	72 f0                	jb     780 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 f4                	jb     788 <free+0x28>
 794:	39 d1                	cmp    %edx,%ecx
 796:	73 f0                	jae    788 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 fa                	cmp    %edi,%edx
 7a0:	74 1e                	je     7c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a5:	8b 50 04             	mov    0x4(%eax),%edx
 7a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ab:	39 f1                	cmp    %esi,%ecx
 7ad:	74 28                	je     7d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7af:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7b1:	5b                   	pop    %ebx
  freep = p;
 7b2:	a3 50 0c 00 00       	mov    %eax,0xc50
}
 7b7:	5e                   	pop    %esi
 7b8:	5f                   	pop    %edi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    
 7bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 d8                	jne    7af <free+0x4f>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7da:	a3 50 0c 00 00       	mov    %eax,0xc50
    p->s.size += bp->s.size;
 7df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e5:	89 10                	mov    %edx,(%eax)
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d 50 0c 00 00    	mov    0xc50,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 ad 00 00 00    	je     8c0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	73 72                	jae    88e <malloc+0x9e>
 81c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 822:	bb 00 10 00 00       	mov    $0x1000,%ebx
 827:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 82a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 831:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 834:	eb 1b                	jmp    851 <malloc+0x61>
 836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 842:	8b 48 04             	mov    0x4(%eax),%ecx
 845:	39 f1                	cmp    %esi,%ecx
 847:	73 4f                	jae    898 <malloc+0xa8>
 849:	8b 3d 50 0c 00 00    	mov    0xc50,%edi
 84f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	39 d7                	cmp    %edx,%edi
 853:	75 eb                	jne    840 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 855:	83 ec 0c             	sub    $0xc,%esp
 858:	ff 75 e4             	pushl  -0x1c(%ebp)
 85b:	e8 49 fc ff ff       	call   4a9 <sbrk>
  if(p == (char*)-1)
 860:	83 c4 10             	add    $0x10,%esp
 863:	83 f8 ff             	cmp    $0xffffffff,%eax
 866:	74 1c                	je     884 <malloc+0x94>
  hp->s.size = nu;
 868:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86b:	83 ec 0c             	sub    $0xc,%esp
 86e:	83 c0 08             	add    $0x8,%eax
 871:	50                   	push   %eax
 872:	e8 e9 fe ff ff       	call   760 <free>
  return freep;
 877:	8b 15 50 0c 00 00    	mov    0xc50,%edx
      if((p = morecore(nunits)) == 0)
 87d:	83 c4 10             	add    $0x10,%esp
 880:	85 d2                	test   %edx,%edx
 882:	75 bc                	jne    840 <malloc+0x50>
        return 0;
  }
}
 884:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 887:	31 c0                	xor    %eax,%eax
}
 889:	5b                   	pop    %ebx
 88a:	5e                   	pop    %esi
 88b:	5f                   	pop    %edi
 88c:	5d                   	pop    %ebp
 88d:	c3                   	ret    
    if(p->s.size >= nunits){
 88e:	89 d0                	mov    %edx,%eax
 890:	89 fa                	mov    %edi,%edx
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 898:	39 ce                	cmp    %ecx,%esi
 89a:	74 54                	je     8f0 <malloc+0x100>
        p->s.size -= nunits;
 89c:	29 f1                	sub    %esi,%ecx
 89e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8a4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8a7:	89 15 50 0c 00 00    	mov    %edx,0xc50
}
 8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8b0:	83 c0 08             	add    $0x8,%eax
}
 8b3:	5b                   	pop    %ebx
 8b4:	5e                   	pop    %esi
 8b5:	5f                   	pop    %edi
 8b6:	5d                   	pop    %ebp
 8b7:	c3                   	ret    
 8b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 8c0:	c7 05 50 0c 00 00 54 	movl   $0xc54,0xc50
 8c7:	0c 00 00 
    base.s.size = 0;
 8ca:	bf 54 0c 00 00       	mov    $0xc54,%edi
    base.s.ptr = freep = prevp = &base;
 8cf:	c7 05 54 0c 00 00 54 	movl   $0xc54,0xc54
 8d6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8db:	c7 05 58 0c 00 00 00 	movl   $0x0,0xc58
 8e2:	00 00 00 
    if(p->s.size >= nunits){
 8e5:	e9 32 ff ff ff       	jmp    81c <malloc+0x2c>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8f0:	8b 08                	mov    (%eax),%ecx
 8f2:	89 0a                	mov    %ecx,(%edx)
 8f4:	eb b1                	jmp    8a7 <malloc+0xb7>
