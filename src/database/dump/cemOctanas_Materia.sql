-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cemOctanas
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `Materia`
--

DROP TABLE IF EXISTS `Materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materia` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `link` varchar(120) NOT NULL,
  `visivel` tinyint NOT NULL DEFAULT '1',
  `capa` varchar(69) NOT NULL,
  `dtPub` datetime DEFAULT NULL,
  `fkAutor` int NOT NULL,
  `fkCategoria1` int NOT NULL,
  `fkCategoria2` int NOT NULL,
  `fkCategoria3` int NOT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `idx_titulo` (`titulo`),
  KEY `fk_Materia_Autor` (`fkAutor`),
  KEY `fk_Materia_Categoria1` (`fkCategoria1`),
  KEY `fk_Materia_Categoria2` (`fkCategoria2`),
  KEY `fk_Materia_Categoria3` (`fkCategoria3`),
  CONSTRAINT `fk_Materia_Autor` FOREIGN KEY (`fkAutor`) REFERENCES `Usuario` (`idUsuario`),
  CONSTRAINT `fk_Materia_Categoria1` FOREIGN KEY (`fkCategoria1`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `fk_Materia_Categoria2` FOREIGN KEY (`fkCategoria2`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `fk_Materia_Categoria3` FOREIGN KEY (`fkCategoria3`) REFERENCES `Categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
INSERT INTO `Materia` VALUES (1,'Relembre: Toyota Supra que atingiu 400km/h e foi BANIDO da Inglaterra','relembre-toyota-supra-que-atingiu-400kmh-e-foi-banido-da-inglaterra',1,'6c84bae8d5b2c5487e134e1e1ba749bd701a39e5cb1c237c4fc85a03aa9c10d0.jpg','2025-06-12 10:21:25',1,22,20,17),(2,'Ultimate Drift na Automec 2025: Adrenalina e Técnica em Alta Velocidade','ultimate-drift-na-automec-2025-adrenalina-e-tecnica-em-alta-velocidade',1,'7fcccc72f45c2cf9e90f9f29dbf2e9ddd9f8d42769530977600e64e33c40ccd6.jpg','2025-06-12 10:49:21',2,23,19,14);
/*!40000 ALTER TABLE `Materia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 12:01:56
