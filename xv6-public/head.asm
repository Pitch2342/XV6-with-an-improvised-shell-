
_head:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
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
        Head(0,INT_MAX);
        exit();
    }


    if((fd = open(argv[1], 0)) < 0){
  1e:	50                   	push   %eax
  1f:	50                   	push   %eax
  20:	6a 00                	push   $0x0
  22:	ff 76 04             	pushl  0x4(%esi)
  25:	e8 a7 03 00 00       	call   3d1 <open>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	89 c7                	mov    %eax,%edi
  2f:	85 c0                	test   %eax,%eax
  31:	78 3c                	js     6f <main+0x6f>
        printf(1, "Head: cannot open %s\n", argv[1]);
        exit();
    }
    if (argc == 2)
  33:	83 fb 02             	cmp    $0x2,%ebx
  36:	74 65                	je     9d <main+0x9d>
        Head(fd,10);
    else if (argc == 3)
  38:	83 fb 03             	cmp    $0x3,%ebx
  3b:	74 47                	je     84 <main+0x84>
        Head(fd,atoi(argv[2]));
    else
        printf(2,"Head: Too many args");
  3d:	50                   	push   %eax
  3e:	50                   	push   %eax
  3f:	68 a3 08 00 00       	push   $0x8a3
  44:	6a 02                	push   $0x2
  46:	e8 b5 04 00 00       	call   500 <printf>
  4b:	83 c4 10             	add    $0x10,%esp
    close(fd);
  4e:	83 ec 0c             	sub    $0xc,%esp
  51:	57                   	push   %edi
  52:	e8 62 03 00 00       	call   3b9 <close>
    exit();
  57:	e8 35 03 00 00       	call   391 <exit>
        Head(0,INT_MAX);
  5c:	50                   	push   %eax
  5d:	50                   	push   %eax
  5e:	68 ff ff ff 7f       	push   $0x7fffffff
  63:	6a 00                	push   $0x0
  65:	e8 46 00 00 00       	call   b0 <Head>
        exit();
  6a:	e8 22 03 00 00       	call   391 <exit>
        printf(1, "Head: cannot open %s\n", argv[1]);
  6f:	57                   	push   %edi
  70:	ff 76 04             	pushl  0x4(%esi)
  73:	68 8d 08 00 00       	push   $0x88d
  78:	6a 01                	push   $0x1
  7a:	e8 81 04 00 00       	call   500 <printf>
        exit();
  7f:	e8 0d 03 00 00       	call   391 <exit>
        Head(fd,atoi(argv[2]));
  84:	83 ec 0c             	sub    $0xc,%esp
  87:	ff 76 08             	pushl  0x8(%esi)
  8a:	e8 91 02 00 00       	call   320 <atoi>
  8f:	5a                   	pop    %edx
  90:	59                   	pop    %ecx
  91:	50                   	push   %eax
  92:	57                   	push   %edi
  93:	e8 18 00 00 00       	call   b0 <Head>
  98:	83 c4 10             	add    $0x10,%esp
  9b:	eb b1                	jmp    4e <main+0x4e>
        Head(fd,10);
  9d:	53                   	push   %ebx
  9e:	53                   	push   %ebx
  9f:	6a 0a                	push   $0xa
  a1:	50                   	push   %eax
  a2:	e8 09 00 00 00       	call   b0 <Head>
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	eb a2                	jmp    4e <main+0x4e>
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <Head>:
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
    int Current_Read = 0;
  b6:	31 db                	xor    %ebx,%ebx
{
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	8b 75 08             	mov    0x8(%ebp),%esi
    while((n = read(fd, buf, 1)) > 0 && Limit-1>= Current_Read ) {
  be:	eb 2a                	jmp    ea <Head+0x3a>
  c0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c3:	7d 40                	jge    105 <Head+0x55>
        if (write(1, buf, n) != n) {
  c5:	83 ec 04             	sub    $0x4,%esp
  c8:	57                   	push   %edi
  c9:	68 e0 0b 00 00       	push   $0xbe0
  ce:	6a 01                	push   $0x1
  d0:	e8 dc 02 00 00       	call   3b1 <write>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	39 f8                	cmp    %edi,%eax
  da:	75 31                	jne    10d <Head+0x5d>
            Current_Read += 1;
  dc:	31 c0                	xor    %eax,%eax
  de:	80 3d e0 0b 00 00 0a 	cmpb   $0xa,0xbe0
  e5:	0f 94 c0             	sete   %al
  e8:	01 c3                	add    %eax,%ebx
    while((n = read(fd, buf, 1)) > 0 && Limit-1>= Current_Read ) {
  ea:	83 ec 04             	sub    $0x4,%esp
  ed:	6a 01                	push   $0x1
  ef:	68 e0 0b 00 00       	push   $0xbe0
  f4:	56                   	push   %esi
  f5:	e8 af 02 00 00       	call   3a9 <read>
  fa:	83 c4 10             	add    $0x10,%esp
  fd:	89 c7                	mov    %eax,%edi
  ff:	85 c0                	test   %eax,%eax
 101:	7f bd                	jg     c0 <Head+0x10>
    if(n < 0){
 103:	75 1c                	jne    121 <Head+0x71>
}
 105:	8d 65 f4             	lea    -0xc(%ebp),%esp
 108:	5b                   	pop    %ebx
 109:	5e                   	pop    %esi
 10a:	5f                   	pop    %edi
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
            printf(1, "Head: write error\n");
 10d:	83 ec 08             	sub    $0x8,%esp
 110:	68 68 08 00 00       	push   $0x868
 115:	6a 01                	push   $0x1
 117:	e8 e4 03 00 00       	call   500 <printf>
            exit();
 11c:	e8 70 02 00 00       	call   391 <exit>
        printf(1, "Head: read error\n");
 121:	50                   	push   %eax
 122:	50                   	push   %eax
 123:	68 7b 08 00 00       	push   $0x87b
 128:	6a 01                	push   $0x1
 12a:	e8 d1 03 00 00       	call   500 <printf>
        exit();
 12f:	e8 5d 02 00 00       	call   391 <exit>
 134:	66 90                	xchg   %ax,%ax
 136:	66 90                	xchg   %ax,%ax
 138:	66 90                	xchg   %ax,%ax
 13a:	66 90                	xchg   %ax,%ax
 13c:	66 90                	xchg   %ax,%ax
 13e:	66 90                	xchg   %ax,%ax

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 d2                	xor    %edx,%edx
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 154:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 c9                	test   %cl,%cl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	5b                   	pop    %ebx
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    
 161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 168:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
 17b:	0f b6 13             	movzbl (%ebx),%edx
 17e:	0f b6 0e             	movzbl (%esi),%ecx
 181:	84 d2                	test   %dl,%dl
 183:	74 1e                	je     1a3 <strcmp+0x33>
 185:	b8 01 00 00 00       	mov    $0x1,%eax
 18a:	38 ca                	cmp    %cl,%dl
 18c:	74 09                	je     197 <strcmp+0x27>
 18e:	eb 20                	jmp    1b0 <strcmp+0x40>
 190:	83 c0 01             	add    $0x1,%eax
 193:	38 ca                	cmp    %cl,%dl
 195:	75 19                	jne    1b0 <strcmp+0x40>
 197:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 19b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 19f:	84 d2                	test   %dl,%dl
 1a1:	75 ed                	jne    190 <strcmp+0x20>
 1a3:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1a5:	5b                   	pop    %ebx
 1a6:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 1a7:	29 c8                	sub    %ecx,%eax
}
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop
 1b0:	0f b6 c2             	movzbl %dl,%eax
 1b3:	5b                   	pop    %ebx
 1b4:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 1b5:	29 c8                	sub    %ecx,%eax
}
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 21a:	0f b6 18             	movzbl (%eax),%ebx
 21d:	84 db                	test   %bl,%bl
 21f:	74 1d                	je     23e <strchr+0x2e>
 221:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 223:	38 d3                	cmp    %dl,%bl
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
  for(; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 255:	31 f6                	xor    %esi,%esi
{
 257:	53                   	push   %ebx
 258:	89 f3                	mov    %esi,%ebx
 25a:	83 ec 1c             	sub    $0x1c,%esp
 25d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 260:	eb 2f                	jmp    291 <gets+0x41>
 262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 268:	83 ec 04             	sub    $0x4,%esp
 26b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 26e:	6a 01                	push   $0x1
 270:	50                   	push   %eax
 271:	6a 00                	push   $0x0
 273:	e8 31 01 00 00       	call   3a9 <read>
    if(cc < 1)
 278:	83 c4 10             	add    $0x10,%esp
 27b:	85 c0                	test   %eax,%eax
 27d:	7e 1c                	jle    29b <gets+0x4b>
      break;
    buf[i++] = c;
 27f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 283:	83 c7 01             	add    $0x1,%edi
 286:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 289:	3c 0a                	cmp    $0xa,%al
 28b:	74 23                	je     2b0 <gets+0x60>
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 1f                	je     2b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 291:	83 c3 01             	add    $0x1,%ebx
 294:	89 fe                	mov    %edi,%esi
 296:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 299:	7c cd                	jl     268 <gets+0x18>
 29b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 de                	add    %ebx,%esi
 2b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c0:	5b                   	pop    %ebx
 2c1:	5e                   	pop    %esi
 2c2:	5f                   	pop    %edi
 2c3:	5d                   	pop    %ebp
 2c4:	c3                   	ret    
 2c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 ef 00 00 00       	call   3d1 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f2 00 00 00       	call   3e9 <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 b8 00 00 00       	call   3b9 <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
  n = 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 340:	83 c1 01             	add    $0x1,%ecx
 343:	8d 04 80             	lea    (%eax,%eax,4),%eax
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 55 10             	mov    0x10(%ebp),%edx
 367:	8b 45 08             	mov    0x8(%ebp),%eax
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 d2                	test   %edx,%edx
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 c2                	add    %eax,%edx
  dst = vdst;
 374:	89 c7                	mov    %eax,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 fa                	cmp    %edi,%edx
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	5f                   	pop    %edi
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 389:	b8 01 00 00 00       	mov    $0x1,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <exit>:
SYSCALL(exit)
 391:	b8 02 00 00 00       	mov    $0x2,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <wait>:
SYSCALL(wait)
 399:	b8 03 00 00 00       	mov    $0x3,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <pipe>:
SYSCALL(pipe)
 3a1:	b8 04 00 00 00       	mov    $0x4,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <read>:
SYSCALL(read)
 3a9:	b8 05 00 00 00       	mov    $0x5,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <write>:
SYSCALL(write)
 3b1:	b8 10 00 00 00       	mov    $0x10,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <close>:
SYSCALL(close)
 3b9:	b8 15 00 00 00       	mov    $0x15,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <kill>:
SYSCALL(kill)
 3c1:	b8 06 00 00 00       	mov    $0x6,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <exec>:
SYSCALL(exec)
 3c9:	b8 07 00 00 00       	mov    $0x7,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <open>:
SYSCALL(open)
 3d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <mknod>:
SYSCALL(mknod)
 3d9:	b8 11 00 00 00       	mov    $0x11,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <unlink>:
SYSCALL(unlink)
 3e1:	b8 12 00 00 00       	mov    $0x12,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <fstat>:
SYSCALL(fstat)
 3e9:	b8 08 00 00 00       	mov    $0x8,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <link>:
SYSCALL(link)
 3f1:	b8 13 00 00 00       	mov    $0x13,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <mkdir>:
SYSCALL(mkdir)
 3f9:	b8 14 00 00 00       	mov    $0x14,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <chdir>:
SYSCALL(chdir)
 401:	b8 09 00 00 00       	mov    $0x9,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <dup>:
SYSCALL(dup)
 409:	b8 0a 00 00 00       	mov    $0xa,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <getpid>:
SYSCALL(getpid)
 411:	b8 0b 00 00 00       	mov    $0xb,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <sbrk>:
SYSCALL(sbrk)
 419:	b8 0c 00 00 00       	mov    $0xc,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <sleep>:
SYSCALL(sleep)
 421:	b8 0d 00 00 00       	mov    $0xd,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <uptime>:
SYSCALL(uptime)
 429:	b8 0e 00 00 00       	mov    $0xe,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    
 431:	66 90                	xchg   %ax,%ax
 433:	66 90                	xchg   %ax,%ax
 435:	66 90                	xchg   %ax,%ax
 437:	66 90                	xchg   %ax,%ax
 439:	66 90                	xchg   %ax,%ax
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 446:	89 d3                	mov    %edx,%ebx
{
 448:	83 ec 3c             	sub    $0x3c,%esp
 44b:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 44e:	85 d2                	test   %edx,%edx
 450:	0f 89 92 00 00 00    	jns    4e8 <printint+0xa8>
 456:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45a:	0f 84 88 00 00 00    	je     4e8 <printint+0xa8>
    neg = 1;
 460:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 467:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 469:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 470:	8d 75 d7             	lea    -0x29(%ebp),%esi
 473:	eb 08                	jmp    47d <printint+0x3d>
 475:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 478:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 47b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 47d:	89 d8                	mov    %ebx,%eax
 47f:	31 d2                	xor    %edx,%edx
 481:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 484:	f7 f1                	div    %ecx
 486:	83 c7 01             	add    $0x1,%edi
 489:	0f b6 92 c0 08 00 00 	movzbl 0x8c0(%edx),%edx
 490:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 493:	39 d9                	cmp    %ebx,%ecx
 495:	76 e1                	jbe    478 <printint+0x38>
  if(neg)
 497:	8b 45 c0             	mov    -0x40(%ebp),%eax
 49a:	85 c0                	test   %eax,%eax
 49c:	74 0d                	je     4ab <printint+0x6b>
    buf[i++] = '-';
 49e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4a3:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 4a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 4ab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ae:	8b 7d bc             	mov    -0x44(%ebp),%edi
 4b1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4b5:	eb 0f                	jmp    4c6 <printint+0x86>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
 4c0:	0f b6 13             	movzbl (%ebx),%edx
 4c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	56                   	push   %esi
 4cf:	57                   	push   %edi
 4d0:	e8 dc fe ff ff       	call   3b1 <write>

  while(--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x80>
    putc(fd, buf[i]);
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 4ef:	e9 75 ff ff ff       	jmp    469 <printint+0x29>
 4f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 509:	8b 75 0c             	mov    0xc(%ebp),%esi
 50c:	0f b6 1e             	movzbl (%esi),%ebx
 50f:	84 db                	test   %bl,%bl
 511:	0f 84 b9 00 00 00    	je     5d0 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 517:	8d 45 10             	lea    0x10(%ebp),%eax
 51a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 51d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 520:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 522:	89 45 d0             	mov    %eax,-0x30(%ebp)
 525:	eb 38                	jmp    55f <printf+0x5f>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
 530:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 533:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	74 17                	je     554 <printf+0x54>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	88 5d e7             	mov    %bl,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	ff 75 08             	pushl  0x8(%ebp)
 549:	e8 63 fe ff ff       	call   3b1 <write>
 54e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 551:	83 c4 10             	add    $0x10,%esp
 554:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 557:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 55b:	84 db                	test   %bl,%bl
 55d:	74 71                	je     5d0 <printf+0xd0>
    c = fmt[i] & 0xff;
 55f:	0f be cb             	movsbl %bl,%ecx
 562:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 565:	85 d2                	test   %edx,%edx
 567:	74 c7                	je     530 <printf+0x30>
      }
    } else if(state == '%'){
 569:	83 fa 25             	cmp    $0x25,%edx
 56c:	75 e6                	jne    554 <printf+0x54>
      if(c == 'd'){
 56e:	83 f8 64             	cmp    $0x64,%eax
 571:	0f 84 99 00 00 00    	je     610 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 577:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 57d:	83 f9 70             	cmp    $0x70,%ecx
 580:	74 5e                	je     5e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 582:	83 f8 73             	cmp    $0x73,%eax
 585:	0f 84 d5 00 00 00    	je     660 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58b:	83 f8 63             	cmp    $0x63,%eax
 58e:	0f 84 8c 00 00 00    	je     620 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 594:	83 f8 25             	cmp    $0x25,%eax
 597:	0f 84 b3 00 00 00    	je     650 <printf+0x150>
  write(fd, &c, 1);
 59d:	83 ec 04             	sub    $0x4,%esp
 5a0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5a4:	6a 01                	push   $0x1
 5a6:	57                   	push   %edi
 5a7:	ff 75 08             	pushl  0x8(%ebp)
 5aa:	e8 02 fe ff ff       	call   3b1 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5af:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5b2:	83 c4 0c             	add    $0xc,%esp
 5b5:	6a 01                	push   $0x1
 5b7:	83 c6 01             	add    $0x1,%esi
 5ba:	57                   	push   %edi
 5bb:	ff 75 08             	pushl  0x8(%ebp)
 5be:	e8 ee fd ff ff       	call   3b1 <write>
  for(i = 0; fmt[i]; i++){
 5c3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5c7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5ca:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5cc:	84 db                	test   %bl,%bl
 5ce:	75 8f                	jne    55f <printf+0x5f>
    }
  }
}
 5d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5f                   	pop    %edi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
        printint(fd, *ap, 16, 0);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e8:	6a 00                	push   $0x0
 5ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	8b 13                	mov    (%ebx),%edx
 5f2:	e8 49 fe ff ff       	call   440 <printint>
        ap++;
 5f7:	89 d8                	mov    %ebx,%eax
 5f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fc:	31 d2                	xor    %edx,%edx
        ap++;
 5fe:	83 c0 04             	add    $0x4,%eax
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	e9 4b ff ff ff       	jmp    554 <printf+0x54>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 0a 00 00 00       	mov    $0xa,%ecx
 618:	6a 01                	push   $0x1
 61a:	eb ce                	jmp    5ea <printf+0xea>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 626:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 628:	6a 01                	push   $0x1
        ap++;
 62a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 62d:	57                   	push   %edi
 62e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 631:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 634:	e8 78 fd ff ff       	call   3b1 <write>
        ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 0e ff ff ff       	jmp    554 <printf+0x54>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
 656:	e9 5a ff ff ff       	jmp    5b5 <printf+0xb5>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
        s = (char*)*ap;
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
        ap++;
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 66b:	85 db                	test   %ebx,%ebx
 66d:	74 17                	je     686 <printf+0x186>
        while(*s != 0){
 66f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 672:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 674:	84 c0                	test   %al,%al
 676:	0f 84 d8 fe ff ff    	je     554 <printf+0x54>
 67c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67f:	89 de                	mov    %ebx,%esi
 681:	8b 5d 08             	mov    0x8(%ebp),%ebx
 684:	eb 1a                	jmp    6a0 <printf+0x1a0>
          s = "(null)";
 686:	bb b7 08 00 00       	mov    $0x8b7,%ebx
        while(*s != 0){
 68b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	89 de                	mov    %ebx,%esi
 695:	8b 5d 08             	mov    0x8(%ebp),%ebx
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c6 01             	add    $0x1,%esi
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	53                   	push   %ebx
 6ad:	e8 ff fc ff ff       	call   3b1 <write>
        while(*s != 0){
 6b2:	0f b6 06             	movzbl (%esi),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x1a0>
 6bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 8e fe ff ff       	jmp    554 <printf+0x54>
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 c0 0b 00 00       	mov    0xbc0,%eax
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6de:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e3:	39 c8                	cmp    %ecx,%eax
 6e5:	73 19                	jae    700 <free+0x30>
 6e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ee:	66 90                	xchg   %ax,%ax
 6f0:	39 d1                	cmp    %edx,%ecx
 6f2:	72 14                	jb     708 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	39 d0                	cmp    %edx,%eax
 6f6:	73 10                	jae    708 <free+0x38>
{
 6f8:	89 d0                	mov    %edx,%eax
 6fa:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 f0                	jb     6f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 d0                	cmp    %edx,%eax
 702:	72 f4                	jb     6f8 <free+0x28>
 704:	39 d1                	cmp    %edx,%ecx
 706:	73 f0                	jae    6f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 fa                	cmp    %edi,%edx
 710:	74 1e                	je     730 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 28                	je     747 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 730:	03 72 04             	add    0x4(%edx),%esi
 733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 736:	8b 10                	mov    (%eax),%edx
 738:	8b 12                	mov    (%edx),%edx
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	75 d8                	jne    71f <free+0x4f>
    p->s.size += bp->s.size;
 747:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 74a:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    p->s.size += bp->s.size;
 74f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 752:	8b 53 f8             	mov    -0x8(%ebx),%edx
 755:	89 10                	mov    %edx,(%eax)
}
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 76c:	8b 3d c0 0b 00 00    	mov    0xbc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	8d 70 07             	lea    0x7(%eax),%esi
 775:	c1 ee 03             	shr    $0x3,%esi
 778:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 77b:	85 ff                	test   %edi,%edi
 77d:	0f 84 ad 00 00 00    	je     830 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 783:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 785:	8b 4a 04             	mov    0x4(%edx),%ecx
 788:	39 f1                	cmp    %esi,%ecx
 78a:	73 72                	jae    7fe <malloc+0x9e>
 78c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 792:	bb 00 10 00 00       	mov    $0x1000,%ebx
 797:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 79a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7a4:	eb 1b                	jmp    7c1 <malloc+0x61>
 7a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b2:	8b 48 04             	mov    0x4(%eax),%ecx
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	73 4f                	jae    808 <malloc+0xa8>
 7b9:	8b 3d c0 0b 00 00    	mov    0xbc0,%edi
 7bf:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	39 d7                	cmp    %edx,%edi
 7c3:	75 eb                	jne    7b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7cb:	e8 49 fc ff ff       	call   419 <sbrk>
  if(p == (char*)-1)
 7d0:	83 c4 10             	add    $0x10,%esp
 7d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d6:	74 1c                	je     7f4 <malloc+0x94>
  hp->s.size = nu;
 7d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	83 c0 08             	add    $0x8,%eax
 7e1:	50                   	push   %eax
 7e2:	e8 e9 fe ff ff       	call   6d0 <free>
  return freep;
 7e7:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
      if((p = morecore(nunits)) == 0)
 7ed:	83 c4 10             	add    $0x10,%esp
 7f0:	85 d2                	test   %edx,%edx
 7f2:	75 bc                	jne    7b0 <malloc+0x50>
        return 0;
  }
}
 7f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7f7:	31 c0                	xor    %eax,%eax
}
 7f9:	5b                   	pop    %ebx
 7fa:	5e                   	pop    %esi
 7fb:	5f                   	pop    %edi
 7fc:	5d                   	pop    %ebp
 7fd:	c3                   	ret    
    if(p->s.size >= nunits){
 7fe:	89 d0                	mov    %edx,%eax
 800:	89 fa                	mov    %edi,%edx
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 808:	39 ce                	cmp    %ecx,%esi
 80a:	74 54                	je     860 <malloc+0x100>
        p->s.size -= nunits;
 80c:	29 f1                	sub    %esi,%ecx
 80e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 811:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 814:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 817:	89 15 c0 0b 00 00    	mov    %edx,0xbc0
}
 81d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 820:	83 c0 08             	add    $0x8,%eax
}
 823:	5b                   	pop    %ebx
 824:	5e                   	pop    %esi
 825:	5f                   	pop    %edi
 826:	5d                   	pop    %ebp
 827:	c3                   	ret    
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 837:	0b 00 00 
    base.s.size = 0;
 83a:	bf c4 0b 00 00       	mov    $0xbc4,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 846:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 84b:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 32 ff ff ff       	jmp    78c <malloc+0x2c>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b1                	jmp    817 <malloc+0xb7>
