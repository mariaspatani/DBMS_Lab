--/* Create & Query View

--Create a view to display all customers from London.

-- Table: customers(customer_id, cust_name, city)

--Task:

--Create view london_customers
--Display all records from the view

CREATE TABLE customer(
    custid INT PRIMARY KEY,
    custname VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customer values(1,'ramu','america');
INSERT INTO customer VALUES (2,'leena','london');
INSERT INTO customer VALUES(3,'kevin','uk');

CREATE VIEW london_customer AS
SELECT custname,custid from customer
where city='london';

SELECT *FROM london_customer;
--Filter Using View

--Create a view to show orders where amount > 500
-- Table: orders(order_id, customer_id, amount)

CREATE TABLE orders(
    orderid INT primary key,
    custid INT,
    amount INT,
    FOREIGN KEY (custid) references customer(custid)
);

INSERT INTO orders VALUES (101,1,100);
INSERT INTO orders VALUES (102,1,200);
INSERT INTO orders VALUES (103,3,500);
INSERT INTO orders VALUES (104,2,700);
INSERT INTO orders VALUES (105,1,1000);

CREATE VIEW order_view AS
SELECT c.custname,d.orderid
from
customer c JOIN orders d
ON c.custid=d.custid 
where d.amount>500;

SELECT * from order_view;
