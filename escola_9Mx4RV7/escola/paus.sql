-- MySQL dump 10.13  Distrib 5.6.25, for Win64 (x86_64)
--
-- Host: localhost    Database: paus
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `pkDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sigla` char(5) NOT NULL,
  PRIMARY KEY (`pkDisciplina`),
  UNIQUE KEY `sigla` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'2017-09-14 20:53:57',NULL,'B1SGB'),(2,'2017-09-14 20:53:57',NULL,'B1TDB'),(3,'2017-11-16 19:59:33',NULL,'A1SO2'),(10,'2017-11-16 20:22:53',NULL,'A1SO1'),(12,'2017-11-16 20:23:56',NULL,'A5LP1'),(26,'2017-11-16 20:29:01',NULL,'b1lp1'),(32,'2017-11-16 20:33:42',NULL,'a1so3'),(33,'2017-11-16 20:35:15',NULL,'b1lp2'),(35,'2017-11-16 20:36:00',NULL,'a1isw'),(36,'2017-11-16 20:44:01',NULL,'cassa'),(40,'2017-11-16 21:01:24',NULL,'A5MGP'),(43,'2017-11-20 12:10:16',NULL,'B1FW1');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_turma`
--

DROP TABLE IF EXISTS `disciplina_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina_turma` (
  `pkDisciplinaTurma` int(11) NOT NULL AUTO_INCREMENT,
  `fkDisciplina` int(11) NOT NULL,
  `fkTurma` int(11) NOT NULL,
  PRIMARY KEY (`pkDisciplinaTurma`),
  UNIQUE KEY `fkTurma_2` (`fkTurma`),
  KEY `fkDisciplina` (`fkDisciplina`),
  KEY `fkTurma` (`fkTurma`),
  CONSTRAINT `disciplina_turma_ibfk_1` FOREIGN KEY (`fkDisciplina`) REFERENCES `disciplina` (`pkDisciplina`),
  CONSTRAINT `disciplina_turma_ibfk_2` FOREIGN KEY (`fkTurma`) REFERENCES `turma` (`pkTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_turma`
--

LOCK TABLES `disciplina_turma` WRITE;
/*!40000 ALTER TABLE `disciplina_turma` DISABLE KEYS */;
INSERT INTO `disciplina_turma` VALUES (1,1,2),(3,10,5),(6,10,7),(7,10,11),(8,1,1);
/*!40000 ALTER TABLE `disciplina_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante` (
  `pkEstudante` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `prontuario` char(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`pkEstudante`),
  UNIQUE KEY `prontuario` (`prontuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES (1,'2017-11-20 22:40:20',NULL,'SP123','Mia'),(3,'2017-11-20 22:42:13',NULL,'SP1265','Cat'),(4,'2017-11-23 15:42:06',NULL,'ghb2345','Maria da Silva');
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante_matricula`
--

DROP TABLE IF EXISTS `estudante_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante_matricula` (
  `pkEstudanteMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `fkEstudante` int(11) NOT NULL,
  `fkMatricula` int(11) NOT NULL,
  PRIMARY KEY (`pkEstudanteMatricula`),
  KEY `fkEstudante` (`fkEstudante`),
  KEY `fkMatricula` (`fkMatricula`),
  CONSTRAINT `estudante_matricula_ibfk_1` FOREIGN KEY (`fkEstudante`) REFERENCES `estudante` (`pkEstudante`),
  CONSTRAINT `estudante_matricula_ibfk_2` FOREIGN KEY (`fkMatricula`) REFERENCES `matricula` (`pkMatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante_matricula`
--

LOCK TABLES `estudante_matricula` WRITE;
/*!40000 ALTER TABLE `estudante_matricula` DISABLE KEYS */;
INSERT INTO `estudante_matricula` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
/*!40000 ALTER TABLE `estudante_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `pkMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`pkMatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,'2017-11-21 16:24:52',NULL,'2017-11-21'),(2,'2017-11-21 16:24:53',NULL,'2017-11-21'),(3,'2017-11-21 16:24:53',NULL,'2017-11-21'),(4,'2017-11-21 16:24:54',NULL,'2017-11-21');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula_turma`
--

DROP TABLE IF EXISTS `matricula_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula_turma` (
  `pkMatriculaTurma` int(11) NOT NULL AUTO_INCREMENT,
  `fkMatricula` int(11) NOT NULL,
  `fkTurma` int(11) NOT NULL,
  PRIMARY KEY (`pkMatriculaTurma`),
  KEY `fkMatricula` (`fkMatricula`),
  KEY `fkTurma` (`fkTurma`),
  CONSTRAINT `matricula_turma_ibfk_1` FOREIGN KEY (`fkMatricula`) REFERENCES `matricula` (`pkMatricula`),
  CONSTRAINT `matricula_turma_ibfk_2` FOREIGN KEY (`fkTurma`) REFERENCES `turma` (`pkTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula_turma`
--

LOCK TABLES `matricula_turma` WRITE;
/*!40000 ALTER TABLE `matricula_turma` DISABLE KEYS */;
INSERT INTO `matricula_turma` VALUES (1,1,1),(2,2,2),(3,3,7),(4,4,5);
/*!40000 ALTER TABLE `matricula_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `pkTurma` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `codigo` char(2) NOT NULL,
  `dia_da_semana` enum('1','2','3','4','5','6','7') NOT NULL,
  PRIMARY KEY (`pkTurma`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'2017-09-14 20:55:08','2017-09-14 20:56:21','AA','2'),(2,'2017-09-14 20:55:08','2017-09-14 20:56:31','BB','3'),(5,'2017-11-20 16:46:03',NULL,'CC','5'),(7,'2017-11-20 18:00:53',NULL,'dd','2'),(11,'2017-11-20 22:11:30',NULL,'ff','7');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'paus'
--
/*!50003 DROP PROCEDURE IF EXISTS `buscar_disciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_disciplina`(param_sigla CHAR(5))
BEGIN
   START TRANSACTION;
    SELECT sigla, created AS criado, modified AS modificado FROM disciplina WHERE sigla = param_sigla;
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_estudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_estudante`(param_prontuario CHAR(10))
BEGIN
   START TRANSACTION;
    SELECT created AS criado, modified AS modificado, prontuario, nome FROM estudante WHERE prontuario = param_prontuario;
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_matricula`(param_prontuario CHAR(10), param_codigo CHAR(2))
BEGIN
   START TRANSACTION;
    SELECT estudante.prontuario, turma.codigo, disciplina.sigla, matricula.data
    FROM estudante 
    LEFT JOIN estudante_matricula ON estudante.pkEstudante = estudante_matricula.fkEstudante
    LEFT JOIN matricula ON estudante_matricula.fkMatricula = matricula.pkMatricula
    LEFT JOIN matricula_turma ON matricula.pkMatricula = matricula_turma.fkMatricula
    LEFT JOIN turma ON matricula_turma.fkTurma = turma.pkTurma
    LEFT JOIN disciplina_turma ON turma.pkTurma = disciplina_turma.fkTurma
    LEFT JOIN disciplina ON disciplina_turma.fkDisciplina = disciplina.pkDisciplina
    WHERE estudante.prontuario = param_prontuario AND turma.codigo = param_codigo;
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_turma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_turma`(param_codigo CHAR(2))
BEGIN
   START TRANSACTION;
    SELECT codigo, created AS criado, modified AS modificado FROM turma WHERE codigo = param_codigo;
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrar_disciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrar_disciplina`(param_sigla CHAR(5))
BEGIN
   START TRANSACTION;
    INSERT INTO disciplina (created, sigla) VALUES (NOW(), param_sigla);
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrar_estudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrar_estudante`(param_prontuario CHAR(10), param_nome VARCHAR(50))
BEGIN
   START TRANSACTION;
    INSERT INTO estudante (prontuario, nome) VALUES (param_prontuario, param_nome);
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar_turma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_turma`(param_sigla CHAR(5), param_codigo CHAR(2), param_dia ENUM('1','2','3','4','5','6','7'))
BEGIN
   START TRANSACTION;
    INSERT INTO turma (codigo, dia_da_semana) VALUES (param_codigo, param_dia);
    INSERT INTO disciplina_turma (fkDisciplina, fkTurma)
    SELECT pkDisciplina, LAST_INSERT_ID() FROM disciplina WHERE sigla = param_sigla;
   COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_estudantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_estudantes`(param_nome varchar(50))
BEGIN
    SELECT prontuario, nome FROM estudante WHERE nome LIKE CONCAT('%',param_nome,'%');
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_matriculas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_matriculas`(param_codigo char(2))
BEGIN
    SELECT estudante.prontuario, matricula.data, turma.codigo, disciplina.sigla FROM turma
    LEFT JOIN matricula_turma ON turma.pkTurma = matricula_turma.fkTurma
    LEFT JOIN estudante_matricula ON estudante_matricula.fkMatricula = matricula_turma.fkMatricula
    LEFT JOIN matricula ON estudante_matricula.fkMatricula = matricula.pkMatricula
    LEFT JOIN disciplina_turma ON turma.pkTurma = disciplina_turma.fkTurma
    LEFT JOIN estudante ON estudante_matricula.fkEstudante = estudante.pkEstudante
    LEFT JOIN disciplina ON disciplina_turma.fkDisciplina = disciplina.pkDisciplina
    WHERE turma.codigo LIKE CONCAT('%',param_codigo,'%');
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_turmas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_turmas`(param_sigla char(5))
BEGIN
    SELECT disciplina.sigla, turma.codigo, turma.dia_da_semana FROM disciplina
	RIGHT JOIN disciplina_turma ON disciplina.pkDisciplina = disciplina_turma.fkDisciplina
	RIGHT JOIN turma ON disciplina_turma.fkTurma = turma.pkTurma
	WHERE disciplina.sigla LIKE CONCAT('%',param_sigla,'%');
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

-- Dump completed on 2017-11-23 18:54:28
