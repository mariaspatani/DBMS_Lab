CREATE TABLE patient(
    pid INT PRIMARY KEY,
    pname VARCHAR(50),
    age INT
);
INSERT INTO patient values(1,'Ramu',20);
INSERT INTO patient values(2,'Latha',70);
INSERT INTO patient values(3,'Getha',40);

CREATE TABLE doctor(
    did INT PRIMARY KEY,
    dname VARCHAR(50),
    specialization VARCHAR(50)
);

INSERT INTO doctor VALUES(101,'Govid','Psychia');
INSERT INTO doctor VALUES (102,'Lakshmi','Neuro');
INSERT INTO doctor Values (103,'Akhil','Gynae');
CREATE TABLE appointment(
    pid INT,
    did INT,
    app_date DATE,
    FOREIGN KEY(pid)references patient(pid),
    FOREIGN KEY(did) references doctor(did)
);
INSERT INTO appointment VALUES(1,101,DATE'25-03-23');
INSERT INTO appointment VALUES(2,102,DATE'25-03-24');
INSERT INTO appointment VALUES(3,103,DATE'25-03-23');

-- Display all patients
SELECT * from patient;

--Find patients above age 30
SELECT * FROM patient 
WHERE age >30;

-- Display patient name and doctor name(JOIN)
SELECT p.pname ,d.dname
from patient p JOIN appointment  a ON p.pid=a.PID
JOIN doctor d ON a.did=d.did;

-- Count total appointments (Aggregate)
SELECT COUNT(*) from appointment;

-- Find doctor handling maximum patients (GROUP BY + HAVING)
SELECT * FROM(
SELECT d.dname, COUNT(a.pid) AS total 
from doctor d JOIN appointment a 
ON d.did=a.did GROUP BY d.did, d.dname
ORDER BY total DESC
)
WHERE ROWNUM=1;
-- Update patient age
UPDATE patient 
SET age=22
where pid=3;
SELECT *from patient;
-- DELETE a record
FOREIGN KEY(did) references doctor(did) ON DELETE CASCADE
DELETE FROM appointment WHERE did = 101;
DELETE FROM doctor WHERE did = 101;
SELECT * FROM doctor;
-- create a view
CREATE view patient_doctor_view AS
select p.pname,d.dname
from patient p JOIN appointment a ON p.pid=a.pid
JOIN doctor d ON a.did=d.did;

SELECT * FROM patient_doctor_view;

-- simple view: from one table
-- complex view: multiple tables/join/group by

--Display patient name and doctor name
SELECT p.pname, d.dname
from patient p JOIN appointment a ON p.pid=a.pid
JOIN doctor d ON a.did=d.did
--Display patient name, doctor name, and date
SELECT  DISTINCT p.pname, d.dname,a.app_date
from patient p JOIN appointment a ON p.pid=a.pid
JOIN doctor d ON a.did=d.did

--Display all patients treated by Neuro doctors
SELECT p.pname
from patient p JOIN appointment a ON p.pid=a.pid
JOIN doctor d ON a.did=d.did
where d.specialization='Neuro';

