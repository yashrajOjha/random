//part 1
#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/wait.h>
void main()
{
int pid;
pid=fork();
if (!pid)
{
printf("child process..");
printf("\n\n Child PID :%d",getpid());
printf("\nParent PID :%d",getppid());
printf("\n\nFinished with child\n");
}
else
{
wait(NULL);
printf("\nParent process");
printf("\nParent PID :%d",getpid());
printf("\nchild PID:%d",pid)
}
}

//part 2
#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/wait.h>
void main()
{
int pid;
pid=fork();
if (!pid)
{
printf("child process..");
printf("\n\n Child PID :%d",getpid());
printf("\nParent PID :%d",getppid());
printf("\n\nFinished with child\n");
}
else
{
printf("\nParent process");
printf("\nParent PID :%d",getpid());
printf("\nchild PID:%d",pid);
wait(NULL);
}
}
