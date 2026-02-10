CREATE TABLE BOOK(
  Book_ID INT PRIMARY KEY,
  Title VARCHAR(50),
  Language_ID INT,
  MRP INT,
  Publisher_ID INT ,
  Publisher_Date DATE,
  Volume INT,
  Status VARCHAR(50),
  FOREIGN KEY (Language_ID) references LANGUAGE_TABLE(Language_ID),
  FOREIGN KEY (Publisher_ID) references PUBLISHER(Publisher_ID) 
);

CREATE TABLE AUTHOR(
  Author_ID INT PRIMARY KEY,
  Author_Name VARCHAR(50),
  email VARCHAR(50),
  Phone_Number VARCHAR(50),
  Status VARCHAR(50)
);

CREATE TABLE BOOK_AUTHOR(
  Book_ID INT ,
  Author_ID INT,
  FOREIGN KEY (Book_ID) references BOOK(Book_ID),
  FOREIGN KEY (Author_ID) references AUTHOR(Author_ID)
);

CREATE TABLE PUBLISHER(
  Publisher_ID INT PRIMARY KEY,
  Publisher_Name VARCHAR(50),
  Address VARCHAR(50)
);

CREATE TABLE MEMBER_TABLE (
    Member_Id INT PRIMARY KEY,
    Member_Name VARCHAR(100),
    Branch_Code VARCHAR(10),
    Roll_Number VARCHAR(20),
    Phone_Number VARCHAR(15),
    Email_Id VARCHAR(100),
    Date_of_Join DATE,
    Status VARCHAR(20)
);

CREATE TABLE BOOK_ISSUE (
    Issue_Id INT PRIMARY KEY,
    Date_of_Issue DATE,
    Book_Id INT,
    Member_Id INT,
    Expected_Date_of_Return DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Book_ID) references BOOK(Book_ID),
    FOREIGN KEY (Member_ID) references MEMBER_TABLE(Member_ID)   
);

CREATE TABLE BOOK_RETURN(
  Issue_ID INT,
  Actual_Date_of_Return DATE,
  Late_Days INT,
  Late_Fee INT,
  FOREIGN KEY (Issue_ID) references BOOK_ISSUE(Issue_ID)
);

CREATE TABLE LANGUAGE_TABLE(
  Language_ID INT PRIMARY KEY,
  Language_Name VARCHAR(50)
);

CREATE TABLE LATE_FEE_RULE(
  FromDays INT,
  ToDays INT,
  Amount INT
);
 
