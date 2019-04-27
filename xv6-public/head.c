//
// Created by Abishek on 19/04/19.
//

#include "types.h"
#include "stat.h"
#include "user.h"
#define INT_MAX 2147483647

char buf[512];

void
Head(int fd,int Limit)
{
    int Current_Read = 0;
    int n;
    while((n = read(fd, buf, 1)) > 0 && Limit-1>= Current_Read ) {
        if (write(1, buf, n) != n) {
            printf(1, "Head: write error\n");
            exit();
        }
        if (buf[0] == '\n')
            Current_Read += 1;
    }
    if(n < 0){
        printf(1, "Head: read error\n");
        exit();
    }
}


int
main(int argc, char *argv[])
{
    int fd;

    if(argc <= 1){
        Head(0,INT_MAX);
        exit();
    }


    if((fd = open(argv[1], 0)) < 0){
        printf(1, "Head: cannot open %s\n", argv[1]);
        exit();
    }
    if (argc == 2)
        Head(fd,10);
    else if (argc == 3)
        Head(fd,atoi(argv[2]));
    else
        printf(2,"Head: Too many args");
    close(fd);
    exit();
}