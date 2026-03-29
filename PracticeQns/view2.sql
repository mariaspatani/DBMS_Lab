CREATE TABLE salesman(
    salesmanid INT PRIMARY KEY,
    salesname VARCHAR(50),
    city VARCHAR(50),
    commission number(4,2)
);
INSERT INTO salesman VALUES (1,'manu','london',0.12);
INSERT INTO salesman VALUES (2,'leena','new york',0.05);
INSERT INTO salesman VALUES (3,'kevin','uk',0.99);

CREATE TABLE customer(
    custid INT PRIMARY KEY,
    custname VARCHAR(50),
    city VARCHAR(50),
    salesmanid INT,
    FOREIGN KEY (salesmanid) references  salesman(salesmanid)
);

INSERT INTO customer values(101,'ramu','america',1);
INSERT INTO customer VALUES (102,'leena','london',2);
INSERT INTO customer VALUES(103,'kevin','uk',3);
INSERT INTO customer VALUES(104,'meenu','uk',3);

CREATE TABLE orders(
    orderid INT PRIMARY KEY,
    custid INT,
    salesmanid INT,
    amount NUMBER(10,2),
    FOREIGN KEY (custid) REFERENCES customer(custid),
    FOREIGN KEY (salesmanid) REFERENCES salesman(salesmanid)
);

INSERT INTO orders VALUES (201,101,1,5000);
INSERT INTO orders VALUES (202,102,2,3000);
INSERT INTO orders VALUES (203,103,3,7000);
INSERT INTO orders VALUES (204,104,3,9000);
INSERT INTO orders VALUES (205,101,1,2000);
--Create a view named ny_salesmen to display
--salesman_id, name, and commission of salesmen from New York.
CREATE VIEW my_salesman AS
SELECT salesmanid,salesname,commission from salesman 
where city='new york';
SELECT * from my_salesman;
--display all salesmen whose commission is greater than 0.12.
CREATE VIEW my_salesman1 AS
SELECT salesmanid,salesname,commission from salesman 
where commission>0.12;

SELECT * from my_salesman1;
--Create a view named customer_sales that shows:

--customer name
--salesman name
--order amount

--(Use JOIN between customers, salesman, and orders)
 CREATE VIEW customer_sales AS 
 SELECT c.custname,s.salesname,o.amount
 from customer c JOIN salesman s ON c.salesmanid=s.salesmanid
 JOIN orders o ON s.salesmanid=o.salesmanid

SELECT * from customer_sales;
--From the customer_sales view, 
--display the customer who has placed the highest order amount.
SELECT * from customer_sales
WHERE amount = (SELECT MAX(amount)from customer_sales);

SELECT *
FROM (
    SELECT *
    FROM customer_sales
    ORDER BY amount DESC
)
WHERE ROWNUM = 1;


