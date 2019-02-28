-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dbrevisao
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
-- Table structure for table `relproprietariopet`
--

DROP TABLE IF EXISTS `relproprietariopet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `relproprietariopet` (
  `pkProprietarioPet` int(11) NOT NULL AUTO_INCREMENT,
  `fkProprietario` int(11) NOT NULL,
  `fkPet` int(11) NOT NULL,
  PRIMARY KEY (`pkProprietarioPet`),
  UNIQUE KEY `fkProprietario` (`fkProprietario`,`fkPet`),
  CONSTRAINT `relproprietariopet_ibfk_1` FOREIGN KEY (`fkProprietario`) REFERENCES `tblproprietario` (`pkproprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relproprietariopet`
--

LOCK TABLES `relproprietariopet` WRITE;
/*!40000 ALTER TABLE `relproprietariopet` DISABLE KEYS */;
INSERT INTO `relproprietariopet` VALUES (1,1,2),(2,2,3),(3,3,1);
/*!40000 ALTER TABLE `relproprietariopet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpet`
--

DROP TABLE IF EXISTS `tblpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpet` (
  `pkPet` int(11) NOT NULL AUTO_INCREMENT,
  `strRga` varchar(10) DEFAULT NULL,
  `strNome` varchar(50) NOT NULL,
  PRIMARY KEY (`pkPet`),
  UNIQUE KEY `strRga` (`strRga`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpet`
--

LOCK TABLES `tblpet` WRITE;
/*!40000 ALTER TABLE `tblpet` DISABLE KEYS */;
INSERT INTO `tblpet` VALUES (1,NULL,'REX'),(2,'1234567890','CINDY'),(3,NULL,'DUKE');
/*!40000 ALTER TABLE `tblpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproprietario`
--

DROP TABLE IF EXISTS `tblproprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblproprietario` (
  `pkProprietario` int(11) NOT NULL AUTO_INCREMENT,
  `dcCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dcModified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `strNome` varchar(50) NOT NULL,
  `strCpf` char(11) NOT NULL,
  `dtNascimento` date NOT NULL,
  `strObservacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pkProprietario`),
  UNIQUE KEY `strCpf` (`strCpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproprietario`
--

LOCK TABLES `tblproprietario` WRITE;
/*!40000 ALTER TABLE `tblproprietario` DISABLE KEYS */;
INSERT INTO `tblproprietario` VALUES (1,'0000-00-00 00:00:00',NULL,'JOAQUIM RAMOS','12345678911','2000-03-20','OBSERVAÇÃO 1'),(2,'0000-00-00 00:00:00',NULL,'JOAQUINA ABREU','12345678922','1998-10-10','OBSERVAÇÃO 2'),(3,'0000-00-00 00:00:00','2019-02-28 07:01:15','RIVALDO DA SIVLA','12345678933','1972-07-29','OBSERVAÇÃO 3');
/*!40000 ALTER TABLE `tblproprietario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-28  7:17:18
