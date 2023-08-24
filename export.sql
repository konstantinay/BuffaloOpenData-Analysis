-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: pythonproject
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `months_highest_recyclables_quantity`
--

DROP TABLE IF EXISTS `months_highest_recyclables_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `months_highest_recyclables_quantity` (
  `month` text,
  `total_in_tons` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `months_highest_recyclables_quantity`
--

LOCK TABLES `months_highest_recyclables_quantity` WRITE;
/*!40000 ALTER TABLE `months_highest_recyclables_quantity` DISABLE KEYS */;
INSERT INTO `months_highest_recyclables_quantity` VALUES ('December',179989,1),('May',120301,2),('June',113166,3),('August',110220,4),('July',105019,5);
/*!40000 ALTER TABLE `months_highest_recyclables_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantities_of_recyclable_waste`
--

DROP TABLE IF EXISTS `quantities_of_recyclable_waste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantities_of_recyclable_waste` (
  `type` text,
  `total_in_tons` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantities_of_recyclable_waste`
--

LOCK TABLES `quantities_of_recyclable_waste` WRITE;
/*!40000 ALTER TABLE `quantities_of_recyclable_waste` DISABLE KEYS */;
INSERT INTO `quantities_of_recyclable_waste` VALUES ('Asphalt Debris',60000,1),('Bottle Bill',30749,2),('Curb Garbage',763669,3),('Curb Recycling',134191,4),('E-Waste',3165,5),('Haz Waste',117,6),('Misc. Garbage',133025,7),('Misc. Recycling',41348,8),('Recycled Tires',2174,9),('Scrap Metal',33778,10),('Sidewalk Debris',5004,11),('Yard Waste',80881,12);
/*!40000 ALTER TABLE `quantities_of_recyclable_waste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearly_recycling_quantities`
--

DROP TABLE IF EXISTS `yearly_recycling_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yearly_recycling_quantities` (
  `date` bigint DEFAULT NULL,
  `total_in_tons` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearly_recycling_quantities`
--

LOCK TABLES `yearly_recycling_quantities` WRITE;
/*!40000 ALTER TABLE `yearly_recycling_quantities` DISABLE KEYS */;
INSERT INTO `yearly_recycling_quantities` VALUES (2014,213944,1),(2015,156190,2),(2016,147764,3),(2017,146914,4),(2018,149180,5),(2019,152221,6),(2020,152815,7),(2021,153065,8),(2022,16008,9);
/*!40000 ALTER TABLE `yearly_recycling_quantities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 18:14:34
