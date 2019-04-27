#include "types.h"
#include "fcntl.h"
#include "stat.h"
#include "user.h"
#include "fs.h"


int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf(2, "cp: too many or less args\n");
        exit();
    }
    char buf[512];
    int fd1,fd2,n;
    struct stat st;

    if((fd1 = open(argv[1], O_RDONLY)) < 0){
        printf(2, "cp: Cannot open %s\n", argv[1]);
        exit();
    }

    if(fstat(fd1, &st) < 0){
        printf(2, "cp: Cannot stat %s\n", argv[1]);
        close(fd1);
        exit();
    }
    if (st.type == T_FILE)
    {
        if((fd2 = open(argv[2], O_CREATE)) < 0){
            close(fd2);
            close(0);
            if((fd2 = open(argv[2], O_WRONLY) < 0)){
            printf(2, "cp: Cannot open %s\n", argv[2]);
            exit();
        }
        }
        close(fd2);
        close(0);
        if((fd2 = open(argv[2], O_WRONLY) < 0)){
            printf(2, "cp: Cannot open %s\n", argv[2]);
            exit();
        }
        for(;;) {
            if((n = read(fd1,buf,sizeof(buf))) < 0)
            {
                printf(2,"cp: Error while copying contents1\n");
                exit();
            }
            if(n == 0)
            {
                break;
            }
            if(write(fd2,buf,n) != n)
            {
                printf(2,"cp: Error while copying contents2\n");
                exit();
            }
        }
        close(fd2);
    }
    else
    {
        printf(2, "cp: invalid args");
    }
    close(fd1);
    exit();
}