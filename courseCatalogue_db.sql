-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2026 at 02:39 PM
-- Server version: 8.0.44
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courseCatalogue_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `butnotcourses`
--

CREATE TABLE `butnotcourses` (
  `id` int DEFAULT NULL,
  `coursename` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `groupsid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `butnotcourses`
--

INSERT INTO `butnotcourses` (`id`, `coursename`, `title`, `groupsid`) VALUES
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 24211),
(10192, 'MUSI-1663', 'Applied Study', 24112),
(10193, 'MUSI-1666', 'Principal Applied Study', 24112),
(10302, 'MUSI-26C3', 'Applied Study', 24112),
(10303, 'MUSI-2666', 'Principal Applied Study', 24112),
(10433, 'MUSI-3663', 'Applied Study', 24112),
(10434, 'MUSI-3666', 'Principal Applied Study', 24112),
(10531, 'MUSI-4663', 'Applied Study', 24112),
(10532, 'MUSI-4666', 'Principal Applied Study', 24112),
(8012, 'ECON-2613', 'Empirical Analy in Econ & Busi', 24115),
(8013, 'ECON-2623', 'Introduction to Econometrics', 24115),
(11758, 'SOCI-3103', 'Quantitative Data Analysis', 24115),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 24227),
(10192, 'MUSI-1663', 'Applied Study', 9032),
(10193, 'MUSI-1666', 'Principal Applied Study', 9032),
(10205, 'MUSI-1733', 'Vocal Skills and Techniques', 9032),
(10302, 'MUSI-26C3', 'Applied Study', 9032),
(10303, 'MUSI-2666', 'Principal Applied Study', 9032),
(10433, 'MUSI-3663', 'Applied Study', 9032),
(10434, 'MUSI-3666', 'Principal Applied Study', 9032),
(10531, 'MUSI-4663', 'Applied Study', 9032),
(10532, 'MUSI-4666', 'Principal Applied Study', 9032),
(8012, 'ECON-2613', 'Empirical Analy in Econ & Busi', 9036),
(8013, 'ECON-2623', 'Introduction to Econometrics', 9036),
(11758, 'SOCI-3103', 'Quantitative Data Analysis', 9036),
(10148, 'MUSI-1353', 'Guitar Class', 24085),
(10192, 'MUSI-1663', 'Applied Study', 24085),
(10193, 'MUSI-1666', 'Principal Applied Study', 24085),
(10302, 'MUSI-26C3', 'Applied Study', 24085),
(10303, 'MUSI-2666', 'Principal Applied Study', 24085),
(10433, 'MUSI-3663', 'Applied Study', 24085),
(10434, 'MUSI-3666', 'Principal Applied Study', 24085),
(10531, 'MUSI-4663', 'Applied Study', 24085),
(10532, 'MUSI-4666', 'Principal Applied Study', 24085),
(8012, 'ECON-2613', 'Empirical Analy in Econ & Busi', 24088),
(8013, 'ECON-2623', 'Introduction to Econometrics', 24088),
(11758, 'SOCI-3103', 'Quantitative Data Analysis', 24088),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 28793),
(10192, 'MUSI-1663', 'Applied Study', 22831),
(10193, 'MUSI-1666', 'Principal Applied Study', 22831),
(10302, 'MUSI-26C3', 'Applied Study', 22831),
(10303, 'MUSI-2666', 'Principal Applied Study', 22831),
(10433, 'MUSI-3663', 'Applied Study', 22831),
(10434, 'MUSI-3666', 'Principal Applied Study', 22831),
(10531, 'MUSI-4663', 'Applied Study', 22831),
(10532, 'MUSI-4666', 'Principal Applied Study', 22831),
(8012, 'ECON-2613', 'Empirical Analy in Econ & Busi', 22834),
(8013, 'ECON-2623', 'Introduction to Econometrics', 22834),
(11758, 'SOCI-3103', 'Quantitative Data Analysis', 22834),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 16882),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 16885),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 24217);

-- --------------------------------------------------------

--
-- Table structure for table `butnotsubjects`
--

CREATE TABLE `butnotsubjects` (
  `code` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(26) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `butnotsubjects`
--

INSERT INTO `butnotsubjects` (`code`, `description`, `id`) VALUES
('COMP', 'Computer Science', 27169),
('COOP', 'Cooperative Education', 27169),
('MATH', 'Mathematics and Statistics', 27169),
('COMP', 'Computer Science', 17745),
('COOP', 'Cooperative Education', 17745),
('MATH', 'Mathematics and Statistics', 17745),
('COMP', 'Computer Science', 27166),
('COOP', 'Cooperative Education', 27166),
('MATH', 'Mathematics and Statistics', 27166),
('COMP', 'Computer Science', 22793),
('COOP', 'Cooperative Education', 22793),
('MATH', 'Mathematics and Statistics', 22793),
('COMP', 'Computer Science', 16887),
('COOP', 'Cooperative Education', 16887),
('MATH', 'Mathematics and Statistics', 16887),
('COMP', 'Computer Science', 15533),
('COOP', 'Cooperative Education', 15533),
('MATH', 'Mathematics and Statistics', 15533);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Description` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MinimumCredits` tinyint DEFAULT NULL,
  `Title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SubjectCode` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `YearsOffered` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TermsOffered` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Description`, `MinimumCredits`, `Title`, `SubjectCode`, `Number`, `YearsOffered`, `TermsOffered`, `Id`) VALUES
('', 0, 'COMP 1113 Laboratory', 'COMP', '1110L', 'NULL', 'NULL', 7653),
('Introduction to the field of computer science and computer programming. Topics include fundamental programming constructs, algorithms, and problem-solving. Lecture and lab. No programming experience required. Prerequisite(s): Mathematics 12 (or equivalent) or Precalculus 12 (or equivalent) or 3h of Mathematics. Antirequisite(s): Credit can be obtained for only one of COMP 1113 or COMP 1893.', 3, 'Computer Programming 1', 'COMP', '1113', 'NULL', 'FA,WI', 7654),
('', 0, 'COMP 1123 Laboratory', 'COMP', '1120L', 'NULL', 'NULL', 7655),
('Topics include object-oriented programming, declarations and types, fundamental techniques in graphics, event-driven programming, subclasses and inheritance in object-oriented programming, recursion, and file processing. Lecture and lab. Prerequisite(s): COMP 1113 with a minimum grade of C-.', 3, 'Computer Programming 2', 'COMP', '1123', 'NULL', 'FA,WI,SU', 7656),
('Introduction to computer concepts and hands-on experience with basic applications. Topics include how to create effective web pages, powerful presentations, dynamic spreadsheets, efficient word processing, and simple database applications. No prior computer knowledge assumed. Students pursuing a degree, major, second major, or honours in Computer Science may not take COMP 1813, and can not use it for credit towards graduation requirements.', 3, 'Computer Concepts & App', 'COMP', '1813', 'NULL', 'NULL', 7670),
('An introduction to programming by writing computer programs to manipulate images and other media. No prior computer knowledge assumed. Antirequisite(s): Credit can be obtained for only one of COMP 1113 or COMP 1893.', 3, 'Multimedia Based Intro: Prog', 'COMP', '1893', 'NULL', 'NULL', 7678),
('', 0, 'COMP 2103 Laboratory', 'COMP', '2100L', 'NULL', 'NULL', 7684),
('Topics include fundamental programming concepts, algorithms and problem solving, fundamental data structures, recursion, the imperative programming paradigm, structured design, compiled and scripting languages, program correctness, robustness, and portability, interfacing with operating system. Lecture and lab. Prerequisite(s): COMP 1123 with a minimum grade of C-.', 3, 'Computer Programming 3', 'COMP', '2103', 'NULL', 'NULL', 7685),
('Topics include introduction to abstract data specification, implementation and testing, introduction to algorithms and their analysis. Prerequisite(s): COMP 1123 and either (MATH 1323 or MATH 1333), each with a minimum grade of C-.', 3, 'Data Structures and Algorithms', 'COMP', '2113', 'NULL', 'NULL', 7686),
('', 0, 'COMP 2203 Laboratory', 'COMP', '2200L', 'NULL', 'NULL', 7690),
('Topics include digital logic and digital systems, machine level representation of data, assembly level organization and architecture. (1.5h lab). Prerequisite(s): 6h of mathematics cross-coded as APSC 2223.', 3, 'Comp Architect./Organization 1', 'COMP', '2203', 'NULL', 'FA', 7691),
('Topics include memory system organization and architecture, interfaces and communication, functional organization, multiprocessing and alternative architectures, performance enhancements. Prerequisite(s): COMP 2203 plus 6 additional hours of computer science, each with a minimum grade of C-.', 3, 'Comp Architect./Organization 2', 'COMP', '2213', 'NULL', 'WI', 7692),
('Topics include software requirements and specifications, methods and tools for object-oriented analysis and design, introduction to software validation, introduction to design patterns and frameworks, programming with components, using APIs, software tools and environments, software processes (introduction), software evolution (introduction), software project management. Prerequisite(s): COMP 1123 with a minimum grade of C-.', 3, 'Software Engineering 1', 'COMP', '2663', 'NULL', 'NULL', 7707),
('This course provides hands-on experience in managing research data from when it is collected to the final report. Includes data collection, storage, data manipulation, data analysis, generating charts and graphs, effective methods of presenting information in both reports and presentations. Prerequisite(s): 3h COMP or equivalent word processing and spreadsheet experience.', 3, 'Handling Data Concpts/Apps', 'COMP', '2853', 'NULL', 'NULL', 7714),
('Topics include an introduction to Web fundamentals, and programming techniques for Web site development. Prerequisite(s): 3h COMP or permission of school. Students pursuing a degree, major, second major, or honours in Computer Science may not take COMP 2863, and can not use it for credit towards graduation requirements.', 3, 'How Websites Work', 'COMP', '2863', 'NULL', 'NULL', 7715),
('Development of dynamic Web applications using database technology. Topics include an introduction to Web development frameworks, and building Web sites which access data stored in a database backend. Prerequisite(s): COMP 2853 and COMP 2863.', 3, 'Build Web-Based Application', 'COMP', '2873', 'NULL', 'NULL', 7716),
('Topics include the technical, economic, legal, political, social, ethical, and professional issues related to the widespread use of computers. Prerequisite(s): 3h COMP with a minimum grade of C-.', 3, 'Computers and Society', 'COMP', '2903', 'NULL', 'NULL', 7718),
('Prerequisite(s): Permission of school.', 3, 'Special Topics', 'COMP', '2923', 'NULL', 'NULL', 7720),
('Topics include cryptography, security issues and, network and data level security. Prerequisite(s): COMP 2113, MATH 1223 or MATH 2223 or MATH 2233, and MATH 1413, each with a minimum grade of C-. Antirequisite(s): Credit can be obtained for only one of COMP 3123 or COMP 2523.', 3, 'Security', 'COMP', '3123', 'NULL', 'NULL', 7724),
('Topics include theory and applications of data communications systems; language of data, coding for communications, transmission media, error control, channels, modems, communications system design, terminal selection and cost analysis. Prerequisite(s): COMP 2213 and MATH 2223 or MATH 2233 with a minimum grade of C-.', 3, 'Data Comm & Comp Networks', 'COMP', '3343', 'NULL', 'NULL', 7732),
('Brief review of computer representation and manipulation of mathematical structures. Introduction to models of computations, basic programming techniques for efficiency (recursion, balancing back-tracking, etc.), complexity theory, estimation and measurement of efficiency of algorithms, and proving algorithms optimal. Prerequisite(s): COMP 2113, MATH 1023, MATH 1413, (MATH 1323 or MATH 1333), each with a minimum grade of C-.', 3, 'Analysis of Algorithms', 'COMP', '3403', 'NULL', 'NULL', 7733),
('Automata theory, formal languages, computability and complexity, including the Chomsky hierarchy for languages, decision problems for languages, theoretical computability, non-computable functions and related problems. Prerequisite(s): COMP 2113, MATH 1413, MATH 1323, each with a minimum grade of C-.', 3, 'Automata/Formal Lang/Comput', 'COMP', '3413', 'NULL', 'NULL', 7734),
('', 0, 'COMP 3503 Laboratory', 'COMP', '3500L', 'NULL', 'NULL', 7738),
('Methods and technologies surrounding the capture of organizational data; the preparation and modelling of that data to identify patterns, make predictions, or inform decision making. Topics include: the data analytics process, data warehousing, data engineering, data visualization, data mining and machine learning. (1h lab). Prerequisite(s): COMP 2113, COMP 2103, MATH 1223 or MATH 2223 or MATH 2233, and MATH 1413 or MATH 1313, each with a minimum grade of C-.', 3, 'Data Analytics', 'COMP', '3503', 'NULL', 'NULL', 7739),
('Introduction to the tools and techniques of information systems analysis and design and the project management process. The analysis and specification of systems requirements will be covered, as well as the design of system data, input, output and processes. A typical business case study project will constitute a major portion of the course. Prerequisite(s): COMP 1113, COMP 1893 or COMP 2863 with a minimum grade of C-, or permission of the School of Computer Science.', 3, 'Systems Analysis and Design', 'COMP', '3513', 'NULL', 'NULL', 7740),
('Selected higher-level concepts in computer graphics, such as display devices, display files and data structures for graphics, interactive and dynamic display techniques, three-dimensional graphics, shaded and colour graphics. Graphics language standardization, and device-independent software. Prerequisite(s): COMP 2113, MATH 1013, MATH 1413, and MATH 1323, each with a minimum grade of C-.', 3, 'Computer Graphics', 'COMP', '3553', 'NULL', 'NULL', 7744),
('Examines the human factors associated with information technology and seeks to provide students with knowledge of the variables likely to influence the perceived usability, and hence the acceptability, of any information technology. This course introduces a series of techniques for developing and evaluating usable software, with a focus on both mobile and traditional computing hardware. Prerequisite(s): COMP 2113.', 3, 'Human Computer Interaction', 'COMP', '3583', 'NULL', 'NULL', 7745),
('', 0, 'COMP 3613 Laboratory', 'COMP', '3610L', 'NULL', 'NULL', 7746),
('Topics include an introduction to artificial intelligence, solving problems with search, knowledge and reasoning, uncertain knowledge and reasoning, supervised and unsupervised machine learning, artificial neural networks and reinforcement learning. (1.5h Lab). Prerequisite(s): COMP 2113, MATH 1413, MATH 1323, MATH 2233 or MATH 2213/MATH 2223, each with a minimum grade of C-.', 3, 'Artificial Intelligence 1', 'COMP', '3613', 'NULL', 'NULL', 7747),
('Topics include software evolution, project management, standards and practices of requirements analysis, design, implementation and testing, configuration and change management, quality assurance, resource and cost estimation, risk management, professional and ethical responsibilities, team application of SE methodology to the development of a software product. Prerequisite(s): COMP 2663 with a minimum grade of C-.', 3, 'Software Engineering 2', 'COMP', '3663', 'NULL', 'NULL', 7749),
('Basic components and techniques of translators for programming languages; preprocessors, compilers, interpreters, assemblers. Prerequisite(s): COMP 2103, COMP 2113, MATH 1413, (MATH 1323 or MATH 1333), each with a minimum grade of C-.', 3, 'Translators', 'COMP', '3703', 'NULL', 'NULL', 7750),
('Major operating systems principles, and the interrelationships between the operating system and the architecture of computer systems. Topics from memory and process management, and concurrent computation in operating systems. Prerequisite(s): COMP 2103, COMP 2113, and COMP 2213 each with a minimum grade of C-.', 3, 'Operating Systems', 'COMP', '3713', 'NULL', 'NULL', 7751),
('The analysis, design, operation and maintenance of large information systems, especially those using database techniques, on-line processing, and networking. The most common models for database management systems with commercial examples. Prerequisite(s): COMP 2113, MATH 1413, (MATH 1323 or MATH 1333), each with a minimum grade of C-.', 3, 'Database Management Systems', 'COMP', '3753', 'NULL', 'NULL', 7753),
('Advanced topics in object-oriented programming, analysis, and design using C++. Compile and run time binding, reflective and polymorphic programming, compile and run time type parametrization. Standard template library. Design patterns and frameworks in C++. Prerequisite(s): COMP 2103, COMP 2113, and COMP 2663, each with a minimum grade of C-.', 3, 'Adv Obj Oriented App Dev C++', 'COMP', '3773', 'NULL', 'NULL', 7755),
('Prerequisite(s): Permission of School of Computer Science.', 3, 'Special Topics', 'COMP', '3923', 'NULL', 'NULL', 7760),
('New generation architectures and technologies, foundations of parallel computation, software for advanced architecture, parallel architectures. Prerequisite(s): COMP 3703, COMP 3713.', 3, 'Advanced Computer Architecture', 'COMP', '4223', 'NULL', 'NULL', 7763),
('Design and implementation of computer networks and related systems, communications protocols and distributed systems. Prerequisite(s): COMP 3343, COMP 3713, MATH 1413, MATH 1323, each with a minimum grade of C-.', 3, 'Comp Net & Distributed Systems', 'COMP', '4343', 'NULL', 'NULL', 7764),
('This course will cover selected topics such as: authentication applications, data integrity and privacy, anonymity, security infrastructures and intrusion prevention, network attacks, and wireless Networks and Security. Prerequisite(s): COMP 3123 and COMP 4343, each with a minimum grade of C-. Corequisite or prerequisite: MATH 4333 or permission of the School of Computer Science.', 3, 'Topics: Comp & Network Sec', 'COMP', '4443', 'NULL', 'NULL', 7766),
('This course consists of intensive examination of selected topics in computer science and information technology for environmental science. Prerequisite(s): Permission of the School of Computer Science.', 3, 'Environmental Informatics', 'COMP', '4523', 'NULL', 'NULL', 7770),
('The game development life cycle, game design and programming, graphics engines and game engines, game tools. Prerequisite(s): COMP 3553 and 3773, each with a minimum grade of C-.', 3, 'Game Development', 'COMP', '4553', 'NULL', 'NULL', 7771),
('This course covers the technologies used in mobile and ubiquitous computing and how to apply this knowledge to real-world applications. This course will provide specific skills needed for designing, developing and deploying mobile applications. Prerequisite(s): COMP 3343, COMP 2513, COMP 3713, each with a minimum grade of C-.', 3, 'Mobile/Ubiquitous Computing', 'COMP', '4583', 'NULL', 'NULL', 7772),
('Special topics in artificial intelligence. Prerequisite(s): COMP 3613 with a minimum grade of C-, and permission of the School of Computer Science.', 3, 'Artificial Intelligence 2', 'COMP', '4613', 'NULL', 'NULL', 7774),
('2024/25 - COMP 4923 WI01 Special Topics Bioinformatics   An introduction to the analysis of biological data using computational tools. Using a combination of high-performance computing and R software, students will apply and interpret bioinformatic techniques including alignment of genome sequence data, genetic mapping, microbiome analysis, and RNA-sequencing. This course will include examples of applications across biological fields such as human health, agriculture, and conservation. Requisites: COMP 2113 and MATH 1253 completed with a minimum grade of C-. Must be completed prior to taking this course.  Biology background would be an asset. Prerequisite(s): Permission of School of Computer Science.', 3, 'Special Topics', 'COMP', '4923', 'NULL', 'NULL', 7783),
('Experience in the design, development, implementation and documentation of a significant computer software or hardware system; or a thorough literature review and analysis of an aspect of computer science. Students in the BACS degree must complete an applied project in their area of defined option, second major, or minor. A final project report and a presentation to the School are required. Prerequisite(s): 12h computer science at the 3000 or 4000 level, each with a minimum grade of C-. Antirequisite(s): Credit can be obtained for only one of COMP 4983 or COMP 4996.', 3, 'Capstone Project', 'COMP', '4983', 'NULL', 'NULL', 7785),
('These courses consist of intensive examination of selected specific advanced topics in theoretical computer science. Since the specific topic or research problem that receives special treatment will differ from year-to-year, students are advised to consult with the School prior to registration.', 3, 'Top.: Theor. Comp Science 1', 'COMP', '5013', 'NULL', 'NULL', 7787),
('These courses consist of intensive examination of selected specific advanced topics in applications of computer science. Since the specific topic or research problem that receives special treatment will differ from year-to-year, students are advised to consult with the School prior to registration.', 3, 'Applications in Comp Sci 1', 'COMP', '5113', 'NULL', 'NULL', 7790),
('These courses consist of intensive examination of selected specific advanced topics in systems in computer science. Since the specific topic or research problem that receives special treatment will differ from year-to-year, students are advised to consult with the School prior to registration.', 3, 'Systems in Computer Science 1', 'COMP', '5213', 'NULL', 'NULL', 7793),
('This advanced algorithm analysis course covers a selection of the following topics: review of asymptotic notion, The FFT (polynomials  over final fields and/or complex numbers), lower bound analysis, union-find algorithms and their analysis, Strassens algorithm, Number theoretic algorithm, and NP completeness.', 3, 'Advanced Algorithm Analysis', 'COMP', '5403', 'NULL', 'NULL', 7797),
('This course will cover the following topics: The Unsolvability of halting problems, decidable and semi-decidable languages, unrestricted grammars, the Chomsky hierarchy and beyond, computable functions, introduction to the analysis of complexity, time and space complexity classes.', 3, 'Adv Formal Lang & Comp Complex', 'COMP', '5413', 'NULL', 'NULL', 7798),
('This course provides a comprehensive introduction to digital twins, focusing on the technologies, tools, and techniques (Python, MATLAB) for creating representation models for AR/VR interfaces. Topics include IoT, data science, and modelling methods, with a project-based approach through lectures and labs. Students will work in teams on practical, challenging project, enhancing problem-solving skills.', 3, 'Simulation and Modelling', 'COMP', '5503', 'NULL', 'NULL', 7799),
('The student is assigned to a faculty member for regular meetings to discuss readings in a selected area. Papers and research projects are expected. Prerequisite(s): permission from the Graduate Coordinator.', 3, 'Readings in Computer Science', 'COMP', '5913', 'NULL', 'NULL', 7809),
('This course provides an introduction to research methods in computer science.', 3, 'Research in Computer Science', 'COMP', '5923', 'NULL', 'NULL', 7810),
('', 0, 'Thesis', 'COMP', '5960', 'NULL', 'NULL', 7811),
('Topics from high school mathematics. This non-credit course serves as a prerequisite for courses that require NS Mathematics 11 and 12 or their equivalent. Prerequisite(s): Permission of the instructor.', 0, 'Pre-University Mathematics', 'MATH', '0110', 'NULL', 'NULL', 9938),
('', 0, 'MATH 0120 Studio Lecture', 'MATH', '0120L', 'NULL', 'NULL', 9940),
('', 0, 'MATH 1013 Studio', 'MATH', '1010L', 'NULL', 'NULL', 9942),
('Limits, tangent lines and derivatives, exponential, logarithmic and inverse functions. Application of the derivative to rates, extrema, curve sketching, indeterminate forms. Hyperbolic functions and parametric curves if time permits. (3h lecture, 1.5h studio). Prerequisite(s): 60% or better in NS Precalculus 12 (or equivalent), or C- or better in Math 0120, or C- or better in Math 1613. Satisfactory performance on a diagnostic test is additionally required. Antirequisites(s): Credit can be obtained for only one of MATH 1013 or MATH 1613: however, students who have taken MATH 1613 and subsequently take MATH 1013 may use MATH 1613 as a science elective. Note: MATH 1013 A0 is a two-semester section of Introductory to Calculus 1. This section includes a review of topics from precalculus. Permission of the Department is required to register.', 3, 'Introductory Calculus 1', 'MATH', '1013', 'NULL', 'NULL', 9943),
('', 0, 'MATH 1023 Studio', 'MATH', '1020L', 'NULL', 'NULL', 9944),
('Antiderivatives, the Fundamental Theorem of Calculus, techniques of integration, applications such as volumes, arc length, improper integrals, sequences, series, power series, Taylor series, Taylor polynomials. (3h lecture, 1.5h studio) Prerequisite(s): Math 1013. It is strongly recommended that Math 1013 be completed in the previous semester.', 3, 'Introductory Calculus 2', 'MATH', '1023', 'NULL', 'NULL', 9945),
('', 0, 'MATH 1213 Laboratory', 'MATH', '1210L', 'NULL', 'NULL', 9948),
('', 0, 'MATH 1223 Laboratory', 'MATH', '1220L', 'NULL', 'NULL', 9950),
('Topics may include: Number systems. Complex numbers and De Moivres theorem. Base arithmetic. Sets, set operations. Methods of proof, logic, truth tables, and quantifiers. Permutations and combinations. The binomial theorem. Relations and functions. One-to-one and onto mappings. Basic number theory. Equivalence relations. Congruences. Simple codes. Graph theory. Prerequisite(s): Mathematics 11 and 12 or Precalculus 11 and 12. Antirequisite(s): Credit can be obtained for only one of MATH 1313 or MATH 1413.', 3, 'Foundations', 'MATH', '1313', 'NULL', 'NULL', 9954),
('Systems of linear equations, matrices, vectors in two and three dimensions, row reduction and echelon forms, linear independence and span, linear transformations, matrix operations, Invertible Matrix Theorem, subspaces, determinants, Cramers Rule, eigenvectors and eigenvalues; a computational approach, with applications. (3h lecture, 1.5h lab). Prerequisite(s): Mathematics 11 and Mathematics 12, or Precalculus 11 and 12, or MATH 1003. Antirequisite(s): Credit can be obtained for only one MATH 1323 or MATH 1333.', 3, 'Matrix Algebra', 'MATH', '1323', 'NULL', 'NULL', 9955),
('Systems of linear equations, matrices, vectors, row reduction and echelon forms, linear independence and span, linear transformations, matrix operations, Invertible Matrix Theorem, elementary matrices, LU Decomposition, subspaces, determinants and multilinear functions, Cramers Rule, eigenvalues and eigenvectors, geometry of vector spaces, Singular Value Decomposition if time permits; a proof-based approach, with applications. Prerequisite Mathematics 11 and Mathematics 12, or Precalculus 11 and 12, or MATH 0120. Antirequisite(s): Credit can be obtained for only one of MATH 1323 or MATH 1333.', 3, 'Introduction to Linear Algebra', 'MATH', '1333', 'NULL', 'NULL', 9956),
('Logic, techniques of proof, mathematical induction, permutations and combinations, inclusion/exclusion, sets, relations and functions, elementary number theory. Prerequisite Mathematics 11 and 12, or Precalculus 11 and 12 (or equivalent) and computer science enrolment, or permission of the instructor. Antirequisite(s): Credit can be obtained for only one of MATH 1313 or MATH 1413.', 3, 'Discrete Mathematics', 'MATH', '1413', 'NULL', 'NULL', 9958),
('The mathematical and statistical applications that appear in day-to-day media are discussed. Topics may include elections, fair division, climate change, environment, public health, epidemiology, finances, google searches, cryptography, and polls, and will be based on stories in the media. The course will teach numeracy skills to understand these topics. The course cannot be used to meet the Mathematical requirement for Math or other Science majors.', 3, 'Truth in Numbers', 'MATH', '1513', 'NULL', 'NULL', 9961),
('This course is designed for students planning a career in elementary or middle school education. Topics from problem solving, logic and sets, algebra and functions, integers, rational numbers, decimals, percents, and real numbers will be explored. This course may not be used by students in science, business, economics, or mathematics to fulfill major or minor mathematics requirements. Prerequisite(s): Permission of the Department.', 3, 'Mathematical Concepts 1', 'MATH', '1533', 'NULL', 'NULL', 9962),
('This course is designed for students planning a career in elementary or middle school education. Topics from problem solving, probability and data analysis, geometry, measurement and motion geometry will be explored. This course may not be used by students in science, business, economics, or mathematics to fulfill major or minor mathematics requirements. Prerequisite(s): Permission of the Department.', 3, 'Mathematical Concepts 2', 'MATH', '1543', 'NULL', 'NULL', 9963),
('An in-depth study of Patterns and Algebra across grades 4-10, focusing on the development and understanding of the underlying ideas. Additional focus will be placed on where student misconceptions occur, links with other mathematics ideas, and effective teaching strategies. Science students, business students, economics students, and mathematics and statistics majors may not receive credit for this course.', 3, 'Patterns and Algebra', 'MATH', '1553', 'NULL', 'NULL', 9964),
('Number: Whole Numbers, Integers, Rational Numbers, and Real Numbers An in-depth study of number (whole numbers, integers, fractions, and decimals) across grades 4-10, focusing on the development and understanding of the underlying ideas. Additional focus will be placed on where student misconceptions occur, links with other mathematics ideas, and effective teaching strategies. Science students, business students, economics students, and mathematics and statistics majors may not receive credit for this course.', 3, 'Number:Whole Numbers,Integers', 'MATH', '1563', 'NULL', 'NULL', 9965),
('An in-depth study of 2- and 3-dimensional Geometry across grades 4-10, focusing on the development and understanding of the underlying ideas. Additional focus will be placed on where student misconceptions occur, links with other mathematics ideas, and effective teaching strategies. Science students, business students, economics students, and mathematics and statistics majors may not receive credit for this course.', 3, 'Geometry: 2D and 3D', 'MATH', '1573', 'NULL', 'NULL', 9966),
('An in-depth study of Probability, Data Analysis, and Proportional Reasoning across grades 4-10, focusing on the development and understanding of the underlying ideas. Additional focus will be placed on where student misconceptions occur, links with other mathematics ideas, and effective teaching strategies. Science students, business students, economics students, and mathematics and statistics majors may not receive credit for this course.', 3, 'Prob/Data Analy/Proportion', 'MATH', '1583', 'NULL', 'NULL', 9967),
('Linear equations and their graphs. Systems of linear equations and linear inequalities. Polynomials, exponential and logarithmic functions. Linear inequalities in two variables and graphical methods of linear programming. Derivatives and optimization. Applications to business and economics are integrated throughout the course. Emphasis is on understanding how problems are formulated mathematically and on interpretation of mathematically-expressed real-world problems. Math 1613 is intended as a terminal course. Students wanting to take further math courses should take MATH 1013/MATH 1023 instead. Prerequisite(s): Mathematics 11 and 12; or Precalculus 11 and 12, or Math 0110. Satisfactory performance on a diagnostic test may be additionally required. Antirequisite(s): Credit can be obtained for only one of Math 1013 and MATH 1613; however, students who have taken Math 1613 and subsequently take MATH 1013 may use this course as a science elective.', 3, 'Gen Lin Algeb. Calc: Busi/Econ', 'MATH', '1613', 'NULL', 'NULL', 9969),
('', 0, 'MATH 2013 Studio', 'MATH', '2010L', 'NULL', 'NULL', 9978),
('Functions of several variables. Partial differentiation and applications. Vectors in R² and R³. Multiple and iterated integrals. Polar coordinates, spherical and cylindrical coordinates and multiple integrals. Change of variable in multiple integrals. Vector-valued functions and vector calculus. (4.5h lecture/studio combined) Prerequisite(s): Math 1023. Antirequisite(s): Credit can be obtained for only one of Math 2013 or MATH 2753.', 3, 'Advanced Calculus', 'MATH', '2013', 'NULL', 'NULL', 9979),
('', 0, 'MATH 2023 Studio', 'MATH', '2020L', 'NULL', 'NULL', 9980),
('First order differential equations, second order differential equations with constant and variable coefficients, introduction to systems of differential equations and phase plane analysis, series solutions, boundary value problems, Laplace transforms. (3h lecture, 1.5h studio) Prerequisite(s): Math 1023. Antirequisite(s): Credit can be obtained for only one of Math 2023 or MATH 2723.', 3, 'Differential Equations 1', 'MATH', '2023', 'NULL', 'NULL', 9981),
('', 0, 'MATH 2213 Laboratory', 'MATH', '2210L', 'NULL', 'NULL', 9983),
('Descriptive statistics, combinatorics, probability spaces, random variables, probability modeling, discrete and continuous distributions, joint distributions, covariance, correlation, sampling distributions, central limit theorem, simple linear regression. (4.5h lecture/studio combined). Prerequisite(s): Math 1023. Antirequisite(s): Credit can be obtained for only one of MATH 1213/MATH 1223, MATH 2213/MATH 2223, MATH 2233/MATH 2243, and ECON 2613.', 3, 'Appl Probability Sci/Engi', 'MATH', '2213', 'NULL', 'NULL', 9984),
('', 0, 'MATH 2223 Studio', 'MATH', '2220L', 'NULL', 'NULL', 9985),
('Estimation, confidence intervals, testing hypotheses, non-parametric methods, goodness of fit, regression, analysis of variance. (4.5h lecture/studio combined). Prerequisite(s): Math 2213. Antirequisite(s): Credit can be obtained for only one of MATH1213/MATH 1223, MATH 2213/ MATH 2223, MATH 2233/ MATH 2243, and ECON 2613.', 3, 'Applied Statistics for Science', 'MATH', '2223', 'NULL', 'NULL', 9986),
('', 0, 'MATH 2233 Laboratory', 'MATH', '2230L', 'NULL', 'NULL', 9987),
('', 0, 'MATH 2243 Laboratory', 'MATH', '2240L', 'NULL', 'NULL', 9989),
('Further topics in probability including independence and conditional probability, Binomial and Poisson distributions; estimation, confidence intervals and hypothesis testing for (i) proportions in one and two populations, (ii) means in one and two populations, (iii) linear regression models, (iv) goodness of fit and contingency tables (v) other statistical models including 1-way and 2-way ANOVA. Life Science applications will be included.', 3, 'Statistics II for Life Science', 'MATH', '2243', 'NULL', 'NULL', 9990),
('', 0, 'MATH 2253 Laboratory', 'MATH', '2250L', 'NULL', 'NULL', 9991),
('Further topics in probability including independence and conditional probability, Binomial and Poisson distributions; estimation, confidence intervals and hypothesis testing for (i) proportions in one and two populations, (ii) means in one and two populations, (iii) linear regression models, (iv) goodness of fit and contingency tables (v) other statistical models. Science applications will be used throughout the course.', 3, 'Statistics II for Science', 'MATH', '2253', 'NULL', 'NULL', 9992),
('Abstract vector spaces, subspaces including null space and column space, linear transformations, coordinate systems, dimension, rank, change of basis, eigenvalues and eigenvectors, characteristic equation, diagonalization, inner product and orthogonality, orthogonal projections, Gram-Schmidt algorithm, inner product spaces, quadratic forms, Cayley-Hamilton Theorem. Prerequisite(s): MATH 1323 or MATH 1333.', 3, 'Linear Algebra 2', 'MATH', '2313', 'NULL', 'NULL', 9994),
('Graphs and trees with application to computer science, number theory, monoids, semi-groups, groups and homomorphisms with application to computer science, formal languages, finite state automata, and Turing machines. Prerequisite(s): MATH 1413 or MATH 1313.', 3, 'Graph Theory/Algebraic Struct', 'MATH', '2433', 'NULL', 'NULL', 9998),
('The Mathematical theory behind interest-based investments. This course is designed to help prepare students for Part I of the Society of Actuaries Exam FM. Topics include: simple and compound interest, annuities, amortization schedules, sinking funds, bonds, and other securities. Prerequisite(s): MATH 1023 or permission of the instructor', 3, 'Theory of Interest', 'MATH', '2633', 'NULL', 'NULL', 10003),
('', 0, 'MATH 2723 Studio', 'MATH', '2720L', 'NULL', 'NULL', 10006),
('First order differential equations, separation of variables, exact differential equations, integrating factors, second order differential equations with constant coefficients, general solutions, non-homogeneous equations, applications, equations with variable coefficients, series solutions, Laplace transforms. (4.5h lecture) Prerequisite(s): MATH 1023. Antirequisite(s): Credit can be obtained for only one of MATH 2023 or MATH 2723.', 3, 'Intro Differential Equations', 'MATH', '2723', 'NULL', 'NULL', 10007),
('', 0, 'MATH 2753 Studio', 'MATH', '2750L', 'NULL', 'NULL', 10009),
('This course covers the calculus of vector-valued functions and functions of several variables. Topics include: vectors, dot product, cross product, parameterized curves, arc length, differentiation and integration of vector-valued functions, partial derivatives, optimization including Lagrange Multipliers, multiple integrals, change of variables in multiple integrals, vector fields, line integrals, surface integrals, Greens, Stokes and Divergence Theorems. (4.5h lecture/studio combined) Prerequisite(s): Math 1023. Antirequisite(s): Credit can be obtained for only one of MATH 2013 or MATH 2753', 3, 'Multivariate Calc for Appl Sci', 'MATH', '2753', 'NULL', 'NULL', 10010),
('2025FA: Combinatorial Game Theory This course considers two player games where there is perfect information and no randomness. Topics will include basic techniques, outcome classes of games, game values, the algebra of games, impartial games, hot games, and all-small games.', 3, 'Studies in Math/Statistics 1', 'MATH', '3013', 'NULL', 'NULL', 10014),
('Fall 2025 - The second quantum revolution: foundations and computation. This course develops the conceptual foundations of quantum mechanics (QM) from an information-theoretic perspective and presents modern applications in quantum computing. The course does not require any prior knowledge of QM and is suitable for all students in Mathematics, Physics, and Computer Science who have taken a first course in Linear Algebra or Matrix Algebra. Topics include 2-state systems (\"Qbits\"), entanglement, Bell inequalities and their violations (2022 Nobel Prize), black hole information paradox, no-cloning theorem, quantum teleportation, quantum algorithms, quantum cryptography. --- Study of a particular topic in mathematics or statistics. Prerequisite(s): 6h MATH at the 2000-level with minimum grade of C-, and permission of the Department.', 3, 'Studies in Math/Statistics 2', 'MATH', '3023', 'NULL', 'NULL', 10015),
('Elementary set theory, outcome spaces, probability spaces, laws of probability (discrete and continuous), independence, conditionality, random variables, random vectors, distributions of functions of random variables, moments and moment generating functions, special distributions, law of large numbers, central limit theorem. Prerequisite(s): MATH 2013 MATH 2753, MATH 2223, with minimum grades of C-.', 3, 'Probability', 'MATH', '3213', 'NULL', 'NULL', 10016),
('An introduction to the methodology and theory involved in multi-linear regression. Topics include: variable selection, indicator variables, correlation analysis and general linear hypothesis testing. Prerequisite(s): One of MATH 1323 or MATH 1333, and one of MATH 2223 or 2243, with minimum grades of C-. Antirequisite(s): Credit can be obtained for only one of MATH 3233 or ECON 2623', 3, 'Regression', 'MATH', '3233', 'NULL', 'NULL', 10018),
('Nonparametric statistical inference and statistical methods based on ranks. Topics include rank and sign tests, linear rank statistics, nonparametric analysis of variance, measures of concordance, relative power and efficiency. Prerequisite(s): One of MATH 2223 or MATH 2243 with a minimum grade of C-.', 3, 'Nonparametric Stat Inference', 'MATH', '3253', 'NULL', 'NULL', 10020),
('Statistical surveys, simple random sampling, sampling proportions and percentages, estimation of sample size, ratio and regression estimators, stratified random sampling, cluster sampling, probability sampling. Prerequisite(s): One of MATH 2223 or MATH 2243 with a minimum grade of C-.', 3, 'Sampling Theory', 'MATH', '3263', 'NULL', 'NULL', 10021),
('Single and multi-factor analysis of variance, fixed and random effects models, analysis of co-variance, experimental design, including randomized block designs, balanced incomplete block designs, and factorial designs. Other topics may include repeated measures, split plot designs, response surface models, and fractional factorial designs. Prerequisite(s): One of MATH 2223 or MATH 2243 with a minimum grade of C-.', 3, 'Design & Analy of Experiments', 'MATH', '3273', 'NULL', 'NULL', 10022),
('Seasonal effects, trends, descriptive methods. Stochastic processes, moving average and autoregressive processes. Autocorrelation. Model fitting and Box Jenkins models. Forecasting. Regression based procedures. Prerequisite(s): One of MATH 2223 or MATH 2243 with a minimum grade of C-.', 3, 'Time Series', 'MATH', '3283', 'NULL', 'NULL', 10023),
('Modern statistical methods for supervised and unsupervised learning with large and complex data. Topics include: linear regression, classification, resampling methods, model selection and regularization, smooth regression, tree-based models, support vector machines, principal components and dimension reduction, clustering and statistical graphics. Prerequisite(s): One of MATH 2223 or MATH 2243 with a minimum grade of C-.', 3, 'Statistical Learning', 'MATH', '3293', 'NULL', 'NULL', 10024),
('Modern mathematics with emphasis on the fundamental concepts and structures of algebra. Introduction to groups, rings and fields. Topics including homomorphisms, isomorphisms, quotient structures, finite fields. Prerequisite(s): MATH 2313 with a minimum grade of C-.', 3, 'Algebra 1', 'MATH', '3303', 'NULL', 'NULL', 10025),
('The basic concepts and problems in combinatorial analysis, with applications. Topics include enumeration, selections and arrangements, distributions, binomial identities, Stirling numbers, recurrence relations, generating functions, inclusion-exclusion, Polyas theorem, designs. Prerequisite(s): MATH 2213 with a minimum grade of C-.', 3, 'Combinatorics', 'MATH', '3343', 'NULL', 'NULL', 10029),
('Floating point computation, errors and their propagation, linear systems of equations, nonlinear equations, interpolation, numerical differentiation and integration. The solution of mathematical problems on a computer forms an integral part of the course. Prerequisite(s): MATH 1023 and one of MATH 1323 or MATH 1333, with minimum grades of C-.', 3, 'Numerical Methods', 'MATH', '3413', 'NULL', 'NULL', 10030),
('The basic concepts and problems of number theory. Topics included are properties of integers, divisibility and primes; congruences, power residues and quadratic reciprocity; Diophantine equations. Prerequisite(s): MATH 2313 with a minimum grade of C-, or permission of the instructor.', 3, 'Number Theory', 'MATH', '3513', 'NULL', 'NULL', 10034),
('The emphasis in this course is on a rigorous examination of the theory underlying calculus. Topics include set theory, countability, the real numbers as a complete and totally ordered field, convergence of sequences, convergence of functions, continuity, derivatives. Prerequisite(s): MATH 2013 or MATH 2753, with a minimum grade of C-.', 3, 'Real Analysis 1', 'MATH', '3533', 'NULL', 'NULL', 10036),
('Complex numbers, analytic functions, elementary functions; contour integrals, Cauchy integral formula, maximum modulus theorem, series, residues and poles, conformal mapping; applications. Prerequisite(s): MATH 2013 or MATH 2753, with a minimum grade of C-.', 3, 'Introductory Complex Variables', 'MATH', '3543', 'NULL', 'NULL', 10037),
('A study of the history of mathematics from the seventeenth century onward, with particular emphasis being placed on the shift from classical methods to the more abstract modern setting. Topics covered may include: the vibrating string, Cauchy and the definition of limits, the origins of set theory, non-Euclidean geometry, the development of group theory from Lagrange to Klein and Lie. Prerequisite(s): One of MATH 2013 or MATH 2753, and one of MATH 2023 or MATH 2723, with minimum grades of C-.', 3, 'History of Mathematics', 'MATH', '3573', 'NULL', 'NULL', 10040),
('This course will provide an overview of the operational research modeling approach, and focuses on deterministic mathematical programming. Topics may include linear programming, transportation and assignment problems, network methods, integer programming, and nonlinear programming. Prerequisite(s): MATH 2313 and either MATH 2013 or MATH 2753, with minimum grades of C-.', 3, 'Oper Rsrch 1: Prog./Netwrks', 'MATH', '3603', 'NULL', 'NULL', 10041),
('This course will focus on stochastic modeling. Topics may include decision analysis, simulation, recurrent events such as birth and death processes, Markov processes, queuing theory and waiting line models, and inventory control. Prerequisite(s): MATH 2313 and either MATH 2213 or MATH 2233 with minimum grades of C-.', 3, 'Oper Rsrch2:Stochastic Models', 'MATH', '3633', 'NULL', 'NULL', 10044),
('Topics include systems of linear differential equations, Sturm-Liouville problems, orthogonal functions, Fourier series, dynamical systems, nonlinear systems. Prerequisite(s): MATH 1323 or MATH 1333 and MATH 2023 or MATH 2723, with minimum grades of C-.', 3, 'Ordinary Diff. Equations 2', 'MATH', '3713', 'NULL', 'NULL', 10046),
('An introduction to the mathematics of life contingencies. Topics include: Life insurance, survival models, life tables and selection, insurance benefits, annuities, premium calculation, and policy values. The course is designed to partially prepare students for the FAM exam of the Society of Actuaries. Prereq or Coreq: Math 2633, 3213 with minimum grades of C-.', 3, 'Fund Long-Term Actuarial Math', 'MATH', '3803', 'NULL', 'NULL', 10048),
('An introduction to the construction and evaluation of Actuarial models. Topics include: measures of risk, continuous and discrete actuarial models, coverage modifications, aggregate loss models. The course is designed to partially prepare students for the FAM exam of the Society of Actuaries. Prereq or Coreq: Math 3213 with a minimum grade of C-.', 3, 'Fund Short-Term Actuarial Math', 'MATH', '3813', 'NULL', 'NULL', 10050),
('Interest rate models, valuation of derivative securities, arbitrage and put-call parity, option pricing using the binomial and Black-Scholes models cash flow characteristics of exotic options, diffusion processes, Itôs lemma, simulation, risk management techniques. The course is designed to prepare students for the IFM exam of the Society of Actuaries. Prereq: Math 2633, 3213 with a minimum grade of C-.', 3, 'Investment/Financial Markets', 'MATH', '3823', 'NULL', 'NULL', 10051),
('Senior-level study of a particular topic in mathematics or statistics. Prerequisite(s): 6h MATH at 3000 level with minimum grade of C-, and permission of the Department.', 3, 'Topics in Math and Stats 1', 'MATH', '4013', 'NULL', 'NULL', 10052),
('Senior-level study of a particular topic in mathematics or statistics. Prerequisite(s): 6h MATH at 3000 level with minimum grade of C-, and permission of the Department.', 3, 'Topics in Math and Stats 2', 'MATH', '4023', 'NULL', 'NULL', 10053),
('Sampling distributions, elementary decision theory, estimation, testing hypotheses. Prerequisite(s): MATH 3213 with a minimum grade of C-.', 3, 'Mathematical Statistics', 'MATH', '4213', 'NULL', 'NULL', 10054),
('Review of least squares linear regression and maximum likelihood estimation. Generalized linear models, including binomial (logistic) regression, Poisson regression, contingency tables and log-linear models. Other topics in regression modeling such as survival analysis. Prerequisite(s): Two of MATH 3213, MATH 3233, MATH 3253, MATH 3263, MATH 3273, MATH 3283, MATH 3293, with minimum grades of C-.', 3, 'Generalized Linear Models', 'MATH', '4223', 'NULL', 'NULL', 10055),
('The course aims to develop broad guidelines for a comprehensive approach to data analysis. Topics include data preparation, outlier detection and exploratory data analysis. Criteria for the selection of suitable methodologies are discussed as well as model validation methods and empirical evaluation methods. The course will be based largely on case studies. Prerequisite(s): 6h from MATH 3233, MATH 3253, MATH 3263, MATH 3273, MATH 3283, MATH 3293, with minimum grades of C- 3h of which may be taken concurrently.', 3, 'Statistical Consulting', 'MATH', '4233', 'NULL', 'NULL', 10056),
('Group theory, fields, field extensions, leading to Galois theory. Prerequisite(s): MATH 3303 with a minimum grade of C-.', 3, 'Algebra 2', 'MATH', '4323', 'NULL', 'NULL', 10057),
('This course is an introduction to modern cryptographic techniques and their mathematical foundations. Review of elementary number theory and algebra; classical cryptosystems; encryption standards; public key cryptosystems; digital signatures. Elliptic curve cryptography and quantum cryptography may be included. Prerequisite(s): MATH 3303 or MATH 3513, with a minimum grade of C-.', 3, 'Cryptography', 'MATH', '4333', 'NULL', 'NULL', 10058),
('Isomorphism, classes of graphs, vertex degrees, graphic sequences, properties of trees, spanning trees, decompositions, Eulerian graphs, Hamiltonian graphs, matchings and factorizations including Halls Theorem, connectivity, graph colouring, planar graphs including Eulers Formula, extremality, optimization. Prerequisite(s): MATH 2313 and a MATH 3000/4000 level course either taken previously or concurrently, with minimum grades of C-.', 3, 'Graph Theory', 'MATH', '4343', 'NULL', 'NULL', 10059),
('Numerical differentiation and integration, numerical solution of differential equations, optimization. The solution of problems on a computer forms an integral part of the course. Prerequisite(s): MATH 3413 with a minimum grade of C- and enrolment in one 3000-level mathematics and statistics course.', 3, 'Advanced Numerical Methods', 'MATH', '4423', 'NULL', 'NULL', 10061),
('Topics include topological spaces and metric spaces; closure, interior, boundary; bases for a topology; mappings and continuity; compactness and coverings; connectivity; product and quotient spaces. Additional topics such as the classification of surfaces, homotopy theory, and the fundamental group, if time permits. Prerequisite(s): MATH 3533 with a minimum grade of C-.', 3, 'Introductory Topology', 'MATH', '4513', 'NULL', 'NULL', 10062),
('Measurable sets. Lebesgue and Stieltjes integrals in R² and abstract spaces. Selected applications. Prerequisite(s): MATH 3533 with a minimum grade of C-.', 3, 'Measure and Integration', 'MATH', '4523', 'NULL', 'NULL', 10063),
('A continuation of 3533. Topics include integration, infinite series and power series, convergence in Rn, topology in Rn, continuity and differentiability for multivariate functions, implicit and inverse function theorems, extra topics such as Fourier series if time permits. Prerequisite(s): MATH 3533 with a minimum grade of C-.', 3, 'Real Analysis 2', 'MATH', '4553', 'NULL', 'NULL', 10065),
('Linear and convex programming, convex functions and duality; Lagrange multipliers; Kuhn-Tucker methods. Topics may include: genetic algorithms, simulated annealing. Prerequisite(s): MATH 3533 and MATH 3603, with minimum grades of C-.', 3, 'Theory of Optimization', 'MATH', '4613', 'NULL', 'NULL', 10066),
('Topics may include linear second order partial differential equations (parabolic, elliptic, and hyperbolic), separation of variables, eigenfunction expansion, Fourier series, method of characteristics, non-linear waves. Prerequisite(s): MATH 3713 and either MATH 2013 or MATH 2753, with minimum grades of C-.', 3, 'Partial Differential Equations', 'MATH', '4753', 'NULL', 'NULL', 10069),
('Topics may include the Navier-Stokes equations, streamlines, circulation, vorticity, irrotational flow, potential flow, laminar flow, gravity waves, dimensional analysis, geophysical fluid dynamics, turbulence, hydrodynamic instability. Prerequisite/Corequisite(s): MATH 4753 with a minimum grade of C-, or permission of the instructor.', 3, 'Fluid Dynamics', 'MATH', '4773', 'NULL', 'NULL', 10071),
('Further topics in the mathematics of life contingencies. Topics include: multiple state models, pension mathematics, emerging costs for traditional life insurance and equity-linked insurance, option pricing, and embedded options. The course is designed to prepare students for the ALTAM exam of the Society of Actuaries. Prereq: Math 3803 with a grade of C- or better', 3, 'Adv Long-Term Actuarial Math', 'MATH', '4803', 'NULL', 'NULL', 10072),
('Further topics on construction and evaluation of Actuarial models. Topics include: construction of empirical models,estimation for complete or modified data, parametric estimation methods, model selection, credibility, and simulation. The course is designed to prepare students for the ASTAM exam of the Society of Actuaries. Prereq: Math 3813 with a grade of Cor better', 3, 'Adv Short-Term Actuarial Math', 'MATH', '4813', 'NULL', 'NULL', 10073),
('A honours project in mathematics or statistics to be completed in conjunction with the honours students advisor. An oral report (seminar) and a written report on the project are required in the second term. Prerequisite(s): at least third-year standing in the honours program. Antirequisite(s): Credit can be obtained for only one of MATH 4913 or MATH 4996.', 3, 'Honours Project', 'MATH', '4913', 'NULL', 'NULL', 10074),
('Elementary set theory, outcome spaces, probability spaces, laws of probability (discrete and continuous), independence, conditionality, random variables, random vectors, distributions of functions of random variables, moments and moment generating functions, special distributions, law of large numbers, central limit theorem.', 3, 'Probability', 'MATH', '5113', 'NULL', 'NULL', 10078),
('An introduction to the methodology and theory involved in multi-linear regression. Topics include: variable selection, indicator variables, correlation analysis and general linear hypothesis testing.', 3, 'Regression', 'MATH', '5133', 'NULL', 'NULL', 10079);
INSERT INTO `courses` (`Description`, `MinimumCredits`, `Title`, `SubjectCode`, `Number`, `YearsOffered`, `TermsOffered`, `Id`) VALUES
('Nonparametric statistical inference and statistical methods based on ranks. Topics include rank and sign tests, linear rank statistics, nonparametric analysis of variance, measures of concordance, relative power and efficiency.', 3, 'Nonparametric Statcl. Infer.', 'MATH', '5153', 'NULL', 'NULL', 10080),
('Statistical surveys, simple random sampling, sampling proportions and percentages, estimation of sample size, ratio and regression estimators, stratified random sampling, cluster sampling, probability sampling.', 3, 'Sampling Theory', 'MATH', '5163', 'NULL', 'NULL', 10081),
('Single and multi-factor analysis of variance, fixed and random effects models, analysis of co-variance, experimental design, including randomized block designs, balanced incomplete block designs, and factorial designs. Other topics may include repeated measures, split plot designs, response surface models, and fractional factorial designs.', 3, 'Design & Analy of Experiments', 'MATH', '5173', 'NULL', 'NULL', 10082),
('Seasonal effects, trends, descriptive methods. Stochastic processes, moving average and autoregressive processes. Autocorrelation. Model fitting and Box Jenkins models. Forecasting. Regression based procedures.', 3, 'Time Series', 'MATH', '5183', 'NULL', 'NULL', 10083),
('Modern statistical methods for supervised and unsupervised learning with large and complex data. Topics include: linear regression, classification, resampling methods, model selection and regularization, smooth regression, tree-based models, support vector machines, principal components and dimension reduction, clustering and statistical graphics.', 3, 'Statistical Learning', 'MATH', '5193', 'NULL', 'NULL', 10084),
('Sampling distributions, elementary decision theory, estimation, testing hypotheses.', 3, 'Mathematical Statistics', 'MATH', '5213', 'NULL', 'NULL', 10085),
('Review of least squares linear regression and maximum likelihood estimation. Generalized linear models, including binomial (logistic) regression, Poisson regression, contingency tables, and log-linear models. Other topics in regression modeling such as survival analysis.', 3, 'Generalized Linear Models', 'MATH', '5223', 'NULL', 'NULL', 10086),
('The course aims to develop broad guidelines for a comprehensive approach to data analysis. Topics include data preparation, outlier detection and exploratory data analysis. Criteria for the selection of suitable methodologies are discussed as well as model validation methods and empirical evaluation methods. The course will be based largely on case studies.', 3, 'Statistical Consulting', 'MATH', '5233', 'NULL', 'NULL', 10087),
('This course is an introduction to modern cryptographic techniques and their mathematical foundations. Review of elementary number theory and algebra; classical cryptosystems; encryption standards; public key cryptosystems; e-Business applications; digital signatures. Elliptic curve cryptography and quantum cryptography may be included.', 3, 'Cryptography', 'MATH', '5333', 'NULL', 'NULL', 10088),
('Numerical differentiation and integration, numerical solution of differential equations, optimization. The solution of problems on a computer forms an integral part of the course.', 3, 'Advanced Numerical Methods', 'MATH', '5423', 'NULL', 'NULL', 10089),
('Axioms for topological spaces; closure, interior and boundary operators; separation axioms; relativization; bases and subbases; mappings and continuity; compactness, connectedness, product spaces; metric spaces; completeness, nets and filters.', 3, 'Topology', 'MATH', '5513', 'NULL', 'NULL', 10090),
('Measurable sets. Lebesgue and Stieltjes integrals in R2 and abstract spaces. Selected applications.', 3, 'Measure and Integration', 'MATH', '5523', 'NULL', 'NULL', 10091),
('Elements of points set topology in R2 and metric spaces. Sequences of functions, uniform convergence. Derivatives. Multivariate and vector differential calculus. Multiple Riemann integrals. Jordan Content.', 3, 'Real Analysis', 'MATH', '5553', 'NULL', 'NULL', 10092),
('Linear and convex programming, convex functions and duality; Lagrange multipliers; Kuhn-Tucker methods. Topics may include: genetic algorithms, simulated annealing.', 3, 'Theory of Optimization', 'MATH', '5613', 'NULL', 'NULL', 10093),
('Aspects of mathematical modeling, dimensional analysis, multiple scale analysis, asymptotic methods, difference equations, calculus of variations.', 3, 'Mathematical Modeling', 'MATH', '5733', 'NULL', 'NULL', 10094),
('Topics may include linear second order partial differential equations (parabolic, elliptic, and hyperbolic), separation of variables, eigenfunction expansion, Fourier series, method of characteristics, nonlinear waves.', 3, 'Partial Differential Equations', 'MATH', '5753', 'NULL', 'NULL', 10095),
('Approximation theory, Fourier analysis, wavelet analysis, discrete signal processing, applications to audio and image processing and coding.', 3, 'Signal Processing', 'MATH', '5763', 'NULL', 'NULL', 10096),
('Preparation and practice for participating in research seminars. Includes attending all department research seminars and presenting once in each term.', 0, 'Research Seminar', 'MATH', '5810', 'NULL', 'NULL', 10097),
('', 3, 'Topics in Applied Statistics', 'MATH', '5823', 'NULL', 'NULL', 10098),
('', 3, 'Topics in Appld & Indust Math', 'MATH', '5843', 'NULL', 'NULL', 10099),
('', 3, 'Topics in Mathematics', 'MATH', '5863', 'NULL', 'NULL', 10100),
('', 3, 'Topics in Statistics', 'MATH', '5883', 'NULL', 'NULL', 10101),
('', 0, 'MSc Thesis', 'MATH', '5960', 'NULL', 'NULL', 10102),
('', 0, 'Mathematics Academic 11', 'MATH', 'MAHS11', 'NULL', 'NULL', 12159),
('', 0, 'Mathematics Academic 12 50', 'MATH', 'MAHS50', 'NULL', 'NULL', 12160),
('', 0, 'Mathematics Academic 12 60', 'MATH', 'MAHS60', 'NULL', 'NULL', 12161),
('', 0, 'Mathematics Calculus 12 50', 'MATH', 'MCHS50', 'NULL', 'NULL', 12162),
('', 0, 'Mathematics Calculus 12 60', 'MATH', 'MCHS60', 'NULL', 'NULL', 12163),
('', 0, 'Mathematics Pre-Calculus 11', 'MATH', 'MPHS11', 'NULL', 'NULL', 12164),
('', 0, 'Mathematics Pre-Calculus 12 50', 'MATH', 'MPHS50', 'NULL', 'NULL', 12165),
('', 0, 'Mathematics Pre-Calculus 12 60', 'MATH', 'MPHS60', 'NULL', 'NULL', 12166),
('Descriptive statistics and exploratory data analysis, including correlation and the least squares regression line; basic probability including random variables and normal distribution; sampling distributions; introduction to estimation, confidence intervals and hypothesis testing; one-way analysis of variance. Prerequisite(s): Mathematics 11 and 12, or Precalculus 11 and 12, or MATH 1003. Antirequisite(s): MATH 1213, MATH 2233, ECON 2613. Students who have completed Math 2213 may not subsequently receive credit for this course.', 3, 'Statistics 1', 'MATH', '1253', 'NULL', 'NULL', 13370),
('', 3, 'Honours Thesis 1', 'COMP', '407T', 'NULL', 'NULL', 13385),
('', 3, 'Honours Thesis 2', 'COMP', '408T', 'NULL', 'NULL', 13386),
('An honours thesis in mathematics or statistics to be completed in conjunction with the honours students supervisor. The course requirements include an oral report and a written thesis. Prerequisite(s): permission of thesis supervisor and department.', 3, 'Honours Thesis 1', 'MATH', '407T', 'NULL', 'NULL', 13409),
('An honours thesis in mathematics or statistics to be completed in conjunction with the honours students supervisor. The course requirements include an oral report and a written thesis. Prerequisite(s): permission of thesis supervisor and department.', 3, 'Honours Thesis 2', 'MATH', '408T', 'NULL', 'NULL', 13410),
('The study of functions and their properties. This includes an in-depth look at polynomials, rational, exponential, logarithmic, and trigonometric functions, and their applications. This course may not be used to satisfy major or minor Mathematics requirements.  Prerequisite: Permission of the instructor.', 3, 'Precalculus', 'MATH', '1003', 'NULL', 'NULL', 13452),
('', 0, 'Math 1003 Studio Lecture', 'MATH', '1000L', 'NULL', 'NULL', 13475),
('', 0, 'MATH-1253 Lab', 'MATH', '1250L', 'NULL', 'NULL', 13476),
('', 0, 'Comp 1233 Laboratory', 'COMP', '1230L', 'NULL', 'NULL', 13570),
('Introduction to both procedural and object-oriented programming for those students with previous programming experience. Topics include control statements, functions and algorithms, problem-solving, inheritance, polymorphism, recursion, and file processing. Lecture and Lab. Credit can be obtained for only one of COMP 1113 and COMP 1233; however, students who have taken COMP 1113 and subsequently take COMP 1233 may count COMP 1113 as a Computer Science elective.', 3, 'Introd to Computer Science', 'COMP', '1233', 'NULL', 'NULL', 13571),
('Introduction to computer concepts for programmers. Topics include the command line environment, shell programming, version control, debugging, text editors, word processing, spreadsheets, file management, data handling, and cloud-based environments. Prerequisite(s): COMP-1113 or COMP-1233', 3, 'Computer Concepts for Program', 'COMP', '1243', 'NULL', 'NULL', 13572),
('Theory and hands-on experience with the Internet and Web infrastructure, E-commerce and M-commerce  concepts, both client-side and server-side software technologies, database, E-payment, security and authentication, CSS, XML, and mobile data access and Web standards. Prerequisite(s): COMP 1123 or COMP 1233 with a minimum grade of C-. Antirequisite(s): Credit can be obtained for only one of COMP 3033 or COMP 2513.', 3, 'Full-Stack Cloud Computing', 'COMP', '3033', 'NULL', 'NULL', 13573),
('MSc project for students enrolled in the project option.', 0, 'Project', 'COMP', '5950', 'NULL', 'NULL', 13668),
('This course covers key mathematical concepts for reliable software development, including logic, computer-assisted theorem proving, and the Coq proof assistant, all of which are essential tools for building robust software. Students will also explore functional programming, operational semantics, Hoare logic, and static type systems. This course emphasizes formal verification techniques to help students ensure the correctness of their software designs.', 3, 'Software Foundations', 'COMP', '5143', 'NULL', 'NULL', 13807),
('This course covers the core principles or cryptography and network security. Students will explore classical encryption techniques such as substitution, transposition, and product ciphers, and moder algorithms like RSA. For network security, the course examines secure communication protocols, firewalls, IDS, and defenses against network attacks. Students will be able to design secure cryptographic systems and protect computer networks.', 3, 'Cryptography, Network Security', 'COMP', '5423', 'NULL', 'NULL', 13808),
('This course will investigate the Internet of Things (IoT) as a network of objects or \"things\" embedded with electronics, software and sensors connected on networks enabling them to collect or exchange information. Students will also learn to program and enable devices to collect or exchange information.', 3, 'Internet of Things Programming', 'COMP', '5163', 'NULL', 'NULL', 13809),
('This course will cover topics including the History of Programming languages, programming paradigms, language design, syntax, semantics and its specifications. This course is intended to provide the student with a firm grounding in a range of concepts and constructs in the theory and practice of programming languages.', 3, 'Principles of Programming', 'COMP', '5463', 'NULL', 'NULL', 13810),
('This course provides and overview on the core of Symbolic AI, covering key topics such as Propositional and First-Order Logic, Non-Monotonic Logics, and techniques for Reasoning under Uncertainty: Probabilistic and possibilistic logics. Students will explore advanced methods like Bayesian Networks and their applications in decision-making under uncertainty, as well as planning techniques. The course also covers Case-Based Reasoning for problem solving.', 3, 'Knowledge Rep. and Reasoning', 'COMP', '5453', 'NULL', 'NULL', 13811),
('This course introduces the fundamental concepts of digital image processing from a practical standpoint, while providing essential theoretical background. Key topics will include image acquisition, processing techniques, practical application, and basic image analysis algorithms. The course is designed to make digital image processing accessible to computer scientists and engineers with little prior experience in the subject.', 3, 'Image Processing', 'COMP', '5443', 'NULL', 'NULL', 13812),
('This course focuses on population-based intelligence models to simulate biological evolution for stochastic search. Necessary algorithm design considerations including representations, cost functions, and credit assignment mechanisms. The course will primarily focus on three main paradigms: Genetic Algorithms, Genetic Programming. Special attention will be given to co-evolution, multi-objective optimization and automatic program decomposition.', 3, 'Evolutionary Computation', 'COMP', '5433', 'NULL', 'NULL', 13813),
('This course will focus on working with limited/noisy data to build accurate models useable in real-world situations with data mimicking or from a real-world source. Deep and shallow learning approaches will be explored, with proper data analysis and preparation techniques. Time-series data analysis will be performed. Students will learn to merge these predictive models into a simulated business system.', 3, 'ML With Real-World Data', 'COMP', '5183', 'NULL', 'NULL', 13814),
('This course will introduce basic data mining techniques such as preprocessing (e.g., aggregation, sampling and dimensionality reduction), pattern mining, classification (e.g., decision trees, rules), prediction modelling (e.g., Bayesian networks, nearest neighbours), cluster analysis, and outlier detection before covering more advanced data mining techniques such as advanced clustering (e.g., graph-based and fuzzy clustering), infrequent patterns, machine learning and avoiding false discoveries.', 3, 'Data Mining', 'COMP', '5543', 'NULL', 'NULL', 13815),
('This course introduces the core concepts of computer vision covering the essential methodologies and techniques. Students will study the theory behind essential tasks such as semantic segmentation, feature extraction, image classification, and object detection. By course completion, students will be equipped to apply fundamental computer vision principles and tools to solve practical problems in both scientific and commercial contexts.', 3, 'Computer Vision', 'COMP', '5563', 'NULL', 'NULL', 13816),
('This course provides an overview of state-of-the-art agent and multi-agent technologies and their applications, with special emphasis on the core issues involved in the research of agent-based systems. This course covers agent architectures, agents behaviours, coordination and inter-agent communication. Pervasive, ubiquitous and cloud computing and how agent systems can be applied in these environments will be covered.', 3, 'Multi-Agent Systems', 'COMP', '5583', 'NULL', 'NULL', 13817),
('This course will examine contemporary tools, methodologies, and strategies fundamental to modern parallel problem-solving. The focus will be on software resources, but will also examine associated hardware architectures employed to achieve parallelism in computationally intensive tasks, with students solving real-world problems on existing parallel machines. Students will read recent research publications and participate in a significant parallel project implementation.', 3, 'High Perf & Parallel Computing', 'COMP', '5573', 'NULL', 'NULL', 13818),
('This course constructs prototype intelligent systems using state-of-the-art Artificial Intelligence (AI) techniques and explores rule-based and statistical approaches to AI. Students will create computer programs that use Natural Language Processing (NLP) to respond to commands written in English and learn how to design Machine Learning (ML) systems that can solve difficult problems by learning from examples.', 3, 'Intro to Intelligent Systems', 'COMP', '5513', 'NULL', 'NULL', 13819),
('This course introduces the history and algorithms in neural networks, covering topics like perceptron, gradient descent learning algorithm, backpropagation, linear-separability, multi-layer perceptron, Hopefield network, self-organizing maps, restricted Boltzmann machine, self-supervised learning. Students will delve into advanced topics on deep neural network architectures like Convolutional Neural Network (CNN), Recurrent Neural Network (RNN), Long Sort-Term Memory (LSTM), Generative Adversarial Network (GAN).', 3, 'Neural Networks', 'COMP', '5173', 'NULL', 'NULL', 13820),
('This course explores how AI enhances security systems and protects them. Topics include machine learning algorithms, anomaly detection, and AI-driven automation in tasks like IDS, malware analysis. Students will gain practical insights for both offensive and defensive cybersecurity applications preparing them for the challenge of todays security landscape. Protection strategies on AI model security also will be discussed.', 3, 'AI in Computer Security', 'COMP', '5153', 'NULL', 'NULL', 13821),
('This course is designed to assist students with the transition from high school mathematics to university mathematics. Topics include the study of algebraic expressions including polynomial, exponential, rational, and radical expressions; linear inequalities; problem solving; and an introduction to logic sets. This course may not be used to satisfy Mathematics requirements for any degree program. Prerequisite(s): Permission of the instructor. Antirequisite(s): Students who have received credit for any other MATH 1000 level course may not subsequently receive credit for this course.', 3, 'Fundamentals of Academic Math', 'MATH', '1603', 'NULL', 'NULL', 13832),
('', 0, 'MATH 1323 Lab', 'MATH', '1320L', 'NULL', 'NULL', 13893);

-- --------------------------------------------------------

--
-- Table structure for table `EquatedCourses`
--

CREATE TABLE `EquatedCourses` (
  `EquatedCourseId` int NOT NULL,
  `courseId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `EquatedCourses`
--

INSERT INTO `EquatedCourses` (`EquatedCourseId`, `courseId`) VALUES
(6641, 7691),
(11050, 10071);

-- --------------------------------------------------------

--
-- Table structure for table `fromcourses`
--

CREATE TABLE `fromcourses` (
  `id` int DEFAULT NULL,
  `coursename` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `groupsid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fromcourses`
--

INSERT INTO `fromcourses` (`id`, `coursename`, `title`, `groupsid`) VALUES
(9958, 'MATH-1413', 'Discrete Mathematics', 24229),
(9954, 'MATH-1313', 'Foundations', 24229),
(9955, 'MATH-1323', 'Matrix Algebra', 24231),
(9956, 'MATH-1333', 'Introduction to Linear Algebra', 24231),
(7699, 'COMP-2513', 'Web-Centric Programming', 22783),
(7740, 'COMP-3513', 'Systems Analysis and Design', 22783),
(7739, 'COMP-3503', 'Data Analytics', 22783),
(7760, 'COMP-3923', 'Special Topics', 22783),
(7774, 'COMP-4613', 'Artificial Intelligence 2', 22783),
(7783, 'COMP-4923', 'Special Topics', 22783),
(9986, 'MATH-2223', 'Applied Statistics for Science', 22787),
(9990, 'MATH-2243', 'Statistics II for Life Science', 22787),
(9992, 'MATH-2253', 'Statistics II for Science', 22787),
(10018, 'MATH-3233', 'Regression', 22789),
(10023, 'MATH-3283', 'Time Series', 22789),
(10024, 'MATH-3293', 'Statistical Learning', 22789),
(7714, 'COMP-2853', 'Handling Data Concpts/Apps', 22791),
(7997, 'ECON-1013', 'Microeconomic Principles', 22791),
(7998, 'ECON-1023', 'Macroeconomic Principles', 22791),
(7114, 'BUSI-1013', 'Financial Accounting 1', 22791),
(7127, 'BUSI-2013', 'Management Accounting', 22791),
(7143, 'BUSI-2513', 'Operations Management', 22791),
(7153, 'BUSI-2803', 'Business Technology Management', 22791),
(7166, 'BUSI-3063', 'Business Analytics Modeling 1', 22791),
(7786, 'COMP-4996', 'Thesis', 24239),
(13385, 'COMP-407T', 'Honours Thesis 1', 24239),
(13386, 'COMP-408T', 'Honours Thesis 2', 24239),
(9958, 'MATH-1413', 'Discrete Mathematics', 24243),
(9954, 'MATH-1313', 'Foundations', 24243),
(9955, 'MATH-1323', 'Matrix Algebra', 24245),
(9956, 'MATH-1333', 'Introduction to Linear Algebra', 24245),
(13370, 'MATH-1253', 'Statistics 1', 24247),
(9986, 'MATH-2223', 'Applied Statistics for Science', 24247);

-- --------------------------------------------------------

--
-- Table structure for table `fromsubjects`
--

CREATE TABLE `fromsubjects` (
  `code` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(29) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fromsubjects`
--

INSERT INTO `fromsubjects` (`code`, `description`, `id`) VALUES
('COMP', 'Computer Science', 24211),
('ARAM', 'Aramaic', 24113),
('FRAN', 'French', 24113),
('GERM', 'German', 24113),
('GREE', 'Greek', 24113),
('HEBR', 'Hebrew', 24113),
('LATI', 'Latin', 24113),
('SPAN', 'Spanish', 24113),
('ART', 'Art', 24115),
('CLAS', 'Classics', 24115),
('CREL', 'Comparative Religion', 24115),
('ECON', 'Economics', 24115),
('ENGL', 'English', 24115),
('ESST', 'Environ. and Sustain. Studies', 24115),
('FRAN', 'French', 24115),
('GERM', 'German', 24115),
('GREE', 'Greek', 24115),
('HIST', 'History', 24115),
('IDST', 'Interdisciplinary Studies', 24115),
('LATI', 'Latin', 24115),
('MUSI', 'Music', 24115),
('PHIL', 'Philosophy', 24115),
('POLS', 'Political Science', 24115),
('SOCI', 'Sociology', 24115),
('SPAN', 'Spanish', 24115),
('THEA', 'Theatre', 24115),
('WGST', 'Women\'s and Gender Studies', 24115),
('APSC', 'Applied Science', 22837),
('BIOL', 'Biology', 22837),
('BUSI', 'Business Administration', 22837),
('CHEM', 'Chemistry', 22837),
('ELES', 'Elective Science', 22837),
('ENVS', 'Environmental Science', 22837),
('GEOL', 'Geology', 22837),
('GEOM', 'Applied Geomatics', 22837),
('NUTR', 'Nutrition', 22837),
('PHYS', 'Physics', 22837),
('PSYC', 'Psychology', 22837),
('COMP', 'Computer Science', 24227),
('ARAM', 'Aramaic', 9033),
('FRAN', 'French', 9033),
('FREN', 'French (retired Subject', 9033),
('GERM', 'German', 9033),
('GREE', 'Greek', 9033),
('HEBR', 'Hebrew', 9033),
('LATI', 'Latin', 9033),
('SPAN', 'Spanish', 9033),
('ART', 'Art', 9036),
('CLAS', 'Classics', 9036),
('CREL', 'Comparative Religion', 9036),
('ECON', 'Economics', 9036),
('ENGL', 'English', 9036),
('ESST', 'Environ. and Sustain. Studies', 9036),
('FRAN', 'French', 9036),
('GERM', 'German', 9036),
('GREE', 'Greek', 9036),
('HIST', 'History', 9036),
('IDST', 'Interdisciplinary Studies', 9036),
('LATI', 'Latin', 9036),
('MUSI', 'Music', 9036),
('PHIL', 'Philosophy', 9036),
('POLS', 'Political Science', 9036),
('SOCI', 'Sociology', 9036),
('SPAN', 'Spanish', 9036),
('THEA', 'Theatre', 9036),
('WGST', 'Women\'s and Gender Studies', 9036),
('APSC', 'Applied Science', 9048),
('BIOL', 'Biology', 9048),
('BUSI', 'Business Administration', 9048),
('CHEM', 'Chemistry', 9048),
('ENVS', 'Environmental Science', 9048),
('GEOL', 'Geology', 9048),
('NUTR', 'Nutrition', 9048),
('PHYS', 'Physics', 9048),
('PSYC', 'Psychology', 9048),
('APSC', 'Applied Science', 22805),
('BIOL', 'Biology', 22805),
('BUSI', 'Business Administration', 22805),
('CHEM', 'Chemistry', 22805),
('ELES', 'Elective Science', 22805),
('ENVS', 'Environmental Science', 22805),
('GEOL', 'Geology', 22805),
('GEOM', 'Applied Geomatics', 22805),
('NUTR', 'Nutrition', 22805),
('PHYS', 'Physics', 22805),
('PSYC', 'Psychology', 22805),
('ARAM', 'Aramaic', 24086),
('FRAN', 'French', 24086),
('GERM', 'German', 24086),
('GREE', 'Greek', 24086),
('HEBR', 'Hebrew', 24086),
('LATI', 'Latin', 24086),
('SPAN', 'Spanish', 24086),
('ART', 'Art', 24088),
('CLAS', 'Classics', 24088),
('CREL', 'Comparative Religion', 24088),
('ECON', 'Economics', 24088),
('ENGL', 'English', 24088),
('ESST', 'Environ. and Sustain. Studies', 24088),
('FRAN', 'French', 24088),
('GERM', 'German', 24088),
('GREE', 'Greek', 24088),
('HIST', 'History', 24088),
('IDST', 'Interdisciplinary Studies', 24088),
('LATI', 'Latin', 24088),
('MUSI', 'Music', 24088),
('PHIL', 'Philosophy', 24088),
('POLS', 'Political Science', 24088),
('SOCI', 'Sociology', 24088),
('SPAN', 'Spanish', 24088),
('THEA', 'Theatre', 24088),
('WGST', 'Women\'s and Gender Studies', 24088),
('BUSI', 'Business Administration', 28791),
('COMP', 'Computer Science', 28793),
('ARAM', 'Aramaic', 22832),
('FRAN', 'French', 22832),
('GERM', 'German', 22832),
('GREE', 'Greek', 22832),
('HEBR', 'Hebrew', 22832),
('LATI', 'Latin', 22832),
('SPAN', 'Spanish', 22832),
('ART', 'Art', 22834),
('CLAS', 'Classics', 22834),
('CREL', 'Comparative Religion', 22834),
('ECON', 'Economics', 22834),
('ENGL', 'English', 22834),
('ESST', 'Environ. and Sustain. Studies', 22834),
('FRAN', 'French', 22834),
('GERM', 'German', 22834),
('GREE', 'Greek', 22834),
('HIST', 'History', 22834),
('IDST', 'Interdisciplinary Studies', 22834),
('LATI', 'Latin', 22834),
('MUSI', 'Music', 22834),
('PHIL', 'Philosophy', 22834),
('POLS', 'Political Science', 22834),
('SOCI', 'Sociology', 22834),
('SPAN', 'Spanish', 22834),
('THEA', 'Theatre', 22834),
('WGST', 'Women\'s and Gender Studies', 22834),
('COMP', 'Computer Science', 16882),
('COMP', 'Computer Science', 16885),
('MATH', 'Mathematics and Statistics', 16885),
('COMP', 'Computer Science', 24217),
('COMP', 'Computer Science', 24241),
('MATH', 'Mathematics and Statistics', 24249);

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `LocationCodes` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Locations_pk` int NOT NULL,
  `courseId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`LocationCodes`, `Locations_pk`, `courseId`) VALUES
('WMC', 2, 7745);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `EndTime` text COLLATE utf8mb4_general_ci,
  `Days` text COLLATE utf8mb4_general_ci,
  `StartTime` text COLLATE utf8mb4_general_ci,
  `Frequency` text COLLATE utf8mb4_general_ci,
  `IsOnline` text COLLATE utf8mb4_general_ci,
  `meetings_pk` int NOT NULL,
  `sectionId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`EndTime`, `Days`, `StartTime`, `Frequency`, `IsOnline`, `meetings_pk`, `sectionId`) VALUES
('2026-03-16T13:20:00+00:00', '3', '2026-03-16T12:30:00+00:00', 'W', 'false', 2, 20503),
('2026-03-16T16:50:00+00:00', '4', '2026-03-16T16:00:00+00:00', 'W', 'false', 4, 20504),
('2026-03-16T14:20:00+00:00', '5', '2026-03-16T13:30:00+00:00', 'W', 'false', 6, 20505),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 8, 20508),
('2026-03-16T20:20:00+00:00', '2,4', '2026-03-16T19:00:00+00:00', 'W', 'false', 10, 20509),
('2026-03-16T16:50:00+00:00', '3', '2026-03-16T16:00:00+00:00', 'W', 'false', 12, 20511),
('2026-03-16T15:20:00+00:00', '5', '2026-03-16T14:30:00+00:00', 'W', 'false', 14, 20512),
('2026-03-16T16:50:00+00:00', '5', '2026-03-16T16:00:00+00:00', 'W', 'false', 16, 20513),
('2026-03-16T13:20:00+00:00', '1,3,5', '2026-03-16T12:30:00+00:00', 'W', 'false', 18, 20515),
('2026-03-16T18:50:00+00:00', '1,3', '2026-03-16T17:30:00+00:00', 'W', 'false', 20, 20516),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 22, 20519),
('2026-03-16T20:20:00+00:00', '2,4', '2026-03-16T19:00:00+00:00', 'W', 'false', 24, 20521),
('2026-03-16T16:50:00+00:00', '5', '2026-03-16T16:00:00+00:00', 'W', 'false', 26, 20523),
('2026-03-16T17:20:00+00:00', '1,3', '2026-03-16T16:00:00+00:00', 'W', 'false', 28, 20525),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 30, 20527),
('2026-03-16T17:20:00+00:00', '2,4', '2026-03-16T16:00:00+00:00', 'W', 'false', 32, 20531),
('2026-03-16T20:20:00+00:00', '1,3', '2026-03-16T19:00:00+00:00', 'W', 'false', 34, 20536),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 36, 20540),
('2026-03-16T13:20:00+00:00', '1,3,5', '2026-03-16T12:30:00+00:00', 'W', 'false', 38, 20541),
('2026-03-16T17:20:00+00:00', '1,3', '2026-03-16T16:00:00+00:00', 'W', 'false', 40, 20542),
('2026-03-16T20:20:00+00:00', '2,4', '2026-03-16T19:00:00+00:00', 'W', 'false', 42, 20543),
('2026-03-16T17:20:00+00:00', '2,4', '2026-03-16T16:00:00+00:00', 'W', 'false', 44, 20547),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 46, 20550),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 49, 20554),
('2026-03-16T18:50:00+00:00', '1,3', '2026-03-16T17:30:00+00:00', 'W', 'false', 51, 20555),
('2026-03-16T18:50:00+00:00', '4', '2026-03-16T16:00:00+00:00', 'W', 'false', 53, 20556),
('2026-03-16T18:50:00+00:00', '2,4', '2026-03-16T17:30:00+00:00', 'W', 'false', 55, 20558),
('2026-03-16T20:20:00+00:00', '4', '2026-03-16T19:00:00+00:00', 'W', 'false', 57, 21057),
('2026-03-16T20:20:00+00:00', '3', '2026-03-16T19:00:00+00:00', 'W', 'false', 59, 21058),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 61, 21062),
('2026-03-16T17:20:00+00:00', '3', '2026-03-16T16:00:00+00:00', 'W', 'false', 63, 21064),
('2026-03-16T13:50:00+00:00', '4', '2026-03-16T12:30:00+00:00', 'W', 'false', 65, 21065),
('2026-03-16T15:20:00+00:00', '4', '2026-03-16T14:00:00+00:00', 'W', 'false', 67, 21066),
('2026-03-16T17:20:00+00:00', '4', '2026-03-16T16:00:00+00:00', 'W', 'false', 69, 21067),
('2026-03-16T13:20:00+00:00', '1,3,5', '2026-03-16T12:30:00+00:00', 'W', 'false', 71, 21069),
('2026-03-16T14:20:00+00:00', '1,3,5', '2026-03-16T13:30:00+00:00', 'W', 'false', 73, 21070),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 75, 21071),
('2026-03-16T17:20:00+00:00', '1', '2026-03-16T16:00:00+00:00', 'W', 'false', 77, 21082),
('2026-03-16T18:50:00+00:00', '2', '2026-03-16T17:30:00+00:00', 'W', 'false', 79, 21083),
('2026-03-16T18:50:00+00:00', '4', '2026-03-16T17:30:00+00:00', 'W', 'false', 81, 21085),
('2026-03-16T12:20:00+00:00', '1,3,5', '2026-03-16T11:30:00+00:00', 'W', 'false', 83, 21094),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 85, 21096),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 87, 21100),
('2026-03-16T14:20:00+00:00', '1,3,5', '2026-03-16T13:30:00+00:00', 'W', 'false', 89, 21101),
('2026-03-16T14:20:00+00:00', '1,3,5', '2026-03-16T13:30:00+00:00', 'W', 'false', 91, 21102),
('2026-03-16T13:20:00+00:00', '1,3,5', '2026-03-16T12:30:00+00:00', 'W', 'false', 93, 21103),
('2026-03-16T12:20:00+00:00', '1,3,5', '2026-03-16T11:30:00+00:00', 'W', 'false', 95, 21104),
('2026-03-16T18:50:00+00:00', '1,3', '2026-03-16T17:30:00+00:00', 'W', 'false', 97, 21105),
('2026-03-16T14:20:00+00:00', '1,3,5', '2026-03-16T13:30:00+00:00', 'W', 'false', 99, 21109),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 101, 21110),
('2026-03-16T20:20:00+00:00', '1', '2026-03-16T19:00:00+00:00', 'W', 'false', 103, 21113),
('2026-03-16T13:20:00+00:00', '1,3,5', '2026-03-16T12:30:00+00:00', 'W', 'false', 105, 21114),
('2026-03-16T18:50:00+00:00', '2', '2026-03-16T17:30:00+00:00', 'W', 'false', 107, 21118),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 109, 21119),
('2026-03-16T18:50:00+00:00', '1', '2026-03-16T17:30:00+00:00', 'W', 'false', 111, 21120),
('2026-03-16T20:20:00+00:00', '1', '2026-03-16T19:00:00+00:00', 'W', 'false', 113, 21121),
('2026-03-16T17:20:00+00:00', '2', '2026-03-16T16:00:00+00:00', 'W', 'false', 115, 21122),
('2026-03-16T20:20:00+00:00', '2', '2026-03-16T19:00:00+00:00', 'W', 'false', 117, 21123),
('2026-03-16T12:20:00+00:00', '1,3,5', '2026-03-16T11:30:00+00:00', 'W', 'false', 119, 21124),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 121, 21125),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 123, 21126),
('2026-03-16T15:20:00+00:00', '4', '2026-03-16T14:00:00+00:00', 'W', 'false', 125, 21127),
('2026-03-16T17:20:00+00:00', '4', '2026-03-16T16:00:00+00:00', 'W', 'false', 127, 21128),
('2026-03-16T18:50:00+00:00', '4', '2026-03-16T17:30:00+00:00', 'W', 'false', 129, 21129),
('2026-03-16T15:20:00+00:00', '2', '2026-03-16T14:00:00+00:00', 'W', 'false', 131, 21130),
('2026-03-16T12:20:00+00:00', '1,3,5', '2026-03-16T11:30:00+00:00', 'W', 'false', 133, 21131),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 135, 21132),
('2026-03-16T16:50:00+00:00', '1,3,5', '2026-03-16T16:00:00+00:00', 'W', 'false', 137, 21134),
('2026-03-16T20:20:00+00:00', '3', '2026-03-16T19:00:00+00:00', 'W', 'false', 139, 21137),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 141, 21138),
('2026-03-16T15:20:00+00:00', '2,4', '2026-03-16T14:00:00+00:00', 'W', 'false', 143, 21143),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 145, 21147),
('2026-03-16T20:20:00+00:00', '2,4', '2026-03-16T19:00:00+00:00', 'W', 'false', 148, 21152),
('2026-03-16T17:20:00+00:00', '2,4', '2026-03-16T16:00:00+00:00', 'W', 'false', 150, 21153),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 152, 21154),
('2026-03-16T18:20:00+00:00', '1,3,5', '2026-03-16T17:30:00+00:00', 'W', 'false', 154, 21155),
('NULL', '', 'NULL', 'W', 'false', 156, 21849),
('2026-03-16T18:20:00+00:00', '1,3,5', '2026-03-16T17:30:00+00:00', 'W', 'false', 158, 21850),
('2026-03-16T13:50:00+00:00', '2,4', '2026-03-16T12:30:00+00:00', 'W', 'false', 160, 21851),
('NULL', '', 'NULL', 'W', 'false', 162, 21852),
('2026-03-16T18:50:00+00:00', '2,4', '2026-03-16T17:30:00+00:00', 'W', 'false', 164, 21853),
('NULL', '', 'NULL', 'W', 'false', 166, 21854),
('2026-03-16T17:20:00+00:00', '5', '2026-03-16T16:00:00+00:00', 'W', 'false', 168, 21977),
('2026-03-16T20:20:00+00:00', '1', '2026-03-16T19:00:00+00:00', 'W', 'false', 170, 21994),
('2026-03-16T20:20:00+00:00', '3', '2026-03-16T19:00:00+00:00', 'W', 'false', 172, 21995),
('NULL', '', 'NULL', 'W', 'true', 174, 22254),
('NULL', '', 'NULL', 'W', 'true', 176, 22255),
('NULL', '', 'NULL', 'W', 'true', 178, 22256),
('NULL', '', 'NULL', 'W', 'true', 180, 22296),
('NULL', '', 'NULL', 'W', 'true', 182, 22297),
('NULL', '', 'NULL', 'W', 'true', 184, 22298),
('NULL', '', 'NULL', 'W', 'true', 186, 22299),
('NULL', '', 'NULL', 'W', 'true', 188, 22300),
('NULL', '', 'NULL', 'W', 'false', 190, 22342),
('NULL', '', 'NULL', 'W', 'false', 192, 22347),
('2026-03-16T18:20:00+00:00', '1,3,5', '2026-03-16T17:30:00+00:00', 'W', 'false', 194, 22372),
('2026-03-16T15:20:00+00:00', '1,3,5', '2026-03-16T14:30:00+00:00', 'W', 'false', 196, 22373),
('2026-03-16T19:00:00+00:00', '1,2,3,4,5', '2026-03-16T16:00:00+00:00', 'W', 'false', 200, 22541),
('2026-03-17T00:00:00+00:00', '1,2,3,4,5', '2026-03-16T21:00:00+00:00', 'W', 'false', 202, 22552),
('2026-03-16T19:00:00+00:00', '1,2,3,4,5', '2026-03-16T16:00:00+00:00', 'W', 'false', 204, 22569),
('2026-03-16T15:00:00+00:00', '1,2,3,4,5', '2026-03-16T12:00:00+00:00', 'W', 'false', 206, 22570),
('2026-03-16T19:00:00+00:00', '1,2,3,4,5', '2026-03-16T12:00:00+00:00', 'W', 'false', 208, 22571);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int NOT NULL,
  `code` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `academiclevelcode` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minimumcredits` int DEFAULT NULL,
  `minimuminstitutionalcredits` int DEFAULT NULL,
  `major` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `degree` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `code`, `academiclevelcode`, `title`, `minimumcredits`, `minimuminstitutionalcredits`, `major`, `degree`) VALUES
(1, 'BACS.MOUB', 'UG', 'Bach. of Appl. Comp. Sci. Mobile and Ubiq. Computing', 120, 60, 'Mobile & Ubiquitous Computing', 'Bachelor Applied Computer Sci'),
(2, 'BCS', 'UG', 'Bach. of Computer Science', 120, 60, '', 'Bachelor of Computer Science'),
(3, 'BACS.GDEV', 'UG', 'Bach. of Applied Computer Science Game Development', 120, 60, 'Game Development', 'Bachelor Applied Computer Sci'),
(4, 'BACS.SDEV', 'UG', 'Bach. of Applied Computer Science Software Development', 120, 60, 'Software Development', 'Bachelor Applied Computer Sci'),
(5, 'BACS.DATA', 'UG', 'Bach. of Applied Computer Science Data Analytics', 120, 60, 'Data Analytics', 'Bachelor Applied Computer Sci'),
(6, 'BACS.IDST', 'UG', 'Bach. of Applied Computer Science Interdisciplinary Study', 120, 60, 'Interdisciplinary Studies', 'Bachelor Applied Computer Sci'),
(7, 'BCSH', 'UG', 'Bach. of Computer Science Hons.', 120, 60, '', 'Bachelor of Computer Sci (h)');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int NOT NULL,
  `description` varchar(43) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minsubrequirements` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directive` varchar(37) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `description`, `minsubrequirements`, `directive`) VALUES
(9028, 'BCS Common Requirements', 'null', 'Complete all of the following  items.'),
(9039, '12h from Science (exc. CS) or from Business', 'null', 'Complete the following item.'),
(15525, 'BCSH Electives', 'null', 'Complete all of the following  items.'),
(16880, 'BACS Interdisciplinary Study', NULL, 'Complete all of the following  items.'),
(17743, 'BCS Electives', 'null', 'Complete all of the following  items.'),
(19657, 'BACS Mobile & Ubiq. Computing', 'null', 'Complete all of the following  items.'),
(22796, 'BACS Game Development', 'null', 'Complete all of the following  items.'),
(22820, 'BACS Core Courses', NULL, 'Complete all of the following  items.'),
(24073, 'BACS Core Courses (SDEV only)', 'null', 'Complete all of the following  items.'),
(24095, 'BACS Core Courses', 'null', 'Complete all of the following  items.'),
(24206, 'Comp Sci Core: Intro COMP (Main) (BACS/BCS)', '1', 'Complete 1 of the following 2 items.'),
(24212, 'Comp Sci Core: Intro COMP (Main) (BCSH)', '1', 'Complete 1 of the following 2 items.'),
(24221, 'BCS Specific Requirements', 'null', 'Complete all of the following  items.'),
(24235, 'BCSH Honours Requirements', 'null', 'Complete all of the following  items.'),
(28787, 'BACS Software Development', 'null', 'Complete all of the following  items.');

-- --------------------------------------------------------

--
-- Table structure for table `requisites`
--

CREATE TABLE `requisites` (
  `requirementcode` int NOT NULL,
  `isprotected` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `completionorder` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `displaytext` varchar(148) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `displaytextextension` varchar(67) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `courseId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requisites`
--

INSERT INTO `requisites` (`requirementcode`, `isprotected`, `completionorder`, `displaytext`, `displaytextextension`, `courseId`) VALUES
(534, 'true', 'Previous', 'MATH-1023 and MATH-1323 or MATH-1333 with minimum grade C- required', '- Must be completed prior to taking this course.', 10030),
(536, 'true', 'Previous', 'MATH-2313 with minimum grade C- required or permission of instructor', '- Must be completed prior to taking this course.', 10034),
(538, 'true', 'Previous', 'MATH-2013 or MATH-2753 with minimum grade C- required', '- Must be completed prior to taking this course.', 10036),
(544, 'true', 'Previous', 'MATH-2013 or MATH-2753 with minimum grade C- required', '- Must be completed prior to taking this course.', 10037),
(546, 'true', 'Previous', 'MATH-2013 or MATH-2753 and MATH-2023 or MATH-2753 with minimum grade C- required', '- Must be completed prior to taking this course.', 10040),
(548, 'true', 'Previous', 'MATH-2313 and MATH-2013 or MATH-2753 with minimum grade C- required', '- Must be completed prior to taking this course.', 10041),
(550, 'true', 'Previous', 'MATH-2313 and MATH-2213 or MATH-1253 (previously known as MATH-2233) with minimum grade C- required', '- Must be completed prior to taking this course.', 10044),
(552, 'true', 'Previous', 'MATH-1323 or MATH-1333 and MATH-2023 or MATH-2723 with minimum grade C- required', '- Must be completed prior to taking this course.', 10046),
(554, 'true', 'PreviousOrConcurrent', 'MATH-2633 and MATH-3213 with minimum grade C- required', '- Must be taken either prior to or at the same time as this course.', 10048),
(555, 'true', 'PreviousOrConcurrent', 'MATH-3213 with minimum grade C- required', '- Must be taken either prior to or at the same time as this course.', 10050),
(556, 'true', 'Previous', 'MATH-2633 and MATH-3213 with minimum grade C- required', '- Must be completed prior to taking this course.', 10051),
(726, 'true', 'Previous', 'MATH-3213 with minimum grade C- required', '- Must be completed prior to taking this course.', 10054),
(731, 'true', 'Previous', 'Two of MATH-3213, MATH-3233, MATH-3253, MATH-3263, MATH-3273, MATH-3283, MATH-3293, with minimum grades of C- required', '- Must be completed prior to taking this course.', 10055),
(737, 'true', 'PreviousOrConcurrent', '6h from MATH-3233, MATH-3253, MATH-3263, MATH-3273, MATH-3283 or MATH-3293, with minimum grades of C- required', '- Must be taken either prior to or at the same time as this course.', 10056),
(741, 'true', 'Previous', 'MATH-3303 with minimum grade C- required', '- Must be completed prior to taking this course.', 10057),
(744, 'true', 'Previous', 'MATH-3303 or MATH-3513 with minimum grade C- required', '- Must be completed prior to taking this course.', 10058),
(747, 'true', 'PreviousOrConcurrent', 'MATH-2313 with minimum grade C- required 3 credits from 3000 or 4000 level with minimum grade C- required', '- Must be taken either prior to or at the same time as this course.', 10059),
(751, 'true', 'Previous', 'MATH 3413 with minimum grade C- required and enrolment in one 3000-level mathematics and statistics course', '- Must be completed prior to taking this course.', 10061),
(754, 'true', 'Previous', 'MATH-3533 with minimum grade C- required', '- Must be completed prior to taking this course.', 10062),
(768, 'true', 'Previous', 'MATH-3533 with minimum grade C- required', '- Must be completed prior to taking this course.', 10063),
(773, 'true', 'Previous', 'MATH-3533 with minimum grade C- required', '- Must be completed prior to taking this course.', 10065),
(774, 'true', 'Previous', 'MATH-3533 and MATH-3603 with minimum grade C- required', '- Must be completed prior to taking this course.', 10066),
(775, 'true', 'Previous', 'MATH-3713 and MATH-2013 or MATH-2753 with minimum grade C- required', '- Must be completed prior to taking this course.', 10069),
(776, 'true', 'PreviousOrConcurrent', 'MATH-4753 with minimum grade C- required or permission of instructor', '- Must be taken either prior to or at the same time as this course.', 10071),
(778, 'true', 'Previous', 'MATH-3803 with minimum grade C- required', '- Must be completed prior to taking this course.', 10072),
(779, 'true', 'Previous', 'MATH-3813 with minimum grade C- required', '- Must be completed prior to taking this course.', 10073),
(814, 'true', 'Concurrent', 'COMP-1113', '- Must be taken at the same time as this course.', 7653),
(822, 'false', 'Concurrent', 'COMP-1110L', '- Must be taken at the same time as this course.', 7654),
(824, 'true', 'Concurrent', 'COMP-1123', '- Must be taken at the same time as this course.', 7655),
(825, 'false', 'Previous', 'COMP-1113 with minimum grade C- required', '- Must be completed prior to taking this course.', 7656),
(827, 'true', 'Previous', 'COMP-1123 or COMP-1233 with minimum grade C- required', '- Must be completed prior to taking this course.', 7685),
(828, 'true', 'Previous', 'COMP-1123 or COMP-1233 with minimum grade C- required and either MATH-1323 or MATH-1333 with minimum grade C- required.', '- Must be completed prior to taking this course.', 7686),
(831, 'true', 'Concurrent', 'COMP-2203', '- Must be taken at the same time as this course.', 7690),
(835, 'true', 'Previous', '6-hours from MATH', '- Must be completed prior to taking this course.', 7691),
(836, 'true', 'Concurrent', 'COMP-2200L', '- Must be taken at the same time as this course.', 7691),
(840, 'true', 'Previous', 'COMP-2203 with minimum grace C- plus 6-hours from COMP with minimum grade C- required', '- Must be completed prior to taking this course.', 7692),
(846, 'true', 'Previous', 'COMP-1123 or COMP-1233 with minimum grade C- required.', '- Must be completed prior to taking this course.', 7707),
(848, 'true', 'Previous', '3-hours from COMP department', '- Must be completed prior to taking this course.', 7714),
(850, 'true', 'Previous', '3-hours from COMP department or permission of School', '- Must be completed prior to taking this course.', 7715),
(851, 'true', 'Previous', 'COMP-2853 and COMP-2863', '- Must be completed prior to taking this course.', 7716),
(852, 'true', 'Previous', '3-hours from COMP with min grade C- required', '- Must be completed prior to taking this course.', 7718),
(859, 'true', 'Previous', 'Take COMP 2113, with a minimum grade of C- required', '- Must be completed prior to taking this course.', 7724),
(861, 'true', 'Previous', 'COMP-2213 with minimum grade C-required', '- Must be completed prior to taking this course.', 7732),
(862, 'true', 'Previous', 'COMP-2113 with minimum grade C- required', '- Must be completed prior to taking this course.', 7733),
(865, 'true', 'Previous', 'COMP-2113 with minimum grade C- required and MATH-1413 or MATH-1313 with minimum grade C- required and MATH-1323 or MATH-1333 with minimum GRADE C-', '- Must be completed prior to taking this course.', 7734),
(867, 'true', 'Concurrent', 'COMP-3503', '- Must be taken at the same time as this course.', 7738),
(868, 'true', 'Previous', 'COMP-2113 and COMP-2103 with minimum grade C- required', '- Must be completed prior to taking this course.', 7739),
(870, 'true', 'Concurrent', 'COMP-3500L', '- Must be taken at the same time as this course.', 7739),
(871, 'true', 'Previous', 'COMP-1113 or COMP-1233 or COMP-1893 or COMP-2863 with minimum grade C- required or permission of Department', '- Must be completed prior to taking this course.', 7740),
(872, 'true', 'Previous', 'COMP-2113 and MATH-1023 with minimum grade C- required', '- Must be completed prior to taking this course.', 7744),
(874, 'true', 'Previous', 'COMP-2113', '- Must be completed prior to taking this course.', 7745),
(875, 'true', 'Concurrent', 'COMP-3613', '- Must be taken at the same time as this course.', 7746),
(876, 'true', 'Previous', 'COMP-2113 and MATH-1413 or MATH-1313 and MATH-1323 or MATH-1333, each with minimum grade C- required', '- Must be completed prior to taking this course.', 7747),
(878, 'true', 'Concurrent', 'COMP-3610L', '- Must be taken at the same time as this course.', 7747),
(880, 'true', 'Previous', 'COMP-2663 with minimum grade C- required', '- Must be completed prior to taking this course.', 7749),
(882, 'true', 'Previous', 'COMP-2103 and COMP-2113 and MATH-1413 or MATH-1313 and MATH-1323 or MATH-1333 with minimum grade C-required', '- Must be completed prior to taking this course.', 7750),
(884, 'true', 'Previous', 'COMP-2103 and COMP-2113, and COMP-2213 with minimum grade C- required', '- Must be completed prior to taking this course.', 7751),
(885, 'true', 'Previous', 'COMP-2113 and MATH-1413 or MATH-1313 and MATH-1323 or MATH-1333 with minimum grade C- required', '- Must be completed prior to taking this course.', 7753),
(887, 'true', 'Previous', 'COMP-2103 and COMP-2113, and COMP-2663 with minimum grade C- required', '- Must be completed prior to taking this course.', 7755),
(889, 'true', 'Previous', 'COMP-3703 and COMP-3713', '- Must be completed prior to taking this course.', 7763),
(891, 'true', 'Previous', 'COMP-3343 and COMP-3713 and MATH-1413 or MATH-1313 with minimum grade C- required', '- Must be completed prior to taking this course.', 7764),
(893, 'true', 'Previous', 'COMP-2523 and COMP-4343 with minimum grade C- required or department permission', '- Must be completed prior to taking this course.', 7766),
(894, 'true', 'PreviousOrConcurrent', 'MATH-4333', '- Must be taken either prior to or at the same time as this course.', 7766),
(897, 'true', 'Previous', 'COMP-3553 and COMP-3773 with minimum grade C- required', '- Must be completed prior to taking this course.', 7771),
(899, 'true', 'Previous', 'COMP-3343 and COMP-3033 and COMP-3713 all with minimum grade C-', '- Must be completed prior to taking this course.', 7772),
(900, 'true', 'Previous', 'COMP-3613 with minimum grade C- required and either MATH-2223 or MATH-2233 (or MATH-1253) with minimum grade C- required', '- Must be completed prior to taking this course.', 7774),
(902, 'true', 'Previous', '12-hours from COMP department from level 3000 or 4000 with minimum grade C- required on each', '- Must be completed prior to taking this course.', 7785),
(934, 'true', 'Concurrent', 'MATH-0120', '- Must be taken at the same time as this course.', 9940),
(935, 'true', 'Concurrent', 'MATH-1013', '- Must be taken at the same time as this course.', 9942),
(937, 'true', 'Previous', 'MATH-1013', '- Must be completed prior to taking this course.', 9945),
(939, 'true', 'Concurrent', 'MATH-1023', '- Must be taken at the same time as this course.', 9944),
(940, 'true', 'Concurrent', 'MATH-1213', '- Must be taken at the same time as this course.', 9948),
(941, 'true', 'Concurrent', 'MATH-1223', '- Must be taken at the same time as this course.', 9950),
(942, 'true', 'Concurrent', 'MATH-2013', '- Must be taken at the same time as this course.', 9978),
(943, 'true', 'Previous', 'MATH-1023', '- Must be completed prior to taking this course.', 9979),
(944, 'true', 'Concurrent', 'MATH-2010L', '- Must be taken at the same time as this course.', 9979),
(945, 'true', 'Previous', 'MATH-1023', '- Must be completed prior to taking this course.', 9981),
(946, 'true', 'Concurrent', 'MATH-2020L', '- Must be taken at the same time as this course.', 9981),
(947, 'true', 'Concurrent', 'MATH-2023', '- Must be taken at the same time as this course.', 9980),
(948, 'true', 'Concurrent', 'MATH-2223 ', '- Must be taken at the same time as this course.', 9985),
(949, 'true', 'Concurrent', 'MATH-2213', '- Must be taken at the same time as this course.', 9983),
(950, 'true', 'Concurrent', 'MATH-2233', '- Must be taken at the same time as this course.', 9987),
(951, 'true', 'Concurrent', 'MATH-2243', '- Must be taken at the same time as this course.', 9989),
(952, 'true', 'Previous', 'MATH-1323 or MATH-1333', '- Must be completed prior to taking this course.', 9994),
(953, 'true', 'Previous', 'MATH-1413 or MATH-1313', '- Must be completed prior to taking this course.', 9998),
(954, 'true', 'Previous', 'MATH-1023 or permission of instructor', '- Must be completed prior to taking this course.', 10003),
(955, 'true', 'Concurrent', 'MATH-2723', '- Must be taken at the same time as this course.', 10006),
(956, 'true', 'Previous', 'MATH-1023', '- Must be completed prior to taking this course.', 10007),
(957, 'true', 'Concurrent', 'MATH-2720L', '- Must be taken at the same time as this course.', 10007),
(958, 'true', 'Concurrent', 'MATH-2753', '- Must be taken at the same time as this course.', 10009),
(959, 'true', 'Previous', 'MATH-1023', '- Must be completed prior to taking this course.', 10010),
(960, 'true', 'Concurrent', 'MATH-2750L', '- Must be taken at the same time as this course.', 10010),
(963, 'true', 'Previous', 'MATH-2013 or MATH-2753 and MATH-2223 with minimum grades C- required', '- Must be completed prior to taking this course.', 10016),
(979, 'true', 'Previous', 'MATH-2223 and MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10020),
(984, 'true', 'Previous', 'MATH-2223 and MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10021),
(986, 'true', 'Previous', 'MATH-1323 or MATH-1333 and MATH-2223 or MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10018),
(989, 'true', 'Previous', 'MATH-2223 or MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10022),
(996, 'true', 'Previous', 'MATH-2223 or MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10023),
(999, 'true', 'Previous', 'MATH-2223 or MATH-2243 or MATH-2253 with minimum grade C- required', '- Must be completed prior to taking this course.', 10024),
(1002, 'true', 'Previous', 'MATH-2313 with minimum grade C- required', '- Must be completed prior to taking this course.', 10025),
(1006, 'true', 'Previous', 'MATH-2313 with minimum grade C-,P required', '- Must be completed prior to taking this course.', 10029),
(1326, 'true', 'Previous', 'MATH-1023', '- Must be completed prior to taking this course.', 9984),
(1327, 'true', 'Concurrent', 'MATH-2210L', '- Must be taken at the same time as this course.', 9984),
(1328, 'true', 'Previous', 'MATH-2213', '- Must be completed prior to taking this course.', 9986),
(1329, 'true', 'Concurrent', 'MATH-2220L', '- Must be taken at the same time as this course.', 9986),
(1332, 'true', 'Previous', 'MATH-1253 or MATH-2233 or MATH-1213', '- Must be completed prior to taking this course.', 9990),
(1333, 'true', 'Concurrent', 'MATH-2240L', '- Must be taken at the same time as this course.', 9990),
(1478, 'true', 'Previous', 'MATH 2233 or 1253 or MATH 2213/2223, with a minimum grade of C- required', '- Must be completed prior to taking this course.', 7724),
(1480, 'true', 'Previous', 'MATH-1413 or MATH-1313, with minimum grade C-,P required', '- Must be completed prior to taking this course.', 7724),
(1481, 'true', 'Previous', 'MATH-2233 or MATH-1253 or MATH-2213 and MATH-2223 with Minimum grade C- required', '- Must be completed prior to taking this course.', 7732),
(1482, 'true', 'Previous', 'Take MATH-1023, with minimum grade C- required', '- Must be completed prior to taking this course.', 7733),
(1483, 'true', 'Previous', 'Take MATH-1413 or MATH-1313, with minimum grade C- required', '- Must be completed prior to taking this course.', 7733),
(1484, 'true', 'Previous', 'MATH-1323 or MATH-1333, with minimum grade C- required', '- Must be completed prior to taking this course.', 7733),
(1485, 'true', 'Previous', 'Take MATH-2233 or MATH-1253 or MATH-2213 and MATH-2223; Minimum grade C- required', '- Must be completed prior to taking this course.', 7739),
(1489, 'true', 'Previous', 'MATH-1413 or MATH-1313 with minimum grade C- required', '- Must be completed prior to taking this course.', 7739),
(1505, 'true', 'Previous', 'MATH-1413 or MATH-1313 with minimum grade C- required', '- Must be completed prior to taking this course.', 7744),
(1506, 'true', 'Previous', 'MATH-1323 or MATH-1333 with minimum grade C- required', '- Must be completed prior to taking this course.', 7744),
(1507, 'true', 'Previous', 'MATH-2233 or MATH-1253 or MATH-2213 and MATH-2223 with minimum grade C- required', '- Must be completed prior to taking this course.', 7747),
(1509, 'true', 'Previous', 'MATH-1253 (previously known as MATH 1213 or MATH 2233) or ECON-2613', '- Must be completed prior to taking this course.', 9992),
(1530, 'true', 'Concurrent', 'MATH-1003', '- Must be taken at the same time as this course.', 13475),
(1531, 'true', 'Concurrent', 'MATH-1000L', '- Must be taken at the same time as this course.', 13452),
(1533, 'true', 'Concurrent', 'MATH-1253', '- Must be taken at the same time as this course.', 13476),
(1535, 'true', 'Concurrent', 'MATH-2253', '- Must be taken at the same time as this course.', 9991),
(1719, 'true', 'Concurrent', 'COMP-1230L', '- Must be taken at the same time as this course.', 13571),
(1720, 'true', 'Concurrent', 'COMP-1233;', '- Must be taken at the same time as this course.', 13570),
(1721, 'true', 'Previous', 'COMP-1113 or COMP-1233', '- Must be completed prior to taking this course.', 13572),
(1723, 'true', 'Previous', 'COMP-1123 or COMP-1233 with a minimum grade C-.', '- Must be completed prior to taking this course.', 13573),
(1870, 'true', 'Previous', '3rd-year standing (55h or more completed)', '- Must be completed prior to taking this course.', 10074),
(1945, 'true', 'PreviousOrConcurrent', 'Take MATH-1010L', '- Must be taken either prior to or at the same time as this course.', 9943),
(1998, 'true', 'Concurrent', 'Take COMP-2100L;', '- Must be taken at the same time as this course.', 7685),
(2002, 'true', 'Concurrent', 'Take COMP-5950 OR COMP-5960', '- Must be taken at the same time as this course.', 7810),
(2220, 'false', 'Concurrent', 'COMP-1120L', '- Must be taken at the same time as this course.', 7656),
(2221, 'false', 'Concurrent', 'MATH-1020L', '- Must be taken at the same time as this course.', 9945),
(2222, 'false', 'Concurrent', 'MATH-2250L', '- Must be taken at the same time as this course.', 9992),
(2224, 'true', 'Previous', 'MATH-1323 or MATH-1333 or instructor permission', '- Must be completed prior to taking this course.', 10015),
(2225, 'true', 'Previous', 'MATH-1313 or MATH-1413, and 3h MATH at the 2000 level or above, both with a minimum grade of C-', '- Must be completed prior to taking this course.', 10014),
(2226, 'true', 'Concurrent', 'MATH-1320L', '- Must be taken at the same time as this course.', 9955),
(2227, 'true', 'Concurrent', 'MATH-1323', '- Must be taken at the same time as this course.', 13893),
(2230, 'false', 'Concurrent', 'MATH-1250L', '- Must be taken at the same time as this course.', 13370);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `CourseId` int DEFAULT NULL,
  `Number` text COLLATE utf8mb4_general_ci,
  `Id` int NOT NULL,
  `Term_fk` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`CourseId`, `Number`, `Id`, `Term_fk`) VALUES
(7653, 'WI01', 20503, 4),
(7653, 'WI02', 20504, 4),
(7653, 'WI03', 20505, 4),
(7654, 'WI01', 20508, 4),
(7654, 'WI02', 20509, 4),
(7655, 'WI01', 20511, 4),
(7655, 'WI02', 20512, 4),
(7655, 'WI03', 20513, 4),
(7656, 'WI01', 20515, 4),
(7656, 'WI02', 20516, 4),
(13572, 'WI01', 20519, 4),
(7670, 'WI01', 20521, 4),
(7684, 'WI01', 20523, 4),
(7685, 'WI01', 20525, 4),
(7686, 'WI01', 20527, 4),
(7692, 'WI01', 20531, 4),
(7718, 'WI01', 20536, 4),
(7733, 'WI01', 20540, 4),
(7734, 'WI01', 20541, 4),
(7739, 'WI01', 20542, 4),
(7740, 'WI01', 20543, 4),
(7749, 'WI01', 20547, 4),
(7753, 'WI01', 20550, 4),
(13386, 'WI01', 20553, 4),
(7764, 'WI01', 20554, 4),
(7772, 'WI01', 20555, 4),
(7783, 'WI01', 20556, 4),
(7785, 'WI01', 20558, 4),
(9942, 'WI01', 21057, 4),
(9942, 'WI02', 21058, 4),
(9943, 'WI01', 21062, 4),
(9944, 'WI01', 21064, 4),
(9944, 'WI02', 21065, 4),
(9944, 'WI03', 21066, 4),
(9944, 'WI04', 21067, 4),
(9945, 'WI01', 21069, 4),
(9945, 'WI02', 21070, 4),
(9945, 'WI03', 21071, 4),
(13476, 'WI01', 21082, 4),
(13476, 'WI02', 21083, 4),
(13476, 'WI04', 21085, 4),
(13370, 'WI01', 21094, 4),
(13370, 'WI03', 21096, 4),
(9955, 'WI01', 21100, 4),
(9955, 'WI02', 21101, 4),
(9956, 'WI01', 21102, 4),
(9958, 'WI01', 21103, 4),
(9958, 'WI02', 21104, 4),
(9962, 'WI01', 21105, 4),
(9969, 'WI01', 21109, 4),
(9969, 'WI02', 21110, 4),
(9980, 'WI01', 21113, 4),
(9981, 'WI01', 21114, 4),
(9985, 'WI01', 21118, 4),
(9986, 'WI01', 21119, 4),
(9989, 'WI01', 21120, 4),
(9989, 'WI02', 21121, 4),
(9989, 'WI03', 21122, 4),
(9989, 'WI04', 21123, 4),
(9990, 'WI01', 21124, 4),
(9990, 'WI02', 21125, 4),
(9990, 'WI03', 21126, 4),
(9991, 'WI01', 21127, 4),
(9991, 'WI02', 21128, 4),
(9991, 'WI03', 21129, 4),
(9991, 'WI04', 21130, 4),
(9992, 'WI01', 21131, 4),
(9992, 'WI02', 21132, 4),
(10003, 'WI01', 21134, 4),
(10009, 'WI01', 21137, 4),
(10010, 'WI01', 21138, 4),
(10022, 'WI01', 21143, 4),
(10037, 'WI01', 21147, 4),
(13410, 'WI01', 21151, 4),
(10055, 'WI01', 21152, 4),
(10056, 'WI01', 21153, 4),
(10058, 'WI01', 21154, 4),
(10059, 'WI01', 21155, 4),
(7811, 'WI01', 21849, 4),
(13813, 'WI01', 21850, 4),
(13821, 'WI01', 21851, 4),
(7809, 'WI01', 21852, 4),
(7810, 'WI01', 21853, 4),
(13668, 'WI01', 21854, 4),
(7738, 'WI01', 21977, 4),
(13893, 'WI01', 21994, 4),
(13893, 'WI02', 21995, 4),
(7654, 'COIN5', 22254, 2),
(7670, 'COIN4', 22255, 2),
(7691, 'COIN3', 22256, 2),
(13452, 'COIN1', 22296, 2),
(9938, 'COIN4', 22297, 2),
(9962, 'COIN3', 22298, 2),
(9963, 'COIN3', 22299, 2),
(9969, 'COIN4', 22300, 2),
(10102, 'WI01', 22342, 4),
(10097, 'WI01', 22347, 4),
(10100, 'WI01', 22372, 4),
(10088, 'WI01', 22373, 4),
(13385, 'WI01', 22453, 4),
(10052, 'WI01', 22512, 4),
(7670, 'SUA1', 22541, 3),
(9969, 'SUD1', 22552, 1),
(7656, 'SUA1', 22569, 5),
(9945, 'SUA1', 22570, 5),
(13370, 'SUA1', 22571, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subrequirementCourses`
--

CREATE TABLE `subrequirementCourses` (
  `id` int DEFAULT NULL,
  `coursename` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `groupsid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subrequirementCourses`
--

INSERT INTO `subrequirementCourses` (`id`, `coursename`, `title`, `groupsid`) VALUES
(7654, 'COMP-1113', 'Computer Programming 1', 24208),
(7656, 'COMP-1123', 'Computer Programming 2', 24208),
(13571, 'COMP-1233', 'Introd to Computer Science', 24210),
(7685, 'COMP-2103', 'Computer Programming 3', 24102),
(7686, 'COMP-2113', 'Data Structures and Algorithms', 24102),
(7691, 'COMP-2203', 'Comp Architect./Organization 1', 24102),
(7692, 'COMP-2213', 'Comp Architect./Organization 2', 24102),
(7707, 'COMP-2663', 'Software Engineering 1', 24102),
(7718, 'COMP-2903', 'Computers and Society', 24102),
(7732, 'COMP-3343', 'Data Comm & Comp Networks', 24102),
(7747, 'COMP-3613', 'Artificial Intelligence 1', 24102),
(7749, 'COMP-3663', 'Software Engineering 2', 24102),
(7751, 'COMP-3713', 'Operating Systems', 24102),
(7753, 'COMP-3753', 'Database Management Systems', 24102),
(7785, 'COMP-4983', 'Capstone Project', 24104),
(13370, 'MATH-1253', 'Statistics 1', 24106),
(9984, 'MATH-2213', 'Appl Probability Sci/Engi', 24107),
(9986, 'MATH-2223', 'Applied Statistics for Science', 24107),
(9958, 'MATH-1413', 'Discrete Mathematics', 24109),
(9955, 'MATH-1323', 'Matrix Algebra', 24109),
(9954, 'MATH-1313', 'Foundations', 24110),
(9956, 'MATH-1333', 'Introduction to Linear Algebra', 24110),
(7699, 'COMP-2513', 'Web-Centric Programming', 19659),
(7745, 'COMP-3583', 'Human Computer Interaction', 19659),
(7764, 'COMP-4343', 'Comp Net & Distributed Systems', 19659),
(7772, 'COMP-4583', 'Mobile/Ubiquitous Computing', 19659),
(9943, 'MATH-1013', 'Introductory Calculus 1', 19659),
(9945, 'MATH-1023', 'Introductory Calculus 2', 19659),
(11315, 'PSYC-1013', 'Introductory Psychology 1', 19659),
(11317, 'PSYC-1023', 'Introductory Psychology 2', 19659),
(11339, 'PSYC-2143', 'Introduction to Cognition', 19659),
(7685, 'COMP-2103', 'Computer Programming 3', 24223),
(7686, 'COMP-2113', 'Data Structures and Algorithms', 24223),
(7691, 'COMP-2203', 'Comp Architect./Organization 1', 24223),
(7692, 'COMP-2213', 'Comp Architect./Organization 2', 24223),
(7707, 'COMP-2663', 'Software Engineering 1', 24223),
(7718, 'COMP-2903', 'Computers and Society', 24223),
(7732, 'COMP-3343', 'Data Comm & Comp Networks', 24223),
(7733, 'COMP-3403', 'Analysis of Algorithms', 24223),
(7747, 'COMP-3613', 'Artificial Intelligence 1', 24223),
(7750, 'COMP-3703', 'Translators', 24223),
(7751, 'COMP-3713', 'Operating Systems', 24223),
(7753, 'COMP-3753', 'Database Management Systems', 24223),
(7785, 'COMP-4983', 'Capstone Project', 24225),
(13370, 'MATH-1253', 'Statistics 1', 24233),
(9984, 'MATH-2213', 'Appl Probability Sci/Engi', 24234),
(9986, 'MATH-2223', 'Applied Statistics for Science', 24234),
(9943, 'MATH-1013', 'Introductory Calculus 1', 9030),
(9945, 'MATH-1023', 'Introductory Calculus 2', 9030),
(7744, 'COMP-3553', 'Computer Graphics', 22798),
(7745, 'COMP-3583', 'Human Computer Interaction', 22798),
(7755, 'COMP-3773', 'Adv Obj Oriented App Dev C++', 22798),
(7764, 'COMP-4343', 'Comp Net & Distributed Systems', 22798),
(7771, 'COMP-4553', 'Game Development', 22798),
(7774, 'COMP-4613', 'Artificial Intelligence 2', 22798),
(9943, 'MATH-1013', 'Introductory Calculus 1', 22798),
(9945, 'MATH-1023', 'Introductory Calculus 2', 22798),
(9994, 'MATH-2313', 'Linear Algebra 2', 22798),
(7685, 'COMP-2103', 'Computer Programming 3', 24075),
(7686, 'COMP-2113', 'Data Structures and Algorithms', 24075),
(7691, 'COMP-2203', 'Comp Architect./Organization 1', 24075),
(7692, 'COMP-2213', 'Comp Architect./Organization 2', 24075),
(7707, 'COMP-2663', 'Software Engineering 1', 24075),
(7718, 'COMP-2903', 'Computers and Society', 24075),
(7732, 'COMP-3343', 'Data Comm & Comp Networks', 24075),
(7747, 'COMP-3613', 'Artificial Intelligence 1', 24075),
(7749, 'COMP-3663', 'Software Engineering 2', 24075),
(7751, 'COMP-3713', 'Operating Systems', 24075),
(7753, 'COMP-3753', 'Database Management Systems', 24075),
(7785, 'COMP-4983', 'Capstone Project', 24077),
(13370, 'MATH-1253', 'Statistics 1', 24079),
(9984, 'MATH-2213', 'Appl Probability Sci/Engi', 24080),
(9986, 'MATH-2223', 'Applied Statistics for Science', 24080),
(9958, 'MATH-1413', 'Discrete Mathematics', 24082),
(9955, 'MATH-1323', 'Matrix Algebra', 24082),
(9954, 'MATH-1313', 'Foundations', 24083),
(9956, 'MATH-1333', 'Introduction to Linear Algebra', 24083),
(13573, 'COMP-3033', 'Full-Stack Cloud Computing', 28796),
(7740, 'COMP-3513', 'Systems Analysis and Design', 28796),
(7745, 'COMP-3583', 'Human Computer Interaction', 28796),
(7755, 'COMP-3773', 'Adv Obj Oriented App Dev C++', 28796),
(7647, 'COMM-1213', 'Business Communication 1', 28796),
(9943, 'MATH-1013', 'Introductory Calculus 1', 22785),
(9945, 'MATH-1023', 'Introductory Calculus 2', 22785),
(7656, 'COMP-1123', 'Computer Programming 2', 22822),
(7685, 'COMP-2103', 'Computer Programming 3', 22822),
(7686, 'COMP-2113', 'Data Structures and Algorithms', 22822),
(7691, 'COMP-2203', 'Comp Architect./Organization 1', 22822),
(7692, 'COMP-2213', 'Comp Architect./Organization 2', 22822),
(7707, 'COMP-2663', 'Software Engineering 1', 22822),
(7718, 'COMP-2903', 'Computers and Society', 22822),
(7732, 'COMP-3343', 'Data Comm & Comp Networks', 22822),
(7747, 'COMP-3613', 'Artificial Intelligence 1', 22822),
(7749, 'COMP-3663', 'Software Engineering 2', 22822),
(7751, 'COMP-3713', 'Operating Systems', 22822),
(7753, 'COMP-3753', 'Database Management Systems', 22822),
(7785, 'COMP-4983', 'Capstone Project', 22824),
(13370, 'MATH-1253', 'Statistics 1', 22835),
(9984, 'MATH-2213', 'Appl Probability Sci/Engi', 22836),
(9986, 'MATH-2223', 'Applied Statistics for Science', 22836),
(9958, 'MATH-1413', 'Discrete Mathematics', 22828),
(9955, 'MATH-1323', 'Matrix Algebra', 22828),
(9954, 'MATH-1313', 'Foundations', 22829),
(9956, 'MATH-1333', 'Introduction to Linear Algebra', 22829),
(7654, 'COMP-1113', 'Computer Programming 1', 24214),
(7656, 'COMP-1123', 'Computer Programming 2', 24214),
(13571, 'COMP-1233', 'Introd to Computer Science', 24216),
(7685, 'COMP-2103', 'Computer Programming 3', 24237),
(7686, 'COMP-2113', 'Data Structures and Algorithms', 24237),
(7691, 'COMP-2203', 'Comp Architect./Organization 1', 24237),
(7692, 'COMP-2213', 'Comp Architect./Organization 2', 24237),
(7707, 'COMP-2663', 'Software Engineering 1', 24237),
(7718, 'COMP-2903', 'Computers and Society', 24237),
(7732, 'COMP-3343', 'Data Comm & Comp Networks', 24237),
(7733, 'COMP-3403', 'Analysis of Algorithms', 24237),
(7734, 'COMP-3413', 'Automata/Formal Lang/Comput', 24237),
(7747, 'COMP-3613', 'Artificial Intelligence 1', 24237),
(7750, 'COMP-3703', 'Translators', 24237),
(7751, 'COMP-3713', 'Operating Systems', 24237),
(7753, 'COMP-3753', 'Database Management Systems', 24237),
(6625, 'APSC-1413', 'Comp Programming for APSC 1', 22822);

-- --------------------------------------------------------

--
-- Table structure for table `subrequirementgroups`
--

CREATE TABLE `subrequirementgroups` (
  `id` int NOT NULL,
  `code` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `searchtext` varchar(147) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mincredits` int DEFAULT NULL,
  `subrequirementid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subrequirementgroups`
--

INSERT INTO `subrequirementgroups` (`id`, `code`, `searchtext`, `mincredits`, `subrequirementid`) VALUES
(9030, 'Group 1', 'Take course(s) MATH-1013, MATH-1023. ', NULL, 9029),
(9032, 'Group 1', '6h Writing Intensive', 6, 9031),
(9033, 'Group 2', '6h in one language', 6, 9031),
(9036, 'Group 1', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 9, 9034),
(9048, 'Group 1', '12h from science (not MATH/COMP) or Business', 12, 9045),
(15533, 'Group 1', '3h electives, except from COMP, MATH, and COOP.', 3, 15531),
(15535, 'Group 1', '9h any elective', 9, 15534),
(16882, 'Group 1', '6h computer science, with a minimum of C-', 6, 16881),
(16885, 'Group 1', '6h computer science or mathematics and statistics, with a minimum of C-', 6, 16884),
(16887, 'Group 1', '15h with permission of school, except COMP, MATH,  and COOP. This block, together with the next block  for 27h are expected to encompass courses fo', 15, 16886),
(16890, 'Group 1', 'Complete 27 credit(s). ', 27, 16888),
(17745, 'Group 1', '6h Electives (not from Computer Science, Math, or Co-op)', 6, 17744),
(17747, 'Group 1', '15h any electives', 15, 17746),
(19659, 'Group 1', 'Take course(s) COMP-2513, COMP-3583, COMP-4343, COMP-4583, MATH-1013, MATH-1023, PSYC-1013, PSYC-1023, PSYC-2143.', NULL, 19658),
(22783, 'Group 1', '12h, selected from:  COMP-2513 COMP-3513 COMP-3503 COMP-3923 COMP-4613 COMP-4923 (Machine Learning)', 12, 22782),
(22785, 'Group 1', 'Take course(s) MATH-1013, MATH-1023. ', NULL, 22784),
(22787, 'Group 1', 'MATH 2223, MATH 2243, or MATH 2253', 3, 22786),
(22789, 'Group 1', '6h, selected from: MATH-3233 MATH-3283 MATH-3293', 6, 22788),
(22791, 'Group 1', '12h, selected from: COMP-2853 ECON-1013 ECON-1023 BUSI-1013 BUSI-2013   BUSI-2513 BUSI-2803 BUSI-3063', 12, 22790),
(22793, 'Group 1', '3h electives, except from COMP, MATH, and COOP.', 3, 22792),
(22795, 'Group 1', 'Note: If COMP-2853 was taken above, then 3h of these electives must be not in COMP, MATH, or COOP.', 12, 22794),
(22798, 'Group 1', 'Take course(s) COMP-3553, COMP-3583, COMP-3773, COMP-4343, COMP-4553, COMP-4613, MATH-1013, MATH-1023, MATH-2313. ', NULL, 22797),
(22805, 'Group 1', '12h from the Faculty of Pure and Applied Science (excluding MATH, COMP and COOP) or the School of Business Administration', 12, 22801),
(22822, 'Group 1', 'Take course(s) COMP-1123, COMP-2103, COMP-2113, COMP-2203, COMP-2213, COMP-2663, COMP-2903, COMP-3343, COMP-3613, COMP-3663, COMP-3713, COMP-3753, ', NULL, 22821),
(22824, 'Group 1', 'Take course(s) COMP-4983. ', NULL, 22823),
(22828, 'Group 1', 'MATH 1413, 1323', NULL, 22827),
(22829, 'Group 2', 'MATH 1313, 1333', NULL, 22827),
(22831, 'Group 1', '6h Writing Intensive', 6, 22830),
(22832, 'Group 2', '6h in one language', 6, 22830),
(22834, 'Group 1', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 9, 22833),
(22835, 'Group 1', 'Take course(s) MATH-1253. ', NULL, 22825),
(22836, 'Group 2', 'Take course(s) MATH-2213, MATH-2223. ', NULL, 22825),
(22837, 'Group 1', '3h from the Faculty of Pure and Applied Science (excluding COMP, MATH and COOP) or the School of Business Administration', 3, 19662),
(24075, 'Group 1', 'Take course(s) COMP-2103, COMP-2113, COMP-2203, COMP-2213, COMP-2663, COMP-2903, COMP-3343, COMP-3613, COMP-3663, COMP-3713, COMP-3753. ', NULL, 24074),
(24077, 'Group 1', 'Take course(s) COMP-4983. ', NULL, 24076),
(24079, 'Group 1', 'Take course(s) MATH-1253. ', NULL, 24078),
(24080, 'Group 2', 'Take course(s) MATH-2213, MATH-2223. ', NULL, 24078),
(24082, 'Group 1', 'MATH 1413, 1323', NULL, 24081),
(24083, 'Group 2', 'MATH 1313, 1333', NULL, 24081),
(24085, 'Group 1', '6h Writing Intensive', 6, 24084),
(24086, 'Group 2', '6h in one language', 6, 24084),
(24088, 'Group 1', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 9, 24087),
(24102, 'Group 1', 'Take COMP-2103 COMP-2113 COMP-2203 COMP-2213 COMP-2663     COMP-2903 COMP-3343 COMP-3613 COMP-3663 COMP-3713     COMP-3753;     Minimum grade C-,P;', NULL, 24101),
(24104, 'Group 1', 'Take course(s) COMP-4983. ', NULL, 24103),
(24106, 'Group 1', 'Take course(s) MATH-1253. ', NULL, 24105),
(24107, 'Group 2', 'Take course(s) MATH-2213, MATH-2223. ', NULL, 24105),
(24109, 'Group 1', 'MATH 1413, 1323', NULL, 24108),
(24110, 'Group 2', 'MATH 1313, 1333', NULL, 24108),
(24112, 'Group 1', '6h Writing Intensive', 6, 24111),
(24113, 'Group 2', '6h in one language', 6, 24111),
(24115, 'Group 1', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 9, 24114),
(24208, 'Group 1', 'Take COMP 1113 and 1123 if you\'ve had no prior Computer Science studies.', NULL, 24207),
(24210, 'Group 1', 'Take course(s) COMP-1233. ', NULL, 24209),
(24211, 'Group 2', 'Complete 3 credit(s). Choose from the subject(s) of Computer Science. Excluding the course(s) COMP-2853. ', 3, 24209),
(24214, 'Group 1', 'Take COMP 1113 and 1123 if you\'ve had no prior Computer Science studies.', NULL, 24213),
(24216, 'Group 1', 'Take course(s) COMP-1233. ', NULL, 24215),
(24217, 'Group 2', 'Complete 3 credit(s). Choose from the subject(s) of Computer Science. Excluding the course(s) COMP-2853. ', 3, 24215),
(24223, 'Group 1', 'Take COMP-2103 COMP-2113 COMP-2203 COMP-2213 COMP-2663     COMP-2903 COMP-3343 COMP-3403 COMP-3613 COMP-3703     COMP-3713 COMP-3753;', NULL, 24222),
(24225, 'Group 1', 'Take course(s) COMP-4983. ', NULL, 24224),
(24227, 'Group 1', 'Complete 12 credit(s). Choose from the subject(s) of Computer Science. Excluding the course(s) COMP-2853. ', 12, 24226),
(24229, 'Group 1', 'MATH-1413 or MATH-1313', 3, 24228),
(24231, 'Group 1', 'MATH-1323 or MATH-1333', 3, 24230),
(24233, 'Group 1', 'Take course(s) MATH-1253. ', NULL, 24232),
(24234, 'Group 2', 'Take course(s) MATH-2213, MATH-2223. ', NULL, 24232),
(24237, 'Group 1', 'Take course(s) COMP-2103, COMP-2113, COMP-2203, COMP-2213, COMP-2663, COMP-2903, COMP-3343, COMP-3403, COMP-3413, COMP-3613, COMP-3703, COMP-3713, ', NULL, 24236),
(24239, 'Group 1', 'Honours thesis (COMP-4996 or COMP-407T and COMP-408T)', 6, 24238),
(24241, 'Group 1', 'Complete 12 credit(s). Choose from the subject(s) of Computer Science. Choose from the level(s) of 3000, 4000. ', 12, 24240),
(24243, 'Group 1', 'MATH-1413 or MATH-1313', 3, 24242),
(24245, 'Group 1', 'MATH-1323 or MATH-1333', 3, 24244),
(24247, 'Group 1', 'Either MATH 1253 or MATH 2223', 3, 24246),
(24249, 'Group 1', 'MATH-2213 (necessary for MATH-2223), or 3h MATH at the 2000 level or higher', 3, 24248),
(27166, 'Group 1', '3h electives, except from COMP, MATH, and COOP.', 3, 22803),
(27168, 'Group 1', '12h electives from any subject.', 12, 27167),
(27169, 'Group 1', '3h from courses not including COMP, MATH and COOP', 3, 22838),
(27170, 'Group 1', '21h electives from any subject.', 21, 19664),
(28791, 'Group 1', '12h Business', 12, 28790),
(28793, 'Group 1', '3h COMP at 2000+ level', 3, 28792),
(28795, 'Group 1', '24h electives from any subject', 24, 28794),
(28796, 'Group 1', 'COMP-3033 COMP-3513 COMP-3583 COMP-3773 and COMM-1213', NULL, 28788);

-- --------------------------------------------------------

--
-- Table structure for table `subrequirements`
--

CREATE TABLE `subrequirements` (
  `id` int NOT NULL,
  `mingroups` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mininstitutionalcredits` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `displaytext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directive` varchar(37) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requirementsid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subrequirements`
--

INSERT INTO `subrequirements` (`id`, `mingroups`, `mininstitutionalcredits`, `code`, `displaytext`, `directive`, `requirementsid`) VALUES
(9029, NULL, NULL, 'Intro Calculus', '', 'Complete all of the following  items.', 9028),
(9031, '1', NULL, '6h Sci Breadth Req', '6h selected from English, Art at the 1000-level, Classics, Comparative Religion, a single language other than English, History, Music (not applied, vocal or instrumental methods, or practical studies), Philosophy, Theology (THEO 3013/23, BIBL 2013/23, GREE 3013/23), or Women\'s and Gender Studies, or COMM-1213 or COMM-1223.', 'Complete 1 of the following 2 items.', 9028),
(9034, NULL, NULL, '9h Faculty of Arts', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 'Complete all of the following  items.', 9028),
(9045, NULL, NULL, '12h Science/Business', '12h from science (not MATH/COMP) or Business', 'Complete all of the following  items.', 9039),
(15531, NULL, NULL, '3h non-COMP/MATH', '3h electives, except from COMP, MATH, and COOP.', 'Complete all of the following  items.', 15525),
(15534, NULL, NULL, '9h Electives', '9h any elective', 'Complete all of the following  items.', 15525),
(16881, NULL, NULL, '6h COMP', '6h computer science, with a minimum of C-', 'Complete all of the following  items.', 16880),
(16884, NULL, NULL, '6h COMP/MATH', '6h computer science or mathematics and statistics, with a minimum of C-', 'Complete all of the following  items.', 16880),
(16886, NULL, NULL, '15h non-COMP/MATH', '15h with permission of school, except COMP, MATH, and COOP. This block, together with the next block  for 27h are expected to encompass courses for an  18h minor (in one subject or a multidisciplinary  minor). Your advisor should have your chosen  minor added to your program.  If you take more than 120h, you may see courses in your minor not appear inside this block, but will be checked in a specialized block for your chosen minor.', 'Complete all of the following  items.', 16880),
(16888, NULL, NULL, '27h Addnl Courses', '', 'Complete all of the following  items.', 16880),
(17744, NULL, NULL, '6h non-COMP/MATH', '6h Electives (not from Computer Science, Math, or Co-op)', 'Complete all of the following  items.', 17743),
(17746, NULL, NULL, '15h Electives', '15h any electives', 'Complete all of the following  items.', 17743),
(19658, '', '', 'MOUB Mandatory', '', 'Complete all of the following  items.', 19657),
(19662, '', '', '3h Sci/Busi non-COMP', '3h from the Faculty of Pure and Applied Science (excluding COMP, MATH and COOP) or the School of Business Administration', 'Complete all of the following  items.', 19657),
(19664, '', '', '21h Electives', '21h electives from any subject.', 'Complete all of the following  items.', 19657),
(22782, NULL, NULL, '12h Data Sci.', '12h, selected from:  COMP-2513 COMP-3513 COMP-3503 COMP-3923 COMP-4613 COMP-4923 (Machine Learning)', 'Complete all of the following  items.', 22781),
(22784, NULL, NULL, 'Intro Calculus', '', 'Complete all of the following  items.', 22781),
(22786, NULL, NULL, 'Statistics', 'MATH 2223, MATH 2243, or MATH 2253', 'Complete all of the following  items.', 22781),
(22788, NULL, NULL, '6h Selected MATH', '6h, selected from: MATH-3233 MATH-3283 MATH-3293', 'Complete all of the following  items.', 22781),
(22790, NULL, NULL, '12h ECON/BUSI', '12h, selected from: COMP-2853 ECON-1013 ECON-1023 BUSI-1013 BUSI-2013   BUSI-2513 BUSI-2803 BUSI-3063', 'Complete all of the following  items.', 22781),
(22792, NULL, NULL, '3h non-COMP/MATH', '3h electives, except from COMP, MATH, and COOP.', 'Complete all of the following  items.', 22781),
(22794, NULL, NULL, '12h Electives', 'Note: If COMP-2853 was taken above, then 3h of these electives must be not in COMP, MATH, or COOP.', 'Complete all of the following  items.', 22781),
(22797, NULL, NULL, 'Game Dev. Mandatory', '', 'Complete all of the following  items.', 22796),
(22801, NULL, NULL, '12h Sci/Bus non-COMP', '12h from the Faculty of Pure and Applied Science (excluding MATH, COMP and COOP) or the School of Business Administration', 'Complete all of the following items.', 22796),
(22803, NULL, NULL, '3h non-COMP/MATH', '3h electives, except from COMP, MATH, and COOP.', 'Complete all of the following items.', 22796),
(22821, NULL, NULL, 'Specified COMP', '', 'Complete all of the following items.', 22820),
(22823, NULL, NULL, 'Project', '', 'Complete all of the following items.', 22820),
(22825, '1', NULL, 'Statistics', 'Either MATH 1253, or MATH 2213 and 2223', 'Complete 1 of the following 2 items.', 22820),
(22827, '1', NULL, 'Discrete Math', 'Either MATH 1413 and 1323, or MATH 1313 and 1333.', 'Complete 1 of the following 2 items.', 22820),
(22830, '1', NULL, '6h Sci Breadth Req', '6h selected from English, Art at the 1000-level, Classics, Comparative Religion, a single language other than English, History, Music (not applied, vocal or instrumental methods, or practical studies), Philosophy, Theology (THEO 3013/23, BIBL 2013/23, GREE 3013/23), or Women\'s and Gender Studies, or COMM-1213 or COMM-1223.', 'Complete 1 of the following 2 items.', 22820),
(22833, NULL, NULL, '9h Faculty of Arts', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 'Complete all of the following  items.', 22820),
(22838, '', '', '3h non-COMP/MATH', '3h from courses not including COMP, MATH and COOP', 'Complete all of the following  items.', 19657),
(24074, NULL, NULL, 'Specified COMP', '', 'Complete all of the following  items.', 24073),
(24076, NULL, NULL, 'Project', '', 'Complete all of the following  items.', 24073),
(24078, '1', NULL, 'Statistics', 'Either MATH 1253, or MATH 2213 and 2223', 'Complete 1 of the following 2 items.', 24073),
(24081, '1', NULL, 'Discrete Math', 'Either MATH 1413 and 1323, or MATH 1313 and 1333.', 'Complete 1 of the following 2 items.', 24073),
(24084, '1', NULL, '6h Sci Breadth Req', '6h selected from English, Art at the 1000-level, Classics, Comparative Religion, a single language other than English, History, Music (not applied, vocal or instrumental methods, or practical studies), Philosophy, Theology (THEO 3013/23, BIBL 2013/23, GREE 3013/23), or Women\'s and Gender Studies, or COMM-1213 or COMM-1223.', 'Complete 1 of the following 2 items.', 24073),
(24087, NULL, NULL, '9h Faculty of Arts', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 'Complete all of the following  items.', 24073),
(24101, '', '', 'Specified COMP', 'Take COMP-2103 COMP-2113 COMP-2203 COMP-2213 COMP-2663     COMP-2903 COMP-3343 COMP-3613 COMP-3663 COMP-3713     COMP-3753;     Minimum grade C-,P;', 'Complete all of the following  items.', 24095),
(24103, '', '', 'Project', '', 'Complete all of the following  items.', 24095),
(24105, '1', '', 'Statistics', 'Either MATH 1253, or MATH 2213 and 2223', 'Complete 1 of the following 2 items.', 24095),
(24108, '1', '', 'Discrete Math', 'Either MATH 1413 and 1323, or MATH 1313 and 1333.', 'Complete 1 of the following 2 items.', 24095),
(24111, '1', '', '6h Sci Breadth Req', '6h selected from English, Art at the 1000-level, Classics, Comparative Religion, a single language other than English, History, Music (not applied, vocal or instrumental methods, or practical studies), Philosophy, Theology (THEO 3013/23, BIBL 2013/23, GREE 3013/23), or Women\'s and Gender Studies, or COMM-1213 or COMM-1223.', 'Complete 1 of the following 2 items.', 24095),
(24114, '', '', '9h Faculty of Arts', '9h from the Faculty of Arts (not ECON 2613, 2623, or SOCI 3103)', 'Complete all of the following  items.', 24095),
(24207, '', '', 'COMP 1113 and 1123', 'Take COMP 1113 and 1123 if you\'ve had no prior Computer Science studies.', 'Complete all of the following  items.', 24206),
(24209, '', '', 'COMP 1233 plus 3h', 'Take COMP 1233 and 3h additional COMP if you\'ve had prior Computer Science studies in high school.', 'Complete all of the following  items.', 24206),
(24213, NULL, NULL, 'COMP 1113 and 1123', 'Take COMP 1113 and 1123 if you\'ve had no prior Computer Science studies.', 'Complete all of the following  items.', 24212),
(24215, NULL, NULL, 'COMP 1233 plus 3h', 'Take COMP 1233 and 3h additional COMP if you\'ve had prior Computer Science studies in high school.', 'Complete all of the following  items.', 24212),
(24222, NULL, NULL, 'Specified COMP', 'Take COMP-2103 COMP-2113 COMP-2203 COMP-2213 COMP-2663     COMP-2903 COMP-3343 COMP-3403 COMP-3613 COMP-3703     COMP-3713 COMP-3753;', 'Complete all of the following  items.', 24221),
(24224, NULL, NULL, 'Project', '', 'Complete all of the following  items.', 24221),
(24226, NULL, NULL, '12h Additional COMP', '', 'Complete all of the following  items.', 24221),
(24228, NULL, NULL, 'Discrete Math', 'MATH-1413 or MATH-1313', 'Complete all of the following  items.', 24221),
(24230, NULL, NULL, 'Linear/Matrix', 'MATH-1323 or MATH-1333', 'Complete all of the following  items.', 24221),
(24232, '1', NULL, 'Statistics', 'Either MATH 1253, or MATH 2213 and 2223', 'Complete 1 of the following 2 items.', 24221),
(24236, NULL, NULL, 'Specified COMP', '', 'Complete all of the following  items.', 24235),
(24238, NULL, NULL, 'Honours Thesis', 'Honours thesis (COMP-4996 or COMP-407T and COMP-408T)', 'Complete all of the following  items.', 24235),
(24240, NULL, NULL, '12h COMP 3xxx/4xxx', '', 'Complete all of the following  items.', 24235),
(24242, NULL, NULL, 'Discrete Math', 'MATH-1413 or MATH-1313', 'Complete all of the following  items.', 24235),
(24244, NULL, NULL, 'Linear/Matrix', 'MATH-1323 or MATH-1333', 'Complete all of the following  items.', 24235),
(24246, NULL, NULL, 'Prob./Statistics', 'Either MATH 1253 or MATH 2223', 'Complete all of the following  items.', 24235),
(24248, NULL, NULL, 'MATH 2213/2xxx', 'MATH-2213 (necessary for MATH-2223), or 3h MATH at the 2000 level or higher', 'Complete all of the following  items.', 24235),
(27167, NULL, NULL, '12h Electives', '12h electives from any subject.', 'Complete all of the following items.', 22796),
(28788, NULL, NULL, 'Soft. Dev. Mandatory', '  COMP-3033 COMP-3513 COMP-3583 COMP-3773 and COMM-1213', 'Complete all of the following  items.', 28787),
(28790, NULL, NULL, '12h Business', '12h Business', 'Complete all of the following  items.', 28787),
(28792, NULL, NULL, '3h COMP 2000+', '3h COMP at 2000+ level', 'Complete all of the following  items.', 28787),
(28794, NULL, NULL, '24h Electives', '24h electives from any subject', 'Complete all of the following  items.', 28787);

-- --------------------------------------------------------

--
-- Table structure for table `Terms`
--

CREATE TABLE `Terms` (
  `TermId` text COLLATE utf8mb4_general_ci,
  `StartDate` text COLLATE utf8mb4_general_ci,
  `EndDate` text COLLATE utf8mb4_general_ci,
  `Term_pk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Terms`
--

INSERT INTO `Terms` (`TermId`, `StartDate`, `EndDate`, `Term_pk`) VALUES
('2026SU', '2026-07-13T00:00:00-03:00', '2026-07-31T00:00:00-03:00', 1),
('2025COI', '2025-09-01T00:00:00-03:00', '2026-08-31T00:00:00-03:00', 2),
('2026SU', '2026-05-11T00:00:00-03:00', '2026-05-29T00:00:00-03:00', 3),
('2026WI', '2026-01-12T00:00:00-04:00', '2026-04-23T00:00:00-03:00', 4),
('2026SU', '2026-05-11T00:00:00-03:00', '2026-06-19T00:00:00-03:00', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `butnotcourses`
--
ALTER TABLE `butnotcourses`
  ADD UNIQUE KEY `id` (`id`,`groupsid`);

--
-- Indexes for table `butnotsubjects`
--
ALTER TABLE `butnotsubjects`
  ADD UNIQUE KEY `code` (`code`,`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `SubjectCode` (`SubjectCode`,`Number`);

--
-- Indexes for table `EquatedCourses`
--
ALTER TABLE `EquatedCourses`
  ADD PRIMARY KEY (`EquatedCourseId`);

--
-- Indexes for table `fromcourses`
--
ALTER TABLE `fromcourses`
  ADD UNIQUE KEY `id` (`id`,`groupsid`);

--
-- Indexes for table `fromsubjects`
--
ALTER TABLE `fromsubjects`
  ADD UNIQUE KEY `code` (`code`,`id`);

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`Locations_pk`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`meetings_pk`),
  ADD KEY `sectionId` (`sectionId`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requisites`
--
ALTER TABLE `requisites`
  ADD PRIMARY KEY (`requirementcode`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `subrequirementCourses`
--
ALTER TABLE `subrequirementCourses`
  ADD UNIQUE KEY `id` (`id`,`groupsid`);

--
-- Indexes for table `subrequirementgroups`
--
ALTER TABLE `subrequirementgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subrequirements`
--
ALTER TABLE `subrequirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Terms`
--
ALTER TABLE `Terms`
  ADD PRIMARY KEY (`Term_pk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `requisites`
--
ALTER TABLE `requisites`
  ADD CONSTRAINT `requisites_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
