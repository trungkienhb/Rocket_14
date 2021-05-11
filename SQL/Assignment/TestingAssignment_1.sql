DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE Testingsystem;
Use Testingsystem;

-- create table: 	DEPARTMENT
CREATE TABLE 		`Department` (
DepartmentID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName		VARCHAR (50)  		NOT NULL UNIQUE
);

-- create table: 	POSITION 
CREATE TABLE 		`Position` (
PositionID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName 	 	ENUM( 'Dev' , 'Test' , 'Scrum Master' , 'PM' ) NOT NULL UNIQUE 
);

-- create table: 	ACCOUNT
CREATE TABLE 		`Account` (
AccountID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email				VARCHAR (100)  		NOT NULL UNIQUE,
Username 			VARCHAR (50)   		NOT NULL CHECK (length(Username) >= 3 ),
FullName			VARCHAR (100)  		NOT NULL CHECK (length(FullName) >= 6 ),
DepartmentID 		TINYINT UNSIGNED 	NOT NULL,
PositionID			TINYINT UNSIGNED 	NOT NULL UNIQUE,
CreateDate			DATE		   		NOT NULL,
FOREIGN KEY 		(DepartmentID) REFERENCES `Department` (DepartmentID),
FOREIGN KEY 		(PositionID) REFERENCES `Position` (PositionID)
);

-- create table: 	GROUP 
CREATE TABLE 		`Group` (
GroupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName			VARCHAR(50)	  		NOT NULL UNIQUE CHECK (length(GroupName) >=6 ),
CreateID			TINYINT UNSIGNED 	NOT NULL UNIQUE DEFAULT (1),
CreateDATE			DATE  		  		NOT NULL DEFAULT (1), 
FOREIGN KEY 		(CreateID) REFERENCES `Account` (AccountID) 
);

-- create table: 	GROUPACCOUNT 
CREATE TABLE 		`GroupAccont` (
GroupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
AccountID			TINYINT	UNSIGNED 	NOT NULL UNIQUE,
JoinDate			DATE		  		NOT NULL DEFAULT (1),
FOREIGN KEY		 	(AccountID) REFERENCES `Account` (AccountID) 
);

-- create table:	TYPEQUESTION 
CREATE TABLE 		`TypeQuestion` (
TypeID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName			ENUM( 'Essay' , 'Multiple-Choice')	NOT NULL UNIQUE
);

-- create table:	CATEGORYQYESTION	 
CREATE TABLE 		`CategoryQuestion`(
CategoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName		VARCHAR (50)		NOT NULL UNIQUE CHECK (length(CategoryName) >=6)
);

-- create table: 	QUESTION  
CREATE TABLE 		`Question` (
QuestionID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				VARCHAR (100)   	NOT NULL CHECK (length(Content) >=8),
CategoryID			TINYINT	UNSIGNED 	NOT NULL,
TypeID				TINYINT	UNSIGNED	NOT NULL,
CreatorID			TINYINT	UNSIGNED	NOT NULL UNIQUE DEFAULT (1), 
CreateDate			DATE				NOT NULL DEFAULT (1),
FOREIGN KEY  		(CategoryID) REFERENCES `CategoryQuestion` (CategoryID),
FOREIGN KEY			(TypeID) 	 REFERENCES `TypeQuestion`	   (TypeID),
FOREIGN KEY			(CreatorID)	 REFERENCES	`Account`		   (AccountID)
); 

-- create table: 	ANSWER
CREATE TABLE 		`Answer` (
AnswerID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			VARCHAR(100)		NOT NULL CHECK (length(Content) >=8),
QuestionID 			TINYINT	UNSIGNED	NOT NULL UNIQUE,
isCorrect 			BIT					NOT NULL,
FOREIGN KEY			(QuestionID) REFERENCES `Question`(QuestionID)
);

-- create table: 	EXAM 
CREATE TABLE 		`Exam` (
ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Code 				VARCHAR (50) 		NOT NULL UNIQUE,		
Title				VARCHAR (50) 		NOT NULL,
CategoryID			TINYINT	UNSIGNED	NOT NULL,
Duration			TINYINT				NOT NULL,
CreatorID			TINYINT	UNSIGNED	NOT NULL UNIQUE DEFAULT (1),
CreateDate			DATE				NOT NULL,
FOREIGN KEY			(CategoryID)  REFERENCES `Question` (CategoryID),
FOREIGN KEY			(CreatorID)	  REFERENCES `CategoryQuestion` (CategoryID)
);

-- create table:	EXAMQUESTION 
CREATE TABLE 		`Examquestion` (
ExamID				TINYINT AUTO_INCREMENT PRIMARY KEY,
QuestionID 			TINYINT	UNSIGNED 	NOT NULL UNIQUE,
FOREIGN KEY			(QuestionID)  REFERENCES `Question` (QuestionID)
);
