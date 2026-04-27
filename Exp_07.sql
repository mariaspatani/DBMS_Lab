-- DROP TABLE (optional if table already exists)
DROP TABLE bank;
-- CREATE TABLE
CREATE TABLE bank(
 bank_name VARCHAR2(50),
 head_office VARCHAR2(50),
 branch VARCHAR2(50),
 branch_code NUMBER
);
-- INSERT VALUES
INSERT INTO bank VALUES('SBI','Mumbai','Trivandrum',101);
INSERT INTO bank VALUES('HDFC','Mumbai','Kochi',102);
INSERT INTO bank VALUES('ICICI','Delhi','Chennai',103);
-- VIEW TABLE
SELECT * FROM bank;
-- COMMIT COMMAND
COMMIT;
-- INSERT MORE VALUES
INSERT INTO bank VALUES('AXIS','Mumbai','Bangalore',104);
INSERT INTO bank VALUES('CANARA','Bangalore','Mysore',105);

-- CREATE SAVEPOINT
SAVEPOINT sp1;
-- INSERT ANOTHER VALUE
INSERT INTO bank VALUES('PNB','Delhi','Kolkata',106);

-- CHECK TABLE
SELECT * FROM bank;
-- ROLLBACK TO SAVEPOINT
ROLLBACK TO sp1;
-- CHECK TABLE AFTER ROLLBACK
SELECT * FROM bank;
-- FINAL COMMIT
COMMIT;
-- DCL COMMANDS
-- GRANT PRIVILEGES
GRANT SELECT ON Bank TO PUBLIC;

REVOKE SELECT ON Bank FROM PUBLIC;

CREATE TABLE Branch(
 BranchID INT PRIMARY KEY,
 BranchName VARCHAR2(50),
 BankCode INT
);

INSERT INTO Branch VALUES (101,'Kottayam',1);
INSERT INTO Branch VALUES (102,'Thrissur',2);
INSERT INTO Branch VALUES (103,'Kottayam',3);
INSERT INTO Branch VALUES (104,'Alappuzha',4);
INSERT INTO Branch VALUES (105,'Kottayam',5);

SELECT * FROM Branch;

CREATE VIEW bank_headoffice AS
SELECT branch_code, bank_name, head_office, branch
FROM bank
WHERE head_office='Mumbai';

SELECT * FROM bank_headoffice;
-- CREATE VIEW bank_branch

CREATE VIEW bank_branch AS
SELECT BranchID, BranchName, BankCode
FROM Branch
WHERE BranchName='Kottayam';

SELECT * FROM bank_branch;
