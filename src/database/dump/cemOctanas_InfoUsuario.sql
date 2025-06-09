CREATE DATABASE  IF NOT EXISTS `cemOctanas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cemOctanas`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cemOctanas
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1

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
-- Table structure for table `InfoUsuario`
--

DROP TABLE IF EXISTS `InfoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InfoUsuario` (
  `idContato` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `dtInsc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `foto` varchar(69) NOT NULL DEFAULT 'default-icon.png',
  `ativo` tinyint DEFAULT '1',
  `banido` tinyint DEFAULT NULL,
  `verificado` tinyint NOT NULL DEFAULT '0',
  `fkUsuario` int NOT NULL,
  `UltimoAcesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idContato`),
  UNIQUE KEY `unique_email` (`email`,`ativo`),
  UNIQUE KEY `unique_bloqueado` (`email`,`ativo`,`banido`),
  KEY `idx_email` (`email`),
  KEY `fk_Contato_Usuario` (`fkUsuario`),
  CONSTRAINT `fk_Contato_Usuario` FOREIGN KEY (`fkUsuario`) REFERENCES `Usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfoUsuario`
--

LOCK TABLES `InfoUsuario` WRITE;
/*!40000 ALTER TABLE `InfoUsuario` DISABLE KEYS */;
INSERT INTO `InfoUsuario` VALUES (1,'jSilva1@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,1,'2025-06-08 23:33:21'),(2,'mSantos2@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,1,2,'2025-06-08 23:31:47'),(3,'cOliveira3@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,1,3,'2025-06-08 23:31:47'),(4,'aCosta4@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,4,'2025-06-08 23:31:47'),(5,'pRocha5@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,5,'2025-06-08 23:31:47'),(6,'fLima6@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,1,6,'2025-06-08 23:31:47'),(7,'rAlmeida7@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,7,'2025-06-08 23:31:47'),(8,'hda Silva Pereira8@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,1,8,'2025-06-08 23:31:47'),(9,'lCarvalho9@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,9,'2025-06-08 23:31:47'),(10,'aPereira10@cemoctanas.com','2025-06-08 03:00:00','default-icon.png',1,NULL,0,10,'2025-06-08 23:31:47'),(16,'herculespereira99@gmail.com','2025-06-08 03:00:00','ef4b06a36f27b53d36c294688796f78578f948b53565c6eec9bbd9fe7fe872c2.png',1,NULL,1,11,'2025-06-09 00:17:43');
/*!40000 ALTER TABLE `InfoUsuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 22:00:07
