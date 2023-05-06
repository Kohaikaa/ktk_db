-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: vtunes
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `AlbumId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(160) NOT NULL,
  `ArtistId` int NOT NULL,
  PRIMARY KEY (`AlbumId`),
  KEY `ArtistId` (`ArtistId`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`ArtistId`) REFERENCES `artists` (`ArtistId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'For Those About To Rock We Salute You',1),(2,'Balls to the Wall',2),(3,'Restless and Wild',2),(4,'Let There Be Rock',1),(5,'Big Ones',3),(6,'Jagged Little Pill',4),(7,'Facelift',5),(8,'Warner 25 Anos',6),(9,'Plays Metallica By Four Cellos',7),(10,'Audioslave',8);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `ArtistId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ArtistId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith'),(4,'Alanis Morissette'),(5,'Alice In Chains'),(6,'Antônio Carlos Jobim'),(7,'Apocalyptica'),(8,'Audioslave'),(9,'BackBeat'),(10,'Billy Cobham');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Company` varchar(80) DEFAULT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Email` varchar(60) NOT NULL,
  `SupportRepId` int DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `SupportRepId` (`SupportRepId`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`SupportRepId`) REFERENCES `employees` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Luís','Gonçalves','Embraer - Empresa Brasileira de Aeronáutica S.A.','Av. Brigadeiro Faria Lima, 2170','São José dos Campos','SP','Brazil','12227-000','+55 (12) 3923-5555','+55 (12) 3923-5566','luisg@embraer.com.br',3),(2,'Leonie','Köhler',NULL,'Theodor-Heuss-Straße 34','Stuttgart',NULL,'Germany','70174','+49 0711 2842222',NULL,'leonekohler@surfeu.de',5),(3,'François','Tremblay',NULL,'1498 rue Bélanger','Montréal','QC','Canada','H2G 1A7','+1 (514) 721-4711',NULL,'ftremblay@gmail.com',3),(4,'Bjørn','Hansen',NULL,'Ullevålsveien 14','Oslo',NULL,'Norway','0171','+47 22 44 22 22',NULL,'bjorn.hansen@yahoo.no',4),(5,'František','Wichterlová','JetBrains s.r.o.','Klanova 9/506','Prague',NULL,'Czech Republic','14700','+420 2 4172 5555','+420 2 4172 5555','frantisekw@jetbrains.com',4),(6,'Helena','Holý',NULL,'Rilská 3174/6','Prague',NULL,'Czech Republic','14300','+420 2 4177 0449',NULL,'hholy@gmail.com',5),(7,'Astrid','Gruber',NULL,'Rotenturmstraße 4, 1010 Innere Stadt','Vienne',NULL,'Austria','1010','+43 01 5134505',NULL,'astrid.gruber@apple.at',5),(8,'Daan','Peeters',NULL,'Grétrystraat 63','Brussels',NULL,'Belgium','1000','+32 02 219 03 03',NULL,'daan_peeters@apple.be',4),(9,'Kara','Nielsen',NULL,'Sønder Boulevard 51','Copenhagen',NULL,'Denmark','1720','+453 3331 9991',NULL,'kara.nielsen@jubii.dk',4),(10,'Eduardo','Martins','Woodstock Discos','Rua Dr. Falcão Filho, 155','São Paulo','SP','Brazil','01007-010','+55 (11) 3033-5446','+55 (11) 3033-4564','eduardo@woodstock.com.br',4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeId` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `ReportsTo` int DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `ReportsTo` (`ReportsTo`),
  KEY `Title` (`Title`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`ReportsTo`) REFERENCES `employees` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Adams','Andrew','General Manager',NULL,'1962-02-18 00:00:00','2002-08-14 00:00:00','11120 Jasper Ave NW','Edmonton','AB','Canada','T5K 2N1','+1 (780) 428-9482','+1 (780) 428-3457','andrew@chinookcorp.com'),(2,'Edwards','Nancy','Sales Manager',1,'1958-12-08 00:00:00','2002-05-01 00:00:00','825 8 Ave SW','Calgary','AB','Canada','T2P 2T3','+1 (403) 262-3443','+1 (403) 262-3322','nancy@chinookcorp.com'),(3,'Peacock','Jane','Sales Support Agent',2,'1973-08-29 00:00:00','2002-04-01 00:00:00','1111 6 Ave SW','Calgary','AB','Canada','T2P 5M5','+1 (403) 262-3443','+1 (403) 262-6712','jane@chinookcorp.com'),(4,'Park','Margaret','Sales Support Agent',2,'1947-09-19 00:00:00','2003-05-03 00:00:00','683 10 Street SW','Calgary','AB','Canada','T2P 5G3','+1 (403) 263-4423','+1 (403) 263-4289','margaret@chinookcorp.com'),(5,'Johnson','Steve','Sales Support Agent',2,'1965-03-03 00:00:00','2003-10-17 00:00:00','7727B 41 Ave','Calgary','AB','Canada','T3B 1Y7','1 (780) 836-9987','1 (780) 836-9543','steve@chinookcorp.com'),(6,'Mitchell','Michael','IT Manager',1,'1973-07-01 00:00:00','2003-10-17 00:00:00','5827 Bowness Road NW','Calgary','AB','Canada','T3B 0C5','+1 (403) 246-9887','+1 (403) 246-9899','michael@chinookcorp.com'),(7,'King','Robert','IT Staff',6,'1970-05-29 00:00:00','2004-01-02 00:00:00','590 Columbia Boulevard West','Lethbridge','AB','Canada','T1K 5N8','+1 (403) 456-9986','+1 (403) 456-8485','robert@chinookcorp.com'),(8,'Callahan','Laura','IT Staff',6,'1968-01-09 00:00:00','2004-03-04 00:00:00','923 7 ST NW','Lethbridge','AB','Canada','T1H 1Y8','+1 (403) 467-3351','+1 (403) 467-8772','laura@chinookcorp.com');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `GenreId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`GenreId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Rock'),(2,'Jazz'),(3,'Metal'),(4,'Alternative & Punk'),(5,'Rock And Roll'),(6,'Blues'),(7,'Latin'),(8,'Reggae'),(9,'Pop'),(10,'Soundtrack');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `InvoiceLineId` int NOT NULL AUTO_INCREMENT,
  `InvoiceId` int NOT NULL,
  `TrackId` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  KEY `InvoiceId` (`InvoiceId`),
  KEY `TrackId` (`TrackId`),
  CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `invoices` (`InvoiceId`),
  CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`TrackId`) REFERENCES `tracks` (`TrackId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
INSERT INTO `invoice_items` VALUES (1,1,2,0.99,1),(2,1,4,0.99,1),(3,2,6,0.99,1),(4,2,8,0.99,1),(5,2,10,0.99,1);
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `InvoiceId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `BillingAddress` varchar(70) DEFAULT NULL,
  `BillingCity` varchar(40) DEFAULT NULL,
  `BillingState` varchar(40) DEFAULT NULL,
  `BillingCountry` varchar(40) DEFAULT NULL,
  `BillingPostalCode` varchar(10) DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,2,'2009-01-01 00:00:00','Theodor-Heuss-Straße 34','Stuttgart',NULL,'Germany','70174',1.98),(2,4,'2009-01-02 00:00:00','Ullevålsveien 14','Oslo',NULL,'Norway','0171',3.96),(3,8,'2009-01-03 00:00:00','Grétrystraat 63','Brussels',NULL,'Belgium','1000',5.94);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `MediaTypeId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'MPEG audio file'),(2,'Protected AAC audio file'),(3,'Protected MPEG-4 video file'),(4,'Purchased AAC audio file'),(5,'AAC audio file');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_track`
--

DROP TABLE IF EXISTS `playlist_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_track` (
  `PlaylistId` int NOT NULL,
  `TrackId` int NOT NULL,
  PRIMARY KEY (`PlaylistId`,`TrackId`),
  KEY `TrackId` (`TrackId`),
  CONSTRAINT `playlist_track_ibfk_1` FOREIGN KEY (`PlaylistId`) REFERENCES `playlists` (`PlaylistId`),
  CONSTRAINT `playlist_track_ibfk_2` FOREIGN KEY (`TrackId`) REFERENCES `tracks` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_track`
--

LOCK TABLES `playlist_track` WRITE;
/*!40000 ALTER TABLE `playlist_track` DISABLE KEYS */;
INSERT INTO `playlist_track` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
/*!40000 ALTER TABLE `playlist_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `PlaylistId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) NOT NULL,
  PRIMARY KEY (`PlaylistId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Music'),(2,'Movies'),(3,'TV Shows'),(4,'Audiobooks'),(5,'90’s Music'),(6,'Audiobooks'),(7,'Movies'),(8,'Music'),(9,'Music Videos'),(10,'TV Shows');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `TrackId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `AlbumId` int DEFAULT NULL,
  `MediaTypeId` int NOT NULL,
  `GenreId` int DEFAULT NULL,
  `Composer` varchar(220) DEFAULT NULL,
  `Milliseconds` int NOT NULL,
  `Bytes` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  KEY `AlbumId` (`AlbumId`),
  KEY `GenreId` (`GenreId`),
  KEY `MediaTypeId` (`MediaTypeId`),
  CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`AlbumId`) REFERENCES `albums` (`AlbumId`),
  CONSTRAINT `tracks_ibfk_2` FOREIGN KEY (`GenreId`) REFERENCES `genres` (`GenreId`),
  CONSTRAINT `tracks_ibfk_3` FOREIGN KEY (`MediaTypeId`) REFERENCES `media_types` (`MediaTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'For Those About To Rock (We Salute You)',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',343719,11170334,0.99),(2,'Balls to the Wall',2,2,1,NULL,342562,5510424,0.99),(3,'Fast As a Shark',3,2,1,'F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman',230619,3990994,0.99),(4,'Restless and Wild',3,2,1,'F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman',252051,4331779,0.99),(5,'Princess of the Dawn',3,2,1,'Deaffy & R.A. Smith-Diesel',375418,6290521,0.99),(6,'Put The Finger On You',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',205662,6713451,0.99),(7,'Let\'s Get It Up',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',233926,7636561,0.99),(8,'Inject The Venom',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',210834,6852860,0.99),(9,'Snowballed',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',203102,6599424,0.99),(10,'Evil Walks',1,1,1,'Angus Young, Malcolm Young, Brian Johnson',263497,8611245,0.99);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_customersfromgermany`
--

DROP TABLE IF EXISTS `v_customersfromgermany`;
/*!50001 DROP VIEW IF EXISTS `v_customersfromgermany`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_customersfromgermany` AS SELECT 
 1 AS `CustomerId`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Company`,
 1 AS `Address`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Country`,
 1 AS `PostalCode`,
 1 AS `Phone`,
 1 AS `Fax`,
 1 AS `Email`,
 1 AS `SupportRepId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_trackinfo`
--

DROP TABLE IF EXISTS `v_trackinfo`;
/*!50001 DROP VIEW IF EXISTS `v_trackinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_trackinfo` AS SELECT 
 1 AS `Name`,
 1 AS `Album title`,
 1 AS `Genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_customersfromgermany`
--

/*!50001 DROP VIEW IF EXISTS `v_customersfromgermany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_customersfromgermany` AS select `c`.`CustomerId` AS `CustomerId`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`c`.`Company` AS `Company`,`c`.`Address` AS `Address`,`c`.`City` AS `City`,`c`.`State` AS `State`,`c`.`Country` AS `Country`,`c`.`PostalCode` AS `PostalCode`,`c`.`Phone` AS `Phone`,`c`.`Fax` AS `Fax`,`c`.`Email` AS `Email`,`c`.`SupportRepId` AS `SupportRepId` from `customers` `c` where (`c`.`Country` = 'Germany') order by `c`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_trackinfo`
--

/*!50001 DROP VIEW IF EXISTS `v_trackinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_trackinfo` AS select `t`.`Name` AS `Name`,(select `a`.`Title` from `albums` `a` where (`a`.`AlbumId` = `t`.`AlbumId`)) AS `Album title`,(select `gen`.`Name` from `genres` `gen` where (`gen`.`GenreId` = `t`.`GenreId`)) AS `Genre` from `tracks` `t` */;
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

-- Dump completed on 2023-05-06 11:11:20
