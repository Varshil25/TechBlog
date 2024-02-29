-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TechBlog
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT COMMENT '	\n	',
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_posts_2_idx` (`userId`),
  KEY `fk_posts_1_idx` (`catId`),
  CONSTRAINT `fk_posts_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'What is a Collection Framework?','Collection Framework is useful in DataBase.','No code needed.','Java.jpg','2024-02-27 11:13:46',1,52),(3,'What is Python?','python is one of the most popular language for deep learning.','No Code needed.','python.jpeg','2024-02-27 11:20:19',2,52),(4,'RDBMS','In Java i am using SQL CRUD operations for database entry and exit.','NO Code needed.','Database.jpg','2024-02-27 11:34:17',4,52),(6,'What is React and NodeJs in web?','Both are Framework of JavaScript. ','No Code needed.','Web.webp','2024-02-28 05:03:51',3,52),(7,'What is HashMap?','define their syntax and properties?','No code.','Java.jpg','2024-02-29 05:10:18',1,54);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 13:01:32
