-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `assignment`
--

create database united_helpers;

use united_helpers;

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `fk-task_idx` (`taskCode`),
  CONSTRAINT `fk-task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk-volunteer` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,101,'2021-07-01 09:00:00',NULL),(2,105,'2021-08-02 09:00:00',NULL),(3,103,'2021-05-01 09:00:00','2021-05-03 18:00:00'),(3,106,'2021-07-25 12:00:00',NULL),(4,103,'2021-05-01 09:00:00','2021-05-03 18:00:00'),(4,108,'2021-08-02 09:00:00','2021-08-03 09:00:00'),(5,107,NULL,NULL),(7,101,'2020-11-01 09:00:00','2021-03-31 17:00:00'),(7,102,'2021-08-01 12:00:00',NULL),(8,102,'2021-08-01 12:00:00',NULL),(9,109,'2021-08-04 07:00:00','2021-08-05 07:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(45) NOT NULL,
  `itemValue` float NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `idx_item_itemDescription` (`itemDescription`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'can of spam',10,100),(2,'dried fruit',5,50),(3,'1 gallon water bottle',2,1000),(4,'flashlight',20,500),(5,'tent',100,1),(6,'bottle of aspirin',150,375),(7,'pack of bandages',20,1300),(8,'bottle of antibiotics',125,100),(9,'Baby formula',10,632),(10,'men\'s coat',125,513),(11,'women\'s coat',134,476),(12,'sleeping bag',75,950);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` datetime NOT NULL,
  `packageWeight` float NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk-task_idx` (`taskCode`),
  KEY `fk-packageType_idx` (`packageTypeId`),
  CONSTRAINT `fk-package-task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk-packageType` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,102,3,'2019-08-02 00:00:00',32),(2,102,3,'2019-08-02 00:00:00',34),(3,102,2,'2019-08-03 00:00:00',54),(4,102,4,'2019-08-03 00:00:00',132),(5,105,5,'2019-08-05 00:00:00',68),(6,103,2,'2019-05-05 00:00:00',55),(7,106,3,'2019-07-27 00:00:00',103),(8,106,3,'2019-07-29 00:00:00',102),(9,106,3,'2019-07-31 00:00:00',103),(10,109,5,'2019-08-04 00:00:00',79);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk-package_idx` (`packageId`),
  CONSTRAINT `fk-item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk-package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,2),(1,2,3),(2,2,23),(3,1,4),(3,2,3),(3,7,5),(3,8,6),(3,9,6),(5,4,2),(9,3,10),(9,6,15),(10,5,6),(10,10,6),(11,5,5),(12,4,2);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food and water'),(4,'shelter'),(5,'clothing');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(45) NOT NULL,
  `packingListDescription` varchar(100) NOT NULL,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Major distribution','include all of the basic needs to help at least 1,000 people'),(2,'Additional food','Provide additional food to 100 people'),(3,'Basic Medical','Contains basic medical supplies for 150 people after major catastrophe'),(4,'Large water','Large shipment of water containers'),(5,'Basic clothes','Basic clothes to support 20 families'),(6,'Winter clothes','Coats and sweaters for 50 people'),(7,'Burn kits','Special medical supplies for burn victims'),(8,'Shelter kits','Tents, sleeping bags and blankets for 50 families'),(9,'Basic Child care','Formula, clothes, toys for 50 children'),(10,'Medium Water','Medium shipment of water containers');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `fk-taskType_idx` (`taskTypeId`),
  KEY `fk-taskStatus_idx` (`taskStatusId`),
  KEY `fk-packingList_idx` (`packingListId`),
  CONSTRAINT `fk-packingList` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `fk-taskStatus` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `fk-taskType` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (101,NULL,1,1,'Answer the telephone'),(102,1,2,2,'Prepare 5,000 packages'),(103,9,2,3,'Prepare 20 children\'s packages'),(104,2,2,4,'Prepare 100 food packages'),(105,5,2,2,'Prepare 50 clothing packages'),(106,4,2,2,'Prepare 100 water packages'),(107,NULL,3,4,'Transport packages to airport'),(108,9,2,3,'Prepare 20 children\'s packages'),(109,5,2,3,'Prepare 80 clothing packages'),(110,NULL,3,4,'Take packages to the warehouse');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(45) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'ongoing'),(2,'open'),(3,'closed'),(4,'pending');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'recurring'),(2,'packing'),(3,'transporting');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `taskpackage`
--

DROP TABLE IF EXISTS `taskpackage`;
/*!50001 DROP VIEW IF EXISTS `taskpackage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `taskpackage` AS SELECT 
 1 AS `task`,
 1 AS `taskType`,
 1 AS `package`,
 1 AS `packageType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(45) NOT NULL,
  `volunteerAddress` varchar(45) NOT NULL,
  `volunteerTelephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Harry Smith','123 Main St, New York, NY',NULL),(2,'John Brown','876 Broadway, New York NY','212 555 1212'),(3,'Joan Simmons','932 E 11st St, New Brunswick, NJ',NULL),(4,'Chris Jordan','495 Blvd E, Edgewater, NJ','201 443 5734'),(5,'George Brewer','1402 Main St, Westport, CT','203 323 5534'),(6,'David Jones','20 Westbury Ave, Westbury NY','917 330 2201'),(7,'Julie White','14 W 72nd St, New York, NY','212 756 4399'),(8,'Gerry Banks','29 Highway 46, Wayne NJ','201 333 2232'),(9,'Gene Lewin','45 Harlem Drive, Bronx, NY','917 452 8888'),(10,'Sue Spencer','783 Fairfield Dr, Mahwah NJ','201 783 8837');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `volunteertask`
--

DROP TABLE IF EXISTS `volunteertask`;
/*!50001 DROP VIEW IF EXISTS `volunteertask`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `volunteertask` AS SELECT 
 1 AS `volunteer`,
 1 AS `task`,
 1 AS `taskType`,
 1 AS `taskStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `taskpackage`
--

/*!50001 DROP VIEW IF EXISTS `taskpackage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `taskpackage` AS select `task`.`taskDescription` AS `task`,`task_type`.`taskTypeName` AS `taskType`,`package`.`packageId` AS `package`,`package_type`.`packageTypeName` AS `packageType` from (((`task` left join `task_type` on((`task`.`taskTypeId` = `task_type`.`taskTypeId`))) left join `package` on((`task`.`taskCode` = `package`.`taskCode`))) left join `package_type` on((`package`.`packageTypeId` = `package_type`.`packageTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `volunteertask`
--

/*!50001 DROP VIEW IF EXISTS `volunteertask`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `volunteertask` AS select `volunteer`.`volunteerName` AS `volunteer`,`task`.`taskDescription` AS `task`,`task_type`.`taskTypeName` AS `taskType`,`task_status`.`taskStatusName` AS `taskStatus` from ((((`volunteer` left join `assignment` on((`volunteer`.`volunteerId` = `assignment`.`volunteerId`))) left join `task` on((`assignment`.`taskCode` = `task`.`taskCode`))) left join `task_type` on((`task`.`taskTypeId` = `task_type`.`taskTypeId`))) left join `task_status` on((`task`.`taskStatusId` = `task_status`.`taskStatusId`))) */;
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

-- Dump completed on 2022-01-01 10:36:25
