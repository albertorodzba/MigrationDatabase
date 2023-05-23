-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: helpersystem
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id_activity` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_activity`),
  UNIQUE KEY `id_activity` (`id_activity`),
  UNIQUE KEY `activity_name` (`activity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (4,'Cocina'),(3,'Cuidado de adultos mayores'),(1,'Cuidado de bebés'),(2,'Cuidado de niños'),(5,'Planchado');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_job`
--

DROP TABLE IF EXISTS `activity_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_job` (
  `id_activity_job` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_activity` int DEFAULT NULL,
  `FK_id_job` int DEFAULT NULL,
  PRIMARY KEY (`id_activity_job`),
  UNIQUE KEY `id_activity_job` (`id_activity_job`),
  KEY `FK_id_activity` (`FK_id_activity`),
  KEY `FK_id_job` (`FK_id_job`),
  CONSTRAINT `activity_job_ibfk_1` FOREIGN KEY (`FK_id_activity`) REFERENCES `activity` (`id_activity`),
  CONSTRAINT `activity_job_ibfk_2` FOREIGN KEY (`FK_id_job`) REFERENCES `job` (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_job`
--

LOCK TABLES `activity_job` WRITE;
/*!40000 ALTER TABLE `activity_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_requested`
--

DROP TABLE IF EXISTS `activity_requested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_requested` (
  `id_activity_requested` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_activity` int DEFAULT NULL,
  PRIMARY KEY (`id_activity_requested`),
  UNIQUE KEY `id_activity_requested` (`id_activity_requested`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_activity` (`FK_id_activity`),
  CONSTRAINT `activity_requested_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `activity_requested_ibfk_2` FOREIGN KEY (`FK_id_activity`) REFERENCES `activity` (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_requested`
--

LOCK TABLES `activity_requested` WRITE;
/*!40000 ALTER TABLE `activity_requested` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_requested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergie`
--

DROP TABLE IF EXISTS `allergie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergie` (
  `id_alergie` int NOT NULL AUTO_INCREMENT,
  `alergie_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alergie`),
  UNIQUE KEY `id_alergie` (`id_alergie`),
  UNIQUE KEY `alergie_name` (`alergie_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergie`
--

LOCK TABLES `allergie` WRITE;
/*!40000 ALTER TABLE `allergie` DISABLE KEYS */;
INSERT INTO `allergie` VALUES (2,'Gatos'),(1,'Perros'),(6,'Plantas venenosas'),(4,'Polen'),(5,'Polvo'),(3,'Tortugas');
/*!40000 ALTER TABLE `allergie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `id_applicant` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(300) NOT NULL,
  `aboutme` varchar(600) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL,
  `FK_id_gender` int DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `neighborhood` varchar(70) DEFAULT NULL,
  `locality` varchar(200) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `phonenumber_1` varchar(15) DEFAULT NULL,
  `phonenumber_2` varchar(15) DEFAULT NULL,
  `body_piercing` tinyint(1) DEFAULT NULL,
  `children` varchar(30) DEFAULT NULL,
  `tattoos` tinyint(1) DEFAULT NULL,
  `weight_kg` varchar(3) DEFAULT NULL,
  `height_cm` varchar(3) DEFAULT NULL,
  `FK_id_job_status` int DEFAULT NULL,
  `admin_observation` varchar(300) DEFAULT NULL,
  `FK_id_marital_status` int DEFAULT NULL,
  `FK_education_level` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_applicant`),
  UNIQUE KEY `id_applicant` (`id_applicant`),
  KEY `job_status` (`FK_id_job_status`),
  KEY `FK_id_marital_status` (`FK_id_marital_status`),
  KEY `FK_education_level` (`FK_education_level`),
  KEY `FK_id_gender` (`FK_id_gender`),
  CONSTRAINT `applicant_ibfk_1` FOREIGN KEY (`FK_id_job_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `applicant_ibfk_2` FOREIGN KEY (`FK_id_marital_status`) REFERENCES `marital_status` (`id_marital_status`),
  CONSTRAINT `applicant_ibfk_3` FOREIGN KEY (`FK_education_level`) REFERENCES `education` (`id_education`),
  CONSTRAINT `applicant_ibfk_4` FOREIGN KEY (`FK_id_gender`) REFERENCES `gender` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_activity`
--

DROP TABLE IF EXISTS `applicant_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_activity` (
  `id_applicant_activity` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_activity` int DEFAULT NULL,
  `activity_preference` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_activity`),
  UNIQUE KEY `id_applicant_activity` (`id_applicant_activity`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_activity` (`FK_id_activity`),
  CONSTRAINT `applicant_activity_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_activity_ibfk_2` FOREIGN KEY (`FK_id_activity`) REFERENCES `activity` (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_activity`
--

LOCK TABLES `applicant_activity` WRITE;
/*!40000 ALTER TABLE `applicant_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_allergie`
--

DROP TABLE IF EXISTS `applicant_allergie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_allergie` (
  `id_applicant_allergie` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` int DEFAULT NULL,
  `FK_id_allergie` bigint DEFAULT NULL,
  PRIMARY KEY (`id_applicant_allergie`),
  UNIQUE KEY `id_applicant_allergie` (`id_applicant_allergie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_allergie`
--

LOCK TABLES `applicant_allergie` WRITE;
/*!40000 ALTER TABLE `applicant_allergie` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_allergie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_condition`
--

DROP TABLE IF EXISTS `applicant_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_condition` (
  `id_applicant_condition` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_condition` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_condition`),
  UNIQUE KEY `id_applicant_condition` (`id_applicant_condition`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_condition` (`FK_id_condition`),
  CONSTRAINT `applicant_condition_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_condition_ibfk_2` FOREIGN KEY (`FK_id_condition`) REFERENCES `physical_condition` (`id_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_condition`
--

LOCK TABLES `applicant_condition` WRITE;
/*!40000 ALTER TABLE `applicant_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_desired_job`
--

DROP TABLE IF EXISTS `applicant_desired_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_desired_job` (
  `id_applicant_desired_job` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_job` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_desired_job`),
  UNIQUE KEY `id_applicant_desired_job` (`id_applicant_desired_job`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_job` (`FK_id_job`),
  CONSTRAINT `applicant_desired_job_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_desired_job_ibfk_2` FOREIGN KEY (`FK_id_job`) REFERENCES `job` (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_desired_job`
--

LOCK TABLES `applicant_desired_job` WRITE;
/*!40000 ALTER TABLE `applicant_desired_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_desired_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_disability`
--

DROP TABLE IF EXISTS `applicant_disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_disability` (
  `id_applicant_disability` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_disability` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_disability`),
  UNIQUE KEY `id_applicant_disability` (`id_applicant_disability`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_disability` (`FK_id_disability`),
  CONSTRAINT `applicant_disability_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_disability_ibfk_2` FOREIGN KEY (`FK_id_disability`) REFERENCES `disability` (`id_disability`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_disability`
--

LOCK TABLES `applicant_disability` WRITE;
/*!40000 ALTER TABLE `applicant_disability` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_language`
--

DROP TABLE IF EXISTS `applicant_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_language` (
  `id_applicant_language` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_language` int DEFAULT NULL,
  `language_level` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_language`),
  UNIQUE KEY `id_applicant_language` (`id_applicant_language`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_language` (`FK_id_language`),
  CONSTRAINT `applicant_language_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_language_ibfk_2` FOREIGN KEY (`FK_id_language`) REFERENCES `language` (`id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_language`
--

LOCK TABLES `applicant_language` WRITE;
/*!40000 ALTER TABLE `applicant_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_workhour`
--

DROP TABLE IF EXISTS `applicant_workhour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_workhour` (
  `id_applicant_workhour` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `FK_id_workhour` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_workhour`),
  UNIQUE KEY `id_applicant_workhour` (`id_applicant_workhour`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_workhour` (`FK_id_workhour`),
  CONSTRAINT `applicant_workhour_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_workhour_ibfk_2` FOREIGN KEY (`FK_id_workhour`) REFERENCES `work_hour` (`id_workhour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_workhour`
--

LOCK TABLES `applicant_workhour` WRITE;
/*!40000 ALTER TABLE `applicant_workhour` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_workhour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(300) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL,
  `phonenumber_1` varchar(15) NOT NULL,
  `phonenumber_2` varchar(15) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `have_more_workers` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disability`
--

DROP TABLE IF EXISTS `disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disability` (
  `id_disability` int NOT NULL AUTO_INCREMENT,
  `disability_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_disability`),
  UNIQUE KEY `id_disability` (`id_disability`),
  UNIQUE KEY `disability_name` (`disability_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability`
--

LOCK TABLES `disability` WRITE;
/*!40000 ALTER TABLE `disability` DISABLE KEYS */;
INSERT INTO `disability` VALUES (2,'Amputación de brazo'),(3,'Amputación de pierna'),(6,'Autismo'),(5,'Discapacidad auditiva'),(7,'Enfermedad crónica'),(8,'Lesión medular'),(4,'Movilidad preservada'),(1,'Visión parcial o baja visión');
/*!40000 ALTER TABLE `disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folder`
--

DROP TABLE IF EXISTS `document_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_folder` (
  `id_folder_document` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_folder` bigint DEFAULT NULL,
  `FK_id_document_type` int DEFAULT NULL,
  `folder_url` varchar(300) NOT NULL,
  `id_folder_generated` varchar(50) NOT NULL,
  PRIMARY KEY (`id_folder_document`),
  UNIQUE KEY `id_folder_document` (`id_folder_document`),
  KEY `FK_id_folder` (`FK_id_folder`),
  KEY `FK_id_document_type` (`FK_id_document_type`),
  CONSTRAINT `document_folder_ibfk_1` FOREIGN KEY (`FK_id_folder`) REFERENCES `personal_folder` (`id_folder`),
  CONSTRAINT `document_folder_ibfk_2` FOREIGN KEY (`FK_id_document_type`) REFERENCES `document_type` (`id_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_folder`
--

LOCK TABLES `document_folder` WRITE;
/*!40000 ALTER TABLE `document_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_job`
--

DROP TABLE IF EXISTS `document_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_job` (
  `id_document_job` bigint NOT NULL AUTO_INCREMENT,
  `Fk_id_job` int DEFAULT NULL,
  `FK_id_document` int DEFAULT NULL,
  PRIMARY KEY (`id_document_job`),
  UNIQUE KEY `id_document_job` (`id_document_job`),
  KEY `Fk_id_job` (`Fk_id_job`),
  KEY `FK_id_document` (`FK_id_document`),
  CONSTRAINT `document_job_ibfk_1` FOREIGN KEY (`Fk_id_job`) REFERENCES `job` (`id_job`),
  CONSTRAINT `document_job_ibfk_2` FOREIGN KEY (`FK_id_document`) REFERENCES `document_type` (`id_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_job`
--

LOCK TABLES `document_job` WRITE;
/*!40000 ALTER TABLE `document_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type` (
  `id_document` int NOT NULL AUTO_INCREMENT,
  `document_name` varchar(60) NOT NULL,
  PRIMARY KEY (`id_document`),
  UNIQUE KEY `id_document` (`id_document`),
  UNIQUE KEY `document_name` (`document_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES (5,'Carta de antecedentes penales'),(4,'Carta de recomendación'),(6,'Certificaciones'),(2,'Comprobante de domicilio'),(1,'INE'),(3,'Licencia de conducir'),(8,'Titulo Universitario'),(7,'Vacunación contra COVID-19');
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id_education` int NOT NULL AUTO_INCREMENT,
  `education_level` varchar(30) NOT NULL,
  PRIMARY KEY (`id_education`),
  UNIQUE KEY `id_education` (`id_education`),
  UNIQUE KEY `education_level` (`education_level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (4,'Licenciatura'),(3,'Preparatoria'),(1,'Primaria'),(2,'Secundaria'),(5,'Universidad trunca');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_benefit`
--

DROP TABLE IF EXISTS `employee_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_benefit` (
  `id_benefit` int NOT NULL AUTO_INCREMENT,
  `benefit` varchar(30) NOT NULL,
  PRIMARY KEY (`id_benefit`),
  UNIQUE KEY `id_benefit` (`id_benefit`),
  UNIQUE KEY `benefit` (`benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_benefit`
--

LOCK TABLES `employee_benefit` WRITE;
/*!40000 ALTER TABLE `employee_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id_file` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_Folder` bigint DEFAULT NULL,
  `file_url` varchar(300) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `id_file_generated` varchar(50) NOT NULL,
  PRIMARY KEY (`id_file`),
  UNIQUE KEY `id_file` (`id_file`),
  UNIQUE KEY `file_url` (`file_url`),
  KEY `FK_id_Folder` (`FK_id_Folder`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`FK_id_Folder`) REFERENCES `document_folder` (`id_folder_document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id_gender` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_gender`),
  UNIQUE KEY `id_gender` (`id_gender`),
  UNIQUE KEY `gender_name` (`gender_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'Femenino'),(1,'Masculino'),(4,'No binario'),(5,'Otro/Prefiero no decir'),(3,'Transgénero');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id_job` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_job`),
  UNIQUE KEY `id_job` (`id_job`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Empleado/a Doméstico/a');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_extra_info`
--

DROP TABLE IF EXISTS `job_extra_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_extra_info` (
  `id_job_extra_info` int NOT NULL AUTO_INCREMENT,
  `extra_info` varchar(50) NOT NULL,
  PRIMARY KEY (`id_job_extra_info`),
  UNIQUE KEY `id_job_extra_info` (`id_job_extra_info`),
  UNIQUE KEY `extra_info` (`extra_info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_extra_info`
--

LOCK TABLES `job_extra_info` WRITE;
/*!40000 ALTER TABLE `job_extra_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_extra_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offer`
--

DROP TABLE IF EXISTS `job_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer` (
  `id_job_offer` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_customner` bigint DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `salary` decimal(10,0) NOT NULL,
  `work_place` varchar(60) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `locality` varchar(200) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `applicants_for_hiring` int NOT NULL,
  `applicant_experience` tinyint(1) NOT NULL,
  `applicant_tattoos_piercings` tinyint(1) NOT NULL,
  `applicant_disability` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_job_offer`),
  UNIQUE KEY `id_job_offer` (`id_job_offer`),
  KEY `FK_id_customner` (`FK_id_customner`),
  CONSTRAINT `job_offer_ibfk_1` FOREIGN KEY (`FK_id_customner`) REFERENCES `customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer`
--

LOCK TABLES `job_offer` WRITE;
/*!40000 ALTER TABLE `job_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offer_extra_info`
--

DROP TABLE IF EXISTS `job_offer_extra_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer_extra_info` (
  `id_job_offer_extra_info` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_job_extra_info` int DEFAULT NULL,
  PRIMARY KEY (`id_job_offer_extra_info`),
  UNIQUE KEY `id_job_offer_extra_info` (`id_job_offer_extra_info`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_job_extra_info` (`FK_id_job_extra_info`),
  CONSTRAINT `job_offer_extra_info_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `job_offer_extra_info_ibfk_2` FOREIGN KEY (`FK_id_job_extra_info`) REFERENCES `job_extra_info` (`id_job_extra_info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer_extra_info`
--

LOCK TABLES `job_offer_extra_info` WRITE;
/*!40000 ALTER TABLE `job_offer_extra_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer_extra_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offer_work_hour`
--

DROP TABLE IF EXISTS `job_offer_work_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer_work_hour` (
  `id_job_offer_work_hour` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_work_hour` int DEFAULT NULL,
  PRIMARY KEY (`id_job_offer_work_hour`),
  UNIQUE KEY `id_job_offer_work_hour` (`id_job_offer_work_hour`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_work_hour` (`FK_id_work_hour`),
  CONSTRAINT `job_offer_work_hour_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `job_offer_work_hour_ibfk_2` FOREIGN KEY (`FK_id_work_hour`) REFERENCES `work_hour` (`id_workhour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer_work_hour`
--

LOCK TABLES `job_offer_work_hour` WRITE;
/*!40000 ALTER TABLE `job_offer_work_hour` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer_work_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id_language` int NOT NULL AUTO_INCREMENT,
  `language` varchar(20) NOT NULL,
  PRIMARY KEY (`id_language`),
  UNIQUE KEY `id_language` (`id_language`),
  UNIQUE KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (2,'Español'),(3,'Francés'),(1,'Inglés'),(4,'Italiano');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_status` (
  `id_marital_status` int NOT NULL AUTO_INCREMENT,
  `marital_status_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_marital_status`),
  UNIQUE KEY `id_marital_status` (`id_marital_status`),
  UNIQUE KEY `marital_status_name` (`marital_status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_status`
--

LOCK TABLES `marital_status` WRITE;
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` VALUES (2,'Casado/a'),(5,'Divorciado/a'),(6,'Separado/a'),(1,'Soltero/a'),(4,'Unión libre'),(3,'Viudo/a');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_benefit`
--

DROP TABLE IF EXISTS `offer_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_benefit` (
  `id_offer_benefit` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_benefit` int DEFAULT NULL,
  PRIMARY KEY (`id_offer_benefit`),
  UNIQUE KEY `id_offer_benefit` (`id_offer_benefit`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_benefit` (`FK_id_benefit`),
  CONSTRAINT `offer_benefit_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `offer_benefit_ibfk_2` FOREIGN KEY (`FK_id_benefit`) REFERENCES `employee_benefit` (`id_benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_folder`
--

DROP TABLE IF EXISTS `personal_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_folder` (
  `id_folder` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `folder_name` varchar(60) DEFAULT NULL,
  `folder_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_folder`),
  UNIQUE KEY `id_folder` (`id_folder`),
  UNIQUE KEY `folder_name` (`folder_name`),
  UNIQUE KEY `folder_url` (`folder_url`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  CONSTRAINT `personal_folder_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_folder`
--

LOCK TABLES `personal_folder` WRITE;
/*!40000 ALTER TABLE `personal_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_condition`
--

DROP TABLE IF EXISTS `physical_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_condition` (
  `id_condition` int NOT NULL AUTO_INCREMENT,
  `physical_activity` varchar(100) NOT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_condition`),
  UNIQUE KEY `id_condition` (`id_condition`),
  UNIQUE KEY `condition` (`physical_activity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_condition`
--

LOCK TABLES `physical_condition` WRITE;
/*!40000 ALTER TABLE `physical_condition` DISABLE KEYS */;
INSERT INTO `physical_condition` VALUES (1,'Puedo subir escaleras','Positivo'),(2,'Hago ejercicio por lo menos 2 veces a la semana','Positivo'),(3,'Puedo levantar objetos pesadas','Positivo'),(4,'Realizo ejercicios de flexibilidad','Positivo'),(5,'Me fatigo rápido','Negativo'),(6,'No hago ejercicio','Negativo'),(7,'Siento rigidez al moverme','Negativo'),(8,'No puedo levantar objetos pesados','Negativo');
/*!40000 ALTER TABLE `physical_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `id_status` (`id_status`),
  UNIQUE KEY `status` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Colocada'),(2,'No colocada'),(4,'No disponible'),(3,'Vetada');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_experience`
--

DROP TABLE IF EXISTS `work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_experience` (
  `id_work_experience` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `job_name` varchar(60) DEFAULT NULL,
  `work_place` varchar(60) DEFAULT NULL,
  `activities` varchar(1000) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `leaving_reason` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_work_experience`),
  UNIQUE KEY `id_work_experience` (`id_work_experience`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  CONSTRAINT `work_experience_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--

LOCK TABLES `work_experience` WRITE;
/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_hour`
--

DROP TABLE IF EXISTS `work_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_hour` (
  `id_workhour` int NOT NULL AUTO_INCREMENT,
  `mode` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_workhour`),
  UNIQUE KEY `id_workhour` (`id_workhour`),
  UNIQUE KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_hour`
--

LOCK TABLES `work_hour` WRITE;
/*!40000 ALTER TABLE `work_hour` DISABLE KEYS */;
INSERT INTO `work_hour` VALUES (1,'Entrada Por Salida','Turno de 8 a 12 horas'),(2,'De Planta (Salida Cada 15 Días)',NULL),(3,'De planta (Salida Cada 8 Días)',NULL);
/*!40000 ALTER TABLE `work_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_reference`
--

DROP TABLE IF EXISTS `work_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_reference` (
  `id_work_reference` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_work_experience` bigint DEFAULT NULL,
  `FK_id_applicant` bigint NOT NULL,
  `reference_name` varchar(60) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `work_reference_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_work_reference`),
  UNIQUE KEY `id_work_reference` (`id_work_reference`),
  KEY `FK_id_work_experience` (`FK_id_work_experience`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  CONSTRAINT `work_reference_ibfk_1` FOREIGN KEY (`FK_id_work_experience`) REFERENCES `work_experience` (`id_work_experience`),
  CONSTRAINT `work_reference_ibfk_2` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_reference`
--

LOCK TABLES `work_reference` WRITE;
/*!40000 ALTER TABLE `work_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_reference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18  8:54:49
