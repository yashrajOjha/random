//part 1
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<string.h>
#include <fcntl.h>
void main()
{
char buff;
int fd, fd1;
fd=open("0ne.txt",O_RDONLY);
fd1=open("tw0.txt",O_WRONLY|O_CREAT);
while(read(fd,&buff, 1));
write(fd1,&buff, 1);
printf("The copy of a file is successed");
close(fd);
close(fd1);
}
//part 2
#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<fcntl.h>
int main (void)
{
int fd[2];
char buf1[12]="hello world";
char buf2[12];
fd[0]=open("foobar.txt",O_RDWR);
fd[1]=open("foobar.txt",O_RDWR);
write(fd[0],buf1,strlen(buf1));
write(1,buf2,read(fd[1],buf2,12));
close(fd[0]);
close(fd[1]);
return 0;
}
