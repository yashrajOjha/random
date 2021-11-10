create database question2;

#creating table
use question2;

#creating tables 
create table publisher(publishername varchar(20) primary key, phoneno bigint, address varchar(40));
create table book(bookid int(10) primary key, title varchar(20), pubyear year, publishername varchar(20), foreign key (publishername) references publisher(publishername) on delete cascade); 
create table bookauthor(authorname varchar(20), bookid int, foreign key (bookid) references book(bookid) on delete cascade);
create table librarybranch(branchid int primary key, branchname varchar(20), address varchar(40));
create table bookcopies(noofcopies int, bookid int, branchid int, foreign key(bookid) references book(bookid) on delete cascade, primary key (bookid,branchid));
create table card(cardno int primary key);
create table booklending(dateout date, duedate date, bookid int, branchid int, cardno int, foreign key(bookid) references book(bookid) on delete cascade, foreign key(branchid) references librarybranch(branchid) on delete cascade, foreign key (cardno) references card(cardno) on delete cascade, primary key (bookid, branchid, cardno));

desc publisher;
desc book;
desc bookauthor;
desc librarybranch;
desc bookcopies;
desc booklending;

#inserting values 
insert into publisher values("McGraw-Hill",9989076587,"Bangalore"),
("Pearson",9889076565, "New Delhi"),
("Jaico",745567935, "Hyderabad"),
("Livre",8970862340, "Chennai"),
("Planeta",7756120238, "Bangalore");

insert into book values(1,"DBMS","2017","McGraw-Hill"),
(2,"ADBMS","2016","McGraw-Hill"),
(3,"CN","2016","Pearson"),
(4,"CG","2015","Planeta"),
(5,"OS","2016","Pearson");

insert into bookauthor values("Navathe",1),
("Navathe",2),
("Tanebaum",3),
("Edward Angel",4),
("Galvin",5);

insert into librarybranch values(10,"Branch1","Bangalore"),
(11,"Branch2","Bangalore"),
(12,"Branch3","Bangalore"),
(13,"Branch4","Mangalore"),
(14,"Branch5","Mysore");

insert into bookcopies values(10,1,10),
(5,1,11),
(2,2,12),
(5,2,13),
(7,3,14),
(1,5,10),
(3,4,11);

insert into card values(100),(101),(102),(103),(104);

insert into booklending values("2017-01-21","2017-06-21",1,10,101),
("2017-02-19","2017-07-19",3,14,101),
("2017-02-26","2017-07-26",2,13,101),
("2017-03-15","2017-09-15",4,11,101),
("2017-04-12","2017-10-12",1,11,104);

select * from book;

select B.bookid, B.title, B.publishername, A.authorname, C.noofcopies, L.branchid from book B, bookauthor A, bookcopies C, librarybranch L where B.bookid = A.bookid and B.bookid = C.bookid and L.branchid = C.branchid;

select cardno from booklending where dateout between "2017-01-21" and "2017-09-15" group by cardno having count(*) >3;

delete from book where bookid=3;

select * from book;

create view vpublication as select pubyear from book;
select * from vpublication;

create view vkook as select B.bookid, B.title, C.noofcopies from book B, bookcopies C, librarybranch L where B.bookid = C.bookid and C.branchid = L.branchid;
select * from vkook;

select  B.bookid, B.title, B.publishername, A.authorname, sum(noofcopies) from book B, bookauthor A, bookcopies C, librarybranch L where B.bookid = A.bookid and B.bookid = C.bookid and L.branchid = C.branchid group by bookid order by bookid desc;

select  B.bookid, B.title, B.publishername, A.authorname, sum(noofcopies) from book B, bookauthor A, bookcopies C, librarybranch L where B.bookid = A.bookid and B.bookid = C.bookid and L.branchid = C.branchid group by bookid having sum(noofcopies)>2 order by bookid;

select bookid, pubyear from book where pubyear like "2016";