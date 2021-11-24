create database orders;

use orders;

CREATE TABLE salesman ( salesmanid INT (4), salesmanname VARCHAR (20), city VARCHAR (20), commission VARCHAR (20), PRIMARY KEY (salesmanid));

CREATE TABLE customer (customerid INT (4),customername VARCHAR (20), city VARCHAR (20), grade INT (3), salesmanid int (4),PRIMARY KEY (customerid), FOREIGN KEY (salesmanid) REFERENCES salesman (salesmanid) ON DELETE SET NULL); 

CREATE TABLE orders1 (orderno INT (5), purchaseamt DECIMAL (10, 2), orddate DATE, customerid int,salesmanid int,PRIMARY KEY (orderno),FOREIGN KEY (customerid) REFERENCES customer (customerid) ON DELETE CASCADE, FOREIGN KEY (salesmanid) REFERENCES salesman (salesmanid) ON DELETE CASCADE);

#entering values
INSERT INTO salesman VALUES (1000, 'JOHN','BANGALORE','25%'),(2000, 'RAVI','BANGALORE','20%'), (3000, 'KUMAR','MYSORE','15%'),(4000, 'SMITH','DELHI','30%'),(5000, 'HARSHA','HYDRABAD','15%'); 
INSERT INTO customer VALUES (10, 'PREETHI','BANGALORE', 100, 1000),(11, 'VIVEK','MANGALORE', 300, 1000),(12,'BHASKAR','CHENNAI', 400, 2000),(13, 'CHETHAN','BANGALORE', 200, 2000),(14, 'MAMATHA','BANGALORE', 400, 3000); 
INSERT INTO orders1 VALUES (50, 5000, '2017-05-17', 10, 1000),(51, 450, '2017-01-20', 10, 2000),(52, 1000, '2017-02-24', 13, 2000),(53, 3500, '2017-04-13', 14, 3000),(54, 550, '2017-03-09', 12, 2000);

SELECT grade, COUNT(DISTINCT customerid) FROM customer GROUP BY grade HAVING grade > (SELECT AVG(grade) FROM customer WHERE city='BANGALORE');

SELECT salesmanid, salesmanname FROM salesman A WHERE 1 < (SELECT COUNT(*) FROM customer WHERE salesmanid=A.salesmanid);

SELECT salesman.salesmanid, salesmanname, customername, commission FROM salesman, customer WHERE salesman.city = customer.city UNION SELECT salesmanid, salesmanname, 'NO MATCH', commission FROM salesman WHERE NOT city = ANY (SELECT city FROM customer) ORDER BY 2 DESC;

CREATE VIEW sho AS SELECT B.orddate, A.salesmanid, A.salesmanname FROM salesman A, orders1 B WHERE A.salesmanid = B.salesmanid AND B.purchaseamt=(SELECT MAX(purchaseamt) FROM orders1 C WHERE C.orddate = B.orddate);
SELECT * FROM sho;

DELETE FROM salesman WHERE salesmanid=1000;
SELECT * FROM salesman;

