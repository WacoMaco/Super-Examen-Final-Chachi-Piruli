﻿start transaction;
	drop database if exists `acme-newspaper`;
	create database `acme-newspaper`;
	use `acme-newspaper`;
	-- drop user 'acme-user'@'%';
	-- drop user 'acme-manager'@'%';
	create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
	create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';
	grant select, insert, update, delete on `acme-newspaper`.* to 'acme-user'@'%';
	grant select, insert, update, delete, create, drop, references, index, alter,
	create temporary tables, lock tables, create view, create routine, alter routine, 
		execute, trigger, show view on `acme-newspaper`.* to 'acme-manager'@'%';



-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: acme-newspaper
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_folder`
--

DROP TABLE IF EXISTS `actor_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_folder` (
  `Actor_id` int(11) NOT NULL,
  `folders_id` int(11) NOT NULL,
  UNIQUE KEY `UK_dp573h40udupcm5m1kgn2bc2r` (`folders_id`),
  CONSTRAINT `FK_dp573h40udupcm5m1kgn2bc2r` FOREIGN KEY (`folders_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_folder`
--

LOCK TABLES `actor_folder` WRITE;
/*!40000 ALTER TABLE `actor_folder` DISABLE KEYS */;
INSERT INTO `actor_folder` VALUES (99,128),(101,129),(102,130),(103,131),(104,132),(105,133),(106,134),(107,135),(100,136),(99,139),(101,140),(102,141),(103,142),(104,143),(105,144),(106,145),(107,146),(100,147),(99,148),(101,149),(102,150),(103,151),(104,152),(105,153),(106,154),(100,155),(107,156),(99,157),(101,158),(102,159),(103,160),(104,161),(105,162),(106,163),(107,164),(100,165),(99,166),(101,167),(102,168),(103,169),(104,170),(105,171),(106,172),(107,173),(100,174);
/*!40000 ALTER TABLE `actor_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gfgqmtp2f9i5wsojt33xm0uth` (`userAccount_id`),
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (99,0,'admintodopoderoso@email.com','Manuel','','','Bartual Moreno',90),(100,0,'admindeexamen@email.com','MrAdmin','','','Fernandez Moreno',98);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `bannerURL` varchar(255) DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `tabooWords` bit(1) DEFAULT NULL,
  `targetPageURL` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7n9ussuxsi3k6rm34vajrccvn` (`agent_id`),
  CONSTRAINT `FK_7n9ussuxsi3k6rm34vajrccvn` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (124,0,'https://images.telepizza.com/vol/es/images/content/productos/pule_c.png',621,'MasterCard',7,22,'Juan Cuesta Sanabria','5220277771031876','\0','https://www.telepizza.es/productos/pizzas','anuncio',106),(125,0,'https://cdn.adguard.com/public/Adguard/En/Articles/fake-popup.png',541,'Visa',11,24,'Isabel Cuesta Fernandez','5632152478545969','','https://adguard.com/en/article/popups-blocker.html','anuncio2 sex',107),(126,0,'http://www.nyx.net/~cmeador/public/snakesonmyplane.jpg',621,'MasterCard',7,22,'Juan Cuesta Sanabria','5220277771031876','\0','https://www.reddit.com/r/fakebadads/','anuncio3',106);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_newspaper`
--

DROP TABLE IF EXISTS `advertisement_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_newspaper` (
  `Advertisement_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  KEY `FK_68jpyep7ypj8ryi3tfnkjyst5` (`newspapers_id`),
  KEY `FK_52m61m54mw26knnatns85adl1` (`Advertisement_id`),
  CONSTRAINT `FK_52m61m54mw26knnatns85adl1` FOREIGN KEY (`Advertisement_id`) REFERENCES `advertisement` (`id`),
  CONSTRAINT `FK_68jpyep7ypj8ryi3tfnkjyst5` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_newspaper`
--

LOCK TABLES `advertisement_newspaper` WRITE;
/*!40000 ALTER TABLE `advertisement_newspaper` DISABLE KEYS */;
INSERT INTO `advertisement_newspaper` VALUES (124,108),(125,114),(126,108);
/*!40000 ALTER TABLE `advertisement_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5cg6nedtnilfs6spfq209syse` (`userAccount_id`),
  CONSTRAINT `FK_5cg6nedtnilfs6spfq209syse` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (106,0,'adrianLopez@email.com','Adrian','988456674','Calle Trinidad','López',96),(107,0,'PenelopeBardem@email.com','Penélope','943456666','Las Vegas 115','Bardem',97);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `isDraft` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `tabooWords` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_o8yh9i3siaa8982rwla20fe38` (`tabooWords`,`body`,`title`,`summary`),
  KEY `FK_pftm848lf5hu8sd0vghfs605l` (`newspaper_id`),
  KEY `FK_b3tb1l9l19i2tfsf6o6a4hifx` (`user_id`),
  CONSTRAINT `FK_b3tb1l9l19i2tfsf6o6a4hifx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pftm848lf5hu8sd0vghfs605l` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (109,0,'A lo largo de su carrera profesional, ha conseguido batir diversos récords. Entre ellos, se destacan...','\0','2018-02-12 12:21:00','Cristiano ronaldo se rompe la uña del pie al abrir una lata de monster.Parece que le dió mucho LA LATA','\0','Cristiano ronaldo lesionado',108,101),(111,0,'Nacido y criado en la ciudad de Rosario, a los 13 años se radicó en España, donde el Barcelona accedió a...','\0','2018-01-13 12:21:00','Messi estaba en su casa cenando cuando de repente ropió su mesa al marcar un gol con el cuenco de la sopa','\0','Messi ha roto una messita',108,101),(115,0,'Sex.Ha cosechado un alto número de éxitos musicales y posee una extensa discografía con 29 álbumes. También...','\0','2018-02-10 12:21:00','Se ha visto a la pantoja de nuevo por Sevilla cerca de alameda','','La pantoja vuelve a la carga',114,102),(117,0,'Es increible la capacidad de escribir de nuestros redactores, no hay color con la competencia.','','2018-10-10 12:22:00','Esto es impresionante','\0','No veas qué pasada de artículo',116,101);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_followup`
--

DROP TABLE IF EXISTS `article_followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_followup` (
  `Article_id` int(11) NOT NULL,
  `followUps_id` int(11) NOT NULL,
  UNIQUE KEY `UK_dga3q6hwsns7nc4vas0d0imlo` (`followUps_id`),
  KEY `FK_d7j7ndqrqlxfglsyspsaag0f9` (`Article_id`),
  CONSTRAINT `FK_d7j7ndqrqlxfglsyspsaag0f9` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_dga3q6hwsns7nc4vas0d0imlo` FOREIGN KEY (`followUps_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_followup`
--

LOCK TABLES `article_followup` WRITE;
/*!40000 ALTER TABLE `article_followup` DISABLE KEYS */;
INSERT INTO `article_followup` VALUES (109,110),(111,112),(111,113);
/*!40000 ALTER TABLE `article_followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_photosurl`
--

DROP TABLE IF EXISTS `article_photosurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_photosurl` (
  `Article_id` int(11) NOT NULL,
  `photosURL` varchar(255) DEFAULT NULL,
  KEY `FK_n7sx18pf0yrw9nltfqjaabpyi` (`Article_id`),
  CONSTRAINT `FK_n7sx18pf0yrw9nltfqjaabpyi` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_photosurl`
--

LOCK TABLES `article_photosurl` WRITE;
/*!40000 ALTER TABLE `article_photosurl` DISABLE KEYS */;
INSERT INTO `article_photosurl` VALUES (109,'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/New_Zealand-Portugal_%2820%29.jpg/375px-New_Zealand-Portugal_%2820%29.jpg');
/*!40000 ALTER TABLE `article_photosurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articleform`
--

DROP TABLE IF EXISTS `articleform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `isDraft` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lho6pq5kqr35ps237lcgdmgx` (`newspaper_id`),
  CONSTRAINT `FK_lho6pq5kqr35ps237lcgdmgx` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articleform`
--

LOCK TABLES `articleform` WRITE;
/*!40000 ALTER TABLE `articleform` DISABLE KEYS */;
/*!40000 ALTER TABLE `articleform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articleform_photosurl`
--

DROP TABLE IF EXISTS `articleform_photosurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleform_photosurl` (
  `ArticleForm_id` int(11) NOT NULL,
  `photosURL` varchar(255) DEFAULT NULL,
  KEY `FK_6yh2918df6bnpi5gu1swb75n9` (`ArticleForm_id`),
  CONSTRAINT `FK_6yh2918df6bnpi5gu1swb75n9` FOREIGN KEY (`ArticleForm_id`) REFERENCES `articleform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articleform_photosurl`
--

LOCK TABLES `articleform_photosurl` WRITE;
/*!40000 ALTER TABLE `articleform_photosurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `articleform_photosurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `tabooWords` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_54xdq8h5sc9j3syjmrl6n7fst` (`tabooWords`),
  KEY `FK_t10lk4j2g8uw7k7et58ytrp70` (`user_id`),
  CONSTRAINT `FK_t10lk4j2g8uw7k7et58ytrp70` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (120,0,'Estoy escribiendo un chirp','2018-03-12 09:21:00','\0','Este es mi chirp1',101),(121,0,'Estoy escribiendo otro chirp','2018-03-12 09:32:00','\0','Este es mi chirp2',101),(122,0,'Estoy escribiendo un chirp3, sex','2018-03-13 09:21:00','','Este es mi primer chirp3',102);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust`
--

DROP TABLE IF EXISTS `cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gauge` int(11) DEFAULT NULL,
  `isDraft` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j17t9ixvdnhqn4spbbgvtg06q` (`symbol`),
  KEY `UK_a04ur2ohy2ua0gcgyi2flkjux` (`moment`,`isDraft`),
  KEY `FK_2uri089mvwu1rrlp9wsvlj4am` (`creator_id`),
  KEY `FK_and841xotd721jfciehumae5e` (`newspaper_id`),
  CONSTRAINT `FK_and841xotd721jfciehumae5e` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_2uri089mvwu1rrlp9wsvlj4am` FOREIGN KEY (`creator_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust`
--

LOCK TABLES `cust` WRITE;
/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
INSERT INTO `cust` VALUES (175,0,'This is the audit 1',1,'\0','2018-09-02 09:21:00','02fhsg-0918','Audit 1',99,108),(176,0,'this is the audit 2',2,'',NULL,'03hrwk-1218','Audir 2',99,114),(177,0,'this is the audit 3',3,'\0',NULL,'17ekw-0219','Audit 3',100,108),(178,0,'this is the audit 2',1,'',NULL,'03etk-0618','Audit 2',100,114),(32768,1,'holi',3,'',NULL,'26hkpdl-0618','holi',99,NULL);
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custform`
--

DROP TABLE IF EXISTS `custform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gauge` int(11) DEFAULT NULL,
  `isDraft` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b5o1d6yl5w77y7rfdcsvnfjr3` (`newspaper_id`),
  CONSTRAINT `FK_b5o1d6yl5w77y7rfdcsvnfjr3` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custform`
--

LOCK TABLES `custform` WRITE;
/*!40000 ALTER TABLE `custform` DISABLE KEYS */;
/*!40000 ALTER TABLE `custform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (104,0,'micomunidad@email.com','Antonio','648567784','Desengaño nº21','Cuesta',94),(105,0,'mipresidente@email.com','Isabel','977455874','Desengaño nº21','Cuesta',95);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_volume`
--

DROP TABLE IF EXISTS `customer_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_volume` (
  `Customer_id` int(11) NOT NULL,
  `volumesSubscribed_id` int(11) NOT NULL,
  KEY `FK_d0uduaw8yntn05p22cpjlfmf0` (`volumesSubscribed_id`),
  KEY `FK_l1hr3vlro2p52cr8qki97xlf5` (`Customer_id`),
  CONSTRAINT `FK_l1hr3vlro2p52cr8qki97xlf5` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_d0uduaw8yntn05p22cpjlfmf0` FOREIGN KEY (`volumesSubscribed_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_volume`
--

LOCK TABLES `customer_volume` WRITE;
/*!40000 ALTER TABLE `customer_volume` DISABLE KEYS */;
INSERT INTO `customer_volume` VALUES (104,118);
/*!40000 ALTER TABLE `customer_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customisation`
--

DROP TABLE IF EXISTS `customisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customisation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customisation`
--

LOCK TABLES `customisation` WRITE;
/*!40000 ALTER TABLE `customisation` DISABLE KEYS */;
INSERT INTO `customisation` VALUES (123,0);
/*!40000 ALTER TABLE `customisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customisation_taboowords`
--

DROP TABLE IF EXISTS `customisation_taboowords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customisation_taboowords` (
  `Customisation_id` int(11) NOT NULL,
  `tabooWords` varchar(255) DEFAULT NULL,
  KEY `FK_4b2nx557joas0xdcys0uv72u` (`Customisation_id`),
  CONSTRAINT `FK_4b2nx557joas0xdcys0uv72u` FOREIGN KEY (`Customisation_id`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customisation_taboowords`
--

LOCK TABLES `customisation_taboowords` WRITE;
/*!40000 ALTER TABLE `customisation_taboowords` DISABLE KEYS */;
INSERT INTO `customisation_taboowords` VALUES (123,'sex'),(123,'sexo'),(123,'viagra'),(123,'cialis');
/*!40000 ALTER TABLE `customisation_taboowords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentFolder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qshunmxjrgbdahcn1eu357sxt` (`parentFolder_id`),
  CONSTRAINT `FK_qshunmxjrgbdahcn1eu357sxt` FOREIGN KEY (`parentFolder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (128,0,'','in box',NULL),(129,0,'','in box',NULL),(130,0,'','in box',NULL),(131,0,'','in box',NULL),(132,0,'','in box',NULL),(133,0,'','in box',NULL),(134,0,'','in box',NULL),(135,0,'','in box',NULL),(136,0,'','in box',NULL),(137,0,'\0','New Folder',NULL),(138,0,'\0','Subfolder',137),(139,0,'','out box',NULL),(140,0,'','out box',NULL),(141,0,'','out box',NULL),(142,0,'','out box',NULL),(143,0,'','out box',NULL),(144,0,'','out box',NULL),(145,0,'','out box',NULL),(146,0,'','out box',NULL),(147,0,'','out box',NULL),(148,0,'','notification box',NULL),(149,0,'','notification box',NULL),(150,0,'','notification box',NULL),(151,0,'','notification box',NULL),(152,0,'','notification box',NULL),(153,0,'','notification box',NULL),(154,0,'','notification box',NULL),(155,0,'','notification box',NULL),(156,0,'','notification box',NULL),(157,0,'','trash box',NULL),(158,0,'','trash box',NULL),(159,0,'','trash box',NULL),(160,0,'','trash box',NULL),(161,0,'','trash box',NULL),(162,0,'','trash box',NULL),(163,0,'','trash box',NULL),(164,0,'','trash box',NULL),(165,0,'','trash box',NULL),(166,0,'','spam box',NULL),(167,0,'','spam box',NULL),(168,0,'','spam box',NULL),(169,0,'','spam box',NULL),(170,0,'','spam box',NULL),(171,0,'','spam box',NULL),(172,0,'','spam box',NULL),(173,0,'','spam box',NULL),(174,0,'','spam box',NULL);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `publicationDate` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_sko764fqk6xie6fm99a5t37lb` (`publicationDate`),
  KEY `FK_aer0q20rslre6418yqlfwmeek` (`article_id`),
  CONSTRAINT `FK_aer0q20rslre6418yqlfwmeek` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (110,0,'2018-08-01 12:21:00','La uña de Cristiano ronaldo se le ha curado completamente','Tras meses de intensa recuperación, el jugador de futbol...','Ya se ha curado',109),(112,0,'2018-09-20 06:21:00','La mesa de messi se le ha arreglado completamente','Tras meses de intenso arreglo, el jugador de futbol y su mesa...','Ya se ha arreglado la mesa',111),(113,0,'2018-07-02 09:21:00','La mesa de messi se le ha vuelto a romper','Cuando creíamos todos que la mesa estaba arreglada al parecer la pobre...','Se ha vuelto a romper',111);
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup_photosurl`
--

DROP TABLE IF EXISTS `followup_photosurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup_photosurl` (
  `FollowUp_id` int(11) NOT NULL,
  `photosURL` varchar(255) DEFAULT NULL,
  KEY `FK_6vl7limkis6mjc42mvmdbb711` (`FollowUp_id`),
  CONSTRAINT `FK_6vl7limkis6mjc42mvmdbb711` FOREIGN KEY (`FollowUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup_photosurl`
--

LOCK TABLES `followup_photosurl` WRITE;
/*!40000 ALTER TABLE `followup_photosurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `followup_photosurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',3);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailmessage`
--

DROP TABLE IF EXISTS `mailmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailmessage` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `isSpam` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7v3h8r2fxcp9cdsogubomnpm7` (`folder_id`),
  CONSTRAINT `FK_7v3h8r2fxcp9cdsogubomnpm7` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailmessage`
--

LOCK TABLES `mailmessage` WRITE;
/*!40000 ALTER TABLE `mailmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isPrivate` bit(1) DEFAULT NULL,
  `pictureURL` varchar(255) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `tabooWords` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ior0xds9ivor5tkkk7q8cvrei` (`publicationDate`,`isPrivate`,`title`,`description`),
  KEY `FK_1vjxhvxnpuoan0f5uyrs4veeg` (`user_id`),
  CONSTRAINT `FK_1vjxhvxnpuoan0f5uyrs4veeg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (108,0,'El mejor periódico de deportes','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Marca.svg/2000px-Marca.svg.png','2018-03-22','\0','Marca',101),(114,0,'Mucha prensa rosa, mucho cotilleo y mucha polémica','','https://www.himgs.com/imagenes/hola/comunes/hola-2017.gif','2018-04-10','\0','Corazón Latino',101),(116,0,'Nos cachondeamos de todo lo que se mueve, sex','','','2019-08-12','','El jueves',101);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_advertisement`
--

DROP TABLE IF EXISTS `newspaper_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_advertisement` (
  `Newspaper_id` int(11) NOT NULL,
  `adverts_id` int(11) NOT NULL,
  KEY `FK_7dwkcdn6odsv88k6hvqsx94in` (`adverts_id`),
  KEY `FK_97th6woe726kprc71xhahdq9f` (`Newspaper_id`),
  CONSTRAINT `FK_97th6woe726kprc71xhahdq9f` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_7dwkcdn6odsv88k6hvqsx94in` FOREIGN KEY (`adverts_id`) REFERENCES `advertisement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_advertisement`
--

LOCK TABLES `newspaper_advertisement` WRITE;
/*!40000 ALTER TABLE `newspaper_advertisement` DISABLE KEYS */;
INSERT INTO `newspaper_advertisement` VALUES (108,124),(108,126),(114,125);
/*!40000 ALTER TABLE `newspaper_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_article`
--

DROP TABLE IF EXISTS `newspaper_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_article` (
  `Newspaper_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  UNIQUE KEY `UK_b6yh4ur28qo9smnd995jo356g` (`articles_id`),
  KEY `FK_53pw01kjsjxn1ycjlwa1q6j13` (`Newspaper_id`),
  CONSTRAINT `FK_53pw01kjsjxn1ycjlwa1q6j13` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_b6yh4ur28qo9smnd995jo356g` FOREIGN KEY (`articles_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_article`
--

LOCK TABLES `newspaper_article` WRITE;
/*!40000 ALTER TABLE `newspaper_article` DISABLE KEYS */;
INSERT INTO `newspaper_article` VALUES (108,109),(108,111),(114,115),(116,117);
/*!40000 ALTER TABLE `newspaper_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_volume`
--

DROP TABLE IF EXISTS `newspaper_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_volume` (
  `Newspaper_id` int(11) NOT NULL,
  `volumen_id` int(11) NOT NULL,
  KEY `FK_fi593gbtdm9bal5arutdrrny4` (`volumen_id`),
  KEY `FK_hg8i1oi5sicqx6atm8nmw80k` (`Newspaper_id`),
  CONSTRAINT `FK_hg8i1oi5sicqx6atm8nmw80k` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_fi593gbtdm9bal5arutdrrny4` FOREIGN KEY (`volumen_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_volume`
--

LOCK TABLES `newspaper_volume` WRITE;
/*!40000 ALTER TABLE `newspaper_volume` DISABLE KEYS */;
INSERT INTO `newspaper_volume` VALUES (108,118),(114,118),(116,119);
/*!40000 ALTER TABLE `newspaper_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaperform`
--

DROP TABLE IF EXISTS `newspaperform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaperform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isPrivate` bit(1) DEFAULT NULL,
  `pictureURL` varchar(255) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaperform`
--

LOCK TABLES `newspaperform` WRITE;
/*!40000 ALTER TABLE `newspaperform` DISABLE KEYS */;
/*!40000 ALTER TABLE `newspaperform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `newspaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2i5w4btb7x3r6d2jsd213aqct` (`customer_id`),
  KEY `FK_b3d3q413vlktogdjnnus3ep9e` (`newspaper_id`),
  CONSTRAINT `FK_b3d3q413vlktogdjnnus3ep9e` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_2i5w4btb7x3r6d2jsd213aqct` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (127,0,621,'MasterCard',7,22,'Juan Cuesta Sanabria','5220277771031876',104,114);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionform`
--

DROP TABLE IF EXISTS `subscriptionform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mhejgj3rxmt6ehuq9on6il5n1` (`newspaper_id`),
  CONSTRAINT `FK_mhejgj3rxmt6ehuq9on6il5n1` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionform`
--

LOCK TABLES `subscriptionform` WRITE;
/*!40000 ALTER TABLE `subscriptionform` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionvolumeform`
--

DROP TABLE IF EXISTS `subscriptionvolumeform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionvolumeform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `volume_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_itycs94rav13r56qer16ycba5` (`volume_id`),
  CONSTRAINT `FK_itycs94rav13r56qer16ycba5` FOREIGN KEY (`volume_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionvolumeform`
--

LOCK TABLES `subscriptionvolumeform` WRITE;
/*!40000 ALTER TABLE `subscriptionvolumeform` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionvolumeform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (101,0,'illojulio@email.com','Julio','902242526','Avenida séptima nº5','Sanabria',91),(102,0,'hastaluegomaricarmen@email.com','Mari Carmen','','C/Infierno nº4','Fuertes',92),(103,0,'manolito@gmail.com','Manolo','','','Benitez Perez',93);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `followers_id` int(11) NOT NULL,
  `follows_id` int(11) NOT NULL,
  KEY `FK_p9wcdbf2yc1blf0qgv5tm4ji6` (`follows_id`),
  KEY `FK_ipxcfus1p41qgn9xbfhg2aa0r` (`followers_id`),
  CONSTRAINT `FK_ipxcfus1p41qgn9xbfhg2aa0r` FOREIGN KEY (`followers_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_p9wcdbf2yc1blf0qgv5tm4ji6` FOREIGN KEY (`follows_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (101,102),(103,101);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (90,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(91,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(92,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(93,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(94,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(95,0,'5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(96,0,'83a87fd756ab57199c0bb6d5e11168cb','agent1'),(97,0,'b1a4a6b01cc297d4677c4ca6656e14d7','agent2'),(98,0,'c84258e9c39059a89ab77d846ddab909','admin2');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (90,'ADMIN'),(91,'USER'),(92,'USER'),(93,'USER'),(94,'CUSTOMER'),(95,'CUSTOMER'),(96,'AGENT'),(97,'AGENT'),(98,'ADMIN');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1g852qpv1irbrshl0rmqgfm3a` (`user_id`),
  CONSTRAINT `FK_1g852qpv1irbrshl0rmqgfm3a` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
INSERT INTO `volume` VALUES (118,0,'Esta es la descripción del volumen 1','Volume 1',2018,101),(119,0,'Esta es la descripción del volumen 2','Volume 2',2019,101);
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_customer`
--

DROP TABLE IF EXISTS `volume_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_customer` (
  `Volume_id` int(11) NOT NULL,
  `customersSubscribed_id` int(11) NOT NULL,
  KEY `FK_3bfqil9b5qhoud94q9at8lr5w` (`customersSubscribed_id`),
  KEY `FK_cv2pnuwio7is3avtww1mv7liw` (`Volume_id`),
  CONSTRAINT `FK_cv2pnuwio7is3avtww1mv7liw` FOREIGN KEY (`Volume_id`) REFERENCES `volume` (`id`),
  CONSTRAINT `FK_3bfqil9b5qhoud94q9at8lr5w` FOREIGN KEY (`customersSubscribed_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_customer`
--

LOCK TABLES `volume_customer` WRITE;
/*!40000 ALTER TABLE `volume_customer` DISABLE KEYS */;
INSERT INTO `volume_customer` VALUES (118,104);
/*!40000 ALTER TABLE `volume_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_newspaper`
--

DROP TABLE IF EXISTS `volume_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_newspaper` (
  `Volume_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  KEY `FK_55de0xvt5cb2u4p2xkeofporj` (`newspapers_id`),
  KEY `FK_piiv98lkttksatc6qx4cncuas` (`Volume_id`),
  CONSTRAINT `FK_piiv98lkttksatc6qx4cncuas` FOREIGN KEY (`Volume_id`) REFERENCES `volume` (`id`),
  CONSTRAINT `FK_55de0xvt5cb2u4p2xkeofporj` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_newspaper`
--

LOCK TABLES `volume_newspaper` WRITE;
/*!40000 ALTER TABLE `volume_newspaper` DISABLE KEYS */;
INSERT INTO `volume_newspaper` VALUES (118,108),(118,114),(119,116);
/*!40000 ALTER TABLE `volume_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumeform`
--

DROP TABLE IF EXISTS `volumeform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumeform` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumeform`
--

LOCK TABLES `volumeform` WRITE;
/*!40000 ALTER TABLE `volumeform` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumeform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumeform_newspaper`
--

DROP TABLE IF EXISTS `volumeform_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumeform_newspaper` (
  `VolumeForm_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  KEY `FK_oagsufm460622gnik0nvb64x1` (`newspapers_id`),
  KEY `FK_hqlrlejetwmdul0uq9l829ufi` (`VolumeForm_id`),
  CONSTRAINT `FK_hqlrlejetwmdul0uq9l829ufi` FOREIGN KEY (`VolumeForm_id`) REFERENCES `volumeform` (`id`),
  CONSTRAINT `FK_oagsufm460622gnik0nvb64x1` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumeform_newspaper`
--

LOCK TABLES `volumeform_newspaper` WRITE;
/*!40000 ALTER TABLE `volumeform_newspaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumeform_newspaper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-26 17:36:41

commit;