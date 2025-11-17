
-- Create the database
CREATE DATABASE IF NOT EXISTS courseCatalogue_db;

-- Switch to the created database
USE courseCatalogue_db;

-- Create the contacts table
CREATE TABLE IF NOT EXISTS math (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    courseID VARCHAR(50) NOT NULL,
    credits INT NOT NULL
    -- yearTaken VARCHAR(100) NOT NULL
);

CREATE USER IF NOT EXISTS 'catalogue_user'@'localhost' IDENTIFIED BY 'passw0rd';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'catalogue_user'@'localhost';


INSERT INTO math (courseName, courseID, credits) VALUES
('Pre Calculus', 'MATH 1003', 3),
('Introductory Calculus 1', 'MATH 1013', 3),
('Introductory Calculus 2', 'MATH 1023', 3),
('Discrete Math', 'MATH 1413', 3),
('Statistics 1', 'MATH 1253', 3),
('Matrix Algebra', 'MATH 1323', 3);

-- display table data
DESCRIBE math;