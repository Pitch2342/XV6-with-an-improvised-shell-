
_cp:     file format elf32-i386


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
  11:	81 ec 28 02 00 00    	sub    $0x228,%esp
    if (argc != 3)
  17:	83 39 03             	cmpl   $0x3,(%ecx)
{
  1a:	8b 59 04             	mov    0x4(%ecx),%ebx
    if (argc != 3)
  1d:	74 13                	je     32 <main+0x32>
    {
        printf(2, "cp: too many or less args\n");
  1f:	50                   	push   %eax
  20:	50                   	push   %eax
  21:	68 d8 08 00 00       	push   $0x8d8
  26:	6a 02                	push   $0x2
  28:	e8 43 05 00 00       	call   570 <printf>
        exit();
  2d:	e8 cf 03 00 00       	call   401 <exit>
    }
    char buf[512];
    int fd1,fd2,n;
    struct stat st;

    if((fd1 = open(argv[1], O_RDONLY)) < 0){
  32:	50                   	push   %eax
  33:	50                   	push   %eax
  34:	6a 00                	push   $0x0
  36:	ff 73 04             	pushl  0x4(%ebx)
  39:	e8 03 04 00 00       	call   441 <open>
  3e:	83 c4 10             	add    $0x10,%esp
  41:	89 c6                	mov    %eax,%esi
  43:	85 c0                	test   %eax,%eax
  45:	78 5c                	js     a3 <main+0xa3>
        printf(2, "cp: Cannot open %s\n", argv[1]);
        exit();
    }

    if(fstat(fd1, &st) < 0){
  47:	50                   	push   %eax
  48:	50                   	push   %eax
  49:	8d 85 d4 fd ff ff    	lea    -0x22c(%ebp),%eax
  4f:	50                   	push   %eax
  50:	56                   	push   %esi
  51:	e8 03 04 00 00       	call   459 <fstat>
  56:	83 c4 10             	add    $0x10,%esp
  59:	85 c0                	test   %eax,%eax
  5b:	78 29                	js     86 <main+0x86>
        printf(2, "cp: Cannot stat %s\n", argv[1]);
        close(fd1);
        exit();
    }
    if (st.type == T_FILE)
  5d:	66 83 bd d4 fd ff ff 	cmpw   $0x2,-0x22c(%ebp)
  64:	02 
  65:	74 51                	je     b8 <main+0xb8>
        }
        close(fd2);
    }
    else
    {
        printf(2, "cp: invalid args");
  67:	50                   	push   %eax
  68:	50                   	push   %eax
  69:	68 1b 09 00 00       	push   $0x91b
  6e:	6a 02                	push   $0x2
  70:	e8 fb 04 00 00       	call   570 <printf>
  75:	83 c4 10             	add    $0x10,%esp
    }
    close(fd1);
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	56                   	push   %esi
  7c:	e8 a8 03 00 00       	call   429 <close>
    exit();
  81:	e8 7b 03 00 00       	call   401 <exit>
        printf(2, "cp: Cannot stat %s\n", argv[1]);
  86:	50                   	push   %eax
  87:	ff 73 04             	pushl  0x4(%ebx)
  8a:	68 07 09 00 00       	push   $0x907
  8f:	6a 02                	push   $0x2
  91:	e8 da 04 00 00       	call   570 <printf>
        close(fd1);
  96:	89 34 24             	mov    %esi,(%esp)
  99:	e8 8b 03 00 00       	call   429 <close>
        exit();
  9e:	e8 5e 03 00 00       	call   401 <exit>
        printf(2, "cp: Cannot open %s\n", argv[1]);
  a3:	50                   	push   %eax
  a4:	ff 73 04             	pushl  0x4(%ebx)
  a7:	68 f3 08 00 00       	push   $0x8f3
  ac:	6a 02                	push   $0x2
  ae:	e8 bd 04 00 00       	call   570 <printf>
        exit();
  b3:	e8 49 03 00 00       	call   401 <exit>
        if((fd2 = open(argv[2], O_CREATE)) < 0){
  b8:	50                   	push   %eax
  b9:	50                   	push   %eax
  ba:	68 00 02 00 00       	push   $0x200
  bf:	ff 73 08             	pushl  0x8(%ebx)
  c2:	e8 7a 03 00 00       	call   441 <open>
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	85 c0                	test   %eax,%eax
  cc:	78 74                	js     142 <main+0x142>
        close(fd2);
  ce:	83 ec 0c             	sub    $0xc,%esp
  d1:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
  d7:	50                   	push   %eax
  d8:	e8 4c 03 00 00       	call   429 <close>
        close(0);
  dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  e4:	e8 40 03 00 00       	call   429 <close>
        if((fd2 = open(argv[2], O_WRONLY) < 0)){
  e9:	58                   	pop    %eax
  ea:	5a                   	pop    %edx
  eb:	6a 01                	push   $0x1
  ed:	ff 73 08             	pushl  0x8(%ebx)
  f0:	e8 4c 03 00 00       	call   441 <open>
  f5:	83 c4 10             	add    $0x10,%esp
  f8:	85 c0                	test   %eax,%eax
  fa:	79 1d                	jns    119 <main+0x119>
  fc:	eb 74                	jmp    172 <main+0x172>
            if(n == 0)
  fe:	0f 84 83 00 00 00    	je     187 <main+0x187>
            if(write(fd2,buf,n) != n)
 104:	51                   	push   %ecx
 105:	50                   	push   %eax
 106:	57                   	push   %edi
 107:	6a 00                	push   $0x0
 109:	e8 13 03 00 00       	call   421 <write>
 10e:	83 c4 10             	add    $0x10,%esp
 111:	39 d8                	cmp    %ebx,%eax
 113:	0f 85 80 00 00 00    	jne    199 <main+0x199>
            if((n = read(fd1,buf,sizeof(buf))) < 0)
 119:	50                   	push   %eax
 11a:	68 00 02 00 00       	push   $0x200
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	e8 f3 02 00 00       	call   419 <read>
 126:	83 c4 10             	add    $0x10,%esp
 129:	89 c3                	mov    %eax,%ebx
 12b:	85 c0                	test   %eax,%eax
 12d:	79 cf                	jns    fe <main+0xfe>
                printf(2,"cp: Error while copying contents1\n");
 12f:	53                   	push   %ebx
 130:	53                   	push   %ebx
 131:	68 2c 09 00 00       	push   $0x92c
 136:	6a 02                	push   $0x2
 138:	e8 33 04 00 00       	call   570 <printf>
                exit();
 13d:	e8 bf 02 00 00       	call   401 <exit>
            close(fd2);
 142:	83 ec 0c             	sub    $0xc,%esp
 145:	50                   	push   %eax
 146:	e8 de 02 00 00       	call   429 <close>
            close(0);
 14b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 152:	e8 d2 02 00 00       	call   429 <close>
            if((fd2 = open(argv[2], O_WRONLY) < 0)){
 157:	59                   	pop    %ecx
 158:	5f                   	pop    %edi
 159:	6a 01                	push   $0x1
 15b:	ff 73 08             	pushl  0x8(%ebx)
 15e:	e8 de 02 00 00       	call   441 <open>
 163:	83 c4 10             	add    $0x10,%esp
 166:	89 c2                	mov    %eax,%edx
 168:	31 c0                	xor    %eax,%eax
 16a:	85 d2                	test   %edx,%edx
 16c:	0f 89 5c ff ff ff    	jns    ce <main+0xce>
            printf(2, "cp: Cannot open %s\n", argv[2]);
 172:	50                   	push   %eax
 173:	ff 73 08             	pushl  0x8(%ebx)
 176:	68 f3 08 00 00       	push   $0x8f3
 17b:	6a 02                	push   $0x2
 17d:	e8 ee 03 00 00       	call   570 <printf>
            exit();
 182:	e8 7a 02 00 00       	call   401 <exit>
        close(fd2);
 187:	83 ec 0c             	sub    $0xc,%esp
 18a:	6a 00                	push   $0x0
 18c:	e8 98 02 00 00       	call   429 <close>
 191:	83 c4 10             	add    $0x10,%esp
 194:	e9 df fe ff ff       	jmp    78 <main+0x78>
                printf(2,"cp: Error while copying contents2\n");
 199:	52                   	push   %edx
 19a:	52                   	push   %edx
 19b:	68 50 09 00 00       	push   $0x950
 1a0:	6a 02                	push   $0x2
 1a2:	e8 c9 03 00 00       	call   570 <printf>
                exit();
 1a7:	e8 55 02 00 00       	call   401 <exit>
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b1:	31 d2                	xor    %edx,%edx
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	53                   	push   %ebx
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1c0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	84 c9                	test   %cl,%cl
 1cc:	75 f2                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1ce:	5b                   	pop    %ebx
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1e8:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 1eb:	0f b6 13             	movzbl (%ebx),%edx
 1ee:	0f b6 0e             	movzbl (%esi),%ecx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	74 1e                	je     213 <strcmp+0x33>
 1f5:	b8 01 00 00 00       	mov    $0x1,%eax
 1fa:	38 ca                	cmp    %cl,%dl
 1fc:	74 09                	je     207 <strcmp+0x27>
 1fe:	eb 20                	jmp    220 <strcmp+0x40>
 200:	83 c0 01             	add    $0x1,%eax
 203:	38 ca                	cmp    %cl,%dl
 205:	75 19                	jne    220 <strcmp+0x40>
 207:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 20b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 20f:	84 d2                	test   %dl,%dl
 211:	75 ed                	jne    200 <strcmp+0x20>
 213:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 215:	5b                   	pop    %ebx
 216:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 217:	29 c8                	sub    %ecx,%eax
}
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop
 220:	0f b6 c2             	movzbl %dl,%eax
 223:	5b                   	pop    %ebx
 224:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 225:	29 c8                	sub    %ecx,%eax
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 39 00             	cmpb   $0x0,(%ecx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 d2                	xor    %edx,%edx
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c2 01             	add    $0x1,%edx
 243:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 247:	89 d0                	mov    %edx,%eax
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	89 d0                	mov    %edx,%eax
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 28a:	0f b6 18             	movzbl (%eax),%ebx
 28d:	84 db                	test   %bl,%bl
 28f:	74 1d                	je     2ae <strchr+0x2e>
 291:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 293:	38 d3                	cmp    %dl,%bl
 295:	75 0d                	jne    2a4 <strchr+0x24>
 297:	eb 17                	jmp    2b0 <strchr+0x30>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	38 ca                	cmp    %cl,%dl
 2a2:	74 0c                	je     2b0 <strchr+0x30>
  for(; *s; s++)
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	0f b6 10             	movzbl (%eax),%edx
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ae:	31 c0                	xor    %eax,%eax
}
 2b0:	5b                   	pop    %ebx
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c5:	31 f6                	xor    %esi,%esi
{
 2c7:	53                   	push   %ebx
 2c8:	89 f3                	mov    %esi,%ebx
 2ca:	83 ec 1c             	sub    $0x1c,%esp
 2cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2d0:	eb 2f                	jmp    301 <gets+0x41>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d8:	83 ec 04             	sub    $0x4,%esp
 2db:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2de:	6a 01                	push   $0x1
 2e0:	50                   	push   %eax
 2e1:	6a 00                	push   $0x0
 2e3:	e8 31 01 00 00       	call   419 <read>
    if(cc < 1)
 2e8:	83 c4 10             	add    $0x10,%esp
 2eb:	85 c0                	test   %eax,%eax
 2ed:	7e 1c                	jle    30b <gets+0x4b>
      break;
    buf[i++] = c;
 2ef:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f3:	83 c7 01             	add    $0x1,%edi
 2f6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f9:	3c 0a                	cmp    $0xa,%al
 2fb:	74 23                	je     320 <gets+0x60>
 2fd:	3c 0d                	cmp    $0xd,%al
 2ff:	74 1f                	je     320 <gets+0x60>
  for(i=0; i+1 < max; ){
 301:	83 c3 01             	add    $0x1,%ebx
 304:	89 fe                	mov    %edi,%esi
 306:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 309:	7c cd                	jl     2d8 <gets+0x18>
 30b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 310:	c6 03 00             	movb   $0x0,(%ebx)
}
 313:	8d 65 f4             	lea    -0xc(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop
 320:	8b 75 08             	mov    0x8(%ebp),%esi
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	01 de                	add    %ebx,%esi
 328:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 32a:	c6 03 00             	movb   $0x0,(%ebx)
}
 32d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 330:	5b                   	pop    %ebx
 331:	5e                   	pop    %esi
 332:	5f                   	pop    %edi
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    
 335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	e8 ef 00 00 00       	call   441 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 27                	js     380 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	ff 75 0c             	pushl  0xc(%ebp)
 35f:	89 c3                	mov    %eax,%ebx
 361:	50                   	push   %eax
 362:	e8 f2 00 00 00       	call   459 <fstat>
  close(fd);
 367:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 36a:	89 c6                	mov    %eax,%esi
  close(fd);
 36c:	e8 b8 00 00 00       	call   429 <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
}
 374:	8d 65 f8             	lea    -0x8(%ebp),%esp
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 380:	be ff ff ff ff       	mov    $0xffffffff,%esi
 385:	eb ed                	jmp    374 <stat+0x34>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 11             	movsbl (%ecx),%edx
 39a:	8d 42 d0             	lea    -0x30(%edx),%eax
 39d:	3c 09                	cmp    $0x9,%al
  n = 0;
 39f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3a4:	77 1f                	ja     3c5 <atoi+0x35>
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 3b0:	83 c1 01             	add    $0x1,%ecx
 3b3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3ba:	0f be 11             	movsbl (%ecx),%edx
 3bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	5b                   	pop    %ebx
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	8b 55 10             	mov    0x10(%ebp),%edx
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	56                   	push   %esi
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 d2                	test   %edx,%edx
 3e0:	7e 13                	jle    3f5 <memmove+0x25>
 3e2:	01 c2                	add    %eax,%edx
  dst = vdst;
 3e4:	89 c7                	mov    %eax,%edi
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3f1:	39 fa                	cmp    %edi,%edx
 3f3:	75 fb                	jne    3f0 <memmove+0x20>
  return vdst;
}
 3f5:	5e                   	pop    %esi
 3f6:	5f                   	pop    %edi
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    

000003f9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f9:	b8 01 00 00 00       	mov    $0x1,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <exit>:
SYSCALL(exit)
 401:	b8 02 00 00 00       	mov    $0x2,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <wait>:
SYSCALL(wait)
 409:	b8 03 00 00 00       	mov    $0x3,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <pipe>:
SYSCALL(pipe)
 411:	b8 04 00 00 00       	mov    $0x4,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <read>:
SYSCALL(read)
 419:	b8 05 00 00 00       	mov    $0x5,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <write>:
SYSCALL(write)
 421:	b8 10 00 00 00       	mov    $0x10,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <close>:
SYSCALL(close)
 429:	b8 15 00 00 00       	mov    $0x15,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <kill>:
SYSCALL(kill)
 431:	b8 06 00 00 00       	mov    $0x6,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <exec>:
SYSCALL(exec)
 439:	b8 07 00 00 00       	mov    $0x7,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <open>:
SYSCALL(open)
 441:	b8 0f 00 00 00       	mov    $0xf,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <mknod>:
SYSCALL(mknod)
 449:	b8 11 00 00 00       	mov    $0x11,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <unlink>:
SYSCALL(unlink)
 451:	b8 12 00 00 00       	mov    $0x12,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <fstat>:
SYSCALL(fstat)
 459:	b8 08 00 00 00       	mov    $0x8,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <link>:
SYSCALL(link)
 461:	b8 13 00 00 00       	mov    $0x13,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <mkdir>:
SYSCALL(mkdir)
 469:	b8 14 00 00 00       	mov    $0x14,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <chdir>:
SYSCALL(chdir)
 471:	b8 09 00 00 00       	mov    $0x9,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <dup>:
SYSCALL(dup)
 479:	b8 0a 00 00 00       	mov    $0xa,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <getpid>:
SYSCALL(getpid)
 481:	b8 0b 00 00 00       	mov    $0xb,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <sbrk>:
SYSCALL(sbrk)
 489:	b8 0c 00 00 00       	mov    $0xc,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <sleep>:
SYSCALL(sleep)
 491:	b8 0d 00 00 00       	mov    $0xd,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <uptime>:
SYSCALL(uptime)
 499:	b8 0e 00 00 00       	mov    $0xe,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    
 4a1:	66 90                	xchg   %ax,%ax
 4a3:	66 90                	xchg   %ax,%ax
 4a5:	66 90                	xchg   %ax,%ax
 4a7:	66 90                	xchg   %ax,%ax
 4a9:	66 90                	xchg   %ax,%ax
 4ab:	66 90                	xchg   %ax,%ax
 4ad:	66 90                	xchg   %ax,%ax
 4af:	90                   	nop

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4b6:	89 d3                	mov    %edx,%ebx
{
 4b8:	83 ec 3c             	sub    $0x3c,%esp
 4bb:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 4be:	85 d2                	test   %edx,%edx
 4c0:	0f 89 92 00 00 00    	jns    558 <printint+0xa8>
 4c6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ca:	0f 84 88 00 00 00    	je     558 <printint+0xa8>
    neg = 1;
 4d0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 4d7:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 4d9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4e3:	eb 08                	jmp    4ed <printint+0x3d>
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4e8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 4eb:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 4ed:	89 d8                	mov    %ebx,%eax
 4ef:	31 d2                	xor    %edx,%edx
 4f1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 4f4:	f7 f1                	div    %ecx
 4f6:	83 c7 01             	add    $0x1,%edi
 4f9:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 500:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 503:	39 d9                	cmp    %ebx,%ecx
 505:	76 e1                	jbe    4e8 <printint+0x38>
  if(neg)
 507:	8b 45 c0             	mov    -0x40(%ebp),%eax
 50a:	85 c0                	test   %eax,%eax
 50c:	74 0d                	je     51b <printint+0x6b>
    buf[i++] = '-';
 50e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 513:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 518:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 51b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 51e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 521:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 525:	eb 0f                	jmp    536 <printint+0x86>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
 530:	0f b6 13             	movzbl (%ebx),%edx
 533:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 536:	83 ec 04             	sub    $0x4,%esp
 539:	88 55 d7             	mov    %dl,-0x29(%ebp)
 53c:	6a 01                	push   $0x1
 53e:	56                   	push   %esi
 53f:	57                   	push   %edi
 540:	e8 dc fe ff ff       	call   421 <write>

  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x80>
    putc(fd, buf[i]);
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 55f:	e9 75 ff ff ff       	jmp    4d9 <printint+0x29>
 564:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
 57c:	0f b6 1e             	movzbl (%esi),%ebx
 57f:	84 db                	test   %bl,%bl
 581:	0f 84 b9 00 00 00    	je     640 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 587:	8d 45 10             	lea    0x10(%ebp),%eax
 58a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 58d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 590:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 592:	89 45 d0             	mov    %eax,-0x30(%ebp)
 595:	eb 38                	jmp    5cf <printf+0x5f>
 597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59e:	66 90                	xchg   %ax,%ax
 5a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	74 17                	je     5c4 <printf+0x54>
  write(fd, &c, 1);
 5ad:	83 ec 04             	sub    $0x4,%esp
 5b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	ff 75 08             	pushl  0x8(%ebp)
 5b9:	e8 63 fe ff ff       	call   421 <write>
 5be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5c1:	83 c4 10             	add    $0x10,%esp
 5c4:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5c7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5cb:	84 db                	test   %bl,%bl
 5cd:	74 71                	je     640 <printf+0xd0>
    c = fmt[i] & 0xff;
 5cf:	0f be cb             	movsbl %bl,%ecx
 5d2:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5d5:	85 d2                	test   %edx,%edx
 5d7:	74 c7                	je     5a0 <printf+0x30>
      }
    } else if(state == '%'){
 5d9:	83 fa 25             	cmp    $0x25,%edx
 5dc:	75 e6                	jne    5c4 <printf+0x54>
      if(c == 'd'){
 5de:	83 f8 64             	cmp    $0x64,%eax
 5e1:	0f 84 99 00 00 00    	je     680 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ed:	83 f9 70             	cmp    $0x70,%ecx
 5f0:	74 5e                	je     650 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5f2:	83 f8 73             	cmp    $0x73,%eax
 5f5:	0f 84 d5 00 00 00    	je     6d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5fb:	83 f8 63             	cmp    $0x63,%eax
 5fe:	0f 84 8c 00 00 00    	je     690 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 604:	83 f8 25             	cmp    $0x25,%eax
 607:	0f 84 b3 00 00 00    	je     6c0 <printf+0x150>
  write(fd, &c, 1);
 60d:	83 ec 04             	sub    $0x4,%esp
 610:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 614:	6a 01                	push   $0x1
 616:	57                   	push   %edi
 617:	ff 75 08             	pushl  0x8(%ebp)
 61a:	e8 02 fe ff ff       	call   421 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 61f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 622:	83 c4 0c             	add    $0xc,%esp
 625:	6a 01                	push   $0x1
 627:	83 c6 01             	add    $0x1,%esi
 62a:	57                   	push   %edi
 62b:	ff 75 08             	pushl  0x8(%ebp)
 62e:	e8 ee fd ff ff       	call   421 <write>
  for(i = 0; fmt[i]; i++){
 633:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 637:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 63a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 63c:	84 db                	test   %bl,%bl
 63e:	75 8f                	jne    5cf <printf+0x5f>
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
        printint(fd, *ap, 16, 0);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 10 00 00 00       	mov    $0x10,%ecx
 658:	6a 00                	push   $0x0
 65a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	8b 13                	mov    (%ebx),%edx
 662:	e8 49 fe ff ff       	call   4b0 <printint>
        ap++;
 667:	89 d8                	mov    %ebx,%eax
 669:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66c:	31 d2                	xor    %edx,%edx
        ap++;
 66e:	83 c0 04             	add    $0x4,%eax
 671:	89 45 d0             	mov    %eax,-0x30(%ebp)
 674:	e9 4b ff ff ff       	jmp    5c4 <printf+0x54>
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	eb ce                	jmp    65a <printf+0xea>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 690:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
        ap++;
 69a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 69d:	57                   	push   %edi
 69e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a4:	e8 78 fd ff ff       	call   421 <write>
        ap++;
 6a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 0e ff ff ff       	jmp    5c4 <printf+0x54>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 6c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
 6c6:	e9 5a ff ff ff       	jmp    625 <printf+0xb5>
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
        s = (char*)*ap;
 6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6d5:	83 c0 04             	add    $0x4,%eax
 6d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6db:	85 db                	test   %ebx,%ebx
 6dd:	74 17                	je     6f6 <printf+0x186>
        while(*s != 0){
 6df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6e4:	84 c0                	test   %al,%al
 6e6:	0f 84 d8 fe ff ff    	je     5c4 <printf+0x54>
 6ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ef:	89 de                	mov    %ebx,%esi
 6f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6f4:	eb 1a                	jmp    710 <printf+0x1a0>
          s = "(null)";
 6f6:	bb 74 09 00 00       	mov    $0x974,%ebx
        while(*s != 0){
 6fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6fe:	b8 28 00 00 00       	mov    $0x28,%eax
 703:	89 de                	mov    %ebx,%esi
 705:	8b 5d 08             	mov    0x8(%ebp),%ebx
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c6 01             	add    $0x1,%esi
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	53                   	push   %ebx
 71d:	e8 ff fc ff ff       	call   421 <write>
        while(*s != 0){
 722:	0f b6 06             	movzbl (%esi),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x1a0>
 72c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 72f:	31 d2                	xor    %edx,%edx
 731:	e9 8e fe ff ff       	jmp    5c4 <printf+0x54>
 736:	66 90                	xchg   %ax,%ax
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 30 0c 00 00       	mov    0xc30,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 74e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 750:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 753:	39 c8                	cmp    %ecx,%eax
 755:	73 19                	jae    770 <free+0x30>
 757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75e:	66 90                	xchg   %ax,%ax
 760:	39 d1                	cmp    %edx,%ecx
 762:	72 14                	jb     778 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 d0                	cmp    %edx,%eax
 766:	73 10                	jae    778 <free+0x38>
{
 768:	89 d0                	mov    %edx,%eax
 76a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76c:	39 c8                	cmp    %ecx,%eax
 76e:	72 f0                	jb     760 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	39 d0                	cmp    %edx,%eax
 772:	72 f4                	jb     768 <free+0x28>
 774:	39 d1                	cmp    %edx,%ecx
 776:	73 f0                	jae    768 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 fa                	cmp    %edi,%edx
 780:	74 1e                	je     7a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 782:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 785:	8b 50 04             	mov    0x4(%eax),%edx
 788:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 78b:	39 f1                	cmp    %esi,%ecx
 78d:	74 28                	je     7b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 78f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 791:	5b                   	pop    %ebx
  freep = p;
 792:	a3 30 0c 00 00       	mov    %eax,0xc30
}
 797:	5e                   	pop    %esi
 798:	5f                   	pop    %edi
 799:	5d                   	pop    %ebp
 79a:	c3                   	ret    
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7a0:	03 72 04             	add    0x4(%edx),%esi
 7a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 12                	mov    (%edx),%edx
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	75 d8                	jne    78f <free+0x4f>
    p->s.size += bp->s.size;
 7b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ba:	a3 30 0c 00 00       	mov    %eax,0xc30
    p->s.size += bp->s.size;
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c5:	89 10                	mov    %edx,(%eax)
}
 7c7:	5b                   	pop    %ebx
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 3d 30 0c 00 00    	mov    0xc30,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 70 07             	lea    0x7(%eax),%esi
 7e5:	c1 ee 03             	shr    $0x3,%esi
 7e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7eb:	85 ff                	test   %edi,%edi
 7ed:	0f 84 ad 00 00 00    	je     8a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f8:	39 f1                	cmp    %esi,%ecx
 7fa:	73 72                	jae    86e <malloc+0x9e>
 7fc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 802:	bb 00 10 00 00       	mov    $0x1000,%ebx
 807:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 80a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 811:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 814:	eb 1b                	jmp    831 <malloc+0x61>
 816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 822:	8b 48 04             	mov    0x4(%eax),%ecx
 825:	39 f1                	cmp    %esi,%ecx
 827:	73 4f                	jae    878 <malloc+0xa8>
 829:	8b 3d 30 0c 00 00    	mov    0xc30,%edi
 82f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	39 d7                	cmp    %edx,%edi
 833:	75 eb                	jne    820 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 835:	83 ec 0c             	sub    $0xc,%esp
 838:	ff 75 e4             	pushl  -0x1c(%ebp)
 83b:	e8 49 fc ff ff       	call   489 <sbrk>
  if(p == (char*)-1)
 840:	83 c4 10             	add    $0x10,%esp
 843:	83 f8 ff             	cmp    $0xffffffff,%eax
 846:	74 1c                	je     864 <malloc+0x94>
  hp->s.size = nu;
 848:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	83 c0 08             	add    $0x8,%eax
 851:	50                   	push   %eax
 852:	e8 e9 fe ff ff       	call   740 <free>
  return freep;
 857:	8b 15 30 0c 00 00    	mov    0xc30,%edx
      if((p = morecore(nunits)) == 0)
 85d:	83 c4 10             	add    $0x10,%esp
 860:	85 d2                	test   %edx,%edx
 862:	75 bc                	jne    820 <malloc+0x50>
        return 0;
  }
}
 864:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 867:	31 c0                	xor    %eax,%eax
}
 869:	5b                   	pop    %ebx
 86a:	5e                   	pop    %esi
 86b:	5f                   	pop    %edi
 86c:	5d                   	pop    %ebp
 86d:	c3                   	ret    
    if(p->s.size >= nunits){
 86e:	89 d0                	mov    %edx,%eax
 870:	89 fa                	mov    %edi,%edx
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 878:	39 ce                	cmp    %ecx,%esi
 87a:	74 54                	je     8d0 <malloc+0x100>
        p->s.size -= nunits;
 87c:	29 f1                	sub    %esi,%ecx
 87e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 881:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 884:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 887:	89 15 30 0c 00 00    	mov    %edx,0xc30
}
 88d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 890:	83 c0 08             	add    $0x8,%eax
}
 893:	5b                   	pop    %ebx
 894:	5e                   	pop    %esi
 895:	5f                   	pop    %edi
 896:	5d                   	pop    %ebp
 897:	c3                   	ret    
 898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 30 0c 00 00 34 	movl   $0xc34,0xc30
 8a7:	0c 00 00 
    base.s.size = 0;
 8aa:	bf 34 0c 00 00       	mov    $0xc34,%edi
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 34 0c 00 00 34 	movl   $0xc34,0xc34
 8b6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8bb:	c7 05 38 0c 00 00 00 	movl   $0x0,0xc38
 8c2:	00 00 00 
    if(p->s.size >= nunits){
 8c5:	e9 32 ff ff ff       	jmp    7fc <malloc+0x2c>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b1                	jmp    887 <malloc+0xb7>
