-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tourist_tours
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleteAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (28,'ORDER00001','Lê Đình Tú','letu260203@gmail.com','0983805141','Tôi sẽ liên hệ khi chuyến đi bắt đầu','active',1,1800000,'25-06-2025 09:00','Tour Vịnh Hạ Long',2,0,NULL,'2025-06-06 07:30:02','2025-06-07 11:02:43'),(30,'ORDER00002','Lê Đình Tú','letu260203@gmail.com','0983805141','','active',4,6336000,' 09:30','Tour Nha Trang',2,0,NULL,'2025-06-10 15:59:50','2025-06-10 16:00:39'),(31,'ORDER00003','12345678','tu260203@gmail.com','0983805141','','active',6,8870400,' 09:30','Tour Nha Trang',4,0,NULL,'2025-06-10 16:12:32','2025-06-10 16:13:00'),(32,'ORDER00004','Lê Đình Tú','letu260203@gmail.com','0983805141','','initial',3,6720000,' 10:00','Tour Phú Quốc',4,0,NULL,'2025-06-10 16:15:01','2025-06-10 16:15:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 12:58:52
