1.sql
-- Create a function to calculate factorial
CREATE OR REPLACE FUNCTION factorial(n IN NUMBER)
RETURN NUMBER
IS
    fact NUMBER := 1;  -- Initialize factorial value
BEGIN
    -- Loop from 1 to n
    FOR i IN 1..n LOOP
        fact := fact * i;  -- Multiply each number
    END LOOP;

    RETURN fact;  -- Return result
END;
/

-- Anonymous block to call function and display result
DECLARE
    num NUMBER;       -- Variable to store input
    result NUMBER;    -- Variable to store output
BEGIN
    num := &num;  -- Take input from user

    result := factorial(num);  -- Call function

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || result);
END;
/

2.sql
-- Create table
CREATE TABLE student_details (
    roll NUMBER,
    marks NUMBER,
    phone NUMBER
);

-- Insert sample data
INSERT INTO student_details VALUES (1, 80, 9876543210);
INSERT INTO student_details VALUES (2, 70, 9876501234);
INSERT INTO student_details VALUES (3, 90, 9876512345);

-- Display initial table
SELECT * FROM student_details;

-- Create procedure to increase marks by 5%
CREATE OR REPLACE PROCEDURE pr1 IS
BEGIN
    -- Update marks by adding 5%
    UPDATE student_details
    SET marks = marks * 1.05;

    -- Display message
    DBMS_OUTPUT.PUT_LINE('Marks boosted by 5% for all students');
END;
/

-- Execute procedure
EXEC pr1;

-- Display updated table
SELECT * FROM student_details;

3.sql
-- Create table
CREATE TABLE student (
    id NUMBER,
    name VARCHAR2(30),
    m1 NUMBER,
    m2 NUMBER,
    m3 NUMBER,
    total NUMBER,
    grade VARCHAR2(2)
);



INSERT INTO student (id, name, m1, m2, m3) VALUES (1, 'Akhil', 85, 78, 90);
INSERT INTO student (id, name, m1, m2, m3) VALUES (2, 'Rahul', 60, 72, 68);
INSERT INTO student (id, name, m1, m2, m3) VALUES (3, 'Sneha', 95, 88, 92);

-- Display initial table
SELECT * FROM student;

--------------------------------------------------
-- Function to calculate grade based on total
--------------------------------------------------
CREATE OR REPLACE FUNCTION f1(total IN NUMBER)
RETURN VARCHAR2
IS
    g VARCHAR2(2);
BEGIN
    IF total >= 270 THEN
        g := 'A';
    ELSIF total >= 240 THEN
        g := 'B';
    ELSIF total >= 200 THEN
        g := 'C';
    ELSE
        g := 'F';
    END IF;

    RETURN g;
END;
/

--------------------------------------------------
-- Procedure to update total and grade
--------------------------------------------------
CREATE OR REPLACE PROCEDURE p1 IS
BEGIN
    -- Update total and grade using function
    UPDATE student
    SET total = m1 + m2 + m3,
        grade = f1(m1 + m2 + m3);

    DBMS_OUTPUT.PUT_LINE('Total and Grade updated for all students');
END;
/

-- Execute procedure
EXEC p1;

-- Display updated table
SELECT * FROM student;
