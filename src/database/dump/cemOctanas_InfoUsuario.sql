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
  `UltimoAcesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `foto` varchar(69) NOT NULL DEFAULT 'default-icon.png',
  `ativo` tinyint DEFAULT '1',
  `banido` tinyint DEFAULT NULL,
  `verificado` tinyint NOT NULL DEFAULT '0',
  `fkUsuario` int NOT NULL,
  PRIMARY KEY (`idContato`),
  UNIQUE KEY `unique_email` (`email`,`ativo`),
  UNIQUE KEY `unique_bloqueado` (`email`,`ativo`,`banido`),
  KEY `idx_email` (`email`),
  KEY `fk_Contato_Usuario` (`fkUsuario`),
  CONSTRAINT `fk_Contato_Usuario` FOREIGN KEY (`fkUsuario`) REFERENCES `Usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InfoUsuario`
--

LOCK TABLES `InfoUsuario` WRITE;
/*!40000 ALTER TABLE `InfoUsuario` DISABLE KEYS */;
INSERT INTO `InfoUsuario` VALUES (1,'smokey@email.com','2025-03-03 13:21:25','2025-06-12 13:03:38','4192d37c26602a9c608bc7654a9d9a452add1fbd475f2b195b3a54ddf8a0fe7b.jpeg',1,NULL,1,1),(2,'keiichi@email.com','2025-01-12 13:21:25','2025-06-12 13:35:04','010473ba1377cc6f652e51963d07ab0b2cc2d4ef55a2a8660b63f10ddc9b875f.jpg',1,NULL,1,2),(3,'alemao@email.com','2020-02-18 13:21:25','2025-06-12 21:14:08','f501ee88a67e0780f76aacad5bc7fa181e5a6cd91109ccd11f01b2650086db64.jpg',1,NULL,1,3),(4,'ayrton@','2024-12-28 13:21:25','2025-06-12 14:03:29','47b7324894c233a5b8d5760ef9475f522d86dc38fa8060f31670440eb9a938ce.webp',1,NULL,1,4),(5,'ken@email.com','2022-11-10 13:21:25','2025-06-12 14:06:55','85d75f0d82a25f218ed9651b67bf37859933b83348b5f1ff677399acbe720a59.webp',1,NULL,1,5),(6,'anderson@email.com','2023-07-07 13:21:25','2025-06-12 23:32:12','184458f141a3b7c2ffe46fb1dd9445dad341aa574d9e5694b6fcae07583547da.jpg',1,NULL,1,6),(7,'felipe@email.com','2024-10-09 13:21:25','2025-06-12 23:36:58','bffeaacd2a7f893bf5d09b5618abac3008501898e965c3ac07677a4b4950d404.jpg',1,NULL,1,7);
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

-- Dump completed on 2025-06-12 20:57:03
