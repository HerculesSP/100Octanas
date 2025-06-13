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
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `idx_categoria` (`Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (70,'24 Horas de Le Mans'),(27,'Alfa Romeo'),(86,'Amageddon'),(87,'Arrancada'),(28,'Aston Martin'),(8,'Audi'),(76,'Automático'),(46,'Bentley'),(68,'Blancpain GT Series'),(9,'BMW'),(48,'Bugatti'),(34,'Buick'),(33,'Cadillac'),(26,'Chevrolet'),(72,'Chevrolet'),(42,'Chrysler'),(40,'Citroën'),(16,'Clássicos'),(66,'Copa Truck'),(22,'Corridas de Rua'),(83,'Coupê'),(62,'Cupra'),(64,'Dakar Rally'),(36,'Dodge'),(23,'Drift'),(60,'DS Automobiles'),(67,'DTM'),(18,'Elétricos'),(19,'Eventos'),(11,'Ferrari'),(41,'Fiat'),(71,'Ford'),(1,'Fórmula 1'),(3,'Fórmula E'),(35,'GMC'),(53,'Great Wall Motor'),(54,'Haval'),(74,'Honda'),(81,'Hot Hatch'),(63,'IndyCar'),(32,'Infiniti'),(31,'Jaguar'),(20,'JDM'),(37,'Jeep'),(47,'Lamborghini'),(13,'Lançamentos'),(25,'Lexus'),(30,'Lotus'),(59,'Mahindra'),(75,'Manual'),(29,'McLaren'),(14,'Mercado'),(21,'Mercado de usados'),(10,'Mercedes-Benz'),(52,'Mitsubishi'),(5,'MotoGP'),(80,'Muscle Car'),(84,'Mustang'),(7,'NASCAR'),(51,'Nissan'),(85,'Nurburgring'),(43,'Opel'),(56,'ORA'),(39,'Peugeot'),(49,'Polestar'),(12,'Porsche'),(4,'Rali'),(65,'Rally dos Sertões'),(38,'Ram'),(50,'Renault'),(45,'Seat'),(82,'Sedan'),(44,'Skoda'),(6,'Stock Car'),(57,'Tank'),(58,'Tata'),(17,'Tecnologia'),(24,'Tesla'),(15,'Testes'),(73,'Toyota'),(79,'V12'),(77,'V6'),(78,'V8'),(61,'Vauxhall'),(69,'WeatherTech SportsCar Championship'),(2,'WEC'),(55,'WEY');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 20:57:02
