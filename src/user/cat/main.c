#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BUFSIZE 512

char buf[BUFSIZE];

void cat(int fd)
{
    int n;      // 每次读取长度

    while ((n = read(fd, buf, BUFSIZE)) > 0)
    {
        if (write(1, buf, n) != n)
        {
            printf(stderr, "cat: write error\n");
            exit(1);
        }
    }
    if (n < 0)
    {
        printf(stderr, "cat: read error\n");
        exit(1);
    }
}

int main(int argc, char *argv[])
{
    int fd;

    if(argc <= 1) {
        cat(0);
        exit(0);
    }
    for(int i = 1; i < argc; i++) {
        if ((fd = open(argv[i], 0)) < 0)
        {
            printf(stderr, "cat: can't open %s: %s\n", argv[i], strerror(errno));
            exit(1);
        }
        cat(fd);
        // write(STDOUT_FILENO, "\n", 1);
        close(fd);
    }
    
    exit(0);

    return 0;
}