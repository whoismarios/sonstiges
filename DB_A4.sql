-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Jan 2023 um 21:28
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `DB_A4`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Branch`
--

CREATE TABLE `Branch` (
  `BranchID` varchar(11) NOT NULL,
  `street` varchar(16) NOT NULL,
  `city` varchar(30) NOT NULL,
  `PLZ` varchar(12) NOT NULL,
  `managerFK` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Branch`
--

INSERT INTO `Branch` (`BranchID`, `street`, `city`, `PLZ`, `managerFK`, `phone`) VALUES
('B001', '23 Abbots Drive', 'Edinburgh', 'AB34 015', 2, '+44 131 774-5632'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU', 1, '+44 171 848-1825'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX', 3, '+44 141 357-7419'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ', 4, '+44 117 943-1728'),
('B005', '22 Deer Rd', 'London', 'SW1 4EH', 14, '+44 181 225-7025'),
('B006', '123 Coast Lane', 'Brighton', 'BC71 15X', 33, '+45 1273 199-300'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU', 40, '+44 1224 861-212'),
('B008', '17 Hogart Bd', 'Derby', 'RX01 5AB', 26, '+44 1332 769-301'),
('B009', '52 Gutter St', 'Exeter', 'A11 R15', 34, '+44 1392 129-375'),
('B010', '6 Lawrence St', 'Newcastle', 'PG22 5AS', 6, '+44 1782 196-720'),
('B011', '13 Dale Rd', 'Liverpool', 'AL8  83X', 8, '+44 151 543-0973'),
('B012', '2 Manor Rd', 'Manchester', 'ABC 015', 13, '+44 161 390-7428'),
('B013', '5 Novar Drive', 'Leeds', 'LX17 AK8', 16, '+44 113 142-2899'),
('B014', '61 Queens Circle', 'Liverpool', 'AL8 L14X', 25, '+44 151 834-2344');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Staff`
--

CREATE TABLE `Staff` (
  `EmpID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `salery` float NOT NULL,
  `supervisorFK` int(11) DEFAULT NULL,
  `branchFK` varchar(8) DEFAULT NULL,
  `position` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Staff`
--

INSERT INTO `Staff` (`EmpID`, `name`, `gender`, `salery`, `supervisorFK`, `branchFK`, `position`) VALUES
(1, 'Robert King', 'M', 143000, NULL, 'B002', 'Director'),
(2, 'Rafael McDonalds', 'M', 72000, 1, 'B001', 'Manager'),
(3, 'John White', 'M', 60000, 1, 'B003', 'Manager'),
(4, 'Susan Brand', 'F', 55000, 1, 'B004', 'Manager'),
(5, 'Cathy Brown', 'F', 32000, 2, 'B001', 'Supervisor'),
(6, 'Claire Dujeune', 'F', 79000, 1, 'B010', 'Manager'),
(7, 'Patty Summer', 'F', 23000, 2, 'B001', 'Supervisor'),
(8, 'Mary Fleming', 'F', 43000, 1, 'B011', 'Manager'),
(9, 'Carl Maier', 'M', 31000, 64, 'B011', 'Assistant'),
(10, 'Anne Beech', 'F', 26000, 5, 'B001', 'Assistant'),
(12, 'Paul Coplien', 'M', 27000, 3, 'B003', 'Supervisor'),
(13, 'David Ford', 'M', 41000, 1, 'B012', 'Manager'),
(14, 'Mary Howe', 'F', 55000, 1, 'B005', 'Manager'),
(15, 'Julie Lee', 'F', 34000, 3, 'B003', 'Supervisor'),
(16, 'Aaron Young', 'M', 74000, 1, 'B013', 'Manager'),
(17, 'Albert Thomson', 'M', 25000, 13, 'B012', 'Supervisor'),
(18, 'Christine McDonalds', 'F', 38000, 4, 'B004', 'Supervisor'),
(19, 'Elisa Pinkerton', 'F', 36000, 16, 'B013', 'Supervisor'),
(20, 'Eric Montgomery', 'M', 33000, 7, 'B001', 'Assistant'),
(21, 'Alexander Reynolds', 'M', 37000, 5, 'B001', 'Assistant'),
(22, 'Edward Robinson', 'M', 28000, 7, 'B001', 'Assistant'),
(23, 'Jesse Owens', 'M', 34000, 4, 'B004', 'Supervisor'),
(25, 'Johnatan Hunter', 'M', 45000, 1, 'B014', 'Manager'),
(26, 'Lenita Kennedy', 'F', 56000, 1, 'B009', 'Manager'),
(27, 'Lisa Miller', 'F', 34000, 25, 'B014', 'Supervisor'),
(28, 'Lilly Jennings', 'F', 36000, 14, 'B005', 'Supervisor'),
(29, 'Rafaela Johnson', 'F', 23000, 12, 'B003', 'Assistant'),
(32, 'Harry Anderson', 'M', 40000, 12, 'B003', 'Assistant'),
(33, 'George Bailey', 'M', 73000, 1, 'B006', 'Manager'),
(34, 'Salomon Beckett', 'M', 46000, 1, 'B008', 'Manager'),
(35, 'Susan Armstrong', 'F', 28000, 15, 'B003', 'Assistant'),
(36, 'Rosa Hemingway', 'F', 30000, 15, 'B003', 'Assistant'),
(37, 'Martha McDonalds', 'F', 31000, 15, 'B003', 'Assistant'),
(38, 'Anna-Isabell Green', 'F', 32000, 33, 'B006', 'Supervisor'),
(39, 'Tina Hall-Becker', 'F', 34000, 18, 'B004', 'Assistant'),
(40, 'Thomas Harrison', 'M', 42000, 1, 'B007', 'Manager'),
(42, 'Winston Hughes', 'M', 22000, 40, 'B007', 'Supervisor'),
(44, 'Walter Jefferson', 'M', 23000, 18, 'B004', 'Assistant'),
(45, 'Zara Newton', 'F', 24000, 23, 'B004', 'Assistant'),
(46, 'Nina McDonalds', 'F', 25000, 23, 'B004', 'Assistant'),
(47, 'Naomi Campell', 'F', 26000, 63, 'B010', 'Assistant'),
(48, 'Carol Moore', 'M', 27000, 40, 'B007', 'Supervisor'),
(49, 'Tony McDonalds', 'M', 28000, 63, 'B010', 'Assistant'),
(50, 'Margret McElroy', 'F', 29000, 64, 'B011', 'Assistant'),
(51, 'Alexander Porter', 'M', 29000, 17, 'B012', 'Assistant'),
(52, 'Maria Quasimodo', 'M', 30000, 17, 'B012', 'Assistant'),
(53, 'Bertrand Russel', 'M', 31000, 34, 'B008', 'Supervisor'),
(54, 'Ashley Parker', 'M', 25500, 28, 'B005', 'Assistant'),
(55, 'John Stuart', 'M', 23500, 28, 'B005', 'Assistant'),
(56, 'Ruth Sanderss', 'F', 27700, 19, 'B013', 'Assistant'),
(57, 'Rafael Smith', 'M', 32000, 19, 'B013', 'Assistant'),
(58, 'Viola Rutherford', 'F', 21000, 27, 'B014', 'Assistant'),
(59, 'Sammy Churchill', 'M', 22000, 27, 'B014', 'Assistant'),
(60, 'Miriam Thorne', 'F', 26000, 27, 'B014', 'Assistant'),
(61, 'Sally Thatcher', 'F', 36000, 34, 'B008', 'Supervisor'),
(62, 'Larry Escott', 'M', 33000, 26, 'B009', 'Supervisor'),
(63, 'William Spencer', 'M', 32000, 6, 'B010', 'Supervisor'),
(64, 'Diana Ashley-Bell', 'F', 38000, 8, 'B011', 'Supervisor'),
(65, 'Audrey Thorne', 'F', 25000, 62, 'B009', 'Assistant'),
(66, 'Paula Burns', 'F', 24000, 62, 'B002', 'Assistant'),
(67, 'Amanda Wallis', 'F', 23000, 38, 'B006', 'Assistant'),
(68, 'Patty Stokes', 'F', 22000, 53, 'B008', 'Assistant'),
(69, 'Holly Fields', 'F', 21500, 53, 'B008', 'Assistant'),
(70, 'Martha McCulloch', 'F', 26000, 61, 'B008', 'Assistant'),
(71, 'Maurin Best', 'F', 22500, 42, 'B007', 'Assistant'),
(72, 'Martha McDonalds', 'F', 23500, 27, 'B014', 'Assistant'),
(73, 'Barrigan', NULL, 23500, 27, 'B013', 'Assistant');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Branch`
--
ALTER TABLE `Branch`
  ADD PRIMARY KEY (`BranchID`),
  ADD KEY `managerFK` (`managerFK`);

--
-- Indizes für die Tabelle `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`EmpID`),
  ADD KEY `branchFK` (`branchFK`),
  ADD KEY `supervisorFK` (`supervisorFK`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Branch`
--
ALTER TABLE `Branch`
  ADD CONSTRAINT `Branch_ibfk_1` FOREIGN KEY (`managerFK`) REFERENCES `Staff` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`supervisorFK`) REFERENCES `Staff` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branchFK` FOREIGN KEY (`branchFK`) REFERENCES `Branch` (`BranchID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
