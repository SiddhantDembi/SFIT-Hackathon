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
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `product_qty` int DEFAULT NULL,
  `product_rate` int DEFAULT NULL,
  `product_category` varchar(45) DEFAULT NULL,
  `product_desc` varchar(200) DEFAULT NULL,
  `farmer_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'carrot',14,14,'grain','orange and ripe',7),(2,'onion',12,12,'vegetable','pink veggie',7),(3,'turmeric',50,600,'spice','haldi',11),(4,'potato',10,20,'vegetable','high quality potato',10),(5,'apple',20,200,'fruit','red apples',10),(6,'blackpepper',5,100,'spice','high quality',9),(7,'capsicum',25,60,'vegetable','green capsicum',9),(8,'cheese',5,500,'dairy','high  quality cheese',12),(9,'chillipowder',15,250,'spice','no colour added',12),(10,'cinnamon',20,40,'spice','high quality',12),(11,'curd',5,100,'dairy','high quality curd',7),(12,'flour',100,100,'grain','whole wheat',9),(13,'grape',10,200,'fruit','green grapes',11),(14,'milk',15,80,'dairy','cow milk',9),(15,'orange',20,90,'fruit','ripe orange',10),(16,'paneer',10,400,'dairy','low fat paneer',7),(17,'pulse',100,225,'grain','high quality',12),(18,'rice',120,400,'grain','basmati rice',10),(19,'sweetpotato',20,35,'vegetable','high quality',11),(20,'tomato',55,30,'vegitable','high quality',9),(21,'turmeric',20,480,'spice','no added colours',12),(22,'watermelon',15,200,'fruit','high quality',7);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
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
