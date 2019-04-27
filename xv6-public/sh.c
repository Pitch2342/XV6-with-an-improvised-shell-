// Shell.

#include "types.h"
#include "user.h"
#include "param.h"
#include "mmu.h"
#include "fs.h"
#include "fcntl.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "file.h"
#include "proc.h"
#define NELEM(x) (sizeof(x)/sizeof((x)[0]))


// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5
#define NULL  0

#define MAXARGS 10
// #define INT_MAX 2147483647


/// By Us
char *strcat(char *strg1, char *strg2)
{
	char *start = strg1;

	while(*strg1 != '\0')
	{
		strg1++;
	}

	while(*strg2 != '\0')
	{
		*strg1 = *strg2;
		strg1++;
		strg2++;
	}

	*strg1 = '\0';
	return start;
}

struct cmd {
	int type;
};

struct execcmd {
	int type;
	char *argv[MAXARGS];
	char *eargv[MAXARGS];
};

struct redircmd {
	int type;
	struct cmd *cmd;
	char *file;
	char *efile;
	int mode;
	int fd;
};

struct pipecmd {
	int type;
	struct cmd *left;
	struct cmd *right;
};

struct listcmd {
	int type;
	struct cmd *left;
	struct cmd *right;
};  

struct backcmd {
	int type;
	struct cmd *cmd;
};
/// pwd
struct directory{
	char string[100];
	struct directory *Next;
	struct directory *Before;
};

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);

struct {
	struct spinlock lock;
	struct proc proc[NPROC];
} ptable;

///Build Directory
struct directory* CreateNode(char *Str)
{
	struct directory* Temp = malloc(sizeof(struct directory));
    //Temp->string = malloc(sizeof(Str));
	strcpy(Temp->string,Str);
	Temp->Before = Temp->Next = NULL;
	return Temp;
}

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
	int p[2];
	struct backcmd *bcmd;
	struct execcmd *ecmd;
	struct listcmd *lcmd;
	struct pipecmd *pcmd;
	struct redircmd *rcmd;
	char Point[] = "/" ;

	if(cmd == 0)
		exit();

	switch(cmd->type){
		default:
		panic("runcmd");

		case EXEC:
		ecmd = (struct execcmd*)cmd;
		if(ecmd->argv[0] == 0)
			exit();
		exec(strcat(Point,ecmd->argv[0]), ecmd->argv);
		printf(2, "exec %s failed\n", ecmd->argv[0]);
		break;

		case REDIR:
		rcmd = (struct redircmd*)cmd;
		close(rcmd->fd);
		if(open(rcmd->file, rcmd->mode) < 0){
			printf(2, "open %s failed\n", rcmd->file);
			exit();
		}
		runcmd(rcmd->cmd);
		break;

		case LIST:
		lcmd = (struct listcmd*)cmd;
		if(fork1() == 0)
			runcmd(lcmd->left);
		wait();
		runcmd(lcmd->right);
		break;

		case PIPE:
		pcmd = (struct pipecmd*)cmd;
		if(pipe(p) < 0)
			panic("pipe");
		if(fork1() == 0){
			close(1);
			dup(p[1]);
			close(p[0]);
			close(p[1]);
			runcmd(pcmd->left);
		}
		if(fork1() == 0){
			close(0);
			dup(p[0]);
			close(p[0]);
			close(p[1]);
			runcmd(pcmd->right);
		}
		close(p[0]);
		close(p[1]);
		wait();
		wait();
		break;

		case BACK:
		bcmd = (struct backcmd*)cmd;
		if(fork1() == 0)
			runcmd(bcmd->cmd);
		break;
	}
	exit();
}

int
getcmd(char *buf, int nbuf)
{
	printf(2, "$ ");
	memset(buf, 0, nbuf);
	gets(buf, nbuf);
  if(buf[0] == 0) // EOF
  	return -1;
  return 0;
}


int
main(void)
{
	static char buf[100];
	int fd;
  // Assumes three file descriptors open.
	while((fd = open("console", O_RDWR)) >= 0){
		if(fd >= 3){
			close(fd);
			break;
		}
	}
	struct directory *Head_Directory  =  CreateNode("/");
	struct directory *Curr = Head_Directory;
	struct directory *prev = NULL;

  // Read and run input commands.
	while(getcmd(buf, sizeof(buf)) >= 0){
		if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      int returnStatus = chdir(buf+3);
      if(returnStatus < 0) {
      	printf(2, "cannot cd %s\n", buf + 3);
      } else {/// By US
      	if(buf[3] == '/' && buf[4] == NULL)
      	{
      		Curr = Head_Directory;
      		Curr->Next = NULL;
      		prev = NULL;
      		continue;
      	}
      	if(buf[3] == '.' && buf[4] == '.')
      	{
      		if(Curr != Head_Directory)
      		{
      			if(Curr->Before == Head_Directory)
      			{
      				Curr = Head_Directory;
      				Curr->Next = NULL;
      				prev = NULL;
      				continue;
      			}
      			Curr = Curr->Before->Before;
      			Curr->Next = NULL;
      			prev = Curr->Before;
      		}
      		continue;
      	}
      	if(buf[3] == '.' && buf[4] == NULL)
      	{
      		continue;
      	}
      	int Flag = 0;
      	for(int i = 4;i<strlen(buf);i++)
      	{
      		if(buf[i] == '/')
      		{
      			Flag = 1;
      			break;
      		}
      	}
      	struct directory *Next;
      	if(Flag){
      		char buffer[100];
      		if (buf[3] == '/')
      		{
      			Curr = Head_Directory;
      			Curr->Next = NULL;
      			prev = NULL;
      		}
          for(int i=3,k=0;i<strlen(buf);i++)// YET TO BE PERFECTED(several directory climb)
          {
          	if ((strlen(buf) == i || i == 3) && buf[i] == '/'){
          		continue;
          	}
          	if (buffer[k-1] == '\0')
          		k=0;
          	if(buf[i] != '/'){
          		buffer[k++] = buf[i];
          		printf(1,"%s\n",buffer);
          		continue;
          	}
          	else
          	{

          		buffer[k++] = '\0';
          		if((i != 3 && buf[i] == '/') && Curr != Head_Directory)
          		{
          			Next = CreateNode("/");
          			Curr->Next = Next;
          			Curr->Before = prev;
          			prev = Curr;
          			Next->Before = Curr;
          			Curr = Curr->Next;
          		}

          		Next = CreateNode(buffer);
          		Curr->Next = Next;
          		Curr->Before = prev;
          		prev = Curr;
          		Next->Before = Curr;
          		Curr = Curr->Next;
          	}
          }
          if (buf[strlen(buf)] != '/'){
          	Next = CreateNode("/");
          	Curr->Next = Next;
          	Curr->Before = prev;
          	prev = Curr;
          	Next->Before = Curr;
          	Curr = Curr->Next;
          	Next = CreateNode(buffer);
          	Curr->Next = Next;
          	Curr->Before = prev;
          	prev = Curr;
          	Next->Before = Curr;
          	Curr = Curr->Next;
          }
          continue;
      }
      if (buf[3] == '/' )
      {
      	Curr = Head_Directory;
      	Curr->Next = NULL;
      	prev = NULL;
      	Next = CreateNode(buf+4);
      	Curr->Next = Next;
      	Curr->Before = prev;
      	prev = Curr;
      	Next->Before = Curr;
      	Curr = Curr->Next;
      	continue;
      }
      if (Curr != Head_Directory && buf[3] != '/'){
      	Next = CreateNode("/");
      	Curr->Next = Next;
      	Curr->Before = prev;
      	prev = Curr;
      	Next->Before = Curr;
      	Curr = Curr->Next;
      }
      Next = CreateNode(buf+3);
      Curr->Next = Next;
      Curr->Before = prev;
      prev = Curr;
      Next->Before = Curr;
      Curr = Curr->Next;
  }
  continue;
}
if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd')
{
	struct directory *iter = Head_Directory;
	while(iter)
	{
		printf(1,iter->string);
		iter = iter->Next;
	}
	printf(1,"\n");
	continue;
}
if(buf[0] == 'p' && buf[1] == 's')
{
	static char *states[] = {
		[UNUSED]    "unused",
		[EMBRYO]    "embryo",
		[SLEEPING]  "sleep ",
		[RUNNABLE]  "runble",
		[RUNNING]   "run   ",
		[ZOMBIE]    "zombie"
	};
	char *state;
	struct proc *p;
	printf(1, "F    S    UID    PID    PPID    SZ    WCHAN    COMD\n");
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
		if (p->state == UNUSED)
			continue;
		if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
			state = states[p->state];
		else
			state = "???"; 
		printf(1, "2    %s    Root    %d    %d    %d    %d    %s\n", state, p->pid, p->parent->pid,p->sz,p->chan, p->name);
	}
	continue;
}

if(fork1() == 0)
{
	if(buf[0] == '.' && buf[1] == '/' && buf[strlen(buf)-2] == 'h' && buf[strlen(buf)-3] == 's' && buf[strlen(buf)-4] == '.')
	{
		int fd;
		buf[strlen(buf)-1] = '\0';
		if((fd = open(&buf[2],O_RDONLY)) < 0)
		{
			printf(2,"Error while reading the script\n");
			exit();
		}
		char buff[512];
		int n, Counter = 0;
		char Cmd[512];
		for(;;)
		{
			n = read(fd,buff,1);
			if(n < 0)
			{
				printf(2,"Error while reading the script\n");
				exit();	
			}
			else if (n == 0)
			{
				break;
			}
			else
			{
				if(buff[0] != '\n')
				{
					Cmd[Counter++] = buff[0];
				}
				else
				{
					Cmd[Counter] = '\0';
					if(fork1() == 0)
					{
						runcmd(parsecmd(Cmd));
					}
					else
					{
						wait();
					}
					Counter = 0;
				}
			}
		}

	}
	else
	{
		runcmd(parsecmd(buf));
	}
}
wait();
}
exit();
}
void
panic(char *s)
{
	printf(2, "%s\n", s);
	exit();
}

int
fork1(void)
{
	int pid;

	pid = fork();
	if(pid == -1)
		panic("fork");
	return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
	struct execcmd *cmd;
	cmd = malloc(sizeof(*cmd));
	memset(cmd, 0, sizeof(*cmd));
	cmd->type = EXEC;
	return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
	struct redircmd *cmd;

	cmd = malloc(sizeof(*cmd));
	memset(cmd, 0, sizeof(*cmd));
	cmd->type = REDIR;
	cmd->cmd = subcmd;
	cmd->file = file;
	cmd->efile = efile;
	cmd->mode = mode;
	cmd->fd = fd;
	return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
	struct pipecmd *cmd;

	cmd = malloc(sizeof(*cmd));
	memset(cmd, 0, sizeof(*cmd));
	cmd->type = PIPE;
	cmd->left = left;
	cmd->right = right;
	return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
	struct listcmd *cmd;

	cmd = malloc(sizeof(*cmd));
	memset(cmd, 0, sizeof(*cmd));
	cmd->type = LIST;
	cmd->left = left;
	cmd->right = right;
	return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
	struct backcmd *cmd;

	cmd = malloc(sizeof(*cmd));
	memset(cmd, 0, sizeof(*cmd));
	cmd->type = BACK;
	cmd->cmd = subcmd;
	return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
	char *s;
	int ret;

	s = *ps;
	while(s < es && strchr(whitespace, *s))
		s++;
	if(q)
		*q = s;
	ret = *s;
	switch(*s){
		case 0:
		break;
		case '|':
		case '(':
		case ')':
		case ';':
		case '&':
		case '<':
		s++;
		break;
		case '>':
		s++;
		if(*s == '>'){
			ret = '+';
			s++;
		}
		break;
		default:
		ret = 'a';
		while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
			s++;
		break;
	}
	if(eq)
		*eq = s;

	while(s < es && strchr(whitespace, *s))
		s++;
	*ps = s;
	return ret;
}

int
peek(char **ps, char *es, char *toks)
{
	char *s;

	s = *ps;
	while(s < es && strchr(whitespace, *s))
		s++;
	*ps = s;
	return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
	char *es;
	struct cmd *cmd;

	es = s + strlen(s);
	cmd = parseline(&s, es);
	peek(&s, es, "");
	if(s != es){
		printf(2, "leftovers: %s\n", s);
		panic("syntax");
	}
	nulterminate(cmd);
	return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
	struct cmd *cmd;

	cmd = parsepipe(ps, es);
	while(peek(ps, es, "&")){
		gettoken(ps, es, 0, 0);
		cmd = backcmd(cmd);
	}
	if(peek(ps, es, ";")){
		gettoken(ps, es, 0, 0);
		cmd = listcmd(cmd, parseline(ps, es));
	}
	return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
	struct cmd *cmd;

	cmd = parseexec(ps, es);
	if(peek(ps, es, "|")){
		gettoken(ps, es, 0, 0);
		cmd = pipecmd(cmd, parsepipe(ps, es));
	}
	return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
	int tok;
	char *q, *eq;

	while(peek(ps, es, "<>")){
		tok = gettoken(ps, es, 0, 0);
		if(gettoken(ps, es, &q, &eq) != 'a')
			panic("missing file for redirection");
		switch(tok){
			case '<':
			cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
			break;
			case '>':
			cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
			break;
    case '+':  // >>
    cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    break;
}
}
return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
	struct cmd *cmd;

	if(!peek(ps, es, "("))
		panic("parseblock");
	gettoken(ps, es, 0, 0);
	cmd = parseline(ps, es);
	if(!peek(ps, es, ")"))
		panic("syntax - missing )");
	gettoken(ps, es, 0, 0);
	cmd = parseredirs(cmd, ps, es);
	return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
	char *q, *eq;
	int tok, argc;
	struct execcmd *cmd;
	struct cmd *ret;

	if(peek(ps, es, "("))
		return parseblock(ps, es);

	ret = execcmd();
	cmd = (struct execcmd*)ret;

	argc = 0;
	ret = parseredirs(ret, ps, es);
	while(!peek(ps, es, "|)&;")){
		if((tok=gettoken(ps, es, &q, &eq)) == 0)
			break;
		if(tok != 'a')
			panic("syntax");
		cmd->argv[argc] = q;
		cmd->eargv[argc] = eq;
		argc++;
		if(argc >= MAXARGS)
			panic("too many args");
		ret = parseredirs(ret, ps, es);
	}
	cmd->argv[argc] = 0;
	cmd->eargv[argc] = 0;
	return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
	int i;
	struct backcmd *bcmd;
	struct execcmd *ecmd;
	struct listcmd *lcmd;
	struct pipecmd *pcmd;
	struct redircmd *rcmd;

	if(cmd == 0)
		return 0;

	switch(cmd->type){
		case EXEC:
		ecmd = (struct execcmd*)cmd;
		for(i=0; ecmd->argv[i]; i++)
			*ecmd->eargv[i] = 0;
		break;

		case REDIR:
		rcmd = (struct redircmd*)cmd;
		nulterminate(rcmd->cmd);
		*rcmd->efile = 0;
		break;

		case PIPE:
		pcmd = (struct pipecmd*)cmd;
		nulterminate(pcmd->left);
		nulterminate(pcmd->right);
		break;

		case LIST:
		lcmd = (struct listcmd*)cmd;
		nulterminate(lcmd->left);
		nulterminate(lcmd->right);
		break;

		case BACK:
		bcmd = (struct backcmd*)cmd;
		nulterminate(bcmd->cmd);
		break;
	}
	return cmd;
}
