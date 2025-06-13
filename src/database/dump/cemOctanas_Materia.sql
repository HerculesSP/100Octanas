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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
INSERT INTO `Materia` VALUES (1,'Relembre: Toyota Supra que atingiu 400km/h e foi BANIDO da Inglaterra','relembre-toyota-supra-que-atingiu-400kmh-e-foi-banido-da-inglaterra',1,'6c84bae8d5b2c5487e134e1e1ba749bd701a39e5cb1c237c4fc85a03aa9c10d0.jpg','2025-06-11 10:21:25',1,22,20,17),(2,'Ultimate Drift na Automec 2025: Adrenalina e Técnica em Alta Velocidade','ultimate-drift-na-automec-2025-adrenalina-e-tecnica-em-alta-velocidade',1,'7fcccc72f45c2cf9e90f9f29dbf2e9ddd9f8d42769530977600e64e33c40ccd6.jpg','2025-06-10 10:21:25',2,23,19,14),(3,'Edição Limitada do Mustang Manual Vende R$ 120 Milhões em Apenas Uma Hora no Brasil','edicao-limitada-do-mustang-manual-vende-r-120-milhoes-em-apenas-uma-hora-no-brasil',1,'133e620867baea520df1f39e887a274577ca2ee661ddd8be7d67de3dd22b49f6.jpg','2025-06-09 10:21:25',3,84,75,71),(4,'GP do Japão de Fórmula 1 2025: Verstappen Vence em Corrida Marcada por Polêmicas e Estratégias','gp-do-japao-de-formula-1-2025-verstappen-vence-em-corrida-marcada-por-polemicas-e-estrategias',1,'7e78cdef54bbde60fbe0660284cc502e5a8dc4a21b3659c06e4faeb6f8f9ac4b.jpg','2025-06-08 10:21:25',3,1,29,10),(5,'Acidente do Audi RS6 na Autobahn: O Impacto, a História e os Mitos por Trás do Caso','acidente-do-audi-rs6-na-autobahn-o-impacto-a-historia-e-os-mitos-por-tras-do-caso',1,'0a326420da9732d0ae1410bd74746b89e934df671849f5b5521e1a69305dd0e8.jpg','2025-06-07 10:21:25',3,8,22,78),(6,'Novo Ford Mustang GTD Quebra Recorde no Nürburgring com Volta de 6:52','novo-ford-mustang-gtd-quebra-recorde-no-nurburgring-com-volta-de-652',1,'aaa1d65225885dc85bec038daa1196982ec53afb8760608187e00c1653c6de69.jpg','2025-06-06 10:21:25',3,84,85,71),(7,'Audi Anuncia Mudança na Nomenclatura dos Modelos RS: RS6 Passa a Ser RS7 e Outras Reformulações','audi-anuncia-mudanca-na-nomenclatura-dos-modelos-rs-rs6-passa-a-ser-rs7-e-outras-reformulacoes',1,'ac732baf447ac197d39aa5e794fd1f4bf64c5b1f64eb1d0adb7f46b74c51bea6.jpg','2025-06-05 10:21:25',3,8,78,76),(8,'Gabriel Bortoleto: A Promessa Brasileira que Brilha na Fórmula 1 em 2025','gabriel-bortoleto-a-promessa-brasileira-que-brilha-na-formula-1-em-2025',1,'37bb2258c08fafc2c4b067ab8e7a9e2972f9ef93b3c3636a34c9b37cfdc86e40.jpg','2025-06-04 10:21:25',3,1,77,76),(9,'Armageddon: A Prova de Arrancada que Agita os Fãs de Velocidade no Brasil','armageddon-a-prova-de-arrancada-que-agita-os-fas-de-velocidade-no-brasil',1,'1176703b8267ea1b0e02206a2d027234b31f1c750585143a1522bd4c5d305a0e.webp','2025-06-03 10:21:25',3,86,87,26);
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

-- Dump completed on 2025-06-12 20:57:02
