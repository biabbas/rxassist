-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: rx_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `time` time DEFAULT NULL,
  `ment_day` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `medical_id` bigint DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_doctor_id` (`doctor_id`),
  KEY `fk_appointments_medical_id` (`medical_id`),
  KEY `fk_appointments_patient_id` (`patient_id`),
  CONSTRAINT `fk_appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_appointments_medical_id` FOREIGN KEY (`medical_id`) REFERENCES `patient_diagnosis` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (5,1,'12:00:00','2024-04-05 00:00:00.000000','2024-03-26 00:04:11.087609',8,11,30),(6,1,'11:00:00','2024-04-06 00:00:00.000000','2024-04-05 17:30:52.185452',8,9,27),(7,0,NULL,NULL,'2024-04-05 17:30:58.065902',NULL,10,27),(8,0,NULL,NULL,'2024-04-06 01:17:27.345648',NULL,16,27),(9,1,'03:00:00','2024-04-07 00:00:00.000000','2024-04-07 02:33:24.903194',8,19,31);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

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
);
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
);
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add medical',7,'add_medical'),(26,'Can change medical',7,'change_medical'),(27,'Can delete medical',7,'delete_medical'),(28,'Can view medical',7,'view_medical'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add ment',9,'add_ment'),(34,'Can change ment',9,'change_ment'),(35,'Can delete ment',9,'delete_ment'),(36,'Can view ment',9,'view_ment'),(37,'Can add symptom',10,'add_symptom'),(38,'Can change symptom',10,'change_symptom'),(39,'Can delete symptom',10,'delete_symptom'),(40,'Can view symptom',10,'view_symptom');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `sender` tinyint(1) NOT NULL,
  `diagnosis_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diagnosis_id` (`diagnosis_id`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`diagnosis_id`) REFERENCES `patient_diagnosis` (`id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'hello',1,9),(2,'wait',1,9),(3,'This is the doctor. How do you feel?',1,9),(4,'Hope you are better.',1,9),(5,'HI',1,11),(6,'I\'m fine doctor. ',0,9),(7,'The medicine you recommended works like a charm.',0,9),(8,'Hello, doctor. Please update.',0,16),(9,'You have allergy.',1,16),(10,'Hello, get back after using the medicine for 1 week.',1,18),(11,'Can you provide more details about your experiences?',1,19),(12,'Thank you.',0,19);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_profile`
--

LOCK TABLES `core_profile` WRITE;
/*!40000 ALTER TABLE `core_profile` DISABLE KEYS */;
INSERT INTO `core_profile` VALUES (4,'profile/avator.png','1998-04-12','','Male','Pakistan',5),(5,'profile/avator.png','1999-11-12','South Asia','Male','Pakistan',7),(6,'profile/avator.png','1999-01-11','Asia','Male','India',9),(7,'profile/avator.png','1986-12-12','Asia','Male','India',10),(8,'profile/avator.png','2002-12-12','Asia','','India',22),(9,'profile/avator.png','2003-12-07','Asia','Male','India',23),(10,'profile/avator.png','2000-12-06','sout','','gange',24),(11,'profile/avator.png','2002-12-07','europe','Male','london',25),(12,'profile/avator.png','2002-12-02','Asia','None','India',26),(13,'profile/avator.png','2000-12-01','Bangalore','Male','India',27),(14,'profile/avator.png','2003-01-11','Bangalore','Male','India',28),(15,'profile/avator.png','2002-12-12','Wakanda','Male','ksfj',29),(16,'profile/avator.png','2002-05-31','bangalore','Male','india',30),(17,'profile/avator.png','2002-03-02','blr','Male','ind',31);
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$320000$VlHDTmfgTjhPFkxz5JtJXz$kGQbdj52lpKcDB7UW4LnpT5OlbqpX1pC/H5wGV7DwuY=','2022-08-05 01:22:24.881763',1,'admin','','','admin@gmail.com',1,1,'2022-08-02 20:11:03.218100',0,0,NULL),(2,'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=','2022-08-05 01:21:36.409364',0,'usama','Usama','Subhani','usamasubhani@gmail.com',0,1,'2022-08-02 20:14:43.000000',0,1,'+923350616908'),(5,'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=','2022-08-05 01:12:58.142095',0,'shah','','','s@gmail.com',0,1,'2022-08-02 21:38:37.402888',1,0,NULL),(7,'pbkdf2_sha256$320000$ab5hrdjqEIFfbGqn5E9DsP$fKZiX95Y65RtSjwPBUTzwHbR6z25sU9BmD1RhO92vvA=','2022-08-04 15:51:28.280593',0,'ali','','','ali@gmail.com',0,1,'2022-08-03 23:15:38.305476',1,0,NULL),(8,'pbkdf2_sha256$720000$PLStY13iD4to5jtri0DiLL$WmOU8tWpoMmEjbnHsiJztRMtHGBr9kRDqUCIuD1FfSM=','2024-04-07 02:33:41.460722',1,'Abbas','BI Mohammed','Abbas','bimohammadabbas@gmail.com',1,1,'2023-12-03 16:12:14.000000',0,1,'6362187881'),(9,'pbkdf2_sha256$320000$6NZA63YIYD6XQLepdIZfAm$+AVIkJ+1zvzrQK7JpQDzi9GYrJB+DZBrKNWYiQTNQwo=','2023-12-17 09:40:25.901564',0,'biabbas','','','biabbbas@gmail.com',0,1,'2023-12-03 16:17:54.401205',1,0,NULL),(10,'pbkdf2_sha256$320000$gKf9SkIsAqYCBVxImeRAzn$0wQly0MM1C4b2rSBfJ17xYy+9xepgVpVKuexZu3VOqs=','2023-12-21 10:09:34.203451',0,'chirag','','','chirag@gmail.com',0,1,'2023-12-05 12:54:08.466811',1,0,NULL),(22,'pbkdf2_sha256$320000$rBePDBF1FUMm8ffzehkvmc$KM9AxprHgbZA6yA853O5534WJUbKmgPeupd18zytE6Y=','2023-12-17 13:06:42.086507',0,'bi79','','','bi@gg.com',0,1,'2023-12-17 13:06:22.298357',1,0,NULL),(23,'pbkdf2_sha256$320000$dUjJFEgBTFdeeS41JlXDTv$xQinrWgSbxDNLvhATMN2OXyeW7YR+QP3nDuE2nitHnk=',NULL,0,'bi88','','','bim@gmg.com',0,1,'2023-12-17 13:12:48.581583',1,0,NULL),(24,'pbkdf2_sha256$320000$Jnq0sjrDyIjqtfIMvSyZvs$ObbWqlr3ON8BzLz/UjB0hE8Zx8jRuIsYAIMRq630nlY=',NULL,0,'bi22','','','b@g.com',0,1,'2023-12-17 13:16:50.063247',1,0,NULL),(25,'pbkdf2_sha256$320000$Io6XQChsPcsyxq6eJg2qFS$fQqD1rN5TnBjjXNS2yJfYDHNVP89N0K9UMeMStijuuI=','2024-01-09 04:07:36.526785',0,'bi20','','','l@e.pum',0,1,'2023-12-17 13:21:54.966188',1,0,NULL),(26,'pbkdf2_sha256$320000$aUqiFXBNXANkVdCUWjqURg$Nkdy/P2ji1ZmSWaDqP2td/6r6y13CkM3ZP1AcW/ABHQ=','2023-12-20 15:14:21.483042',0,'ch','','','b@k.c',0,1,'2023-12-19 14:01:50.318791',1,0,NULL),(27,'pbkdf2_sha256$720000$DGHYY7dTnlc7nM34dD8guJ$r9Ry0IkRx0nafcfy7eeb7zPNWnVCjJGo+fNrabAyK8I=','2024-04-06 04:44:02.959605',0,'dem2','','','demo2@gmail.com',0,1,'2024-03-16 12:04:01.516441',1,0,NULL),(28,'pbkdf2_sha256$720000$1X3FSSDkKKfmErf3vy1JzI$NsDhEE+buJa7SXjkrjc6ybpPdp3o5/VvyjBUYpixQGA=','2024-03-20 17:28:02.182314',0,'mdabbas','','','bimohammadabbas@gmail.com',0,1,'2024-03-20 17:22:56.904305',1,0,NULL),(29,'pbkdf2_sha256$720000$8TJ7D9IfxWrVtdiO3PFxft$B9D3RSTzAtwGUu5mr6TZuRNDRRjai6bMsARejtk70Fg=','2024-03-25 17:30:23.085896',0,'dem3','','','bimo@gmail.com',0,1,'2024-03-25 17:30:09.406097',1,0,'3254535323'),(30,'pbkdf2_sha256$720000$LuPM8YTImRkJoBl42Fl4Fs$+FTjtn4kGo2NYSEl01uewSpM5zGm7s2DTuA8/x6p8AI=','2024-04-04 18:14:05.902323',0,'Shashank M R','','','smr9972675366@gmail.com',0,1,'2024-03-25 18:32:19.671160',1,0,'9972675366'),(31,'pbkdf2_sha256$720000$3LNiY2ov4GLEbscRLmvCLP$NPNRM/m2SM+QYf+BqBIB2f0myb5K3OJTUTXkiA5rLZk=','2024-04-07 02:34:09.348410',0,'dem4','','','bimohammedabbas@gmail.com',0,1,'2024-04-07 02:24:51.403871',1,0,'6362187881');
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
);
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_symptoms`
--

DROP TABLE IF EXISTS `diagnosis_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_symptoms` (
  `patient_diagnosis_id` bigint NOT NULL,
  `symptom` varchar(766) DEFAULT NULL,
  UNIQUE KEY `unique_patient_diagnosis_symptom` (`patient_diagnosis_id`,`symptom`),
  CONSTRAINT `fk_diagnosis_symptoms_patient_diagnosis_id` FOREIGN KEY (`patient_diagnosis_id`) REFERENCES `patient_diagnosis` (`id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_symptoms`
--

LOCK TABLES `diagnosis_symptoms` WRITE;
/*!40000 ALTER TABLE `diagnosis_symptoms` DISABLE KEYS */;
INSERT INTO `diagnosis_symptoms` VALUES (9,'abdominal_pain,acute_liver_failure,altered_sensorium,back_pain,chills,continuous_feel_of_urine,extra_marital_contacts,history_of_alcohol_consumption,pain_during_bowel_movements'),(10,'abdominal_pain,acute_liver_failure,altered_sensorium,back_pain,chills,continuous_feel_of_urine,extra_marital_contacts,history_of_alcohol_consumption,'),(11,'breathlessness,continuous_feel_of_urine,cough,cramps,joint_pain'),(12,'altered_sensorium,cold_hands_and_feets'),(13,'anxiety,cramps,hip_joint_pain,loss_of_smell,malaise'),(15,'constipation,blackheads,fluid_overload,fast_heart_rate'),(16,'abnormal_menstruation,acute_liver_failure'),(17,'abnormal_menstruation,chills,dizziness'),(18,'blister,brittle_nails,internal_itching'),(19,'abnormal_menstruation,cough,blister'),(20,'chills');
/*!40000 ALTER TABLE `diagnosis_symptoms` ENABLE KEYS */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
);
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'core','medical'),(9,'core','ment'),(8,'core','profile'),(10,'core','symptom'),(6,'core','user'),(5,'sessions','session');
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
);
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6nvu8l344kzzkke3js5o95efnh4ysu7g','.eJxVjDsOwjAQBe_iGlnxb4kp6TmDtetdcADZUpxUiLtDpBTQvpl5L5VwXUpau8xpYnVSzqjD70iYH1I3wnest6Zzq8s8kd4UvdOuL43led7dv4OCvXzrnDmLB7HuCMYyoidigBEwRsYY5GoR0DgXYPDRDmwCC7FxowFHHtX7AyTfOFQ:1rtIMD:eRbGmhS8dv44HZU4zlUxY3i26tkTDMBkYfIr-5I1tYY','2024-04-21 02:34:09.350777'),('71555g6v8ajo5e7j8slrf1hngh0i79lr','.eJxVjEEOwiAQRe_C2pBCKQwu3XsGMsxMpWrapLQr492VpAvdvvf-f6mE-1bSXmVNE6uzAnX6ZRnpIXMTfMf5tmha5m2dsm6JPmzV14XleTnav4OCtbS1d9jDGIJjMSAC1kQcg83WGesCEbPzRHGIg8k-QMeSracOgb4IevX-AOh1N74:1rsRmI:M2ENN9VNercZjUPUeKDoLdsiOcrVCErYMO5xnuq1m1U','2024-04-18 18:25:34.562269'),('b3i05mbbxdshui0vhvtosgkyipxvuseo','.eJxVjDsOwjAQBe_iGlng_1LScwZr7fXiALKlOKkQd4dIKaB9M_NeIuK61LiOMseJxFkoEIffMWF-lLYRumO7dZl7W-YpyU2ROx3y2qk8L7v7d1Bx1G_tErMFrUs4FsXeA3uw7BzYTN4GsiZ447LWiKoAO00nYkrZEpEx5MT7Aw5KOKE:1roo9P:Un-D0Hw2I6fmiD5xxSzCBM_uVvwYzhfBahhznrNKfn8','2024-04-08 17:30:23.087765'),('bv75texjw8quxynb7fpu9oao8kvkwh9k','.eJxVjEEOwiAQRe_C2pDCFAGX7nsGMsxMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uLMur0u2Wkh9Qd8B3rbdY013WZst4VfdCmh5nleT3cv4OCrXxr2wlFcdmM5EPvwTEFFymcUbyzI_YOcsw5IPgYGKzYDoCMGPDMxEa9P-jtOAo:1oJm2i:p7aBde_VFneuZyz75qZbYff4P-5gEwR4sEQUrR5KzhQ','2022-08-19 01:22:24.885145'),('erpaora7n0svpx9dnc8nd1eay58d2f9v','.eJxVjEEOwiAQRe_C2hBaUAaX7nuGZoYZpGogKe3KeHfbpAvd_vfef6sR1yWPa5N5nFhdFajT70YYn1J2wA8s96pjLcs8kd4VfdCmh8ryuh3u30HGlrf6QgEdeGeQxBl2cBbsLEByhBLYA6BPPbL06MSmAJ0VJo_WxI3aqD5f-As4pQ:1rGGAg:5zbAWU9KqdZc1tEvDLsrfMhkL_pwpfPcz9vwJgIR6Is','2024-01-04 10:20:54.656462'),('qkpaj7v6cl4f7k6qqvrw2jha8bsg5k5s','.eJxVjEsOAiEQBe_C2hB6mKHFpXvPQGi6kVEDyXxWxrsbklno9lXVe6sQ962EfZUlzKwuCow6_Y4U01NqJ_yI9d50anVbZtJd0Qdd9a2xvK6H-3dQ4lp6DflMEwIgoOUEfrRemAYDMoChyaE31qCbhNH5BEJ2RJeSyewhE6nPF-UKN50:1rAqra:7_sz7s-ANZrFEFFnNEfKOAtSqB3WA28yhoHDC7wxbpQ','2023-12-20 12:18:50.111028'),('ycd4ngufas32sx3osp8i3cw090ibsdyo','.eJxVjMsOwiAQRf-FtSEjz-LSvd9AgBmkaiAp7cr475akC92ec-59Mx-2tfit0-JnZBfm2OmXxZCeVIfAR6j3xlOr6zJHPhJ-2M5vDel1Pdq_gxJ6GeuMCqURABqiNiYKMi7R5IwVQU07T1krGciAxUwSpDhbG9HuPlkE9vkC1lQ3RQ:1r9pGj:fhXEGQogkBRtXkz_JLYbs_HD0WotX3py-cCe41U3xDs','2023-12-17 16:24:33.020831');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnosis`
--

DROP TABLE IF EXISTS `patient_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_diagnosis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `disease` varchar(200) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `patient_id` bigint NOT NULL,
  `num_symptoms` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_patient_diagnosis_doctor_id` (`doctor_id`),
  KEY `fk_patient_diagnosis_patient_id` (`patient_id`),
  CONSTRAINT `fk_patient_diagnosis_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_patient_diagnosis_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnosis`
--

LOCK TABLES `patient_diagnosis` WRITE;
/*!40000 ALTER TABLE `patient_diagnosis` DISABLE KEYS */;
INSERT INTO `patient_diagnosis` VALUES (9,'Alcoholic Hepatitis','Paracetamol Tablet 500mg','2024-03-25 16:52:13.017255',NULL,27,9),(10,'Alcoholic Hepatitis','Calamine ','2024-03-25 16:53:28.997823',NULL,27,8),(11,'Bronchial Asthma','Paracetamol Tablet 500mg','2024-03-26 00:03:56.821285',NULL,30,5),(12,'Paralysis (brain hemorrhage)','Calamine Lotion','2024-03-31 00:13:34.547033',NULL,30,2),(13,'Osteoarthritis B','Glucose Tablets','2024-04-04 22:50:53.433060',NULL,30,5),(15,'skin infection','Canvaz Gel(Topical) 15gm','2024-04-04 23:41:55.305907',NULL,30,4),(16,'4: [\'Hyperthyroidism\', \'Allergy\']','Make Appointment','2024-04-05 18:52:40.771020',NULL,27,2),(17,'Allergy','','2024-04-06 04:39:59.184466',NULL,27,3),(18,'Impetigo','Cyclosporine Capsules 100mg','2024-04-06 04:44:36.015460',NULL,27,3),(19,'Impetigo','Cyclosporine Capsules 100mg','2024-04-07 02:25:42.057550',NULL,31,3),(20,'Allergy','','2024-04-07 02:26:54.892845',NULL,31,1);
/*!40000 ALTER TABLE `patient_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-07  8:11:01
