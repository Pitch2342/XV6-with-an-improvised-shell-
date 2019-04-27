//
// Created by Anusha on 19-04-2019.
//
#include "types.h"
#include "user.h"
#include "fcntl.h"
int main(int argc,char *argv[])
{
    int n;char buf[200];
    int fd;

    if(argc<2)
    {
        printf(2,"arguments are not enough!!\n");
    }
    else
    {
        if(argc==2)
        {
            if((fd=open(argv[1],O_RDONLY))<0) {
                printf(2, "File Doesn't Exists!\n");
                exit();
            }
                else
                {
                    while(1) {
                        if ((n = read(fd, buf, sizeof(buf))) < 0) {
                            printf(2, "unable to read\n");
                            exit();
                        }
                        if(n == 0)
                        {
                            break;
                        }
                        if ((write(1, buf, n)) != n) {
                            printf(2, "unable to read\n");
                            exit();
                        }
                    }
                }
                close(fd);
                exit();
        }
        else if(argc==3)
        {

            if(strcmp(argv[2],"R")==0)
              {
                close(0);
                fd=open(argv[1],O_RDONLY);
                if(fd<0)
                {
                    printf(2,"read error\n");
                    exit();
                }
                else
                {
                    while(1) {
                        if ((n = read(fd, buf, sizeof(buf))) < 0) {
                            printf(2, "unable to read\n");
                            exit();
                        }
                        if(n == 0)
                        {
                            break;
                        }
                        if ((write(1, buf, n)) != n) {
                            printf(2, "unable to read\n");
                            exit();
                        }
                    }
                }
                close(fd);
                exit();
            }
            if(strcmp(argv[2],"W")==0)
            {
                unlink(argv[1]);
                fd=open(argv[1],O_CREATE | O_WRONLY);
                if(fd<0) {
                    printf(2, "write error\n");
                    exit();
                }
                else
                {
                    while(1)
                    {
                        if((n=read(0,buf, sizeof(buf)))<0)
                        {
                            printf(2, "unable to write\n");
                            exit();
                        }
                        if(n==1)
                        {
                            break;
                        }
                        if ((write(fd, buf, n)) != n) {
                            printf(2, "unable to write\n");
                            exit();
                        }
                    }
                }
                close(fd);
                exit();
            }
            if(strcmp(argv[2],"C")==0)
            {
                fd=open(argv[1],O_CREATE);
                if(fd<0) {
                    printf(2, "creation error\n");
                    exit();
                }
                else
                {
                    close(fd);
                    exit();
                }
            }
                if(strcmp(argv[2],"X")==0)
                {
                    fd=open(argv[1],O_RDWR);
                    if(fd<0) {
                        printf(2,"read,write error\n");
                        exit();
                    }
                    else
                    {
                        while(1) {
                            if ((n = read(fd, buf, sizeof(buf))) < 0) {
                                printf(2, "unable to read from file\n");
                                exit();
                            }
                            if (n == 0) {
                                break;
                            }
                            if (write(1, buf, n) != n) {
                                printf(2, "unable to read from file\n");
                                exit();
                            }
                        }
                        printf(1, "\n");
                        while(1)
                        {
                            if ((n = read(0, buf, sizeof(buf))) < 0) {
                                printf(2, "unable to read from file\n");
                                exit();
                            }
                            if (n == 1) {
                                break;
                            }
                            if (write(fd, buf, n) != n) {
                                printf(2, "unable to write into file\n");
                                exit();
                            }
                        }
                    }
                    close(fd);
                    exit();
                }
            }
        }
        exit();
    }