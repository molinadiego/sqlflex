CREATE DATABASE  IF NOT EXISTS `id_maitenance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `id_maitenance`;
-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: id_maitenance
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `contractors`
--

DROP TABLE IF EXISTS `contractors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractors` (
  `id_contractor` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profession` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contractor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractors`
--

LOCK TABLES `contractors` WRITE;
/*!40000 ALTER TABLE `contractors` DISABLE KEYS */;
INSERT INTO `contractors` VALUES (1,'John','Miller','702-555-3101','john.miller@contractorsnv.com','Plumber'),(2,'Rebecca','Stone','702-555-3102','rebecca.stone@contractorsnv.com','Electrician'),(3,'Carlos','Ramirez','702-555-3103','carlos.ramirez@contractorsnv.com','HVAC Technician'),(4,'Steven','White','702-555-3104','steven.white@contractorsnv.com','Carpenter'),(5,'Linda','Nguyen','702-555-3105','linda.nguyen@contractorsnv.com','Painter'),(6,'Mark','Davis','702-555-3106','mark.davis@contractorsnv.com','Plumber'),(7,'Angela','Brooks','702-555-3107','angela.brooks@contractorsnv.com','Electrician'),(8,'Jose','Vega','702-555-3108','jose.vega@contractorsnv.com','HVAC Technician'),(9,'Paul','Anderson','702-555-3109','paul.anderson@contractorsnv.com','Handyman'),(10,'Kevin','Scott','702-555-3110','kevin.scott@contractorsnv.com','Carpenter'),(11,'Maria','Flores','702-555-3111','maria.flores@contractorsnv.com','Plumber'),(12,'Thomas','Reed','702-555-3112','thomas.reed@contractorsnv.com','Electrician'),(13,'Luis','Morales','702-555-3113','luis.morales@contractorsnv.com','HVAC Technician'),(14,'Brian','Young','702-555-3114','brian.young@contractorsnv.com','Handyman'),(15,'Sandra','Kim','702-555-3115','sandra.kim@contractorsnv.com','Painter');
/*!40000 ALTER TABLE `contractors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_wo` int NOT NULL,
  `date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `paid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_invoice`),
  UNIQUE KEY `id_wo` (`id_wo`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`id_wo`) REFERENCES `work_orders` (`id_wo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,'2024-02-10',478.00,1),(2,2,'2024-02-13',462.00,1),(3,3,'2024-02-16',215.00,0),(4,4,'2024-02-19',405.00,1),(5,5,'2024-02-22',214.00,1),(6,6,'2024-02-25',367.00,0),(7,7,'2024-02-28',348.00,1),(8,8,'2024-03-02',162.00,1),(9,9,'2024-03-05',412.00,0),(10,10,'2024-03-08',335.00,1),(11,11,'2024-03-11',259.00,1),(12,12,'2024-03-14',210.00,0),(13,13,'2024-03-17',196.00,1),(14,14,'2024-03-20',363.00,1),(15,15,'2024-03-23',246.00,0);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id_property` int NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `apartment` varchar(10) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip_code` int NOT NULL,
  `id_pm` int NOT NULL,
  PRIMARY KEY (`id_property`),
  KEY `id_pm` (`id_pm`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`id_pm`) REFERENCES `property_managements` (`id_pm`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'1001 Boulder Hwy','20B','Henderson','NV',89014,1),(2,'1002 Flamingo Rd','10B','Las Vegas','NV',89109,2),(3,'1003 Sunset Rd','5B','Henderson','NV',89014,3),(4,'1004 Flamingo Rd','18B','Las Vegas','NV',89109,4),(5,'1005 Stephanie St','24B','Henderson','NV',89014,5),(6,'1006 Tropicana Ave','10B','Las Vegas','NV',89109,6),(7,'1007 Boulder Hwy','24B','Henderson','NV',89014,7),(8,'1008 Spring Mountain Rd','4B','Las Vegas','NV',89109,8),(9,'1009 Stephanie St','13B','Henderson','NV',89014,9),(10,'1010 Sahara Ave','13B','Las Vegas','NV',89109,10),(11,'1011 Green Valley Pkwy','8B','Henderson','NV',89014,11),(12,'1012 Spring Mountain Rd','16B','Las Vegas','NV',89109,12),(13,'1013 Warm Springs Rd','12B','Henderson','NV',89014,13),(14,'1014 Sahara Ave','1B','Las Vegas','NV',89109,14),(15,'1015 Warm Springs Rd','7B','Henderson','NV',89014,15);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_managements`
--

DROP TABLE IF EXISTS `property_managements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_managements` (
  `id_pm` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `apartment` varchar(10) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip_code` int NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pm`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_managements`
--

LOCK TABLES `property_managements` WRITE;
/*!40000 ALTER TABLE `property_managements` DISABLE KEYS */;
INSERT INTO `property_managements` VALUES (1,'Silver State Property Management','301 Business Center Dr',NULL,'Las Vegas','NV',89102,'702-555-1101','contact1@silver.com'),(2,'Desert Home Management','302 Business Center Dr',NULL,'Las Vegas','NV',89103,'702-555-1102','contact2@desert.com'),(3,'Nevada Residential Group','303 Business Center Dr',NULL,'Las Vegas','NV',89104,'702-555-1103','contact3@nevada.com'),(4,'Red Rock Property Services','304 Business Center Dr',NULL,'Las Vegas','NV',89105,'702-555-1104','contact4@red.com'),(5,'Sun Valley Management','305 Business Center Dr',NULL,'Las Vegas','NV',89106,'702-555-1105','contact5@sun.com'),(6,'High Roller Property Mgmt','306 Business Center Dr',NULL,'Las Vegas','NV',89107,'702-555-1106','contact6@high.com'),(7,'Oasis Residential','307 Business Center Dr',NULL,'Las Vegas','NV',89108,'702-555-1107','contact7@oasis.com'),(8,'Vegas Prime Management','308 Business Center Dr',NULL,'Las Vegas','NV',89109,'702-555-1108','contact8@vegas.com'),(9,'Sierra Nevada Properties','309 Business Center Dr',NULL,'Las Vegas','NV',89110,'702-555-1109','contact9@sierra.com'),(10,'Golden West Management','310 Business Center Dr',NULL,'Las Vegas','NV',89111,'702-555-1110','contact10@golden.com'),(11,'Henderson Living','311 Business Center Dr',NULL,'Henderson','NV',89022,'702-555-1111','contact11@henderson.com'),(12,'Green Valley Property Mgmt','312 Business Center Dr',NULL,'Henderson','NV',89023,'702-555-1112','contact12@green.com'),(13,'Pinnacle Nevada','313 Business Center Dr',NULL,'Henderson','NV',89024,'702-555-1113','contact13@pinnacle.com'),(14,'Cornerstone Property Services','314 Business Center Dr',NULL,'Henderson','NV',89025,'702-555-1114','contact14@cornerstone.com'),(15,'Valleywide Management','315 Business Center Dr',NULL,'Henderson','NV',89026,'702-555-1115','contact15@valleywide.com');
/*!40000 ALTER TABLE `property_managements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental_agreement`
--

DROP TABLE IF EXISTS `rental_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental_agreement` (
  `id_ra` int NOT NULL AUTO_INCREMENT,
  `id_property` int NOT NULL,
  `id_tenant` int NOT NULL,
  `date_move_in` date NOT NULL,
  `date_move_out` date NOT NULL,
  PRIMARY KEY (`id_ra`),
  UNIQUE KEY `id_property` (`id_property`,`id_tenant`),
  KEY `id_tenant` (`id_tenant`),
  CONSTRAINT `rental_agreement_ibfk_1` FOREIGN KEY (`id_property`) REFERENCES `properties` (`id_property`),
  CONSTRAINT `rental_agreement_ibfk_2` FOREIGN KEY (`id_tenant`) REFERENCES `tenants` (`id_tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental_agreement`
--

LOCK TABLES `rental_agreement` WRITE;
/*!40000 ALTER TABLE `rental_agreement` DISABLE KEYS */;
INSERT INTO `rental_agreement` VALUES (1,1,1,'2022-06-01','2023-06-01'),(2,2,2,'2022-06-16','2023-06-16'),(3,3,3,'2022-07-01','2023-07-01'),(4,4,4,'2022-07-16','2023-07-16'),(5,5,5,'2022-07-31','2023-07-31'),(6,6,6,'2022-08-15','2023-08-15'),(7,7,7,'2022-08-30','2023-08-30'),(8,8,8,'2022-09-14','2023-09-14'),(9,9,9,'2022-09-29','2023-09-29'),(10,10,10,'2022-10-14','2023-10-14'),(11,11,11,'2022-10-29','2023-10-29'),(12,12,12,'2022-11-13','2023-11-13'),(13,13,13,'2022-11-28','2023-11-28'),(14,14,14,'2022-12-13','2023-12-13'),(15,15,15,'2022-12-28','2023-12-28');
/*!40000 ALTER TABLE `rental_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `id_tenant` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `id` int NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (1,'Michael','Johnson',800100,'702-444-2100','michael.johnson@gmail.com'),(2,'Sarah','Martinez',800101,'702-444-2101','sarah.martinez@gmail.com'),(3,'David','Smith',800102,'702-444-2102','david.smith@gmail.com'),(4,'Emily','Brown',800103,'702-444-2103','emily.brown@gmail.com'),(5,'James','Garcia',800104,'702-444-2104','james.garcia@gmail.com'),(6,'Laura','Wilson',800105,'702-444-2105','laura.wilson@gmail.com'),(7,'Daniel','Taylor',800106,'702-444-2106','daniel.taylor@gmail.com'),(8,'Jessica','Anderson',800107,'702-444-2107','jessica.anderson@gmail.com'),(9,'Robert','Hernandez',800108,'702-444-2108','robert.hernandez@gmail.com'),(10,'Amanda','Moore',800109,'702-444-2109','amanda.moore@gmail.com'),(11,'Jose','Lopez',800110,'702-444-2110','jose.lopez@gmail.com'),(12,'Maria','Clark',800111,'702-444-2111','maria.clark@gmail.com'),(13,'Anthony','Lewis',800112,'702-444-2112','anthony.lewis@gmail.com'),(14,'Nicole','Walker',800113,'702-444-2113','nicole.walker@gmail.com'),(15,'Brian','Hall',800114,'702-444-2114','brian.hall@gmail.com');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_invoices_status`
--

DROP TABLE IF EXISTS `vw_invoices_status`;
/*!50001 DROP VIEW IF EXISTS `vw_invoices_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_invoices_status` AS SELECT 
 1 AS `id_invoice`,
 1 AS `date`,
 1 AS `total_price`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_properties_management`
--

DROP TABLE IF EXISTS `vw_properties_management`;
/*!50001 DROP VIEW IF EXISTS `vw_properties_management`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_properties_management` AS SELECT 
 1 AS `management_name`,
 1 AS `address`,
 1 AS `city`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_by_work_order`
--

DROP TABLE IF EXISTS `vw_total_by_work_order`;
/*!50001 DROP VIEW IF EXISTS `vw_total_by_work_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_by_work_order` AS SELECT 
 1 AS `id_wo`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_work_orders_detail`
--

DROP TABLE IF EXISTS `vw_work_orders_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_work_orders_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_work_orders_detail` AS SELECT 
 1 AS `id_wo`,
 1 AS `date_received`,
 1 AS `date_done`,
 1 AS `property_address`,
 1 AS `tenant_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_works_contractors`
--

DROP TABLE IF EXISTS `vw_works_contractors`;
/*!50001 DROP VIEW IF EXISTS `vw_works_contractors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_works_contractors` AS SELECT 
 1 AS `id_work`,
 1 AS `description`,
 1 AS `price`,
 1 AS `contractor_name`,
 1 AS `profession`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_orders` (
  `id_wo` int NOT NULL AUTO_INCREMENT,
  `date_received` date NOT NULL,
  `date_done` date NOT NULL,
  `id_property` int NOT NULL,
  `id_tenant` int NOT NULL,
  PRIMARY KEY (`id_wo`),
  KEY `id_property` (`id_property`),
  KEY `id_tenant` (`id_tenant`),
  CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`id_property`) REFERENCES `properties` (`id_property`),
  CONSTRAINT `work_orders_ibfk_2` FOREIGN KEY (`id_tenant`) REFERENCES `tenants` (`id_tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_orders`
--

LOCK TABLES `work_orders` WRITE;
/*!40000 ALTER TABLE `work_orders` DISABLE KEYS */;
INSERT INTO `work_orders` VALUES (1,'2024-01-05','2024-01-07',1,1),(2,'2024-01-09','2024-01-11',2,2),(3,'2024-01-13','2024-01-15',3,3),(4,'2024-01-17','2024-01-19',4,4),(5,'2024-01-21','2024-01-23',5,5),(6,'2024-01-25','2024-01-27',6,6),(7,'2024-01-29','2024-01-31',7,7),(8,'2024-02-02','2024-02-04',8,8),(9,'2024-02-06','2024-02-08',9,9),(10,'2024-02-10','2024-02-12',10,10),(11,'2024-02-14','2024-02-16',11,11),(12,'2024-02-18','2024-02-20',12,12),(13,'2024-02-22','2024-02-24',13,13),(14,'2024-02-26','2024-02-28',14,14),(15,'2024-03-01','2024-03-03',15,15);
/*!40000 ALTER TABLE `work_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validate_work_order_dates` BEFORE INSERT ON `work_orders` FOR EACH ROW BEGIN
  IF NEW.date_done IS NOT NULL
    AND NEW.date_done < NEW.date_received THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'date_done cannot be before date_received';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id_work` int NOT NULL AUTO_INCREMENT,
  `id_wo` int NOT NULL,
  `id_contractor` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_work`),
  KEY `id_wo` (`id_wo`),
  KEY `id_contractor` (`id_contractor`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`id_wo`) REFERENCES `work_orders` (`id_wo`),
  CONSTRAINT `works_ibfk_2` FOREIGN KEY (`id_contractor`) REFERENCES `contractors` (`id_contractor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (1,1,1,'Water leak under kitchen sink',174.00),(2,2,2,'Air conditioner not cooling',215.00),(3,3,3,'Electrical breaker keeps tripping',325.00),(4,4,4,'Bathroom faucet dripping',343.00),(5,5,5,'Garage door not opening',349.00),(6,6,6,'Ceiling fan making noise',150.00),(7,7,7,'Dishwasher not draining',274.00),(8,8,8,'Wall outlet not working',271.00),(9,9,9,'Heater not turning on',153.00),(10,10,10,'Toilet continuously running',139.00),(11,11,11,'Water heater pilot light out',365.00),(12,12,12,'Smoke detector replacement',402.00),(13,13,13,'Broken window latch',427.00),(14,14,14,'Clogged shower drain',164.00),(15,15,15,'Exterior light not turning on',281.00);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_invoice_after_work` AFTER INSERT ON `works` FOR EACH ROW BEGIN
  IF EXISTS (SELECT 1 FROM invoices WHERE id_wo = NEW.id_wo) THEN
    UPDATE invoices
    SET total_price = fn_work_order_total(NEW.id_wo)
    WHERE id_wo = NEW.id_wo;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'id_maitenance'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_total_by_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_by_property`(p_id_property INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT IFNULL(SUM(i.total_price),0)
  INTO total
  FROM invoices i
  JOIN work_orders wo ON i.id_wo = wo.id_wo
  WHERE wo.id_property = p_id_property;

  RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_work_order_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_work_order_total`(p_id_wo INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT IFNULL(SUM(price),0)
  INTO total
  FROM works
  WHERE id_wo = p_id_wo;

  RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_invoice`(IN p_id_wo INT)
BEGIN
  IF NOT EXISTS (SELECT 1 FROM invoices WHERE id_wo = p_id_wo) THEN
    INSERT INTO invoices (id_wo, date, total_price, paid)
    VALUES (
      p_id_wo,
      CURDATE(),
      fn_work_order_total(p_id_wo),
      0
    );
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pay_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pay_invoice`(IN p_id_invoice INT)
BEGIN
  UPDATE invoices
  SET paid = 1
  WHERE id_invoice = p_id_invoice
    AND paid = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_invoices_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_invoices_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_invoices_status` AS select `i`.`id_invoice` AS `id_invoice`,`i`.`date` AS `date`,`i`.`total_price` AS `total_price`,(case when (`i`.`paid` = 1) then 'PAID' else 'PENDING' end) AS `status` from `invoices` `i` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_properties_management`
--

/*!50001 DROP VIEW IF EXISTS `vw_properties_management`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_properties_management` AS select `pm`.`name` AS `management_name`,`p`.`address` AS `address`,`p`.`city` AS `city`,`p`.`state` AS `state` from (`property_managements` `pm` join `properties` `p` on((`pm`.`id_pm` = `p`.`id_pm`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_by_work_order`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_by_work_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_by_work_order` AS select `wo`.`id_wo` AS `id_wo`,ifnull(sum(`w`.`price`),0) AS `total` from (`work_orders` `wo` left join `works` `w` on((`wo`.`id_wo` = `w`.`id_wo`))) group by `wo`.`id_wo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_work_orders_detail`
--

/*!50001 DROP VIEW IF EXISTS `vw_work_orders_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_work_orders_detail` AS select `wo`.`id_wo` AS `id_wo`,`wo`.`date_received` AS `date_received`,`wo`.`date_done` AS `date_done`,`p`.`address` AS `property_address`,concat(`t`.`first_name`,' ',`t`.`last_name`) AS `tenant_name` from ((`work_orders` `wo` join `properties` `p` on((`wo`.`id_property` = `p`.`id_property`))) join `tenants` `t` on((`wo`.`id_tenant` = `t`.`id_tenant`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_works_contractors`
--

/*!50001 DROP VIEW IF EXISTS `vw_works_contractors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_works_contractors` AS select `w`.`id_work` AS `id_work`,`w`.`description` AS `description`,`w`.`price` AS `price`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `contractor_name`,`c`.`profession` AS `profession` from (`works` `w` join `contractors` `c` on((`w`.`id_contractor` = `c`.`id_contractor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-15  9:01:53
