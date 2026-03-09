CREATE TABLE items(
 itemid INT PRIMARY KEY,
 itemname VARCHAR(50),
 category VARCHAR(50),
 price INT,
 instock INT
);

CREATE TABLE customers(
 custid INT PRIMARY KEY,
 custname VARCHAR(50),
 address VARCHAR(100),
 state VARCHAR(50)
);

CREATE TABLE orders(
 orderid INT PRIMARY KEY,
 custid INT,
 itemid INT,
 quantity INT,
 orderdate DATE,
 FOREIGN KEY(custid) REFERENCES customers(custid),
 FOREIGN KEY(itemid) REFERENCES items(itemid)
);

CREATE TABLE delivery(
 deliveryid INT PRIMARY KEY,
 custid INT,
 orderid INT,
 FOREIGN KEY(custid) REFERENCES customers(custid),
 FOREIGN KEY(orderid) REFERENCES orders(orderid)
);
-- INSERT VALUES
INSERT INTO items VALUES (1,'Samsung Galaxy S21','Mobile',70000,10);
INSERT INTO items VALUES (2,'HP Laptop','Electronics',55000,5);
INSERT INTO items VALUES (3,'Boat Headphones','Accessories',2000,20);
INSERT INTO items VALUES (4,'Logitech Keyboard','Accessories',1200,15);

SELECT * FROM items;

INSERT INTO customers VALUES (1,'Arun','MG Road','Kerala');
INSERT INTO customers VALUES (2,'Rahul','Brigade Road','Bangalore');
INSERT INTO customers VALUES (3,'Anjali','Marine Drive','Kochi');
INSERT INTO customers VALUES (4,'Neha','Park Street','Kolkata');

SELECT * FROM customers;

INSERT INTO orders VALUES (101,1,1,1,DATE '2024-01-10');
INSERT INTO orders VALUES (102,2,2,1,DATE '2024-02-12');
INSERT INTO orders VALUES (103,3,3,2,DATE '2024-03-05');
INSERT INTO orders VALUES (104,4,4,1,DATE '2024-04-18');

SELECT * FROM orders;

INSERT INTO delivery VALUES (201,1,101);
INSERT INTO delivery VALUES (202,2,102);

SELECT * FROM delivery;

-- b) Customers who placed an order

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid = o.custid;



-- c) Customers whose orders delivered
SELECT DISTINCT c.*
FROM customers c
JOIN delivery d ON c.custid = d.custid;



-- d) Order date for customers whose name starts with J
SELECT o.orderdate
FROM orders o
JOIN customers c ON o.custid = c.custid
WHERE c.custname LIKE 'J%';


-- e) Name and price of items bought by Rahul
SELECT i.itemname, i.price
FROM items i
JOIN orders o ON i.itemid = o.itemid
JOIN customers c ON c.custid = o.custid
WHERE c.custname='Rahul';



-- f) Customers who ordered after Jan 2013 but not delivered

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid=o.custid
WHERE o.orderdate > DATE '2013-01-01'
AND c.custid NOT IN
(SELECT custid FROM delivery);



-- g) Itemid of items ordered or not delivered

SELECT itemid FROM orders
UNION
SELECT itemid FROM orders
WHERE orderid NOT IN (SELECT orderid FROM delivery);



-- h) Customers who placed order and received delivery
SELECT DISTINCT c.custname
FROM customers c
JOIN orders o ON c.custid=o.custid
JOIN delivery d ON o.orderid=d.orderid;



-- i) Customers who ordered but not delivered
SELECT DISTINCT c.custname
FROM customers c
JOIN orders o ON c.custid=o.custid
WHERE o.orderid NOT IN
(SELECT orderid FROM delivery);



-- j) Customer who placed the most orders

SELECT custname
FROM customers
WHERE custid =
(
SELECT custid
FROM
(
SELECT custid, COUNT(orderid) cnt
FROM orders
GROUP BY custid
ORDER BY cnt DESC
)
WHERE ROWNUM = 1
);



-- k) Customers who purchased items exceeding price 5000

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid=o.custid
JOIN items i ON o.itemid=i.itemid
WHERE i.price > 5000;



-- l) Customers who have not ordered Samsung Galaxy S21

SELECT custname,address
FROM customers
WHERE custid NOT IN
(
SELECT o.custid
FROM orders o
JOIN items i ON o.itemid=i.itemid
WHERE i.itemname='Samsung Galaxy S21'
);



-- m) Left outer join
SELECT * FROM customers
LEFT JOIN orders
ON customers.custid = orders.custid;



-- Right outer join

SELECT *
FROM customers
RIGHT JOIN orders
ON customers.custid = orders.custid;

-- n) Customers grouped by state
SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY state;

-- o) Items grouped by category having price greater than average price
SELECT category, AVG(price)
FROM items
GROUP BY category
HAVING AVG(price) >
(SELECT AVG(price) FROM items);
