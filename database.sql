-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: toko_bangunan_222060
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `admin_222060`
--

DROP TABLE IF EXISTS `admin_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `username_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_222060`),
  UNIQUE KEY `username` (`username_222060`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_222060`
--

LOCK TABLES `admin_222060` WRITE;
/*!40000 ALTER TABLE `admin_222060` DISABLE KEYS */;
INSERT INTO `admin_222060` VALUES (5,'admin','aa@gmail.com','$2y$10$CIvMUcqUOvAWuVfH82Jp7uiMb9QN5b0hP.FhH8AEgmFyvAEZ8b1q6'),(6,'admin1','bb@gmail.com','$2y$10$n28eRVoQ21nwNTHRVc2VdOTubxgWTjSRNpa4be4AyzEzHbj7iZF7G');
/*!40000 ALTER TABLE `admin_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_222060`
--

DROP TABLE IF EXISTS `cart_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `user_id_222060` int NOT NULL,
  `product_name_222060` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity_222060` int NOT NULL,
  `price_222060` decimal(10,2) NOT NULL,
  `total_price_222060` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_222060`),
  KEY `fk_user_id` (`user_id_222060`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id_222060`) REFERENCES `user_222060` (`id_222060`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_222060`
--

LOCK TABLES `cart_222060` WRITE;
/*!40000 ALTER TABLE `cart_222060` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_222060`
--

DROP TABLE IF EXISTS `order_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `user_id_222060` int DEFAULT NULL,
  `username_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_name_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity_222060` int DEFAULT NULL,
  `price_222060` decimal(10,2) DEFAULT NULL,
  `total_price_222060` decimal(10,2) DEFAULT NULL,
  `order_status_222060` enum('pending','processed','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method_222060` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_222060` text COLLATE utf8mb4_general_ci NOT NULL,
  `order_date_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_222060`),
  KEY `order_222060_ibfk_1` (`user_id_222060`),
  CONSTRAINT `order_222060_ibfk_1` FOREIGN KEY (`user_id_222060`) REFERENCES `user_222060` (`id_222060`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_222060`
--

LOCK TABLES `order_222060` WRITE;
/*!40000 ALTER TABLE `order_222060` DISABLE KEYS */;
INSERT INTO `order_222060` VALUES (159,5,'afat','Batako',10,1000.00,10000.00,'completed','Transfer Bank - BRI','Kolaka','2025-04-30 03:47:50'),(165,5,'afat','ARTCO Gerobak Sorong',1,300000.00,300000.00,'cancelled','COD','Lasusua','2025-05-01 05:07:58'),(166,5,'afat','Batako',200,1000.00,200000.00,'completed','Transfer Bank - BRI','Kolaka','2025-05-06 19:53:55'),(167,5,'afat','Batako',210,1000.00,210000.00,'pending','COD','a','2026-11-05 08:14:42');
/*!40000 ALTER TABLE `order_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_report_222060`
--

DROP TABLE IF EXISTS `order_report_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_report_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `order_id_222060` int DEFAULT NULL,
  `customer_name_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity_222060` int DEFAULT NULL,
  `price_222060` decimal(10,2) DEFAULT NULL,
  `status_222060` enum('pending','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `completion_date_222060` date DEFAULT NULL,
  `notes_222060` text COLLATE utf8mb4_general_ci,
  `created_at_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_222060`),
  KEY `order_report_222060_ibfk_1` (`order_id_222060`),
  CONSTRAINT `order_report_222060_ibfk_1` FOREIGN KEY (`order_id_222060`) REFERENCES `order_222060` (`id_222060`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_report_222060`
--

LOCK TABLES `order_report_222060` WRITE;
/*!40000 ALTER TABLE `order_report_222060` DISABLE KEYS */;
INSERT INTO `order_report_222060` VALUES (33,159,'afat','Batako',10,10000.00,'completed','2025-04-30','Pesanan Selesai','2025-04-30 10:07:53','2025-04-30 10:07:53'),(37,165,'afat','ARTCO Gerobak Sorong',1,300000.00,'cancelled','2025-05-01','Dibatalkan','2025-05-01 11:17:09','2025-05-01 11:17:09'),(38,166,'afat','Batako',200,200000.00,'completed','2025-05-25','Pesanan Selesai','2025-05-25 07:49:21','2025-05-25 07:49:21');
/*!40000 ALTER TABLE `order_report_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_222060`
--

DROP TABLE IF EXISTS `payment_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `user_id_222060` int NOT NULL,
  `username_222060` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_name_222060` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity_222060` int NOT NULL,
  `price_222060` decimal(10,2) NOT NULL,
  `total_price_222060` decimal(10,2) NOT NULL,
  `alamat_222060` text COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method_222060` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `order_status_222060` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_date_222060` datetime NOT NULL,
  `virtual_account_222060` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_proof_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_confirmation_222060` enum('confirmed','not_confirmed','cancelled') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `arrival_confirmation_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_222060`),
  KEY `user_id_222060` (`user_id_222060`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`id_222060`) REFERENCES `order_222060` (`id_222060`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_222060`
--

LOCK TABLES `payment_222060` WRITE;
/*!40000 ALTER TABLE `payment_222060` DISABLE KEYS */;
INSERT INTO `payment_222060` VALUES (159,5,'afat','Batako',10,1000.00,10000.00,'Kolaka','Transfer Bank - BRI','Menunggu Konfirmasi','2025-04-30 11:47:50','BRI-789247935253','payment_proof_159_1746006519.jpg','confirmed','1746007667_paket-jnt-1-860x465.jpg'),(165,5,'afat','ARTCO Gerobak Sorong',1,300000.00,300000.00,'Lasusua','COD','Cancelled','2025-05-01 13:07:58','',NULL,'cancelled',NULL),(166,5,'afat','Batako',200,1000.00,200000.00,'Kolaka','Transfer Bank - BRI','Pembayaran Terkonfirmasi','2025-05-07 03:53:55','BRI-845399291496','payment_proof_166_1748159329.png','confirmed','1748159358_ChatGPT Image May 24, 2025, 02_16_09 AM.png'),(167,5,'afat','Batako',210,1000.00,210000.00,'a','COD','confirmed','2026-11-05 16:14:42','',NULL,'confirmed',NULL);
/*!40000 ALTER TABLE `payment_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_222060`
--

DROP TABLE IF EXISTS `product_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `product_name_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description_222060` text COLLATE utf8mb4_general_ci,
  `product_image_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_222060` decimal(10,2) DEFAULT NULL,
  `created_at_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stock_222060` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_222060`),
  UNIQUE KEY `service_name` (`product_name_222060`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_222060`
--

LOCK TABLES `product_222060` WRITE;
/*!40000 ALTER TABLE `product_222060` DISABLE KEYS */;
INSERT INTO `product_222060` VALUES (5,'Semen Tonasa','Kuat dan Tahan Lama','67cfbf4f1210d.png',200000.00,'2025-03-11 04:42:55',0),(6,'ARTCO Gerobak Sorong','Kuat Menahan Beban yang Berat','67cfbf84206f0.png',300000.00,'2025-03-11 04:43:48',1),(7,'Batako','Kuat','67cfbf94666f0.png',1000.00,'2025-03-11 04:44:04',4590);
/*!40000 ALTER TABLE `product_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admin_222060`
--

DROP TABLE IF EXISTS `super_admin_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_admin_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `username_222060` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email_222060` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password_222060` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at_222060` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_222060`),
  UNIQUE KEY `email_222060` (`email_222060`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin_222060`
--

LOCK TABLES `super_admin_222060` WRITE;
/*!40000 ALTER TABLE `super_admin_222060` DISABLE KEYS */;
INSERT INTO `super_admin_222060` VALUES (4,'superadmin','superadmin@example.com','$2y$10$1ztXmHl0oYtiFmaCpAYnF.9ADe.DJT5iUG1bW41mgkohJDDYIH.CK','2025-03-11 05:44:37','2025-03-11 05:46:46');
/*!40000 ALTER TABLE `super_admin_222060` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_222060`
--

DROP TABLE IF EXISTS `user_222060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_222060` (
  `id_222060` int NOT NULL AUTO_INCREMENT,
  `username_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_222060` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password_222060` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_222060` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at_222060` datetime DEFAULT NULL,
  PRIMARY KEY (`id_222060`),
  UNIQUE KEY `username` (`username_222060`),
  UNIQUE KEY `email` (`email_222060`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_222060`
--

LOCK TABLES `user_222060` WRITE;
/*!40000 ALTER TABLE `user_222060` DISABLE KEYS */;
INSERT INTO `user_222060` VALUES (5,'afat','aa@gmail.com','$2y$10$hoed.ApyRD1NgZWQ.R089.lnNlTSevhyz1mXweHhKq1NNwfpNfH8S','customer','2025-03-10 16:25:49'),(6,'tri','bb@gmail.com','$2y$10$4dFEGLAHILxbVnQDyHZXwuPM9jQqorGm4dFrG95s/llT5eKvMWI7q','customer','2025-03-10 16:29:44');
/*!40000 ALTER TABLE `user_222060` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-06  0:18:54
