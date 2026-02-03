/* change table name*/
CREATE TABLE student(
  std_name VARCHAR(50),
  std_id INT PRIMARY KEY,
  address VARCHAR(50),
  DOB DATE
);

INSERT INTO student VALUES
('Keerthana',47,'Kottayam','07-03-2006');
INSERT INTO student VALUES
('Meenakshi',52,'Ernakulam','05-06-2006');
INSERT INTO student VALUES
('Maria',53,'Kottayam','08-03-2006');
INSERT INTO student VALUES
('Nandana',54,'Kottayam','29-02-2004');

SELECT * FROM student;

ALTER TABLE student RENAME TO class;
