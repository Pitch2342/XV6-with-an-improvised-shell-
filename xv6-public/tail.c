//
// Created by Abishek on 19/04/19.
//

#include "types.h"
#include "stat.h"
#include "user.h"
#define INT_MAX 2147483647

char buf[512];

void
Tail(int fd,int Limit, char *Path)
{
    int Total_Lines= 0;
    int Counter = 0;
    int Start;
    int n;
    while((n = read(fd, buf, 1)) > 0) {
        if(buf[0] == '\n')
            Total_Lines += 1;
    }
    if(n < 0){
        printf(1,"Tail: read error\n");
        exit();
    }
    Start = Total_Lines - Limit;
    if (Start < 0)
    {
        printf(1, "Tail:Invalid no of lines");
    }
    close(fd);
    close(0);
    fd = open(Path,0);
    while((n = read(fd, buf, 1)) > 0) {
        if(Counter >= Start)
        {
            if((write(1,buf,1)) != 1)
            {
                printf(1, "Head: write error\n");
                exit();
            }
        }
        if(buf[0] == '\n')
            Counter += 1;
    }
    close(fd);
}
int
main(int argc, char *argv[])
{
    int fd;

    if(argc <= 1){
        Tail(0,INT_MAX,".");
        exit();
    }


    if((fd = open(argv[1], 0)) < 0){
        printf(1, "Tail: cannot open %s\n", argv[1]);
        exit();
    }
    if (argc == 2)
        Tail(fd,10,argv[1]);
    else if (argc == 3)
        Tail(fd,atoi(argv[2]),argv[1]);
    else
        printf(2,"Head: Too many args");
    close(fd);
    exit();
}