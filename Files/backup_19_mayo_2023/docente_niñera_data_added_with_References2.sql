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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,'Lizeth Camila Garrido Domínguez',NULL,'2003-02-11','20',2,NULL,NULL,NULL,'Loc. Camotepec S/N',NULL,NULL,'7971405869',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Cocina Poco',1,NULL,'2023-05-18 15:03:20','2023-05-18 15:03:20'),(2,'Angélica Espinoza Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Francisco Mazapan',NULL,NULL,'5535057993',NULL,NULL,'Si ,30,28,26,25 Años',NULL,NULL,NULL,1,'Ocupada,  Entro El 13 De Noviembre 2022 Con Adelin En Bosque Herrara',1,NULL,'2023-05-18 15:03:20','2023-05-18 15:03:20'),(3,'Margarita Belén Andrade Ruiz',NULL,'1983-08-30','39',2,NULL,NULL,NULL,'Amecameca',NULL,NULL,'5529106912',NULL,NULL,'Si, 21 ,15 Años',NULL,NULL,NULL,1,'Betada, Fue Una Semana Y Ya No Regreso',1,NULL,'2023-05-18 15:03:20','2023-05-18 15:03:20'),(4,'Bernardita Jiménez Peña',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Puebla',NULL,NULL,'7761176006',NULL,NULL,'Si, 32,31,30 Años',NULL,NULL,NULL,1,'Ocupada, Entro El 4 De Enero, Con La Sra. Catalina',1,NULL,'2023-05-18 15:03:20','2023-05-18 15:03:20'),(5,'Elizabeth Salas Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec De Morelos',NULL,NULL,'5536816100',NULL,NULL,'Si, 23,19,13 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:20','2023-05-18 15:03:20'),(6,'Luz María Rosas García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5522469675',NULL,NULL,'Si, 9 Años',NULL,NULL,NULL,2,'No Disponible, Se Ocupo',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(7,'Martha Beatriz Torres Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2223085803',NULL,NULL,'Si, 25,23, 20 Años',NULL,NULL,NULL,2,'(Betada) Le Escribio A Sra. Monica Ofensivos',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(8,'Mirna López Ramos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Calle Manzanillo',NULL,NULL,'5510945550',NULL,NULL,'Si, 18, 12 Años',NULL,NULL,NULL,2,'Disponible, Nana Domestica',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(9,'Patricia Nicolas Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'7121624020',NULL,NULL,'Si,25, 21, 19 Años',NULL,NULL,NULL,1,'(Betada), No Se Presento',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(10,'Adelina Pérez Pérez',NULL,'1974-12-11','48',2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5570627725',NULL,NULL,'Si, 32,30, 22 Años',NULL,NULL,NULL,1,'(Disponible) , Estaba Con Jatxibe Pero La Cambio. ',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(11,'Adriana Patricia Domínguez González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juquipilco',NULL,NULL,'5561086820',NULL,NULL,'No',NULL,NULL,NULL,1,'Estuvo Con Rebeca Y Sr. Camilo, Y Pidieron Caambio',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(12,'Adriana Rodríguez Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlatlauquitepec',NULL,NULL,'5530795231',NULL,NULL,'Si, 18,17 Años',NULL,NULL,NULL,2,'(Betada) Pone Muchos Pretextos',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(13,'Adriana Sánchez Ocampo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Talpan',NULL,NULL,'5585753196',NULL,NULL,'Si, 19, 13 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(14,'Alejandra Martínez Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Luis Tlaxialtemalco',NULL,NULL,'5545825142',NULL,NULL,'No',NULL,NULL,NULL,1,'Ocupada, Esta Con La Sra. Marlen Cecilia',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(15,'Alejandra Medina Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tecamac',NULL,NULL,'5633586025',NULL,NULL,'Si, 1 Año 6 Meses',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(16,'Alibeth Anselmo Orozco',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec De Morelos',NULL,NULL,'5529776673',NULL,NULL,'Si, 6 Años',NULL,NULL,NULL,2,'No Tiene Vacunas',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(17,'Alicia Reyes Maceda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Miravalle, Ixtapalapa',NULL,NULL,'5572744238',NULL,NULL,'Si, 23,20, 17 Años',NULL,NULL,NULL,2,'No Hay Documentos',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(18,'Amelia Gonzáles Orduña',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Loc. El Capulin',NULL,NULL,'5554547523',NULL,NULL,'Si, 4 Hijos',NULL,NULL,NULL,1,'(Betada) Ya No Regreso Con Mateo',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(19,'Ana Cristina Cruz Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'5533318458',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Poca Experiencia',1,NULL,'2023-05-18 15:03:21','2023-05-18 15:03:21'),(20,'Ana Isabel Orozco Durán',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtapaluca',NULL,NULL,'5633010663',NULL,NULL,'Si, Ya Independientes',NULL,NULL,NULL,2,'Disponible Pero Pone Muchos Pretextos',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(21,'Ana Karen Martínez Villanueva',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5541026294',NULL,NULL,'Si, 17, 12 Y 5 Años',NULL,NULL,NULL,1,'Estuvo A Prueba 1 Semana Con Sr. Rodrigo Y Paulina',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(22,'Ana Karen Rosas Domínguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7297321720',NULL,NULL,'No',NULL,NULL,NULL,1,'(Betada) ',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(23,'Ana Laura Galicia Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5632822761',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible Fines De Semana',4,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(24,'Ana Laura Gómez Zamora',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Michoacan De Ocampo',NULL,NULL,'5563214186',NULL,NULL,'Si, 7 Años',NULL,NULL,NULL,1,'Ocupada, Entro En Agosto 2022',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(25,'Ana María Carmona Rangel',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5578914234',NULL,NULL,'No',NULL,NULL,NULL,1,'Betada, No Se Presento',2,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(26,'Anahí Lucero Ramírez Laureano',NULL,'2003-03-13','20',2,NULL,NULL,NULL,'El Huizache  ',NULL,NULL,'5628178896',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(27,'Anahid Dionicio Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Teziutlàn',NULL,NULL,'2311486893',NULL,NULL,'Si, 10 Y 8 Años',NULL,NULL,NULL,1,'Ocupada, Esta Con Maria Cecilia, Entro En Noviembre 2022',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(28,'Andrea Peñaloza Ramos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chimalhuacan',NULL,NULL,'5523286298',NULL,NULL,'Si,17,11,4 Años',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(29,'Angélica Berríos Solís',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlapujahua',NULL,NULL,'4471309404',NULL,NULL,'Si, 16 Años',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(30,'Angélina  Pineda Mejia',NULL,'1979-10-01','43',2,NULL,NULL,NULL,'Ixtlahuac',NULL,NULL,'7292848563',NULL,NULL,'Si,21,15 Años',NULL,NULL,NULL,2,'No Disponible, Ya No Puede Trabajar',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(31,'Angélica Rodríguez Fernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2311405226',NULL,NULL,'Si, 19,17,13,8 Años',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(32,'Antonia De Los Santos Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ahuacatlàn',NULL,NULL,'5523863587',NULL,NULL,'Si,8 Años',NULL,NULL,NULL,1,'Disponible, Donde Se Le Coloco No Le Gusto Al Cliente',1,NULL,'2023-05-18 15:03:22','2023-05-18 15:03:22'),(33,'Araceli Córdova Osorio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5574254897',NULL,NULL,'Si, 27, 25 Años',NULL,NULL,NULL,1,'Se Coloco El 10 De Enero Con La Sra Jessi',2,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(34,'Araceli Reyes Anselmo',NULL,'1994-04-17','29',2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'5574266287',NULL,NULL,'Si, 3 Años',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(35,'Araceli Zárate Vázquez',NULL,'1988-03-23','35',2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5619317449',NULL,NULL,'Si, 9,6,4,2 Años',NULL,NULL,NULL,1,'Disponible',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(36,'Beatriz Adriana Hernández Díaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa De Allende',NULL,NULL,'7151963702',NULL,NULL,'Si, 1 Año 6 Meses',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(37,'Beatriz Aidé Sánchez Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5635287382',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(38,'Beatriz Córdova Altamirano',NULL,'1987-07-07','35',2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5561284828',NULL,NULL,'Si, 18, 11 Años',NULL,NULL,NULL,2,'Disponible, Ocacional',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(39,'Beatriz Morelos Ruiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2331036272',NULL,NULL,'Si, 17,11 Años',NULL,NULL,NULL,2,'Pide $2500 De Sueldo Semanal',2,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(40,'Bianca Arely Rangel Enríquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5636344975',NULL,NULL,'Si, 7, 3 Años',NULL,NULL,NULL,2,'Foto De Perfil De Wp Inapropiada',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(41,'Blanca Dorazco González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ocuilan',NULL,NULL,'5567521506',NULL,NULL,'Si,24,24 Años',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(42,'Blanca Estela Granados Benítez',NULL,'1976-06-02','46',2,NULL,NULL,NULL,'Delegacion Alvaro Obregon',NULL,NULL,'5528460661',NULL,NULL,'Si, 26, 24 Años',NULL,NULL,NULL,1,'Entro A Laborar En Junio 2022',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(43,'Brenda Licona Mejía',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5568991065',NULL,NULL,'Si, 8 Años',NULL,NULL,NULL,1,'Entro Con Irlanda Pero No Le Gusto',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(44,'Cecilia Guadalupe Bustamante  Carrizo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5583385953',NULL,NULL,'No',NULL,NULL,NULL,1,'(Remplazo) Entro A Laborar Con Camilo, Entro El 2 De Diciembre 2022',1,NULL,'2023-05-18 15:03:23','2023-05-18 15:03:23'),(45,'Cecilia Guadalupe Hernández Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chichiquila',NULL,NULL,'5575309092',NULL,NULL,'Si, 12,10,6,5 Años',NULL,NULL,NULL,2,'Betada, Pidio Dinero Prestado Y No Regreso Hasta Dentro De 3 Semanas',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(46,'Claudia Agustín Ferreti',NULL,'1993-11-24','29',2,NULL,NULL,NULL,'Col. Francisco I Madero',NULL,NULL,'5621185674',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Ocacional',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(47,'Claudia Ivett Bellido Mora',NULL,'1983-11-30','39',2,NULL,NULL,NULL,'Loc. Laguna De Tabernilla',NULL,NULL,'7222848194',NULL,NULL,'Si, 19, 12 Años',NULL,NULL,NULL,2,'Se Fue A Canada',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(48,'Claudia Lizeth Guadalupe Galván Fonseca',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Alvaro Obregon',NULL,NULL,'5612968863',NULL,NULL,'Si, 19,17,12 Años',NULL,NULL,NULL,2,'Disponible, Ocacional',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(49,'Consuelo Zarco',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Puebla',NULL,NULL,'5544754446',NULL,NULL,'Si, 8 Años',NULL,NULL,NULL,2,'Ocupada',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(50,'Cristal Onofre Soto',NULL,'1993-07-28','29',2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'7122113106',NULL,NULL,'Si, 1 Año 6 Meses',NULL,NULL,NULL,1,'Se Coloco El 26 De Mayo 2022',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(51,'Ma. Denisse Galván Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5533348547',NULL,NULL,'No',NULL,NULL,NULL,1,'Se Coloco En Septiembre, Con La Sra. Ana Cecilia',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(52,'Diana Ausencio García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santa Clara De Juarez',NULL,NULL,'7121822156',NULL,NULL,'Si,10,9,5 Años',NULL,NULL,NULL,1,'Se Coloco El 20 De Noviembre Con La Sra. Adriana',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(53,'Diana Elena Ramírez Urbina',NULL,'1998-07-19','24',2,NULL,NULL,NULL,'San Josè Del Rincon',NULL,NULL,'5611110321',NULL,NULL,'No',NULL,NULL,NULL,1,'Se Coloco En Junio 2022',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(54,'Diana Macario Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Pueblo Villa Del Carbon',NULL,NULL,'712228899',NULL,NULL,'Si ,10,8 Años',NULL,NULL,NULL,2,'Betada, No Se Presento',4,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(55,'Dulce Dayana Camacho González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7228749717',NULL,NULL,'No',NULL,NULL,NULL,1,'Entro A Laborar 30 De Junio Con La Sra. Adriana , Pero Se Salio',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(56,'Edith Guadalupe Moreno García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5554653714',NULL,NULL,'Si, 8, 11 Años',NULL,NULL,NULL,1,'Entro A Laborar El Lunes 23 De Enero 2023, Con Sr. Rodrigo Y Paulina En Santa Fe',1,NULL,'2023-05-18 15:03:24','2023-05-18 15:03:24'),(57,'Elisa Rodríguez Estrella',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tultitlàn',NULL,NULL,'5545131945',NULL,NULL,'Si, 26 Años',NULL,NULL,NULL,2,'No Disponible',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(58,'Elizabeth Clemente Bravo',NULL,'1977-05-25','45',2,NULL,NULL,NULL,'Ixtapaluca',NULL,NULL,'5531540305',NULL,NULL,'Si,22,25,26 Años',NULL,NULL,NULL,2,'Ocasional, Disponible',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(59,'Emma Duran Flores',NULL,'1979-06-04','43',2,NULL,NULL,NULL,'San Isidro',NULL,NULL,'7122119039',NULL,NULL,'Si, 15 Años',NULL,NULL,NULL,2,'Betada No Llego En Dos Oportunidades Que Se Le Dieron',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(60,'Emma Torres Zamora',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5534902454',NULL,NULL,'Si, 4 Independientes',NULL,NULL,NULL,2,'Ocupada',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(61,'Erika Martínez Escobar',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle Madero',NULL,NULL,'5569867370',NULL,NULL,'Si, 18, 15 Años',NULL,NULL,NULL,2,'Betada, No Se Presento',4,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(62,'Esmeralda Angélica Antonio González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Azcapotzalco',NULL,NULL,'7291028985',NULL,NULL,'Si, 19, 15 Años',NULL,NULL,NULL,1,'Ultimo Reemplazo De Catalina Lomas Bezarez, Entro A Laborar El 15 De Enero 2022',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(63,'Esmeralda Vega Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztacalco',NULL,NULL,'5626955334',NULL,NULL,'No',NULL,NULL,NULL,2,'Ocupada',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(64,'Esperanza Reyes Anselmo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'7122163781',NULL,NULL,'Si, 5 Años',NULL,NULL,NULL,1,'Se Coloco El 20 De Mayo',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(65,'Estela Prado Casillas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Venustiano Carranza',NULL,NULL,'5540224302',NULL,NULL,'Si,25, 24, 23, 20 Años',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(66,'Estela Sánchez Román',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5631056571',NULL,NULL,'Si, 17, 16 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:25','2023-05-18 15:03:25'),(67,'Esthela Santos Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'7121622344',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Pero Poca Experiencia',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(68,'Eusebia Hernández García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5634083906',NULL,NULL,'Si,27, 23 , 21 Años',NULL,NULL,NULL,1,'Reemplazo De Yana, Entro El 23 De Enero',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(69,'Evelin Sánchez Galindo',NULL,'2000-04-19','23',2,NULL,NULL,NULL,'Estado De Mexico',NULL,NULL,'5538857328',NULL,NULL,'No',NULL,NULL,NULL,1,'Se Coloco En Junio 2022',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(70,'Fany Arisbeth Cabrera Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5572292895',NULL,NULL,'Si, 4 Años',NULL,NULL,NULL,2,'Disponible, Ocacional (Especificarle La Paga)',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(71,'Filomena Hernández Inés',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atempan',NULL,NULL,'2311406356',NULL,NULL,'Si, 8 Años',NULL,NULL,NULL,2,'Disponible , Pero Es Muy Desconfiada',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(72,'Florinda Carrizoza Villegas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5587108687',NULL,NULL,'Si, 28,24,20 Años',NULL,NULL,NULL,1,'Colocada, Entro El 25 De Noviembre 2022, Con Paola De Valle',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(73,'Francisca García González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Coyoacan',NULL,NULL,'5511528669',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:26','2023-05-18 15:03:26'),(74,'Francisca Segundo Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7224260314',NULL,NULL,'Si,26,23,21,15 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(75,'Georgina Cruz Guadarrama',NULL,'1970-12-26','52',2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'5513926433',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,1,'Estuvo Con Mateo, Se Presento A Entrevista El Lunes 14 De Enero En Bosque Real',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(76,'Gina Paola Ávila García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5634126092',NULL,NULL,'Si, 17, 15 Años',NULL,NULL,NULL,2,'Disponible, Ocacional',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(77,'Graciela Arteaga Quintana',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Felipe Del Progreso',NULL,NULL,'7121005866',NULL,NULL,'Si, 8 ,10 Años',NULL,NULL,NULL,2,'En Pausa, Estuvo Con Judith Mama De Emma',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(78,'Guadalupe Castillo Quintana',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5572778496',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,2,'Ocacional, Solamente Planchado, Estuvo Con Sra. Carolina',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(79,'Guadalupe Hernández Santamaría',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Texcoco',NULL,NULL,'5618749356',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Trabajos Cerca De Su Domicilio',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(80,'Guadalupe Mora González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nezahualcoyot',NULL,NULL,'5535773160',NULL,NULL,'No',NULL,NULL,NULL,2,'Betada',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(81,'Hilda Martínez Miranda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santa Cruz De Arriba',NULL,NULL,'5531650955',NULL,NULL,'Si, 31, 22, 20 Años',NULL,NULL,NULL,1,'Se Ocupo Con Ericka Cordova El 11 De Octubre 2022',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(82,'Hilda Sonia Canchola Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec Morelos',NULL,NULL,'5586916675',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(83,'Hortensia Ortiz Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Miguel Topilejo',NULL,NULL,'5548122113',NULL,NULL,'Si, 28,22,20 Años',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(84,'Iris Itzel Lozada Ildefonso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2331217363',NULL,NULL,'No',NULL,NULL,NULL,1,'Colocada, Entro El 13 Julio 2022',1,NULL,'2023-05-18 15:03:27','2023-05-18 15:03:27'),(85,'Iris Nava Gutiérrez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5562099755',NULL,NULL,'No',NULL,NULL,NULL,2,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(86,'Irma Marcos García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5559021242',NULL,NULL,'Si, 24,20,10 Años',NULL,NULL,NULL,1,'Betada, Entro A Laborar Y Al Sig. Dia No Se Presento',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(87,'Ivonne Terán Hidalgo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5511372739',NULL,NULL,'Si, 29 Años',NULL,NULL,NULL,2,'Disponible, Ocacional Y No Cocina',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(88,'Jazmín Alejandra Pino Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5554044704',NULL,NULL,'Si, 14,12 Años',NULL,NULL,NULL,2,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(89,'Jessica Esteban Luis',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juquipilco',NULL,NULL,'3334040689',NULL,NULL,'Si, 5,4 Años',NULL,NULL,NULL,1,'Se Coloco Entro A Laborar Con Irlanda, Duro 1 Semana Y Ya No Se Presento',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(90,'Joana Yizet López Medina',NULL,'2000-12-17','22',2,NULL,NULL,NULL,'Almoloya De Juarez',NULL,NULL,'7223804639',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible, Es Buena Pero Falta Mucho',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(91,'Joselin Zepeda Flores',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5575574505',NULL,NULL,'Si, 3 Años',NULL,NULL,NULL,2,'Se Ocupo, En Bosque Real',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(92,'Juana Bastida Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa De Allende',NULL,NULL,'7224294879',NULL,NULL,'No',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(93,'Juana Fernández Luna',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2311005335',NULL,NULL,'Si, 20, 18,17,9 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(94,'Juana Miguel Francisco',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cardenas Del Rio',NULL,NULL,'7771090281',NULL,NULL,'Si, 12 Años',NULL,NULL,NULL,1,'Betada, No Llego, Es  De Cuernavaca',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(95,'Juana Rosales Fernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tezihutlan',NULL,NULL,'2312072873',NULL,NULL,'No',NULL,NULL,NULL,2,'Pone Muchos Pretextos',1,NULL,'2023-05-18 15:03:28','2023-05-18 15:03:28'),(96,'Juana Trinidad Silverio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'5535551764',NULL,NULL,'No',NULL,NULL,NULL,2,'Su Ultima Colocacion Fue Con Mateo',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(97,'Juana Trinidad Vigueras Lozada',NULL,'1970-03-30','53',2,NULL,NULL,NULL,'Tecamac',NULL,NULL,'5571761829',NULL,NULL,'Si, 22 Y 24 Años',NULL,NULL,NULL,2,'Disponible, Pero Pone Muchos Peros',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(98,'Minerva Aparicio Alonso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5619344463',NULL,NULL,'Si, 23, 24 Años',NULL,NULL,NULL,1,'Estuvo Con La Sra. Olivia, Con La Sra. Claudia, Y Llega El 29 De Enero 2023 Con El Sr. Salvador',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(99,'Julia Casimiro Santiago',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Las Sabinas',NULL,NULL,'811489756',NULL,NULL,'Si, 14,8 Años',NULL,NULL,NULL,2,'Betada, Engaño Con Las Referencias',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(100,'Karen Paola Rangel Enríquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'El Espinal',NULL,NULL,'5637996228',NULL,NULL,'No',NULL,NULL,NULL,1,'Se Coloco El 27De Noviembre Con La Sra. Azara',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(101,'Karina Fornace Collio',NULL,'1984-04-06','39',2,NULL,NULL,NULL,'Tezihutlan',NULL,NULL,'2311282391',NULL,NULL,'Si,8,2 Años',NULL,NULL,NULL,2,'Se Ocupo',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(102,'Karla Erika Juárez Potrero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapaluca',NULL,NULL,'5522779305',NULL,NULL,'Si, 1, 7 Años',NULL,NULL,NULL,2,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(103,'Karla Leticia Guerrero Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5533884563',NULL,NULL,'Si, 15,14,11 Años',NULL,NULL,NULL,1,'Se Coloco Con Sra. Rebeca El 24 De Octubre 2022',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(104,'Karla Monserrat Martínez Miranda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Texcoco',NULL,NULL,'5561587764',NULL,NULL,'Si, 15,12 Años',NULL,NULL,NULL,2,'Disponible Entrada Por Salida, Estuvo Con Judith La Mama De Emma',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(105,'Key Larissa Colin García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7221558495',NULL,NULL,'No',NULL,NULL,NULL,1,'Llego El 23 De Enero 2023 Con Geraldine',1,NULL,'2023-05-18 15:03:29','2023-05-18 15:03:29'),(106,'Laura Rocha Garduño',NULL,'1990-04-05','33',2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5623924904',NULL,NULL,'Si, 13, 7 Años',NULL,NULL,NULL,1,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(107,' Laura Flores Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'5545172311',NULL,NULL,'Si, 5 Años',NULL,NULL,NULL,1,'Colocada 7 De Noviembre 2022, Con La Sra. Maria Fernanda',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(108,'Laura Isela Onofre Soto',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'7122113106',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(109,'Laura Rangel Rebollo',NULL,'1981-09-02','41',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7291063150',NULL,NULL,'Si, 15,13 Años',NULL,NULL,NULL,2,'Estuvo Por Margarita Bosque Real, No Trabaja Bien',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(110,'Laura Velázquez Balcázar',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Amecameca',NULL,NULL,'5549612485',NULL,NULL,'Si, 12,8 Años',NULL,NULL,NULL,2,'Pendiente',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(111,'Leticia Roció Jiménez Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Venustiano Carraznza',NULL,NULL,'5624324855',NULL,NULL,'Si, 15,13 Años',NULL,NULL,NULL,2,'Disponible, Ocacional',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(112,'Lizbeth Adriana García Arias',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5580262998',NULL,NULL,'Si, 17,14 Años',NULL,NULL,NULL,2,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(113,'Lizbeth De Jesús Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5525124650',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,2,'Betada, No Se Presento',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(114,'Lizbeth López Hernández',NULL,'1999-02-03','24',2,NULL,NULL,NULL,'Huzquilucan',NULL,NULL,'5574615415',NULL,NULL,'No',NULL,NULL,NULL,1,'Se Coloco Con Sra. Devora 24 De Octubre',1,NULL,'2023-05-18 15:03:30','2023-05-18 15:03:30'),(115,'Lorena Hernández Valente',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huzquilucan',NULL,NULL,'5522421206',NULL,NULL,'No',NULL,NULL,NULL,2,'Estuvo Con Adelinne, Y  Se Salio, Inicio Con Lucia Ortiz El 12 De Enero 2023',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(116,'Lourdes Medina Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juquipilco',NULL,NULL,'7121896109',NULL,NULL,'Si,9 Años',NULL,NULL,NULL,1,'Betada Quedo Mal En 3 Ocaciones',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(117,'Lourdes Sánchez Albarrán',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5529767479',NULL,NULL,'Si, 33 Años',NULL,NULL,NULL,1,'Se Coloco El 4 De Enero 2023, Con Sr. Pablo En Condesa',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(118,'Lucero Gómez Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Palo Solo/Celco',NULL,NULL,'5578146266',NULL,NULL,'Si, 19, 17 Y 15 Años',NULL,NULL,NULL,2,'No Disponible',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(119,'Lucia Garduño Segundo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7261006266',NULL,NULL,'Si,30, 27, 23 Y 8 Años',NULL,NULL,NULL,1,'Betada No Se Presento',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(120,'Luisa Fernanda Cabral Rueda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nezahualcoyotl',NULL,NULL,'5620104687',NULL,NULL,'1,6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(121,'Luz Del Mar Hernández Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Coyoacan',NULL,NULL,'55228013328',NULL,NULL,'Si,16,12 Años',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(122,'Luz Yaneth Bautista Serna',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5635429118',NULL,NULL,'Si, 17, 14,11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(123,'Ma. De Lourdes García García',NULL,'1981-06-26','41',2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5529190560',NULL,NULL,'Si,3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:31','2023-05-18 15:03:31'),(124,'Magdalena Mejía Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5625284452',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(125,'Marcela García Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Milpa Alta',NULL,NULL,'5561507497',NULL,NULL,'Si, 15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(126,'Marcelina Hernández Mondragón',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Zitacuaro',NULL,NULL,'5618139419',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(127,'Margarita Portillo Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Nicolas Romero',NULL,NULL,'5559032477',NULL,NULL,'Si, 21 , 18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(128,'María Adela Hernández De Jesús',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5528951249',NULL,NULL,'Si, 23, 19 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(129,'María Antonia Herrera Rivera',NULL,'1977-09-01','45',2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7223561243',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(130,'María Cruz Mondragón Andrés',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7228896441',NULL,NULL,'Si, 1 Año 6 Meses',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(131,'María De Jesús Arzate Guerrero',NULL,'1994-03-25','29',2,NULL,NULL,NULL,'Iztlahuaca',NULL,NULL,'7226717328',NULL,NULL,'Si, Tiene 2 Hijos',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(132,'María De La Luz Romero Bonifacio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2331115457',NULL,NULL,'Si, 17,7, 5 Años',NULL,NULL,NULL,NULL,' ',6,NULL,'2023-05-18 15:03:32','2023-05-18 15:03:32'),(133,'María De Los Ángeles Enríquez Perucho',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Miguel Hidalgo',NULL,NULL,'5584161014',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(134,'María De Los Ángeles Torales Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huitzilac',NULL,NULL,'5531350714',NULL,NULL,'Si, 17,15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(135,'María Del Carmen Pérez Villareal',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7293762430',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(136,'María Del Carmen Trejo Maqueda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Coyoacan',NULL,NULL,'5543621203',NULL,NULL,'Si, 23 Años',NULL,NULL,NULL,NULL,' ',5,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(137,'María Del Carmen Urbina Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5562198189',NULL,NULL,'Si, 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(138,'María Esmerada Cruz Rojas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'3951209651',NULL,NULL,'Si,3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(139,'María Esthela Esteban Mateo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Miguel Hidalgo',NULL,NULL,'5566897137',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(140,'María Eugenia Dávila Rubio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'7221079378',NULL,NULL,'Si, 24, 23, 20 Y 1 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(141,'María Eva Gutiérrez Guevara',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Los Reyes De La Paz',NULL,NULL,'5623960754',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:33','2023-05-18 15:03:33'),(142,'María Fernanda Bernal Rodríguez',NULL,'1998-01-14','25',2,NULL,NULL,NULL,'Villa De Allende',NULL,NULL,'5630602795',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(143,'Alejandra Martínez Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Luis Tlaxialtemalco',NULL,NULL,'5545825142',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(144,'María Guadalupe Ordoñez Diaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'7226105940',NULL,NULL,'Si, 9 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(145,'María Guadalupe Rodríguez Ramírez',NULL,'1968-05-06','55',2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5515738412',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(146,'María Inés Romero Hinojosa',NULL,'1972-05-23','50',2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5544604532',NULL,NULL,'Si, 25,23 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(147,'María Isabel Ortega Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Bonito San Vicente',NULL,NULL,'5578930389',NULL,NULL,'Si,19,18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(148,'María Juana Cayetano Sánchez',NULL,'1977-03-05','46',2,NULL,NULL,NULL,'San Felipe Del Progreso',NULL,NULL,'5539265161',NULL,NULL,'Si, 25,23,21 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(149,'María Juquilita Delgado Estrada',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Magdalena Contreras',NULL,NULL,'5558265180',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(150,'Nadia Vargas Arias',NULL,'1998-09-06','24',2,NULL,NULL,NULL,'Santo Domingo Del Rio',NULL,NULL,'2871391915',NULL,NULL,'Si, 2,1 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:34','2023-05-18 15:03:34'),(151,'María Santos Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(152,'María Sixta Hernández Mendoza',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5574955091',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(153,'Mariana Hernández Molina',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Teoloyucan',NULL,NULL,'5580360270',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(154,'Maribel Alejandre Piña',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5518462405',NULL,NULL,'Si, 27 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(155,'Maribel Cortes Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'7293195781',NULL,NULL,'Si, 15 Años',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(156,'Maribel De Jesús Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atlocomulco',NULL,NULL,'5525650302',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(157,'Maribel Lázaro Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlalpan',NULL,NULL,'5626801031',NULL,NULL,'Si,21,17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(158,'Maribel Mancilla De Jesús',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2311517999',NULL,NULL,'Si, 23,20,18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:35','2023-05-18 15:03:35'),(159,'Maricarmen Mora De Jesús',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nezahualcoyotl',NULL,NULL,'5634710886',NULL,NULL,'Si, 8,7,2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(160,'Marilyn Flores Ruiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapala',NULL,NULL,'5579980745',NULL,NULL,'Si,7, 2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(161,'Marisol Martínez Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5630318963',NULL,NULL,'Si,18, 17, 16, 15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(162,'Marisol Soto Garduño',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5628126989',NULL,NULL,'Si,20, 18, 11 ,9',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(163,'Marlem Rangel Rangel',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7221768254',NULL,NULL,'Si, 1 Año 6 Meses',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(164,'Martha Imelda Rodríguez Rosas',NULL,'1982-11-03','40',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7222438984',NULL,NULL,'Si, 17, 14 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(165,'Martha Oliva Almaraz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tultitlan',NULL,NULL,'5520357605',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:36','2023-05-18 15:03:36'),(166,'Martha Patricia Sánchez Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5538013568',NULL,NULL,'Si, 7 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:37','2023-05-18 15:03:37'),(167,'Martha Yeredid Monsivaiz Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5635635726',NULL,NULL,'Si, 10 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:37','2023-05-18 15:03:37'),(168,'Maura Barro Peñaflor',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlalpan',NULL,NULL,'5615826977',NULL,NULL,'Si, 16,12, 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:38','2023-05-18 15:03:38'),(169,'Mayra Adareli Andrade Herrera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5584169261',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:38','2023-05-18 15:03:38'),(170,'Melanni Andrea Méndez Casas',NULL,'1996-05-13','27',2,NULL,NULL,NULL,'Cuautilan',NULL,NULL,'5526847977',NULL,NULL,'Si, 8, 3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(171,'Minerva Aparicio Alonso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5619344463',NULL,NULL,'Si, 23, 24 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(172,'Mirian García Sotelo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5529300072',NULL,NULL,'Si, 28,18,16 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(173,'Miriam Isabel Ortiz Ortiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'7131079714',NULL,NULL,'Si, 17, 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(174,'Mónica Caritina Bañuelos Téllez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5560465281',NULL,NULL,'Si, 22 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(175,'Montserrath Mondragón Hernández',NULL,'2003-08-13','19',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5630724311',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(176,'Nadia Ivette Miranda Miranda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Del Carbon',NULL,NULL,'5574088225',NULL,NULL,'1, 4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(177,'Nancy Cesáreo López',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santo Domingo De Guzman',NULL,NULL,'5636887230',NULL,NULL,'Si,10, 9, 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:39','2023-05-18 15:03:39'),(178,'Nancy Ivette García Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5538982071',NULL,NULL,'Si, 12,6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(179,'Nancy Nohemi Salgado Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juitepec',NULL,NULL,'7775222738',NULL,NULL,'Si,12 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(180,'Nancy Nohemí Sánchez Lizárraga',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5582082227',NULL,NULL,'Si,10,6,4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(181,'Nancy Segundo Acevedo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'5578900102',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(182,'Nayeli Hernández Lira',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuauhtemoc',NULL,NULL,'2731280128',NULL,NULL,'Si, 5 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(183,'Nayeli Nicolás Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Gustavo A. Madero',NULL,NULL,'5586697250',NULL,NULL,'Si, 6 , 2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(184,'Nayeli Yatzareth Carmona López',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5610514698',NULL,NULL,'Si,27,14 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:40','2023-05-18 15:03:40'),(185,'Nieves García Ledesma',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5634083906',NULL,NULL,'Si,22,20,18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(186,'Noemi Miranda Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Texcoco',NULL,NULL,'5951155626',NULL,NULL,'Si,17,12 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(187,'Noemi Sánchez Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Texcoco',NULL,NULL,'5525436841',NULL,NULL,'Si, 22,21,20 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(188,'Olga Lidia López Aceves',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5534481076',NULL,NULL,'Si,22,21,18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(189,'Olivia Carmona Feliciano',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Juan Zumpango',NULL,NULL,'5546957796',NULL,NULL,'Si, 23,22,13 Años',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(190,'Olivia Luna Pozos',NULL,'1993-11-13','29',2,NULL,NULL,NULL,'Yaonahuac',NULL,NULL,'2225065943',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(191,'Olivia Rosas Rosas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7221868050',NULL,NULL,'Si, 7 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:41','2023-05-18 15:03:41'),(192,'Pascuala Encarnación Vázquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5615372463',NULL,NULL,'Si, 26,20 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(193,'Petra Piña Garduño',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'5578930389',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(194,'Rebeca Dolores Rico Romero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5524928860',NULL,NULL,'Si, 12,9 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(195,'Remedios Medina Sánchez',NULL,'1983-09-08','39',2,NULL,NULL,NULL,'Tecamac',NULL,NULL,'7716291142',NULL,NULL,'Si,23, 19, 18 ,11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(196,'Reynalda Pérez Varela',NULL,'1973-05-07','50',2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5537266016',NULL,NULL,'Si, 19,17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(197,'Rocío Camacho González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5580356394',NULL,NULL,'Si, 16,17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(198,'Rocío Lozada Ángel',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Texmelucan',NULL,NULL,'2311200921',NULL,NULL,'Si, 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:42','2023-05-18 15:03:42'),(199,'Rocío Martínez Rangel',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7295915148',NULL,NULL,'Si, 1 Año',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(200,'Rocío Solís Domínguez',NULL,'1997-03-25','26',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7295943507',NULL,NULL,'Si,7 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(201,'Rosa Elena Ramos Córdoba',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5562478417',NULL,NULL,'Si,19 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(202,'Rosalba Cortes Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuernavaca',NULL,NULL,'7772525999',NULL,NULL,'Si,27, 25, 17 Años',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(203,'Rosalba Olmos Solis',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'7296465669',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Se Coloco El 31 De Enero 2023 Con La Sra. Maria José',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(204,'Rosalva Torres Téllez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juquipilco',NULL,NULL,'712222876',NULL,NULL,'Si,29,23,14 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(205,'Rosaura Arzate Ángeles',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juquipilco',NULL,NULL,'7227919986',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:43','2023-05-18 15:03:43'),(206,'Rubí Angelica Mondragón Díaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5518953689',NULL,NULL,'Si, 19, 14 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(207,'Sandra Cristina Zúñiga Gálvez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Juitepec',NULL,NULL,'3223096113',NULL,NULL,'Si, 3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(208,'Sandra Laura Gamero Hernández',NULL,'1984-09-25','38',2,NULL,NULL,NULL,'Isidro Fabela',NULL,NULL,'5630369716',NULL,NULL,'Si, 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(209,'Sandra Selene Álvarez Medina',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5581790352',NULL,NULL,'Si, 15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(210,'Sara Díaz Beristain',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Estado De Hidalgo',NULL,NULL,'7717262744',NULL,NULL,'Si, 29,27,18, 16 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(211,'Sara Islas Ortega',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villas De San Jose',NULL,NULL,'5516251896',NULL,NULL,'Si, 32, 27 Años',NULL,NULL,NULL,NULL,' ',3,NULL,'2023-05-18 15:03:44','2023-05-18 15:03:44'),(212,'Saraí Mateos Santos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Hueyapan',NULL,NULL,'2311458390',NULL,NULL,'Si, 5 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(213,'Silvia Mayen Yáñez García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chimalhuacan',NULL,NULL,'5532999265',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(214,'Susana Morales Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuernavaca',NULL,NULL,'7773029664',NULL,NULL,'Si, 27,19 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(215,'Susana Reyes Agapito',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5614020649',NULL,NULL,'Si,25,23,20,17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(216,'Telvina Sacamitzin Nonal',NULL,'1975-08-26','47',2,NULL,NULL,NULL,'Iztlahuacan',NULL,NULL,'5523147092',NULL,NULL,'Si,28, 22 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(217,'Teresa Cruz Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5532903904',NULL,NULL,'Si,32,31,23 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:45','2023-05-18 15:03:45'),(218,'Vanessa Rojas Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5571682879',NULL,NULL,'Si, 12 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(219,'Verónica Hernández Gabriel',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chimalhuacan',NULL,NULL,'5574174660',NULL,NULL,'Si,23 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(220,'Verónica Barrios García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Del Carbon',NULL,NULL,'7228455793',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(221,'Verónica García Romero',NULL,'1975-11-01','47',2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5632918422',NULL,NULL,'Si,28,15,14 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(222,'Viviana Castañeda Linares',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Oaxaca',NULL,NULL,'2381982467',NULL,NULL,'Si, 5 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(223,'Yajaira Cristina Benavides Llanos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5573564179',NULL,NULL,'Si,22,8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(224,'Yautzin Gallegos Figueroa',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5573378677',NULL,NULL,'Si, 7 , 3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:46','2023-05-18 15:03:46'),(225,'Yeni Ivette Medrano Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5562091058',NULL,NULL,'Si, 21,19,15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(226,'Yesenia Salvador Díaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7121972527',NULL,NULL,'Si, 1 Año',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(227,'Yessenia García Rosadas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Michoacan',NULL,NULL,'7861653119',NULL,NULL,'Si, 19,17,15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(228,'Yolanda Ramos Arciniega',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5518873056',NULL,NULL,'Si,34,20,17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(229,'Yolanda Villarreal Domínguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Felipe Del Progreso',NULL,NULL,'5532423101',NULL,NULL,'Si,24, 23,18, 11, 3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(230,'Yoselin Juárez Zamora',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5517815403',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:47','2023-05-18 15:03:47'),(231,'Yrely Montiel Colin',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'7122192546',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(232,'Yuritzi Aranda Emiliano',NULL,'2002-09-12','20',2,NULL,NULL,NULL,'Villa De Allende',NULL,NULL,'5610974389',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(233,'Zaira Arauz Sánchez',NULL,'1997-02-15','26',2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5554303260',NULL,NULL,'Si,4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(234,'Zita Castañeda Garrido',NULL,'1960-04-27','63',2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5636516040',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(235,'Alma Zuñiga Gerardo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nezahualcóyotl',NULL,NULL,'5613302987',NULL,NULL,'Si 1 Hijo 12 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(236,'Jessica Gutiérrez González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Benito Juarez, Naucalpan',NULL,NULL,'5619017580',NULL,NULL,'2 Niñas De 9 Y 3 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:48','2023-05-18 15:03:48'),(237,'Laura Ruiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5616534143',NULL,NULL,'4 Hijos (El + Chico De 9)',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(238,'Nayeli Nicolás Cruz',NULL,'1996-08-30','26',2,NULL,NULL,NULL,'Carlos Orellana Mz 50 Lt 3B Col Parque Metropolitano Gustavo A Madero',NULL,NULL,NULL,NULL,NULL,'Sí, 6 Y 2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(239,'Abigail Moreno Urbina',NULL,'1994-09-04','28',2,NULL,NULL,NULL,'Ecatepec De Morelos',NULL,NULL,'5534478082',NULL,NULL,'Sí , 6 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(240,'Adela Ortega Lovera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztacalco',NULL,NULL,'5552149232',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(241,'Adriana Hernández Olague',NULL,'1974-02-21','49',2,NULL,NULL,NULL,'Bosques De Ecatepec',NULL,NULL,'5533610205',NULL,NULL,'Sí, 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(242,'Alejandra Martínez Martínez',NULL,'2000-11-22','22',2,NULL,NULL,NULL,'Gam',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(243,'Angélica Bello Rosas',NULL,'1984-11-02','38',2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5520088898',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:49','2023-05-18 15:03:49'),(244,'Beatriz Aide Sánchez Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa Uam',NULL,NULL,'5635287382',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(245,'Berenice Cervantes Corona',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Llano Grande',NULL,NULL,NULL,NULL,NULL,'Sí, 19, 17, 15 Y 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(246,'Blanca Estela Granados Benitez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Álvaro Obregón',NULL,NULL,NULL,NULL,NULL,'Sí, 26 Y 24 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(247,'Carmen Mendoza Jara',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Isidro Ixhuatepec Tlanepantla',NULL,NULL,NULL,NULL,NULL,'4 Hijos Edades 31 25 24 22',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(248,'Clara Emilia Macedo Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Foviste Las Águilas Calle Asentamientos Humanos',NULL,NULL,NULL,NULL,NULL,'Sí, 21, 19 Y 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(249,'Clara Ramirez Miranda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,NULL,NULL,NULL,'Sí, Si 23 20 14 Y 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:50','2023-05-18 15:03:50'),(250,'Claudia Barrera Ramirez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Sur 111 Man, 30 Lote 14, Colonia Juventino Rosas',NULL,NULL,NULL,NULL,NULL,'Sí, 33,30,29Y 25 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(251,'Elizabeth Clemente Bravo',NULL,'1977-05-27','45',2,NULL,NULL,NULL,'Ixtapaluca',NULL,NULL,'5531540305',NULL,NULL,'Sí, 22, 25 Y 26',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(252,'Esmeralda Cruz Diaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,NULL,NULL,NULL,'Sí, 18, 17, 8, Y 4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(253,'Estela Monterrosa Santiago',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Andres Totoltepec',NULL,NULL,NULL,NULL,NULL,'Sí, 19 Y 18 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(254,'Fabiola Lagos Olivera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztacalco',NULL,NULL,'5626332339',NULL,NULL,'Sí 11 Y 9 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(255,'Gabriela Garduño Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Estado De Mexico',NULL,NULL,'5617680175',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:51','2023-05-18 15:03:51'),(256,'Gabriela Sánchez Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'La Magdalena Chichicaspa Huixquilucan',NULL,NULL,NULL,NULL,NULL,'Sí, 18 Y 13 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(257,'Graciela Jimenez Gonzalez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Años Calle Jerusalén #33 Col.Los Padres',NULL,NULL,NULL,NULL,NULL,'Sí, 30 Y 38 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(258,'Guadalupe Jiménez López',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5614806327',NULL,NULL,'Sí, 3 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(259,'Guadalupe Nallely Yaiz Arrellano Huerta',NULL,'1987-12-11','35',2,NULL,NULL,NULL,'Azcapotzalco',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(260,'Inés Cortés Rivas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Xochimilco Col Ampliación Nativitas La Joya',NULL,NULL,NULL,NULL,NULL,'Sí, 26 Años',NULL,NULL,NULL,NULL,'Duro 8 Años Trabajando, Es Una Persona Trabajadora, Formal Y Un Buen Elemento',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(261,'Joselyn Cabrera Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztacalco',NULL,NULL,'5580252282',NULL,NULL,'Sí, 12 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:52','2023-05-18 15:03:52'),(262,'Laura Paredes Diaz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Calle Tizimín Mz 202 Lote 1 Col Pedregal De San Nicolás',NULL,NULL,NULL,NULL,NULL,'Sí, 29 Y 31 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:53','2023-05-18 15:03:53'),(263,'Leticia Rocío Jimenéz Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Colonia 20 De Noviembre Calle Ceramika#128',NULL,NULL,'5624324855',NULL,NULL,'Sí, 13, 15,17,20,23',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:53','2023-05-18 15:03:53'),(264,'Lorena Martinez Viviano',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Gregorio Alcaldia Xochimilco',NULL,NULL,'5574507274',NULL,NULL,'Sí, 15 Y 10 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:53','2023-05-18 15:03:53'),(265,'Margarita Renne Lara Olivares',NULL,'1985-04-22','38',2,NULL,NULL,NULL,'Naucalpan',NULL,NULL,'5617311608',NULL,NULL,'Sí, 16 Y 9 Años',NULL,NULL,NULL,NULL,'Margarita Trabajo Con Él Poco Más De Un Año, Era Responsable, Puntual',2,NULL,'2023-05-18 15:03:53','2023-05-18 15:03:53'),(266,'María Fernanda González Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naucalpan',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(267,'Maria Guadalupe Mayen Artega',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Sí, 22, 24 Y 27 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(268,'María Guadalupe Rodríguez Ramírez',NULL,'1968-05-06','55',2,NULL,NULL,NULL,'Ignacio Ramírez Mz12 Lt30',NULL,NULL,'5515738412',NULL,NULL,'Sí, Mayores',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(269,'Maria Inés Romero Hinojosa',NULL,'1972-05-23','50',2,NULL,NULL,NULL,'Desierto De Sind M7,L5,Col. Tetlalpan Sta. Lucía',NULL,NULL,'5544604532',NULL,NULL,'Sí, 23 Y 25 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(270,'Mariana Sánchez Cruz',NULL,'2001-04-14','22',2,NULL,NULL,NULL,'Observatoria',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(271,'Marina Granados Benito',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan De Zaragoza Ampliación Emiliano Zapata',NULL,NULL,'5544859273',NULL,NULL,'Sí, 16,8,6Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:54','2023-05-18 15:03:54'),(272,'Marisol Platero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Sí, 17,13 Y 12 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(273,'Minerva Aparicio Alonso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,NULL,NULL,NULL,'Sí, 26 Y 22 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(274,'Miriam Isabel Ortiz Ortiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,NULL,NULL,NULL,'Sí 16 Y 5 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(275,'Monica Caritina Bañuelos Téllez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Fco I Madero # 10 Col Bosque De Los Remedios Naucalpan',NULL,NULL,'5560465281',NULL,NULL,'Sí, 22 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(276,'Rosa María Romero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolás Romero Col.Sanjuan Tlihuca',NULL,NULL,NULL,NULL,NULL,'Sí, 10, 6 Y 2Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(277,'Viridiana Jiménez Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Colonia Tierra Y Libertad',NULL,NULL,NULL,NULL,NULL,'Sí, 9 Y 7 Años',NULL,NULL,NULL,NULL,'La Sra. Paola Dice Que Quien A Trabajado Con Ella Es La Hermana De Viridiana',1,NULL,'2023-05-18 15:03:55','2023-05-18 15:03:55'),(278,'Dulce Cristina Celis Canela',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Azcapotzalco En La Colonia Victoria De Las Democracias',NULL,NULL,'5621811730',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:56','2023-05-18 15:03:56'),(279,'Alibna Quisehuatl Rodriguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5523281077',NULL,NULL,'Grandes Y Casados',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:56','2023-05-18 15:03:56'),(280,'Aurora Plata Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,NULL,NULL,NULL,'Si, 3 Hijos',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:56','2023-05-18 15:03:56'),(281,'Bárbara González Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Magdalena De Las Salinas/ Privada Emperador M 1 L 23 Ermitaño',NULL,NULL,'5530592054',NULL,NULL,'Grandes Con Licenciatura',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:56','2023-05-18 15:03:56'),(282,'Brenda Medina Sanchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tecamac, México',NULL,NULL,'5566007653',NULL,NULL,'1 Hija',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:56','2023-05-18 15:03:56'),(283,'Cristina Albino Reyes',NULL,'1978-04-28','45',2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5562875096',NULL,NULL,'Grandes Y Casados',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(284,'Elizabeth Gracía Velázquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,NULL,NULL,NULL,'Si 1 Hijo De 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(285,'Elodia De Jesús Contreras',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7122475220',NULL,NULL,'Si 2 Niños De 4 Y 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(286,'Hilary Daniela Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Temascalcingo',NULL,NULL,'7774771144',NULL,NULL,'Si, 1 Hija De 1 Año',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(287,'Maria Magdalena Mejia Santiago',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ecatepec',NULL,NULL,'5625818764',NULL,NULL,'Si, 1 Hija De 28 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(288,'Mercedes Mendoza Moreno',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Chiapa, Puebla',NULL,NULL,'5515116437',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:57','2023-05-18 15:03:57'),(289,'Mireya Jimenez Rivera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca, México',NULL,NULL,'7122990543',NULL,NULL,'Si',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:03:58','2023-05-18 15:03:58'),(290,'Ahiveth Juárez Cruz',NULL,'2003-07-21','19',2,NULL,NULL,NULL,'Toluca',NULL,NULL,'5518244299',NULL,NULL,'No',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:58','2023-05-18 15:03:58'),(291,'Alexa Medina Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tecamac',NULL,NULL,'5627721356',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:58','2023-05-18 15:03:58'),(292,'Alicia Mondragón Andrés',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,NULL,NULL,NULL,'Sí, 3 Y 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:58','2023-05-18 15:03:58'),(293,'Ana Belén Ambrocio Marcial',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Mina Vieja (Municipio De Villa Victoria)',NULL,NULL,'7123138632',NULL,NULL,'Sí, 2 Y 5 Años',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:03:58','2023-05-18 15:03:58'),(294,'Ana Jaquelin Gonzales Garcia',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Del Rincon',NULL,NULL,'7122254707',NULL,NULL,'Sí, 4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:59','2023-05-18 15:03:59'),(295,'Ana Karen Vazquez Godinez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Palo Solo/Huixquilucan',NULL,NULL,'5616059783',NULL,NULL,'No',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:59','2023-05-18 15:03:59'),(296,'Ana Paula Cmpos Pablo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'5518568752',NULL,NULL,'Si',NULL,NULL,NULL,4,' ',2,NULL,'2023-05-18 15:03:59','2023-05-18 15:03:59'),(297,'Anaí Angeles Arzate',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Jiquipilco Manzana 3Ra',NULL,NULL,'7121695154',NULL,NULL,'No',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:03:59','2023-05-18 15:03:59'),(298,'Angelina Pineda Mejia',NULL,'1979-10-01','43',2,NULL,NULL,NULL,'Ixtahucla',NULL,NULL,'7122788894',NULL,NULL,'Sí, 21 Y 15',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:03:59','2023-05-18 15:03:59'),(299,'Antonia Estrada Guzmán',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Estado De Mexico',NULL,NULL,'7151311792',NULL,NULL,'Sí, Casados Y Estudiantes',NULL,NULL,NULL,NULL,' ',3,NULL,'2023-05-18 15:04:00','2023-05-18 15:04:00'),(300,'Araceli Santiago Montero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ciudad Serdán',NULL,NULL,'2451464175',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:00','2023-05-18 15:04:00'),(301,'Azucena Rosas Domínguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria Mesa Del Espinal',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:00','2023-05-18 15:04:00'),(302,'Benigna (Vane) Hernandez Mateo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Puebla',NULL,NULL,'5574709170',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:00','2023-05-18 15:04:00'),(303,'Bernarda Marial García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5613834168',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:00','2023-05-18 15:04:00'),(304,'Briceidy Téllez Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:01','2023-05-18 15:04:01'),(305,'Carolina Amaya Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ciudad Mante',NULL,NULL,NULL,NULL,NULL,'Sí, 6 Años',NULL,NULL,NULL,NULL,' ',3,NULL,'2023-05-18 15:04:01','2023-05-18 15:04:01'),(306,'Clara Abigail Rangel Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'El Espinal Villa Victoria',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:01','2023-05-18 15:04:01'),(307,'Claudia Galindo Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Españita Tlaxcala',NULL,NULL,NULL,NULL,NULL,'Sí, 26 Años',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:01','2023-05-18 15:04:01'),(308,'Daniela Mora Elizalde',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Los Lobo 2°Sección Municipio San José Del Rincón',NULL,NULL,NULL,NULL,NULL,'Sí, 3 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:01','2023-05-18 15:04:01'),(309,'Diana Angeles Demetrio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Francisco De Guzmán Ixtlahuaca',NULL,NULL,'7224121183',NULL,NULL,'Sí. 15,12,11 Años',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:02','2023-05-18 15:04:02'),(310,'Diana Marlen Garcia Primero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Lomas , Chamizal Cuajimalpa',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:02','2023-05-18 15:04:02'),(311,'Emma Durán Flores',NULL,'1979-06-04','43',2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7228343041',NULL,NULL,'Sí, 15 Años',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:02','2023-05-18 15:04:02'),(312,'Emma Zamora Montero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuautemapan Puebla',NULL,NULL,'2222651024',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:02','2023-05-18 15:04:02'),(313,'Esperanza Reyes Anselmo',NULL,'1996-01-19','27',2,NULL,NULL,NULL,'San José Del Rincon',NULL,NULL,'7122163781',NULL,NULL,'Sí, 5 Años',NULL,NULL,NULL,NULL,'Es Responsable Y Hacia Las Cosas Cuando Se Le Pedían, Estaba De Planta Cada 15 Dias, Duro Un Año',1,NULL,'2023-05-18 15:04:02','2023-05-18 15:04:02'),(314,'Esthela Santos Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huizache San José Del Rincón',NULL,NULL,'7121622344',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Muy Buena Chica, Acomedida Y Obedece Cuando Se Le Piden Las Cosas, Le Gusta Aprender Y Tiene Disposición',1,NULL,'2023-05-18 15:04:03','2023-05-18 15:04:03'),(315,'Fabiola Gerardo Velarde',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Vicente Chicoloapan',NULL,NULL,'5517426479',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:03','2023-05-18 15:04:03'),(316,'Gabriela Hernández Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Del Rincón',NULL,NULL,'5511469428',NULL,NULL,'Sí, 5 Años',NULL,NULL,NULL,NULL,'En Mi Casa Se Encargaba De La Limpieza, Es Buena Chica, De Buen Caracter, Muy Sociabe, Buena Persona',1,NULL,'2023-05-18 15:04:03','2023-05-18 15:04:03'),(317,'Graciela Artega Quintana',NULL,'1993-10-09','29',2,NULL,NULL,NULL,'Fresno',NULL,NULL,'7121776905',NULL,NULL,'Sí, 8 Y 10 Años',NULL,NULL,NULL,1,'No La Recomiendo Porque Cuando Se Fue Me Faltaron Cosas',1,NULL,'2023-05-18 15:04:03','2023-05-18 15:04:03'),(318,'Hortencia Martínez García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santa Cruz Teoloyucan',NULL,NULL,'4433613408',NULL,NULL,'Sí, 6,34,32 30 Y 14 Años',NULL,NULL,NULL,NULL,' ',6,NULL,'2023-05-18 15:04:03','2023-05-18 15:04:03'),(319,'Juana Fernandez Luna',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac Puebla',NULL,NULL,NULL,NULL,NULL,'Sí, 20,17,15 Y 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:04','2023-05-18 15:04:04'),(320,'Juana Trinidad Silverio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Mazatonal Yaonalhual, Puebla',NULL,NULL,'5535551764',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:04','2023-05-18 15:04:04'),(321,'Juana Trinidad Vigueras',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Héroes De Tecamac',NULL,NULL,'5571761829',NULL,NULL,'Sí, 24 Y 22 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:04','2023-05-18 15:04:04'),(322,'Laura Fernanda Baltazar López',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Jaltepec Barrio El Llano Grande',NULL,NULL,'7121685230',NULL,NULL,'Sí, 10 Y 2 Años',NULL,NULL,NULL,4,' ',4,NULL,'2023-05-18 15:04:04','2023-05-18 15:04:04'),(323,'Laura Salazar Gonzáles',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Turizo Tercera Sección Perteneciente Villa Victoria',NULL,NULL,NULL,NULL,NULL,'Sí, 18, 16 Y 10 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:04','2023-05-18 15:04:04'),(324,'Leticia Vidauria Barbosa',NULL,'1993-05-31','29',2,NULL,NULL,NULL,'C Manuel Malpica 13',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:05','2023-05-18 15:04:05'),(325,'Luisa Fernanda Cabral Rueda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nezahualcóyotl',NULL,NULL,'5620104687',NULL,NULL,'Sí, 5 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:05','2023-05-18 15:04:05'),(326,'Maria Del Socorro Martínez Zúñiga',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'El Salado',NULL,NULL,NULL,NULL,NULL,'Sí, 26 Años',NULL,NULL,NULL,NULL,'Margarita Trabajo Con Ella Un Año Pero Solo Iba Una O Dos Veces A La Semana Hacía Bien La Limpieza',1,NULL,'2023-05-18 15:04:05','2023-05-18 15:04:05'),(327,'Maria Francisco Aguilar',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santa María Tixmadejé Acambay Estado De México',NULL,NULL,NULL,NULL,NULL,'Sí, 14 Y 15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:05','2023-05-18 15:04:05'),(328,'Maria Santao Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Del Rincón',NULL,NULL,'5573728405',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Trabajo 8 Meses Conmigo, Es Una Chica Excelente, Nunca Tuve Problemas Con Ella, Es Responsable Y De Confianza',1,NULL,'2023-05-18 15:04:05','2023-05-18 15:04:05'),(329,'Mariana',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Palo Solo Celco',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:06','2023-05-18 15:04:06'),(330,'Maribel Cruz De Jesus',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,NULL,NULL,NULL,'Sí, 12 Y 11 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:06','2023-05-18 15:04:06'),(331,'Maribel Sánchez Resendiz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Edomex',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:06','2023-05-18 15:04:06'),(332,'Mariel Flores Marcelino',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Perote Veracruz,',NULL,NULL,NULL,NULL,NULL,'Sí, Tres',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:06','2023-05-18 15:04:06'),(333,'Maritza Bernal Mondragón',NULL,'2000-09-17','22',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:06','2023-05-18 15:04:06'),(334,'Marlen Marcelo Segundo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Del Rincon',NULL,NULL,'7122269363',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:07','2023-05-18 15:04:07'),(335,'Miriam Edith Zepeda Zepeda',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtahuaca',NULL,NULL,'7122803016',NULL,NULL,'Si',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:04:07','2023-05-18 15:04:07'),(336,'Mónica Ibeth José Clemente',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:08','2023-05-18 15:04:08'),(337,'Nancy Fuentes Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tequixquiac',NULL,NULL,'5513671388',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:08','2023-05-18 15:04:08'),(338,'Nancy Segundo Acevedo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincón',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,'Excelente, Duro Conmigo Un Años, Es Una Chica Muy Buena',1,NULL,'2023-05-18 15:04:08','2023-05-18 15:04:08'),(339,'Norma Martínez Dionicio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'5545780906',NULL,NULL,'Sí, 4 Hijos',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:04:09','2023-05-18 15:04:09'),(340,'Ofelia Reyes Gaspar',NULL,'1996-12-18','26',2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,NULL,NULL,NULL,'Sí, 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:09','2023-05-18 15:04:09'),(341,'Perfecta Bibiana Leal',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Santiago Yaonahuac',NULL,NULL,'4433927261',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:09','2023-05-18 15:04:09'),(342,'Raymunda Sánchez Elizalde',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San José Del Rincón',NULL,NULL,'5562101746',NULL,NULL,'Sí, 6 Años',NULL,NULL,NULL,NULL,'Trabajo Con Ella Más De 5 Años,Fue Muy Cumplida, Puntual,  Raymunda Es Honesta, Trabajadora, Y Es Recomendable',1,NULL,'2023-05-18 15:04:09','2023-05-18 15:04:09'),(343,'Remedios Medina Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5583534220',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',2,NULL,'2023-05-18 15:04:09','2023-05-18 15:04:09'),(344,'Reynalda Pérez Varela',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chichicaspa Huixquilucan',NULL,NULL,'5537266016',NULL,NULL,'Sí, 19 Y 17 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:10','2023-05-18 15:04:10'),(345,'Rocío Clemente Abraham',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Altotonga',NULL,NULL,'2261002667',NULL,NULL,'Sí, 1 Año',NULL,NULL,NULL,NULL,'Es Una Gran Persona, Altamente Recomendable',1,NULL,'2023-05-18 15:04:10','2023-05-18 15:04:10'),(346,'Rosa Angelica Abarca Vazquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chilapa De Alvarez Guerrero',NULL,NULL,'7561113389',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:10','2023-05-18 15:04:10'),(347,'Rosaura Arzate Angeles',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7227919986',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:10','2023-05-18 15:04:10'),(348,'Sherlyn Yuriel Salmerón Hernandez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Jiquipilco',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:11','2023-05-18 15:04:11'),(349,'Tailin Martínez Mendoza',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cuautitlán Izcalli',NULL,NULL,'5591059272',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:11','2023-05-18 15:04:11'),(350,'Veronica Nieto Solis',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlalpujahua',NULL,NULL,NULL,NULL,NULL,'Sí, 19 Años',NULL,NULL,NULL,NULL,'Vero Trabajo Con Nosotros 9 Años Y Se Comporto De Manera Honesta Y Con Un Trabajo De Buena Calidad',1,NULL,'2023-05-18 15:04:11','2023-05-18 15:04:11'),(351,'Yeni Lucila Ramírez Mora',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ciudad Serdan (Maravillas)',NULL,NULL,'5622014898',NULL,NULL,'Sí, 2 Años',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:04:11','2023-05-18 15:04:11'),(352,'Zeferina Cortes Portilla',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5548269424',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:11','2023-05-18 15:04:11'),(353,'Araceli López Robledo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucán',NULL,NULL,'2211026167',NULL,NULL,'Si 1 Hija De 2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:12','2023-05-18 15:04:12'),(354,'Alejandra Pérez Romero',NULL,'1982-09-19','40',2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5548167757',NULL,NULL,'Sí, 22.18.15',NULL,NULL,NULL,4,' ',1,NULL,'2023-05-18 15:04:12','2023-05-18 15:04:12'),(355,'Alejandra Sánchez Vilchis',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Toluca',NULL,NULL,'7121917398',NULL,NULL,'Sí, 23,20,19,18 Y 15',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:12','2023-05-18 15:04:12'),(356,'Anahi Lucero Ramírez Laureano',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5628178896',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:12','2023-05-18 15:04:12'),(357,'Beatriz Adrina López Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5511976899',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:12','2023-05-18 15:04:12'),(358,'Claudia Márquez Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5523082534',NULL,NULL,'Sí, 18 10 Y 9 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:13','2023-05-18 15:04:13'),(359,'Fany Arisbeth Cabrera Castillo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Si, 4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:13','2023-05-18 15:04:13'),(360,'Marcelina Hernández Mondragón',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5618139419',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:13','2023-05-18 15:04:13'),(361,'Maribel Cruz De Jesus',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5540296856',NULL,NULL,'Sí, 20, 18 Y 15 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:13','2023-05-18 15:04:13'),(362,'Maribel De Jesús Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5525650302',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:13','2023-05-18 15:04:13'),(363,'Martha Luna Macario',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5570879122',NULL,NULL,'Sí, 8 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:14','2023-05-18 15:04:14'),(364,'Ofelia Aguilra Moreno',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Sí, 18 Y 20 Años',NULL,NULL,NULL,NULL,'No La Recomienda',1,NULL,'2023-05-18 15:04:14','2023-05-18 15:04:14'),(365,'Aide Martinez Contreras',NULL,'1999-05-27','23',2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Sí, 4 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:14','2023-05-18 15:04:14'),(366,'Anahi Flores',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5569088364',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:14','2023-05-18 15:04:14'),(367,'Angelica Ramos Lozada',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:14','2023-05-18 15:04:14'),(368,'Apolonia Segundo Primero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'Sí, 9 Años',NULL,NULL,NULL,1,' ',1,NULL,'2023-05-18 15:04:15','2023-05-18 15:04:15'),(369,'Araceli Chávez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5540839008',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:15','2023-05-18 15:04:15'),(370,'Arianna González Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,'Trabaja De Entrada Por Salida 5 Horas Diarias Es Muy Buena, Súper Puntual, Es Muy Recomendable',1,NULL,'2023-05-18 15:04:15','2023-05-18 15:04:15'),(371,'Claudia Barrera Domínguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5584728443',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:15','2023-05-18 15:04:15'),(372,'Claudia Isabel Valerio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5530195326',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:15','2023-05-18 15:04:15'),(373,'Claudia Jocelin Zabaleta Benuville',NULL,'1986-07-13','36',2,NULL,NULL,NULL,'Azcapotzalco',NULL,NULL,'5628241771',NULL,NULL,'Sí, 16 Y 8 Años',NULL,NULL,NULL,NULL,' ',4,NULL,'2023-05-18 15:04:16','2023-05-18 15:04:16'),(374,'Daniela Monserrat Molina Trinidad',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5574362002',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:16','2023-05-18 15:04:16'),(375,'Elizabeth García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5579774366',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:16','2023-05-18 15:04:16'),(376,'Elizabeth García Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5533201281',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:16','2023-05-18 15:04:16'),(377,'Elizabeth González Tovar',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5565726768',NULL,NULL,'Sí, 7, 5 Y 6 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:17','2023-05-18 15:04:17'),(378,'Guillermina Ortega García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'7226822740',NULL,NULL,'Sí, 2 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:17','2023-05-18 15:04:17'),(379,'Hilda Seas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'2361312205',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:17','2023-05-18 15:04:17'),(380,'Isabel Hernández Manzano',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5528607845',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:17','2023-05-18 15:04:17'),(381,'Itzel Esquivel De La Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:17','2023-05-18 15:04:17'),(382,'Jocelin Amado López',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtlahuaca',NULL,NULL,'7123437684',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Trabajo Con Ella Un Año ,Es Una Persona Respetuosa, Se Enfoca En Su Trabajo Es Responsable Y Buena Persona',1,NULL,'2023-05-18 15:04:18','2023-05-18 15:04:18'),(383,'Joselyn Resendiz Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5525773894',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:18','2023-05-18 15:04:18'),(384,'Juana Lucia Valencia',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:18','2023-05-18 15:04:18'),(385,'Juana Rosales Fernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'2312072873',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:18','2023-05-18 15:04:18'),(386,'Karen Itzel Jeronimo Campos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'7122230293',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:19','2023-05-18 15:04:19'),(387,'Laura García',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:19','2023-05-18 15:04:19'),(388,'Maria Fernanda Tinajero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5574127605',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:19','2023-05-18 15:04:19'),(389,'Maria Francisco Aguilar',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixmadeje',NULL,NULL,NULL,NULL,NULL,'Sí, 15 Y 13 Años',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:19','2023-05-18 15:04:19'),(390,'Maria Selena Martínez Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5624198052',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:20','2023-05-18 15:04:20'),(391,'Mariela Serapio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'7123291185',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:20','2023-05-18 15:04:20'),(392,'Marisol Islas Morales',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:20','2023-05-18 15:04:20'),(393,'Nancy Huera Angeles',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:20','2023-05-18 15:04:20'),(394,'Ofelia Morales',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'5574906194',NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:20','2023-05-18 15:04:20'),(395,'Yuliana Esquivel Martínez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,NULL,NULL,' ',1,NULL,'2023-05-18 15:04:21','2023-05-18 15:04:21'),(396,'Susana Rodriguez Guaderrama',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5572131845',NULL,NULL,'Si, 26 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:21','2023-05-18 15:04:21'),(397,'Silvia Campos Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'5540336569',NULL,NULL,'Si, 18,17,16,14 Años',NULL,NULL,NULL,NULL,'No Disponible, Se Ocupo Antes',2,NULL,'2023-05-18 15:04:21','2023-05-18 15:04:21'),(398,'Maria Eugenia Sotelo Granados',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Paseos De San Miguel',NULL,NULL,'5548959646',NULL,NULL,'Si, 34 Años',NULL,NULL,NULL,NULL,'Disponible',2,NULL,'2023-05-18 15:04:21','2023-05-18 15:04:21'),(399,'Lizbeth Martínez Gutiérrez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5530714556',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:22','2023-05-18 15:04:22'),(400,'Magdalena Mejía Jiménez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5625284452',NULL,NULL,'Si, 14 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:22','2023-05-18 15:04:22'),(401,'Alicia Antonio Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Felipe Del Progreso',NULL,NULL,'3332404865',NULL,NULL,'Si, 21 Y 14 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:22','2023-05-18 15:04:22'),(402,'Cindy Madeline Zapot Balam',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5533455178',NULL,NULL,'Si, 24,20 Y 15 Años',NULL,NULL,NULL,NULL,'En Espera De Llamada',1,NULL,'2023-05-18 15:04:22','2023-05-18 15:04:22'),(403,'Claudia Galindo Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Tlaxcala',NULL,NULL,'2481772865',NULL,NULL,'Si, 27 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:23','2023-05-18 15:04:23'),(404,'Elsa Guadalupe De Román Pallares',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5632727947',NULL,NULL,'Si, 22, 19 Y 16 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:23','2023-05-18 15:04:23'),(405,'Félix Aguilar Gayosso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Puebla',NULL,NULL,'5544837503',NULL,NULL,'Si, 27, 25 ,23 ,18 Y 12 Años ',NULL,NULL,NULL,NULL,'Disponible',2,NULL,'2023-05-18 15:04:23','2023-05-18 15:04:23'),(406,'Itzel Yanet Hernández Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5526094431',NULL,NULL,'No',NULL,NULL,NULL,NULL,'En Espera De Llamada',1,NULL,'2023-05-18 15:04:23','2023-05-18 15:04:23'),(407,'Juanita Olivia Pulido Cordero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5554039993',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,'En Espera De Llamada',1,NULL,'2023-05-18 15:04:24','2023-05-18 15:04:24'),(408,'Lety Villarreal Gracida',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapala',NULL,NULL,'5564767050',NULL,NULL,'Si, 21 Y 10 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:24','2023-05-18 15:04:24'),(409,'Alicia Antonio Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Felipe Del Progreso',NULL,NULL,'7224209826',NULL,NULL,'Si, 17 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:24','2023-05-18 15:04:24'),(410,'Silvina Martínez Carrera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cosautlan',NULL,NULL,'2281611434',NULL,NULL,'Si, 35, 32 Y 29 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:24','2023-05-18 15:04:24'),(411,'Patricia Torres Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Alcaldia Miguel Hidalgo',NULL,NULL,'5522415725',NULL,NULL,'Si,32 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:25','2023-05-18 15:04:25'),(412,'Margarita Juárez Ramírez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5524026992',NULL,NULL,'Si, 40, 32, 31 Y 14 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:25','2023-05-18 15:04:25'),(413,'Anadela Rosas Olmos',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa Victoria',NULL,NULL,'8446113433',NULL,NULL,'Si, 2 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:25','2023-05-18 15:04:25'),(414,'Carlota Reyes Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Villa De Ayende ',NULL,NULL,'7293664809',NULL,NULL,'Si, 29, 26, 22, 19 Y 17 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:25','2023-05-18 15:04:25'),(415,'María De Lourdes Cruz Medina',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jose Del Rincon',NULL,NULL,'5521425565',NULL,NULL,'Si, 16, 10 Y 6 Años',NULL,NULL,NULL,NULL,'Disponible',2,NULL,'2023-05-18 15:04:26','2023-05-18 15:04:26'),(416,'Telvina Sacamitzin Nonal',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Iztapala',NULL,NULL,'5523147092',NULL,NULL,'Si, 28 Y 22 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:26','2023-05-18 15:04:26'),(417,'Lindia Tomas Urbano',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Juan Cotzocon',NULL,NULL,'5638098670',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:26','2023-05-18 15:04:26'),(418,'Leticia Sevilla Sevilla',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chimalhuacan',NULL,NULL,'5614695444',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:26','2023-05-18 15:04:26'),(419,'Norma Martinez Garcia',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Chalco',NULL,NULL,'5543729242',NULL,NULL,'Si, 29,30 Y 20 Años',NULL,NULL,NULL,NULL,'Entro 3 Dias De Prueba, Pero No Se Acoplo Clienta Joss',2,NULL,'2023-05-18 15:04:27','2023-05-18 15:04:27'),(420,'Maribel Alejandre Piña',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5518462405',NULL,NULL,'Si,27 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:27','2023-05-18 15:04:27'),(421,'Mariana Camacho Gonzalez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'La Magdalena Contreras',NULL,NULL,'5567439254',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible (Pone Muchos Peros)',1,NULL,'2023-05-18 15:04:27','2023-05-18 15:04:27'),(422,'Maria Jovita Mena Valdez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Chimalhuacan',NULL,NULL,'5518460783',NULL,NULL,'Si,30,24,22 Y 14 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:27','2023-05-18 15:04:27'),(423,'Maria Alejandra Nely Amador Islas',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Nicolas Romero',NULL,NULL,'5531241344',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Betada, Se Presento Con El Sr. Mateo Y Se Retiro El Mismo Dia',1,NULL,'2023-05-18 15:04:28','2023-05-18 15:04:28'),(424,'María Alberta Ríos Firo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtapaluca',NULL,NULL,'5644620574',NULL,NULL,'21,19 Y 15 Años',NULL,NULL,NULL,NULL,'Disponible Pero Pone Muchos Pero En Cuestion Del Sueldo, Y Elimino Documentos',1,NULL,'2023-05-18 15:04:28','2023-05-18 15:04:28'),(425,'Liliana Martinez Ramirez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ixtla',NULL,NULL,'7341108216',NULL,NULL,'Si, 26 Años',NULL,NULL,NULL,NULL,'Colocada, Se Presenta El Domingo 19/02/2023 Con La Sra. Olivia',1,NULL,'2023-05-18 15:04:28','2023-05-18 15:04:28'),(426,'Laura Gozález Lorenzo',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Atizapan',NULL,NULL,'5541445204',NULL,NULL,'Si,25 Y 24 Años',NULL,NULL,NULL,NULL,'No Disponible Ya',1,NULL,'2023-05-18 15:04:28','2023-05-18 15:04:28'),(427,'Guadalupe Polo Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Yaonahuac Puebla',NULL,NULL,'2311566089',NULL,NULL,'Si, 18,16,14 Años',NULL,NULL,NULL,NULL,'Disponible, Cada 15 Dias, Pero Sueldo Arriba De $2500',1,NULL,'2023-05-18 15:04:29','2023-05-18 15:04:29'),(428,'Gianelly Carrasco Gayosso',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Puebla',NULL,NULL,'7641132756',NULL,NULL,'Si, 22, 10 Años',NULL,NULL,NULL,NULL,'Colocada Entro El 8 De Febrero Con Gabriela Llorente',1,NULL,'2023-05-18 15:04:29','2023-05-18 15:04:29'),(429,'Erika Mendoza Guzman',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Lomas De Los Cedros',NULL,NULL,'5574031566',NULL,NULL,'Si,19 Y 15 Años',NULL,NULL,NULL,NULL,'Betada, Entraba El 16 De Febrero 2023 Con Marlene Cervantes Y No Llego',4,NULL,'2023-05-18 15:04:29','2023-05-18 15:04:29'),(430,'Elvia Juárez Estrada',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Benito Juarez Tlaxcala',NULL,NULL,'7481004897',NULL,NULL,'Si, 30,29,25 Años',NULL,NULL,NULL,NULL,'Entro El Lunes 13 De Febrero 2023 Con Clienta Fernanda',2,NULL,'2023-05-18 15:04:29','2023-05-18 15:04:29'),(431,'Angelica Téllez Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Coajomulco ',NULL,NULL,'7121836245',NULL,NULL,'Si, 12 Y 8 Años',NULL,NULL,NULL,NULL,'Disponible ',2,NULL,'2023-05-18 15:04:30','2023-05-18 15:04:30'),(432,'Elizabeth Nallely Alejo Méndez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Valle De Los Pinos',NULL,NULL,'5547811647',NULL,NULL,'Si, 12 Años',NULL,NULL,NULL,NULL,'Entro El Jueves 16 De Febrero 2023 Con Sra. Marlene Cervantes',1,NULL,'2023-05-18 15:04:30','2023-05-18 15:04:30'),(433,'Alma Elia Rodríguez Hernández',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Col. Simon Rivera','Tamaulipas',NULL,'8332838873',NULL,NULL,'Si, 24,23, 16',NULL,NULL,NULL,NULL,'No Contesto',1,NULL,'2023-05-18 15:04:30','2023-05-18 15:04:30'),(434,'María Dolores Collazo Reyes',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Fracc. Los Mangos','Tamaulipas',NULL,'8334458837',NULL,NULL,'Si, 13, 8 Años',NULL,NULL,NULL,NULL,'No Acepto La Oferta De La Vacante',6,NULL,'2023-05-18 15:04:30','2023-05-18 15:04:30'),(435,'Ada Del Carmen Diaz De León Osorio',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Calle Durango','Tamaulipas',NULL,'8333407433',NULL,NULL,'Si, 6, 3 Años',NULL,NULL,NULL,1,'Ocupada Con Contadora Angelica Bravo',2,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(436,'Adriana Del Carmen Ramos Munguía',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8333400282',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocupada Entro El 4 De Enero 2023 A Laborar',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(437,'Olga Lidia Benítez Velázquez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Fracc. Villas','Tamaulipas',NULL,'8992668170',NULL,NULL,'Si, 16, 12 Años',NULL,NULL,NULL,NULL,'No Contesto',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(438,'Pascuala Santiago De La Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Fracc. Tercer Milenium','Tamaulipas',NULL,'8333405002',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,'Betada (Se Presento, Se Fue Y Ya No Regreso)',4,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(439,'Perla Sujey Martínez González',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Col. Insurgentes','Tamaulipas',NULL,'8334372673',NULL,NULL,'Si, 13, 10 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(440,'Reyna Isabel Montes Pérez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Col. Enrique Cardenas','Tamaulipas',NULL,'8333402211',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,'No Acepto La Oferta De La Vacante',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(441,'Francisca Rodríguez Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Fracc. Jardines De Arboledas','Tamaulipas',NULL,'4444334997',NULL,NULL,'Si, 29,19,11 Años',NULL,NULL,NULL,NULL,'Disponible',4,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(442,'Lorena Elizabeth Hernández Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cd Madero','Tamaulipas',NULL,'8341153391',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(443,'Lubia Irene García Sánchez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Adolfo Lopez Mateos','Tamaulipas',NULL,'8331731679',NULL,NULL,'Si, 14, 10 Años',NULL,NULL,NULL,NULL,'No Acepto La Oferta De La Vacante',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(444,'María Cecilia Rodríguez Guerrero',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'San Jacinto','Tamaulipas',NULL,'8335328144',NULL,NULL,'Si, 16,14, 10 Años',NULL,NULL,NULL,NULL,'No Contesto, Elimino Todos Sus Documentos',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(445,'Rosaura Galván Rivera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Col. 16 De Septeimbre','Tamaulipas',NULL,'83311504891',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,NULL,'Betada (Se Presento, Se Fue Y Ya No Regreso)',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(446,'Guadalupe Ortiz Pérez',NULL,'1969-01-29','54',2,NULL,NULL,NULL,'Cd Madero','Tamaulipas',NULL,'8331205194',NULL,NULL,'Si,20, 16, 10 Años',NULL,NULL,NULL,NULL,'Disponible (Sabe Manejar Y Licencia Vigente)',3,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(447,'Cristina Tomás Reyes',NULL,'1965-03-22','58',2,NULL,NULL,NULL,'Santa Elena','Tamaulipas',NULL,'8333408079',NULL,NULL,'Si,17 Años',NULL,NULL,NULL,NULL,'Se Ocupo Antes',3,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(448,'Gloria María García Medrano',NULL,'1974-12-09','48',2,NULL,NULL,NULL,'Pueblo Viejo','Veracruz',NULL,'8332937761',NULL,NULL,'Si, 30,29,27 Años',NULL,NULL,NULL,1,'Se Coloco El Lunes 30 De Enero 2023',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(449,'Reyna Ramos Jimenez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cd Madero','Tamaulipas',NULL,'8332397654',NULL,NULL,'Si, Independientes',NULL,NULL,NULL,2,'Disponible',3,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(450,'Francisca Martinez Aragón',NULL,'1966-11-01','56',2,NULL,NULL,NULL,'Zona Centro','Tamaulipas',NULL,'8331289308',NULL,NULL,'Si, 5 Independientes',NULL,NULL,NULL,1,'Se Coloco  Lunes 6 De Febrero Con La Sra. Ana Cristina',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(451,'Gemma Ariana Victoria Avalos Sevilla',NULL,'1997-07-14','25',2,NULL,NULL,NULL,'Cd Madero','Tamaulipas',NULL,'8332929449',NULL,NULL,'Si, 8 Años Y 4 Meses',NULL,NULL,NULL,2,'En Espera',4,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(452,'María Luisa Ortega Olares',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ozuluama','Veracruz',NULL,'8334425399',NULL,NULL,'Si, 30, 25 Y 15 Años',NULL,NULL,NULL,2,'No Disponible Ya',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(453,'Martha Alicia Román Morales',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8331692186',NULL,NULL,'Si,13, 12 Y 3 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:04:31','2023-05-18 15:04:31'),(454,'Adriana Vázquez Cruz',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8180961221',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(455,'Jenifer Mendoza Ventura',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Ozuluama','Veracruz',NULL,'7681052491',NULL,NULL,'No',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(456,'Lorena Elizabeth Hernández Rodríguez',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Cd. Madero','Tamaulipas',NULL,NULL,NULL,NULL,'Si, 39,34,32 Años',NULL,NULL,NULL,2,'Disponible',1,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(457,'Lorenzo Hernández Vidal',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Germinal','Tamaulipas',NULL,'8335386541',NULL,NULL,' ',NULL,NULL,NULL,1,'Se Presenta Domingo 19/02/23 Casa Contadora Angie',NULL,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(458,'Martha Alvarado Rivera',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Col. Morelos','Tamaulipas',NULL,'8333019010',NULL,NULL,'Si,22, 18, 16 Y 10',NULL,NULL,NULL,1,'Betada Se Presento 1 Dia Y Al Siguiente No Fue',2,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(459,'Julia Sanchez Castillo',NULL,'1975-04-23','48',2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8451036099',NULL,NULL,'Si, 25,23,17 Años',NULL,NULL,NULL,1,'Disponible, En Lista De Espera',1,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(460,'Alicia Montoya López',NULL,'1973-06-23','49',2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8331420486',NULL,NULL,'Si,29 Y 26 Años',NULL,NULL,NULL,1,'Disponible, En Lista De Espera',1,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(461,'Estela Cruz Bautista',NULL,'2023-05-18',NULL,2,NULL,NULL,NULL,'Altamira','Tamaulipas',NULL,'8334517478',NULL,NULL,'Si, 32, 26, 20 Años',NULL,NULL,NULL,NULL,'Disponible',3,NULL,'2023-05-18 15:04:32','2023-05-18 15:04:32'),(462,'Nancy Lorena Ramos Rocha',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Alcaldia Cuauhtemoc',NULL,NULL,'5576842783',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Disponible, Particular Y Por Hora',1,NULL,'2023-05-19 14:59:26','2023-05-19 14:59:26'),(463,'Mery Ann Padilla Estrada',NULL,'2002-03-25','21',2,NULL,NULL,NULL,'San Miguel Teotonto',NULL,NULL,'5522779805',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Actualizar Sus Documentos',1,NULL,'2023-05-19 14:59:26','2023-05-19 14:59:26'),(464,'Alexa Sofía Jiménez Mejía',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Estado De Mexico Satelite',NULL,NULL,'5551436300',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocupada (Nana Con Visa)',1,NULL,'2023-05-19 14:59:26','2023-05-19 14:59:26'),(465,'Alicia Frías Ramos',NULL,'1987-11-29','35',2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5561404577',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Entro A Laborar El 4 De Julio 2022',1,NULL,'2023-05-19 14:59:26','2023-05-19 14:59:26'),(466,'Alicia Lucero Almeida De La Fuente',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Bosque De Aragon',NULL,NULL,'5546953358',NULL,NULL,'Si, 11 Y 4 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-19 14:59:26','2023-05-19 14:59:26'),(467,'Ana Patzimba Perdomo Zambrano',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Col. Benito Juarez',NULL,NULL,'5518526740',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Quedo Mal No Se Presento A Trabajar 3 Dines De Semana Seguidos',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(468,'Angélica López Vengas',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5521851128',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocacional',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(469,'Beatriz Servín Santiago',NULL,'1991-01-16','32',2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'2311576234',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocupada (Nana Domestica)',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(470,'Camila Paulina Hernández López',NULL,'2000-11-06','22',2,NULL,NULL,NULL,'Atizapan De Zaragosa',NULL,NULL,'5614475972',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Betada (No Se Presento)',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(471,'Diana Carolina González Espinosa',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Atlampa',NULL,NULL,'5510692615',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(472,'Diana Laura Sánchez Montiel',NULL,'1995-06-02','27',2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5521436125',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocacional',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(473,'Eréndira Claudio Peñaloza',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5583303950',NULL,NULL,'Si,20,16 Años',NULL,NULL,NULL,NULL,'Nana Ocacional',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(474,'Gahia Diaz Estrada',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5513317051',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocupada',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(475,'Gloria Yarelly Santiago Osorio',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5513310687',NULL,NULL,'Si, 2 Años',NULL,NULL,NULL,NULL,'(Ocacional Fines De Semana) Entra El Lunes 30 De Enero 2023 Con Paola Pacheco',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(476,'Irma Angélica Medina Saucedo',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Naulcalpan',NULL,NULL,'5620408765',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Nana Ocacional , Por Satelite',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(477,'Jessica Jazmín Pérez Felipe',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Margarita Maza De Juarez',NULL,NULL,'5566945898',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Entro A Laborar El 28 De Diciembre 2022 Con La Sra Lucia Ortiz',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(478,'Jesús Alejandro Puig',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Cdmx',NULL,NULL,'9563138909',NULL,NULL,'Si',NULL,NULL,NULL,NULL,'Esta En Usa. ',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(479,'Jhoanna Hernández Torres',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5619528979',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Betada (No Se Presento)',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(480,'Jocelyn Diaz Estrada',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Iztapalapa',NULL,NULL,'5545464071',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(481,'Julia Yunuen López Gallegos',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Alcaldia Gustavo A. Madero',NULL,NULL,'5541939325',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible (Nana Con Visa Y Ocacional)',1,NULL,'2023-05-19 14:59:27','2023-05-19 14:59:27'),(482,'Leslly Ayoky Ortiz López',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Tlaxcala',NULL,NULL,'5544866671',NULL,NULL,'Si, 8, 4 Años',NULL,NULL,NULL,NULL,'Nana Domestica (Ocupada)',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(483,'Libia Samara García Ramírez',NULL,'1982-12-12','40',2,NULL,NULL,NULL,'San Nicolas',NULL,NULL,'5617991113',NULL,NULL,'Si, 18,14 Años',NULL,NULL,NULL,NULL,'Ocupada',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(484,'Liliana Reyes Juárez',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5540861939',NULL,NULL,'Si, 9 Años',NULL,NULL,NULL,NULL,'Betada (Quedo Mal)',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(485,'Lizbeth Primero Segundo',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5564493842',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(486,'Edna León Peña',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Lomas De San Mateo',NULL,NULL,'5559816353',NULL,NULL,'Si,29, 22 Años',NULL,NULL,NULL,NULL,'Ocupada Con Sra Areli, Los Viernes. (Empezo El 13 De Enero)',2,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(487,'Guillermo Torres Fabila',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Cuajimalpa',NULL,NULL,'5578438808',NULL,NULL,'Si, 10,13 Años',NULL,NULL,NULL,NULL,'Ocupado (Empezo El 9 De Enero Con Perla Bosquera)',2,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(488,'Israel Ordoñez López',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5529866929',NULL,NULL,'Si, 6 Años',NULL,NULL,NULL,NULL,'Betado (Quedo Mal)',2,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(489,'María Fernanda Ortiz González',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5560459193',NULL,NULL,'Si, 7,6 Años',NULL,NULL,NULL,NULL,'Experiencia En Maternal Y Preescolar',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(490,'María José Licea García',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5619188283',NULL,NULL,'Si, 9 Años',NULL,NULL,NULL,NULL,'Ocupada (Trabajo Con Marcela En Lomas De Bezares)',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(491,'Meztli Amellare Mendoza Muciño',NULL,'1997-11-11','25',2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5540859867',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocacional',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(492,'Nancy González Lira',NULL,'1998-05-12','25',2,NULL,NULL,NULL,'Atizapan De Zaragosa',NULL,NULL,'5511317957',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Experiencia En Preescolar Y Primaria',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(493,'Paloma Abigail Robledo Ramírez',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Fracc Arboledas',NULL,NULL,'8338546552',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Ocupada Sra. Juanita (Entro El 8 De Noviembre 2022)',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(494,'Rachel Abigail Figueroa Romero',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Tlaneplantla',NULL,NULL,'5561861655',NULL,NULL,'Si, 12 Años',NULL,NULL,NULL,NULL,'Trabajo Con La Sra. Yana, Salio El 18 De Enero',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(495,'Vanessa Jaqueline Méndez Flores',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Huixquilucan',NULL,NULL,'5624823969',NULL,NULL,'Si, 7 Años',NULL,NULL,NULL,NULL,'Nana Ocacional',1,NULL,'2023-05-19 14:59:28','2023-05-19 14:59:28'),(496,'Yolanda Guadalupe García Olvera',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Atizapan De Zaragosa',NULL,NULL,'5560421670',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Nana (No Disponible)',1,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29'),(497,'Martha Carolina Murguía Pacheco',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Av. Santa Fe',NULL,NULL,'9994644382',NULL,NULL,'No',NULL,NULL,NULL,NULL,'Quedo Mal (No Le Gusto A Los Clientes)',1,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29'),(498,'Sandra Leticia Joya Macedo',NULL,'1969-02-10','54',2,NULL,NULL,NULL,'Punta Paraiso',NULL,NULL,'3222788150',NULL,NULL,'Si, 32,26 Y 25 Años',NULL,NULL,NULL,NULL,'Se Coloco Con Clienta Malu En Puerto Vallarta 6-Febrero-2023. (De Planta Salida Cada 8 Dias)',3,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29'),(499,'Laura Patricia García Sotelo',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Alvaro Obregon',NULL,NULL,'5591895221',NULL,NULL,'Si, 29,25 Y 14 Años',NULL,NULL,NULL,NULL,'Disponible',2,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29'),(500,'Cynthia Avilés García',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Alcaldia Azcapotzalco',NULL,NULL,'5541736888',NULL,NULL,'Si,10 Años',NULL,NULL,NULL,NULL,'Disponible',1,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29'),(501,'Martha Leticia Ledesma Gámez',NULL,'2023-05-19',NULL,2,NULL,NULL,NULL,'Cuernavaca',NULL,NULL,'7771270069',NULL,NULL,'Si, 18 Y 17 Años',NULL,NULL,NULL,NULL,'Disponible',2,NULL,'2023-05-19 14:59:29','2023-05-19 14:59:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=2157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_activity`
--

LOCK TABLES `applicant_activity` WRITE;
/*!40000 ALTER TABLE `applicant_activity` DISABLE KEYS */;
INSERT INTO `applicant_activity` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,4,NULL),(4,1,5,NULL),(5,2,1,NULL),(6,2,2,NULL),(7,2,3,NULL),(8,2,4,NULL),(9,2,5,NULL),(10,3,1,NULL),(11,3,2,NULL),(12,3,3,NULL),(13,3,4,NULL),(14,3,5,NULL),(15,4,1,NULL),(16,4,2,NULL),(17,4,3,NULL),(18,4,4,NULL),(19,4,5,NULL),(20,5,1,NULL),(21,5,2,NULL),(22,5,3,NULL),(23,5,4,NULL),(24,5,5,NULL),(25,6,1,NULL),(26,6,2,NULL),(27,6,4,NULL),(28,6,5,NULL),(29,7,1,NULL),(30,7,2,NULL),(31,7,3,NULL),(32,7,4,NULL),(33,7,5,NULL),(34,8,1,NULL),(35,8,2,NULL),(36,8,4,NULL),(37,8,5,NULL),(38,9,1,NULL),(39,9,2,NULL),(40,9,3,NULL),(41,9,4,NULL),(42,9,5,NULL),(43,10,3,NULL),(44,10,4,NULL),(45,10,5,NULL),(46,11,1,NULL),(47,11,2,NULL),(48,11,4,NULL),(49,11,5,NULL),(50,12,1,NULL),(51,12,2,NULL),(52,12,3,NULL),(53,12,4,NULL),(54,12,5,NULL),(55,13,1,NULL),(56,13,2,NULL),(57,13,4,NULL),(58,13,5,NULL),(59,14,1,NULL),(60,14,2,NULL),(61,14,4,NULL),(62,14,5,NULL),(63,15,1,NULL),(64,15,2,NULL),(65,15,4,NULL),(66,15,5,NULL),(67,16,1,NULL),(68,16,2,NULL),(69,16,3,NULL),(70,16,4,NULL),(71,16,5,NULL),(72,17,1,NULL),(73,17,2,NULL),(74,17,4,NULL),(75,17,5,NULL),(76,18,1,NULL),(77,18,2,NULL),(78,18,3,NULL),(79,18,4,NULL),(80,18,5,NULL),(81,19,1,NULL),(82,19,2,NULL),(83,19,4,NULL),(84,19,5,NULL),(85,20,1,NULL),(86,20,2,NULL),(87,20,3,NULL),(88,20,4,NULL),(89,20,5,NULL),(90,21,1,NULL),(91,21,2,NULL),(92,21,3,NULL),(93,21,4,NULL),(94,21,5,NULL),(95,22,1,NULL),(96,22,2,NULL),(97,22,4,NULL),(98,22,5,NULL),(99,23,1,NULL),(100,23,2,NULL),(101,23,4,NULL),(102,23,5,NULL),(103,24,1,NULL),(104,24,2,NULL),(105,24,4,NULL),(106,24,5,NULL),(107,25,1,NULL),(108,25,2,NULL),(109,25,3,NULL),(110,25,4,NULL),(111,25,5,NULL),(112,26,1,NULL),(113,26,2,NULL),(114,26,4,NULL),(115,27,1,NULL),(116,27,2,NULL),(117,27,3,NULL),(118,27,4,NULL),(119,27,5,NULL),(120,28,1,NULL),(121,28,2,NULL),(122,28,3,NULL),(123,28,4,NULL),(124,28,5,NULL),(125,29,3,NULL),(126,29,4,NULL),(127,29,5,NULL),(128,30,1,NULL),(129,30,2,NULL),(130,30,4,NULL),(131,30,5,NULL),(132,31,1,NULL),(133,31,2,NULL),(134,31,3,NULL),(135,31,4,NULL),(136,31,5,NULL),(137,32,1,NULL),(138,32,2,NULL),(139,32,3,NULL),(140,32,4,NULL),(141,32,5,NULL),(142,33,1,NULL),(143,33,2,NULL),(144,33,3,NULL),(145,33,4,NULL),(146,33,5,NULL),(147,34,1,NULL),(148,34,2,NULL),(149,34,3,NULL),(150,34,4,NULL),(151,34,5,NULL),(152,35,1,NULL),(153,35,2,NULL),(154,35,4,NULL),(155,35,5,NULL),(156,36,1,NULL),(157,36,2,NULL),(158,36,4,NULL),(159,36,5,NULL),(160,37,1,NULL),(161,37,2,NULL),(162,37,3,NULL),(163,37,4,NULL),(164,37,5,NULL),(165,38,1,NULL),(166,38,4,NULL),(167,38,5,NULL),(168,39,1,NULL),(169,39,2,NULL),(170,39,3,NULL),(171,39,4,NULL),(172,39,5,NULL),(173,40,1,NULL),(174,40,2,NULL),(175,40,3,NULL),(176,40,4,NULL),(177,40,5,NULL),(178,41,1,NULL),(179,41,2,NULL),(180,41,3,NULL),(181,41,4,NULL),(182,41,5,NULL),(183,42,1,NULL),(184,42,2,NULL),(185,42,4,NULL),(186,42,5,NULL),(187,43,1,NULL),(188,43,2,NULL),(189,43,4,NULL),(190,43,5,NULL),(191,44,1,NULL),(192,44,2,NULL),(193,44,3,NULL),(194,44,4,NULL),(195,44,5,NULL),(196,45,1,NULL),(197,45,2,NULL),(198,45,3,NULL),(199,45,4,NULL),(200,45,5,NULL),(201,46,4,NULL),(202,46,5,NULL),(203,47,2,NULL),(204,47,4,NULL),(205,47,5,NULL),(206,48,1,NULL),(207,48,2,NULL),(208,48,4,NULL),(209,48,5,NULL),(210,49,1,NULL),(211,49,2,NULL),(212,49,3,NULL),(213,49,4,NULL),(214,49,5,NULL),(215,50,3,NULL),(216,50,4,NULL),(217,50,5,NULL),(218,51,1,NULL),(219,51,2,NULL),(220,51,3,NULL),(221,51,4,NULL),(222,51,5,NULL),(223,52,4,NULL),(224,52,5,NULL),(225,53,1,NULL),(226,53,2,NULL),(227,53,4,NULL),(228,53,5,NULL),(229,54,1,NULL),(230,54,2,NULL),(231,54,4,NULL),(232,54,5,NULL),(233,55,1,NULL),(234,55,2,NULL),(235,55,3,NULL),(236,55,4,NULL),(237,55,5,NULL),(238,56,1,NULL),(239,56,2,NULL),(240,56,3,NULL),(241,56,4,NULL),(242,56,5,NULL),(243,57,1,NULL),(244,57,2,NULL),(245,57,4,NULL),(246,57,5,NULL),(247,58,1,NULL),(248,58,2,NULL),(249,58,4,NULL),(250,58,5,NULL),(251,59,1,NULL),(252,59,2,NULL),(253,59,4,NULL),(254,59,5,NULL),(255,60,1,NULL),(256,60,2,NULL),(257,60,3,NULL),(258,60,4,NULL),(259,60,5,NULL),(260,61,2,NULL),(261,61,4,NULL),(262,61,5,NULL),(263,62,1,NULL),(264,62,2,NULL),(265,62,3,NULL),(266,62,4,NULL),(267,62,5,NULL),(268,63,1,NULL),(269,63,2,NULL),(270,63,4,NULL),(271,63,5,NULL),(272,64,1,NULL),(273,64,2,NULL),(274,64,3,NULL),(275,64,4,NULL),(276,64,5,NULL),(277,65,1,NULL),(278,65,2,NULL),(279,65,4,NULL),(280,65,5,NULL),(281,66,1,NULL),(282,66,2,NULL),(283,66,4,NULL),(284,66,5,NULL),(285,67,1,NULL),(286,67,2,NULL),(287,67,4,NULL),(288,67,5,NULL),(289,68,1,NULL),(290,68,2,NULL),(291,68,3,NULL),(292,68,4,NULL),(293,68,5,NULL),(294,69,1,NULL),(295,69,2,NULL),(296,69,4,NULL),(297,69,5,NULL),(298,70,1,NULL),(299,70,2,NULL),(300,70,4,NULL),(301,70,5,NULL),(302,71,1,NULL),(303,71,2,NULL),(304,71,4,NULL),(305,71,5,NULL),(306,72,1,NULL),(307,72,2,NULL),(308,72,4,NULL),(309,72,5,NULL),(310,73,3,NULL),(311,73,4,NULL),(312,73,5,NULL),(313,74,1,NULL),(314,74,2,NULL),(315,74,3,NULL),(316,74,4,NULL),(317,74,5,NULL),(318,75,4,NULL),(319,75,5,NULL),(320,76,1,NULL),(321,76,2,NULL),(322,76,3,NULL),(323,76,4,NULL),(324,76,5,NULL),(325,77,1,NULL),(326,77,2,NULL),(327,77,4,NULL),(328,77,5,NULL),(329,78,4,NULL),(330,78,5,NULL),(331,79,1,NULL),(332,79,2,NULL),(333,79,3,NULL),(334,79,4,NULL),(335,79,5,NULL),(336,80,1,NULL),(337,80,2,NULL),(338,80,3,NULL),(339,80,4,NULL),(340,80,5,NULL),(341,81,1,NULL),(342,81,2,NULL),(343,81,3,NULL),(344,81,4,NULL),(345,81,5,NULL),(346,82,1,NULL),(347,82,2,NULL),(348,82,3,NULL),(349,82,4,NULL),(350,82,5,NULL),(351,83,1,NULL),(352,83,2,NULL),(353,83,3,NULL),(354,83,4,NULL),(355,83,5,NULL),(356,84,1,NULL),(357,84,2,NULL),(358,84,3,NULL),(359,84,4,NULL),(360,84,5,NULL),(361,85,1,NULL),(362,85,2,NULL),(363,85,4,NULL),(364,86,1,NULL),(365,86,2,NULL),(366,86,3,NULL),(367,86,4,NULL),(368,86,5,NULL),(369,87,1,NULL),(370,87,2,NULL),(371,87,3,NULL),(372,87,4,NULL),(373,87,5,NULL),(374,88,1,NULL),(375,88,2,NULL),(376,88,4,NULL),(377,88,5,NULL),(378,89,1,NULL),(379,89,2,NULL),(380,89,4,NULL),(381,89,5,NULL),(382,90,1,NULL),(383,90,2,NULL),(384,90,3,NULL),(385,90,4,NULL),(386,90,5,NULL),(387,91,1,NULL),(388,91,2,NULL),(389,91,4,NULL),(390,91,5,NULL),(391,92,1,NULL),(392,92,2,NULL),(393,92,3,NULL),(394,92,4,NULL),(395,92,5,NULL),(396,93,1,NULL),(397,93,2,NULL),(398,93,4,NULL),(399,93,5,NULL),(400,94,1,NULL),(401,94,2,NULL),(402,94,3,NULL),(403,94,4,NULL),(404,94,5,NULL),(405,95,1,NULL),(406,95,2,NULL),(407,95,3,NULL),(408,95,4,NULL),(409,95,5,NULL),(410,96,1,NULL),(411,96,2,NULL),(412,96,4,NULL),(413,96,5,NULL),(414,97,1,NULL),(415,97,2,NULL),(416,97,4,NULL),(417,97,5,NULL),(418,98,1,NULL),(419,98,2,NULL),(420,98,3,NULL),(421,98,4,NULL),(422,98,5,NULL),(423,99,1,NULL),(424,99,2,NULL),(425,99,3,NULL),(426,99,4,NULL),(427,99,5,NULL),(428,100,1,NULL),(429,100,2,NULL),(430,100,4,NULL),(431,100,5,NULL),(432,101,1,NULL),(433,101,2,NULL),(434,101,3,NULL),(435,101,4,NULL),(436,101,5,NULL),(437,102,1,NULL),(438,102,2,NULL),(439,102,3,NULL),(440,102,4,NULL),(441,102,5,NULL),(442,103,1,NULL),(443,103,2,NULL),(444,103,3,NULL),(445,103,4,NULL),(446,103,5,NULL),(447,104,1,NULL),(448,104,2,NULL),(449,104,3,NULL),(450,104,4,NULL),(451,104,5,NULL),(452,105,1,NULL),(453,105,2,NULL),(454,105,3,NULL),(455,105,4,NULL),(456,105,5,NULL),(457,106,3,NULL),(458,106,4,NULL),(459,106,5,NULL),(460,107,1,NULL),(461,107,2,NULL),(462,107,3,NULL),(463,107,4,NULL),(464,107,5,NULL),(465,108,1,NULL),(466,108,2,NULL),(467,108,4,NULL),(468,108,5,NULL),(469,109,1,NULL),(470,109,2,NULL),(471,109,4,NULL),(472,109,5,NULL),(473,110,1,NULL),(474,110,2,NULL),(475,110,3,NULL),(476,110,4,NULL),(477,110,5,NULL),(478,111,1,NULL),(479,111,3,NULL),(480,111,4,NULL),(481,111,5,NULL),(482,112,1,NULL),(483,112,2,NULL),(484,112,3,NULL),(485,112,4,NULL),(486,112,5,NULL),(487,113,1,NULL),(488,113,2,NULL),(489,113,3,NULL),(490,113,4,NULL),(491,113,5,NULL),(492,114,1,NULL),(493,114,2,NULL),(494,114,4,NULL),(495,114,5,NULL),(496,115,1,NULL),(497,115,2,NULL),(498,115,3,NULL),(499,115,4,NULL),(500,115,5,NULL),(501,116,1,NULL),(502,116,2,NULL),(503,116,3,NULL),(504,116,4,NULL),(505,116,5,NULL),(506,117,1,NULL),(507,117,2,NULL),(508,117,3,NULL),(509,117,4,NULL),(510,117,5,NULL),(511,118,1,NULL),(512,118,2,NULL),(513,118,3,NULL),(514,118,4,NULL),(515,118,5,NULL),(516,119,1,NULL),(517,119,2,NULL),(518,119,3,NULL),(519,119,4,NULL),(520,119,5,NULL),(521,120,1,NULL),(522,120,2,NULL),(523,120,3,NULL),(524,120,4,NULL),(525,120,5,NULL),(526,121,1,NULL),(527,121,2,NULL),(528,121,3,NULL),(529,121,4,NULL),(530,121,5,NULL),(531,122,1,NULL),(532,122,2,NULL),(533,122,3,NULL),(534,122,4,NULL),(535,122,5,NULL),(536,123,1,NULL),(537,123,2,NULL),(538,123,4,NULL),(539,123,5,NULL),(540,124,1,NULL),(541,124,2,NULL),(542,124,3,NULL),(543,124,4,NULL),(544,124,5,NULL),(545,125,1,NULL),(546,125,2,NULL),(547,125,3,NULL),(548,125,4,NULL),(549,125,5,NULL),(550,126,1,NULL),(551,126,2,NULL),(552,126,3,NULL),(553,126,4,NULL),(554,126,5,NULL),(555,127,1,NULL),(556,127,2,NULL),(557,127,3,NULL),(558,127,4,NULL),(559,127,5,NULL),(560,128,1,NULL),(561,128,2,NULL),(562,128,4,NULL),(563,128,5,NULL),(564,129,1,NULL),(565,129,2,NULL),(566,129,4,NULL),(567,129,5,NULL),(568,130,1,NULL),(569,130,2,NULL),(570,130,4,NULL),(571,130,5,NULL),(572,131,1,NULL),(573,131,2,NULL),(574,131,3,NULL),(575,131,4,NULL),(576,131,5,NULL),(577,132,1,NULL),(578,132,2,NULL),(579,132,3,NULL),(580,132,4,NULL),(581,132,5,NULL),(582,133,4,NULL),(583,133,5,NULL),(584,134,1,NULL),(585,134,2,NULL),(586,134,3,NULL),(587,134,4,NULL),(588,134,5,NULL),(589,135,1,NULL),(590,135,2,NULL),(591,135,3,NULL),(592,135,4,NULL),(593,135,5,NULL),(594,136,1,NULL),(595,136,2,NULL),(596,136,3,NULL),(597,136,4,NULL),(598,136,5,NULL),(599,137,1,NULL),(600,137,2,NULL),(601,137,3,NULL),(602,137,4,NULL),(603,137,5,NULL),(604,138,1,NULL),(605,138,2,NULL),(606,138,4,NULL),(607,138,5,NULL),(608,139,1,NULL),(609,139,2,NULL),(610,139,3,NULL),(611,139,4,NULL),(612,139,5,NULL),(613,140,1,NULL),(614,140,2,NULL),(615,140,3,NULL),(616,140,4,NULL),(617,140,5,NULL),(618,141,1,NULL),(619,141,2,NULL),(620,141,3,NULL),(621,141,4,NULL),(622,141,5,NULL),(623,142,1,NULL),(624,142,2,NULL),(625,142,4,NULL),(626,142,5,NULL),(627,143,1,NULL),(628,143,2,NULL),(629,143,4,NULL),(630,143,5,NULL),(631,144,1,NULL),(632,144,2,NULL),(633,144,4,NULL),(634,144,5,NULL),(635,145,1,NULL),(636,145,2,NULL),(637,145,3,NULL),(638,145,4,NULL),(639,145,5,NULL),(640,146,1,NULL),(641,146,2,NULL),(642,146,3,NULL),(643,146,4,NULL),(644,146,5,NULL),(645,147,1,NULL),(646,147,2,NULL),(647,147,3,NULL),(648,147,4,NULL),(649,147,5,NULL),(650,148,1,NULL),(651,148,2,NULL),(652,148,3,NULL),(653,148,4,NULL),(654,148,5,NULL),(655,149,1,NULL),(656,149,2,NULL),(657,149,3,NULL),(658,149,4,NULL),(659,149,5,NULL),(660,150,1,NULL),(661,150,2,NULL),(662,150,4,NULL),(663,150,5,NULL),(664,151,1,NULL),(665,151,2,NULL),(666,151,3,NULL),(667,151,4,NULL),(668,151,5,NULL),(669,152,1,NULL),(670,152,2,NULL),(671,152,3,NULL),(672,152,4,NULL),(673,152,5,NULL),(674,153,1,NULL),(675,153,2,NULL),(676,153,3,NULL),(677,153,4,NULL),(678,153,5,NULL),(679,154,1,NULL),(680,154,2,NULL),(681,154,4,NULL),(682,154,5,NULL),(683,155,1,NULL),(684,155,2,NULL),(685,155,3,NULL),(686,155,4,NULL),(687,155,5,NULL),(688,156,1,NULL),(689,156,2,NULL),(690,156,3,NULL),(691,156,4,NULL),(692,156,5,NULL),(693,157,1,NULL),(694,157,2,NULL),(695,157,4,NULL),(696,157,5,NULL),(697,158,1,NULL),(698,158,2,NULL),(699,158,3,NULL),(700,158,4,NULL),(701,158,5,NULL),(702,159,1,NULL),(703,159,2,NULL),(704,159,3,NULL),(705,159,4,NULL),(706,159,5,NULL),(707,160,1,NULL),(708,160,2,NULL),(709,160,4,NULL),(710,160,5,NULL),(711,161,1,NULL),(712,161,2,NULL),(713,161,3,NULL),(714,161,4,NULL),(715,161,5,NULL),(716,162,1,NULL),(717,162,2,NULL),(718,162,3,NULL),(719,162,4,NULL),(720,162,5,NULL),(721,163,1,NULL),(722,163,2,NULL),(723,163,3,NULL),(724,163,4,NULL),(725,163,5,NULL),(726,164,1,NULL),(727,164,2,NULL),(728,164,3,NULL),(729,164,4,NULL),(730,164,5,NULL),(731,165,1,NULL),(732,165,2,NULL),(733,165,3,NULL),(734,165,4,NULL),(735,165,5,NULL),(736,166,1,NULL),(737,166,2,NULL),(738,166,3,NULL),(739,166,4,NULL),(740,166,5,NULL),(741,167,1,NULL),(742,167,2,NULL),(743,167,3,NULL),(744,167,4,NULL),(745,167,5,NULL),(746,168,1,NULL),(747,168,2,NULL),(748,168,4,NULL),(749,168,5,NULL),(750,169,1,NULL),(751,169,2,NULL),(752,169,4,NULL),(753,169,5,NULL),(754,170,1,NULL),(755,170,2,NULL),(756,170,3,NULL),(757,170,4,NULL),(758,170,5,NULL),(759,171,1,NULL),(760,171,2,NULL),(761,171,3,NULL),(762,171,4,NULL),(763,171,5,NULL),(764,172,1,NULL),(765,172,2,NULL),(766,172,4,NULL),(767,172,5,NULL),(768,173,1,NULL),(769,173,2,NULL),(770,173,4,NULL),(771,173,5,NULL),(772,174,1,NULL),(773,174,2,NULL),(774,174,3,NULL),(775,174,4,NULL),(776,174,5,NULL),(777,175,1,NULL),(778,175,2,NULL),(779,175,4,NULL),(780,175,5,NULL),(781,176,1,NULL),(782,176,2,NULL),(783,176,3,NULL),(784,176,4,NULL),(785,176,5,NULL),(786,177,1,NULL),(787,177,2,NULL),(788,177,3,NULL),(789,177,4,NULL),(790,177,5,NULL),(791,178,1,NULL),(792,178,2,NULL),(793,178,3,NULL),(794,178,4,NULL),(795,178,5,NULL),(796,179,1,NULL),(797,179,2,NULL),(798,179,3,NULL),(799,179,4,NULL),(800,179,5,NULL),(801,180,1,NULL),(802,180,2,NULL),(803,180,3,NULL),(804,180,4,NULL),(805,180,5,NULL),(806,181,1,NULL),(807,181,2,NULL),(808,181,3,NULL),(809,181,4,NULL),(810,181,5,NULL),(811,182,1,NULL),(812,182,2,NULL),(813,182,3,NULL),(814,182,4,NULL),(815,182,5,NULL),(816,183,1,NULL),(817,183,2,NULL),(818,183,4,NULL),(819,183,5,NULL),(820,184,1,NULL),(821,184,2,NULL),(822,184,3,NULL),(823,184,4,NULL),(824,184,5,NULL),(825,185,1,NULL),(826,185,2,NULL),(827,185,3,NULL),(828,185,4,NULL),(829,185,5,NULL),(830,186,1,NULL),(831,186,2,NULL),(832,186,3,NULL),(833,186,4,NULL),(834,186,5,NULL),(835,187,1,NULL),(836,187,2,NULL),(837,187,3,NULL),(838,187,4,NULL),(839,187,5,NULL),(840,188,1,NULL),(841,188,2,NULL),(842,188,3,NULL),(843,188,4,NULL),(844,188,5,NULL),(845,189,1,NULL),(846,189,2,NULL),(847,189,3,NULL),(848,189,4,NULL),(849,189,5,NULL),(850,190,1,NULL),(851,190,2,NULL),(852,190,3,NULL),(853,190,4,NULL),(854,190,5,NULL),(855,191,1,NULL),(856,191,2,NULL),(857,191,4,NULL),(858,191,5,NULL),(859,192,1,NULL),(860,192,2,NULL),(861,192,3,NULL),(862,192,4,NULL),(863,192,5,NULL),(864,193,1,NULL),(865,193,2,NULL),(866,193,4,NULL),(867,193,5,NULL),(868,194,1,NULL),(869,194,2,NULL),(870,194,3,NULL),(871,194,4,NULL),(872,194,5,NULL),(873,195,1,NULL),(874,195,2,NULL),(875,195,4,NULL),(876,195,5,NULL),(877,196,1,NULL),(878,196,2,NULL),(879,196,3,NULL),(880,196,4,NULL),(881,196,5,NULL),(882,197,1,NULL),(883,197,2,NULL),(884,197,3,NULL),(885,197,4,NULL),(886,197,5,NULL),(887,198,1,NULL),(888,198,2,NULL),(889,198,3,NULL),(890,198,4,NULL),(891,198,5,NULL),(892,199,1,NULL),(893,199,2,NULL),(894,199,3,NULL),(895,199,4,NULL),(896,199,5,NULL),(897,200,1,NULL),(898,200,2,NULL),(899,200,3,NULL),(900,200,4,NULL),(901,200,5,NULL),(902,201,4,NULL),(903,201,5,NULL),(904,202,1,NULL),(905,202,2,NULL),(906,202,3,NULL),(907,202,4,NULL),(908,202,5,NULL),(909,203,1,NULL),(910,203,2,NULL),(911,203,4,NULL),(912,203,5,NULL),(913,204,1,NULL),(914,204,2,NULL),(915,204,3,NULL),(916,204,4,NULL),(917,204,5,NULL),(918,205,1,NULL),(919,205,2,NULL),(920,205,4,NULL),(921,205,5,NULL),(922,206,1,NULL),(923,206,2,NULL),(924,206,3,NULL),(925,206,4,NULL),(926,206,5,NULL),(927,207,1,NULL),(928,207,2,NULL),(929,207,3,NULL),(930,207,4,NULL),(931,207,5,NULL),(932,208,1,NULL),(933,208,2,NULL),(934,208,3,NULL),(935,208,4,NULL),(936,208,5,NULL),(937,209,1,NULL),(938,209,2,NULL),(939,209,3,NULL),(940,209,4,NULL),(941,209,5,NULL),(942,210,1,NULL),(943,210,2,NULL),(944,210,3,NULL),(945,210,4,NULL),(946,210,5,NULL),(947,211,1,NULL),(948,211,2,NULL),(949,211,3,NULL),(950,211,4,NULL),(951,211,5,NULL),(952,212,1,NULL),(953,212,2,NULL),(954,212,3,NULL),(955,212,4,NULL),(956,212,5,NULL),(957,213,1,NULL),(958,213,2,NULL),(959,213,3,NULL),(960,213,4,NULL),(961,213,5,NULL),(962,214,1,NULL),(963,214,2,NULL),(964,214,3,NULL),(965,214,4,NULL),(966,214,5,NULL),(967,215,1,NULL),(968,215,2,NULL),(969,215,3,NULL),(970,215,4,NULL),(971,215,5,NULL),(972,216,4,NULL),(973,216,5,NULL),(974,217,1,NULL),(975,217,2,NULL),(976,217,3,NULL),(977,217,4,NULL),(978,217,5,NULL),(979,218,1,NULL),(980,218,2,NULL),(981,218,4,NULL),(982,218,5,NULL),(983,219,1,NULL),(984,219,2,NULL),(985,219,3,NULL),(986,219,4,NULL),(987,219,5,NULL),(988,220,1,NULL),(989,220,2,NULL),(990,220,3,NULL),(991,220,4,NULL),(992,220,5,NULL),(993,221,1,NULL),(994,221,2,NULL),(995,221,4,NULL),(996,221,5,NULL),(997,222,1,NULL),(998,222,2,NULL),(999,222,3,NULL),(1000,222,4,NULL),(1001,222,5,NULL),(1002,223,1,NULL),(1003,223,2,NULL),(1004,223,3,NULL),(1005,223,4,NULL),(1006,223,5,NULL),(1007,224,1,NULL),(1008,224,2,NULL),(1009,224,3,NULL),(1010,224,4,NULL),(1011,224,5,NULL),(1012,225,1,NULL),(1013,225,2,NULL),(1014,225,4,NULL),(1015,225,5,NULL),(1016,226,1,NULL),(1017,226,2,NULL),(1018,226,4,NULL),(1019,226,5,NULL),(1020,227,1,NULL),(1021,227,2,NULL),(1022,227,4,NULL),(1023,227,5,NULL),(1024,228,1,NULL),(1025,228,2,NULL),(1026,228,3,NULL),(1027,228,4,NULL),(1028,228,5,NULL),(1029,229,1,NULL),(1030,229,2,NULL),(1031,229,3,NULL),(1032,229,4,NULL),(1033,229,5,NULL),(1034,230,1,NULL),(1035,230,2,NULL),(1036,230,3,NULL),(1037,230,4,NULL),(1038,230,5,NULL),(1039,231,1,NULL),(1040,231,2,NULL),(1041,231,3,NULL),(1042,231,4,NULL),(1043,231,5,NULL),(1044,232,1,NULL),(1045,232,2,NULL),(1046,232,3,NULL),(1047,232,4,NULL),(1048,232,5,NULL),(1049,233,1,NULL),(1050,233,2,NULL),(1051,233,4,NULL),(1052,233,5,NULL),(1053,234,1,NULL),(1054,234,2,NULL),(1055,234,4,NULL),(1056,234,5,NULL),(1057,235,1,NULL),(1058,235,2,NULL),(1059,235,4,NULL),(1060,235,5,NULL),(1061,236,1,NULL),(1062,236,2,NULL),(1063,236,4,NULL),(1064,236,5,NULL),(1065,237,1,NULL),(1066,237,2,NULL),(1067,237,4,NULL),(1068,237,5,NULL),(1069,238,1,NULL),(1070,238,2,NULL),(1071,238,4,NULL),(1072,238,5,NULL),(1073,239,1,NULL),(1074,239,2,NULL),(1075,239,4,NULL),(1076,239,5,NULL),(1077,240,1,NULL),(1078,240,2,NULL),(1079,240,4,NULL),(1080,240,5,NULL),(1081,241,1,NULL),(1082,241,2,NULL),(1083,241,4,NULL),(1084,241,5,NULL),(1085,242,1,NULL),(1086,242,2,NULL),(1087,242,4,NULL),(1088,242,5,NULL),(1089,243,1,NULL),(1090,243,2,NULL),(1091,243,3,NULL),(1092,243,4,NULL),(1093,243,5,NULL),(1094,244,1,NULL),(1095,244,2,NULL),(1096,244,4,NULL),(1097,244,5,NULL),(1098,245,1,NULL),(1099,245,2,NULL),(1100,245,4,NULL),(1101,245,5,NULL),(1102,246,1,NULL),(1103,246,2,NULL),(1104,246,3,NULL),(1105,246,4,NULL),(1106,246,5,NULL),(1107,247,1,NULL),(1108,247,2,NULL),(1109,247,4,NULL),(1110,247,5,NULL),(1111,248,1,NULL),(1112,248,2,NULL),(1113,248,3,NULL),(1114,248,4,NULL),(1115,248,5,NULL),(1116,249,1,NULL),(1117,249,2,NULL),(1118,249,3,NULL),(1119,249,4,NULL),(1120,249,5,NULL),(1121,250,1,NULL),(1122,250,2,NULL),(1123,250,3,NULL),(1124,250,4,NULL),(1125,250,5,NULL),(1126,251,1,NULL),(1127,251,2,NULL),(1128,251,3,NULL),(1129,251,4,NULL),(1130,251,5,NULL),(1131,252,1,NULL),(1132,252,2,NULL),(1133,252,3,NULL),(1134,252,4,NULL),(1135,252,5,NULL),(1136,253,1,NULL),(1137,253,2,NULL),(1138,253,3,NULL),(1139,253,4,NULL),(1140,253,5,NULL),(1141,254,1,NULL),(1142,254,2,NULL),(1143,254,3,NULL),(1144,254,4,NULL),(1145,254,5,NULL),(1146,255,1,NULL),(1147,255,2,NULL),(1148,255,3,NULL),(1149,255,4,NULL),(1150,255,5,NULL),(1151,256,1,NULL),(1152,256,2,NULL),(1153,256,3,NULL),(1154,256,4,NULL),(1155,256,5,NULL),(1156,257,1,NULL),(1157,257,2,NULL),(1158,257,3,NULL),(1159,257,4,NULL),(1160,257,5,NULL),(1161,258,1,NULL),(1162,258,2,NULL),(1163,258,3,NULL),(1164,258,4,NULL),(1165,258,5,NULL),(1166,259,2,NULL),(1167,259,3,NULL),(1168,259,4,NULL),(1169,259,5,NULL),(1170,260,2,NULL),(1171,260,3,NULL),(1172,260,4,NULL),(1173,260,5,NULL),(1174,261,2,NULL),(1175,261,3,NULL),(1176,261,4,NULL),(1177,261,5,NULL),(1178,262,2,NULL),(1179,262,3,NULL),(1180,262,4,NULL),(1181,262,5,NULL),(1182,263,2,NULL),(1183,263,3,NULL),(1184,263,4,NULL),(1185,263,5,NULL),(1186,264,2,NULL),(1187,264,3,NULL),(1188,264,4,NULL),(1189,264,5,NULL),(1190,265,2,NULL),(1191,265,3,NULL),(1192,265,4,NULL),(1193,265,5,NULL),(1194,266,2,NULL),(1195,266,3,NULL),(1196,266,4,NULL),(1197,266,5,NULL),(1198,267,2,NULL),(1199,267,3,NULL),(1200,267,4,NULL),(1201,267,5,NULL),(1202,268,1,NULL),(1203,268,2,NULL),(1204,268,3,NULL),(1205,268,4,NULL),(1206,268,5,NULL),(1207,269,1,NULL),(1208,269,2,NULL),(1209,269,3,NULL),(1210,269,4,NULL),(1211,269,5,NULL),(1212,270,1,NULL),(1213,270,2,NULL),(1214,270,3,NULL),(1215,270,4,NULL),(1216,270,5,NULL),(1217,271,1,NULL),(1218,271,2,NULL),(1219,271,3,NULL),(1220,271,4,NULL),(1221,271,5,NULL),(1222,272,1,NULL),(1223,272,2,NULL),(1224,272,3,NULL),(1225,272,4,NULL),(1226,273,1,NULL),(1227,273,2,NULL),(1228,273,3,NULL),(1229,273,4,NULL),(1230,273,5,NULL),(1231,274,1,NULL),(1232,274,2,NULL),(1233,274,3,NULL),(1234,274,4,NULL),(1235,274,5,NULL),(1236,275,1,NULL),(1237,275,2,NULL),(1238,275,3,NULL),(1239,275,4,NULL),(1240,275,5,NULL),(1241,276,1,NULL),(1242,276,2,NULL),(1243,276,3,NULL),(1244,276,4,NULL),(1245,276,5,NULL),(1246,277,1,NULL),(1247,277,2,NULL),(1248,277,3,NULL),(1249,277,4,NULL),(1250,277,5,NULL),(1251,278,1,NULL),(1252,278,2,NULL),(1253,278,3,NULL),(1254,278,4,NULL),(1255,278,5,NULL),(1256,279,1,NULL),(1257,279,2,NULL),(1258,279,3,NULL),(1259,279,4,NULL),(1260,279,5,NULL),(1261,280,1,NULL),(1262,280,2,NULL),(1263,280,3,NULL),(1264,280,4,NULL),(1265,280,5,NULL),(1266,281,1,NULL),(1267,281,2,NULL),(1268,281,3,NULL),(1269,281,4,NULL),(1270,281,5,NULL),(1271,282,1,NULL),(1272,282,2,NULL),(1273,282,3,NULL),(1274,282,4,NULL),(1275,282,5,NULL),(1276,283,1,NULL),(1277,283,2,NULL),(1278,283,3,NULL),(1279,283,4,NULL),(1280,283,5,NULL),(1281,284,2,NULL),(1282,284,3,NULL),(1283,284,4,NULL),(1284,284,5,NULL),(1285,285,2,NULL),(1286,285,3,NULL),(1287,285,4,NULL),(1288,286,1,NULL),(1289,286,2,NULL),(1290,286,3,NULL),(1291,286,4,NULL),(1292,287,1,NULL),(1293,287,2,NULL),(1294,287,3,NULL),(1295,287,4,NULL),(1296,288,1,NULL),(1297,288,2,NULL),(1298,288,3,NULL),(1299,288,4,NULL),(1300,288,5,NULL),(1301,289,1,NULL),(1302,289,2,NULL),(1303,289,3,NULL),(1304,289,4,NULL),(1305,289,5,NULL),(1306,290,1,NULL),(1307,290,2,NULL),(1308,290,3,NULL),(1309,290,4,NULL),(1310,290,5,NULL),(1311,291,1,NULL),(1312,291,2,NULL),(1313,291,3,NULL),(1314,291,4,NULL),(1315,291,5,NULL),(1316,292,1,NULL),(1317,292,2,NULL),(1318,292,3,NULL),(1319,292,4,NULL),(1320,292,5,NULL),(1321,293,1,NULL),(1322,293,2,NULL),(1323,293,3,NULL),(1324,293,4,NULL),(1325,293,5,NULL),(1326,294,1,NULL),(1327,294,2,NULL),(1328,294,3,NULL),(1329,294,4,NULL),(1330,294,5,NULL),(1331,295,1,NULL),(1332,295,2,NULL),(1333,295,3,NULL),(1334,295,4,NULL),(1335,295,5,NULL),(1336,296,1,NULL),(1337,296,2,NULL),(1338,296,3,NULL),(1339,296,4,NULL),(1340,296,5,NULL),(1341,297,1,NULL),(1342,297,2,NULL),(1343,297,3,NULL),(1344,297,4,NULL),(1345,297,5,NULL),(1346,298,1,NULL),(1347,298,2,NULL),(1348,298,3,NULL),(1349,298,4,NULL),(1350,298,5,NULL),(1351,299,2,NULL),(1352,299,3,NULL),(1353,299,4,NULL),(1354,299,5,NULL),(1355,300,1,NULL),(1356,300,2,NULL),(1357,300,3,NULL),(1358,300,4,NULL),(1359,300,5,NULL),(1360,301,1,NULL),(1361,301,2,NULL),(1362,301,3,NULL),(1363,301,4,NULL),(1364,301,5,NULL),(1365,302,1,NULL),(1366,302,2,NULL),(1367,302,3,NULL),(1368,302,4,NULL),(1369,302,5,NULL),(1370,303,1,NULL),(1371,303,2,NULL),(1372,303,3,NULL),(1373,303,4,NULL),(1374,303,5,NULL),(1375,304,1,NULL),(1376,304,2,NULL),(1377,304,3,NULL),(1378,304,4,NULL),(1379,304,5,NULL),(1380,305,1,NULL),(1381,305,2,NULL),(1382,305,3,NULL),(1383,305,4,NULL),(1384,305,5,NULL),(1385,306,1,NULL),(1386,306,2,NULL),(1387,306,3,NULL),(1388,306,5,NULL),(1389,307,1,NULL),(1390,307,2,NULL),(1391,307,3,NULL),(1392,307,4,NULL),(1393,307,5,NULL),(1394,308,1,NULL),(1395,308,2,NULL),(1396,308,3,NULL),(1397,308,4,NULL),(1398,308,5,NULL),(1399,309,1,NULL),(1400,309,2,NULL),(1401,309,3,NULL),(1402,309,4,NULL),(1403,309,5,NULL),(1404,310,1,NULL),(1405,310,2,NULL),(1406,310,3,NULL),(1407,310,4,NULL),(1408,310,5,NULL),(1409,311,1,NULL),(1410,311,2,NULL),(1411,311,3,NULL),(1412,311,4,NULL),(1413,311,5,NULL),(1414,312,1,NULL),(1415,312,2,NULL),(1416,312,3,NULL),(1417,312,5,NULL),(1418,313,1,NULL),(1419,313,2,NULL),(1420,313,3,NULL),(1421,313,4,NULL),(1422,313,5,NULL),(1423,314,1,NULL),(1424,314,2,NULL),(1425,314,3,NULL),(1426,314,4,NULL),(1427,314,5,NULL),(1428,315,1,NULL),(1429,315,2,NULL),(1430,315,3,NULL),(1431,315,4,NULL),(1432,315,5,NULL),(1433,316,1,NULL),(1434,316,2,NULL),(1435,316,3,NULL),(1436,316,4,NULL),(1437,316,5,NULL),(1438,317,1,NULL),(1439,317,2,NULL),(1440,317,3,NULL),(1441,317,4,NULL),(1442,317,5,NULL),(1443,318,1,NULL),(1444,318,2,NULL),(1445,318,3,NULL),(1446,318,4,NULL),(1447,318,5,NULL),(1448,319,1,NULL),(1449,319,2,NULL),(1450,319,3,NULL),(1451,319,4,NULL),(1452,319,5,NULL),(1453,320,1,NULL),(1454,320,2,NULL),(1455,320,3,NULL),(1456,320,4,NULL),(1457,320,5,NULL),(1458,321,1,NULL),(1459,321,2,NULL),(1460,321,3,NULL),(1461,321,4,NULL),(1462,321,5,NULL),(1463,322,1,NULL),(1464,322,2,NULL),(1465,322,3,NULL),(1466,322,4,NULL),(1467,322,5,NULL),(1468,323,1,NULL),(1469,323,2,NULL),(1470,323,3,NULL),(1471,323,4,NULL),(1472,323,5,NULL),(1473,324,1,NULL),(1474,324,2,NULL),(1475,324,3,NULL),(1476,324,4,NULL),(1477,325,1,NULL),(1478,325,2,NULL),(1479,325,3,NULL),(1480,325,4,NULL),(1481,325,5,NULL),(1482,326,1,NULL),(1483,326,2,NULL),(1484,326,3,NULL),(1485,326,4,NULL),(1486,326,5,NULL),(1487,327,1,NULL),(1488,327,2,NULL),(1489,327,3,NULL),(1490,327,4,NULL),(1491,327,5,NULL),(1492,328,1,NULL),(1493,328,2,NULL),(1494,328,3,NULL),(1495,328,4,NULL),(1496,328,5,NULL),(1497,329,1,NULL),(1498,329,2,NULL),(1499,329,3,NULL),(1500,329,4,NULL),(1501,329,5,NULL),(1502,330,1,NULL),(1503,330,2,NULL),(1504,330,3,NULL),(1505,330,4,NULL),(1506,330,5,NULL),(1507,331,1,NULL),(1508,331,2,NULL),(1509,331,3,NULL),(1510,331,4,NULL),(1511,331,5,NULL),(1512,332,1,NULL),(1513,332,2,NULL),(1514,332,3,NULL),(1515,332,4,NULL),(1516,332,5,NULL),(1517,333,1,NULL),(1518,333,2,NULL),(1519,333,3,NULL),(1520,333,4,NULL),(1521,333,5,NULL),(1522,334,1,NULL),(1523,334,2,NULL),(1524,334,3,NULL),(1525,334,4,NULL),(1526,334,5,NULL),(1527,335,1,NULL),(1528,335,2,NULL),(1529,335,3,NULL),(1530,335,4,NULL),(1531,335,5,NULL),(1532,336,1,NULL),(1533,336,2,NULL),(1534,336,3,NULL),(1535,336,4,NULL),(1536,336,5,NULL),(1537,337,1,NULL),(1538,337,2,NULL),(1539,337,3,NULL),(1540,337,4,NULL),(1541,337,5,NULL),(1542,338,1,NULL),(1543,338,2,NULL),(1544,338,3,NULL),(1545,338,5,NULL),(1546,339,1,NULL),(1547,339,2,NULL),(1548,339,3,NULL),(1549,339,4,NULL),(1550,339,5,NULL),(1551,340,1,NULL),(1552,340,2,NULL),(1553,340,3,NULL),(1554,340,4,NULL),(1555,340,5,NULL),(1556,341,1,NULL),(1557,341,2,NULL),(1558,341,3,NULL),(1559,341,4,NULL),(1560,341,5,NULL),(1561,342,1,NULL),(1562,342,2,NULL),(1563,342,3,NULL),(1564,342,4,NULL),(1565,342,5,NULL),(1566,343,1,NULL),(1567,343,2,NULL),(1568,343,3,NULL),(1569,343,4,NULL),(1570,343,5,NULL),(1571,344,1,NULL),(1572,344,2,NULL),(1573,344,3,NULL),(1574,344,4,NULL),(1575,344,5,NULL),(1576,345,1,NULL),(1577,345,2,NULL),(1578,345,4,NULL),(1579,345,5,NULL),(1580,346,1,NULL),(1581,346,2,NULL),(1582,346,4,NULL),(1583,346,5,NULL),(1584,347,1,NULL),(1585,347,2,NULL),(1586,347,4,NULL),(1587,347,5,NULL),(1588,348,1,NULL),(1589,348,2,NULL),(1590,348,3,NULL),(1591,348,4,NULL),(1592,348,5,NULL),(1593,349,1,NULL),(1594,349,2,NULL),(1595,349,3,NULL),(1596,349,4,NULL),(1597,349,5,NULL),(1598,350,1,NULL),(1599,350,2,NULL),(1600,350,4,NULL),(1601,350,5,NULL),(1602,351,1,NULL),(1603,351,2,NULL),(1604,351,3,NULL),(1605,351,4,NULL),(1606,351,5,NULL),(1607,352,1,NULL),(1608,352,2,NULL),(1609,352,4,NULL),(1610,352,5,NULL),(1611,353,1,NULL),(1612,353,2,NULL),(1613,353,4,NULL),(1614,353,5,NULL),(1615,354,1,NULL),(1616,354,2,NULL),(1617,354,4,NULL),(1618,354,5,NULL),(1619,355,1,NULL),(1620,355,2,NULL),(1621,355,4,NULL),(1622,355,5,NULL),(1623,356,1,NULL),(1624,356,2,NULL),(1625,356,4,NULL),(1626,356,5,NULL),(1627,357,1,NULL),(1628,357,2,NULL),(1629,357,4,NULL),(1630,357,5,NULL),(1631,358,1,NULL),(1632,358,2,NULL),(1633,358,4,NULL),(1634,358,5,NULL),(1635,359,1,NULL),(1636,359,2,NULL),(1637,359,4,NULL),(1638,359,5,NULL),(1639,360,1,NULL),(1640,360,2,NULL),(1641,360,4,NULL),(1642,360,5,NULL),(1643,361,1,NULL),(1644,361,2,NULL),(1645,361,4,NULL),(1646,361,5,NULL),(1647,362,1,NULL),(1648,362,2,NULL),(1649,362,4,NULL),(1650,362,5,NULL),(1651,363,1,NULL),(1652,363,2,NULL),(1653,363,4,NULL),(1654,363,5,NULL),(1655,364,1,NULL),(1656,364,2,NULL),(1657,364,4,NULL),(1658,364,5,NULL),(1659,365,1,NULL),(1660,365,2,NULL),(1661,365,4,NULL),(1662,365,5,NULL),(1663,366,1,NULL),(1664,366,2,NULL),(1665,366,4,NULL),(1666,366,5,NULL),(1667,367,1,NULL),(1668,367,2,NULL),(1669,367,4,NULL),(1670,367,5,NULL),(1671,368,1,NULL),(1672,368,2,NULL),(1673,368,4,NULL),(1674,368,5,NULL),(1675,369,1,NULL),(1676,369,2,NULL),(1677,369,4,NULL),(1678,369,5,NULL),(1679,370,1,NULL),(1680,370,2,NULL),(1681,370,4,NULL),(1682,370,5,NULL),(1683,371,1,NULL),(1684,371,2,NULL),(1685,371,4,NULL),(1686,371,5,NULL),(1687,372,1,NULL),(1688,372,2,NULL),(1689,372,4,NULL),(1690,372,5,NULL),(1691,373,1,NULL),(1692,373,2,NULL),(1693,373,4,NULL),(1694,373,5,NULL),(1695,374,1,NULL),(1696,374,2,NULL),(1697,374,4,NULL),(1698,374,5,NULL),(1699,375,1,NULL),(1700,375,2,NULL),(1701,375,4,NULL),(1702,375,5,NULL),(1703,376,1,NULL),(1704,376,2,NULL),(1705,376,4,NULL),(1706,376,5,NULL),(1707,377,1,NULL),(1708,377,2,NULL),(1709,377,4,NULL),(1710,377,5,NULL),(1711,378,1,NULL),(1712,378,2,NULL),(1713,378,4,NULL),(1714,378,5,NULL),(1715,379,1,NULL),(1716,379,2,NULL),(1717,379,4,NULL),(1718,379,5,NULL),(1719,380,1,NULL),(1720,380,2,NULL),(1721,380,3,NULL),(1722,380,4,NULL),(1723,380,5,NULL),(1724,381,1,NULL),(1725,381,2,NULL),(1726,381,4,NULL),(1727,381,5,NULL),(1728,382,1,NULL),(1729,382,2,NULL),(1730,382,4,NULL),(1731,382,5,NULL),(1732,383,1,NULL),(1733,383,2,NULL),(1734,383,4,NULL),(1735,383,5,NULL),(1736,384,1,NULL),(1737,384,2,NULL),(1738,384,4,NULL),(1739,384,5,NULL),(1740,385,1,NULL),(1741,385,2,NULL),(1742,385,4,NULL),(1743,385,5,NULL),(1744,386,1,NULL),(1745,386,2,NULL),(1746,386,4,NULL),(1747,386,5,NULL),(1748,387,1,NULL),(1749,387,2,NULL),(1750,387,4,NULL),(1751,387,5,NULL),(1752,388,1,NULL),(1753,388,2,NULL),(1754,388,4,NULL),(1755,388,5,NULL),(1756,389,1,NULL),(1757,389,2,NULL),(1758,389,4,NULL),(1759,389,5,NULL),(1760,390,1,NULL),(1761,390,2,NULL),(1762,390,4,NULL),(1763,390,5,NULL),(1764,391,1,NULL),(1765,391,2,NULL),(1766,391,4,NULL),(1767,391,5,NULL),(1768,392,1,NULL),(1769,392,2,NULL),(1770,392,4,NULL),(1771,392,5,NULL),(1772,393,1,NULL),(1773,393,2,NULL),(1774,393,4,NULL),(1775,393,5,NULL),(1776,394,1,NULL),(1777,394,2,NULL),(1778,394,4,NULL),(1779,394,5,NULL),(1780,395,1,NULL),(1781,395,2,NULL),(1782,395,4,NULL),(1783,395,5,NULL),(1784,396,1,NULL),(1785,396,2,NULL),(1786,396,3,NULL),(1787,396,4,NULL),(1788,396,5,NULL),(1789,397,1,NULL),(1790,397,2,NULL),(1791,397,4,NULL),(1792,397,5,NULL),(1793,398,1,NULL),(1794,398,2,NULL),(1795,398,3,NULL),(1796,398,4,NULL),(1797,398,5,NULL),(1798,399,1,NULL),(1799,399,2,NULL),(1800,399,3,NULL),(1801,399,4,NULL),(1802,399,5,NULL),(1803,400,1,NULL),(1804,400,2,NULL),(1805,400,3,NULL),(1806,400,4,NULL),(1807,400,5,NULL),(1808,401,1,NULL),(1809,401,2,NULL),(1810,401,4,NULL),(1811,401,5,NULL),(1812,402,1,NULL),(1813,402,2,NULL),(1814,402,3,NULL),(1815,402,4,NULL),(1816,402,5,NULL),(1817,403,3,NULL),(1818,403,4,NULL),(1819,403,5,NULL),(1820,404,1,NULL),(1821,404,2,NULL),(1822,404,3,NULL),(1823,404,4,NULL),(1824,404,5,NULL),(1825,405,1,NULL),(1826,405,2,NULL),(1827,405,3,NULL),(1828,405,4,NULL),(1829,405,5,NULL),(1830,406,1,NULL),(1831,406,2,NULL),(1832,406,3,NULL),(1833,406,4,NULL),(1834,406,5,NULL),(1835,407,1,NULL),(1836,407,2,NULL),(1837,407,3,NULL),(1838,407,4,NULL),(1839,407,5,NULL),(1840,408,1,NULL),(1841,408,2,NULL),(1842,408,3,NULL),(1843,408,4,NULL),(1844,408,5,NULL),(1845,409,1,NULL),(1846,409,2,NULL),(1847,409,4,NULL),(1848,409,5,NULL),(1849,410,1,NULL),(1850,410,2,NULL),(1851,410,3,NULL),(1852,410,4,NULL),(1853,410,5,NULL),(1854,411,2,NULL),(1855,411,3,NULL),(1856,411,4,NULL),(1857,411,5,NULL),(1858,412,1,NULL),(1859,412,2,NULL),(1860,412,4,NULL),(1861,412,5,NULL),(1862,413,1,NULL),(1863,413,2,NULL),(1864,413,4,NULL),(1865,413,5,NULL),(1866,414,1,NULL),(1867,414,2,NULL),(1868,414,4,NULL),(1869,414,5,NULL),(1870,415,1,NULL),(1871,415,2,NULL),(1872,415,3,NULL),(1873,415,4,NULL),(1874,415,5,NULL),(1875,416,1,NULL),(1876,416,2,NULL),(1877,416,3,NULL),(1878,416,4,NULL),(1879,416,5,NULL),(1880,417,2,NULL),(1881,417,3,NULL),(1882,417,4,NULL),(1883,417,5,NULL),(1884,418,1,NULL),(1885,418,2,NULL),(1886,418,3,NULL),(1887,418,4,NULL),(1888,418,5,NULL),(1889,419,2,NULL),(1890,419,4,NULL),(1891,419,5,NULL),(1892,420,1,NULL),(1893,420,2,NULL),(1894,420,4,NULL),(1895,420,5,NULL),(1896,421,1,NULL),(1897,421,2,NULL),(1898,421,4,NULL),(1899,421,5,NULL),(1900,422,1,NULL),(1901,422,2,NULL),(1902,422,3,NULL),(1903,422,4,NULL),(1904,422,5,NULL),(1905,423,1,NULL),(1906,423,2,NULL),(1907,423,3,NULL),(1908,423,4,NULL),(1909,423,5,NULL),(1910,424,1,NULL),(1911,424,2,NULL),(1912,424,3,NULL),(1913,424,4,NULL),(1914,424,5,NULL),(1915,425,1,NULL),(1916,425,2,NULL),(1917,425,3,NULL),(1918,425,4,NULL),(1919,425,5,NULL),(1920,426,2,NULL),(1921,426,4,NULL),(1922,426,5,NULL),(1923,427,1,NULL),(1924,427,2,NULL),(1925,427,4,NULL),(1926,427,5,NULL),(1927,428,1,NULL),(1928,428,2,NULL),(1929,428,3,NULL),(1930,428,4,NULL),(1931,428,5,NULL),(1932,429,1,NULL),(1933,429,2,NULL),(1934,429,3,NULL),(1935,429,4,NULL),(1936,429,5,NULL),(1937,430,1,NULL),(1938,430,2,NULL),(1939,430,3,NULL),(1940,430,4,NULL),(1941,430,5,NULL),(1942,431,1,NULL),(1943,431,2,NULL),(1944,431,4,NULL),(1945,431,5,NULL),(1946,432,1,NULL),(1947,432,2,NULL),(1948,432,3,NULL),(1949,432,4,NULL),(1950,432,5,NULL),(1951,433,1,NULL),(1952,433,2,NULL),(1953,433,4,NULL),(1954,433,5,NULL),(1955,434,1,NULL),(1956,434,2,NULL),(1957,434,3,NULL),(1958,434,4,NULL),(1959,434,5,NULL),(1960,435,1,NULL),(1961,435,2,NULL),(1962,435,3,NULL),(1963,435,4,NULL),(1964,435,5,NULL),(1965,436,1,NULL),(1966,436,2,NULL),(1967,436,4,NULL),(1968,436,5,NULL),(1969,437,1,NULL),(1970,437,2,NULL),(1971,437,3,NULL),(1972,437,4,NULL),(1973,437,5,NULL),(1974,438,1,NULL),(1975,438,2,NULL),(1976,438,4,NULL),(1977,438,5,NULL),(1978,439,1,NULL),(1979,439,2,NULL),(1980,439,3,NULL),(1981,439,4,NULL),(1982,439,5,NULL),(1983,440,1,NULL),(1984,440,2,NULL),(1985,440,3,NULL),(1986,440,4,NULL),(1987,440,5,NULL),(1988,441,1,NULL),(1989,441,2,NULL),(1990,441,3,NULL),(1991,441,4,NULL),(1992,441,5,NULL),(1993,442,1,NULL),(1994,442,2,NULL),(1995,442,4,NULL),(1996,442,5,NULL),(1997,443,1,NULL),(1998,443,2,NULL),(1999,443,3,NULL),(2000,443,4,NULL),(2001,443,5,NULL),(2002,444,1,NULL),(2003,444,2,NULL),(2004,444,3,NULL),(2005,444,4,NULL),(2006,444,5,NULL),(2007,445,1,NULL),(2008,445,2,NULL),(2009,445,4,NULL),(2010,445,5,NULL),(2011,446,2,NULL),(2012,446,4,NULL),(2013,447,1,NULL),(2014,447,2,NULL),(2015,447,3,NULL),(2016,447,4,NULL),(2017,447,5,NULL),(2018,448,1,NULL),(2019,448,2,NULL),(2020,448,3,NULL),(2021,448,4,NULL),(2022,448,5,NULL),(2023,449,1,NULL),(2024,449,2,NULL),(2025,449,3,NULL),(2026,449,4,NULL),(2027,449,5,NULL),(2028,450,1,NULL),(2029,450,2,NULL),(2030,450,3,NULL),(2031,450,4,NULL),(2032,450,5,NULL),(2033,451,1,NULL),(2034,451,2,NULL),(2035,451,3,NULL),(2036,451,4,NULL),(2037,451,5,NULL),(2038,452,1,NULL),(2039,452,2,NULL),(2040,452,4,NULL),(2041,452,5,NULL),(2042,453,1,NULL),(2043,453,2,NULL),(2044,453,4,NULL),(2045,453,5,NULL),(2046,454,1,NULL),(2047,454,2,NULL),(2048,454,4,NULL),(2049,454,5,NULL),(2050,455,1,NULL),(2051,455,2,NULL),(2052,455,4,NULL),(2053,455,5,NULL),(2054,456,1,NULL),(2055,456,2,NULL),(2056,456,4,NULL),(2057,456,5,NULL),(2058,458,1,NULL),(2059,458,2,NULL),(2060,458,3,NULL),(2061,458,4,NULL),(2062,458,5,NULL),(2063,459,1,NULL),(2064,459,2,NULL),(2065,459,3,NULL),(2066,459,4,NULL),(2067,459,5,NULL),(2068,460,1,NULL),(2069,460,2,NULL),(2070,460,3,NULL),(2071,460,4,NULL),(2072,460,5,NULL),(2073,461,1,NULL),(2074,461,2,NULL),(2075,461,3,NULL),(2076,461,4,NULL),(2077,462,1,NULL),(2078,462,2,NULL),(2079,463,1,NULL),(2080,463,2,NULL),(2081,464,1,NULL),(2082,464,2,NULL),(2083,465,1,NULL),(2084,465,2,NULL),(2085,466,1,NULL),(2086,466,2,NULL),(2087,467,1,NULL),(2088,467,2,NULL),(2089,468,1,NULL),(2090,468,2,NULL),(2091,469,1,NULL),(2092,469,2,NULL),(2093,470,1,NULL),(2094,470,2,NULL),(2095,471,1,NULL),(2096,471,2,NULL),(2097,472,1,NULL),(2098,472,2,NULL),(2099,473,1,NULL),(2100,473,2,NULL),(2101,474,1,NULL),(2102,474,2,NULL),(2103,475,1,NULL),(2104,475,2,NULL),(2105,476,1,NULL),(2106,476,2,NULL),(2107,477,1,NULL),(2108,477,2,NULL),(2109,478,1,NULL),(2110,478,2,NULL),(2111,479,1,NULL),(2112,479,2,NULL),(2113,480,1,NULL),(2114,480,2,NULL),(2115,481,1,NULL),(2116,481,2,NULL),(2117,482,1,NULL),(2118,482,2,NULL),(2119,483,1,NULL),(2120,483,2,NULL),(2121,484,1,NULL),(2122,484,2,NULL),(2123,485,1,NULL),(2124,485,2,NULL),(2125,486,1,NULL),(2126,486,2,NULL),(2127,487,1,NULL),(2128,487,2,NULL),(2129,488,1,NULL),(2130,488,2,NULL),(2131,489,1,NULL),(2132,489,2,NULL),(2133,490,1,NULL),(2134,490,2,NULL),(2135,491,1,NULL),(2136,491,2,NULL),(2137,492,1,NULL),(2138,492,2,NULL),(2139,493,1,NULL),(2140,493,2,NULL),(2141,494,1,NULL),(2142,494,2,NULL),(2143,495,1,NULL),(2144,495,2,NULL),(2145,496,1,NULL),(2146,496,2,NULL),(2147,497,1,NULL),(2148,497,2,NULL),(2149,498,1,NULL),(2150,498,2,NULL),(2151,499,1,NULL),(2152,499,2,NULL),(2153,500,1,NULL),(2154,500,2,NULL),(2155,501,1,NULL),(2156,501,2,NULL);
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
  `FK_id_physical_condition` int DEFAULT NULL,
  PRIMARY KEY (`id_applicant_condition`),
  UNIQUE KEY `id_applicant_condition` (`id_applicant_condition`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  KEY `FK_id_condition` (`FK_id_physical_condition`),
  CONSTRAINT `applicant_condition_ibfk_1` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`),
  CONSTRAINT `applicant_condition_ibfk_2` FOREIGN KEY (`FK_id_physical_condition`) REFERENCES `physical_condition` (`id_physical_condition`)
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
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_desired_job`
--

LOCK TABLES `applicant_desired_job` WRITE;
/*!40000 ALTER TABLE `applicant_desired_job` DISABLE KEYS */;
INSERT INTO `applicant_desired_job` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(58,58,1),(59,59,1),(60,60,1),(61,61,1),(62,62,1),(63,63,1),(64,64,1),(65,65,1),(66,66,1),(67,67,1),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,1),(74,74,1),(75,75,1),(76,76,1),(77,77,1),(78,78,1),(79,79,1),(80,80,1),(81,81,1),(82,82,1),(83,83,1),(84,84,1),(85,85,1),(86,86,1),(87,87,1),(88,88,1),(89,89,1),(90,90,1),(91,91,1),(92,92,1),(93,93,1),(94,94,1),(95,95,1),(96,96,1),(97,97,1),(98,98,1),(99,99,1),(100,100,1),(101,101,1),(102,102,1),(103,103,1),(104,104,1),(105,105,1),(106,106,1),(107,107,1),(108,108,1),(109,109,1),(110,110,1),(111,111,1),(112,112,1),(113,113,1),(114,114,1),(115,115,1),(116,116,1),(117,117,1),(118,118,1),(119,119,1),(120,120,1),(121,121,1),(122,122,1),(123,123,1),(124,124,1),(125,125,1),(126,126,1),(127,127,1),(128,128,1),(129,129,1),(130,130,1),(131,131,1),(132,132,1),(133,133,1),(134,134,1),(135,135,1),(136,136,1),(137,137,1),(138,138,1),(139,139,1),(140,140,1),(141,141,1),(142,142,1),(143,143,1),(144,144,1),(145,145,1),(146,146,1),(147,147,1),(148,148,1),(149,149,1),(150,150,1),(151,151,1),(152,152,1),(153,153,1),(154,154,1),(155,155,1),(156,156,1),(157,157,1),(158,158,1),(159,159,1),(160,160,1),(161,161,1),(162,162,1),(163,163,1),(164,164,1),(165,165,1),(166,166,1),(167,167,1),(168,168,1),(169,169,1),(170,170,1),(171,171,1),(172,172,1),(173,173,1),(174,174,1),(175,175,1),(176,176,1),(177,177,1),(178,178,1),(179,179,1),(180,180,1),(181,181,1),(182,182,1),(183,183,1),(184,184,1),(185,185,1),(186,186,1),(187,187,1),(188,188,1),(189,189,1),(190,190,1),(191,191,1),(192,192,1),(193,193,1),(194,194,1),(195,195,1),(196,196,1),(197,197,1),(198,198,1),(199,199,1),(200,200,1),(201,201,1),(202,202,1),(203,203,1),(204,204,1),(205,205,1),(206,206,1),(207,207,1),(208,208,1),(209,209,1),(210,210,1),(211,211,1),(212,212,1),(213,213,1),(214,214,1),(215,215,1),(216,216,1),(217,217,1),(218,218,1),(219,219,1),(220,220,1),(221,221,1),(222,222,1),(223,223,1),(224,224,1),(225,225,1),(226,226,1),(227,227,1),(228,228,1),(229,229,1),(230,230,1),(231,231,1),(232,232,1),(233,233,1),(234,234,1),(235,235,1),(236,236,1),(237,237,1),(238,238,1),(239,239,1),(240,240,1),(241,241,1),(242,242,1),(243,243,1),(244,244,1),(245,245,1),(246,246,1),(247,247,1),(248,248,1),(249,249,1),(250,250,1),(251,251,1),(252,252,1),(253,253,1),(254,254,1),(255,255,1),(256,256,1),(257,257,1),(258,258,1),(259,259,1),(260,260,1),(261,261,1),(262,262,1),(263,263,1),(264,264,1),(265,265,1),(266,266,1),(267,267,1),(268,268,1),(269,269,1),(270,270,1),(271,271,1),(272,272,1),(273,273,1),(274,274,1),(275,275,1),(276,276,1),(277,277,1),(278,278,1),(279,279,1),(280,280,1),(281,281,1),(282,282,1),(283,283,1),(284,284,1),(285,285,1),(286,286,1),(287,287,1),(288,288,1),(289,289,1),(290,290,1),(291,291,1),(292,292,1),(293,293,1),(294,294,1),(295,295,1),(296,296,1),(297,297,1),(298,298,1),(299,299,1),(300,300,1),(301,301,1),(302,302,1),(303,303,1),(304,304,1),(305,305,1),(306,306,1),(307,307,1),(308,308,1),(309,309,1),(310,310,1),(311,311,1),(312,312,1),(313,313,1),(314,314,1),(315,315,1),(316,316,1),(317,317,1),(318,318,1),(319,319,1),(320,320,1),(321,321,1),(322,322,1),(323,323,1),(324,324,1),(325,325,1),(326,326,1),(327,327,1),(328,328,1),(329,329,1),(330,330,1),(331,331,1),(332,332,1),(333,333,1),(334,334,1),(335,335,1),(336,336,1),(337,337,1),(338,338,1),(339,339,1),(340,340,1),(341,341,1),(342,342,1),(343,343,1),(344,344,1),(345,345,1),(346,346,1),(347,347,1),(348,348,1),(349,349,1),(350,350,1),(351,351,1),(352,352,1),(353,353,1),(354,354,1),(355,355,1),(356,356,1),(357,357,1),(358,358,1),(359,359,1),(360,360,1),(361,361,1),(362,362,1),(363,363,1),(364,364,1),(365,365,1),(366,366,1),(367,367,1),(368,368,1),(369,369,1),(370,370,1),(371,371,1),(372,372,1),(373,373,1),(374,374,1),(375,375,1),(376,376,1),(377,377,1),(378,378,1),(379,379,1),(380,380,1),(381,381,1),(382,382,1),(383,383,1),(384,384,1),(385,385,1),(386,386,1),(387,387,1),(388,388,1),(389,389,1),(390,390,1),(391,391,1),(392,392,1),(393,393,1),(394,394,1),(395,395,1),(396,396,1),(397,397,1),(398,398,1),(399,399,1),(400,400,1),(401,401,1),(402,402,1),(403,403,1),(404,404,1),(405,405,1),(406,406,1),(407,407,1),(408,408,1),(409,409,1),(410,410,1),(411,411,1),(412,412,1),(413,413,1),(414,414,1),(415,415,1),(416,416,1),(417,417,1),(418,418,1),(419,419,1),(420,420,1),(421,421,1),(422,422,1),(423,423,1),(424,424,1),(425,425,1),(426,426,1),(427,427,1),(428,428,1),(429,429,1),(430,430,1),(431,431,1),(432,432,1),(433,433,1),(434,434,1),(435,435,1),(436,436,1),(437,437,1),(438,438,1),(439,439,1),(440,440,1),(441,441,1),(442,442,1),(443,443,1),(444,444,1),(445,445,1),(446,446,1),(447,447,1),(448,448,1),(449,449,1),(450,450,1),(451,451,1),(452,452,1),(453,453,1),(454,454,1),(455,455,1),(456,456,1),(457,457,2),(458,458,1),(459,459,1),(460,460,1),(461,461,1),(462,462,5),(463,463,3),(464,464,4),(465,465,3),(466,466,3),(467,466,14),(468,466,12),(469,467,3),(470,468,3),(471,468,12),(472,469,3),(473,470,3),(474,470,6),(475,471,3),(476,471,6),(477,472,3),(478,472,7),(479,473,3),(480,474,3),(481,475,3),(482,475,6),(483,476,3),(484,476,12),(485,477,4),(486,478,3),(487,479,4),(488,479,9),(489,480,3),(490,480,7),(491,481,4),(492,482,4),(493,483,3),(494,483,12),(495,484,3),(496,484,6),(497,485,3),(498,486,3),(499,487,3),(500,487,10),(501,488,3),(502,488,11),(503,489,3),(504,490,3),(505,491,3),(506,492,3),(507,493,3),(508,494,3),(509,494,6),(510,495,3),(511,496,3),(512,496,6),(513,497,4),(514,498,4),(515,499,3),(516,499,14),(517,500,3),(518,500,12),(519,501,3),(520,501,14);
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
  CONSTRAINT `applicant_workhour_ibfk_2` FOREIGN KEY (`FK_id_workhour`) REFERENCES `workhour` (`id_workhour`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_workhour`
--

LOCK TABLES `applicant_workhour` WRITE;
/*!40000 ALTER TABLE `applicant_workhour` DISABLE KEYS */;
INSERT INTO `applicant_workhour` VALUES (1,1,2),(2,2,2),(3,3,3),(4,4,2),(5,5,3),(6,6,2),(7,7,2),(8,NULL,NULL),(9,9,2),(10,NULL,NULL),(11,11,2),(12,12,2),(13,13,1),(14,14,1),(15,15,2),(16,16,3),(17,17,1),(18,18,2),(19,19,2),(20,20,2),(21,21,1),(22,22,1),(23,23,1),(24,24,3),(25,25,3),(26,26,3),(27,27,2),(28,28,2),(29,29,2),(30,30,3),(31,31,2),(32,32,3),(33,33,1),(34,34,2),(35,35,3),(36,36,2),(37,37,3),(38,38,1),(39,39,2),(40,40,3),(41,41,3),(42,42,1),(43,43,2),(44,44,3),(45,45,2),(46,46,1),(47,47,3),(48,48,1),(49,49,2),(50,50,3),(51,51,1),(52,52,3),(53,53,3),(54,54,3),(55,55,2),(56,56,1),(57,57,2),(58,58,1),(59,59,3),(60,60,1),(61,61,1),(62,62,3),(63,63,3),(64,64,3),(65,65,1),(66,66,1),(67,67,2),(68,68,1),(69,69,2),(70,70,1),(71,71,2),(72,72,3),(73,73,2),(74,74,2),(75,75,2),(76,76,1),(77,77,3),(78,78,1),(79,79,3),(80,80,3),(81,81,2),(82,82,3),(83,83,2),(84,84,2),(85,85,2),(86,86,1),(87,87,1),(88,88,1),(89,89,3),(90,90,3),(91,91,2),(92,92,2),(93,93,2),(94,94,3),(95,95,2),(96,96,3),(97,97,3),(98,98,2),(99,99,3),(100,100,3),(101,101,2),(102,102,3),(103,103,1),(104,104,1),(105,105,2),(106,106,3),(107,107,2),(108,108,2),(109,109,2),(110,110,1),(111,111,1),(112,112,1),(113,113,1),(114,114,2),(115,115,1),(116,116,2),(117,117,1),(118,118,1),(119,119,3),(120,120,3),(121,121,1),(122,122,2),(123,123,1),(124,124,3),(125,125,1),(126,126,2),(127,127,2),(128,128,2),(129,129,2),(130,130,3),(131,131,3),(132,132,2),(133,133,1),(134,134,2),(135,135,2),(136,136,1),(137,137,1),(138,138,3),(139,139,3),(140,140,2),(141,141,2),(142,142,2),(143,143,1),(144,144,2),(145,145,1),(146,146,3),(147,147,3),(148,148,3),(149,149,2),(150,150,3),(151,151,2),(152,152,2),(153,153,2),(154,154,1),(155,155,1),(156,156,2),(157,157,1),(158,158,2),(159,159,1),(160,160,1),(161,161,1),(162,162,1),(163,163,3),(164,164,3),(165,165,2),(166,166,3),(167,167,3),(168,168,2),(169,169,3),(170,170,3),(171,171,2),(172,172,1),(173,173,1),(174,174,2),(175,175,2),(176,176,3),(177,177,3),(178,178,1),(179,179,2),(180,180,3),(181,181,2),(182,182,2),(183,183,1),(184,184,1),(185,185,2),(186,186,2),(187,187,1),(188,188,1),(189,189,2),(190,190,1),(191,191,2),(192,192,2),(193,193,3),(194,194,1),(195,195,3),(196,196,3),(197,197,2),(198,198,2),(199,199,2),(200,200,2),(201,201,1),(202,202,1),(203,203,3),(204,204,3),(205,205,3),(206,206,1),(207,207,3),(208,208,1),(209,209,3),(210,210,3),(211,211,3),(212,212,3),(213,213,1),(214,NULL,NULL),(215,215,1),(216,216,3),(217,217,2),(218,218,1),(219,219,2),(220,220,2),(221,221,1),(222,222,1),(223,223,2),(224,224,1),(225,225,1),(226,226,3),(227,227,2),(228,228,1),(229,229,3),(230,230,2),(231,231,2),(232,232,2),(233,233,1),(234,234,2),(235,235,1),(236,236,1),(237,237,1),(238,238,1),(239,239,1),(240,240,1),(241,241,1),(242,242,1),(243,243,1),(244,244,1),(245,245,1),(246,246,1),(247,247,1),(248,248,1),(249,249,1),(250,250,1),(251,251,1),(252,252,1),(253,253,1),(254,254,1),(255,255,1),(256,256,1),(257,257,1),(258,258,1),(259,259,1),(260,260,1),(261,261,1),(262,262,1),(263,263,1),(264,264,1),(265,265,1),(266,266,1),(267,267,1),(268,268,1),(269,269,1),(270,270,1),(271,271,1),(272,272,1),(273,273,1),(274,274,1),(275,275,1),(276,276,1),(277,277,1),(278,278,1),(279,NULL,NULL),(280,NULL,NULL),(281,NULL,NULL),(282,NULL,NULL),(283,NULL,NULL),(284,NULL,NULL),(285,NULL,NULL),(286,NULL,NULL),(287,NULL,NULL),(288,288,3),(289,289,3),(290,290,3),(291,NULL,NULL),(292,292,2),(293,NULL,NULL),(294,NULL,NULL),(295,295,3),(296,296,2),(297,297,2),(298,298,3),(299,299,2),(300,300,2),(301,301,3),(302,302,3),(303,303,3),(304,304,3),(305,305,3),(306,306,3),(307,307,3),(308,308,3),(309,309,3),(310,310,3),(311,311,3),(312,312,3),(313,313,3),(314,314,3),(315,315,3),(316,316,3),(317,317,3),(318,318,3),(319,319,2),(320,320,2),(321,NULL,NULL),(322,322,2),(323,323,2),(324,324,2),(325,325,2),(326,326,2),(327,327,2),(328,328,2),(329,NULL,NULL),(330,NULL,NULL),(331,331,2),(332,332,2),(333,333,2),(334,334,2),(335,335,3),(336,336,2),(337,337,2),(338,338,2),(339,339,2),(340,340,2),(341,341,2),(342,342,2),(343,343,2),(344,344,2),(345,345,2),(346,NULL,NULL),(347,347,2),(348,348,2),(349,349,2),(350,350,2),(351,351,2),(352,352,2),(353,353,2),(354,354,2),(355,355,2),(356,356,2),(357,357,2),(358,NULL,NULL),(359,359,3),(360,360,3),(361,361,3),(362,362,3),(363,363,3),(364,364,3),(365,365,3),(366,366,3),(367,367,3),(368,368,3),(369,369,3),(370,370,3),(371,371,3),(372,372,3),(373,373,3),(374,374,3),(375,375,3),(376,376,3),(377,377,3),(378,378,3),(379,379,3),(380,380,3),(381,381,3),(382,382,3),(383,383,3),(384,384,3),(385,385,3),(386,386,3),(387,387,3),(388,388,3),(389,389,3),(390,390,3),(391,391,3),(392,392,3),(393,393,3),(394,394,3),(395,395,3),(396,396,2),(397,397,1),(398,398,2),(399,399,1),(400,400,3),(401,401,1),(402,402,1),(403,403,2),(404,404,1),(405,405,1),(406,406,1),(407,407,2),(408,408,1),(409,409,3),(410,410,2),(411,411,1),(412,412,2),(413,413,2),(414,414,2),(415,415,3),(416,416,2),(417,417,2),(418,418,3),(419,419,3),(420,420,2),(421,421,2),(422,422,2),(423,423,3),(424,424,3),(425,425,2),(426,426,3),(427,427,2),(428,428,2),(429,429,3),(430,430,3),(431,431,3),(432,432,3),(433,433,1),(434,434,1),(435,435,1),(436,436,1),(437,437,1),(438,438,1),(439,439,1),(440,440,1),(441,441,1),(442,442,1),(443,443,1),(444,444,1),(445,445,1),(446,446,1),(447,447,3),(448,448,3),(449,449,1),(450,450,2),(451,451,1),(452,452,3),(453,453,1),(454,454,1),(455,455,3),(456,456,1),(457,457,1),(458,458,1),(459,459,2),(460,460,2),(461,461,3),(462,NULL,NULL),(463,NULL,NULL),(464,NULL,NULL),(465,NULL,NULL),(466,NULL,NULL),(467,NULL,NULL),(468,NULL,NULL),(469,NULL,NULL),(470,NULL,NULL),(471,NULL,NULL),(472,NULL,NULL),(473,NULL,NULL),(474,NULL,NULL),(475,NULL,NULL),(476,NULL,NULL),(477,477,3),(478,NULL,NULL),(479,NULL,NULL),(480,NULL,NULL),(481,NULL,NULL),(482,482,3),(483,NULL,NULL),(484,NULL,NULL),(485,NULL,NULL),(486,NULL,NULL),(487,NULL,NULL),(488,NULL,NULL),(489,NULL,NULL),(490,NULL,NULL),(491,NULL,NULL),(492,NULL,NULL),(493,NULL,NULL),(494,NULL,NULL),(495,NULL,NULL),(496,NULL,NULL),(497,497,3),(498,498,3),(499,NULL,NULL),(500,NULL,NULL),(501,NULL,NULL);
/*!40000 ALTER TABLE `applicant_workhour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefit`
--

DROP TABLE IF EXISTS `benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefit` (
  `id_benefit` int NOT NULL AUTO_INCREMENT,
  `benefit` varchar(30) NOT NULL,
  PRIMARY KEY (`id_benefit`),
  UNIQUE KEY `id_benefit` (`id_benefit`),
  UNIQUE KEY `benefit` (`benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefit`
--

LOCK TABLES `benefit` WRITE;
/*!40000 ALTER TABLE `benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `benefit` ENABLE KEYS */;
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
  `phonenumber_1` varchar(15) DEFAULT NULL,
  `phonenumber_2` varchar(15) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `have_more_workers` tinyint(1) DEFAULT NULL,
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
  `id_document_folder` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_personal_folder` bigint DEFAULT NULL,
  `FK_id_document_type` int DEFAULT NULL,
  `folder_url` varchar(300) NOT NULL,
  `id_folder_generated` varchar(50) NOT NULL,
  PRIMARY KEY (`id_document_folder`),
  UNIQUE KEY `id_folder_document` (`id_document_folder`),
  KEY `FK_id_folder` (`FK_id_personal_folder`),
  KEY `FK_id_document_type` (`FK_id_document_type`),
  CONSTRAINT `document_folder_ibfk_1` FOREIGN KEY (`FK_id_personal_folder`) REFERENCES `personal_folder` (`id_personal_folder`),
  CONSTRAINT `document_folder_ibfk_2` FOREIGN KEY (`FK_id_document_type`) REFERENCES `document_type` (`id_document_type`)
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
  `FK_id_document_type` int DEFAULT NULL,
  PRIMARY KEY (`id_document_job`),
  UNIQUE KEY `id_document_job` (`id_document_job`),
  KEY `Fk_id_job` (`Fk_id_job`),
  KEY `FK_id_document` (`FK_id_document_type`),
  CONSTRAINT `document_job_ibfk_1` FOREIGN KEY (`Fk_id_job`) REFERENCES `job` (`id_job`),
  CONSTRAINT `document_job_ibfk_2` FOREIGN KEY (`FK_id_document_type`) REFERENCES `document_type` (`id_document_type`)
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
  `id_document_type` int NOT NULL AUTO_INCREMENT,
  `document_name` varchar(60) NOT NULL,
  PRIMARY KEY (`id_document_type`),
  UNIQUE KEY `id_document` (`id_document_type`),
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (6,'Carrera técnica'),(8,'Doctorado'),(4,'Licenciatura'),(7,'Maestría'),(3,'Preparatoria'),(1,'Primaria'),(2,'Secundaria'),(5,'Universidad trunca');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id_file` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_folder_document` bigint DEFAULT NULL,
  `file_url` varchar(300) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `id_file_generated` varchar(50) NOT NULL,
  PRIMARY KEY (`id_file`),
  UNIQUE KEY `id_file` (`id_file`),
  UNIQUE KEY `file_url` (`file_url`),
  KEY `FK_id_Folder` (`FK_id_folder_document`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`FK_id_folder_document`) REFERENCES `document_folder` (`id_document_folder`)
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (6,'Asistente educativo'),(3,'Docente'),(14,'Docente de preescolar'),(12,'Docente de primaria'),(13,'Docente de secundaria'),(1,'Empleado/a Doméstico/a'),(9,'Enfermero/a'),(10,'Ingeniero industrial'),(11,'Ingeniero químico'),(2,'Jardínero/a'),(5,'Maestro/a de natación'),(4,'Niñera'),(8,'Profesor/a de inglés'),(7,'Técnico en puericultura');
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
  `salary` decimal(10,0) DEFAULT NULL,
  `work_place` varchar(60) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `locality` varchar(200) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `applicants_for_hiring` int DEFAULT NULL,
  `applicant_experience` tinyint(1) DEFAULT NULL,
  `applicant_tattoos_piercings` tinyint(1) DEFAULT NULL,
  `applicant_disability` tinyint(1) DEFAULT NULL,
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
-- Table structure for table `job_offer_benefit`
--

DROP TABLE IF EXISTS `job_offer_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer_benefit` (
  `id_job_offer_benefit` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_benefit` int DEFAULT NULL,
  PRIMARY KEY (`id_job_offer_benefit`),
  UNIQUE KEY `id_offer_benefit` (`id_job_offer_benefit`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_benefit` (`FK_id_benefit`),
  CONSTRAINT `job_offer_benefit_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `job_offer_benefit_ibfk_2` FOREIGN KEY (`FK_id_benefit`) REFERENCES `benefit` (`id_benefit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer_benefit`
--

LOCK TABLES `job_offer_benefit` WRITE;
/*!40000 ALTER TABLE `job_offer_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer_benefit` ENABLE KEYS */;
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
-- Table structure for table `job_offer_workhour`
--

DROP TABLE IF EXISTS `job_offer_workhour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offer_workhour` (
  `id_job_offer_workhour` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_job_offer` bigint DEFAULT NULL,
  `FK_id_workhour` int DEFAULT NULL,
  PRIMARY KEY (`id_job_offer_workhour`),
  UNIQUE KEY `id_job_offer_work_hour` (`id_job_offer_workhour`),
  KEY `FK_id_job_offer` (`FK_id_job_offer`),
  KEY `FK_id_work_hour` (`FK_id_workhour`),
  CONSTRAINT `job_offer_workhour_ibfk_1` FOREIGN KEY (`FK_id_job_offer`) REFERENCES `job_offer` (`id_job_offer`),
  CONSTRAINT `job_offer_workhour_ibfk_2` FOREIGN KEY (`FK_id_workhour`) REFERENCES `workhour` (`id_workhour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offer_workhour`
--

LOCK TABLES `job_offer_workhour` WRITE;
/*!40000 ALTER TABLE `job_offer_workhour` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_offer_workhour` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (2,'Español'),(3,'Francés'),(1,'Inglés'),(4,'Italiano'),(5,'Portugués');
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
-- Table structure for table `personal_folder`
--

DROP TABLE IF EXISTS `personal_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_folder` (
  `id_personal_folder` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_applicant` bigint DEFAULT NULL,
  `folder_name` varchar(60) DEFAULT NULL,
  `folder_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_personal_folder`),
  UNIQUE KEY `id_folder` (`id_personal_folder`),
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
  `id_physical_condition` int NOT NULL AUTO_INCREMENT,
  `physical_activity` varchar(100) NOT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_physical_condition`),
  UNIQUE KEY `id_condition` (`id_physical_condition`),
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
INSERT INTO `status` VALUES (1,'Colocado/a'),(2,'No colocado/a'),(4,'No disponible'),(3,'Vetado/a');
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
-- Table structure for table `work_reference`
--

DROP TABLE IF EXISTS `work_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_reference` (
  `id_work_reference` bigint NOT NULL AUTO_INCREMENT,
  `FK_id_work_experience` bigint DEFAULT NULL,
  `FK_id_applicant` bigint DEFAULT NULL,
  `reference_name` varchar(60) DEFAULT NULL,
  `reference_job_position` varchar(60) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `work_reference_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_work_reference`),
  UNIQUE KEY `id_work_reference` (`id_work_reference`),
  KEY `FK_id_work_experience` (`FK_id_work_experience`),
  KEY `FK_id_applicant` (`FK_id_applicant`),
  CONSTRAINT `work_reference_ibfk_1` FOREIGN KEY (`FK_id_work_experience`) REFERENCES `work_experience` (`id_work_experience`),
  CONSTRAINT `work_reference_ibfk_2` FOREIGN KEY (`FK_id_applicant`) REFERENCES `applicant` (`id_applicant`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_reference`
--

LOCK TABLES `work_reference` WRITE;
/*!40000 ALTER TABLE `work_reference` DISABLE KEYS */;
INSERT INTO `work_reference` VALUES (1,NULL,462,'Centro Educativo Alpha Omega',NULL,NULL,NULL),(2,NULL,463,'Lic. Tania Aguilar',NULL,'5568978381',NULL),(3,NULL,464,'Graciela Chávez Vertiz',NULL,NULL,NULL),(4,NULL,465,'Colegio El Roble',NULL,NULL,NULL),(5,NULL,466,'Lic. Lucero Aimeida De La Fuente',NULL,NULL,NULL),(6,NULL,467,'Lic. Anahi Leòn Reyes',NULL,'5574227322',NULL),(7,NULL,468,'Lic. Fátima Blancas',NULL,NULL,NULL),(8,NULL,469,'Daisy Gutiérrez Morales',NULL,NULL,NULL),(9,NULL,470,'Lilia Ameyali Rodríguez Monroy',NULL,'5549158237',NULL),(10,NULL,471,'Aurora Tapla Tolama',NULL,'5549931724',NULL),(11,NULL,472,'Lic. Erika Sánchez','Directora De Centro De Desarrollo Infantil Goratony',NULL,NULL),(12,NULL,473,'Colegio Monteverde',NULL,NULL,NULL),(13,NULL,474,'Lic. Leonor López',NULL,NULL,NULL),(14,NULL,475,'Lic. Israel Perez Cruz',NULL,NULL,NULL),(15,NULL,476,'Colegio La Casa De Los Niños',NULL,NULL,NULL),(16,NULL,476,' Lic. Alma Rosa',NULL,'5561288419',NULL),(17,NULL,477,'Mtra. Maricel Quiroz López',NULL,NULL,NULL),(18,NULL,478,'The University Of Texas Pan American',NULL,NULL,NULL),(19,NULL,479,'Adriana León',NULL,NULL,NULL),(20,NULL,480,'Marisol Bautista Granados',NULL,NULL,NULL),(21,NULL,481,'Itzel Castro',NULL,NULL,NULL),(22,NULL,482,'Sra. Viridiana Lara',NULL,NULL,NULL),(23,NULL,483,'Instituto André Lapierre',NULL,'5524575937',NULL),(24,NULL,484,'Lic. Luz Del Carmen Sanchez',NULL,NULL,NULL),(25,NULL,485,'Marisol Coria Ardura',NULL,NULL,NULL),(26,NULL,486,'Centro Escolar México',' S.C',NULL,NULL),(27,NULL,487,'Ing. David Quintero',NULL,NULL,NULL),(28,NULL,488,'Sra. Carolina Ibáñez',NULL,NULL,NULL),(29,NULL,489,'Doris Carolina Sánchez Olivares',NULL,NULL,NULL),(30,NULL,490,'Patricia Gutiérrez','Directora Del Jardín De Niños',NULL,NULL),(31,NULL,491,'Ruth Muciño',NULL,'5530877005',NULL),(32,NULL,492,'Instituto Ptolomei',NULL,NULL,NULL),(33,NULL,493,'María Carolina',NULL,NULL,NULL),(34,NULL,494,'Abigail Lorea',NULL,NULL,NULL),(35,NULL,495,'Patricia Gutiérrez Sánchez',NULL,NULL,NULL),(36,NULL,496,'Ing. Jorge López Vargas',NULL,NULL,NULL),(37,NULL,497,'Carlos Stefano Fragoso Martínez',NULL,NULL,NULL),(38,NULL,498,'Sra. Paulina Martin Martinez',NULL,'3222646686',NULL),(39,NULL,499,' ',NULL,NULL,NULL),(40,NULL,500,' ',NULL,NULL,NULL),(41,NULL,501,' ',NULL,NULL,NULL);
/*!40000 ALTER TABLE `work_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workhour`
--

DROP TABLE IF EXISTS `workhour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workhour` (
  `id_workhour` int NOT NULL AUTO_INCREMENT,
  `mode` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_workhour`),
  UNIQUE KEY `id_workhour` (`id_workhour`),
  UNIQUE KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workhour`
--

LOCK TABLES `workhour` WRITE;
/*!40000 ALTER TABLE `workhour` DISABLE KEYS */;
INSERT INTO `workhour` VALUES (1,'Entrada Por Salida','Turno de 8 a 12 horas'),(2,'De Planta (Salida Cada 15 Días)',NULL),(3,'De planta (Salida Cada 8 Días)',NULL),(4,'Ocasional','Sin días establecidos');
/*!40000 ALTER TABLE `workhour` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 15:08:05
