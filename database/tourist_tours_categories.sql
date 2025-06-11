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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext,
  `status` varchar(20) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleteAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tour trong nước','https://th.bing.com/th/id/OIP.qF7DdgNTD96wHPhCR34dtwHaD1?w=289&h=179&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour du lịch trong nước','active','tour-trong-nuoc',0,NULL,'2025-04-16 18:51:21','2025-06-08 08:36:42'),(2,'Tour nước ngoài','https://th.bing.com/th/id/OIP.yiKPYJ13E1cVrvHWsvw-FgHaDg?w=322&h=165&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour du lịch quốc tế','active','tour-nuoc-ngoai',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(3,'Tour mùa hè','https://th.bing.com/th/id/OIP.pZopqOI24Z0p70_iFcy5gQHaE8?w=217&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour phù hợp cho mùa hè','active','tour-mua-he',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(4,'Tour mùa đông','https://www.vietnambooking.com/wp-content/uploads/2017/12/sapa-mua-dong-3.jpg','Các tour phù hợp cho mùa đông','active','tour-mua-dong',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(5,'Tour thám hiểm','https://th.bing.com/th/id/OIP.Sz8DRmBSzEgtIqPsshh6kQHaE8?w=291&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour khám phá và thám hiểm','active','tour-tham-hiem',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(6,'Tour nghỉ dưỡng','https://th.bing.com/th/id/OIP.dfWT5hCul3-pEisq-oOZfgHaC9?w=290&h=140&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour nghỉ dưỡng tại các khu resort','active','tour-nghi-duong',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(7,'Tour ẩm thực','https://th.bing.com/th/id/OIP.q-qWu6q1kokII3glxUiB9gHaEc?w=290&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour trải nghiệm ẩm thực độc đáo','active','tour-am-thuc',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(8,'Tour giáo dục','https://th.bing.com/th/id/OIP.puJ880bfrRaeN_cVxLODTwHaEK?w=299&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour học thuật và giáo dục','active','tour-giao-duc',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(9,'Tour thể thao','https://th.bing.com/th/id/OIP.ieaJlOqwxV8O4R48uGSiQQHaE7?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour liên quan hoạt động thể thao','active','tour-the-thao',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21'),(10,'Tour gia đình','https://th.bing.com/th/id/OIP.kqACnMClnF05rirWsLw7QwHaE7?w=266&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Các tour phù hợp cho cả gia đình','active','tour-gia-dinh',0,NULL,'2025-04-16 18:51:21','2025-04-16 18:51:21');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 12:58:53
