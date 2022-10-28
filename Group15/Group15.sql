-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: VEHICLE_RENTAL_MANAGEMENT_SYSTEM
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_details`
--

DROP TABLE IF EXISTS `billing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_details` (
  `Bill_ID` varchar(10) NOT NULL,
  `Book_ID` varchar(6) DEFAULT NULL,
  `Deposite` float(8,2) DEFAULT NULL,
  `Tax_amount` float(5,2) DEFAULT NULL,
  `Drop_off_date` date DEFAULT NULL,
  `Drop_off_time` time DEFAULT NULL,
  `Total_amount` float(8,2) DEFAULT NULL,
  `Bill_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `Book_ID` (`Book_ID`),
  CONSTRAINT `billing_details_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `booking_details` (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_details`
--

LOCK TABLES `billing_details` WRITE;
/*!40000 ALTER TABLE `billing_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_details` (
  `Book_ID` varchar(6) NOT NULL,
  `Deposite` float(8,2) DEFAULT NULL,
  `Pickup_date` date DEFAULT NULL,
  `Pickup_time` time DEFAULT NULL,
  `Customer_ID` char(10) DEFAULT NULL,
  `Vehicle_regNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Vehicle_regNo` (`Vehicle_regNo`),
  CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `booking_details_ibfk_2` FOREIGN KEY (`Vehicle_regNo`) REFERENCES `vehicle` (`Vehicle_regNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choose_vehicle`
--

DROP TABLE IF EXISTS `choose_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choose_vehicle` (
  `Customer_ID` char(10) DEFAULT NULL,
  `Vehicle_regNo` varchar(10) DEFAULT NULL,
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Vehicle_regNo` (`Vehicle_regNo`),
  CONSTRAINT `choose_vehicle_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `choose_vehicle_ibfk_2` FOREIGN KEY (`Vehicle_regNo`) REFERENCES `vehicle` (`Vehicle_regNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose_vehicle`
--

LOCK TABLES `choose_vehicle` WRITE;
/*!40000 ALTER TABLE `choose_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `choose_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` char(10) NOT NULL,
  `Customer_name` varchar(50) DEFAULT NULL,
  `Customer_NIC` char(10) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `Vehicle_regNo` varchar(10) NOT NULL,
  `Vehicle_ID` varchar(10) DEFAULT NULL,
  `Production_year` int(4) DEFAULT NULL,
  `Availability` varchar(3) DEFAULT NULL,
  `Cost_per_hour` float(5,2) DEFAULT NULL,
  `Company` varchar(15) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Deposite` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_regNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-26 13:25:43
