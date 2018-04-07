-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stayfit
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `browser_categories`
--

DROP TABLE IF EXISTS `browser_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `ItemType` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_categories`
--

LOCK TABLES `browser_categories` WRITE;
/*!40000 ALTER TABLE `browser_categories` DISABLE KEYS */;
INSERT INTO `browser_categories` VALUES (1,'Popular Exercises','The most popular exercises','exercises'),(2,'Base Exercises','The base exercises','exercises'),(3,'Exercises For Girls','The best exercises for girls','exercises'),(4,'Ideal Exercises For Novice','First exercises to do when you are first time go to gym','exercises'),(5,'Best Programs For Mass Gain','If you want to gain mass these programs are the best to start with','programs'),(6,'Best Programs For Fat Burn','Forget about fat, with these programs you take off all undesirable kilo','programs');
/*!40000 ALTER TABLE `browser_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_muscles`
--

DROP TABLE IF EXISTS `exercise_muscles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_muscles` (
  `Exercise` int(10) unsigned NOT NULL,
  `Muscle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Exercise`),
  KEY `Muscle_idx` (`Muscle`),
  CONSTRAINT `Exercise` FOREIGN KEY (`Exercise`) REFERENCES `exercises` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Muscle` FOREIGN KEY (`Muscle`) REFERENCES `muscles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_muscles`
--

LOCK TABLES `exercise_muscles` WRITE;
/*!40000 ALTER TABLE `exercise_muscles` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_muscles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Difficulty` tinyint(1) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `ShortDescription` varchar(100) NOT NULL,
  `Image` varchar(1024) NOT NULL,
  `MuscleGroup` int(10) unsigned NOT NULL,
  `Rating` float NOT NULL,
  `IsBase` tinyint(4) NOT NULL DEFAULT '0',
  `Voted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `ActiveMusculeGroup_idx` (`MuscleGroup`),
  CONSTRAINT `ActiveMusculeGroup` FOREIGN KEY (`MuscleGroup`) REFERENCES `muscle_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,1,'Standing Dumbbell Curl','In a biceps-focused list like this, you can’t leave out the classic curl. So we didn’t. (Don’t worry: The exercises will get more interesting.) But we would ask that you use a weight that makes sense: If you’re swaying back wildly and contorting your body—especially excessively arching your lower back—to lift the load, you should probably get a lighter pair of dumbbells.','No short description yet','standing_dumbbell_curl.jpg',1,0,0,0),(2,3,'Deadlift','Arguably the king of all exercises, the deadlift hits every major muscle group hard, and is perhaps the greatest test of strength there is. Because of all the muscles involved, it releases a huge amount of testosterone (a muscle-building hormone) into the bloodstream. For this reason, the deadlift is a great cornerstone for any fitness plan.','No short description yet','deadlift.jpg',2,0,1,0),(3,3,'Back Squat','Just like the deadlift, the barbell back squat hits just about every major muscle group there is in the body and is the king of leg-developing movements. Any athlete will tout the squat as the reason they run fast, jump high, and keep increasing in strength all over. ','No short description yet','back_squat.jpg',3,4.3,1,10),(4,2,'Bench Press','Every gym-goer in the world has been asked “Whaddya bench?” at least once. This move is responsible for developing powerful, well-defined pecs, shoulders, and triceps, which lead to a more commanding presence, with or without a shirt on. Combine that with the muscle-building effects of the testosterone this move releases and all you have left to do is watch your “little black book” fill up.','No short description yet','bench_press.jpg',5,0,1,0),(5,2,'Pullups','Nothing quite says “I’m big” like a wide set of shoulders; a wide back doesn\'t hurt either. The best move for developing those big, fan-shaped muscles (latissimus dorsi, aka, the lats) that make your shoulders look wide is the traditional pullup. It’s a big, multijoint move, which leads to testosterone release, meaning strength and overall muscle development will be enhanced.','No short description yet','pullups.jpg',2,4.25,1,25),(6,2,'Barbell Overhead Press','Some would argue that the standing barbell overhead press is a better upper-body developer than the mighty bench press itself. Because it demands huge effort from your abs and all the assistance muscles that get used to press the barbell overhead; this move leads to a set of shoulders that look like cannonballs and will develop the chest just as well as any other move.','No short description yet','barbell_overhead_press.jpg',6,0,1,0),(7,2,'Hack Squat','no description yet','No short description yet','hack_squat.jpg',3,4.1,0,11),(8,2,'Dumbbel Incline Press','no description yet','No short description yet','dumbbel_incline_press.jpg',5,0,1,0),(9,3,'T-Bar Row','no description yet','No short description yet','t_bar_row.jpg',2,4.4,1,15),(10,2,'Incline Dumbbell Curl','no description yet','No short description yet','incline_dumbbell_curl.jpg',7,0,0,0),(11,1,'Squats','no description yet','No short description yet','squats.jpg',3,0,1,0),(12,1,'Push-Ups','no description yet','No short description yet','push_ups.jpg',5,0,1,0),(13,1,'Running','no description yet','No short description yet','running.jpg',8,0,1,0);
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muscle_groups`
--

DROP TABLE IF EXISTS `muscle_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muscle_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muscle_groups`
--

LOCK TABLES `muscle_groups` WRITE;
/*!40000 ALTER TABLE `muscle_groups` DISABLE KEYS */;
INSERT INTO `muscle_groups` VALUES (1,'Biceps-Focused','Exercises focused on bicep'),(2,'Back-Focused','Exercises focused on back'),(3,'Legs-Focused','Exercises focused on legs'),(4,'Arm-Focused','Exercises focused mainly on arms'),(5,'Pecs-Focused','Exercises focused mainly on pecs'),(6,'Shoulders-Focused','Exercises focused on shoulders and upper-body muscles'),(7,'Triceps-Focused','Exercises focused mainly on triceps'),(8,'Cardio','Cardio Exercises');
/*!40000 ALTER TABLE `muscle_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muscles`
--

DROP TABLE IF EXISTS `muscles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muscles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `LatinName` varchar(200) NOT NULL,
  `Category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`Name`),
  UNIQUE KEY `LatinName_UNIQUE` (`LatinName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muscles`
--

LOCK TABLES `muscles` WRITE;
/*!40000 ALTER TABLE `muscles` DISABLE KEYS */;
/*!40000 ALTER TABLE `muscles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `ShortDescription` varchar(100) NOT NULL,
  `Image` varchar(1024) NOT NULL,
  `Difficulty` tinyint(1) NOT NULL,
  `Price` int(11) NOT NULL,
  `Rating` float NOT NULL,
  `Voted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'FULLBODY - For Beginners','Super program for fullbody training for absolute beginners! Training hard, no pain no gaink, only base exercises, only Denis Borisov! Hey You!! What are you watching?! JUST GO to gym and work body, do you want to attract girls or wat?!','Ideal program if you are a novice in bodybuilding. Try it now!','full_body_novice.jpg',2,0,4,10);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_items`
--

DROP TABLE IF EXISTS `tag_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_items` (
  `TagId` int(10) unsigned NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ItemType` varchar(45) NOT NULL,
  PRIMARY KEY (`TagId`,`ItemId`,`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_items`
--

LOCK TABLES `tag_items` WRITE;
/*!40000 ALTER TABLE `tag_items` DISABLE KEYS */;
INSERT INTO `tag_items` VALUES (1,1,'exercise'),(1,3,'exercise'),(1,4,'exercise'),(1,5,'exercise'),(1,11,'exercise'),(1,12,'exercise'),(1,13,'exercise'),(2,1,'exercise'),(2,3,'exercise'),(2,4,'exercise'),(2,5,'exercise'),(2,11,'exercise'),(2,12,'exercise'),(2,13,'exercise'),(3,1,'exercise'),(3,3,'exercise'),(3,4,'exercise'),(3,5,'exercise'),(3,11,'exercise'),(3,12,'exercise'),(3,13,'exercise'),(6,6,'exercise'),(6,7,'exercise'),(6,8,'exercise'),(6,9,'exercise'),(6,10,'exercise');
/*!40000 ALTER TABLE `tag_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Title_UNIQUE` (`Title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Table contain item tags (exercise or programs)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'For Beginners'),(2,'For Girls'),(3,'For Men'),(6,'For Professional'),(4,'Full-Body'),(5,'Split');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_category1`
--

DROP TABLE IF EXISTS `view_category1`;
/*!50001 DROP VIEW IF EXISTS `view_category1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category1` AS SELECT 
 1 AS `id`,
 1 AS `Difficulty`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category2`
--

DROP TABLE IF EXISTS `view_category2`;
/*!50001 DROP VIEW IF EXISTS `view_category2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category2` AS SELECT 
 1 AS `id`,
 1 AS `Difficulty`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category3`
--

DROP TABLE IF EXISTS `view_category3`;
/*!50001 DROP VIEW IF EXISTS `view_category3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category3` AS SELECT 
 1 AS `id`,
 1 AS `Difficulty`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category4`
--

DROP TABLE IF EXISTS `view_category4`;
/*!50001 DROP VIEW IF EXISTS `view_category4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category4` AS SELECT 
 1 AS `id`,
 1 AS `Difficulty`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category5`
--

DROP TABLE IF EXISTS `view_category5`;
/*!50001 DROP VIEW IF EXISTS `view_category5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category5` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Difficulty`,
 1 AS `Price`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_category6`
--

DROP TABLE IF EXISTS `view_category6`;
/*!50001 DROP VIEW IF EXISTS `view_category6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_category6` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `ShortDescription`,
 1 AS `Image`,
 1 AS `Difficulty`,
 1 AS `Price`,
 1 AS `Rating`,
 1 AS `Voted`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'stayfit'
--
/*!50003 DROP PROCEDURE IF EXISTS `category1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`StayFit`@`%` PROCEDURE `category1`()
    COMMENT 'Procedure for browser category 1'
BEGIN
	SELECT * FROM `exercises` WHERE `rating` > 4 AND `voted` > 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`StayFit`@`%` PROCEDURE `category2`()
    COMMENT 'Procedure for browser category 1'
BEGIN
	SELECT * FROM `exercises` WHERE `isBase` = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`StayFit`@`%` PROCEDURE `category3`()
    COMMENT 'Procedure for browser category 3'
BEGIN
	SELECT * FROM `exercises` 
    LEFT JOIN `tag_items` ON `tag_items`.`ItemId` = `exercises`.`id`
    WHERE `tag_items`.`TagId` = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `category4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`StayFit`@`%` PROCEDURE `category4`()
    COMMENT 'Procedure for browser category 4'
BEGIN
	SELECT `exercises`.* FROM `exercises` 
    LEFT JOIN `tag_items` ON `tag_items`.`ItemId` = `exercises`.`id`
    WHERE `tag_items`.`TagId` = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_category1`
--

/*!50001 DROP VIEW IF EXISTS `view_category1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category1` AS select `exercises`.`id` AS `id`,`exercises`.`Difficulty` AS `Difficulty`,`exercises`.`Name` AS `Name`,`exercises`.`Description` AS `Description`,`exercises`.`ShortDescription` AS `ShortDescription`,`exercises`.`Image` AS `Image`,`exercises`.`Rating` AS `Rating`,`exercises`.`Voted` AS `Voted` from `exercises` where ((`exercises`.`Rating` > 4) and (`exercises`.`Voted` > 10)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category2`
--

/*!50001 DROP VIEW IF EXISTS `view_category2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category2` AS select `exercises`.`id` AS `id`,`exercises`.`Difficulty` AS `Difficulty`,`exercises`.`Name` AS `Name`,`exercises`.`Description` AS `Description`,`exercises`.`ShortDescription` AS `ShortDescription`,`exercises`.`Image` AS `Image`,`exercises`.`Rating` AS `Rating`,`exercises`.`Voted` AS `Voted` from `exercises` where (`exercises`.`IsBase` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category3`
--

/*!50001 DROP VIEW IF EXISTS `view_category3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category3` AS select `exercises`.`id` AS `id`,`exercises`.`Difficulty` AS `Difficulty`,`exercises`.`Name` AS `Name`,`exercises`.`Description` AS `Description`,`exercises`.`ShortDescription` AS `ShortDescription`,`exercises`.`Image` AS `Image`,`exercises`.`Rating` AS `Rating`,`exercises`.`Voted` AS `Voted` from (`exercises` left join `tag_items` on((`tag_items`.`ItemId` = `exercises`.`id`))) where (`tag_items`.`TagId` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category4`
--

/*!50001 DROP VIEW IF EXISTS `view_category4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category4` AS select `exercises`.`id` AS `id`,`exercises`.`Difficulty` AS `Difficulty`,`exercises`.`Name` AS `Name`,`exercises`.`Description` AS `Description`,`exercises`.`ShortDescription` AS `ShortDescription`,`exercises`.`Image` AS `Image`,`exercises`.`Rating` AS `Rating`,`exercises`.`Voted` AS `Voted` from (`exercises` left join `tag_items` on((`tag_items`.`ItemId` = `exercises`.`id`))) where (`tag_items`.`TagId` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category5`
--

/*!50001 DROP VIEW IF EXISTS `view_category5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category5` AS select `programs`.`id` AS `id`,`programs`.`Name` AS `Name`,`programs`.`Description` AS `Description`,`programs`.`ShortDescription` AS `ShortDescription`,`programs`.`Image` AS `Image`,`programs`.`Difficulty` AS `Difficulty`,`programs`.`Price` AS `Price`,`programs`.`Rating` AS `Rating`,`programs`.`Voted` AS `Voted` from `programs` where (`programs`.`id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_category6`
--

/*!50001 DROP VIEW IF EXISTS `view_category6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`StayFit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_category6` AS select `programs`.`id` AS `id`,`programs`.`Name` AS `Name`,`programs`.`Description` AS `Description`,`programs`.`ShortDescription` AS `ShortDescription`,`programs`.`Image` AS `Image`,`programs`.`Difficulty` AS `Difficulty`,`programs`.`Price` AS `Price`,`programs`.`Rating` AS `Rating`,`programs`.`Voted` AS `Voted` from `programs` where (`programs`.`id` = 1) */;
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

-- Dump completed on 2018-04-07 14:11:56
