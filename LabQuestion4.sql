show databases;

create database lq4;

use lq4;

CREATE TABLE department (dno VARCHAR (20),dname VARCHAR (20),mgstrdate DATE, primary Key (dno));
CREATE TABLE employee(ssn VARCHAR (20) PRIMARY KEY,firstname VARCHAR(20),lastname VARCHAR(20),address VARCHAR (20),sex CHAR (1),salary INTEGER,dno varchar(20),FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO) ON DELETE SET NULL);
ALTER TABLE department ADD mgrssn VARCHAR(10) REFERENCES employee (ssn);
CREATE TABLE dlocation(dloc VARCHAR (20),dno varchar(20),FOREIGN KEY (dno) REFERENCES department (dno),PRIMARY KEY (dno, dloc));
CREATE TABLE project (pno INTEGER PRIMARY KEY,pname VARCHAR(20),plocation VARCHAR (20),dno varchar(20),FOREIGN KEY (dno) REFERENCES department (dno));
CREATE TABLE workson(hours INT (4),pno integer,ssn Varchar(20),FOREIGN KEY (ssn) REFERENCES employee (ssn),FOREIGN KEY (pno) REFERENCES project(pno),PRIMARY KEY (ssn, pno));


INSERT INTO EMPLOYEE (SSN, FIRSTNAME, LASTNAME, ADDRESS, SEX, SALARY,DNO) VALUES
('EA01','JOHN','SCOTT','BANGALORE','M', 450000,'D01'),
('EA02','JAMES','SMITH','BANGALORE','M', 500000,'D02'),
('EA03','HEARN','BAKER','BANGALORE','M', 700000,'D03'),
('EA04','EDWARD','SCOTT','MYSORE','M', 500000,'D04'),
('EA05','PAVAN','HEGDE','MANGALORE','M', 650000,'D01'),
('EA06','GIRISH','Shetty','MYSORE','M', 450000,'D02'),
('EA07','NEHA','SN','BANGALORE','F', 800000,'D02'),
('EA08','AMULYA','K','MANGALORE','F', 350000,'D04');

INSERT INTO DLOCATION VALUES ('BANGALORE', 'D01'),
('BANGALORE', 'D02'),
('MANGALORE', 'D03'),
('Mysore','D04');

INSERT INTO PROJECT VALUES (100,'IOT','BANGALORE','D01'); 
INSERT INTO PROJECT VALUES (101,'CLOUD','BANGALORE','D02'); 
INSERT INTO PROJECT VALUES (102,'BIGDATA','MANGALORE','D03'); 
INSERT INTO PROJECT VALUES (103,'SENSORS','MANGALORE','D03');

INSERT INTO PROJECT VALUES (104,'Machine learning','Mysore','D04'); 
INSERT INTO PROJECT VALUES (105,'Networks','Mysore','D04');

INSERT INTO WORKSON VALUES (4, '100','EA01');
INSERT INTO WORKSON VALUES (6, 101,'EA01');
INSERT INTO WORKSON VALUES (8, 102,'EA02');
INSERT INTO WORKSON VALUES (10,100, 'EA02');
INSERT INTO WORKSON VALUES (3, 100,'EA03');
INSERT INTO WORKSON VALUES (4, 101,'EA04');
INSERT INTO WORKSON VALUES (5, 102,'EA05');
INSERT INTO WORKSON VALUES (6, 103,'EA06');
INSERT INTO WORKSON VALUES (7, 104,'EA07');
INSERT INTO WORKSON VALUES (5, 105,'EA08');

Select * from employee where salary > 500000 order by SSN DESC;

SELECT count(*), p.pname FROM employee e, workson w, project p WHERE e.ssn=w.ssn AND w.pno=p.pno group by pname;

SELECT e.firstname, e.lastname, 1.1*e.salary AS incrsal FROM employee e, workson w, project p WHERE e.ssn = w.ssn AND w.pno = p.pno AND p.pname='IOT';

SELECT SUM(e.salary), MAX(e.salary), MIN(e.salary), AVG(e.salary) FROM employee e, department d WHERE e.dno=d.dno AND d.dname='Dept2';

SELECT d.dno, COUNT(*) FROM department d, employee e WHERE d.dno=e.dno AND e.salary>600000 AND D.DNO IN (SELECT E1.DNO FROM employee e1 GROUP BY e1.dno HAVING COUNT(*)>2)GROUP BY d.dno;







