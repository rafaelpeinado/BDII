-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dbEscola
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reldocentedisciplina`
--

DROP TABLE IF EXISTS `reldocentedisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reldocentedisciplina` (
  `pkDocenteDiscipilna` int(11) NOT NULL AUTO_INCREMENT,
  `fkDocente` int(11) NOT NULL,
  `fkDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`pkDocenteDiscipilna`),
  UNIQUE KEY `fkDisciplina` (`fkDisciplina`,`fkDocente`),
  KEY `fkDocente` (`fkDocente`),
  CONSTRAINT `reldocentedisciplina_ibfk_1` FOREIGN KEY (`fkDisciplina`) REFERENCES `tbldisciplina` (`pkdisciplina`),
  CONSTRAINT `reldocentedisciplina_ibfk_2` FOREIGN KEY (`fkDocente`) REFERENCES `tbldocente` (`pkdocente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reldocentedisciplina`
--

LOCK TABLES `reldocentedisciplina` WRITE;
/*!40000 ALTER TABLE `reldocentedisciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `reldocentedisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relestudanteturma`
--

DROP TABLE IF EXISTS `relestudanteturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `relestudanteturma` (
  `pkEstudanteTurma` int(11) NOT NULL AUTO_INCREMENT,
  `fkEstudante` int(11) NOT NULL,
  `fkTurma` int(11) NOT NULL,
  PRIMARY KEY (`pkEstudanteTurma`),
  UNIQUE KEY `fkEstudante` (`fkEstudante`,`fkTurma`),
  KEY `fkTurma` (`fkTurma`),
  CONSTRAINT `relestudanteturma_ibfk_1` FOREIGN KEY (`fkEstudante`) REFERENCES `tblestudante` (`pkestudante`),
  CONSTRAINT `relestudanteturma_ibfk_2` FOREIGN KEY (`fkTurma`) REFERENCES `tblturma` (`pkturma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relestudanteturma`
--

LOCK TABLES `relestudanteturma` WRITE;
/*!40000 ALTER TABLE `relestudanteturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `relestudanteturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relturmadisciplina`
--

DROP TABLE IF EXISTS `relturmadisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `relturmadisciplina` (
  `pkTurmaDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `upkTurmaDisciplina` binary(16) NOT NULL,
  `fkTurma` int(11) NOT NULL,
  `fkDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`pkTurmaDisciplina`),
  UNIQUE KEY `fkTurma` (`fkTurma`),
  KEY `fkDisciplina` (`fkDisciplina`),
  CONSTRAINT `relturmadisciplina_ibfk_1` FOREIGN KEY (`fkTurma`) REFERENCES `tblturma` (`pkturma`),
  CONSTRAINT `relturmadisciplina_ibfk_2` FOREIGN KEY (`fkDisciplina`) REFERENCES `tbldisciplina` (`pkdisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relturmadisciplina`
--

LOCK TABLES `relturmadisciplina` WRITE;
/*!40000 ALTER TABLE `relturmadisciplina` DISABLE KEYS */;
INSERT INTO `relturmadisciplina` VALUES (1,_binary 'ú.óm=\Èó\Õ\n\0\'\0\0',1,1),(2,_binary ' Wjm=\Èó\Õ\n\0\'\0\0',2,2),(3,_binary '#H˝ëm=\Èó\Õ\n\0\'\0\0',3,3),(4,_binary 'G™ä\Zm=\Èó\Õ\n\0\'\0\0',4,1),(5,_binary 'J\0em=\Èó\Õ\n\0\'\0\0',5,1),(6,_binary 'M?\ Nm=\Èó\Õ\n\0\'\0\0',6,2),(7,_binary 'PF\‚\—m=\Èó\Õ\n\0\'\0\0',7,2),(8,_binary 'SFøum=\Èó\Õ\n\0\'\0\0',8,3),(9,_binary 'Uµxçm=\Èó\Õ\n\0\'\0\0',9,3);
/*!40000 ALTER TABLE `relturmadisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldisciplina`
--

DROP TABLE IF EXISTS `tbldisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbldisciplina` (
  `pkDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `upkDisciplina` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strSigla` char(5) NOT NULL,
  `strNome` varchar(50) NOT NULL,
  PRIMARY KEY (`pkDisciplina`),
  UNIQUE KEY `strSigla` (`strSigla`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldisciplina`
--

LOCK TABLES `tbldisciplina` WRITE;
/*!40000 ALTER TABLE `tbldisciplina` DISABLE KEYS */;
INSERT INTO `tbldisciplina` VALUES (1,_binary '\ı—óèm<\Èó\Õ\n\0\'\0\0','2019-05-02 21:46:57',NULL,'BD2A3','Banco de Dados 2'),(2,_binary '\ı™+m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:47:21',NULL,'SO1A1','Sistemas Operacionais I'),(3,_binary 'am=\Èó\Õ\n\0\'\0\0','2019-05-02 21:47:51',NULL,'ES3A3','Engenharia de Software III');
/*!40000 ALTER TABLE `tbldisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldocente`
--

DROP TABLE IF EXISTS `tbldocente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbldocente` (
  `pkDocente` int(11) NOT NULL AUTO_INCREMENT,
  `upkDocente` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strProntuario` char(7) NOT NULL,
  `strNome` varchar(50) NOT NULL,
  `dtNascimento` date NOT NULL,
  `strEscolaridade` enum('FUNDAMENTAL','MEDIO','TECNOLOGO','BACHARELADO','LICENCIATURA','POSGRADUACAO','MESTRADO','DOUTORADO','LIVREDOCENCIA') DEFAULT NULL,
  PRIMARY KEY (`pkDocente`),
  UNIQUE KEY `strProntuario` (`strProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldocente`
--

LOCK TABLES `tbldocente` WRITE;
/*!40000 ALTER TABLE `tbldocente` DISABLE KEYS */;
INSERT INTO `tbldocente` VALUES (1,_binary '¥Üxm<\Èó\Õ\n\0\'\0\0','2019-05-02 21:45:07',NULL,'4057730','Monica Teixeira','1956-04-12','MESTRADO'),(2,_binary '\»≥m<\Èó\Õ\n\0\'\0\0','2019-05-02 21:45:40',NULL,'8669181','Paula dos Santos','1977-10-04','DOUTORADO'),(3,_binary '\€\Û\ƒm<\Èó\Õ\n\0\'\0\0','2019-05-02 21:46:12',NULL,'6171491','Mario Andrade','1979-05-22','LIVREDOCENCIA');
/*!40000 ALTER TABLE `tbldocente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestudante`
--

DROP TABLE IF EXISTS `tblestudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblestudante` (
  `pkEstudante` int(11) NOT NULL AUTO_INCREMENT,
  `upkEstudante` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strProntuario` char(7) NOT NULL,
  `strNome` varchar(50) NOT NULL,
  `dtNascimento` date NOT NULL,
  PRIMARY KEY (`pkEstudante`),
  UNIQUE KEY `strProntuario` (`strProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestudante`
--

LOCK TABLES `tblestudante` WRITE;
/*!40000 ALTER TABLE `tblestudante` DISABLE KEYS */;
INSERT INTO `tblestudante` VALUES (1,_binary 'qDGym<\Èó\Õ\n\0\'\0\0','2019-05-02 21:43:14',NULL,'5769463','Jo√£o Almeida','1992-02-23'),(2,_binary 'Å\√\≈\"m<\Èó\Õ\n\0\'\0\0','2019-05-02 21:43:42',NULL,'5445538','J√©ssica Alves','2000-01-13'),(3,_binary 'ì\ﬁm<\Èó\Õ\n\0\'\0\0','2019-05-02 21:44:11',NULL,'8447011','Antonio Carlos','1983-03-21');
/*!40000 ALTER TABLE `tblestudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblturma`
--

DROP TABLE IF EXISTS `tblturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblturma` (
  `pkTurma` int(11) NOT NULL AUTO_INCREMENT,
  `upkTurma` binary(16) NOT NULL,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strDia` enum('SEGUNDA','TERCA','QUARTA','QUINTA','SEXTA','SABADO','DOMINGO') DEFAULT NULL,
  `strPeriodo` enum('MATUTINO','VESPERTINO','NOTURNO') DEFAULT NULL,
  PRIMARY KEY (`pkTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblturma`
--

LOCK TABLES `tblturma` WRITE;
/*!40000 ALTER TABLE `tblturma` DISABLE KEYS */;
INSERT INTO `tblturma` VALUES (1,_binary 'õ§m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:48:04',NULL,'SEGUNDA','MATUTINO'),(2,_binary ' V£m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:48:08',NULL,'TERCA','VESPERTINO'),(3,_binary '#H…§m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:48:13',NULL,'QUARTA','NOTURNO'),(4,_binary 'G™rMm=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:14',NULL,'TERCA','MATUTINO'),(5,_binary 'Iˇa\Àm=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:18',NULL,'QUARTA','MATUTINO'),(6,_binary 'M>\∆Ym=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:23',NULL,'QUARTA','VESPERTINO'),(7,_binary 'PEﬂêm=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:29',NULL,'QUINTA','VESPERTINO'),(8,_binary 'SE∫m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:34',NULL,'QUINTA','NOTURNO'),(9,_binary 'U¥u6m=\Èó\Õ\n\0\'\0\0','2019-05-02 21:49:38',NULL,'SEXTA','NOTURNO');
/*!40000 ALTER TABLE `tblturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbEscola'
--
/*!50003 DROP FUNCTION IF EXISTS `fnNovaChave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnNovaChave`() RETURNS binary(16)
    DETERMINISTIC
RETURN UNHEX(REPLACE(UUID(), "-", "")) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prAtualizarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prAtualizarDisciplina`(varSiglaAtual CHAR(7), varSiglaNova CHAR(50), varNome VARCHAR(50))
BEGIN
    START TRANSACTION;
  UPDATE tbldisciplina SET strSigla = varSiglaNova WHERE strSigla = varSiglaAtual AND strNome = varNome;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prAtualizarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prAtualizarDocente`(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "POSGRADUACAO", "MESTRADO", "DOUTORADO", "LIVREDOCENCIA"))
BEGIN
    START TRANSACTION;
  UPDATE tbldocente SET strNome = varNome, dtNascimento = varNascimento, strEscolaridade = varEscolaridade WHERE strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prAtualizarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prAtualizarEstudante`(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
BEGIN
    START TRANSACTION;
  UPDATE tblestudante SET strNome = varNome, dtNascimento = varNascimento WHERE strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarDisciplina`(varSigla CHAR(5), varNome VARCHAR(50))
BEGIN
    START TRANSACTION;
  INSERT INTO tbldisciplina(upkDisciplina, strSigla, strNome) VALUES (fnNovaChave(), varSigla, varNome);
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarDocente`(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "POSGRADUACAO", "MESTRADO", "DOUTORADO", "LIVREDOCENCIA"))
BEGIN
    START TRANSACTION;
  INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento, varEscolaridade);
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarEstudante`(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
BEGIN
    START TRANSACTION;
  INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento);
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prCriarTurma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prCriarTurma`(varSigla CHAR(5), varDia ENUM("SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO", "DOMINGO"), varPeriodo ENUM("MATUTINO", "VESPERTINO", "NOTURNO"))
BEGIN
    START TRANSACTION;
  INSERT INTO tblturma(upkTurma, strDia, strPeriodo) VALUES (fnNovaChave(), varDia, varPeriodo);
  INSERT INTO relTurmaDisciplina(upkTurmaDisciplina, fkTurma, fkDisciplina) SELECT fnNovaChave(), LAST_INSERT_ID(), pkDisciplina FROM tbldisciplina WHERE strSigla = varSigla;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prDeletarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prDeletarDisciplina`(varSigla CHAR(5))
BEGIN
    START TRANSACTION;
  DELETE FROM tbldisciplina WHERE strSigla = varSigla;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prDeletarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prDeletarDocente`(varProntuario CHAR(7))
BEGIN
    START TRANSACTION;
  DELETE FROM tbldocente WHERE strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prDeletarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prDeletarEstudante`(varProntuario CHAR(7))
BEGIN
    START TRANSACTION;
  DELETE FROM tblestudante WHERE strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prLerDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prLerDisciplina`(varSigla CHAR(5))
BEGIN
    START TRANSACTION;
  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strSigla AS sigla, d.strNome AS nome FROM tbldisciplina d WHERE d.strSigla = varSigla;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prLerDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prLerDocente`(varProntuario CHAR(7))
BEGIN
    START TRANSACTION;
  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strProntuario AS prontuario, d.strNome AS nome, d.dtNascimento AS nascimento FROM tbldocente d WHERE d.strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prLerEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prLerEstudante`(varProntuario CHAR(7))
BEGIN
    START TRANSACTION;
  SELECT e.dcCreated AS criado, e.dcModified AS modificado, e.strProntuario AS prontuario, e.strNome AS nome, e.dtNascimento AS nascimento FROM tblestudante e WHERE e.strProntuario = varProntuario;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarDisciplina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarDisciplina`()
BEGIN
    START TRANSACTION;
  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strSigla AS sigla, d.strNome AS nome FROM tbldisciplina d;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarDocente`()
BEGIN
    START TRANSACTION;
  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strProntuario AS prontuario, d.strNome AS nome, d.strEscolaridade AS escolaridade, d.dtNascimento AS nascimento FROM tbldocente d;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarEstudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarEstudante`()
BEGIN
    START TRANSACTION;
  SELECT e.dcCreated AS criado, e.dcModified AS modificado, e.strProntuario AS prontuario, e.strNome AS nome, e.dtNascimento AS nascimento FROM tblestudante e;
COMMIT;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prListarTurma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prListarTurma`(varSigla CHAR(5))
BEGIN
    START TRANSACTION;
  SELECT t.dcCreated AS criado, t.dcModified AS modificado, d.strSigla AS sigla, t.strDia AS dia, t.strPeriodo AS periodo FROM tblturma t, relTurmaDisciplina td, tbldisciplina d WHERE t.pkTurma = td.fkTurma AND d.pkDisciplina = td.fkDisciplina AND d.strSigla = varSigla;
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

-- Dump completed on 2019-05-02 22:05:44
