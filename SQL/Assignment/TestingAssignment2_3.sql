DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE Testingsystem;
Use Testingsystem;

-- create table: 	DEPARTMENT
CREATE TABLE 		`Department` (
    DepartmentID 	TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 	CHAR(50) 			NOT NULL UNIQUE
);

-- create table: 	POSITION 
CREATE TABLE 		`Position` (
    PositionID 		TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName	 ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE
);

-- create table: 	ACCOUNT
CREATE TABLE 		`Account` (
    AccountID 		TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email 			CHAR(100) 			NOT NULL UNIQUE,
    Username 		CHAR(50) 			NOT NULL CHECK (LENGTH(Username) >= 3),
    FullName 		CHAR(100) 			NOT NULL CHECK (LENGTH(FullName) >= 6),
    DepartmentID 	TINYINT 			UNSIGNED 	NOT NULL,
    PositionID 		TINYINT 			UNSIGNED,
    CreateDate 		DATE 				NOT NULL,
    FOREIGN KEY (DepartmentID)	REFERENCES `Department` (DepartmentID),
    FOREIGN KEY (PositionID)	REFERENCES `Position` (PositionID)
);

-- create table: 	GROUP 
CREATE TABLE 		`Group` (
GroupID				TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
GroupName			CHAR(100) 			NOT NULL UNIQUE CHECK (LENGTH(GroupName) >=6 ),
CreateID			TINYINT 			UNSIGNED 	NOT NULL UNIQUE,
CreateDATE			DATE  		  		NOT NULL DEFAULT (1), 
FOREIGN KEY 		(CreateID)	 REFERENCES `Account` (AccountID) 
);

-- create table: 	GROUPACCOUNT 
CREATE TABLE 		`GroupAccont` (
GroupID				TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
AccountID			TINYINT				UNSIGNED 	NOT NULL UNIQUE,
JoinDate			DATE		  		NOT NULL DEFAULT (1),
FOREIGN KEY		 	(AccountID)	 REFERENCES `Account` (AccountID) 
);

-- create table:	TYPEQUESTION 
CREATE TABLE		 `TypeQuestion` (
    TypeID 			TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE
);

-- create table:	CATEGORYQYESTION	 
CREATE TABLE 		`CategoryQuestion` (
    CategoryID 		TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName 	CHAR(100)			NOT NULL UNIQUE 
);

-- create table: 	QUESTION  
CREATE TABLE 		`Question` (
QuestionID 			TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				CHAR(100)   		NOT NULL CHECK (length(Content) >=8),
CategoryID			TINYINT				UNSIGNED NOT NULL,
TypeID				TINYINT				UNSIGNED NOT NULL,
CreatorID			TINYINT				UNSIGNED NOT NULL UNIQUE DEFAULT (1), 
CreateDate			DATE				NOT NULL DEFAULT (1),
FOREIGN KEY  		(CategoryID) REFERENCES `CategoryQuestion` (CategoryID),
FOREIGN KEY			(TypeID) 	 REFERENCES `TypeQuestion`	   (TypeID),
FOREIGN KEY			(CreatorID)	 REFERENCES	`Account`		   (AccountID)
);

-- create table: 	ANSWER
CREATE TABLE 		`Answer` (
AnswerID			TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			CHAR(100) 			NULL CHECK (LENGTH(Content) >= 10),
QuestionID			TINYINT 			UNSIGNED 	NOT NULL UNIQUE,
isCorrect			BIT,
FOREIGN	KEY (QuestionID)				REFERENCES `Question` (QuestionID)
);

-- create table: 	EXAM 
CREATE TABLE 		`Exam` (
ExamID				TINYINT 			UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Code 				CHAR(50)			NOT NULL UNIQUE,		
Title				CHAR(100) 			NOT NULL,
CategoryID			TINYINT				UNSIGNED NOT NULL,
Duration			TINYINT				NOT NULL,
CreatorID			TINYINT				UNSIGNED NOT NULL UNIQUE DEFAULT (1),
CreateDate			DATE				NOT NULL,
FOREIGN KEY			(CategoryID)  REFERENCES `Question` (CategoryID),
FOREIGN KEY			(CreatorID)	  REFERENCES `CategoryQuestion` (CategoryID)
);

-- create table:	EXAMQUESTION 
CREATE TABLE		 `Examquestion` (
    ExamID 			TINYINT 			AUTO_INCREMENT PRIMARY KEY,
    QuestionID	 	TINYINT 			UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (QuestionID)REFERENCES `Question` (QuestionID)
);

/*============================== TAO DU LIEU BANG =================================*/

-- Th??m d??? li???u cho b???ng `Department`
INSERT INTO `Department`(DepartmentName) VALUE ('Marketing'); 
INSERT INTO `Department`(DepartmentName) VALUE ('Sale'); 
INSERT INTO `Department`(DepartmentName) VALUE ('B???o v???'); 
INSERT INTO `Department`(DepartmentName) VALUE ('Nh??n s???'); 
INSERT INTO `Department`(DepartmentName) VALUE ('K??? thu???t'); 
INSERT INTO `Department`(DepartmentName) VALUE ('T??i ch??nh'); 
INSERT INTO `Department`(DepartmentName) VALUE ('Ph?? gi??m ?????c'); 
INSERT INTO `Department`(DepartmentName) VALUE ('Gi??m ?????c'); 
INSERT INTO `Department`(DepartmentName) VALUE ('Th?? k??'); 
INSERT INTO `Department`(DepartmentName) VALUE ('B??n h??ng'); 
    
-- Th??m d??? li???u cho b???ng `Position`--
INSERT INTO `Position`(PositionName) VALUE ('Dev'); 
INSERT INTO `Position`(PositionName) VALUE ('Test'); 
INSERT INTO `Position`(PositionName) VALUE ('Scrum Master'); 
INSERT INTO `Position`(PositionName) VALUE ('PM'); 


-- Th??m d??? li???u cho b???ng `Account`--
INSERT INTO `Account`
					(Email								, Username			, FullName				, DepartmentID	, PositionID	, CreateDate)
VALUE 				('duongtrungkien@gmail.com'			, 'Kientrung'		,'Duong Trung Kien'		,   '8'			,   '4'			,'2020-03-05'),
					('hellococo@gmail.com'				, 'coco'			,'Hello CoCo'			,   '4'			,   '1'			,'2020-03-05'),
                    ('Levanluong@gmail.com'				, 'vanluong'		,'Levanluong'			,   '1'			,   '2'			,'2020-03-07'),
                    ('Nguyentandung@gmail.com'			, 'tandung'			,'Nguyentandung'		,   '5'			,   '4'			,'2020-03-08'),
                    ('qwe123@gmail.com'					, 'caubai'			,'doccocaubai'			,   '6'			,   '4'			,'2020-03-10'),
                    ('Hoavoquyet@gmail.com'				, 'hoavoquyet'		,'Quyet Vo Hoa'			,	'3'			,	'3'			,'2020-03-08'),
                    ('huandeptrai@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '2'			,   '2'			,'2020-04-05'),
                    ('dasunkid@gmail.com'				, 	'DSK'			,'DA SUN KID'			,   '7'			,   '2'			,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'			,'2020-04-07'),
                    ('DAOVANPHO@gmail.com'				, 'DAOVANPHo'		,'DAOVANPHo'			,   '10'		,   '1'			,'2020-04-09');

-- Th??m d??? li???u cho b???ng `Group`--
INSERT INTO `Group`	(	GroupName			, CreateID		, CreateDate)
VALUE 				(N'Testing System'		,   '5'			,'2019-03-05'),
					(N'DASUNKID'			,	'1'			,'2020-03-07'),
                    (N'DASUNKID2'			,   '2'			,'2020-03-09'),
                    (N'DASUNKID3'			,   '3'			,'2020-03-10'),
                    (N'DASUNKID04'			,   '4'			,'2020-03-28'),
                    (N'Seniorr'				,   '6'			,'2020-04-06'),
                    (N'Senior01'			,   '7'			,'2020-04-07'),
                    (N'Hawk eye'			,   '8'			,'2020-04-08'),
                    (N'Facebook'			,   '9'			,'2020-04-09'),
                    (N'instagram'			,   '10'		,'2020-04-10');

-- Th??m d??? li???u cho b???ng `GroupAccont`--
INSERT INTO `GroupAccont`	(  GroupID	, AccountID	, JoinDate	 )
VALUE 						(	1		,    1		,'2020-03-06'),
							(	2		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	4		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	6		,    6		,'2020-04-06'),
							(	7		,    7		,'2020-04-07'),
							(	8		,    8		,'2020-04-08'),
							(	9		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Th??m d??? li???u cho b???ng `TypeQuestion`--
INSERT INTO `TypeQuestion`(TypeName) VALUE ('Essay'); 
INSERT INTO `TypeQuestion`(TypeName) VALUE ('Multiple-Choice'); 


-- Th??m d??? li???u cho `CategoryQuestion`--
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('Java'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('ASP.NET'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('ADO.NET'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('SQL'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('Postman'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('Ruby'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('Python'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('C++'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('C Sharp'); 
INSERT INTO `CategoryQuestion`(CategoryName) VALUE ('PHP'); 

-- Th??m b???ng `Question`--
INSERT INTO `Question`	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUE 					(N'C??u h???i v??? Java'	,	1		,   '1'			,   '1'		,'2019-04-05'),
						(N'C??u H???i v??? PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'H???i v??? C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'H???i v??? Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'H???i v??? Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'H???i v??? ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'H???i v??? ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'H???i v??? C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'H???i v??? SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'H???i v??? Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Th??m b???ng `Answer`--
INSERT INTO `Answer`	(  Content			, QuestionID	, isCorrect	)
VALUE 					(N'Tr??? l???i 01'		,   1			,	0		),
						(N'Tr??? l???i 02'		,   5			,	1		),
						(N'Tr??? l???i 03'		,   6			,	0		),
						(N'Tr??? l???i 04'		,   7			,	1		),
						(N'Tr??? l???i 05'		,   2			,	1		),
						(N'Tr??? l???i 06'		,   3			,	1		),
						(N'Tr??? l???i 07'		,   4			,	0		),
						(N'Tr??? l???i 08'		,   8			,	0		),
						(N'Tr??? l???i 09'		,   9			,	1		),
						(N'Tr??? l???i 10'		,   10			,	1		);
	
-- Th??m b???ng `Exam`--
INSERT INTO `Exam`	(Code			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUE 				('DTK0001'		, N'????? thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('DTK0002'		, N'????? thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    ('DTK0003'		, N'????? thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('DTK0004'		, N'????? thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('DTK005'		, N'????? thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('DTK006'		, N'????? thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('DTK007'		, N'????? thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('DTK008'		, N'????? thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('DTK009'		, N'????? thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('DTK0010'		, N'????? thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
-- Th??m b???ng `Examquestion`--
INSERT INTO `Examquestion`(QuestionID) VALUE (1); 
INSERT INTO `Examquestion`(QuestionID) VALUE (2); 
INSERT INTO `Examquestion`(QuestionID) VALUE (3); 
INSERT INTO `Examquestion`(QuestionID) VALUE (4); 
INSERT INTO `Examquestion`(QuestionID) VALUE (5); 
INSERT INTO `Examquestion`(QuestionID) VALUE (6); 
INSERT INTO `Examquestion`(QuestionID) VALUE (7); 
INSERT INTO `Examquestion`(QuestionID) VALUE (8); 
INSERT INTO `Examquestion`(QuestionID) VALUE (9); 
INSERT INTO `Examquestion`(QuestionID) VALUE (10); 


/*============================== TRUY V???N D??? LI???U ======================================*/

-- Question 2: L???y t???t c??? c??c ph??ng ban
SELECT 
* 
FROM `Department`;

/*======================================================================================*/

-- QUESTION 3: L???Y RA ID C???A PH??NG BAN "SALE"
SELECT 
DepartmentID 
FROM `Department` 
WHERE DepartmentName =	N'Sale';

/*======================================================================================*/

-- QUESTION 4: : L???Y RA TH??NG TIN ACCOUNT C?? FULL NAME D??I NH???T --
		-- L???Y ra ????? d??i t??n l???n nh???t--
SELECT 
AccountID,FullName, char_length(FullName) 
From `Account`;

/*======================================================================================*/

-- QUESTION 5: L???Y RA TH??NG TIN ACCOUNT C?? FULL NAME D??I NH???T V?? THU???C PH??NG BAN C?? ID = 3--
SELECT 
* 
FROM `Account` 	
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) 
FROM `Account`) 
AND DepartmentID = 3 ORDER BY Fullname;

/*======================================================================================*/

-- QUESTION 6: L???Y RA T??N GROUP ???? THAM GIA TR?????C NG??Y 20/12/2019
SELECT 
GroupName 
FROM `Group` WHERE CreateDate < '2019-12-20';

/*======================================================================================*/
-- QUESTION 7: L???Y RA ID C???A QUESTION C?? >= 4 C??U TR??? L???I
SELECT 
QuestionID
FROM
`Answer`	
GROUP BY QuestionID	
HAVING COUNT(*) >= 4;

/*======================================================================================*/
-- QUESTION 8: L???Y RA C??C M?? ????? THI C?? TH???I GIAN THI >= 60 PH??T V?? ???????C T???O TR?????C NG??Y 20/12/2019

SELECT 
`Code` 
FROM `Exam`	WHERE Duration >= 60 AND CreateDate < '2019-12-20';

/*======================================================================================*/
-- QUESTION 9: L???Y RA 5 GROUP ???????C T???O G???N ????Y NH???T

SELECT 
GroupName
FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

/*======================================================================================*/
-- QUESTION 10: ?????M S??? NH??N VI??N THU???C DEPARTMENT C?? ID = 2

SELECT COUNT(AccountID) AS 'SO NHAN VIEN' 
FROM 
`Account`
WHERE 
DepartmentID = 2;

/*======================================================================================*/
-- QUESTION 11: L???Y RA NH??N VI??N C?? T??N B???T ?????U B???NG CH??? "D" V?? K???T TH??C B???NG CH??? "O"
SELECT 
    *
FROM
    `Account`
WHERE
  FullName LIKE  'D%O';

/*======================================================================================*/
-- QUESTION 12: X??A T???T C??? C??C EXAM ???????C T???O TR?????C NG??Y 20/12/2019
DELETE FROM `Exam` 
WHERE CreateDate < '2019-12-20';

/*======================================================================================*/
-- QUESTION 13: X??A T???T C??? C??C QUESTION C?? N???I DUNG B???T ?????U B???NG T??? "C??U H???I"
DELETE FROM `Question` 
WHERE Content = 'C??u h???i';

/*======================================================================================*/
-- QUESTION 14: UPDATE TH??NG TIN C???A ACCOUNT C?? ID = 5 TH??NH T??N "NGUY???N B?? L???C" V?? EMAIL TH??NH LOC.NGUYENBA@VTI.COM.VN

UPDATE `Account` SET Fullname = N'Nguy???n B?? L???c', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

/*======================================================================================*/
-- QUESTION 15: UPDATE ACCOUNT C?? ID = 5 S??? THU???C GROUP C?? ID = 4

UPDATE `Account` SET DepartmentID = '5' WHERE  PositionID = 4; 
