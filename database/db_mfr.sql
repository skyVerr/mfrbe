-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_trace
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`),
  KEY `user_id` (`user_id`),
  KEY `contacts_ibfk_2` (`friend_id`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contacts_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_type`
--

DROP TABLE IF EXISTS `notification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_type` (
  `notification_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`notification_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_type`
--

LOCK TABLES `notification_type` WRITE;
/*!40000 ALTER TABLE `notification_type` DISABLE KEYS */;
INSERT INTO `notification_type` VALUES (1,'Contact Notification'),(2,'Trace Request'),(3,'Group Notification');
/*!40000 ALTER TABLE `notification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_group`
--

DROP TABLE IF EXISTS `trace_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_group`
--

LOCK TABLES `trace_group` WRITE;
/*!40000 ALTER TABLE `trace_group` DISABLE KEYS */;
INSERT INTO `trace_group` VALUES (3,'sample group','2018-12-02 06:45:20'),(4,'group2','2018-12-02 06:50:08');
/*!40000 ALTER TABLE `trace_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isPremium` tinyint(4) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `profile_picture` varchar(255) NOT NULL DEFAULT 'http://localhost:8080/images/default.png',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'f','f','$2b$10$7VPZInatXRuYTNyf7XH8Vuh865qqKJw6/6Y2Jzgomrysc2esmQeFW',0,'2018-12-05 19:54:02','f','http://localhost:8080/images/default.png'),(23,'g','g','$2b$10$a5SBq8Ppu5sdWc7go1GeV.TmNuJ6W1Lt3IMAO06MS7aVmwj3.Bmfi',0,'2018-12-05 19:54:29','g','http://localhost:8080/images/nonn1b4jpblcpy2.jpg'),(33,'sjdjx','shdhx','$2b$10$L0KpqftctsDhONw3kfwxe.gnPmEBh2NdiyegmDp8dfoBlx8Ciwt.2',0,'2018-12-22 18:14:18','hshsjd@sdf.com','http://localhost:8080/images/default.png'),(34,'sjdjx','shdhx','$2b$10$lNgcq5i5UNUtOBZHAn8QteQr31v3kRgBcU7ui0wHNZoq/HA3by50a',0,'2018-12-22 18:14:46','hshsjd@sdf.com','http://localhost:8080/images/default.png'),(35,'sjdjxggggg','shdhx','$2b$10$UOu9BFJdz98jPQfbtg8xHutig8hFLDEqEDeStotkV7LRVFW/kVMdm',0,'2018-12-22 18:15:01','hshsjd@sdf.com','http://localhost:8080/images/default.png'),(36,'djd','hdjfjd','$2b$10$6VrW1Mz8O.8vqab.5sIgdOo6Y2xWDQYpnb.8g9Ld7jJphoBSxGb26',0,'2018-12-23 11:58:47','vert@df.com','http://localhost:8080/images/default.png'),(37,'hfjdjf','hxjjdc','$2b$10$bYAaCzuc2zqtt3QgIs8.0O9nE73iLsW2.0ZYCWhRriHxLLzFbzMrW',0,'2018-12-23 12:01:23','hdhdj@djd.com','http://localhost:8080/images/default.png'),(38,'df','ff','$2b$10$BIe/oPimWOx/IEwRocS0yuLqUC7Dy5MbOdkUEsCfy/6zq06NByZ5y',0,'2018-12-23 12:08:15','bshsus@jsjd.com','http://localhost:8080/images/default.png'),(39,'dudhd','hdhshd','$2b$10$C5yC7aoxu8kMBddrqv8oUeWWsma21npNIbPJG76QxhmpdhOiS09qi',0,'2018-12-23 12:11:13','hdjsjwg@hshdjf.com','http://localhost:8080/images/default.png'),(40,'fhh','gfff','$2b$10$uJKS/Lmkx5ozbrAuTrTcBu4CdhV2Jg1/qQFWBYgof6pCwlj/FgU/e',0,'2018-12-23 12:14:07','fhjgg@gff.com','http://localhost:8080/images/default.png'),(41,'jvv','hhc','$2b$10$jqE.bXUaKX7.7wFtUQ7uwud5gI0/Y0STLeuVWXpy.jYg6YAUhWrE2',0,'2018-12-23 12:18:48','ffdf@ffgg.com','http://localhost:8080/images/default.png'),(42,'bdhd','dhdhd','$2b$10$Wn7LXe.gvVKcX3nJfze.1eZ19WkCsNofNW4WikUD2EQ1EINYHppVu',0,'2018-12-23 13:23:48','hsjs@jsjx.com','http://localhost:8080/images/default.png'),(43,'hdhdjx','fhdnd','$2b$10$M748jypZnaiAqOpTEXHu1eklogroJ87tvYgPN.pYz2CE7on05Yq0.',0,'2018-12-23 13:49:59','hxjsjc@hxhd.com','http://localhost:8080/images/default.png'),(44,'ghbcf','ghjbc','$2b$10$eg5nLI//A.XXH07yRbiMxuCwfp3qzmCoFF2A3tuKdMfpNDlNNUl9a',0,'2018-12-23 13:52:32','thhfru@gfdg.com','http://localhost:8080/images/default.png'),(45,'g','g','$2b$10$GLSrHoYQcd7tj5fl.lKxiehcTBruBtcOoluB5XZ8Ejg5BU35Ukw.u',0,'2018-12-23 14:15:57','gsjdh@hgd.com','http://localhost:8080/images/default.png'),(46,'gjbf','chj','$2b$10$8sLmgfV206N/z7vzHD25Je2EMoHsY6LclSI.SU1MZO8gJKL6c0cpC',0,'2018-12-23 14:22:14','fhkh@guj.com','http://localhost:8080/images/default.png'),(47,'firstname','lastname','$2b$10$fS23sBt7lzp.Aa6KZm3eVe80ZVoUJOZ1Cj912tR7YEMSAmYQRGjF.',0,'2018-12-23 14:56:46','fasfd@fasdfds.com','http://localhost:8080/images/default.png'),(48,'hshdj','hdhdh','$2b$10$9MwcUZNkLwPh3uItuSW1wehK6MYiuvpsBCoFiBCPWoKs8fAQ95CSC',0,'2018-12-23 15:28:50','ushsh@hsjx.com','http://localhost:8080/images/default.png'),(49,'hdhsh','bdhshd','$2b$10$Wh6eKGO4jiOVwBAWghtCveUtgwpAknNx3k3/MC3o4bLybknQ6j1Zu',0,'2018-12-23 15:36:52','gdhsj@hdjd.com','http://localhost:8080/images/default.png'),(50,'hhv','hvg','$2b$10$q5FcQGgfqv126P1NFKdCmObj18CeTYzOMM8UF9BmYpF6/u80ZPN.m',0,'2018-12-23 15:52:03','gyg@ggc.com','http://localhost:8080/images/default.png'),(51,'fvh','fhjgd','$2b$10$Q5S/qyp3v03J628jbGazkOZGh5jhHO6w3yXXfT2eQ/VGEX8GcQioi',0,'2018-12-23 15:53:48','gfdg@gdf.com','http://localhost:8080/images/default.png'),(52,'ushs','hxhdh','$2b$10$9F7/Kvy0pyRI1lP6BGeawOdQ6HESebylK0Im9XEWSstOX.8t3Ndju',0,'2018-12-23 15:57:08','hsjd@hsjd.com','http://localhost:8080/images/default.png'),(53,'hxhd','bdjd','$2b$10$hDV71z2Pf.92fVkSHd9nKe.5yuzrdU2DOY1almsmOKroh2tjxVpEG',0,'2018-12-23 15:58:31','hxbdh@isjdm.com','http://localhost:8080/images/default.png'),(54,'hshd','hsjd','$2b$10$A.OAdyv466Q3diEgIfE01uOcdelrZg642SI8fFcyuWUWB6eihdhgK',0,'2018-12-23 16:15:25','hshf@hsjf.com','http://localhost:8080/images/default.png'),(55,'cgh','fgg','$2b$10$t0WaLPJQWi8UMlnuu.btT.9XYfYVshNDpU4xoDyuP2PXAknF4e3w6',0,'2018-12-23 16:32:09','tgfx@ffh.com','http://localhost:8080/images/default.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `isAdmin` int(11) NOT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `trace_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification` (
  `user_notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `isSeen` tinyint(4) NOT NULL DEFAULT '0',
  `from_user_id` int(11) NOT NULL,
  `isConfirm` tinyint(4) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_notification_id`),
  KEY `user_id` (`user_id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `user_notification_ibfk_1` (`notification_type_id`),
  CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_type` (`notification_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_notification_ibfk_3` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

LOCK TABLES `user_notification` WRITE;
/*!40000 ALTER TABLE `user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27 21:20:46