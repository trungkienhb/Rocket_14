-- EXERCISE 1--
DROP DATABASE IF EXISTS Extra1;
CREATE DATABASE Extra1;
Use Extra1;

-- create table: 	Trainee --
CREATE TABLE		`Trainee` (
TraineeID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Full_Name			NCHAR(100) 			NOT NULL,
BirthDate			DATE		 		NOT NULL,
Gender				ENUM ( 'Male' , ' Female ' , ' Unknown ') NOT NULL,
ET_IQ				TINYINT  UNSIGNED 	NOT NULL CHECK ( ET_IQ <= 20 ),
ET_Gmath			TINYINT  UNSIGNED 	NOT NULL CHECK	( ET_Gmath <= 20 ),
ET_English			TINYINT  UNSIGNED	NOT NULL CHECK	( ET_English <= 50 ),
Training_Class		NCHAR(50)  			NOT NULL,
Evaluation_Notes	NCHAR(200)	-- note đánh giá --
);

-- THÊM trường VTI_Account với điều kiện `not null` & `unique`--

ALTER TABLE  Trainee
ADD COLUMN VTI_Account SMALLINT UNSIGNED NOT NULL UNIQUE ;

-- EXERCISE 2--
DROP DATABASE IF EXISTS Extra2;
CREATE DATABASE Extra2;
USE Extra2;

-- Create tablle :  Types --
CREATE TABLE		`Types` (
ID 					SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Name				CHAR (50) NOT NULL,
Code				CHAR (50) UNIQUE NOT NULL,
Modified_Date		DATETIME NOT NULL 
);

