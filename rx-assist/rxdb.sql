-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: rx_db
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add medical',7,'add_medical'),(26,'Can change medical',7,'change_medical'),(27,'Can delete medical',7,'delete_medical'),(28,'Can view medical',7,'view_medical'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add ment',9,'add_ment'),(34,'Can change ment',9,'change_ment'),(35,'Can delete ment',9,'delete_ment'),(36,'Can view ment',9,'view_ment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_medical`
--

DROP TABLE IF EXISTS `core_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_medical` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `s1` varchar(200) NOT NULL,
  `s2` varchar(200) NOT NULL,
  `s3` varchar(200) NOT NULL,
  `s4` varchar(200) NOT NULL,
  `s5` varchar(200) NOT NULL,
  `disease` varchar(200) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_medical_doctor_id_3d50ad37_fk_core_user_id` (`doctor_id`),
  KEY `core_medical_patient_id_5344c821_fk_core_user_id` (`patient_id`),
  CONSTRAINT `core_medical_doctor_id_3d50ad37_fk_core_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_medical_patient_id_5344c821_fk_core_user_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_medical`
--

LOCK TABLES `core_medical` WRITE;
/*!40000 ALTER TABLE `core_medical` DISABLE KEYS */;
INSERT INTO `core_medical` VALUES (46,'abnormal_menstruation','acidity','blister','bruising','diarrhoea','Gastroenteritis','Paracetamol Tablet 500mg','2023-12-21 04:57:54.528402',NULL,10),(47,'bladder_discomfort','breathlessness','chills','high_fever','lethargy','Urinary tract infection','Paracetamol Tablet 500mg','2023-12-21 04:58:36.815143',NULL,10),(48,'yellowish_skin','dizziness','drying_and_tingling_lips','nausea','fatigue','Hepatitis C','Paracetamol Tablet 500mg','2023-12-21 05:01:21.678755',NULL,10),(49,'acidity','chills','breathlessness','fatigue','lethargy','Allergy','Fexova 180mg Tablet 10\'SFexova 120mg Tablet 10\'S','2023-12-21 06:00:58.031819',NULL,10),(50,'acidity','back_pain','breathlessness','cough','congestion','GERD','Paracetamol Tablet 500mg','2023-12-21 10:02:38.820571',NULL,10),(51,'acidity','dehydration','lethargy','constipation','bruising','Gastroenteritis','Paracetamol Tablet 500mg','2023-12-21 10:10:21.842362',NULL,10),(52,'acidity','dehydration','lethargy','acidity','bruising','Gastroenteritis','Metronidazole Tablet 250mg','2023-12-21 10:10:50.088970',NULL,10),(53,'acidity','dehydration','lethargy','acidity','bruising','Gastroenteritis','','2023-12-21 10:10:51.302315',NULL,10),(54,'acidity','dehydration','lethargy','acidity','bruising','Gastroenteritis','','2023-12-21 10:10:56.110801',NULL,10),(55,'acidity','dehydration','lethargy','loss_of_balance','bruising','Gastroenteritis','','2023-12-21 10:11:06.649215',NULL,10),(56,'acidity','dehydration','lethargy','loss_of_balance','bruising','Gastroenteritis','','2023-12-21 10:11:08.787270',NULL,10),(57,'irregular_sugar_level','dehydration','lethargy','loss_of_balance','bruising','Gastroenteritis','','2023-12-21 10:11:34.568025',NULL,10),(58,'irregular_sugar_level','breathlessness','lethargy','loss_of_balance','bruising','Heart Attack','Ibuprofen Capsule 200mg','2023-12-21 10:11:47.693408',NULL,10),(59,'loss_of_smell','brittle_nails','belly_pain','cough','altered_sensorium','Paralysis (brain hemorrhage)','Cervical Collar','2023-12-21 10:14:29.779146',NULL,10),(60,'loss_of_smell','brittle_nails','belly_pain','cough','swelling_of_stomach','4: [\'Hypothyroidism\', \'GERD\', \'Alcoholic hepatitis\', \'Alcoholic Hepatitis\']','Make Appointment','2023-12-21 10:16:14.976487',NULL,10),(61,'loss_of_smell','abdominal_pain','belly_pain','cough','swelling_of_stomach','Alcoholic Hepatitis','','2023-12-21 10:19:01.943778',NULL,10),(62,'high_fever','yellowish_skin','dehydration','diarrhoea','fatigue','Gastroenteritis','Ipratropium Bromide Inhalation Solution 0.02%','2024-01-07 14:55:30.767416',NULL,25),(63,'high_fever','scurring','dehydration','diarrhoea','fatigue','Gastroenteritis','','2024-01-07 14:55:53.629105',NULL,25),(64,'bruising','headache','diarrhoea','high_fever','anxiety','4: [\'Gastroenteritis\', \'Malaria\']','','2024-01-09 04:08:39.468530',NULL,25),(65,'bruising','headache','diarrhoea','high_fever','abdominal_pain','Typhoid','Paracetamol Tablet 500mg','2024-01-09 04:09:41.361049',NULL,25),(66,'abnormal_menstruation','altered_sensorium','acidity','burning_micturition','knee_pain','Paralysis (brain hemorrhage)','Paracetamol Tablet 500mg','2024-03-17 05:44:55.654313',NULL,27);
/*!40000 ALTER TABLE `core_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ment`
--

DROP TABLE IF EXISTS `core_ment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_ment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `time` varchar(200) DEFAULT NULL,
  `ment_day` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `medical_id` bigint DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_ment_doctor_id_60a15865_fk_core_user_id` (`doctor_id`),
  KEY `core_ment_medical_id_f2161916_fk_core_medical_id` (`medical_id`),
  KEY `core_ment_patient_id_d91dbfa4_fk_core_user_id` (`patient_id`),
  CONSTRAINT `core_ment_doctor_id_60a15865_fk_core_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `core_ment_medical_id_f2161916_fk_core_medical_id` FOREIGN KEY (`medical_id`) REFERENCES `core_medical` (`id`),
  CONSTRAINT `core_ment_patient_id_d91dbfa4_fk_core_user_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ment`
--

LOCK TABLES `core_ment` WRITE;
/*!40000 ALTER TABLE `core_ment` DISABLE KEYS */;
INSERT INTO `core_ment` VALUES (25,1,'11:00','2024-01-11 00:00:00.000000','2023-12-21 04:58:02.927783',8,46,10),(26,0,NULL,NULL,'2023-12-21 05:40:31.332979',NULL,48,10),(27,0,NULL,NULL,'2023-12-21 05:49:56.952263',NULL,47,10),(28,1,'11:30','2024-01-13 00:00:00.000000','2023-12-21 06:04:38.363902',8,49,10),(29,0,NULL,NULL,'2023-12-21 10:20:37.023055',NULL,61,10),(30,0,NULL,NULL,'2023-12-21 10:20:37.857549',NULL,60,10),(31,1,'10:00','2024-03-19 00:00:00.000000','2024-01-09 04:10:08.270678',8,65,25),(32,0,NULL,NULL,'2024-01-09 04:10:09.496605',NULL,64,25),(33,0,NULL,NULL,'2024-03-17 05:45:11.797980',NULL,66,27);
/*!40000 ALTER TABLE `core_ment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_profile`
--

DROP TABLE IF EXISTS `core_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `region` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `core_profile_user_id_bf8ada58_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_profile`
--

LOCK TABLES `core_profile` WRITE;
/*!40000 ALTER TABLE `core_profile` DISABLE KEYS */;
INSERT INTO `core_profile` VALUES (4,'profile/avator.png','1998-04-12','','Male','Pakistan',5),(5,'profile/avator.png','1999-11-12','South Asia','Male','Pakistan',7),(6,'profile/avator.png','1999-01-11','Asia','Male','India',9),(7,'profile/avator.png','1986-12-12','Asia','Male','India',10),(8,'profile/avator.png','2002-12-12','Asia','','India',22),(9,'profile/avator.png','2003-12-07','Asia','Male','India',23),(10,'profile/avator.png','2000-12-06','sout','','gange',24),(11,'profile/avator.png','2002-12-07','europe','Male','london',25),(12,'profile/avator.png','2002-12-02','Asia','None','India',26),(13,'profile/avator.png','2000-12-01','Bangalore','Male','India',27);
/*!40000 ALTER TABLE `core_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_patient` tinyint(1) NOT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  `phonenumber` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$320000$VlHDTmfgTjhPFkxz5JtJXz$kGQbdj52lpKcDB7UW4LnpT5OlbqpX1pC/H5wGV7DwuY=','2022-08-05 01:22:24.881763',1,'admin','','','admin@gmail.com',1,1,'2022-08-02 20:11:03.218100',0,0,NULL),(2,'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=','2022-08-05 01:21:36.409364',0,'usama','Usama','Subhani','usamasubhani@gmail.com',0,1,'2022-08-02 20:14:43.000000',0,1,'+923350616908'),(5,'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=','2022-08-05 01:12:58.142095',0,'shah','','','s@gmail.com',0,1,'2022-08-02 21:38:37.402888',1,0,NULL),(7,'pbkdf2_sha256$320000$ab5hrdjqEIFfbGqn5E9DsP$fKZiX95Y65RtSjwPBUTzwHbR6z25sU9BmD1RhO92vvA=','2022-08-04 15:51:28.280593',0,'ali','','','ali@gmail.com',0,1,'2022-08-03 23:15:38.305476',1,0,NULL),(8,'pbkdf2_sha256$320000$RJ6Zg1lZpLDPDecpnORTeI$zvhDE/QGgVcXlg+otDFLPniWcaxayVICz0Kjbg730Xc=','2024-03-17 05:45:23.167161',1,'Abbas','BI Mohammed','Abbas','bimohammadabbas@gmail.com',1,1,'2023-12-03 16:12:14.000000',0,1,'6362187881'),(9,'pbkdf2_sha256$320000$6NZA63YIYD6XQLepdIZfAm$+AVIkJ+1zvzrQK7JpQDzi9GYrJB+DZBrKNWYiQTNQwo=','2023-12-17 09:40:25.901564',0,'biabbas','','','biabbbas@gmail.com',0,1,'2023-12-03 16:17:54.401205',1,0,NULL),(10,'pbkdf2_sha256$320000$gKf9SkIsAqYCBVxImeRAzn$0wQly0MM1C4b2rSBfJ17xYy+9xepgVpVKuexZu3VOqs=','2023-12-21 10:09:34.203451',0,'chirag','','','chirag@gmail.com',0,1,'2023-12-05 12:54:08.466811',1,0,NULL),(22,'pbkdf2_sha256$320000$rBePDBF1FUMm8ffzehkvmc$KM9AxprHgbZA6yA853O5534WJUbKmgPeupd18zytE6Y=','2023-12-17 13:06:42.086507',0,'bi79','','','bi@gg.com',0,1,'2023-12-17 13:06:22.298357',1,0,NULL),(23,'pbkdf2_sha256$320000$dUjJFEgBTFdeeS41JlXDTv$xQinrWgSbxDNLvhATMN2OXyeW7YR+QP3nDuE2nitHnk=',NULL,0,'bi88','','','bim@gmg.com',0,1,'2023-12-17 13:12:48.581583',1,0,NULL),(24,'pbkdf2_sha256$320000$Jnq0sjrDyIjqtfIMvSyZvs$ObbWqlr3ON8BzLz/UjB0hE8Zx8jRuIsYAIMRq630nlY=',NULL,0,'bi22','','','b@g.com',0,1,'2023-12-17 13:16:50.063247',1,0,NULL),(25,'pbkdf2_sha256$320000$Io6XQChsPcsyxq6eJg2qFS$fQqD1rN5TnBjjXNS2yJfYDHNVP89N0K9UMeMStijuuI=','2024-01-09 04:07:36.526785',0,'bi20','','','l@e.pum',0,1,'2023-12-17 13:21:54.966188',1,0,NULL),(26,'pbkdf2_sha256$320000$aUqiFXBNXANkVdCUWjqURg$Nkdy/P2ji1ZmSWaDqP2td/6r6y13CkM3ZP1AcW/ABHQ=','2023-12-20 15:14:21.483042',0,'ch','','','b@k.c',0,1,'2023-12-19 14:01:50.318791',1,0,NULL),(27,'pbkdf2_sha256$320000$MhRyW2J5KUnS1hhZChXOEt$PVdmltESynogy6TcvSm/qp2hTudr+dlu5ut9wOugrZY=','2024-03-17 05:44:34.579727',0,'dem2','','','demo2@gmail.com',0,1,'2024-03-16 12:04:01.516441',1,0,NULL);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-08-02 20:15:07.156978','2','usama',1,'[{\"added\": {}}]',6,1),(2,'2022-08-02 20:15:40.121734','3','absar',1,'[{\"added\": {}}]',6,1),(3,'2022-08-02 20:16:07.053480','3','absar',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(4,'2022-08-02 20:16:15.287156','2','usama',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(5,'2022-08-02 20:17:25.367319','2','usama',2,'[]',6,1),(6,'2022-08-02 21:41:15.137826','2','usama',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',6,1),(7,'2022-08-02 21:45:23.296368','2','usama',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(8,'2022-08-02 21:45:49.622705','2','usama',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(9,'2022-08-02 21:46:05.424582','3','absar',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Active\"]}}]',6,1),(10,'2022-08-02 21:46:52.184090','3','absar',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(11,'2022-08-04 15:12:37.764455','2','usama',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,1),(12,'2023-12-05 07:57:48.626917','8','Abbas',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Is doctor\", \"Phonenumber\"]}}]',6,8),(13,'2023-12-05 08:03:14.393298','5','Hypertension',2,'[{\"changed\": {\"fields\": [\"Disease\", \"Doctor\"]}}]',7,8),(14,'2023-12-17 13:14:09.986479','9','India',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',8,8);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'core','medical'),(9,'core','ment'),(8,'core','profile'),(6,'core','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-08-02 20:07:11.940307'),(2,'contenttypes','0002_remove_content_type_name','2022-08-02 20:07:11.991364'),(3,'auth','0001_initial','2022-08-02 20:07:12.172850'),(4,'auth','0002_alter_permission_name_max_length','2022-08-02 20:07:12.210672'),(5,'auth','0003_alter_user_email_max_length','2022-08-02 20:07:12.218232'),(6,'auth','0004_alter_user_username_opts','2022-08-02 20:07:12.224229'),(7,'auth','0005_alter_user_last_login_null','2022-08-02 20:07:12.232912'),(8,'auth','0006_require_contenttypes_0002','2022-08-02 20:07:12.234909'),(9,'auth','0007_alter_validators_add_error_messages','2022-08-02 20:07:12.242904'),(10,'auth','0008_alter_user_username_max_length','2022-08-02 20:07:12.250544'),(11,'auth','0009_alter_user_last_name_max_length','2022-08-02 20:07:12.257669'),(12,'auth','0010_alter_group_name_max_length','2022-08-02 20:07:12.273362'),(13,'auth','0011_update_proxy_permissions','2022-08-02 20:07:12.280288'),(14,'auth','0012_alter_user_first_name_max_length','2022-08-02 20:07:12.286600'),(15,'core','0001_initial','2022-08-02 20:07:12.788235'),(16,'admin','0001_initial','2022-08-02 20:07:12.887972'),(17,'admin','0002_logentry_remove_auto_add','2022-08-02 20:07:12.906525'),(18,'admin','0003_logentry_add_action_flag_choices','2022-08-02 20:07:12.919273'),(19,'sessions','0001_initial','2022-08-02 20:07:12.952848');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bv75texjw8quxynb7fpu9oao8kvkwh9k','.eJxVjEEOwiAQRe_C2pDCFAGX7nsGMsxMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uLMur0u2Wkh9Qd8B3rbdY013WZst4VfdCmh5nleT3cv4OCrXxr2wlFcdmM5EPvwTEFFymcUbyzI_YOcsw5IPgYGKzYDoCMGPDMxEa9P-jtOAo:1oJm2i:p7aBde_VFneuZyz75qZbYff4P-5gEwR4sEQUrR5KzhQ','2022-08-19 01:22:24.885145'),('erpaora7n0svpx9dnc8nd1eay58d2f9v','.eJxVjEEOwiAQRe_C2hBaUAaX7nuGZoYZpGogKe3KeHfbpAvd_vfef6sR1yWPa5N5nFhdFajT70YYn1J2wA8s96pjLcs8kd4VfdCmh8ryuh3u30HGlrf6QgEdeGeQxBl2cBbsLEByhBLYA6BPPbL06MSmAJ0VJo_WxI3aqD5f-As4pQ:1rGGAg:5zbAWU9KqdZc1tEvDLsrfMhkL_pwpfPcz9vwJgIR6Is','2024-01-04 10:20:54.656462'),('qkpaj7v6cl4f7k6qqvrw2jha8bsg5k5s','.eJxVjEsOAiEQBe_C2hB6mKHFpXvPQGi6kVEDyXxWxrsbklno9lXVe6sQ962EfZUlzKwuCow6_Y4U01NqJ_yI9d50anVbZtJd0Qdd9a2xvK6H-3dQ4lp6DflMEwIgoOUEfrRemAYDMoChyaE31qCbhNH5BEJ2RJeSyewhE6nPF-UKN50:1rAqra:7_sz7s-ANZrFEFFnNEfKOAtSqB3WA28yhoHDC7wxbpQ','2023-12-20 12:18:50.111028'),('ycd4ngufas32sx3osp8i3cw090ibsdyo','.eJxVjMsOwiAQRf-FtSEjz-LSvd9AgBmkaiAp7cr475akC92ec-59Mx-2tfit0-JnZBfm2OmXxZCeVIfAR6j3xlOr6zJHPhJ-2M5vDel1Pdq_gxJ6GeuMCqURABqiNiYKMi7R5IwVQU07T1krGciAxUwSpDhbG9HuPlkE9vkC1lQ3RQ:1r9pGj:fhXEGQogkBRtXkz_JLYbs_HD0WotX3py-cCe41U3xDs','2023-12-17 16:24:33.020831');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-17 11:19:48
