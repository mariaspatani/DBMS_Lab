CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    join_date DATE
);

CREATE TABLE borrowings (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE
);
-- Books (4 books)
INSERT INTO books VALUES 
(1, 'SQL Basics', 'Tech', 250.00),
(2, 'Python Guide', 'Tech', 300.00),
(3, 'Fiction Tales', 'Fiction', 150.00),
(4, 'Math Advanced', 'Tech', 400.00);

-- Members (4 members)
INSERT INTO members VALUES
(101, 'Priya', 'Chennai', '2025-01-10'),
(102, 'Arun', 'Mumbai', '2025-02-15'),
(103, 'Lakshmi', 'Chennai', '2025-03-01'),
(104, 'Vikram', 'Delhi', '2025-01-20');

-- Borrowings (5 records)
INSERT INTO borrowings VALUES
(1, 101, 1, '2025-03-01', NULL),    -- Priya borrowed SQL Basics (not returned)
(2, 102, 2, '2025-03-05', '2025-03-20'), -- Arun borrowed Python Guide (returned)
(3, 101, 3, '2025-03-10', NULL),    -- Priya borrowed Fiction Tales (not returned)
(4, 103, 1, '2025-03-12', NULL),    -- Lakshmi borrowed SQL Basics (not returned)
(5, 102, 4, '2025-03-15', NULL);    -- Arun borrowed Math Advanced (not returned)

-- Display all books with price > 200
SELECT * from books 
where price>200;

-- Count total members from Chennai
SELECT COUNT(*) AS total_members
from members where city ='Chennai';

-- Find average book price
SELECT AVG(price) AS avg_price
from books;

-- Show highest price book as top_price_book
SELECT MAX(price) AS top_price_book
from books;

-- List members who joined in 2025
SELECT name from members 
WHERE join_date LIKE '2025%';

-- part2 join questions
-- List member names and book titles they borrowed
SELECT m.name,b.title
from members m JOIN borrowings br ON m.member_id=br.member_id
JOIN books b ON br.book_id= b.book_id; 

-- Show books that have NEVER been borrowed
SELECT title from books where book_id NOT IN(SELECT book_id from borrowings);

-- Display members with no borrowings (use LEFT JOIN)
SELECT m.name
from members m LEFT JOIN borrowings br
ON m.member_id=br.member_id WHERE br.member_id IS NULL ;

-- Find total books borrowed by each member (name them total_borrowed)
SELECT m.name,
COUNT(*)  AS total_borrowed from members m  JOIN borrowings b ON m.member_id=b.member_id 
GROUP BY m.member_id,m.name ;

-- List Chennai members and their borrowed books
SELECT m.name, b.title
from members m JOIN borrowings br ON m.member_id=br.member_id 
JOIN books b ON br.book_id=b.book_id
WHERE m.city='Chennai';
