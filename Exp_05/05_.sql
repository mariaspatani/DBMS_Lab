/* EXPERIMENT NO: 5 */
/* Creation of Student Table and Aggregate Queries */

/* a) Create Table */
CREATE TABLE STUDENT (
    Roll INT PRIMARY KEY,
    Name VARCHAR(50),
    Physics INT CHECK (Physics <= 25),
    Chemistry INT CHECK (Chemistry <= 25),
    Mathematics INT CHECK (Mathematics <= 50)
);

/* b) Insert 10 Values */
INSERT INTO STUDENT VALUES (1,'Anu',15,18,40);
INSERT INTO STUDENT VALUES (2,'Balu',10,14,30);
INSERT INTO STUDENT VALUES (3,'Cathy',20,22,45);
INSERT INTO STUDENT VALUES (4,'David',8,16,20);
INSERT INTO STUDENT VALUES (5,'Eva',12,12,25);
INSERT INTO STUDENT VALUES (6,'Farhan',25,24,48);
INSERT INTO STUDENT VALUES (7,'Gouri',14,10,35);
INSERT INTO STUDENT VALUES (8,'Hari',18,19,42);
INSERT INTO STUDENT VALUES (9,'Isha',5,8,15);
INSERT INTO STUDENT VALUES (10,'John',16,20,38);

/* Display Table */
SELECT * FROM STUDENT;


/* c) Class Average for Physics */
SELECT AVG(Physics) AS avg_physics FROM STUDENT;
SELECT * FROM STUDENT;


/* d) Highest Marks in Mathematics */
SELECT MAX(Mathematics) AS highest_marks_maths FROM STUDENT;
SELECT * FROM STUDENT;


/* e) Lowest Marks in Chemistry */
SELECT MIN(Chemistry) AS lowest_marks_chemistry FROM STUDENT;
SELECT * FROM STUDENT;


/* f) Total Students Passed in Physics */
SELECT COUNT(*) AS pass_physics
FROM STUDENT
WHERE Physics >= 12;
SELECT * FROM STUDENT;


/* g) Students Passed in All Subjects */
SELECT *
FROM STUDENT
WHERE Physics >= 12
AND Chemistry >= 12
AND Mathematics >= 25;
SELECT * FROM STUDENT;


/* h) Total Marks for Each Student */
SELECT Roll, Name,
(Physics + Chemistry + Mathematics) AS totalmark
FROM STUDENT;
SELECT * FROM STUDENT;


/* i) Class Average (Total Marks) */
SELECT AVG(Physics + Chemistry + Mathematics) AS class_average
FROM STUDENT;
SELECT * FROM STUDENT;


/* j) Total Students Who Passed All Subjects */
SELECT COUNT(*) AS total_pass_students
FROM STUDENT
WHERE Physics >= 12
AND Chemistry >= 12
AND Mathematics >= 25;
SELECT * FROM STUDENT;
