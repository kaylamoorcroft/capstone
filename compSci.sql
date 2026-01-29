-- compSci.sql

-- Create the database
CREATE DATABASE IF NOT EXISTS courseCatalogue_db;

-- Switch to the created database
USE courseCatalogue_db;

-- Create the contacts table
CREATE TABLE IF NOT EXISTS compSci (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    courseID VARCHAR(10) NOT NULL,
    credits INT NOT NULL,
    mandatory BOOLEAN NOT NULL DEFAULT 0, -- course is mandatory for all CS degrees // add special cases for alternate courses
    courseDescription VARCHAR (100), -- or alias
    preRequisites VARCHAR (100), -- list of pre-requisite courses (CSV)
    lab VARCHAR (100), -- lab ID if there is one
    sem BIT(4) DEFAULT 0 -- Binary string for FWSC 
    -- antiRequisites VARCHAR (500) -- list of anti-requisite courses (CSV)
    -- yearTaken SET(1, 2, 3, 4) NOT NULL -- (Typical year taken: may be one or more of the set values)
);

CREATE USER IF NOT EXISTS 'catalogue_user'@'localhost' IDENTIFIED BY 'passw0rd';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'catalogue_user'@'localhost';

-- Insert Computer Science Course data into the compSci table
-- Not specific to a singular CS path (BCS, BACS, BCSH)
INSERT INTO compSci (courseName, courseID, credits, mandatory, courseDescription, preRequisites, lab, sem) VALUES
('Intro to Computer Science', 'COMP-1233', 3, 1, '', '', 'COMP-1230L', b'1000'),
('Computer Programming 1', 'COMP-1113', 3, 1, 'Python', '', 'COMP-1110L', b'1101'),
('Computer Programming 2', 'COMP-1123', 3, 1, 'Java', 'COMP-1123', 'COMP-1120L', b'1100'),
('Computer Programming 3', 'COMP-2103', 3, 1, 'C', 'COMP-1123 / COMP-1233', 'COMP-2100L', b'1100'),
('Data Structures and Algorithms', 'COMP-2113', 3, 1, '', 'MATH-1323, COMP-1123 / COMP-1233', '', b'1100'),
('Computer Architecture and Organization 1', 'COMP-2203', 3, 1, '', '6hr Math', 'COMP-2200L', b'1001'),
('Computer Architecture and Organization 2', 'COMP-2213', 3, 1, '', '6hr Comp, COMP-2203', '', b'0100'),
('Software Engineering 1', 'COMP-2663', 3, 1, '', 'COMP-1123 / COMP-1233', '', b'1000'),
('Software Engineering 2', 'COMP-3663', 3, 0, '', 'COMP-2663', '', b'0100'),
('Computers and Society', 'COMP-2903', 3, 1, '', '3hr Comp', '', b'1100'),
('Data Communications and Computer Networks', 'COMP-3343', 3, 1, '', 'COMP-3343, MATH-1253 / MATH-2223', '', b'1000'),
('Artificial Intelligence 1', 'COMP-3613', 3, 1, 'AI 1', 'MATH-1413, COMP-2113, MATH-1253 / MATH-2223', 'COMP-3610L', b'1000'),
('Artificial Intelligence 2', 'COMP-4613', 3, 0, 'AI 2', 'COMP-3613', '', b'0100'),
('Analysis of Algorithms', 'COMP-3403', 3, 0, 'A of A', 'MATH-1413, COMP-2113, MATH-1023', '', b'0100'),
('Translators', 'COMP-3703', 3, 0, '', 'MATH-1413, COMP-2113, COMP-2103', '', b'1000'),
('Operating Systems', 'COMP-3713', 3, 1, 'OS', 'COMP-2213, COMP-2103, COMP-2113', '', b'1000'),
('Database Management Systems', 'COMP-3753', 3, 1, 'DBMS', 'MATH-1413, COMP-2113', '', b'0100'),
('Mobile and Ubiquitous Computing', 'COMP-4583', 3, 0, 'MUC', 'COMP-3443, COMP-3713, COMP-3033', '', b'0100'),
('Automata/Formal Languages/Computability', 'COMP-3413', 3, 0, '', 'MATH-1413, COMP-2113', '', b'0100'),
('Computer Graphics', 'COMP-3553', 3, 0, 'Graphics', 'MATH-1413, COMP-2113, MATH-1013', '', b'1000'),
('Security', 'COMP-3123', 3, 0, '', 'MATH-1253 / MATH-2223, MATH-1413, COMP-2113', '', b'1000'),
('Data Analytics', 'COMP-3503', 3, 0, '', 'MATH-1253 / MATH-2223, MATH-1413, COMP-2103, COMP-2113', 'COMP-3500L', b'0100'),
('Full Stack Cloud Computing', 'COMP-3033', 3, 0, 'Full Stack', 'COMP-1123 / COMP-1233', '', b'1000'),
('Adv Obj Oriented App Dec C++', 'COMP-3773', 3, 0, 'C++', 'COMP-2103, COMP-2113, COMP-2663', '', b'1000'),
('Systems Analysis and Design', 'COMP-3513', 3, 0, 'SAD', 'COMP-1113 / COMP-1233', '', b'0100'),
('Human Computer Interaction', 'COMP-3583', 3, 0, 'HCI', 'COMP-2113', '', b'1000'),
('Computer Networks and Distributed Systems', 'COMP-4343', 3, 0, '', 'COMP-3443, COMP-3713, MATH-1413', '', b'0100'),
('Game Development', 'COMP-4553', 3, 0, 'Game Dev', 'COMP-3773, COMP-3553', '', b'0100'),
('Capstone Project', 'COMP-4983', 3, 1, '', '12hr Comp 3000 or 4000', '', b'1100');

-- Display the table structure
DESCRIBE compSci;

/* Mandatory courses with alternate option:
- Intro to Computer Science
- Comp Programming 1
*/