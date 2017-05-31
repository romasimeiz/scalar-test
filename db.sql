-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: employees
-- ------------------------------------------------------
-- Server version 10.1.22-MariaDB

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
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'programmer'),(2,'ingeneer'),(3,'cleaner'),(4,'HR'),(5,'QA'),(6,'driver'),(7,'cook'),(8,'reception');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'IT'),(2,'Drivers'),(3,'Managers'),(4,'Service'),(5,'Alhorythmic'),(6,'Recruters');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT '0',
  `position_id` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `type` enum('hourly','rate') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'hourly',
  `salary` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employee_department` (`department_id`),
  KEY `FK_employee_position` (`position_id`),
  CONSTRAINT `FK_employee_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,2,2,'John Doe','1985-05-10','rate','5000'),(2,5,7,'Vasily Soloview','1975-09-27','hourly','25'),(3,6,2,'Andrey Babayev','1990-06-03','hourly','150'),(4,2,7,'Igor Ivanov','1993-12-22','hourly','75'),(5,3,4,'Alex Pertrov','1990-09-27','rate','6000'),(6,5,2,'Yuri Spasokukotsky','1985-04-16','rate','5500'),(7,6,1,'Alla Vohmyanova','1987-09-27','hourly','15'),(8,NULL,NULL,'Irina Perova','1973-05-20','hourly','3500'),(9,NULL,NULL,'Vasily Kamenev','1975-09-27','hourly','30'),(52,NULL,NULL,'Inna Sidorova','1987-09-27','hourly','45'),(53,NULL,NULL,'Anatoly Svirtsinsky','1985-04-16','rate','3800'),(54,NULL,NULL,'Eugene Smolensky','1975-09-27','hourly','25'),(55,NULL,NULL,'Ivan Zolochevsky','1990-06-03','hourly','145'),(56,NULL,NULL,'Alex Litvinov','1990-06-03','hourly','235'),(57,NULL,NULL,'Ivan Bodrov','1985-05-10','rate','8500'),(58,NULL,NULL,'Roman Myronchuk','1985-05-10','rate','5000'),(59,NULL,NULL,'Petro Masalv','1975-09-27','hourly','25'),(60,NULL,NULL,'Leonid Alekseev','1990-06-03','hourly','150'),(61,NULL,NULL,'Maksim Molodov','1993-12-22','hourly','75'),(62,NULL,NULL,'Vladimir Kovalenko','1990-09-27','rate','6000'),(63,NULL,NULL,'Nikolay Svyatenko','1985-04-16','rate','5500'),(64,NULL,NULL,'Lisa Clayton','1987-09-27','hourly','15'),(65,NULL,NULL,'Todd   Logan','1973-05-20','hourly','3500'),(66,NULL,NULL,'Essie  Hanson','1975-09-27','hourly','30'),(67,NULL,NULL,'Edward Woods','1987-09-27','hourly','45'),(68,NULL,NULL,'Hubert Newman','1985-04-16','rate','3800'),(69,NULL,NULL,'Lora  Bridges','1975-09-27','hourly','25'),(70,NULL,NULL,'Julie Murray','1990-06-03','hourly','145'),(71,NULL,NULL,'Frederick Rose','1990-06-03','hourly','235'),(72,NULL,NULL,'Miriam Diaz','1985-05-10','rate','8500'),(103,NULL,NULL,'Debra Reese','1985-05-10','rate','5000'),(104,NULL,NULL,'Mathew    Ruiz','1975-09-27','hourly','25'),(105,NULL,NULL,'Van   Mathis','1990-06-03','hourly','150'),(106,NULL,NULL,'Kayla Kim','1993-12-22','hourly','75'),(107,NULL,NULL,'Vladimir Kovalenko','1990-09-27','rate','6000'),(108,NULL,NULL,'Alton Becker','1985-04-16','rate','5500'),(109,NULL,NULL,'Donald    Love','1987-09-27','hourly','15'),(110,NULL,NULL,'Leslie    Jones','1973-05-20','hourly','3500'),(111,NULL,NULL,'Essie  Hanson','1975-09-27','hourly','30'),(112,NULL,NULL,'Brett    Goodman','1987-09-27','hourly','45'),(113,NULL,NULL,'Leona    Phelps','1985-04-16','rate','3800'),(114,NULL,NULL,'Lora  Bridges','1975-09-27','hourly','25'),(115,NULL,NULL,'Julie Murray','1990-06-03','hourly','145'),(116,NULL,NULL,'Frederick  Warner','1990-06-03','hourly','235'),(117,NULL,NULL,'Miriam Jones','1985-05-10','rate','8500');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-01  1:37:21
