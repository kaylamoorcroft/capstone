
-- Create the database
CREATE DATABASE IF NOT EXISTS courseCatalogue_db;

-- Switch to the created database
USE courseCatalogue_db;

-- Create the contacts table
CREATE TABLE IF NOT EXISTS math (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    courseID VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    preRequisites VARCHAR (100), -- list of pre-requisite courses (CSV)
    lab VARCHAR (100), -- lab ID if there is one
    sem BIT(4) DEFAULT 0 -- Binary string for FWSC
    -- yearTaken VARCHAR(100) NOT NULL
);

CREATE USER IF NOT EXISTS 'catalogue_user'@'localhost' IDENTIFIED BY 'passw0rd';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'catalogue_user'@'localhost';


INSERT INTO math (courseName, courseID, credits, preRequisites, lab, sem) VALUES
('Pre Calculus', 'MATH-1003', 3, '', 'MATH-1000L', b'1001'),
('Introductory Calculus 1', 'MATH-1013', 3, '', 'MATH-1010L', b'1100'),
('Introductory Calculus 2', 'MATH-1023', 3, 'MATH-1013', 'MATH-1020L', b'0100'),
('Discrete Math', 'MATH-1413', 3, '', '', b'0100'),
('Statistics 1', 'MATH-1253', 3, '', 'MATH-1250L', b'0110'),
('Matrix Algebra', 'MATH-1323', 3, '', 'MATH-1320', b'1100');

-- display table data
DESCRIBE math;