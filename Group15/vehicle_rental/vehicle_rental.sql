-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2020 at 08:46 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle_rental`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `bill`
-- (See below for the actual view)
--
CREATE TABLE `bill` (
`BillID` int(11)
,`TotalAmount` float(10,2)
,`Deposit` float(6,2)
,`CustomerID` int(11)
,`VehicleRegNo` varchar(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
  `BillID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `Deposit` float(6,2) DEFAULT NULL,
  `TotalAmount` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_details`
--

INSERT INTO `billing_details` (`BillID`, `BookID`, `Deposit`, `TotalAmount`) VALUES
(1, 1, 2000.00, 5000.00),
(3, 19, 2000.00, NULL),
(4, 20, 2000.00, NULL),
(5, 22, 2000.00, NULL),
(6, 23, 2000.00, NULL),
(8, 25, 2000.00, NULL),
(12, 29, 2000.00, NULL),
(20, 37, 2000.00, NULL),
(22, 39, 2000.00, NULL),
(28, 45, 2000.00, NULL),
(30, 47, 2000.00, NULL),
(32, 49, 2000.00, NULL),
(34, 51, 2000.00, NULL),
(36, 53, 2000.00, NULL),
(40, 57, 2000.00, NULL),
(42, 59, 2000.00, NULL),
(44, 61, 750.00, 1700.00),
(46, 63, 800.00, 5900.00),
(48, 65, 2000.00, 10500.00),
(50, 67, 1000.00, 6500.00),
(52, 69, 800.00, 4100.00),
(53, 70, 1000.00, 3500.00),
(55, 72, NULL, NULL),
(59, 76, NULL, NULL),
(63, 80, 750.00, 1700.00),
(65, 82, 2000.00, 3400.00),
(67, 84, 750.00, 5300.00),
(71, 88, 2000.00, 15000.00),
(73, 90, 2000.00, 9200.00),
(75, 92, 2000.00, 6300.00),
(77, 94, 2000.00, 3400.00),
(79, 96, 750.00, 1700.00),
(89, 106, 2000.00, 6300.00),
(93, 110, 2000.00, 9200.00),
(95, 112, 1000.00, 8500.00);

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `BookID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `VehicleRegNo` varchar(7) DEFAULT NULL,
  `PickupDate` datetime DEFAULT NULL,
  `DropoffDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`BookID`, `CustomerID`, `VehicleRegNo`, `PickupDate`, `DropoffDate`) VALUES
(1, NULL, 'ABC2454', '2020-03-10 00:00:00', '2020-03-12 00:00:00'),
(2, NULL, 'ABC2454', '2020-06-07 00:00:00', '2020-06-10 00:00:00'),
(3, NULL, NULL, NULL, NULL),
(4, NULL, 'ABC2454', '2020-06-07 00:00:00', '2020-06-08 00:00:00'),
(5, NULL, NULL, NULL, NULL),
(6, NULL, 'ABC2454', '2020-06-07 00:00:00', '2020-06-08 00:00:00'),
(7, NULL, NULL, NULL, NULL),
(8, NULL, 'ABC2954', '2020-05-05 00:00:00', '2020-05-10 00:00:00'),
(9, NULL, NULL, NULL, NULL),
(10, NULL, 'ABC2954', '2020-05-12 00:00:00', '2020-05-15 00:00:00'),
(11, NULL, NULL, NULL, NULL),
(12, NULL, 'ABC2454', '2020-08-01 00:00:00', '2020-08-03 00:00:00'),
(13, NULL, NULL, NULL, NULL),
(19, NULL, 'ABC2454', '2020-09-08 00:00:00', '2020-09-11 00:00:00'),
(20, NULL, 'ABC2454', '2020-09-09 00:00:00', '2020-09-13 00:00:00'),
(21, NULL, 'ABC2454', '2020-11-02 00:00:00', '2020-11-04 00:00:00'),
(22, NULL, 'ABC2454', '2020-09-08 00:00:00', '2020-09-12 00:00:00'),
(23, NULL, 'ABC2954', '2020-08-17 00:00:00', '2020-08-19 00:00:00'),
(25, NULL, 'ABC2454', '2020-06-11 00:00:00', '2020-06-18 00:00:00'),
(29, 9, 'ABC2454', '2020-01-14 00:00:00', '2020-01-16 00:00:00'),
(37, 6, 'ABC2954', '2020-08-18 00:00:00', '2020-08-20 00:00:00'),
(39, 8, 'ABC2954', '2020-08-01 00:00:00', '2020-08-05 00:00:00'),
(45, 8, 'ABC2954', '2020-05-15 00:00:00', '2020-05-20 00:00:00'),
(47, 10, 'ABC2954', '2020-08-12 00:00:00', '2020-08-16 00:00:00'),
(49, 8, 'ABC2954', '2020-06-23 00:00:00', '2020-06-26 00:00:00'),
(51, 14, 'ABC2954', '2020-08-16 00:00:00', '2020-08-21 00:00:00'),
(53, 5, 'ABC2454', '2020-08-16 00:00:00', '2020-08-20 00:00:00'),
(57, 8, 'HHA8755', '2020-06-07 00:00:00', '2020-06-17 00:00:00'),
(59, 7, 'HHA8755', '2020-06-23 00:00:00', '2020-06-26 00:00:00'),
(61, 9, 'DS8767', '2020-06-27 00:00:00', '2020-06-28 00:00:00'),
(63, 7, 'SDE1344', '2020-08-05 00:00:00', '2020-08-08 00:00:00'),
(65, 9, 'RRT2433', '2020-06-07 00:00:00', '2020-06-11 00:00:00'),
(67, 11, 'ABC2454', '2020-06-20 00:00:00', '2020-06-23 00:00:00'),
(69, 6, 'SDE1344', '2020-05-12 00:00:00', '2020-05-14 00:00:00'),
(70, 7, 'ABC2954', '2020-08-17 00:00:00', '2020-08-19 00:00:00'),
(72, 12, 'SDE1344', '2020-05-12 00:00:00', '2020-05-13 00:00:00'),
(76, 14, 'HHA8755', '2020-07-23 00:00:00', '2020-07-25 00:00:00'),
(80, 5, 'DS8767', '2020-06-21 00:00:00', '2020-06-22 00:00:00'),
(82, 6, 'HHA8755', '2020-05-12 00:00:00', '2020-05-13 00:00:00'),
(84, 13, 'DS8767', '2020-05-12 00:00:00', '2020-05-16 00:00:00'),
(88, 12, 'HHA8755', '2020-08-20 00:00:00', '2020-08-25 00:00:00'),
(90, 8, 'HHA8755', '2020-08-16 00:00:00', '2020-08-19 00:00:00'),
(92, 13, 'HHA8755', '2020-06-07 00:00:00', '2020-06-09 00:00:00'),
(94, 6, 'HHA8755', '2020-08-16 00:00:00', '2020-08-17 00:00:00'),
(96, 8, 'DS8767', '2020-05-12 00:00:00', '2020-05-13 00:00:00'),
(106, 6, 'HHA8755', '2020-08-01 00:00:00', '2020-08-03 00:00:00'),
(110, 6, 'HHA8755', '2020-05-12 00:00:00', '2020-05-15 00:00:00'),
(112, 7, 'ABC2454', '2020-12-11 00:00:00', '2020-12-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(30) NOT NULL,
  `CustomerNIC` char(10) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ContactNumber` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerNIC`, `Address`, `ContactNumber`) VALUES
(1, 'Sadithi Nimasha', '909434438V', '56 1st Street,Ampara', 785463782),
(2, 'Fathima Hafsa', '863584350V', '26/E Main Road,Colombo 02', 702008621),
(3, 'Mithun Fernando', '979468664V', ' 43 Athurana,Matara', 782925781),
(4, 'Indra Dias', '704749009V', 'NO.12,Flower Avenue,Jaffna', 716357222),
(5, 'Hasini Kaumadi', '983309842V', '12/B,Beach Road,Panadura', 709967213),
(6, ' Kethaki Narmada', '993320936V', '50 1st Cross Street,Gampaha', 752286388),
(7, 'Gayal Nimatha', '961221876V', 'NO.71,SAMAGI RD,Galle', 702169987),
(8, 'Niro De Silve', '994051783V', '51,Lotus Rd, Kurunegala', 717483999),
(9, 'Miyuru Gunasekara', '929534400V', '71,James Rd,Matale', 723464582),
(10, 'Jithmi Yapa', '873124360V', '32/D Main Road,Colombo 05', 722067631),
(11, 'Sahan Peris', '949464662V', ' 47,Hospital Rd,Waligama', 752889783),
(12, 'Rohith Sharma', '734659879V', 'No 9, Main Street,JaEla', 768887221),
(13, 'Lihini Gamage', '903309812V', '7,Meerigama,Pasyala', 700002134),
(14, 'Kusumi Perera', '993325996V', '50 ,Tangalle,Beiatta', 752284533),
(15, 'Mihisaru Jithmika', '961771091V', 'NO.8,Koslanda,Akurana', 709991112),
(16, 'Pashitha Nirmani', '982633382V', '9,Pidurangala,Dambulla', 776538819),
(17, '', '987656300V', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleRegNo` varchar(7) NOT NULL,
  `VehicleID` int(11) NOT NULL,
  `VehicleName` varchar(30) DEFAULT NULL,
  `Company` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `ProductionYear` int(11) DEFAULT NULL,
  `CostPerDay` float(6,2) DEFAULT NULL,
  `Deposit` float(6,2) DEFAULT NULL,
  `Availability` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VehicleRegNo`, `VehicleID`, `VehicleName`, `Company`, `Model`, `ProductionYear`, `CostPerDay`, `Deposit`, `Availability`) VALUES
('ABC2454', 1, 'CAR', 'TOYOTA', 'COROLLA', 2014, 2000.00, 1000.00, 'NO'),
('ABC2954', 11, 'CAR', 'TOYOTA', 'COROLLA', 2014, 1500.00, 1000.00, 'YES'),
('AS7656', 6, 'VAN', 'NISSAN', 'HIROOF AHK', 2010, 1000.00, 500.00, 'YES'),
('AS7657', 10, 'CAR', 'SUZUKI', 'SUZUKI K1', 2019, 3000.00, 1000.00, 'YES'),
('BBN2454', 14, 'CAR', 'TOYOTA', 'PRIUS', 2016, 3000.00, 1000.00, 'NO'),
('DS8767', 3, 'CAR', 'NISSAN', 'NISSAN PRO', 2019, 1200.00, 750.00, 'YES'),
('EDC0087', 20, 'PAJERO', 'MITSUBISHI', 'MONTERO', 2013, 3000.00, 1000.00, 'YES'),
('HHA8755', 19, 'VAN', 'TOYOTA', 'HIACE', 2012, 2900.00, 2000.00, 'NO'),
('JHG9999', 12, 'CAR', 'HONDA', 'COROLLA', 2015, 2200.00, 2000.00, 'YES'),
('MKJ3477', 18, 'CAR', 'NISSAN', 'LEAF AZIO', 2018, 1900.00, 2000.00, 'YES'),
('QIU8767', 8, 'MOTORBIKE', 'HONDA', 'HONDA MAX', 2000, 1000.00, 500.00, 'YES'),
('RRT2433', 13, 'CAR', 'TOYOTA', 'VITZ', 2017, 2500.00, 2000.00, 'YES'),
('SDE1344', 15, 'CAR', 'HONDA', 'INSIGHT', 2019, 1800.00, 800.00, 'YES'),
('SQJ9876', 2, 'MINIVAN', 'TOYOTA', 'HIGHACE', 2020, 2500.00, 1500.00, 'YES'),
('TRA6578', 4, 'CAR', 'SUZUKI', 'MARUTI', 2018, 1250.00, 500.00, 'YES'),
('TY7654', 5, 'CAR', 'TOYOTA', 'COROLLA', 2015, 2200.00, 1000.00, 'YES'),
('WER2004', 16, 'PAJERO', 'NISSAN', 'NAVARO', 2011, 3200.00, 1000.00, 'YES'),
('WQ2817', 7, 'MOTORBIKE', 'BAJAJ', 'BAJAJ PRO', 2018, 750.00, 500.00, 'YES'),
('WU8987', 9, 'CAR', 'TOYOTA', 'ALLION', 2016, 2500.00, 1000.00, 'YES'),
('ZXS6674', 17, 'CAR', 'HONDA', 'COROLLA', 2014, 2800.00, 1000.00, 'YES');

-- --------------------------------------------------------

--
-- Structure for view `bill`
--
DROP TABLE IF EXISTS `bill`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bill`  AS  select `q`.`BillID` AS `BillID`,`q`.`TotalAmount` AS `TotalAmount`,`q`.`Deposit` AS `Deposit`,`p`.`CustomerID` AS `CustomerID`,`p`.`VehicleRegNo` AS `VehicleRegNo` from (`booking_details` `p` join `billing_details` `q`) where `p`.`BookID` = `q`.`BookID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`BillID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `VehicleRegNo` (`VehicleRegNo`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleRegNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_details`
--
ALTER TABLE `billing_details`
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD CONSTRAINT `billing_details_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `booking_details` (`BookID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`VehicleRegNo`) REFERENCES `vehicle` (`VehicleRegNo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
