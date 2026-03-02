/* EXPERIMENT NO: 5.2 */
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
INSERT INTO ITEMS VALUES (2,'Mobile','Electronics',20000,25);
INSERT INTO ITEMS VALUES (3,'Chair','Furniture',3000,50);
INSERT INTO ITEMS VALUES (4,'Table','Furniture',7000,20);
INSERT INTO ITEMS VALUES (5,'Pen','Stationery',20,200);
INSERT INTO ITEMS VALUES (6,'Notebook','Stationery',100,150);

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
INSERT INTO ORDERS VALUES (102,1,2,2,DATE '2024-01-02');
INSERT INTO ORDERS VALUES (103,1,3,1,DATE '2024-01-03');
INSERT INTO ORDERS VALUES (104,1,4,1,DATE '2024-01-04');
INSERT INTO ORDERS VALUES (105,1,5,5,DATE '2024-01-05');
INSERT INTO ORDERS VALUES (106,1,6,3,DATE '2024-01-06');  -- Customer 1 has 6 orders

INSERT INTO ORDERS VALUES (107,2,1,1,DATE '2024-01-07');
INSERT INTO ORDERS VALUES (108,3,2,1,DATE '2024-01-08');
INSERT INTO ORDERS VALUES (109,4,3,2,DATE '2024-01-09');
INSERT INTO ORDERS VALUES (110,5,4,1,DATE '2024-01-10');

SELECT * FROM ORDERS;


/* Insert values into DELIVERY */
INSERT INTO DELIVERY VALUES (201,1,101);
INSERT INTO DELIVERY VALUES (202,2,107);
INSERT INTO DELIVERY VALUES (203,3,108);
INSERT INTO DELIVERY VALUES (204,4,109);
INSERT INTO DELIVERY VALUES (205,5,110);

SELECT * FROM DELIVERY;


/* b) Details of all customers grouped by state */
SELECT state, COUNT(*) AS total_customers
FROM CUSTOMERS
GROUP BY state;


/* c) Items grouped by category having price > average price */
SELECT category, itemid, itemname, price
FROM ITEMS
WHERE price > (SELECT AVG(price) FROM ITEMS)
GROUP BY category, itemid, itemname, price;


/* d) Customer names having registered more than 5 orders */
SELECT C.custname, COUNT(O.orderid) AS total_orders
FROM CUSTOMERS C
JOIN ORDERS O ON C.custid = O.custid
GROUP BY C.custname
HAVING COUNT(O.orderid) > 5;
