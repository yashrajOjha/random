show databases;

create database aero;

use aero;

show tables;

create table flight(flightno INT,frm VARCHAR(20),too VARCHAR(20),distance INT,departs VARCHAR(20),arrives VARCHAR(20),price REAL,PRIMARY KEY (flightno) );
CREATE TABLE aircraft(aircraftid INT,aircraftname VARCHAR(20),cruisingrange INT,PRIMARY KEY (aircraftid) );
create table employees(eid INT,ename VARCHAR(20),salary INT,PRIMARY KEY (eid) );
create table certified(eid INT,aircraftid INT,PRIMARY KEY (eid,aircraftid),FOREIGN KEY (eid) REFERENCES employees (eid),FOREIGN KEY (aircraftid) REFERENCES aircraft (aircraftid) );

INSERT INTO flight (flightno,frm,too,distance,departs,arrives,price) VALUES 
(1,'Bangalore','Mangalore',360,'10:45:00','12:00:00',10000),
(2,'Bangalore','Delhi',5000,'12:15:00','04:30:00',25000),
(3,'Bangalore','Mumbai',3500,'02:15:00','05:25:00',30000),
(4,'Delhi','Mumbai',4500,'10:15:00','12:05:00',35000),
(5,'Delhi','Frankfurt',18000,'07:15:00','05:30:00',90000),
(6,'Bangalore','Frankfurt',19500,'10:00:00','07:45:00',95000),
(7,'Bangalore','Frankfurt',17000,'12:00:00','06:30:00',99000);


INSERT INTO aircraft (aircraftid,aircraftname,cruisingrange) values 
        (123,'Airbus',1000),
        (302,'Boeing',5000),
        (306,'Jet01',5000),
        (378,'Airbus380',8000),
        (456,'Aircraft',500),
        (789,'Aircraft02',800),
        (951,'Aircraft03',1000);


INSERT INTO employees (eid,ename,salary) VALUES
        (1,'Ajay',30000),
        (2,'Ajith',85000),
        (3,'Arnab',50000),
        (4,'Harry',45000),
        (5,'Rohit',90000),
        (6,'James',75000),
        (7,'Sunil',100000);
INSERT INTO certified (eid,aircraftid) VALUES
        (1,123),
        (2,123),
        (1,302),
        (5,302),
        (7,302),
        (1,306),
        (2,306),
        (1,378),
        (2,378),
        (4,378),
        (6,456),
        (3,456),
        (5,789),
        (6,789),
        (3,951),
        (1,951),
        (1,789);

SELECT DISTINCT a.aircraftname FROM aircraft a,certified c,employees e WHERE a.aircraftid=c.aircraftid AND c.eid=e.eid AND NOT EXISTS(SELECT * FROM employees e1 WHERE e1.eid=e.eid AND e1.salary<80000);

SELECT c.eid,MAX(cruisingrange) FROM certified c,aircraft a WHERE c.aircraftid=a.aircraftid GROUP BY c.eid HAVING COUNT(*)>3;

SELECT a.aircraftid,a.aircraftname,AVG(e.salary) FROM aircraft a,certified c,employees e WHERE a.aircraftid=c.aircraftid AND c.eid=e.eid AND a.cruisingrange>1000 GROUP BY a.aircraftid,a.aircraftname;

SELECT DISTINCT e.ename FROM employees e,aircraft a,certified c WHERE e.eid=c.eid AND c.aircraftid=a.aircraftid AND a.aircraftname='Boeing';

SELECT a.aircraftid FROM aircraft a WHERE a.cruisingrange> (SELECT MIN(f.distance) FROM flight f WHERE f.frm="Bangalore" AND f.too="Delhi");