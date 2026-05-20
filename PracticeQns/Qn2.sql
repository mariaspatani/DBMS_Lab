CREATE TABLE STUDENT(
    regno NUMBER PRIMARY KEY,
    name VARCHAR2(20),
    gender VARCHAR2(10),
    dob DATE,
    course VARCHAR2(10)
);
CREATE TABLE MARKS(
    regno NUMBER,
    subject_code VARCHAR2(10),
    marks NUMBER,
    FOREIGN KEY (regno) REFERENCES STUDENT(regno)
);
INSERT INTO STUDENT VALUES(101,'ARUN','M','12-JAN-2004','MCA');
INSERT INTO STUDENT VALUES(102,'BINA','F','15-FEB-2004','BCA');
INSERT INTO STUDENT VALUES(103,'CYRIL','M','20-MAR-2004','CSE');
INSERT INTO STUDENT VALUES(104,'DIYA','F','25-APR-2004','MCA');
INSERT INTO STUDENT VALUES(105,'EBIN','M','30-MAY-2004','CSE');

INSERT INTO MARKS VALUES(101,'DBMS',85);
INSERT INTO MARKS VALUES(102,'JAVA',90);
INSERT INTO MARKS VALUES(103,'OS',75);
INSERT INTO MARKS VALUES(104,'CN',88);
INSERT INTO MARKS VALUES(105,'DBMS',92);

UPDATE STUDENT 
SET course='BCA'
where regno=101;
select * from student;

DELETE FROM MARKS
where regno IN (
    SELECT regno from
    STUDENT where course='CSE'
);
DELETE FROM
STUDENT where
course='CSE';
--display average marks of each course
SELECT s.course, AVG(m.marks) AS average_marks
FROM STUDENT s
JOIN MARKS m
ON s.regno = m.regno
GROUP BY s.course;
--display average marks of each subject
SELECT subject_code, AVG(marks) as total_avg
FROM marks
group by subject_code;
--Find student who scored highest mark.

SELECT s.regno ,s.name,m.marks FROM
 student s JOIN marks m 
 ON s.regno=m.regno 
 AND m.marks=(
    SELECT max(marks) 
    from marks
 );

--Find students whose marks are greater than average marks.
--subquery needed
--ON → join condition
--WHERE → filtering condition
--here where and and use cheythalum same result will get
select s.regno,s.name,m.marks
from student s JOIN marks m
ON s.regno=m.REGNO
WHERE m.marks > (
    SELECT AVG(marks)
    from marks
);
--Delete students studying in MCA
--firat delete child then parent
DELETE FROM MARKS 
WHERE REGNO IN (
    SELECT regno
    FROM Student where 
    course='MCA'
);
--now delete parent
DELETE FROM student 
where course='MCA';


--Delete marks of students studying in CSE.
--first select the student who sty cse
DELETE FROM MARKS
WHERE regno IN(
    SELECT regno FROM student
    where course='CSE'
);
--Create a VIEW containing regno, name, subject and marks
CREATE VIEW V1
AS SELECT s.regno ,s.name,m.subject_code,m.marks
FROM student s JOIN marks m
ON s.regno=m.regno;
SELECT * FROM V1;






