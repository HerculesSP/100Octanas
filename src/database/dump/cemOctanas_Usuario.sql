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
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(75) NOT NULL,
  `sobrenome` varchar(150) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `dtNasc` date NOT NULL,
  `fkCargo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  KEY `idx_nome` (`nome`),
  KEY `fk_Usuario_Cargo` (`fkCargo`),
  CONSTRAINT `fk_Usuario_Cargo` FOREIGN KEY (`fkCargo`) REFERENCES `Cargo` (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'João','Silva','S3nh@F0rt3','1998-05-12',1),(2,'Maria','Santos','M@r1@2025','1985-11-23',2),(3,'Carlos','Oliveira','C@rl0sPWD','2001-02-28',3),(4,'Ana','Costa','An@Secure1','1972-09-15',1),(5,'Pedro','Rocha','R0ch@1234','1995-07-04',1),(6,'Fernanda','Lima','F3rn@Nd@','1988-12-01',2),(7,'Ricardo','Almeida','R1c@rd0!','2005-03-19',1),(8,'Hércules','da Silva Pereira','Teste1234!','1999-08-30',3),(9,'Lucas','Carvalho','Luk@$2025','1965-04-22',1),(10,'Amanda','Pereira','@mAnd@2025','2003-10-17',1),(11,'Hércules','da Silva Pereira','Teste1234!','2006-11-29',1);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 22:00:08
