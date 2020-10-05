-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: onlinerequest
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add issuetype',7,'add_issuetype'),(20,'Can change issuetype',7,'change_issuetype'),(21,'Can delete issuetype',7,'delete_issuetype'),(22,'Can add status',8,'add_status'),(23,'Can change status',8,'change_status'),(24,'Can delete status',8,'delete_status'),(25,'Can add issue',9,'add_issue'),(26,'Can change issue',9,'change_issue'),(27,'Can delete issue',9,'delete_issue'),(28,'Can add transaction log',10,'add_transactionlog'),(29,'Can change transaction log',10,'change_transactionlog'),(30,'Can delete transaction log',10,'delete_transactionlog'),(31,'Can add itadmin',11,'add_itadmin'),(32,'Can change itadmin',11,'change_itadmin'),(33,'Can delete itadmin',11,'delete_itadmin');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$36000$0FpJAzI4PIPC$SjY0qAwJcLNKf3ygYxZqJEiS7jnLfYupD/DKRaFaVkQ=','2017-08-09 03:41:01.633290',1,'admin','Admin','','infotech@torstencalvi.com',1,1,'2017-07-28 07:50:07.529407'),(18,'!U33UY7GU0e7souaXSOEjO53lNP6YVMP7CIEl4qcV','2017-08-10 03:35:48.744380',1,'vantanabe','Van','Tanabe','vantanabe@torstencalvi.com',1,1,'2017-07-28 09:53:27.556274'),(19,'!yXPUNvfrCU8FRJ6PD0W62LynRWmOgvhf88CrsfLU','2017-07-28 10:13:53.853974',0,'rhealynaricayos','Rhealyn','Aricayos','rhealynaricayos@torstencalvi.com',1,1,'2017-07-28 10:13:53.803953'),(20,'!4iFno05LEDmdPZucCQ1ZN8A8h0qSOhDdqXA8ZUpy','2017-08-10 06:15:18.950055',1,'ramonpalco','Ramon','Palco','',1,1,'2017-07-28 10:18:30.760218'),(21,'!puajVQNeMa72vKfwGrxrBRqndQK4q4APr8jo0EC5','2017-07-31 10:15:01.994406',0,'emilymaravilla','Emily','Maravilla','emilymaravilla@torstencalvi.com',1,1,'2017-07-28 10:19:21.742094'),(22,'!vS5Vfyqh1DfH514pT0U8cUgXV4jlr5rFgpuERsVa','2017-07-28 10:20:19.030188',0,'reginaldbulaon','Reginald','Bulaon','reginaldbulaon@torstencalvi.com',1,1,'2017-07-28 10:20:18.995820'),(23,'!VXM4BooRw5PuAappNqkeiWrJ5KaQ0SJb9VnO4pQb','2017-08-10 03:36:05.108360',0,'jedalimanza','Jed Alison','Alimanza','',1,1,'2017-07-31 10:12:08.095054'),(24,'!N8LE15nGXi3AKK6aDgGZjfU9gvin2XTgJc8Rb5yB','2017-08-09 03:41:41.530505',0,'ysmaelreyes','Ysmael Aniana','Reyes','ysmaelreyes@torstencalvi.com',1,1,'2017-08-01 04:53:27.923931');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-28 07:52:36.885460','1','vantanabe',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,3),(2,'2017-07-28 07:59:00.228509','2','rhealynaricayos',3,'',4,3),(3,'2017-07-28 07:59:00.239869','1','vantanabe',3,'',4,3),(4,'2017-07-28 08:59:58.461396','4','rhealynaricayos',3,'',4,3),(5,'2017-07-28 08:59:58.468252','5','vantanabe',3,'',4,3),(6,'2017-07-28 09:03:02.526771','1','IT Managers',1,'[{\"added\": {}}]',2,3),(7,'2017-07-28 09:03:28.592566','6','vantanabe',3,'',4,3),(8,'2017-07-28 09:22:54.883658','8','rhealynaricayos',3,'',4,3),(9,'2017-07-28 09:22:54.892698','7','vantanabe',3,'',4,3),(10,'2017-07-28 09:32:29.339550','10','rhealynaricayos',3,'',4,3),(11,'2017-07-28 09:32:29.345532','9','vantanabe',3,'',4,3),(12,'2017-07-28 09:32:29.356410','11','ysmaelreyes',3,'',4,3),(13,'2017-07-31 11:11:04.827851','1','Issuetype object',1,'[{\"added\": {}}]',7,18),(14,'2017-07-31 11:11:13.530385','2','Issuetype object',1,'[{\"added\": {}}]',7,18),(15,'2017-07-31 11:11:21.375822','2','Issuetype object',2,'[]',7,18),(16,'2017-07-31 11:11:26.581404','3','Issuetype object',1,'[{\"added\": {}}]',7,18),(17,'2017-07-31 11:11:30.916304','4','Issuetype object',1,'[{\"added\": {}}]',7,18),(18,'2017-07-31 11:11:44.976819','1','Status object',1,'[{\"added\": {}}]',8,18),(19,'2017-07-31 11:11:48.825022','2','Status object',1,'[{\"added\": {}}]',8,18),(20,'2017-08-01 03:12:59.454480','3','Status object',1,'[{\"added\": {}}]',8,18),(21,'2017-08-02 11:06:41.154738','1','Itadmin object',1,'[{\"added\": {}}]',11,18),(22,'2017-08-02 11:06:48.367808','2','Itadmin object',1,'[{\"added\": {}}]',11,18);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'onlinerequest','issue'),(7,'onlinerequest','issuetype'),(11,'onlinerequest','itadmin'),(8,'onlinerequest','status'),(10,'onlinerequest','transactionlog'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-28 06:48:21.063852'),(2,'auth','0001_initial','2017-07-28 06:48:21.360845'),(3,'admin','0001_initial','2017-07-28 06:48:21.453074'),(4,'admin','0002_logentry_remove_auto_add','2017-07-28 06:48:21.473908'),(5,'contenttypes','0002_remove_content_type_name','2017-07-28 06:48:21.558877'),(6,'auth','0002_alter_permission_name_max_length','2017-07-28 06:48:21.569937'),(7,'auth','0003_alter_user_email_max_length','2017-07-28 06:48:21.589404'),(8,'auth','0004_alter_user_username_opts','2017-07-28 06:48:21.613150'),(9,'auth','0005_alter_user_last_login_null','2017-07-28 06:48:21.665990'),(10,'auth','0006_require_contenttypes_0002','2017-07-28 06:48:21.668373'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-28 06:48:21.681730'),(12,'auth','0008_alter_user_username_max_length','2017-07-28 06:48:21.708228'),(13,'sessions','0001_initial','2017-07-28 06:48:21.754276'),(14,'onlinerequest','0001_initial','2017-07-31 11:08:52.337129'),(15,'onlinerequest','0002_auto_20170731_1108','2017-07-31 11:08:52.421590'),(16,'onlinerequest','0003_auto_20170801_0309','2017-08-01 03:09:25.593393'),(17,'onlinerequest','0004_auto_20170801_0312','2017-08-01 03:12:38.775649'),(18,'onlinerequest','0005_auto_20170802_0759','2017-08-02 07:59:28.430090'),(19,'onlinerequest','0006_transactionlog_issue_desc','2017-08-02 08:52:31.702604'),(20,'onlinerequest','0007_auto_20170802_0859','2017-08-02 08:59:13.728329'),(21,'onlinerequest','0008_transactionlog','2017-08-02 08:59:38.639980'),(22,'onlinerequest','0009_auto_20170802_0950','2017-08-02 09:50:51.096730'),(23,'onlinerequest','0010_auto_20170802_1105','2017-08-02 11:05:53.104771'),(24,'onlinerequest','0011_auto_20170803_0554','2017-08-03 05:54:55.555516'),(25,'onlinerequest','0012_issue_date_assign','2017-08-03 07:13:38.589841');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('33m5ujmoefig7f7qomhzp9idk0y599qq','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 10:45:15.893630'),('43ds8a1vc5ztj0rn0y057uh8ygdo1o9e','MWY5YjZhZTE5NDY2NjFhZWRhNTk2OGIyNDA5ZDZjM2QwYzM0ZmFlODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMGJmODE5MzI4YTBlY2QyYzI3ZmFlNjNhOWU3Mjc1ZmMxNjcyZTM2MSIsIl9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9','2017-08-22 03:15:24.519598'),('50hjafr3kid9punaz3s4atzpf37ahl60','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 08:11:28.495777'),('7qo00ylut9wuhuhqn8fu4mzfijhc98gy','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-17 10:59:07.243946'),('8mpskhb7e22luiffkv3j1rl205oojfqc','NjY1Yjc2Y2JlNGI3ODY1NWFkMGM5YWM4NjBhM2JhODUxMDM3M2I1ZTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNTM1YTMwN2I5NjIzNjkwN2EyNzI0MmZmNDAyYjk4YjA4MWM1YTczNCIsIl9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9','2017-08-24 06:15:18.953069'),('9qawbpgkfpp43x4wclvcje27hddeg0tf','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 10:47:58.876749'),('a9yvrwifs5ozme1sej4k0hfggze57ehy','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-21 09:29:18.461830'),('aop5c1wdibpwrggei894phjmtaxv1guz','NjY1Yjc2Y2JlNGI3ODY1NWFkMGM5YWM4NjBhM2JhODUxMDM3M2I1ZTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNTM1YTMwN2I5NjIzNjkwN2EyNzI0MmZmNDAyYjk4YjA4MWM1YTczNCIsIl9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9','2017-08-18 05:06:39.710720'),('b06ocg94uivqypy5rzogtd5c5i6peea6','MTIyZjA0MWRkMjE5YjRkNTIyODJmOGJhYTQwY2RlNTQ5YzkzMzg0MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjUzNWEzMDdiOTYyMzY5MDdhMjcyNDJmZjQwMmI5OGIwODFjNWE3MzQiLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-18 11:44:41.677031'),('bnl41ljuwday4rzzonmi62g8dmigurow','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 07:34:20.497166'),('bun0pec41htmzow76msw2hfhxztstx9v','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 10:47:00.289809'),('cuv0dw1tbtwyh59r0694gj1azsmi8sk6','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 10:32:24.724135'),('d01bzcn0j8t6xdze1fczic1denxsq5xs','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 05:03:26.325332'),('dld6wc8lq7u5es1cqarond2f4uzz9ok8','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 03:19:51.903028'),('fxgk5g76mmeyth1bs0tgch2akutytkpw','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 03:55:52.235639'),('iaunxszqiwgmckrwzgragp5lyhjy0l4z','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-22 10:59:48.130617'),('lwth4e3hbr7qkb2mtirxrv3fu8tmegvk','MTIyZjA0MWRkMjE5YjRkNTIyODJmOGJhYTQwY2RlNTQ5YzkzMzg0MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjUzNWEzMDdiOTYyMzY5MDdhMjcyNDJmZjQwMmI5OGIwODFjNWE3MzQiLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-17 11:48:58.662431'),('w1dqlcy8qh9ovvfo4r17ga3jeeer0lml','NzA1NjZmZmEwNGFkNDBiYTliNWJjZDdmNzhmOTI4ZDI5MDg3MjU5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBiZjgxOTMyOGEwZWNkMmMyN2ZhZTYzYTllNzI3NWZjMTY3MmUzNjEiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-08-23 09:01:27.641781');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinerequest_issue`
--

DROP TABLE IF EXISTS `onlinerequest_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlinerequest_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_entry` datetime(6) NOT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `issue_desc` longtext,
  `issue_type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ap_id` int(11) DEFAULT NULL,
  `date_assign` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlinerequest_issue_issue_type_id_5a91e0d2_fk_onlinereq` (`issue_type_id`),
  KEY `onlinerequest_issue_status_id_e9fcc6b5_fk_onlinereq` (`status_id`),
  KEY `onlinerequest_issue_user_id_45813401` (`user_id`),
  KEY `onlinerequest_issue_ap_id_ae130e21_fk_auth_user_id` (`ap_id`),
  CONSTRAINT `onlinerequest_issue_ap_id_ae130e21_fk_auth_user_id` FOREIGN KEY (`ap_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `onlinerequest_issue_issue_type_id_5a91e0d2_fk_onlinereq` FOREIGN KEY (`issue_type_id`) REFERENCES `onlinerequest_issuetype` (`id`),
  CONSTRAINT `onlinerequest_issue_status_id_e9fcc6b5_fk_onlinereq` FOREIGN KEY (`status_id`) REFERENCES `onlinerequest_status` (`id`),
  CONSTRAINT `onlinerequest_issue_user_id_45813401_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinerequest_issue`
--

LOCK TABLES `onlinerequest_issue` WRITE;
/*!40000 ALTER TABLE `onlinerequest_issue` DISABLE KEYS */;
INSERT INTO `onlinerequest_issue` VALUES (12,'2017-08-03 05:55:19.403186','2017-08-03 08:55:32.391553','Salome',1,2,18,18,NULL),(13,'2017-08-03 05:55:26.740454','2017-08-03 09:01:09.020396','PC Relocation',2,2,18,18,NULL),(14,'2017-08-03 05:56:55.270041','2017-08-04 11:35:58.281792','Test',1,2,20,20,'2017-08-03 07:14:50.199185'),(15,'2017-08-03 06:10:09.501007','2017-08-03 09:04:45.386647','PC Relocation',4,2,18,20,'2017-08-03 07:57:16.542003'),(16,'2017-08-03 06:11:27.804083','2017-08-03 09:23:31.092704','No development server',3,2,18,20,'2017-08-03 08:26:49.625757'),(17,'2017-08-03 08:28:28.432163','2017-08-03 08:52:34.948034','No boot disk',1,2,18,20,'2017-08-03 08:28:54.141496'),(18,'2017-08-03 09:06:22.663021','2017-08-03 09:08:09.929333','Can access interchange',3,2,18,18,'2017-08-03 09:07:13.440496'),(19,'2017-08-03 09:16:58.161283','2017-08-03 09:27:22.006912','Aircon in server room not working',4,2,18,20,'2017-08-03 09:27:05.286014'),(20,'2017-08-03 09:36:32.138979','2017-08-04 15:27:02.013618','Install Libre Office',1,2,18,18,'2017-08-04 15:23:57.295753'),(21,'2017-08-03 09:36:55.198752','2017-08-09 03:37:23.833983','Video not working',2,2,18,18,'2017-08-09 03:33:58.975749'),(22,'2017-08-03 09:40:09.590919',NULL,'No office matter',3,1,18,18,'2017-08-09 03:33:58.986269'),(23,'2017-08-03 10:07:31.521815','2017-08-08 11:29:11.624721','',4,2,18,20,'2017-08-08 07:30:34.806775'),(24,'2017-08-03 11:23:34.175849','2017-08-04 11:38:59.001581','Install Windows 7',1,2,18,20,'2017-08-04 05:10:27.460294'),(25,'2017-08-04 03:02:32.081113','2017-08-04 11:43:18.358264','Defective Mouse',2,2,18,20,'2017-08-04 03:02:56.649029'),(26,'2017-08-04 05:11:48.084447','2017-08-04 11:39:49.951444','cs',1,2,20,20,'2017-08-04 05:12:51.362331'),(27,'2017-08-04 07:38:01.295690','2017-08-04 11:44:14.315051','timesheet not running',1,2,24,20,'2017-08-04 08:34:25.042884'),(28,'2017-08-04 15:22:24.186496','2017-08-10 05:13:23.481257','Can not connect to Shares folder',3,2,24,20,'2017-08-04 15:23:10.087448'),(29,'2017-08-04 15:27:51.404806','2017-08-04 15:31:54.283600','Can not display video',2,2,24,18,'2017-08-04 15:28:54.198089'),(30,'2017-08-08 11:29:29.337997','2017-08-10 05:13:54.099823','asdfasdf',1,2,18,18,'2017-08-09 03:33:58.992993'),(31,'2017-08-08 11:29:32.718362',NULL,'asdfasdfas',2,1,18,18,'2017-08-09 03:33:59.000705'),(32,'2017-08-08 11:29:35.490716',NULL,'asdfasdfasdf',3,1,18,18,'2017-08-09 03:33:59.006938'),(33,'2017-08-08 11:29:38.558134',NULL,'asdfasdf',4,1,18,18,'2017-08-09 03:33:59.021336'),(34,'2017-08-08 11:52:32.552469',NULL,'adsfasdf',2,1,18,18,'2017-08-09 03:33:59.025075'),(35,'2017-08-08 11:52:37.898147',NULL,'asdfasdf',4,1,18,18,'2017-08-09 03:33:59.032130'),(36,'2017-08-08 11:53:50.583088',NULL,'adsfadsf',3,1,18,18,'2017-08-09 03:33:59.040950'),(37,'2017-08-08 11:53:55.667905',NULL,'adsfsdf',4,1,18,18,'2017-08-09 03:33:59.048225'),(38,'2017-08-08 11:54:00.881252',NULL,'adsfasdf',2,1,18,18,'2017-08-09 03:33:59.056317'),(39,'2017-08-08 11:54:14.126108',NULL,'gfdfhxh',3,1,18,18,'2017-08-09 03:33:59.061508'),(40,'2017-08-08 11:54:16.898180',NULL,'dghdfgh',2,1,18,20,'2017-08-09 03:34:08.727317'),(41,'2017-08-08 11:54:20.023373',NULL,'dghdgh',4,1,18,20,'2017-08-09 03:34:08.732292'),(42,'2017-08-08 11:54:23.654892',NULL,'dghdgh',4,1,18,20,'2017-08-09 03:34:08.736240'),(43,'2017-08-08 11:54:27.347857',NULL,'ghdgh',1,1,18,20,'2017-08-09 03:34:08.741440'),(44,'2017-08-08 11:54:30.724788',NULL,'dghdg',1,1,18,20,'2017-08-09 03:34:08.745729'),(45,'2017-08-08 11:54:34.721473',NULL,'dghdg',1,1,18,NULL,NULL),(46,'2017-08-09 09:09:35.543206',NULL,'asdsa',1,1,18,3,'2017-08-10 05:14:18.969857'),(47,'2017-08-09 09:10:01.756329',NULL,'asdfasdf',1,1,18,18,'2017-08-10 03:33:41.808209');
/*!40000 ALTER TABLE `onlinerequest_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinerequest_issuetype`
--

DROP TABLE IF EXISTS `onlinerequest_issuetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlinerequest_issuetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinerequest_issuetype`
--

LOCK TABLES `onlinerequest_issuetype` WRITE;
/*!40000 ALTER TABLE `onlinerequest_issuetype` DISABLE KEYS */;
INSERT INTO `onlinerequest_issuetype` VALUES (1,'Systems'),(2,'Hardware'),(3,'Network'),(4,'Others');
/*!40000 ALTER TABLE `onlinerequest_issuetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinerequest_status`
--

DROP TABLE IF EXISTS `onlinerequest_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlinerequest_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinerequest_status`
--

LOCK TABLES `onlinerequest_status` WRITE;
/*!40000 ALTER TABLE `onlinerequest_status` DISABLE KEYS */;
INSERT INTO `onlinerequest_status` VALUES (1,'Open'),(2,'Closed'),(3,'For Closing');
/*!40000 ALTER TABLE `onlinerequest_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlinerequest_transactionlog`
--

DROP TABLE IF EXISTS `onlinerequest_transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlinerequest_transactionlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `issue_desc` longtext,
  `updates` longtext,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `onlinerequest_transa_issue_id_4879720d_fk_onlinereq` (`issue_id`),
  KEY `onlinerequest_transactionlog_user_id_2a1fabeb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `onlinerequest_transa_issue_id_4879720d_fk_onlinereq` FOREIGN KEY (`issue_id`) REFERENCES `onlinerequest_issue` (`id`),
  CONSTRAINT `onlinerequest_transactionlog_user_id_2a1fabeb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlinerequest_transactionlog`
--

LOCK TABLES `onlinerequest_transactionlog` WRITE;
/*!40000 ALTER TABLE `onlinerequest_transactionlog` DISABLE KEYS */;
INSERT INTO `onlinerequest_transactionlog` VALUES (3,'2017-08-03 07:01:05.785259','Salome',NULL,12,18),(4,'2017-08-03 07:01:05.788861','PC Relocation',NULL,13,18),(5,'2017-08-03 07:14:32.872649','Test',NULL,14,20),(6,'2017-08-03 07:14:50.205255','Test',NULL,14,20),(7,'2017-08-03 15:19:03.000000',NULL,'install salome',12,18),(8,'2017-08-03 07:57:16.552250','PC Relocation',NULL,15,18),(9,'2017-08-03 08:26:49.632365','No development server','Assign Ticket',16,18),(10,'2017-08-03 08:28:54.147789','No boot disk','Assign Ticket',17,18),(11,'2017-08-03 16:31:17.000000',NULL,'Check Hard Disk',17,18),(12,'2017-08-03 16:32:11.000000',NULL,'Replace Hard Drive and Install OS',17,18),(13,'2017-08-03 08:52:34.963183',NULL,'Close Ticket',17,18),(14,'2017-08-03 08:55:32.403730',NULL,'Close Ticket',12,18),(15,'2017-08-03 09:01:09.029740',NULL,'Close Ticket',13,18),(16,'2017-08-03 09:04:45.402032',NULL,'Close Ticket',15,18),(17,'2017-08-03 09:07:13.445986','Can access interchange','Assign Ticket',18,18),(18,'2017-08-03 09:08:09.953783',NULL,'Close Ticket',18,18),(19,'2017-08-03 09:12:15.844224',NULL,'Close Ticket',16,18),(20,'2017-08-03 09:23:31.109504',NULL,'Close Ticket',16,18),(21,'2017-08-03 09:27:05.302076','Aircon in server room not working','Assign Ticket',19,18),(22,'2017-08-03 09:27:22.027879',NULL,'Close Ticket',19,18),(23,'2017-08-04 03:02:56.660711','Defective Mouse','Assign Ticket',25,18),(24,'2017-08-04 05:10:27.465306','Install Windows 7','Assign Ticket',24,18),(25,'2017-08-04 05:12:10.513429','cs','Assign Ticket',26,20),(26,'2017-08-04 05:12:47.983968','cs','Assign Ticket',26,20),(27,'2017-08-04 05:12:51.367060','cs','Assign Ticket',26,20),(28,'2017-08-04 08:34:25.059574','timesheet not running','Assign Ticket',27,24),(29,'2017-08-04 11:10:21.093081','Install Windows 7','Format Hard Drive and Install Windows 7',24,18),(30,'2017-08-04 11:12:50.552351','Install Windows 7','Format Hard Drive and Install Windows 7',24,18),(31,'2017-08-04 11:17:40.494864','Test','sdssdafs',14,20),(32,'2017-08-04 11:22:26.079914','Test','Test',14,20),(33,'2017-08-04 11:24:28.807694','Test','asdasf',14,20),(34,'2017-08-04 11:29:49.641616','Test','asdasf',14,20),(35,'2017-08-04 11:30:09.979463','Test','werwer',14,20),(36,'2017-08-04 11:35:58.294529',NULL,'Close Ticket',14,20),(37,'2017-08-04 11:38:59.018032',NULL,'Close Ticket',24,18),(38,'2017-08-04 11:39:46.535383','cs','dsaadsf',26,20),(39,'2017-08-04 11:39:49.966401',NULL,'Close Ticket',26,20),(40,'2017-08-04 11:43:18.367965',NULL,'Close Ticket',25,18),(41,'2017-08-04 11:44:04.263220','timesheet not running','Reboot Server',27,24),(42,'2017-08-04 11:44:14.319988',NULL,'Close Ticket',27,24),(43,'2017-08-04 15:23:10.097564','Can not connect to Shares folder','Assign Ticket',28,24),(44,'2017-08-04 15:23:57.300643','Install Libre Office','Assign Ticket',20,18),(45,'2017-08-04 15:24:19.297207','Install Libre Office','Download libre office',20,18),(46,'2017-08-04 15:24:48.836538','Install Libre Office','Install libre office',20,18),(47,'2017-08-04 15:27:02.028221',NULL,'Close Ticket',20,18),(48,'2017-08-04 15:28:54.208920','Can not display video','Assign Ticket',29,24),(49,'2017-08-04 15:30:53.824440','Can not display video','Defective monitor, Replaced monitor',29,24),(50,'2017-08-04 15:31:54.299704',NULL,'Close Ticket',29,24),(51,'2017-08-08 07:29:39.699485','Can not connect to Shares folder','Reboot the computer to refresh winbind',28,24),(52,'2017-08-08 07:29:50.904864','Can not connect to Shares folder','For closing',28,24),(53,'2017-08-08 07:30:34.814978','','Assign Ticket',23,18),(54,'2017-08-08 11:29:11.629397',NULL,'Close Ticket',23,18),(55,'2017-08-09 03:33:59.064802','Video not working','Assign Ticket',21,18),(56,'2017-08-09 03:33:59.066914','No office matter','Assign Ticket',22,18),(57,'2017-08-09 03:33:59.068491','asdfasdf','Assign Ticket',30,18),(58,'2017-08-09 03:33:59.070659','asdfasdfas','Assign Ticket',31,18),(59,'2017-08-09 03:33:59.077253','asdfasdfasdf','Assign Ticket',32,18),(60,'2017-08-09 03:33:59.084084','asdfasdf','Assign Ticket',33,18),(61,'2017-08-09 03:33:59.090626','adsfasdf','Assign Ticket',34,18),(62,'2017-08-09 03:33:59.095785','asdfasdf','Assign Ticket',35,18),(63,'2017-08-09 03:33:59.098450','adsfadsf','Assign Ticket',36,18),(64,'2017-08-09 03:33:59.100098','adsfsdf','Assign Ticket',37,18),(65,'2017-08-09 03:33:59.102322','adsfasdf','Assign Ticket',38,18),(66,'2017-08-09 03:33:59.105381','gfdfhxh','Assign Ticket',39,18),(67,'2017-08-09 03:34:08.757287','dghdfgh','Assign Ticket',40,18),(68,'2017-08-09 03:34:08.761168','dghdgh','Assign Ticket',41,18),(69,'2017-08-09 03:34:08.768271','dghdgh','Assign Ticket',42,18),(70,'2017-08-09 03:34:08.772467','ghdgh','Assign Ticket',43,18),(71,'2017-08-09 03:34:08.777753','dghdg','Assign Ticket',44,18),(72,'2017-08-09 03:37:23.838466',NULL,'Close Ticket',21,18),(73,'2017-08-10 03:33:41.814094','asdfasdf','Assign Ticket',47,18),(74,'2017-08-10 05:13:14.466251','Can not connect to Shares folder','close',28,24),(75,'2017-08-10 05:13:23.489218',NULL,'Ticket closed',28,24),(76,'2017-08-10 05:13:54.106546',NULL,'Ticket closed',30,18),(77,'2017-08-10 05:14:18.975079','asdsa','Assign Ticket',46,18);
/*!40000 ALTER TABLE `onlinerequest_transactionlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-10 14:41:27
