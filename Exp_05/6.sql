/* EXPERIMENT NO: 6 */
/* Creation of Items, Customers, Orders and Delivery Tables */

/* Create ITEMS table */
CREATE TABLE ITEMS(
    itemid INT PRIMARY KEY,
    itemname VARCHAR(50),
    category VARCHAR(50),
    price INT,
    instock INT
);

/* Create CUSTOMERS table */
CREATE TABLE CUSTOMERS(
    custid INT PRIMARY KEY,
    custname VARCHAR(50),
    address VARCHAR(100),
    state VARCHAR(50)
);

/* Create ORDERS table */
CREATE TABLE ORDERS(
    orderid INT PRIMARY KEY,
    custid INT,
    itemid INT,
    quantity INT,
    orderdate DATE,
    FOREIGN KEY (custid) REFERENCES CUSTOMERS(custid),
    FOREIGN KEY (itemid) REFERENCES ITEMS(itemid)
);

/* Create DELIVERY table */
CREATE TABLE DELIVERY(
    deliveryid INT PRIMARY KEY,
    custid INT,
    orderid INT,
    FOREIGN KEY (custid) REFERENCES CUSTOMERS(custid),
    FOREIGN KEY (orderid) REFERENCES ORDERS(orderid)
);


/* a) Insert values into ITEMS */
INSERT INTO ITEMS VALUES (1,'Laptop','Electronics',50000,10);
INSERT INTO ITEMS VALUES (2,'Mobile','Electronics',20000,20);
INSERT INTO ITEMS VALUES (3,'Chair','Furniture',3000,50);
INSERT INTO ITEMS VALUES (4,'Table','Furniture',7000,15);
INSERT INTO ITEMS VALUES (5,'Pen','Stationery',20,200);

SELECT * FROM ITEMS;


/* Insert values into CUSTOMERS */
INSERT INTO CUSTOMERS VALUES (1,'Arun','TVM','Kerala');
INSERT INTO CUSTOMERS VALUES (2,'Meera','Kochi','Kerala');
INSERT INTO CUSTOMERS VALUES (3,'Rahul','Chennai','Tamil Nadu');
INSERT INTO CUSTOMERS VALUES (4,'Anjali','Bangalore','Karnataka');
INSERT INTO CUSTOMERS VALUES (5,'John','Hyderabad','Telangana');

SELECT * FROM CUSTOMERS;


/* Insert values into ORDERS */
INSERT INTO ORDERS VALUES (101,1,1,1,DATE '2024-01-01');
INSERT INTO ORDERS VALUES (102,2,2,2,DATE '2024-01-05');
INSERT INTO ORDERS VALUES (103,3,3,1,DATE '2024-01-10');
INSERT INTO ORDERS VALUES (104,1,4,1,DATE '2024-01-15');
INSERT INTO ORDERS VALUES (105,4,5,5,DATE '2024-01-20');

SELECT * FROM ORDERS;


/* Insert values into DELIVERY */
INSERT INTO DELIVERY VALUES (201,1,101);
INSERT INTO DELIVERY VALUES (202,2,102);
INSERT INTO DELIVERY VALUES (203,4,105);

SELECT * FROM DELIVERY;


/* b) Details of all customers who have placed an order */
SELECT DISTINCT C.*
FROM CUSTOMERS C
JOIN ORDERS O ON C.custid = O.custid;


/* c) Details of all customers whose orders have been delivered */
SELECT DISTINCT C.*
FROM CUSTOMERS C
JOIN DELIVERY D ON C.custid = D.custid;


/* d) Find the order date for all customers */
SELECT C.custname, O.orderdate
FROM CUSTOMERS C
JOIN ORDERS O ON C.custid = O.custid;
