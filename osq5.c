//FCFS
#include<stdio.h>
int main()
{
int n,bt[20],wt[20],tat[20],avwt=0,avtat=0,i,j;
printf("Enter total number of processes(maximum
20):");
scanf("%d",&n);
printf("\nEnter Process Burst Time\n");
for(i=0;i<n;i++)
{
printf("P[%d]:",i+1);
scanf("%d",&bt[i]);
}
wt[0]=0; //waiting time for first process is 0
//calculating waiting time
for(i=1;i<n;i++)
{
wt[i]=0;
for(j=0;j<i;j++)
wt[i]= wt[i]+bt[j];
}
printf("\nProcess\t\tBurst Time\tWaiting
Time\tTurnaround Time");
//calculating turnaround time
for(i=0;i<n;i++)
{
tat[i]=bt[i]+wt[i];
avwt+=wt[i];
avtat+=tat[i];
printf("\nP[%d]\t\t%d\t\t%d\t\t%d",i+1,bt[i],wt[i]
,tat[i]);
}
avwt/=n;
avtat/=n;
printf("\n\nAverage Waiting Time:%d",avwt);
printf("\nAverage Turnaround Time:%d",avtat);
return 0;
}
       
//SJF
#include<stdio.h>
void main()
{
int bt[20],p[20],wt[20],tat[20],i,j,n,total=0,
total1=0,pos,temp;
float avg_wt,avg_tat;
printf("Enter number of process:");
scanf("%d",&n);
printf("\nEnter Burst Time:\n");
for(i=0;i<n;i++)
{
printf("p%d:",i+1);
scanf("%d",&bt[i]);
p[i]=i+1; //contains process number
}
//sorting burst time in ascending order using selection
sort
for(i=0;i<n;i++)
{
pos=i;
for(j=i+1;j<n;j++)
{
if(bt[j]<bt[pos])
pos=j;
}
temp=bt[i];
bt[i]=bt[pos];
bt[pos]=temp;
temp=p[i];
p[i]=p[pos];
p[pos]=temp;
}
wt[0]=0; //waiting time for first process will be zero
//calculate waiting time
for(i=1;i<n;i++)
{
wt[i]=0;
for(j=0;j<i;j++)
wt[i]+=bt[j];
total+=wt[i];
}
printf("\nProcess\t Burst Time \tWaiting
Time\tTurnaround
Time");
for(i=0;i<n;i++)
{
tat[i]=bt[i]+wt[i]; //calculate turnaround time
total+=tat[i];
printf("\np%d\t\t %d\t\t%d\t\t\t%d",p[i],bt[i],wt[i],tat[i]);
}
avg_wt=(float)total/n; //average waiting time
avg_tat=(float)total1/n; //average turnaround time
printf("\n\nAverage Waiting Time=%f",avg_wt);
printf("\nAverage Turnaround Time=%f\n",avg_tat);
}     

//Priority
#include<stdio.h>
int main()
{
int
bt[20],p[20],wt[20],tat[20],pr[20],i,j,n,total=0,
total1=0,pos,temp,avg_wt,avg_tat;
printf("Enter Total Number of Process:");
scanf("%d",&n);
printf("\nEnter Burst Time and Priority\n");
for(i=0;i<n;i++)
{
printf("\nP[%d]\n",i+1);
printf("Burst Time:");
scanf("%d",&bt[i]);
printf("Priority:");
scanf("%d",&pr[i]);
p[i]=i+1; //contains process number
}
//sorting burst time, priority and process number in
ascending order
using selection sort
for(i=0;i<n;i++)
{
pos=i;
for(j=i+1;j<n;j++)
{
if(pr[j]<pr[pos])
pos=j;
}
temp=pr[i];
pr[i]=pr[pos];
pr[pos]=temp;
temp=bt[i];
bt[i]=bt[pos];
bt[pos]=temp;
temp=p[i];
p[i]=p[pos];
p[pos]=temp;
}
wt[0]=0; //waiting time for first process is zero
//calculate waiting time
for(i=1;i<n;i++)
{
wt[i]=0;
for(j=0;j<i;j++)
wt[i]+=bt[j];
total+=wt[i];
}
printf("\nProcess\t Burst Time \tWaiting
Time\tTurnaround
Time");
for(i=0;i<n;i++)
{
tat[i]=bt[i]+wt[i]; //calculate turnaround time
total1+=tat[i];
printf("\nP[%d]\t\t %d\t\t
%d\t\t\t%d",p[i],bt[i],wt[i],tat[i]);
}
avg_wt=total/n; //average waiting time
avg_tat=total1/n; //average turnaround time
printf("\n\nAverage Waiting Time=%d",avg_wt);
printf("\nAverage Turnaround Time=%d\n",avg_tat);
return 0;
}
       
//Round Robin
#include<stdio.h>
int main()
{
int i,tbt=0,nop,ts=0,flag[20],rem[20];
int from,wt[20],tt[20],b[20],twt=0,ttt=0;
int dur;
float awt,att;
printf("Enter no.of Processes:");
scanf("%d",&nop);
printf("Enter the time slice:");
scanf("%d",&ts);
printf("Enter the Burst times..\n");
for(i=0;i<nop;i++)
{
wt[i]=tt[i]=0;
printf("P%d\t:",i+1);
scanf("%d",&b[i]); // Reading Burst Time
rem[i]=b[i]; // Store the Burst Time in rem array
tbt+=b[i]; // Total Burst Time
flag[i]=0; // used to check whether the process has
remaining
burst time or not
}
from=0;
i=0;
printf("\n\tGantt Chart");
printf("\nProcessID \t From Time\tTo Time\n");
while(from<tbt)
{
if(!flag[i]) //true only when process has burst time
{
if(rem[i]<=ts) //brust time should be equal or less
than time slice
{
dur=rem[i];
flag[i]=1; // make the value false
tt[i]=dur+from;
wt[i]=tt[i]-b[i]; // subtract
}
else
dur=ts;
printf("%7d%15d%15d\n",i+1,from,from+dur);
rem[i]= rem[i]-dur;
from = from+dur;
}
i=(i+1)%nop;
}
for(i=0;i<nop;i++)
{
twt+=wt[i];
ttt+=tt[i];
}
printf("\n\nProcess ID\tWaiting Time\tTurn Around
Time");
for(i=0;i<nop;i++)
{
printf("\n\t%d\t\t%d\t\t%d",i+1,wt[i],tt[i]);
}
awt=(float)twt/(float)nop;
att=(float)ttt/(float)nop;
printf("\nTotal Waiting Time:%d",twt);
printf("\nTotal TurnAround Time:%d",ttt);
printf("\nAverage Waiting Time:%.2f",awt);
printf("\nAverage Turn Around Time:%.2f\n",att);
return 0;
}
      
