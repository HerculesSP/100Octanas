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
-- Temporary view structure for view `vw_usuarios`
--

DROP TABLE IF EXISTS `vw_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuarios` AS SELECT 
 1 AS `idUsuario`,
 1 AS `nomeCompleto`,
 1 AS `Sonome`,
 1 AS `icon`,
 1 AS `acessos`,
 1 AS `cargo`,
 1 AS `inscricao`,
 1 AS `ultimo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_materias`
--

DROP TABLE IF EXISTS `vw_materias`;
/*!50001 DROP VIEW IF EXISTS `vw_materias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_materias` AS SELECT 
 1 AS `id`,
 1 AS `titulo`,
 1 AS `link`,
 1 AS `capa`,
 1 AS `data`,
 1 AS `acessos`,
 1 AS `autor`,
 1 AS `categoria1`,
 1 AS `categoria2`,
 1 AS `categoria3`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios` AS select `u`.`idUsuario` AS `idUsuario`,concat(`u`.`nome`,' ',`u`.`sobrenome`) AS `nomeCompleto`,`u`.`nome` AS `Sonome`,`ui`.`foto` AS `icon`,count(`mu`.`fkUsuario`) AS `acessos`,`c`.`descricao` AS `cargo`,`ui`.`dtInsc` AS `inscricao`,`ui`.`UltimoAcesso` AS `ultimo` from ((((`Materia` `m` left join `Usuario_Materia` `mu` on((`m`.`idMateria` = `mu`.`fkMateria`))) join `Usuario` `u` on((`u`.`idUsuario` = `mu`.`fkUsuario`))) join `InfoUsuario` `ui` on((`ui`.`fkUsuario` = `u`.`idUsuario`))) join `Cargo` `c` on((`c`.`idCargo` = `u`.`fkCargo`))) where ((`ui`.`ativo` = 1) and (`ui`.`banido` is null)) group by `u`.`idUsuario`,`Sonome`,`icon`,`cargo`,`inscricao`,`nomeCompleto`,`ultimo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_materias`
--

/*!50001 DROP VIEW IF EXISTS `vw_materias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_materias` AS select `m`.`idMateria` AS `id`,`m`.`titulo` AS `titulo`,`m`.`link` AS `link`,`m`.`capa` AS `capa`,`m`.`dtPub` AS `data`,count(`mu`.`fkMateria`) AS `acessos`,concat(`u`.`nome`,' ',`u`.`sobrenome`) AS `autor`,`c1`.`Categoria` AS `categoria1`,`c2`.`Categoria` AS `categoria2`,`c3`.`Categoria` AS `categoria3` from (((((`Materia` `m` left join `Usuario_Materia` `mu` on((`m`.`idMateria` = `mu`.`fkMateria`))) join `Usuario` `u` on((`u`.`idUsuario` = `m`.`fkAutor`))) join `Categoria` `c1` on((`m`.`fkCategoria1` = `c1`.`idCategoria`))) join `Categoria` `c2` on((`m`.`fkCategoria2` = `c2`.`idCategoria`))) join `Categoria` `c3` on((`m`.`fkCategoria3` = `c3`.`idCategoria`))) where (`m`.`visivel` = 1) group by `id`,`m`.`titulo`,`m`.`link`,`m`.`capa`,`data`,`u`.`nome`,`categoria1`,`categoria2`,`categoria3` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'cemOctanas'
--

--
-- Dumping routines for database 'cemOctanas'
--
/*!50003 DROP PROCEDURE IF EXISTS `cadastrarUsuarioInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aluno`@`%` PROCEDURE `cadastrarUsuarioInfo`(
    IN p_nome VARCHAR(75),
    IN p_sobrenome VARCHAR(150),
    IN p_email VARCHAR(200),
    IN p_dtNasc DATE,
    IN p_senha VARCHAR(20),
    IN p_imagem VARCHAR(69)
)
BEGIN
    INSERT INTO cemOctanas.Usuario (nome, sobrenome, dtNasc, senha)
    VALUES (p_nome, p_sobrenome, p_dtNasc, p_senha);

    INSERT INTO cemOctanas.InfoUsuario (email, foto, fkUsuario)
    VALUES (p_email, p_imagem, LAST_INSERT_ID());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `popular_usuario_materia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`aluno`@`%` PROCEDURE `popular_usuario_materia`()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 200 DO
    INSERT INTO cemOctanas.Usuario_Materia (fkUsuario, fkMateria, acesso)
    VALUES (
      FLOOR(1 + RAND() * 7),            -- Usuário aleatório entre 1 e 10
      FLOOR(1 + RAND() * 9),            -- Matéria aleatória entre 1 e 14
      NOW() - INTERVAL FLOOR(RAND() * 365) DAY -- Data aleatória nos últimos 12 meses
    );
    SET i = i + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 20:57:04
