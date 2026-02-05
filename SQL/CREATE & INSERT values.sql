CREATE TABLE student(
  std_name VARCHAR(50),
  std_id INT,
  address VARCHAR(50),
  DOB DATE
);
INSERT INTO student(std_name,std_id,address,DOB)
VALUES ('Maria',53,'Kottayam','08-03-2006');
INSERT INTO student(std_name,std_id,address,DOB)
VALUES ('Keerthana',47,'Kottayam','07-03-2006');
INSERT INTO student(std_name,std_id,address,DOB)
VALUES ('Nandana',54,'Kottayam','29-02-2004');
INSERT INTO student VALUES('Meenakshi',52,'Ernakulam','05-06-2006');

SELECT * FROM student;

DROP TABLE student;
