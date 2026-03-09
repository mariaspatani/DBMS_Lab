-- CREATE TABLES

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

INSERT INTO items VALUES
(1,'Samsung GalaxyS4','Mobile',6000,10),
(2,'Laptop Dell','Electronics',50000,5),
(3,'Headphones','Accessories',1500,20),
(4,'Keyboard','Accessories',800,15);

INSERT INTO customers VALUES
(1,'John','Delhi Street','Delhi'),
(2,'Mickey','Park Street','Mumbai'),
(3,'James','MG Road','Kerala'),
(4,'Jenny','Hill Road','Goa');

INSERT INTO orders VALUES
(101,1,1,1,'2014-01-10'),
(102,2,2,1,'2015-02-12'),
(103,3,3,2,'2012-03-05'),
(104,4,4,1,'2016-04-18');

INSERT INTO delivery VALUES
(201,1,101),
(202,2,102);


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


-- e) Name and price of items bought by Mickey
SELECT i.itemname, i.price
FROM items i
JOIN orders o ON i.itemid = o.itemid
JOIN customers c ON c.custid = o.custid
WHERE c.custname='Mickey';


-- f) Customers who ordered after Jan 2013 but not delivered
SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid=o.custid
WHERE o.orderdate > '2013-01-01'
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
WHERE custid = (
SELECT custid
FROM orders
GROUP BY custid
ORDER BY COUNT(orderid) DESC
LIMIT 1
);


-- k) Customers who purchased items exceeding price 5000
SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.custid=o.custid
JOIN items i ON o.itemid=i.itemid
WHERE i.price > 5000;


-- l) Customers who have not ordered Samsung GalaxyS4
SELECT custname,address
FROM customers
WHERE custid NOT IN
(
SELECT o.custid
FROM orders o
JOIN items i ON o.itemid=i.itemid
WHERE i.itemname='Samsung GalaxyS4'
);


-- m) Left outer join
SELECT *
FROM customers
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