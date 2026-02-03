/*
Create a table named company that contains company_id,name_of_company,address,email_id  and phone number.
Insert 5 values into the table.
Rename table compnay into another name
.Rename phone number with another name. 
Add 2 new columns DOB and gender.
select name and address from table. 
Remove the column DOB and gender*/
CREATE TABLE company(
  company_id INT PRIMARY KEY,
  company_name VARCHAR(50),
  address VARCHAR(50),
  email_id VARCHAR(50),
  phone_no INT
);
INSERT INTO company VALUES
(1, 'Google', 'California', 'contact@google.com', 9876543210);
INSERT INTO company VALUES
(2, 'Microsoft', 'Washington', 'info@microsoft.com', 9123456780);
INSERT INTO company VALUES
(3, 'Apple', 'California', 'support@apple.com', 9012345678);
INSERT INTO company VALUES
(4, 'Amazon', 'Seattle', 'help@amazon.com', 9988776655);
INSERT INTO company VALUES
(5, 'Facebook', 'California', 'admin@facebook.com', 8899001122);

SELECT * FROM company;

ALTER TABLE company RENAME TO organization;

ALTER TABLE organization RENAME COLUMN phone_no TO contact_no;
SELECT * FROM organization;

ALTER TABLE organization add(DOB DATE, gender VARCHAR(20));
SELECT * FROM organization;

SELECT company_name, address FROM organization;

ALTER TABLE organization DROP COLUMN DOB;
ALTER TABLE organization DROP COLUMN gender;
SELECT * FROM organization;
