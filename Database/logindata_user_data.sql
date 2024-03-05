-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: aws.connect.psdb.cloud    Database: logindata
-- ------------------------------------------------------
-- Server version	8.0.23-PlanetScale

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06ad443c-4867-11ee-b727-aa0cb21ee216:1-47,
57ca6c59-c771-11ed-9da6-f69d5205cc05:1-200,
7802d3ca-d405-11ed-a4c8-3a78c1582850:1-286,
8ac59fb5-4752-11ee-837d-e6393d367372:1-84,
b5f264f5-c8fd-11ed-aef2-96a0917f25da:1-487,
d70a12c6-3550-11ee-8a1d-aa739f99264f:1-136,
ee6dac44-bf6c-11ed-a9b9-f699e47b882d:1-1017,
eeb7ba4e-bf6c-11ed-958d-fafffbe8ec16:1-242,
eecc400c-bf6c-11ed-a256-f23b3ed01b2c:1-513';

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_data` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` VALUES (1,'sidd','sid@gmail.com','1234'),(2,'surya','a@gmail.com','1234'),(3,'Bhuvan','bhsawant@gmail.com','1234'),(5,'shreyas','sh@gmail.com','2003'),(6,'sarthak','sar@gmail.com','code'),(7,'sumil','sum@gmail.com','2345'),(8,'ajay','aj@gmail.com','kumar'),(9,'anas','anas@gmail.com','dev123'),(10,'sujal','suj@gmail.com','sujal'),(11,'shrihari','shri@gmail.com','shri'),(20,'adia','adi@gmail.com','1234'),(21,'Ninad','ninad@gmail.com','1234'),(22,'ninad','ninad@gmail.com','1234'),(23,'shaunak','shaunakrananaware@gmail.com','science98'),(24,'harilal','harilal@gmail.com','12345678');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11  1:50:08
