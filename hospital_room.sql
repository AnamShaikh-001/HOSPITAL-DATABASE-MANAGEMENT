CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomnumber` int DEFAULT NULL,
  `roomtype` text,
  `blockfloor` int DEFAULT NULL,
  `blockcode` int DEFAULT NULL,
  `unavailable` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'Single',1,1,'f'),(102,'Single',1,1,'f'),(103,'Single',1,1,'f'),(111,'Single',1,2,'f'),(112,'Single',1,2,'t'),(113,'Single',1,2,'f'),(121,'Single',1,3,'f'),(122,'Single',1,3,'f'),(123,'Single',1,3,'f'),(201,'Single',2,1,'t'),(202,'Single',2,1,'f'),(203,'Single',2,1,'f'),(211,'Single',2,2,'f'),(212,'Single',2,2,'f'),(213,'Single',2,2,'t'),(221,'Single',2,3,'f'),(222,'Single',2,3,'f'),(223,'Single',2,3,'f'),(301,'Single',3,1,'f'),(302,'Single',3,1,'t'),(303,'Single',3,1,'f'),(311,'Single',3,2,'f'),(312,'Single',3,2,'f'),(313,'Single',3,2,'f'),(321,'Single',3,3,'t'),(322,'Single',3,3,'f'),(323,'Single',3,3,'f'),(401,'Single',4,1,'f'),(402,'Single',4,1,'t'),(403,'Single',4,1,'f'),(411,'Single',4,2,'f'),(412,'Single',4,2,'f'),(413,'Single',4,2,'f'),(421,'Single',4,3,'t'),(422,'Single',4,3,'f'),(423,'Single',4,3,'f');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 15:07:14
