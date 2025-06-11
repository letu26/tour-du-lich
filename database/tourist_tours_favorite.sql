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
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `startPlace` varchar(45) DEFAULT NULL,
  `information` longtext,
  `price` int DEFAULT NULL,
  `schedule` longtext,
  `discount` int DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (28,2,'Tour Sapa','https://cdn.getyourguide.com/img/tour/f8beb543552c97494fac503de3c935b66582828a8e4fba71f6ba4bb2772ba4e8.jpg/132.webp','Sapa','Leo đỉnh Phansipan, đi thăm thị trấn Sapa',3000000,'3N2Đ',25,'tham-hiem-sapa','TOUR000008'),(38,2,'Tour Nha Trang','https://th.bing.com/th/id/OIP.ytDZm_t1-PXAoRXDq5OuyAHaEK?w=290&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Nha Trang','Tham quan Vinpearl, tắm biển Nha Trang',1800000,'2N1Đ',12,'du-lich-nha-trang','TOUR000003'),(45,2,'Tour Khám Phá Huế','https://th.bing.com/th/id/OIP.FMO_DCWSmQBwb294LVT9CQHaFa?w=248&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7','Huế','Tham quan đại cung điện, ngắm cầu Trường Tiền',1900000,'3N2Đ',12,'kham-pha-hue','TOUR000007'),(46,2,'Tour Đà Nẵng','https://th.bing.com/th/id/OIP.7N-UK0kpOS0GHY84qEK5QwHaEK?w=234&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Đà Nẵng','Thăm cầu Rồng, vui chơi trên bãi biển Mỹ Khê',2000000,'5N4Đ',15,'chuyen-di-da-nang','TOUR000002'),(47,2,'Tour Đảo Ngọc Cô Tô','https://th.bing.com/th/id/OIP.QHHPOsb5MA9vmU-pnP2JywHaFS?w=248&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Cô Tô','Ghé thăm làng Chài, tắm biển Cô Tô',2500000,'2N1Đ',15,'dao-ngoc-co-to','TOUR000006'),(49,2,'Tour Vịnh Hạ Long','https://th.bing.com/th/id/OIP.kazpU2K4sxgStY5loORdqwHaEK?w=282&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Hạ Long','Duyệt thác, thăm các đảo lân cận, thưởng thức đặc sản',2000000,'3N3Đ',10,'tour-ha-long','TOUR000001'),(50,4,'Tour Đà Nẵng','https://th.bing.com/th/id/OIP.7N-UK0kpOS0GHY84qEK5QwHaEK?w=234&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Đà Nẵng','Thăm cầu Rồng, vui chơi trên bãi biển Mỹ Khê',2000000,'5N4Đ',15,'chuyen-di-da-nang','TOUR000002'),(51,4,'Tour Nha Trang','https://bizweb.dktcdn.net/100/505/645/products/sp2-04d95c8f-9688-4cbc-a200-dbfa6a9c5e12.jpg?v=1703428504240','Nha Trang','Tham quan Vinpearl, tắm biển Nha Trang',1800000,'2N1Đ',12,'du-lich-nha-trang','TOUR000003'),(52,4,'Tour Vịnh Hạ Long','https://th.bing.com/th/id/OIP.kazpU2K4sxgStY5loORdqwHaEK?w=282&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Hạ Long','Duyệt thác, thăm các đảo lân cận, thưởng thức đặc sản',2000000,'3N3Đ',10,'tour-ha-long','TOUR000001'),(53,4,'Tour Sài Gòn','https://th.bing.com/th/id/OIP.bHmSssW2sZ--HdbyjZSMQAHaEg?w=271&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Sài Gòn','Khám phá quận 1, thưởng thức ẩm thực',2200000,'3N2Đ',18,'hanh-trinh-sai-gon','TOUR000004'),(54,4,'Tour Đảo Ngọc Cô Tô','https://th.bing.com/th/id/OIP.QHHPOsb5MA9vmU-pnP2JywHaFS?w=248&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','Cô Tô','Ghé thăm làng Chài, tắm biển Cô Tô',2500000,'2N1Đ',15,'dao-ngoc-co-to','TOUR000006');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 12:58:54
