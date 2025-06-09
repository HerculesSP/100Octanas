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
-- Table structure for table `Materia`
--

DROP TABLE IF EXISTS `Materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materia` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `resumo` varchar(300) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
INSERT INTO `Materia` VALUES (1,'A Revolução da IA','Como a inteligência artificial está transformando indústrias','ia-revolucao',1,'ia.jpg','2025-06-08 13:44:57',2,5,12,18),(2,'Energias Renováveis','O futuro da energia sustentável no Brasil','energia-verde',1,'energia.jpg','2025-06-08 13:44:57',6,3,7,15),(3,'Educação Digital','Novas metodologias de ensino online','educacao-digital',1,'educacao.jpg','2025-06-08 13:44:57',8,9,14,21),(4,'Mercado de Trabalho 2025','As profissões em alta na próxima década','trabalho-2025',1,'trabalho.jpg','2025-06-08 13:44:57',2,2,11,19),(5,'Saúde Mental','Estratégias para combater o estresse moderno','saude-mental',1,'saude.jpg','2025-06-08 13:44:57',6,4,8,17),(6,'Cidades Inteligentes','Tecnologia aplicada ao urbanismo','cidades-inteligentes',1,'cidades.jpg','2025-06-08 13:44:57',8,1,6,13),(7,'Blockchain','A tecnologia por trás das criptomoedas','blockchain-tech',1,'blockchain.jpg','2025-06-08 13:44:57',2,10,16,20),(8,'Agropecuária 4.0','Inovações tecnológicas no campo','agro-40',1,'agro.jpg','2025-06-08 13:44:57',6,5,12,18),(9,'Realidade Virtual','Aplicações práticas em diferentes setores','vr-apps',1,'vr.jpg','2025-06-08 13:44:57',8,7,14,21),(10,'E-commerce','Tendências do comércio eletrônico','ecommerce-trends',1,'ecommerce.jpg','2025-06-08 13:44:57',2,3,9,15),(11,'Segurança Digital','Protegendo dados na era da conexão','seguranca-digital',1,'seguranca.jpg','2025-06-08 13:44:57',6,4,10,19),(12,'Mobilidade Urbana','Novos modelos de transporte nas metrópoles','mobilidade',1,'mobilidade.jpg','2025-06-08 13:44:57',8,2,8,16),(13,'Biomedicina','Avancos no tratamento de doenças crônicas','biomedicina',1,'bio.jpg','2025-06-08 13:44:57',2,6,13,20),(14,'Games','O impacto econômico da indústria de jogos','games-industry',1,'games.jpg','2025-06-08 13:44:57',6,1,5,17);
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

-- Dump completed on 2025-06-08 22:00:08
