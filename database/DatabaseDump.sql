CREATE DATABASE  IF NOT EXISTS `stayfit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stayfit`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_categories`
--

LOCK TABLES `browser_categories` WRITE;
/*!40000 ALTER TABLE `browser_categories` DISABLE KEYS */;
INSERT INTO `browser_categories` VALUES (1,'Popular Exercises','The most popular exercises','exercises'),(2,'Base Exercises','The base exercises','exercises'),(3,'Exercises For Girls','The best exercises for girls','exercises');
/*!40000 ALTER TABLE `browser_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_category_items`
--

DROP TABLE IF EXISTS `browser_category_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_category_items` (
  `Category` int(10) unsigned NOT NULL,
  `Item` int(10) unsigned NOT NULL,
  KEY `Category_idx` (`Category`),
  CONSTRAINT `Category` FOREIGN KEY (`Category`) REFERENCES `browser_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_category_items`
--

LOCK TABLES `browser_category_items` WRITE;
/*!40000 ALTER TABLE `browser_category_items` DISABLE KEYS */;
INSERT INTO `browser_category_items` VALUES (1,2),(1,3),(1,4),(1,5),(1,6),(1,1),(2,2),(2,3),(2,4),(2,5),(2,6);
/*!40000 ALTER TABLE `browser_category_items` ENABLE KEYS */;
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
  `Description` varchar(2000) NOT NULL,
  `Image` varchar(1024) NOT NULL,
  `MuscleGroup` int(10) unsigned NOT NULL,
  `Rating` tinyint(2) NOT NULL,
  `IsBase` tinyint(4) NOT NULL DEFAULT '0',
  `Voted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `ActiveMusculeGroup_idx` (`MuscleGroup`),
  CONSTRAINT `ActiveMusculeGroup` FOREIGN KEY (`MuscleGroup`) REFERENCES `muscle_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,1,'Standing Dumbbell Curl','In a biceps-focused list like this, you can’t leave out the classic curl. So we didn’t. (Don’t worry: The exercises will get more interesting.) But we would ask that you use a weight that makes sense: If you’re swaying back wildly and contorting your body—especially excessively arching your lower back—to lift the load, you should probably get a lighter pair of dumbbells.','standing_dumbbell_curl.jpg',1,0,0,0),(2,3,'Deadlift','Arguably the king of all exercises, the deadlift hits every major muscle group hard, and is perhaps the greatest test of strength there is. Because of all the muscles involved, it releases a huge amount of testosterone (a muscle-building hormone) into the bloodstream. For this reason, the deadlift is a great cornerstone for any fitness plan.','deadlift.jpg',2,0,1,0),(3,3,'Back Squat','Just like the deadlift, the barbell back squat hits just about every major muscle group there is in the body and is the king of leg-developing movements. Any athlete will tout the squat as the reason they run fast, jump high, and keep increasing in strength all over. ','back_squat.jpg',3,0,1,0),(4,2,'Bench Press','Every gym-goer in the world has been asked “Whaddya bench?” at least once. This move is responsible for developing powerful, well-defined pecs, shoulders, and triceps, which lead to a more commanding presence, with or without a shirt on. Combine that with the muscle-building effects of the testosterone this move releases and all you have left to do is watch your “little black book” fill up.','bench_press.jpg',5,0,1,0),(5,2,'Pullup','Nothing quite says “I’m big” like a wide set of shoulders; a wide back doesn\'t hurt either. The best move for developing those big, fan-shaped muscles (latissimus dorsi, aka, the lats) that make your shoulders look wide is the traditional pullup. It’s a big, multijoint move, which leads to testosterone release, meaning strength and overall muscle development will be enhanced.','pullup.jpg',2,0,1,0),(6,2,'Barbell Overhead Press','Some would argue that the standing barbell overhead press is a better upper-body developer than the mighty bench press itself. Because it demands huge effort from your abs and all the assistance muscles that get used to press the barbell overhead; this move leads to a set of shoulders that look like cannonballs and will develop the chest just as well as any other move.','barbell_overhead_press',6,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muscle_groups`
--

LOCK TABLES `muscle_groups` WRITE;
/*!40000 ALTER TABLE `muscle_groups` DISABLE KEYS */;
INSERT INTO `muscle_groups` VALUES (1,'Biceps-Focused','Exercises focused on bicep'),(2,'Back-Focused','Exercises focused on back'),(3,'Legs-Focused','Exercises focused on legs'),(4,'Arm-Focused','Exercises focused mainly on arms'),(5,'Pecs-Focused','Exercises focused mainly on pecs'),(6,'Shoulders-Focused','Exercises focused on shoulders and upper-body muscles');
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
  `Description` varchar(1024) NOT NULL,
  `Image` varchar(1024) NOT NULL,
  `Difficulty` tinyint(1) NOT NULL,
  `Price` int(11) NOT NULL,
  `Rating` tinyint(2) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Voted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-27 13:46:32
