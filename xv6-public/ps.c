//
// Created by Abishek on 18/04/19.
//

#include "types.h"
#include "user.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"
#define NELEM(x) (sizeof(x)/sizeof((x)[0]))

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;


int
main(int argc, char *argv[]){
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
    exit();
}
