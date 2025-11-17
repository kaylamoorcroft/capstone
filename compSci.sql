-- compSci.sql

-- Create the database
CREATE DATABASE IF NOT EXISTS courseCatalogue_db;

-- Switch to the created database
USE courseCatalogue_db;

-- Create the contacts table
CREATE TABLE IF NOT EXISTS compSci (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    courseID VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    mandatory VARCHAR(50)NOT NULL, -- course is mandatory for all CS degrees
    courseDescription VARCHAR (100), -- or alias
    preRequisites VARCHAR (500) -- list of pre-requisite courses (CSV)
    -- yearTaken SET(1, 2, 3, 4) NOT NULL (Typical year taken: may be one or more of the set values)
);

CREATE USER IF NOT EXISTS 'catalogue_user'@'localhost' IDENTIFIED BY 'passw0rd';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'catalogue_user'@'localhost';

-- Insert Computer Science Course data into the compSci table
-- Not specific to a singular CS path (BCS, BACS, BCSH)
INSERT INTO compSci (courseName, courseID, credits, mandatory, courseDescription, preRequisites) VALUES
('Intro to Computer Science', 'COMP-1233', 3, 'Yes or Alternative Course', '', ''),
('Computer Programming 1', 'COMP-1113', 3, 'Yes or Alternative Course', 'Python', ''),
('Computer Programming 2', 'COMP-1123', 3, 'Yes', 'Java', 'COMP-1123'),
('Computer Programming 3', 'COMP-2103', 3, 'Yes', 'C', 'COMP-1123 / COMP-1233'),
('Data Structures and Algorithms', 'COMP-2113', 3, 'Yes', '', 'MATH-1323, COMP-1123 / COMP-1233'),
('Computer Architecture and Organization 1', 'COMP-2203', 3, 'Yes', '', '6hr Math'),
('Computer Architecture and Organization 2', 'COMP-2213', 3, 'Yes', '', '6hr Comp, COMP-2203'),
('Software Engineering 1', 'COMP-2663', 3, 'Yes', '', 'COMP-1123 / COMP-1233'),
('Software Engineering 2', 'COMP-3663', 3, 'No', '', 'COMP-2663'),
('Computers and Society', 'COMP-2903', 3, 'Yes', '', '3hr Comp'),
('Data Communications and Computer Networks', 'COMP-3343', 3, 'Yes', '', 'COMP-3343, MATH-1253 / MATH-2223'),
('Artificial Intelligence 1', 'COMP-3613', 3, 'Yes', 'AI 1', 'MATH-1413, COMP-2113, MATH-1253 / MATH-2223'),
('Artificial Intelligence 2', 'COMP 4613', 3, 'No', 'AI 2', 'COMP-3613'),
('Analysis of Algorithms', 'COMP-3403', 3, 'No', 'A of A', 'MATH-1413, COMP-2113, MATH-1023'),
('Translators', 'COMP-3703', 3, 'No', '', 'MATH-1413, COMP-2113, COMP-2103'),
('Operating Systems', 'COMP-3713', 3, 'Yes', 'OS', 'COMP-2213, COMP-2103, COMP-2113'),
('Database Management Systems', 'COMP-3753', 3, 'Yes', 'DBMS', 'MATH-1413, COMP-2113'),
('Mobile and Ubiquitous Computing', 'COMP-4583', 3, 'No', 'MUC', 'COMP-3443, COMP-3713, COMP-3033'),
('Automata/Formal Languages/Computability', 'COMP-3413', 3, 'No', '', 'MATH-1413, COMP-2113'),
('Computer Graphics', 'COMP-3553', 3, 'No', 'Graphics', 'MATH-1413, COMP-2113, MATH-1013'),
('Security', 'COMP-3123', 3, 'No', '', 'MATH-1253 / MATH-2223, MATH-1413, COMP-2113'),
('Data Analytics', 'COMP-3503', 3, 'No', '', 'MATH-1253 / MATH-2223, MATH-1413, COMP-2103, COMP-2113'),
('Full Stack Cloud Computing', 'COMP-3033', 3, 'No', 'Full Stack', 'COMP-1123 / COMP-1233'),
('Adv Obj Oriented App Dec C++', 'COMP-3773', 3, 'No', 'C++', 'COMP-2103, COMP-2113, COMP-2663'),
('Systems Analysis and Design', 'COMP-3513', 3, 'No', 'SAD', 'COMP-1113 / COMP-1233'),
('Human Computer Interaction', 'COMP-3583', 3, 'No', 'HCI', 'COMP-2113'),
('Computer Networks and Distributed Systems', 'COMP-4343', 3, 'No', '', 'COMP-3443, COMP-3713, MATH-1413'),
('Game Development', 'COMP-4553', 3, 'No', 'Game Dev', 'COMP-3773, COMP-3553'),
('Capstone Project', ' COMP-4983', 3, 'Yes', '', '12hr Comp 3000 or 4000');

-- Display the table structure
DESCRIBE compSci;