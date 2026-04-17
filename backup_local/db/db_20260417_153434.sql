-- MySQL dump 10.13  Distrib 8.4.8, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare
-- ------------------------------------------------------
-- Server version	8.4.8

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(3,'doctor'),(2,'user');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add booking',1,'add_booking'),(2,'Can change booking',1,'change_booking'),(3,'Can delete booking',1,'delete_booking'),(4,'Can view booking',1,'view_booking'),(5,'Can add complaint',2,'add_complaint'),(6,'Can change complaint',2,'change_complaint'),(7,'Can delete complaint',2,'delete_complaint'),(8,'Can view complaint',2,'view_complaint'),(9,'Can add doctor',3,'add_doctor'),(10,'Can change doctor',3,'change_doctor'),(11,'Can delete doctor',3,'delete_doctor'),(12,'Can view doctor',3,'view_doctor'),(13,'Can add prescription',4,'add_prescription'),(14,'Can change prescription',4,'change_prescription'),(15,'Can delete prescription',4,'delete_prescription'),(16,'Can view prescription',4,'view_prescription'),(17,'Can add schedule',5,'add_schedule'),(18,'Can change schedule',5,'change_schedule'),(19,'Can delete schedule',5,'delete_schedule'),(20,'Can view schedule',5,'view_schedule'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$yIgFFU2hyHz8z2ZRlxIFzo$XZ//PtaP8RHHz4FyYW4EvFI5NO8D2k4ANOSSdiRK2zI=','2026-04-17 09:38:09.062166',1,'admin','','','admin@gmail.com',1,1,'2026-04-02 10:01:59.000000'),(14,'pbkdf2_sha256$1000000$glpEkE1L4cndd6cMqxj31n$m+FsPI87YGXJdJ7NoRWDcuWiEdxT8cOs2pbp8PMte9w=','2026-04-17 08:50:15.402893',0,'ram','','','',0,1,'2026-04-13 07:36:58.910329'),(16,'pbkdf2_sha256$1000000$ikqtZM0kLxfD3cJtwJbOZn$uvBYTOLn4ReQys0ymf8UHWJELh6/0pPyR2HXqao7m8U=','2026-04-17 10:04:00.395898',0,'ali','','','',0,1,'2026-04-16 10:14:14.271041'),(17,'pbkdf2_sha256$1000000$H7fWmIpfEml6MDxxUIySdI$7SbIjJRhsigK72r7ubrRX46N/dockazvBZ3uB4ypyhE=','2026-04-17 08:45:08.084366',0,'gafoor','','','',0,1,'2026-04-17 05:15:38.907706');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(3,4,3),(4,5,3),(6,7,2),(7,9,2),(8,14,2),(10,16,3),(11,17,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-04-02 10:03:13.401219','1','admin',1,'[{\"added\": {}}]',9,1),(2,'2026-04-02 10:03:19.122648','2','user',1,'[{\"added\": {}}]',9,1),(3,'2026-04-02 10:03:23.879797','3','doctor',1,'[{\"added\": {}}]',9,1),(4,'2026-04-02 10:03:43.743032','1','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(1,'myapp','booking'),(2,'myapp','complaint'),(3,'myapp','doctor'),(4,'myapp','prescription'),(5,'myapp','schedule'),(6,'myapp','user'),(12,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-04-01 09:43:24.253626'),(2,'auth','0001_initial','2026-04-01 09:43:25.529724'),(3,'admin','0001_initial','2026-04-01 09:43:25.847863'),(4,'admin','0002_logentry_remove_auto_add','2026-04-01 09:43:25.858380'),(5,'admin','0003_logentry_add_action_flag_choices','2026-04-01 09:43:25.878799'),(6,'contenttypes','0002_remove_content_type_name','2026-04-01 09:43:26.128342'),(7,'auth','0002_alter_permission_name_max_length','2026-04-01 09:43:26.266173'),(8,'auth','0003_alter_user_email_max_length','2026-04-01 09:43:26.313181'),(9,'auth','0004_alter_user_username_opts','2026-04-01 09:43:26.327154'),(10,'auth','0005_alter_user_last_login_null','2026-04-01 09:43:26.446836'),(11,'auth','0006_require_contenttypes_0002','2026-04-01 09:43:26.458875'),(12,'auth','0007_alter_validators_add_error_messages','2026-04-01 09:43:26.472065'),(13,'auth','0008_alter_user_username_max_length','2026-04-01 09:43:26.627976'),(14,'auth','0009_alter_user_last_name_max_length','2026-04-01 09:43:26.782601'),(15,'auth','0010_alter_group_name_max_length','2026-04-01 09:43:26.820453'),(16,'auth','0011_update_proxy_permissions','2026-04-01 09:43:26.835973'),(17,'auth','0012_alter_user_first_name_max_length','2026-04-01 09:43:26.975266'),(18,'myapp','0001_initial','2026-04-01 09:43:28.119319'),(19,'sessions','0001_initial','2026-04-01 09:43:28.197363'),(20,'myapp','0002_alter_booking_user_alter_complaint_user','2026-04-02 09:44:14.346902'),(21,'myapp','0003_doctor_profile_image_prescription_attachment','2026-04-17 09:34:26.882738');
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
INSERT INTO `django_session` VALUES ('1d917i1babie1fk84cl1okhruvp2x3jf','.eJxVjEEOwiAQRe_C2hAECoxL9z0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInERZ3H63XLCB7cd0D212yxxbusyZbkr8qBdjjPx83q4fwc19fqtwaDxbIl8UKhd8GAGFTRZZhsQFBRl0AE5xc4albwLRfsMgw6gC6F4fwDBxzcM:1wDfdS:qZEw63hqyN_HvoMHL7MVMisTigX8P3Y1v2dvYJKGKeo','2026-05-01 09:37:14.898813'),('8sj8msefxwu5xxe4km1tujw8x4fpxtjy','.eJxVjEEOwiAQRe_C2hAECoxL9z0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInERZ3H63XLCB7cd0D212yxxbusyZbkr8qBdjjPx83q4fwc19fqtwaDxbIl8UKhd8GAGFTRZZhsQFBRl0AE5xc4albwLRfsMgw6gC6F4fwDBxzcM:1wDbsV:9MaVf9FovFch0ge5Fa4PdhRBOlCpYK0zeOhjv1H3T7s','2026-05-01 05:36:31.755877'),('mx1iglupc0ae7xln7scm2b7x4kthpxc8','.eJxVjEEOwiAQRe_C2hAECoxL9z0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInERZ3H63XLCB7cd0D212yxxbusyZbkr8qBdjjPx83q4fwc19fqtwaDxbIl8UKhd8GAGFTRZZhsQFBRl0AE5xc4albwLRfsMgw6gC6F4fwDBxzcM:1wDbtV:LpueUltSFBMIpDfMsP15nVMwpJPj-FXST8PKXPZisYs','2026-05-01 05:37:33.378120'),('nm3jhgxrlfe8y3wrcuoiq5wx6qhjwp29','.eJxVjkEOgyAURO_CuiGCgNBl957BfD58oTaQiK6a3r2auGi382Ze5s0m2Lc07S2uUw7szoRht9_QAy6xnCQ8ocyVYy3bmj0_K_yijY81xNfj6v4JErR0rA0GIaUWCgTawSmN2JPWEaUj4RSAd4KI7OA7LzujjJPYO1K2t9EokofU17rkMl8_Nft8ASAAPSE:1wDg3Y:_sk56_Egga-sXYijAlIAVDNuPFYhD0l899i3bInISok','2026-05-01 10:04:12.760727');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_booking`
--

DROP TABLE IF EXISTS `myapp_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  `SCHEDULE_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_booking_SCHEDULE_id_8020ae27_fk_myapp_schedule_id` (`SCHEDULE_id`),
  KEY `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_booking_SCHEDULE_id_8020ae27_fk_myapp_schedule_id` FOREIGN KEY (`SCHEDULE_id`) REFERENCES `myapp_schedule` (`id`),
  CONSTRAINT `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_booking`
--

LOCK TABLES `myapp_booking` WRITE;
/*!40000 ALTER TABLE `myapp_booking` DISABLE KEYS */;
INSERT INTO `myapp_booking` VALUES (15,'2026-04-17','completed',3,7),(16,'2026-04-17','booked',3,9);
/*!40000 ALTER TABLE `myapp_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_complaint`
--

DROP TABLE IF EXISTS `myapp_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_complaint`
--

LOCK TABLES `myapp_complaint` WRITE;
/*!40000 ALTER TABLE `myapp_complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_doctor`
--

DROP TABLE IF EXISTS `myapp_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `phone` bigint NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `department` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `pin` bigint NOT NULL,
  `district` varchar(200) NOT NULL,
  `LOGIN_id` int NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_doctor_LOGIN_id_07e43244_fk_auth_user_id` (`LOGIN_id`),
  CONSTRAINT `myapp_doctor_LOGIN_id_07e43244_fk_auth_user_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_doctor`
--

LOCK TABLES `myapp_doctor` WRITE;
/*!40000 ALTER TABLE `myapp_doctor` DISABLE KEYS */;
INSERT INTO `myapp_doctor` VALUES (5,'ali',354542547534,'2000-05-19','ali@gmail.com','Male','Cardiology','mbbs','chv','cheruvathur',671313,'kozhikode',16,'doctor_profiles/IBM.jpg'),(6,'gafoor',6238911406,'2009-09-03','gafoor@gmail.com','Male','General Medicine','mbbs','polla','cheruvathur',671313,'kasaragod',17,'doctor_profiles/IBM_MZhtXHe.jpg');
/*!40000 ALTER TABLE `myapp_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_prescription`
--

DROP TABLE IF EXISTS `myapp_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_prescription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prescription` varchar(200) NOT NULL,
  `findings` varchar(200) NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_prescription_BOOKING_id_94c90559_fk_myapp_booking_id` (`BOOKING_id`),
  CONSTRAINT `myapp_prescription_BOOKING_id_94c90559_fk_myapp_booking_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_prescription`
--

LOCK TABLES `myapp_prescription` WRITE;
/*!40000 ALTER TABLE `myapp_prescription` DISABLE KEYS */;
INSERT INTO `myapp_prescription` VALUES (9,'2026-04-17','prwescroo','asdhajsda',15,'prescriptions/High_Level_Design.pdf');
/*!40000 ALTER TABLE `myapp_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_schedule`
--

DROP TABLE IF EXISTS `myapp_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  `DOCTOR_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_schedule_DOCTOR_id_1253d521_fk_myapp_doctor_id` (`DOCTOR_id`),
  CONSTRAINT `myapp_schedule_DOCTOR_id_1253d521_fk_myapp_doctor_id` FOREIGN KEY (`DOCTOR_id`) REFERENCES `myapp_doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_schedule`
--

LOCK TABLES `myapp_schedule` WRITE;
/*!40000 ALTER TABLE `myapp_schedule` DISABLE KEYS */;
INSERT INTO `myapp_schedule` VALUES (7,'2026-12-04','10:00:00.000000','13:00:00.000000',5),(9,'2026-04-19','10:00:00.000000','14:00:00.000000',6);
/*!40000 ALTER TABLE `myapp_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_user`
--

DROP TABLE IF EXISTS `myapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `pin` bigint NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(200) NOT NULL,
  `LOGIN_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_auth_user_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_auth_user_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_user`
--

LOCK TABLES `myapp_user` WRITE;
/*!40000 ALTER TABLE `myapp_user` DISABLE KEYS */;
INSERT INTO `myapp_user` VALUES (3,'ram','',6202242610,'safa villa,kadangod ,cheruvathur,kasaragod,kerala','kasaragod',671313,'2005-09-16','Male',14);
/*!40000 ALTER TABLE `myapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 15:34:35
