-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: zbads
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `zbads`
--

/*!40000 DROP DATABASE IF EXISTS `zbads`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zbads` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `zbads`;

--
-- Table structure for table `adgroup`
--

DROP TABLE IF EXISTS `adgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adgroup` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertiserID` int unsigned DEFAULT NULL,
  `siteID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adgroup`
--

LOCK TABLES `adgroup` WRITE;
/*!40000 ALTER TABLE `adgroup` DISABLE KEYS */;
INSERT INTO `adgroup` VALUES (1,1,1,'Első csoport',NULL,0,1,2,'2012-01-18 12:10:33',2,'2012-01-25 16:16:03');
/*!40000 ALTER TABLE `adgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advert`
--

DROP TABLE IF EXISTS `advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertiserID` int unsigned DEFAULT NULL,
  `siteID` int unsigned DEFAULT NULL,
  `adgroupID` int unsigned DEFAULT NULL,
  `sizeID` int unsigned DEFAULT '0',
  `sourceID` int unsigned DEFAULT NULL,
  `zoneID` int unsigned DEFAULT NULL,
  `campaignID` int unsigned DEFAULT NULL,
  `sizeWidth` int unsigned DEFAULT NULL,
  `sizeHeight` int unsigned DEFAULT NULL,
  `changeTime` int unsigned DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `fileName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `textValue` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `jumpURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `activateWhen` datetime DEFAULT NULL,
  `deactivateWhen` datetime DEFAULT NULL,
  `playMaxNum` int unsigned DEFAULT NULL,
  `playCounter` int unsigned DEFAULT NULL,
  `clickMaxNum` int unsigned DEFAULT NULL,
  `clickCounter` int unsigned DEFAULT NULL,
  `priceMax` double unsigned DEFAULT NULL,
  `priceActual` double unsigned DEFAULT NULL,
  `price` double unsigned DEFAULT NULL,
  `percentVAT` double unsigned DEFAULT NULL,
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `lastvisit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert`
--

LOCK TABLES `advert` WRITE;
/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
INSERT INTO `advert` VALUES (1,1,1,1,8,2,4,1,728,90,NULL,NULL,1,'1. reklÃ¡m','advert_1.gif',NULL,'http://almariumbisztro.hu/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200,27,1,2,'2012-01-18 13:41:51',2,'2013-06-13 13:13:27',NULL),(2,1,1,1,NULL,2,1,1,728,90,NULL,NULL,1,'2. reklÃ¡m','advert_2.gif',NULL,'http://rodnas.uw.hu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,27,1,2,'2012-01-23 13:26:52',2,'2012-01-25 16:29:38',NULL),(3,1,1,1,NULL,2,2,1,318,318,NULL,NULL,1,'Zapaca 318x318','pia_3.jpg',NULL,'http://www.eljunkjol.hu/gasztro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2012-01-24 20:22:14',2,'2012-01-25 16:29:35',NULL),(6,1,1,1,NULL,1,3,1,200,286,NULL,NULL,1,'Bergman Flash','bergmanmedia_6.swf',NULL,'http://rodnas.uw.hu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2012-01-25 12:16:06',2,'2012-01-25 16:05:00',NULL),(5,1,1,1,NULL,2,1,1,728,90,NULL,NULL,1,'4. reklÃ¡m','728x90_web_banner_example_4_5.jpg',NULL,'http://rodnas.uw.hu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'2012-01-25 11:33:20',2,'2012-01-25 16:29:32',NULL),(7,3,NULL,NULL,1,2,NULL,2,NULL,NULL,NULL,NULL,1,'Nokia 2012.01.26','head_7.jpg',NULL,NULL,NULL,'2012-01-30 00:00:00','2012-03-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,3,'2012-01-26 14:14:45',2,'2012-01-30 09:18:22',NULL);
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertiser`
--

DROP TABLE IF EXISTS `advertiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertiser` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usersID` int unsigned DEFAULT NULL,
  `name` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `zipcode` int unsigned DEFAULT NULL,
  `settlement` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `contactName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fax` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `website` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activateWhen` datetime DEFAULT NULL,
  `deactivateWhen` datetime DEFAULT NULL,
  `playMaxNum` int unsigned DEFAULT NULL,
  `playCounter` int unsigned DEFAULT NULL,
  `clickMaxNum` int unsigned DEFAULT NULL,
  `clickCounter` int unsigned DEFAULT NULL,
  `priceMax` double unsigned DEFAULT NULL,
  `priceActual` double unsigned DEFAULT NULL,
  `langID` int unsigned DEFAULT '1',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT NULL,
  `insertUserID` int unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertiser`
--

LOCK TABLES `advertiser` WRITE;
/*!40000 ALTER TABLE `advertiser` DISABLE KEYS */;
INSERT INTO `advertiser` VALUES (1,NULL,'Bergman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-18 12:09:12',2,'2012-01-25 15:51:37'),(2,NULL,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-25 15:53:01',NULL,NULL),(3,NULL,'Nokia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,3,'2012-01-26 14:10:17',NULL,NULL),(4,NULL,'Otp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-27 08:17:26',NULL,NULL),(5,NULL,'K&H',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-27 08:19:10',NULL,NULL),(6,NULL,'CIB Bank',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-27 08:23:32',NULL,NULL),(7,NULL,'Rafaisen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,'2012-01-27 08:25:08',NULL,NULL),(8,NULL,'Tesco',1111,'abra','kadabra',NULL,'kapcsolat','telefon','fax','mobil','{$config[advertiser_x_email]}','{$config[advertiser_x_website]}','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,1,NULL,1,2,'2012-01-27 09:15:32',NULL,NULL);
/*!40000 ALTER TABLE `advertiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertlog`
--

DROP TABLE IF EXISTS `advertlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertlog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertID` int unsigned DEFAULT '0',
  `remoteIP` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `jumpURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `playWhen` datetime DEFAULT NULL,
  `clickWhen` datetime DEFAULT NULL,
  `price` double unsigned DEFAULT NULL,
  `percentVAT` double unsigned DEFAULT NULL,
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertlog`
--

LOCK TABLES `advertlog` WRITE;
/*!40000 ALTER TABLE `advertlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int unsigned DEFAULT NULL,
  `advertiserID` int unsigned DEFAULT NULL,
  `zoneID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activateWhen` datetime DEFAULT NULL,
  `deactivateWhen` datetime DEFAULT NULL,
  `playMaxNum` int unsigned DEFAULT NULL,
  `playCounter` int unsigned DEFAULT NULL,
  `clickMaxNum` int unsigned DEFAULT NULL,
  `clickCounter` int unsigned DEFAULT NULL,
  `priceMax` double unsigned DEFAULT NULL,
  `priceActual` double unsigned DEFAULT NULL,
  `percentVAT` double unsigned DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,1,1,1,'ElsÅ‘ kampÃ¡ny','2012-01-26 00:00:00','2012-03-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-18 12:12:04',2,'2012-01-26 09:46:42'),(2,NULL,NULL,NULL,'nokia 2012.01.26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,3,'2012-01-26 14:12:23',NULL,NULL),(3,NULL,NULL,NULL,'Otp 2012.01.27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-27 08:17:43',NULL,NULL),(4,NULL,NULL,NULL,'K&H 2012.01.27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-27 08:19:30',NULL,NULL),(5,NULL,NULL,NULL,'CIB Bank 2012.01.27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-27 08:23:51',NULL,NULL),(6,NULL,NULL,NULL,'Rafaisen 2012.01.27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-27 08:25:27',NULL,NULL),(7,NULL,NULL,NULL,'Tesco 2012.01.27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2,'2012-01-27 09:15:49',NULL,NULL);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `modul` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cfgCFG` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lngCFG` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `tplCFG` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `cfgPATH` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lngPATH` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `tplPATH` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `siteID` int unsigned DEFAULT NULL,
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (2,'users','FelhasznÃ¡lÃ³k',NULL,'##nameCFG##\r\ntitle<=>FelhasznÃ¡lÃ³k\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nsiteID<=>Web oldal<#>\r\nmodulID<=>Modul<#>\r\nusertitle<=>Titulus<#>\r\nsurname<=>VezetÃ©knÃ©v<#>\r\nforename<=>KeresztnÃ©v<#>\r\nemail<=>Email<#>\r\nnickname<=>BecenÃ©v<#>\r\npassword<=>JelszÃ³<#>\r\npassword2<=>JelszÃ³ megerÅ‘sÃ­tÃ©s<#>\r\noldpassword<=>RÃ©gi jelszÃ³<#>\r\ngroups<=>Csoport<#>\r\npictureURL<=>KÃ©p<#>\r\nactivationWhen<=>AktivÃ¡lva<#>\r\nnewsletter<=>HirlevÃ©l<#>\r\nmyData<=>Adataim<#>\r\npassChange<=>JelszÃ³ vÃ¡ltÃ¡s<#>\r\nregistration<=>RegisztrÃ¡ciÃ³<#>\r\nnextModul<=>FelhasznÃ¡lÃ³ jogai<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnicknameEmpty<=>Ãœres BecenÃ©v!<#>\r\nnicknameDuplicate<=>MÃ¡r van ilyen felhasznÃ¡lÃ³nÃ©v!<#>\r\npasswordEmpty<=>Ãœres JelszÃ³!<#>\r\npassword2Empty<=>Ãœres JelszÃ³ megerÅ‘sÃ­tÃ©s!<#>\r\npasswordPassword<=>HibÃ¡s JelszÃ³ megerÅ‘sÃ­tÃ©s!<#>\r\npasswordOldEmpty<=>Ãœres RÃ©gi jelszÃ³!<#>\r\ngroupsIDEmpty<=>Ãœres Csoport!<#>\r\nsurnameEmpty<=>Ãœres VezetÃ©knÃ©v!<#>\r\nforenameEmpty<=>Ãœres KeresztnÃ©v!<#>\r\nemailEmpty<=>Ãœres Email!<#>\r\nemailEmail<=>HibÃ¡s Email!<#>\r\nemailDuplicate<=>MÃ¡r van ilyen Email!<#>\r\nnotFoundUser<=>Nem lÃ©tezÅ‘ RÃ¶vidnÃ©v/JelszÃ³!\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,1,'2005-08-29 23:45:38',2,'2012-01-16 14:25:29'),(3,'users_rights','FelhasznÃ¡lÃ³ jogai',NULL,'##nameCFG##\r\ntitle<=>FelhasznÃ¡lÃ³ jogai\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nsite<=>Weboldal<#>\r\nsiteID<=>Weboldal<#>\r\nusers<=>FelhasznÃ¡lÃ³<#>\r\nusersID<=>FelhasznÃ¡lÃ³<#>\r\nmodulID<=>Modul<#>\r\nmodul<=>Modul<#>\r\nwhose_id<=>FelhasznÃ¡lÃ³<#>\r\nrights_id<=>Modul<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nmodulIDEmpty<=>Ãœres Modul!<#>\r\nsiteIDEmpty<=>Ãœres Weboldal!\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,1,'2005-08-29 23:46:03',2,'2012-01-17 13:38:13'),(4,'groups','Csoportok',NULL,'##nameCFG##\r\ntitle<=>Csoportok\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nsiteID<=>Web oldal<#>\r\nname<=>Csoport<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\nlang<=>Nyelv<#>\r\nnextModul<=>Csoport jogai\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres Csoport!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen Csoport!<#>\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,1,'2005-08-29 23:46:31',2,'2012-01-16 14:24:24'),(5,'groups_rights','Csoport jogai',NULL,'##nameCFG##\r\ntitle<=>Csoport jogai\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nsite<=>Weboldal<#>\r\nsiteID<=>Weboldal<#>\r\ngroups<=>Csoport<#>\r\ngroupsID<=>Csoport<#>\r\nmodulID<=>Modul<#>\r\nmodul<=>Modul<#>\r\nwhose_id<=>Csoport<#>\r\nrights_id<=>Modul<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nmodulIDEmpty<=>Ãœres Modul!<#>\r\nsiteIDEmpty<=>Ãœres Weboldal!\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,1,'2005-08-29 23:46:46',2,'2012-01-17 13:37:39'),(7,'lang','Nyelv',NULL,NULL,NULL,'',NULL,NULL,15,0,NULL,1,1,NULL,1,'2005-08-29 23:48:06',2,'2010-09-24 08:57:03'),(78,'advert','Banner',NULL,'##nameCFG##\r\ntitle<=>Banner\r\n##/nameCFG##\r\n##titleCFG##\r\nmachinemanagedD<=>AzonosÃ­tÃ³<#>\r\nname<=>NÃ©v<#>\r\nfileName<=>File<#>\r\ntextValue<=>SzÃ¶veges tartalom<#>\r\njumpURL<=>Link<#>\r\nadvertiserID<=>HirdetÅ‘<#>\r\nadgroupID<=>ReklÃ¡m csoport<#>\r\ncampaignID<=>KampÃ¡ny<#>\r\nzoneID<=>ZÃ³na<#>\r\nsizeID<=>MÃ©ret<#>\r\nsourceID<=>ForrÃ¡s<#>\r\nsiteID<=>Weboldal<#>\r\nsizeWidth<=>SzÃ©lessÃ©g<#>\r\nsizeHeight<=>MagassÃ¡g<#>\r\nchangeTime<=>Csere idÅ‘ (s)<#>\r\nactivateWhen<=>MettÅ‘l<#>\r\ndeactivateWhen<=>Meddig<#>\r\nplayMaxNum<=>MaximÃ¡lis lejÃ¡tszÃ¡s<#>\r\nplayCounter<=>LejÃ¡tszott<#>\r\nclickMaxNum<=>MaximÃ¡lis klikkelÃ©s<#>\r\nclickCounter<=>Klikkeltek<#>\r\npriceMax<=>MaximÃ¡lisan kÃ¶lthetÅ‘<#>\r\npriceActual<=>ElkÃ¶ltÃ¶tt<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nsourceName<=>ForrÃ¡s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,15,NULL,1,1,NULL,2,'2009-06-10 12:14:20',2,'2012-01-26 12:11:16'),(89,'usertitle','Titulus',NULL,'##nameCFG##\r\ntitle<=>Titulus\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nname<=>MegnevezÃ©s<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,2,'2009-07-01 10:12:24',2,'2012-01-16 14:26:20'),(99,'userslog','login/logout',NULL,NULL,NULL,NULL,NULL,NULL,15,0,NULL,1,1,NULL,2,'2009-08-12 20:40:21',NULL,NULL),(112,'site','Web oldal',NULL,'##nameCFG##\r\ntitle<=>Weboldal\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nname<=>MegnevezÃ©s<#>\r\nwwwAddress<=>Web oldal<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##\r\n',NULL,'admin/cfg/',NULL,'admin/tpl/',15,0,NULL,1,1,NULL,2,'2010-09-24 00:04:41',2,'2012-01-16 14:27:37'),(131,'configShare','Rendszer',NULL,'##titleCFG##\r\nloginName<=>FELHASZNÃLÃ“NÃ‰V<#>\r\nloginPassword<=>JELSZÃ“<#>\r\nloginSubmit<=>BEJELENTKEZÃ‰S<#>\r\nloginTHelp<=>technikai segÃ­tsÃ©g: +36.20.441.5000<#>\r\nsystemTitle<=>ZBads<#>\r\ntopMessage<=>A Honlap feltÅ‘ltÃ©se folyamatban ezÃ©rt 1-2 funkciÃ³ mÃ©g nem mÅ±kÃ¶dik.<#>\r\nlogoTitle<=><#>\r\ndeveloperTitle<=>SzS Â© Copyright<#>\r\nfooter<=>Copyright Â© Bergman<#>\r\nlistTitle<=>Lista<#>\r\naddTitle<=>Felvitel<#>\r\ncopyTitle<=>MÃ¡solÃ¡s<#>\r\neditTitle<=>MÃ³dosÃ­tÃ¡s<#>\r\ndeleteTitle<=>TÃ¶rlÃ©s<#>\r\nviewTitle<=>MegtekintÃ©s<#>\r\nactiveTitle<=>AktÃ­v<#>\r\nsearchTitle<=>KeresÃ©s<#>\r\nfirstTitle<=>ElsÅ‘<#>\r\nprevTitle<=>ElÅ‘zÅ‘<#>\r\nnextTitle<=>KÃ¶vetkezÅ‘<#>\r\nlastTitle<=>UtolsÃ³<#>\r\nbackTitle<=>Vissza<#>\r\nsaveTitle<=>MentÃ©s<#>\r\nsaveNoBack<=>MentÃ©s Ã©s maradok<#>\r\nitem<=>TÃ©tel<#>\r\npage<=>Oldal<#>\r\nsearchOnTitle<=>KeresÃ©s<#>\r\nsearchOffTitle<=>Ã–sszes<#>\r\nsearchExactTitle<=>Teljes egyezÃ©s<#>\r\nsearchAllWordTitle<=>Ã–sszes<#>\r\nsearchAnyWordTitle<=>BÃ¡rmely<#>\r\nitemActiveTitle<=>AktÃ­v<#>\r\nitemInserterTitle<=>RÃ¶gzÃ­tÅ‘<#>\r\nitemInsertWhenTitle<=>RÃ¶gzÃ­tve<#>\r\nitemModifierTitle<=>MÃ³dosÃ­tÃ³<#>\r\nitemModifyWhenTitle<=>MÃ³dosÃ­tva<#>\r\nitemSelectTitle<=>---- KÃ©rem VÃ¡lasszon! ----<#>\r\nyesTitle<=>EngedÃ©lyezve<#>\r\nnoTitle<=>Tiltva<#>\r\nmyDataTitle<=>Adatlap<#>\r\npassChangeTitle<=>JelszÃ³ vÃ¡ltÃ¡s<#>\r\nregistrationTitle<=>RegisztrÃ¡ciÃ³<#>\r\nloginTitle<=>BelÃ©pÃ©s<#>\r\nlogoutTitle<=>KijelentkezÃ©s<#>\r\nawayTitle<=>TovÃ¡bb<#>\r\norderTitle<=>RendezettsÃ©g<#>\r\nnoRecordTitle<=>Nincs talÃ¡lat!<#>\r\nnoRightsTitle<=>Nincs jogosultsÃ¡g!<#>\r\nyearTitle<=>Ã‰v<#>\r\nmonthTitle<=>HÃ³<#>\r\ndayTitle<=>Nap<#>\r\nmoneyTitle<=>Ft<#>\r\nmoneyMonthTitle<=>Ft/hÃ³<#>\r\nhourTitle<=>Ã“ra<#>\r\nminTitle<=>perc<#>\r\nsecTitle<=>mÃ¡sodperc<#>\r\nlangTitle<=>Nyelv<#>\r\nsiteIDTitle<=>Weboldal<#>\r\nthemesTitle<=>Arculat<#>\r\ninsertWhenTitle<=>RÃ¶gzÃ­tve<#>\r\ndescriptionTitle<=>LeÃ­rÃ¡s<#>\r\npasswordTitle<=>JelszÃ³<#>\r\nadminTitle<=>Admin<#>\r\npictureAddTitle<=>KÃ©p felvitel<#>\r\npictureEditTitle<=>KÃ©p csere<#>\r\npictureURLTitle<=>KÃ©p cÃ­me<#>\r\nemailTitle<=>E-mail<#>\r\nnameTitle<=>MegnevezÃ©s<#>\r\nnameErrMsg<=>Ãœres MegnevezÃ©s!<#>\r\nlangIDTitle<=>Nyelv<#>\r\nthemesIDTitle<=>Arculat<#>\r\nmodulIDTitle<=>Modul<#>\r\nshortnameBad<=>HibÃ¡s RÃ¶vidnÃ©v!<#>\r\npasswordBad<=>HibÃ¡s JelszÃ³!<#>\r\ndomainCheckReserve<=>nem szabad<#>\r\ndomainCheckFree<=>mÃ©g regisztrÃ¡lhatÃ³<#>\r\ndomainCheckName<=>domain nÃ©v<#>\r\nwelcomeText<=>ÃœdvÃ¶zlÃ¼nk <#>\r\ndomainCheckBasket<=>KosÃ¡rba\r\n##/titleCFG##',NULL,'admin/cfg/',NULL,NULL,15,0,NULL,1,1,NULL,2,'2011-03-11 22:34:24',2,'2012-01-16 15:27:00'),(123,'zone','ZÃ³na',NULL,'##nameCFG##\r\ntitle<=>ZÃ³na\r\n##/nameCFG##\r\n##titleCFG##\r\nadvertiserID<=>HirdetÅ‘<#>\r\nsiteID<=>Weboldal<#>\r\nid<=>AzonosÃ­tÃ³<#>\r\nname<=>MegnevezÃ©s<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,0,NULL,1,1,NULL,2,'2011-03-02 07:34:38',2,'2012-01-16 14:28:25'),(126,'campaign','KampÃ¡ny',NULL,'##nameCFG##\r\ntitle<=>KampÃ¡ny\r\n##/nameCFG##\r\n##titleCFG##\r\nmachinemanagedD<=>AzonosÃ­tÃ³<#>\r\nname<=>NÃ©v<#>\r\nadvertiserID<=>HirdetÅ‘<#>\r\nzoneID<=>ZÃ³na<#>\r\nsiteID<=>Weboldal<#>\r\nactivateWhen<=>MettÅ‘l<#>\r\ndeactivateWhen<=>Meddig<#>\r\nplayMaxNum<=>MaximÃ¡lis lejÃ¡tszÃ¡s<#>\r\nplayCounter<=>LejÃ¡tszott<#>\r\nclickMaxNum<=>MaximÃ¡lis klikkelÃ©s<#>\r\nclickCounter<=>Klikkeltek<#>\r\npriceMax<=>MaximÃ¡lisan kÃ¶lthetÅ‘<#>\r\npriceActual<=>ElkÃ¶ltÃ¶tt<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,0,NULL,1,1,NULL,2,'2011-03-02 07:36:13',2,'2012-01-16 14:29:45'),(127,'advertiser','HirdetÅ‘',NULL,'##nameCFG##\r\ntitle<=>HirdetÅ‘\r\n##/nameCFG##\r\n##titleCFG##\r\nmachinemanagedD<=>AzonosÃ­tÃ³<#>\r\nname<=>NÃ©v<#>\r\nzipcode<=>Ir.szÃ¡m<#>\r\nsettlement<=>TelepÃ¼lÃ©s<#>\r\naddress<=>Utca, hÃ¡zszÃ¡m<#>\r\ncontactName<=>KapcsolattartÃ³<#>\r\nphone<=>Telefon<#>\r\nfax<=>Fax<#>\r\nmobile<=>Mobil<#>\r\nemail<=>Email<#>\r\nwebsite<=>Weboldal<#>\r\nactivateWhen<=>MettÅ‘l<#>\r\ndeactivateWhen<=>Meddig<#>\r\nplayMaxNum<=>MaximÃ¡lis lejÃ¡tszÃ¡s<#>\r\nplayCounter<=>LejÃ¡tszott<#>\r\nclickMaxNum<=>MaximÃ¡lis klikkelÃ©s<#>\r\nclickCounter<=>Klikkeltek<#>\r\npriceMax<=>MaximÃ¡lisan kÃ¶lthetÅ‘<#>\r\npriceActual<=>ElkÃ¶ltÃ¶tt<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,0,NULL,1,1,NULL,2,'2011-03-02 07:36:46',2,'2012-01-16 14:29:18'),(128,'size','MÃ©ret',NULL,'##nameCFG##\r\ntitle<=>MÃ©ret\r\n##/nameCFG##\r\n##titleCFG##\r\nadvertiserID<=>HirdetÅ‘<#>\r\nsiteID<=>Weboldal<#>\r\nname<=>NÃ©v<#>\r\nsizeWidth<=>SzÃ©lessÃ©g<#>\r\nsizeHeight<=>MagassÃ¡g<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,0,NULL,1,1,NULL,2,'2011-03-02 07:37:44',2,'2012-01-16 14:28:53'),(130,'source','ForrÃ¡s',NULL,'##nameCFG##\r\ntitle<=>ForrÃ¡s\r\n##/nameCFG##\r\n##titleCFG##\r\nadvertiserID<=>HirdetÅ‘<#>\r\nsiteID<=>Weboldal<#>\r\nid<=>AzonosÃ­tÃ³<#>\r\nname<=>NÃ©v<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##\r\n',NULL,'cfg/',NULL,'tpl/',15,0,NULL,1,1,NULL,2,'2011-03-09 20:08:41',2,'2012-01-16 14:28:03'),(133,'adgroup','ReklÃ¡m csoport',NULL,'##nameCFG##\r\ntitle<=>ReklÃ¡m csoport\r\n##/nameCFG##\r\n##titleCFG##\r\nadvertiserID<=>HirdetÅ‘<#>\r\nsiteID<=>Weboldal<#>\r\nid<=>AzonosÃ­tÃ³<#>\r\nname<=>MegnevezÃ©s<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\ncomment<=>MegjegyzÃ©s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nnameEmpty<=>Ãœres NÃ©v!<#>\r\nnameDuplicate<=>MÃ¡r van ilyen!\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',15,0,NULL,0,1,NULL,2,'2012-01-16 10:05:46',2,'2012-01-25 16:34:49'),(134,'configs','KonfigurÃ¡tor',NULL,'##nameCFG##\r\ntitle<=>KonfigurÃ¡tor\r\n##/nameCFG##\r\n##titleCFG##\r\nid<=>AzonosÃ­tÃ³<#>\r\nsite<=>Web oldal<#>\r\nsiteID<=>Web oldal<#>\r\nmodul<=>Modul<#>\r\nname<=>MegnevezÃ©s<#>\r\niniCFG<=>KonfigurÃ¡ciÃ³<#>\r\nlngCFG<=>Nyelv leÃ­rÃ¡s<#>\r\ncfgPATH<=>cfg Ãºtvonal<#>\r\ntplPATH<=>tpl Ãºtvonal<#>\r\nvalue<=>Ã‰rtÃ©k<#>\r\nmemberValue<=>Tag Ã©rtÃ©k<#>\r\ndescription<=>LeÃ­rÃ¡s<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\nmodulEmpty<=>Ãœres Modul!<#>\r\nnameEmpty<=>Ãœres MegnevezÃ©s!<#>\r\nvalueEmpty<=>Ãœres Ã‰rtÃ©k!\r\n##/errorCFG##',NULL,'admin/cfg/',NULL,'admin/tpl/',15,15,NULL,1,1,1,2,'2012-01-16 14:15:08',2,'2012-01-16 15:33:08'),(135,'advertlog','ReklÃ¡m log',NULL,'##nameCFG##\r\ntitle<=>ReklÃ¡m log\r\n##/nameCFG##\r\n##titleCFG##\r\nadvertID<=>ReklÃ¡m<#>\r\nadvert<=>ReklÃ¡m<#>\r\nname<=>NÃ©v<#>\r\njumpURL<=>Link<#>\r\nremoteIP<=>HÃ­vÃ³ IP cÃ­m<#>\r\nprice<=>Ãr<#>\r\npercentVAT<=>ÃFA<#>\r\nplayWhen<=>LejÃ¡tszva<#>\r\nclickWhen<=>Kattintva<#>\r\ninsertWhen<=>RÃ¶gzÃ­tve<#>\r\nlang<=>Nyelv\r\n##/titleCFG##\r\n##errorCFG##\r\n##/errorCFG##',NULL,'cfg/',NULL,'tpl/',8,0,NULL,1,1,NULL,2,'2012-01-23 12:13:23',2,'2012-01-23 14:21:32');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `systemType` enum('frontend','admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `core_configsID` bigint unsigned DEFAULT NULL,
  `fieldName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fieldValue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `autoload` int unsigned DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (2,'frontend',NULL,'barcodeType','0',NULL,1,1,NULL,NULL,NULL,NULL),(3,'frontend',NULL,'maxPatientView','8',NULL,1,1,NULL,NULL,2,'2013-10-03 15:19:04'),(4,'frontend',NULL,'waitingBoxRefresh','10',NULL,1,1,NULL,NULL,NULL,NULL),(5,'frontend',NULL,'bannerBoxRefresh','1800',NULL,1,1,NULL,NULL,NULL,NULL),(6,'frontend',NULL,'marqueeBoxRefresh','10',NULL,1,1,NULL,NULL,NULL,NULL),(7,'frontend',NULL,'barcodeReadTimeout','8',NULL,1,1,NULL,NULL,2,'2013-11-26 12:18:10'),(8,'frontend',NULL,'patientViewTimeout','8',NULL,1,1,NULL,NULL,2,'2013-11-26 12:18:26'),(9,'frontend',NULL,'patientViewRefresh','1',NULL,1,1,NULL,NULL,NULL,NULL),(10,'frontend',NULL,'bannerChangeTimeout','15',NULL,1,1,NULL,NULL,NULL,NULL),(11,'frontend',NULL,'bannerDrMaximum','6',NULL,1,1,NULL,NULL,NULL,NULL),(12,'frontend',NULL,'marqueeDrMaximum','5',NULL,1,1,NULL,NULL,NULL,NULL),(13,'frontend',NULL,'playAudio','1',NULL,1,1,NULL,NULL,NULL,NULL),(14,'frontend',NULL,'cssFromFile','1',NULL,1,1,NULL,NULL,NULL,NULL),(15,'frontend',NULL,'cssInsertRename','0',NULL,1,1,NULL,NULL,NULL,NULL),(16,'frontend',NULL,'callUpCounterMax','1',NULL,1,1,NULL,NULL,NULL,NULL),(17,'frontend',NULL,'dayStartClearBefore','1',NULL,1,1,NULL,NULL,NULL,NULL),(18,'admin',10,'miniBoxZoomHeight','600px',NULL,1,1,2,'2013-09-09 13:03:11',NULL,NULL),(19,'admin',68,'boxRefresh','60',NULL,1,1,2,'2013-09-08 09:24:54',2,'2013-09-08 20:00:48'),(20,'frontend',NULL,'getBarcodeErrorAudio','<audio autoplay><source src=\"../docroot/audio/hiba.wav\" type=\"audio/wav\"></audio>',NULL,1,1,2,'2013-11-28 14:36:48',2,'2016-05-15 11:08:28'),(21,'frontend',NULL,'callUpAudio','<audio autoplay><source src=\"../docroot/audio/behivas.wav\" type=\"audio/wav\"></audio>',NULL,1,1,NULL,NULL,2,'2013-11-08 09:41:15'),(22,'frontend',NULL,'patientCallType','madmax',NULL,1,1,NULL,NULL,NULL,NULL),(23,'frontend',NULL,'getBarcodeAudio','<audio autoplay><source src=\"../docroot/audio/kartya.wav\" type=\"audio/wav\"></audio>',NULL,1,1,2,'2013-11-08 09:10:29',2,'2013-11-08 09:40:48'),(24,'frontend',NULL,'defaultOrderTime','--:-- - --:--',NULL,1,1,2,'2013-11-19 12:25:34',NULL,NULL),(25,'frontend',NULL,'barcodeLogging','0',NULL,1,1,2,'2013-11-19 12:25:34',NULL,NULL),(26,'frontend',NULL,'doctorNameViewNo','0',NULL,1,1,NULL,NULL,NULL,NULL),(27,'frontend',NULL,'waitingListSetup1920x1080','750<=>220<=>17<=>6',NULL,1,1,2,'2013-11-27 11:58:57',2,'2013-11-27 13:27:42'),(28,'frontend',NULL,'waitingListSetup1360x768','550<=>180<=>12<=>5',NULL,1,1,2,'2013-11-27 18:30:10',2,'2013-11-27 18:51:19'),(29,'frontend',NULL,'waitingListSetup1366x768','550<=>180<=>12<=>5',NULL,NULL,1,2,'2013-11-27 18:43:02',2,'2013-11-27 18:52:26'),(30,'frontend',NULL,'waitingListSetup1024x768','550<=>180<=>12<=>5',NULL,1,1,2,'2013-11-27 18:54:06',2,'2016-05-15 11:58:06'),(31,'frontend',NULL,'waitingListSetup1280x720','550<=>180<=>12<=>5',NULL,NULL,1,2,'2013-11-27 19:01:26',2,'2016-05-15 12:02:30'),(32,'admin',72,'core_configsID','Modul',NULL,NULL,1,2,'2017-04-21 08:13:16',NULL,NULL);
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_configs`
--

DROP TABLE IF EXISTS `core_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tplName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_configs`
--

LOCK TABLES `core_configs` WRITE;
/*!40000 ALTER TABLE `core_configs` DISABLE KEYS */;
INSERT INTO `core_configs` VALUES (1,'core_users','Felhasználók','core_users',15,0,NULL,1,1,'2005-08-29 23:45:38',2,'2013-08-24 11:47:27'),(2,'core_users_rights','Felhasználó jogai','core_users_rights',15,0,NULL,1,1,'2005-08-29 23:46:03',2,'2013-07-30 15:50:07'),(3,'core_groups','Csoport','core_groups',15,0,NULL,1,1,'2005-08-29 23:46:31',2,'2013-08-24 11:57:35'),(4,'core_groups_rights','Csoport jogai','core_groups_rights',15,0,NULL,1,1,'2005-08-29 23:46:46',2,'2012-01-17 13:37:39'),(5,'core_lang','Nyelv','core_lang',15,0,NULL,1,1,'2005-08-29 23:48:06',2,'2010-09-24 08:57:03'),(7,'core_userstitle','Titulus','core_userstitle',15,0,NULL,1,2,'2009-07-01 10:12:24',2,'2012-03-25 13:59:07'),(8,'userslog','login/logout',NULL,15,0,NULL,1,2,'2009-08-12 20:40:21',NULL,NULL),(10,'configShare','Rendszer',NULL,15,0,NULL,1,2,'2011-03-11 22:34:24',2,'2012-03-23 23:11:47'),(107,'zone','Zóna',NULL,0,0,NULL,1,2,'2024-05-22 20:39:25',NULL,NULL),(17,'core_configs','Konfigurátor','core_configs',15,15,NULL,1,2,'2012-01-16 14:15:08',2,'2013-07-30 15:48:30'),(22,'core_support','Támogatás','core_support',15,0,NULL,1,2,'2012-02-29 23:12:41',2,'2013-07-30 15:48:20'),(23,'core_support_topic','Téma','core_support_topic',8,0,NULL,1,2,'2012-03-02 23:02:26',2,'2013-08-01 09:24:49'),(24,'core_support_type','Típus','core_support_type',8,0,NULL,1,2,'2012-03-02 23:09:38',2,'2016-05-03 23:16:49'),(25,'core_support_status','Állapot','core_support_status',8,0,NULL,1,2,'2012-03-02 23:10:13',2,'2016-05-03 23:16:12'),(38,'core_messagewall','Üzenőfal','core_messagewall',8,0,NULL,1,2,'2012-03-21 18:28:31',2,'2012-05-12 23:30:35'),(61,'core_support_action','Intézkedés','core_support_action',8,0,NULL,1,2,'2013-08-05 11:36:14',2,'2016-05-03 23:16:08'),(72,'core_config','Setup','core_config',8,0,NULL,1,2,'2013-09-05 22:10:02',2,'2013-09-20 12:01:42'),(73,'core_language','Nyelv','core_language',8,0,NULL,1,2,'2013-09-23 13:12:50',NULL,NULL),(106,'source','Forrás',NULL,0,0,NULL,1,2,'2024-05-22 20:36:50',NULL,NULL),(90,'core_themes','Arculat',NULL,0,0,NULL,1,2,'2017-04-28 10:15:35',NULL,NULL),(101,'site','Site','site',15,0,NULL,1,2,'2024-05-22 15:24:06',NULL,NULL),(102,'ads','Reklám',NULL,0,0,NULL,1,2,'2024-05-22 19:41:03',NULL,NULL),(103,'advertiser','Hirdetés',NULL,8,0,NULL,1,2,'2024-05-22 20:30:49',NULL,NULL),(104,'campaign','Kampány',NULL,0,0,NULL,1,2,'2024-05-22 20:33:07',NULL,NULL),(105,'advert','Banner',NULL,0,0,NULL,1,2,'2024-05-22 20:34:52',NULL,NULL),(97,'health','Egészség',NULL,0,0,NULL,1,2,'2017-04-29 19:37:21',NULL,NULL),(98,'admin','Admin',NULL,0,0,NULL,1,2,'2017-04-29 21:38:07',NULL,NULL),(108,'size','Méret',NULL,0,0,NULL,1,2,'2024-05-22 20:39:39',NULL,NULL),(109,'advertlog','Reklám Log',NULL,0,0,NULL,1,2,'2024-05-22 20:41:22',NULL,NULL),(110,'adgroup','Csoport',NULL,0,0,NULL,1,2,'2024-05-22 20:43:02',NULL,NULL);
/*!40000 ALTER TABLE `core_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_county`
--

DROP TABLE IF EXISTS `core_county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_county` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `county` varchar(127) NOT NULL,
  `core_countryID` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_county`
--

LOCK TABLES `core_county` WRITE;
/*!40000 ALTER TABLE `core_county` DISABLE KEYS */;
INSERT INTO `core_county` VALUES (1,'Budapest',1),(2,'Bács - Kiskun',1),(3,'Baranya',1),(4,'Békés',1),(5,'Borsod-Abaúj-Zemplén',1),(6,'Csongrád',1),(7,'Fejér',1),(8,'Győr-Moson-Sopron',1),(9,'Hajdú-Bihar',1),(10,'Heves',1),(11,'Jász-Nagykun-Szolnok',1),(12,'Komárom-Esztergom',1),(13,'Nógrád',1),(14,'Pest',1),(15,'Somogy',1),(16,'Szabolcs-Szatmár-Bereg',1),(17,'Tolna',1),(18,'Vas',1),(19,'Veszprém',1),(20,'Zala',1);
/*!40000 ALTER TABLE `core_county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_groups`
--

DROP TABLE IF EXISTS `core_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `core_themesID` bigint unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_groups`
--

LOCK TABLES `core_groups` WRITE;
/*!40000 ALTER TABLE `core_groups` DISABLE KEYS */;
INSERT INTO `core_groups` VALUES (1,NULL,'Vendég',NULL,1,2,'2005-08-29 21:08:54',2,'2013-07-22 23:29:48'),(2,NULL,'Supervisor',NULL,1,1,'2005-08-29 21:08:54',2,'2011-12-26 14:56:34'),(3,NULL,'Rendszergazda',NULL,1,1,'2005-08-29 21:10:02',NULL,NULL),(4,NULL,'Kiemelt Tag',NULL,1,1,'2005-08-29 21:10:55',2,'2010-10-05 12:23:21'),(5,NULL,'Tag',NULL,1,2,'2016-10-14 20:37:36',NULL,NULL),(-2,NULL,'Anonymous',NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_groups_config`
--

DROP TABLE IF EXISTS `core_groups_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_groups_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fieldValue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `autoload` int unsigned DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `core_groupsID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_groups_config`
--

LOCK TABLES `core_groups_config` WRITE;
/*!40000 ALTER TABLE `core_groups_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_groups_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_groups_rights`
--

DROP TABLE IF EXISTS `core_groups_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_groups_rights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `core_groupsID` bigint unsigned NOT NULL DEFAULT '0',
  `core_configsID` bigint unsigned NOT NULL DEFAULT '0',
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6872890446324720002 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_groups_rights`
--

LOCK TABLES `core_groups_rights` WRITE;
/*!40000 ALTER TABLE `core_groups_rights` DISABLE KEYS */;
INSERT INTO `core_groups_rights` VALUES (1,2,1,31,0,1,2,'2012-03-30 15:44:44',NULL,NULL),(2,2,2,31,0,1,2,'2012-03-30 15:45:16',NULL,NULL),(3,2,3,31,0,1,2,'2012-03-30 15:46:14',NULL,NULL),(4,2,4,31,0,1,2,'2012-03-30 15:46:27',NULL,NULL),(5,2,5,15,0,1,2,'2012-03-30 15:46:42',NULL,NULL),(7,2,7,31,0,1,2,'2012-03-30 15:47:09',NULL,NULL),(9,2,10,15,0,1,2,'2012-03-30 15:48:16',NULL,NULL),(16,2,17,31,0,1,2,'2012-03-30 15:50:10',NULL,NULL),(124,2,90,31,0,1,2,'2017-04-28 10:16:35',NULL,NULL),(21,2,22,31,0,1,2,'2012-03-30 15:51:54',NULL,NULL),(22,2,23,31,0,1,2,'2012-03-30 15:52:07',NULL,NULL),(23,2,24,31,0,1,2,'2012-03-30 15:52:23',NULL,NULL),(24,2,25,31,0,1,2,'2012-03-30 15:52:36',NULL,NULL),(37,2,38,31,0,1,2,'2012-03-30 15:56:44',NULL,NULL),(84,2,72,31,0,1,2,'2013-09-05 22:10:29',NULL,NULL),(87,2,73,31,0,1,2,'2013-09-23 13:14:02',NULL,NULL),(6872890446324719995,2,107,31,0,1,2,'2024-05-22 20:39:59',NULL,NULL),(6872890446324719996,2,108,31,0,1,2,'2024-05-22 20:40:17',NULL,NULL),(6872890446324719997,2,109,31,0,1,2,'2024-05-22 20:41:42',NULL,NULL),(6872890446324719998,2,110,31,0,1,2,'2024-05-22 20:43:16',NULL,NULL),(6872890446324719999,1,103,8,0,1,2,'2024-06-06 12:00:44',NULL,NULL),(6872890446324720000,1,101,8,0,1,2,'2024-06-06 12:03:02',NULL,NULL),(110,3,1,13,0,1,2,'2016-10-16 20:58:25',NULL,NULL),(111,4,1,12,0,1,2,'2016-10-16 20:59:13',NULL,NULL),(116,1,1,0,0,1,2,'2016-10-20 21:28:46',NULL,NULL),(6872890446324720001,1,102,8,0,1,2,'2024-06-06 12:04:31',NULL,NULL),(115,5,1,4,0,1,2,'2016-10-20 21:26:58',NULL,NULL),(135,1,97,8,0,1,2,'2017-05-11 06:27:00',NULL,NULL),(130,2,97,8,0,1,2,'2017-04-29 19:38:13',NULL,NULL),(131,2,98,8,0,1,2,'2017-04-29 21:38:30',NULL,NULL),(132,2,61,31,0,1,2,'2017-04-29 23:19:42',NULL,NULL),(6872890446324719994,2,106,31,0,1,2,'2024-05-22 20:37:07',NULL,NULL),(6872890446324719993,2,105,31,0,1,2,'2024-05-22 20:35:07',NULL,NULL),(6872890446324719992,2,104,31,0,1,2,'2024-05-22 20:33:22',NULL,NULL),(6872890446324719991,2,103,31,0,1,2,'2024-05-22 20:31:14',NULL,NULL),(6872890446324719990,2,102,31,0,1,2,'2024-05-22 19:42:42',NULL,NULL),(6872890446324719989,2,101,31,0,1,2,'2024-05-22 15:26:25',NULL,NULL);
/*!40000 ALTER TABLE `core_groups_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_import`
--

DROP TABLE IF EXISTS `core_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_import` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fileName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `errorMessage` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_import`
--

LOCK TABLES `core_import` WRITE;
/*!40000 ALTER TABLE `core_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_lang`
--

DROP TABLE IF EXISTS `core_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_lang` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `active` int unsigned NOT NULL,
  `name` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_lang`
--

LOCK TABLES `core_lang` WRITE;
/*!40000 ALTER TABLE `core_lang` DISABLE KEYS */;
INSERT INTO `core_lang` VALUES (1,1,'HU','images/public/button/hu.gif');
/*!40000 ALTER TABLE `core_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_language` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `systemType` enum('frontend','admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `core_configsID` bigint unsigned DEFAULT NULL,
  `fieldName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fieldValue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `autoload` int unsigned DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_language`
--

LOCK TABLES `core_language` WRITE;
/*!40000 ALTER TABLE `core_language` DISABLE KEYS */;
INSERT INTO `core_language` VALUES (1,'frontend',10,'labelWaitDr','ORVOS:',NULL,1,1,NULL,NULL,2,'2013-09-10 15:54:47'),(2,'frontend',NULL,'messageCardAccept','Kártya elfogadva!',NULL,1,1,NULL,NULL,NULL,NULL),(3,'frontend',NULL,'messageComeIn','Kérem fáradjon be!',NULL,1,1,NULL,NULL,NULL,NULL),(4,'frontend',NULL,'messageBarcodeLogged','Már be van jelentkezve!',NULL,1,1,NULL,NULL,NULL,NULL),(5,'frontend',NULL,'messageDrNotOpen','A kártyához tartozó orvos most nem rendel!',NULL,1,1,NULL,NULL,NULL,NULL),(6,'frontend',NULL,'messageDrNotExist','Az Ön orvosa itt nem rendel!',NULL,1,1,NULL,NULL,NULL,NULL),(7,'frontend',NULL,'messageBadWhere','Hibás kihez megadás!',NULL,1,1,NULL,NULL,NULL,NULL),(8,'frontend',NULL,'systemName','Váró',NULL,1,1,NULL,NULL,NULL,NULL),(9,'frontend',NULL,'templateNotFound','Template nem tal',NULL,1,1,NULL,NULL,NULL,NULL),(10,'frontend',NULL,'messageOpenExpired','Rendelési idő lejárt!',NULL,1,1,NULL,NULL,NULL,NULL),(11,'frontend',NULL,'marqueeDrSeparator','--',NULL,1,1,NULL,NULL,NULL,NULL),(12,'frontend',NULL,'marqueeMessageSeparator','**',NULL,1,1,NULL,NULL,NULL,NULL),(13,'frontend',NULL,'cssNotFound','CSS nem található',NULL,1,1,NULL,NULL,NULL,NULL),(14,'admin',10,'copyright','Copyright &copy; rodsys',NULL,1,1,NULL,NULL,2,'2016-05-03 17:38:21'),(15,'admin',10,'loginBoxHeaderText','Bejelentkezés',NULL,0,1,NULL,NULL,2,'2013-09-11 09:05:46'),(16,'frontend',10,'loginSealNumberLabel','PECSÉTSZÁM',NULL,0,1,NULL,NULL,2,'2013-09-11 09:07:14'),(17,'admin',10,'loginNicknameLabel','Név',NULL,0,1,NULL,NULL,2,'2013-09-11 09:09:00'),(18,'admin',10,'loginPasswordLabel','Jelszó',NULL,0,1,NULL,NULL,2,'2013-09-11 09:09:18'),(19,'frontend',10,'shortSystemName','Zbads Admin 1.0',NULL,1,1,NULL,NULL,2,'2016-05-03 17:37:44'),(20,'frontend',NULL,'startSelectTitle','- Kérem válasszon -',NULL,1,1,NULL,NULL,NULL,NULL),(21,'frontend',NULL,'loginSealNumberEmpty','Nincs pecsétszám kiválasztva!',NULL,0,1,NULL,NULL,NULL,NULL),(22,'admin',NULL,'loginNicknameEmpty','Üres felhasználónév!',NULL,0,1,NULL,NULL,NULL,NULL),(23,'admin',NULL,'loginPasswordEmpty','Üres jelszó!',NULL,0,1,NULL,NULL,NULL,NULL),(24,'admin',NULL,'loginNicknameNotExist','Nincs ilyen felhasználó!',NULL,0,1,NULL,NULL,NULL,NULL),(25,'admin',NULL,'loginPasswordBad','Hibás jelszó!',NULL,0,1,NULL,NULL,NULL,NULL),(26,'frontend',NULL,'jsNotFound','js file nem található!',NULL,1,1,NULL,NULL,NULL,NULL),(27,'frontend',NULL,'messageBadBarcode','Ismeretlen kártya formátum!',NULL,1,1,NULL,NULL,NULL,NULL),(28,'frontend',NULL,'orderWhenTitle','Rendelési idő: ',NULL,1,1,NULL,NULL,NULL,NULL),(29,'admin',10,'nocore_whereID','Kihez',NULL,1,1,NULL,NULL,2,'2013-11-19 20:16:02'),(30,'admin',10,'loginSubmitButtonText','Belépés',NULL,1,1,2,'2013-09-09 13:51:43',2,'2013-09-11 09:06:18'),(31,'admin',10,'nocore_statusID','Állapot',NULL,0,1,NULL,NULL,2,'2013-11-19 20:14:59'),(32,'admin',10,'call','Behívás',NULL,0,1,NULL,NULL,2,'2013-11-19 19:52:29'),(33,'admin',10,'inside','Ellátás',NULL,0,1,NULL,NULL,2,'2013-11-19 20:08:35'),(34,'admin',10,'outside','Törlés',NULL,0,1,NULL,NULL,2,'2013-11-19 20:16:52'),(35,'admin',68,'title','Várakozók',NULL,0,1,NULL,NULL,NULL,NULL),(36,'admin',69,'title','Ellátottak',NULL,0,1,NULL,NULL,NULL,NULL),(37,'admin',64,'sealNumber','Orvos',NULL,NULL,1,2,'2013-11-20 10:20:36',2,'2013-11-20 10:21:32'),(38,'admin',70,'title','Előjegyzettek',NULL,0,1,NULL,NULL,NULL,NULL),(39,'admin',67,'nocore_doctor','Orvos',NULL,0,1,NULL,NULL,NULL,NULL),(40,'admin',67,'tajNumber','TAJ',NULL,0,1,NULL,NULL,NULL,NULL),(41,'admin',67,'masterCartonNumber','Törzskarton',NULL,0,1,NULL,NULL,NULL,NULL),(42,'admin',67,'birthDate','Születési dátum',NULL,0,1,NULL,NULL,NULL,NULL),(43,'admin',67,'loginDate','Bejelentkezés dátum',NULL,0,1,NULL,NULL,NULL,NULL),(44,'admin',67,'core_genderID','Neme',NULL,0,1,NULL,NULL,NULL,NULL),(45,'admin',10,'patientID','Beteg',NULL,NULL,1,2,'2013-11-20 10:04:37',NULL,NULL),(46,'admin',67,'tajNumberEmpty','Üres TAJ!',NULL,0,1,NULL,NULL,NULL,NULL),(47,'admin',67,'masterCartonNumberEmpty','Üres Törzskarton!',NULL,0,1,NULL,NULL,NULL,NULL),(48,'admin',67,'birthDateEmpty','Üres Születési dátum!',NULL,0,1,NULL,NULL,NULL,NULL),(49,'admin',67,'loginDateEmpty','Üres Bejelentkezés dátum!',NULL,0,1,NULL,NULL,NULL,NULL),(50,'admin',67,'core_genderIDEmpty','Üres Neme!',NULL,0,1,NULL,NULL,NULL,NULL),(51,'admin',57,'nocore_doctor_order_dayID','Nap',NULL,0,1,NULL,NULL,NULL,NULL),(52,'admin',57,'nocore_doctor_order_typeID','Típus',NULL,0,1,NULL,NULL,NULL,NULL),(53,'admin',57,'startTime','Rendelés mettől','',0,1,NULL,NULL,2,'2014-02-10 19:51:47'),(54,'admin',57,'stopTime','Rendelés meddig',NULL,0,1,NULL,NULL,2,'2014-02-10 19:52:14'),(55,'admin',57,'barcodeStart','Vonalkód kezdés',NULL,0,1,NULL,NULL,NULL,NULL),(56,'admin',57,'barcodeStop','Vonalkód végzés',NULL,0,1,NULL,NULL,NULL,NULL),(57,'admin',57,'doctorIs','Orvos',NULL,0,1,NULL,NULL,NULL,NULL),(58,'admin',57,'nurseIs','Nővér',NULL,0,1,NULL,NULL,NULL,NULL),(59,'admin',57,'nocore_doctor_order_dayIDEmpty','Üres Nap!',NULL,0,1,NULL,NULL,NULL,NULL),(60,'admin',57,'startTimeEmpty','Üres Mettől!',NULL,0,1,NULL,NULL,NULL,NULL),(61,'admin',57,'stopTimeEmpty','Üres Meddig!',NULL,0,1,NULL,NULL,NULL,NULL),(62,'admin',10,'message','Üzenet',NULL,0,1,NULL,NULL,NULL,NULL),(63,'admin',10,'messageEmpty','Üres Üzenet!',NULL,0,1,NULL,NULL,2,'2013-11-19 20:11:09'),(64,'admin',64,'sealNumberDeputy','Helyettes',NULL,0,1,NULL,NULL,NULL,NULL),(65,'admin',10,'stopDate','Meddig','',0,1,NULL,NULL,2,'2013-11-19 20:24:30'),(66,'admin',64,'sealNumberEmpty','Üres Orvos!',NULL,0,1,NULL,NULL,NULL,NULL),(67,'admin',64,'sealNumberDeputyEmpty','Üres Helyettes!',NULL,0,1,NULL,NULL,NULL,NULL),(68,'admin',55,'textValue','Szöveg','',0,1,NULL,NULL,NULL,NULL),(69,'admin',10,'advertFileNameEmpty','Üres Kép!',NULL,0,1,NULL,NULL,NULL,NULL),(70,'admin',55,'textValueEmpty','Üres Szöveg!',NULL,0,1,NULL,NULL,NULL,NULL),(71,'admin',53,'sealNumber','Pecsétszám',NULL,0,1,NULL,NULL,NULL,NULL),(72,'admin',53,'licence','Liszensz',NULL,0,1,NULL,NULL,NULL,NULL),(73,'admin',10,'information','Információ','',0,1,NULL,NULL,2,'2013-11-19 20:36:54'),(74,'admin',53,'nurse','Nővér',NULL,0,1,NULL,NULL,NULL,NULL),(75,'admin',53,'bannerMaximum','Banner',NULL,0,1,NULL,NULL,NULL,NULL),(76,'admin',53,'marqueeMaximum','Fényújság',NULL,0,1,NULL,NULL,NULL,NULL),(77,'admin',53,'statusName','Állapot',NULL,0,1,NULL,NULL,NULL,NULL),(78,'admin',53,'sealNumberEmpty','Üres Pecsétszám!',NULL,0,1,NULL,NULL,NULL,NULL),(79,'admin',53,'licenceEmpty','Üres Liszensz!',NULL,0,1,NULL,NULL,NULL,NULL),(80,'admin',60,'nocore_clinicID','Rendelő',NULL,0,1,NULL,NULL,NULL,NULL),(81,'admin',60,'nocore_clinicIDEmpty','Üres Rendelő!',NULL,0,1,NULL,NULL,NULL,NULL),(82,'admin',50,'sealNumber','Orvos',NULL,0,1,NULL,NULL,NULL,NULL),(83,'admin',10,'nocore_statusIDEmpty','Üres állapot!',NULL,0,1,NULL,NULL,2,'2013-11-19 20:15:33'),(84,'admin',20,'fgcolor','Előtérszín',NULL,0,1,NULL,NULL,NULL,NULL),(85,'admin',20,'bgcolor','Háttérszín',NULL,0,1,NULL,NULL,NULL,NULL),(86,'admin',20,'path','Útvonal','',0,1,NULL,NULL,NULL,NULL),(87,'admin',17,'title','Megnevezés',NULL,0,1,NULL,NULL,NULL,NULL),(88,'admin',17,'tplName','Template',NULL,0,1,NULL,NULL,NULL,NULL),(89,'admin',17,'titleEmpty','Üres Megnevezés!',NULL,0,1,NULL,NULL,NULL,NULL),(90,'admin',3,'name','Csoport',NULL,0,1,NULL,NULL,NULL,NULL),(91,'admin',3,'actionCount','User',NULL,0,1,NULL,NULL,NULL,NULL),(92,'admin',10,'rightsCount','Jog',NULL,0,1,NULL,NULL,2,'2013-11-19 20:21:09'),(93,'admin',3,'nameEmpty','Üres Csoport',NULL,0,1,NULL,NULL,NULL,NULL),(94,'admin',10,'core_groupsID','Csoport',NULL,0,1,NULL,NULL,2,'2013-11-19 20:35:33'),(95,'admin',10,'core_groupsIDEmpty','Üres Csoport!',NULL,0,1,NULL,NULL,2,'2013-11-19 20:35:41'),(96,'admin',61,'core_supportID','Támogatás',NULL,0,1,NULL,NULL,NULL,NULL),(97,'admin',61,'downloadURL','Melléklet',NULL,0,1,NULL,NULL,NULL,NULL),(98,'admin',61,'core_supportIDEmpty','Üres támogatás!',NULL,0,1,NULL,NULL,NULL,NULL),(99,'admin',1,'core_userstitleID','Titulus',NULL,0,1,NULL,NULL,NULL,NULL),(100,'admin',1,'surname','Vezetéknév',NULL,0,1,NULL,NULL,NULL,NULL),(101,'admin',1,'forename','Keresztnév','',0,1,NULL,NULL,NULL,NULL),(102,'admin',1,'nickname','Becenév',NULL,0,1,NULL,NULL,NULL,NULL),(103,'admin',1,'password','Jelszó',NULL,0,1,NULL,NULL,NULL,NULL),(104,'admin',1,'password2','Jelszó megerősítés',NULL,0,1,NULL,NULL,NULL,NULL),(105,'admin',1,'oldpassword','Régi jelszó',NULL,0,1,NULL,NULL,NULL,NULL),(106,'admin',1,'pictureURL','Kép',NULL,0,1,NULL,NULL,NULL,NULL),(107,'admin',1,'activationWhen','Aktiválva',NULL,0,1,NULL,NULL,NULL,NULL),(108,'admin',1,'newsletter','Hirlevél',NULL,0,1,NULL,NULL,NULL,NULL),(109,'admin',1,'myData','Adataim',NULL,0,1,NULL,NULL,NULL,NULL),(110,'admin',10,'passchange','Jelszóváltás',NULL,0,1,NULL,NULL,2,'2013-10-02 10:37:49'),(111,'admin',1,'registration','Regisztráció',NULL,0,1,NULL,NULL,NULL,NULL),(112,'admin',1,'nicknameEmpty','Üres Becenév!',NULL,0,1,NULL,NULL,NULL,NULL),(113,'admin',1,'passwordEmpty','Üres Jelszó!',NULL,0,1,NULL,NULL,NULL,NULL),(114,'admin',1,'password2Empty','Üres Jelszó megerősítés!',NULL,0,1,NULL,NULL,NULL,NULL),(115,'admin',1,'passwordPassword','Hibás jelszó megerősítés!',NULL,0,1,NULL,NULL,NULL,NULL),(116,'admin',1,'passwordOldEmpty','Üres Régi jelszó!',NULL,0,1,NULL,NULL,NULL,NULL),(117,'admin',1,'surnameEmpty','Üres Vezetéknév!',NULL,0,1,NULL,NULL,NULL,NULL),(118,'admin',1,'forenameEmpty','Üres Keresznév!',NULL,0,1,NULL,NULL,NULL,NULL),(119,'admin',10,'emailEmpty','Üres Email!',NULL,0,1,NULL,NULL,2,'2013-11-19 20:01:36'),(120,'admin',10,'emailDuplicate','Már van ilyen Email!',NULL,0,1,NULL,NULL,2,'2013-11-19 20:01:56'),(121,'admin',1,'notFoundUser','Nem létező Rövidnév/Jelszó!',NULL,0,1,NULL,NULL,NULL,NULL),(122,'admin',10,'systemType','Rendszertípus',NULL,NULL,1,2,'2013-09-05 22:40:41',2,'2013-11-20 09:31:26'),(123,'admin',10,'fieldType','Típus',NULL,NULL,1,2,'2013-09-05 22:41:35',2,'2013-11-19 20:03:32'),(124,'admin',10,'fieldName','Megnevezés',NULL,NULL,1,2,'2013-09-05 22:41:59',2,'2013-11-19 20:02:54'),(125,'admin',10,'fieldValue','Érték',NULL,NULL,1,2,'2013-09-05 22:42:18',2,'2013-11-19 20:04:14'),(126,'admin',10,'autoload','Autobetöltés',NULL,NULL,1,2,'2013-09-05 22:43:07',2,'2013-11-19 19:51:40'),(127,'admin',10,'systemTypeEmpty','Üres Rendszertípus!',NULL,NULL,1,2,'2013-09-05 22:43:39',2,'2013-11-20 09:31:16'),(128,'admin',10,'fieldTypeEmpty','Üres Típus!',NULL,NULL,1,2,'2013-09-05 22:44:46',2,'2013-11-19 20:03:18'),(129,'admin',10,'fieldNameEmpty','Üres Megnevezés!',NULL,NULL,1,2,'2013-09-05 22:46:17',2,'2013-11-19 20:02:37'),(130,'admin',10,'fieldValueEmpty','Üres Érték!',NULL,NULL,1,2,'2013-09-05 22:46:41',2,'2013-11-19 20:04:03'),(131,'admin',22,'actionCount','Intézkedés',NULL,NULL,1,2,'2013-09-05 22:51:31',NULL,NULL),(132,'admin',22,'core_support_topicID','Téma',NULL,NULL,1,2,'2013-09-05 22:51:59',NULL,NULL),(133,'admin',22,'core_support_typeID','Típus',NULL,NULL,1,2,'2013-09-05 22:52:21',NULL,NULL),(134,'admin',22,'core_support_statusID','Állapot',NULL,NULL,1,2,'2013-09-05 22:52:42',NULL,NULL),(135,'admin',22,'planTime','Tervezett idő',NULL,NULL,1,2,'2013-09-05 22:53:06',NULL,NULL),(136,'admin',22,'realTime','Valós idő',NULL,NULL,1,2,'2013-09-05 22:53:26',NULL,NULL),(137,'admin',22,'comment','Megjegyzés',NULL,NULL,1,2,'2013-09-05 22:55:35',NULL,NULL),(138,'admin',22,'insertUserID','Rögzítő',NULL,NULL,1,2,'2013-09-05 22:56:01',NULL,NULL),(139,'admin',10,'nameEmpty','Üres Megnevezés!',NULL,NULL,1,2,'2013-09-05 22:56:31',2,'2013-11-19 20:50:32'),(140,'admin',22,'core_support_topicIDEmpty','Üres Téma!',NULL,NULL,1,2,'2013-09-05 22:57:05',NULL,NULL),(141,'admin',22,'core_support_statusIDEmpty','Üres Állapot!',NULL,NULL,1,2,'2013-09-05 22:57:32',NULL,NULL),(142,'admin',38,'insertName','Kitől',NULL,NULL,1,2,'2013-09-05 23:24:50',NULL,NULL),(143,'admin',38,'targetUserID','Kinek',NULL,NULL,1,2,'2013-09-05 23:25:14',2,'2013-10-07 16:06:10'),(144,'admin',38,'targetGroupID','Kiknek',NULL,NULL,1,2,'2013-09-05 23:25:44',NULL,NULL),(145,'admin',38,'subject','Tárgy',NULL,NULL,1,2,'2013-09-05 23:26:24',NULL,NULL),(146,'admin',10,'actionCount','Mennyiség',NULL,NULL,1,2,'2013-11-19 19:44:58',NULL,NULL),(147,'admin',38,'readWhen','Olvasva',NULL,NULL,1,2,'2013-09-05 23:27:12',NULL,NULL),(148,'admin',38,'copy','Válasz',NULL,NULL,1,2,'2013-09-05 23:27:37',NULL,NULL),(149,'admin',38,'answer','Válasz erre',NULL,NULL,1,2,'2013-09-05 23:27:55',NULL,NULL),(150,'admin',38,'subjectEmpty','Üres Tárgy!',NULL,NULL,1,2,'2013-09-05 23:28:23',NULL,NULL),(151,'admin',10,'viewButtonText','Megtekintés',NULL,1,1,2,'2013-09-10 12:31:44',2,'2013-09-10 12:48:34'),(152,'frontend',10,'labelWaitNurse','NŐVÉR:',NULL,1,1,2,'2013-09-10 15:54:02',2,'2013-09-19 15:08:43'),(153,'admin',10,'deleteGroup','Törlés',NULL,NULL,1,2,'2013-09-16 14:41:19',2,'2013-10-08 13:06:52'),(154,'admin',10,'topMessage','//A Honlap feltőltése folyamatban ezért 1-2 funkció még nem működik.',NULL,1,1,2,'2013-09-23 15:24:00',2,'2013-09-23 15:36:21'),(155,'admin',10,'list','List',NULL,NULL,1,2,'2013-09-23 15:48:57',NULL,NULL),(156,'admin',10,'add','Felvitel',NULL,NULL,1,2,'2013-09-23 15:49:28',2,'2016-03-04 09:05:11'),(157,'admin',10,'copy','Másolás',NULL,NULL,1,2,'2013-09-23 15:55:32',NULL,NULL),(158,'admin',10,'edit','Módosítás',NULL,NULL,1,2,'2013-09-23 15:58:07',NULL,NULL),(159,'admin',10,'view','Megtekintés',NULL,NULL,1,2,'2013-09-23 15:59:04',NULL,NULL),(160,'admin',10,'delete','Törlés',NULL,NULL,1,2,'2013-09-23 16:00:40',NULL,NULL),(161,'admin',10,'first','Első',NULL,NULL,1,2,'2013-09-23 16:02:21',2,'2013-09-23 16:04:13'),(162,'admin',10,'prev','Elöző oldal',NULL,NULL,1,2,'2013-09-23 16:05:21',NULL,NULL),(163,'admin',10,'prevItem','Elöző tétel',NULL,NULL,1,2,'2013-09-23 16:05:34',NULL,NULL),(164,'admin',10,'next','Következő oldal',NULL,NULL,1,2,'2013-09-23 16:07:58',NULL,NULL),(165,'admin',10,'nextItem','Következő tétel',NULL,NULL,1,2,'2013-09-23 16:08:12',NULL,NULL),(166,'admin',10,'last','Utolsó',NULL,NULL,1,2,'2013-09-23 16:09:14',NULL,NULL),(167,'admin',10,'layoutfull','Teljes',NULL,NULL,1,2,'2013-09-23 16:10:10',NULL,NULL),(168,'admin',10,'layoutmini','Behívó',NULL,NULL,1,2,'2013-09-23 16:10:32',NULL,NULL),(169,'admin',10,'layoutsetup','Beállítások',NULL,NULL,1,2,'2013-09-23 16:10:54',NULL,NULL),(170,'admin',10,'search','Keresés',NULL,NULL,1,2,'2013-09-23 16:12:03',NULL,NULL),(171,'admin',10,'searchOff','Összes',NULL,NULL,1,2,'2013-09-23 16:14:28',NULL,NULL),(172,'admin',10,'yes','Igen',NULL,NULL,1,2,'2013-09-23 16:15:25',NULL,NULL),(173,'admin',10,'no','Nem',NULL,NULL,1,2,'2013-09-23 16:15:37',NULL,NULL),(174,'admin',10,'save','Mentés',NULL,NULL,1,2,'2013-09-23 16:17:50',NULL,NULL),(175,'admin',10,'saveNoBack','Mentés és maradok',NULL,NULL,1,2,'2013-09-23 16:18:17',NULL,NULL),(176,'admin',10,'back','Vissza',NULL,NULL,1,2,'2013-09-23 16:18:45',NULL,NULL),(177,'admin',10,'noRecord','Nincs találat!',NULL,NULL,1,2,'2013-09-23 16:22:27',NULL,NULL),(178,'admin',10,'noRights','Nincs jogosultság!',NULL,NULL,1,2,'2013-09-23 16:23:52',NULL,NULL),(179,'admin',10,'order','Rendezettség',NULL,NULL,1,2,'2013-09-23 16:24:29',NULL,NULL),(180,'admin',10,'logout','Kijelentkezés',NULL,NULL,1,2,'2013-09-23 16:25:38',NULL,NULL),(181,'admin',10,'description','Leírás',NULL,NULL,1,2,'2013-09-23 16:26:17',NULL,NULL),(182,'admin',10,'item','Tétel',NULL,NULL,1,2,'2013-09-23 20:38:58',NULL,NULL),(183,'admin',10,'page','Oldal',NULL,NULL,1,2,'2013-09-23 20:39:58',NULL,NULL),(184,'admin',10,'myDataChange','Adataim',NULL,NULL,1,2,'2013-09-23 20:41:53',NULL,NULL),(185,'admin',10,'passwordChange','Jelszóváltás',NULL,NULL,1,2,'2013-09-23 20:42:39',NULL,NULL),(186,'admin',10,'zoomin','Kicsi',NULL,NULL,1,2,'2013-09-23 20:47:40',2,'2013-10-04 08:58:10'),(187,'admin',10,'zoomout','Nagy',NULL,NULL,1,2,'2013-09-23 20:49:22',NULL,NULL),(188,'admin',10,'zoomClose','Bezárás',NULL,NULL,1,2,'2013-09-23 20:49:42',NULL,NULL),(189,'admin',10,'itemSelect','----',NULL,NULL,1,2,'2013-09-23 21:04:30',NULL,NULL),(190,'admin',10,'insertWhen','Rögzítve',NULL,NULL,1,2,'2013-09-23 21:11:15',NULL,NULL),(191,'admin',10,'newItem','Új tétel',NULL,NULL,1,2,'2013-09-23 21:13:35',NULL,NULL),(192,'admin',10,'topLogo','//Backend',NULL,NULL,1,2,'2013-09-23 21:23:13',2,'2013-09-23 21:29:03'),(193,'admin',10,'sec','másodperc',NULL,NULL,1,2,'2013-09-23 21:24:47',2,'2013-09-23 21:43:09'),(194,'admin',10,'system','Zbads Admin 1.0',NULL,NULL,1,2,'2013-09-23 22:23:12',2,'2016-05-03 17:33:57'),(195,'admin',55,'sequenceId','Sorrend',NULL,NULL,1,2,'2013-09-24 09:41:18',NULL,NULL),(196,'admin',10,'core_advert_advertiserID','Hírdető',NULL,NULL,1,2,'2013-09-24 12:57:12',2,'2013-11-19 19:54:57'),(197,'admin',10,'core_advert_zoneID','Zóna',NULL,NULL,1,2,'2013-09-24 12:59:14',2,'2013-11-19 19:56:22'),(198,'admin',10,'activateWhen','Mettől',NULL,NULL,1,2,'2013-09-24 12:59:45',2,'2013-11-19 19:49:55'),(199,'admin',10,'deactivateWhen','Meddig',NULL,NULL,1,2,'2013-09-24 12:59:58',2,'2013-11-19 19:50:07'),(200,'admin',10,'playMaxNum','Maximális lejátszás',NULL,NULL,1,2,'2013-09-24 13:01:06',2,'2013-11-19 20:19:24'),(201,'admin',10,'playCounter','Lejátszott',NULL,NULL,1,2,'2013-09-24 13:01:25',2,'2013-11-19 20:18:53'),(202,'admin',10,'clickMaxNum','Maximális klikkelés',NULL,NULL,1,2,'2013-09-24 13:01:49',2,'2013-11-19 19:54:01'),(203,'admin',10,'clickCounter','Klikkeltek',NULL,NULL,1,2,'2013-09-24 13:02:12',2,'2013-11-19 19:53:18'),(204,'admin',10,'priceMax','Maximálisan költhető',NULL,NULL,1,2,'2013-09-24 13:02:38',2,'2013-11-19 20:20:28'),(205,'admin',10,'priceActual','Elköltött',NULL,NULL,1,2,'2013-09-24 13:02:57',2,'2013-11-19 20:20:05'),(206,'admin',10,'address','Utca, házszám',NULL,NULL,1,2,'2013-09-24 13:59:15',2,'2013-11-19 20:34:36'),(207,'admin',13,'contactName','Kapcsolattartó',NULL,NULL,1,2,'2013-09-24 13:59:35',NULL,NULL),(208,'admin',13,'phone','Telefon',NULL,NULL,1,2,'2013-09-24 13:59:49',NULL,NULL),(209,'admin',13,'fax','Fax',NULL,NULL,1,2,'2013-09-24 14:00:01',2,'2013-09-24 14:00:10'),(210,'admin',13,'mobile','Mobil',NULL,NULL,1,2,'2013-09-24 14:00:25',NULL,NULL),(211,'admin',10,'email','Email',NULL,NULL,1,2,'2013-09-24 14:00:40',2,'2013-11-19 20:01:18'),(212,'admin',13,'website','Weboldal',NULL,NULL,1,2,'2013-09-24 14:00:55',NULL,NULL),(213,'admin',10,'nameDuplicate','Már van ilyen!',NULL,NULL,1,2,'2013-09-24 12:56:20',2,'2013-11-19 20:13:03'),(214,'admin',10,'advertFileName','Kép',NULL,NULL,1,2,'2013-09-24 14:17:35',NULL,NULL),(215,'admin',6,'textValue','Szöveges tartalom',NULL,NULL,1,2,'2013-09-24 14:18:08',NULL,NULL),(216,'admin',6,'jumpURL','Link',NULL,NULL,1,2,'2013-09-24 14:18:24',NULL,NULL),(217,'admin',6,'core_advert_groupID','Reklám csoport',NULL,NULL,1,2,'2013-09-24 14:19:29',NULL,NULL),(218,'admin',6,'core_advert_campaignID','Kampány',NULL,NULL,1,2,'2013-09-24 14:19:51',NULL,NULL),(219,'admin',6,'core_advert_sizeID','Méret',NULL,NULL,1,2,'2013-09-24 14:20:06',NULL,NULL),(220,'admin',6,'core_advert_sourceID','Forrás',NULL,NULL,1,2,'2013-09-24 14:20:22',NULL,NULL),(221,'admin',10,'sizeWidth','Szélesség',NULL,NULL,1,2,'2013-09-24 14:20:42',2,'2013-11-19 20:23:02'),(222,'admin',10,'sizeHeight','Magasság',NULL,NULL,1,2,'2013-09-24 14:20:57',2,'2013-11-19 20:22:45'),(223,'admin',6,'changeTime','Csere idő',NULL,NULL,1,2,'2013-09-24 14:21:20',2,'2013-11-05 09:22:53'),(224,'admin',10,'core_configsIDEmpty','Üres Modul!',NULL,NULL,1,2,'2013-09-24 14:28:51',2,'2013-11-19 19:57:16'),(225,'admin',2,'core_usersIDEmpty','Üres Felhasználó!',NULL,NULL,1,2,'2013-09-24 14:29:23',NULL,NULL),(226,'admin',2,'core_usersID','Felhasználó',NULL,NULL,1,2,'2013-09-24 14:29:53',2,'2013-09-24 14:30:40'),(227,'admin',10,'import','Import',NULL,1,1,2,'2013-09-30 10:48:03',NULL,NULL),(228,'admin',10,'fileNameEmpty','Üres Fájlnév!',NULL,NULL,1,2,'2013-09-30 11:03:52',2,'2013-11-20 08:46:27'),(229,'admin',83,'importOK','Adatok importja sikeres!',NULL,NULL,1,2,'2013-09-30 15:18:45',2,'2013-09-30 15:19:15'),(230,'admin',83,'importBAD','Adatok importja sikertelen!',NULL,NULL,1,2,'2013-09-30 15:58:52',NULL,NULL),(231,'admin',10,'fileName','Fájlnév',NULL,NULL,1,2,'2013-10-01 08:53:24',2,'2013-11-20 08:46:12'),(232,'admin',10,'core_configsID','Modul',NULL,NULL,1,2,'2013-10-01 08:55:02',2,'2013-11-19 19:57:02'),(233,'admin',10,'mydata','Adataim',NULL,NULL,1,2,'2013-10-02 08:36:01',2,'2013-10-02 08:38:17'),(234,'admin',1,'oldpasswordEmpty','Üres Régi jelszó!',NULL,NULL,1,2,'2013-10-02 09:45:25',NULL,NULL),(235,'admin',1,'oldpasswordBad','Hibás Régi jelszó!',NULL,NULL,1,2,'2013-10-02 10:28:58',NULL,NULL),(236,'admin',10,'nocore_doctorID','Orvos',NULL,1,1,2,'2013-11-19 19:35:40',NULL,NULL),(237,'admin',10,'pdf','PDF',NULL,NULL,1,2,'2013-10-09 12:27:31',NULL,NULL),(238,'admin',10,'calendarToday','Ma',NULL,NULL,1,2,'2013-10-14 15:43:12',NULL,NULL),(239,'admin',10,'nocore_patientID','Beteg',NULL,NULL,1,2,'2013-10-15 13:21:22',2,'2013-11-19 20:18:02'),(240,'admin',75,'startWhen','Mettől',NULL,NULL,1,2,'2013-10-15 13:21:55',NULL,NULL),(241,'admin',75,'stopWhen','Meddig',NULL,NULL,1,2,'2013-10-15 13:22:44',NULL,NULL),(242,'admin',10,'nocore_doctorIDEmpty','Üres Orvos!',NULL,NULL,1,2,'2013-11-19 19:35:27',NULL,NULL),(243,'admin',10,'week','Hét',NULL,NULL,1,2,'2013-10-15 14:03:51',NULL,NULL),(244,'admin',75,'nocore_reservation_typeID','Típus',NULL,NULL,1,2,'2013-10-16 09:15:46',2,'2014-02-26 13:50:02'),(245,'admin',10,'id','Azonosító',NULL,NULL,1,2,'2013-10-16 09:22:28',2,'2013-11-19 20:06:41'),(246,'admin',83,'productId','Cikkszám',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(247,'admin',75,'title','Bejegyzés',NULL,NULL,1,2,'2013-10-16 13:09:43',2,'2013-10-16 13:13:08'),(248,'admin',10,'startDate','Mettől',NULL,NULL,1,2,'2013-10-17 08:32:02',2,'2014-02-06 08:58:36'),(249,'admin',10,'zipcode','Irányítőszám',NULL,NULL,1,2,'2013-10-21 12:07:09',2,'2013-11-19 20:25:47'),(250,'admin',10,'settlement','Település',NULL,NULL,1,2,'2013-10-21 12:07:34',2,'2013-11-19 20:22:08'),(251,'admin',53,'phone','Telefon',NULL,NULL,1,2,'2013-10-21 12:08:39',NULL,NULL),(252,'admin',10,'core_localserverIDEmpty','Üres Szerver!',NULL,NULL,1,2,'2013-11-04 20:57:08',NULL,NULL),(253,'admin',10,'min','perc',NULL,NULL,1,2,'2013-11-04 20:57:08',NULL,NULL),(254,'admin',10,'dateViewFormat','(éé-hh-nn)',NULL,NULL,1,2,'2013-11-05 08:37:40',NULL,NULL),(255,'admin',10,'piece','darab',NULL,NULL,1,2,'2013-11-05 08:40:04',NULL,NULL),(256,'admin',10,'timeViewFormat','(óó:pp:mm)',NULL,NULL,1,2,'2013-11-05 08:45:04',2,'2013-11-05 08:46:30'),(257,'admin',10,'weekly','Hét',NULL,NULL,1,2,'2013-11-06 10:36:03',2,'2014-01-27 11:45:04'),(258,'admin',10,'daily','Nap',NULL,NULL,1,2,'2013-11-06 10:36:58',2,'2014-01-27 11:44:43'),(259,'admin',53,'patientTime','Páciens/Idő',NULL,NULL,1,2,'2013-11-11 11:38:43',2,'2013-11-11 11:41:03'),(260,'admin',53,'alwaysView','Midig látható',NULL,NULL,1,2,'2013-11-19 08:55:16',NULL,NULL),(261,'admin',10,'core_localserverID','Szerver',NULL,NULL,1,2,'2013-11-19 15:57:43',NULL,NULL),(262,'admin',10,'monthly','Hónap',NULL,NULL,1,2,'2014-01-10 10:40:23',2,'2014-01-27 11:45:43'),(263,'admin',10,'journal','Napló',NULL,NULL,1,2,'2014-01-27 11:46:03',NULL,NULL),(264,'admin',10,'journal','Napló',NULL,NULL,1,2,'2014-01-27 11:46:03',NULL,NULL),(265,'admin',75,'startDateTime','Mettől',NULL,NULL,1,2,'2014-02-06 08:55:28',NULL,NULL),(266,'admin',75,'stopDateTime','Meddig',NULL,NULL,1,2,'2014-02-06 08:55:44',NULL,NULL),(267,'admin',56,'patientIDEmpty','Üres Páciens!',NULL,NULL,1,2,'2014-02-06 13:05:15',2,'2014-02-24 14:48:20'),(268,'admin',75,'nocore_patientIDEmpty','Üres Páciens!',NULL,NULL,1,2,'2014-02-06 13:05:15',NULL,NULL),(269,'admin',57,'startTimeReserve','Előjegyzés mettől',NULL,NULL,1,2,'2014-02-10 19:54:02',NULL,NULL),(270,'admin',57,'stopTimeReserve','Előjegyzés meddig',NULL,NULL,1,2,'2014-02-10 19:54:29',NULL,NULL),(271,'admin',10,'deleteReally','Valóban törlöd?',NULL,1,1,2,'2014-02-16 18:58:12',2,'2016-03-04 09:06:01'),(272,'admin',10,'day','nap',NULL,NULL,1,2,'2014-02-16 21:20:44',NULL,NULL),(273,'admin',53,'reserveDayMin','Előjegyzés Min',NULL,NULL,1,2,'2014-02-16 21:21:34',NULL,NULL),(274,'admin',53,'reserveDayMax','Előjegyzés Max',NULL,NULL,1,2,'2014-02-16 21:21:46',NULL,NULL),(275,'admin',56,'nocore_doctor_card_typeID','Kártya típus',NULL,NULL,1,2,'2014-02-24 13:38:15',NULL,NULL),(276,'admin',56,'nocore_doctor_card_typeIDEmpty','Üres kártya típus',NULL,NULL,1,2,'2014-02-24 13:38:15',2,'2014-02-24 13:43:38'),(277,'admin',NULL,'nocore_patient_statusID','Státusz',NULL,NULL,1,2,'2014-03-13 15:20:33',2,'2014-03-13 15:20:58'),(278,'admin',83,'name','Termék név',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(279,'admin',83,'descriptionPublic','Megjegyzés',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(280,'admin',83,'descriptionPrivate','Belső megjegyzés',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(281,'admin',83,'storageWhere','Tárhely',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(282,'admin',83,'quantity','Mennyiség',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(283,'admin',83,'updateWhen','Frissítve',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(284,'admin',83,'price','Átadási ár',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(285,'admin',83,'makeWho','Gyártmány',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(286,'admin',83,'makeType','Típus',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(287,'admin',83,'products_statusID','Állapot',NULL,NULL,1,2,'2013-11-19 20:48:14',NULL,NULL),(288,'admin',83,'products_statusID','Állapot',NULL,NULL,1,2,'2016-10-03 21:11:43',NULL,NULL),(289,'admin',84,'name','Megnevezés',NULL,NULL,1,2,'2016-10-03 22:59:08',NULL,NULL),(290,'admin',1,'firmName','Cég',NULL,NULL,1,2,'2016-10-04 07:06:06',NULL,NULL),(291,'admin',1,'address','Cím',NULL,NULL,1,2,'2016-10-04 07:06:24',NULL,NULL),(292,'admin',1,'contactName','Kapcsolattartó név',NULL,NULL,1,2,'2016-10-04 07:07:43',NULL,NULL),(293,'admin',1,'contactPhone','Kapcsolattartó telefon',NULL,NULL,1,2,'2016-10-04 07:08:03',NULL,NULL),(295,'admin',83,'productIdEmpty','Üres Cikkszám!',NULL,NULL,1,2,'2016-10-04 07:28:01',NULL,NULL),(296,'admin',83,'nameEmpty','Üres Megnevezés!',NULL,NULL,1,2,'2016-10-04 07:28:42',NULL,NULL),(297,'admin',83,'products_statusIDEmpty','Üres Állapot!',NULL,NULL,1,2,'2016-10-04 07:29:17',NULL,NULL),(298,'admin',1,'nameEmpty','Üres Név!',NULL,NULL,1,2,'2016-10-04 07:47:59',NULL,NULL),(299,'admin',1,'addressEmpty','Üres Cím!',NULL,NULL,1,2,'2016-10-04 07:48:18',NULL,NULL),(300,'admin',1,'contactNameEmpty','Üres Kapcsolattartó Név!',NULL,NULL,1,2,'2016-10-04 07:49:26',NULL,NULL),(301,'admin',89,'makeYearEmoty','Üres Megjelenés!',NULL,NULL,1,2,'2016-10-04 07:49:48',NULL,NULL),(304,'admin',NULL,'core_usersID','Cég',NULL,NULL,1,2,'2016-10-04 08:03:58',NULL,NULL),(305,'admin',83,'own','Saját',NULL,NULL,1,2,'2016-11-13 23:26:18',NULL,NULL),(306,'admin',88,'name','Kategória',NULL,NULL,1,2,'2017-04-16 19:25:53',NULL,NULL),(307,'admin',87,'name','Név',NULL,NULL,1,2,'2017-04-16 19:29:35',NULL,NULL),(308,'admin',87,'recipetopicID','Kategória',NULL,NULL,1,2,'2017-04-16 19:30:18',NULL,NULL),(309,'admin',87,'recipetopicName','Kategória',NULL,NULL,1,2,'2017-04-16 19:31:36',NULL,NULL),(310,'admin',10,'insertUserID','Rögzítő',NULL,NULL,1,2,'2017-04-16 19:45:39',NULL,NULL),(311,'admin',72,'core_configsID','Modul',NULL,NULL,1,2,'2017-04-21 08:16:23',NULL,NULL),(312,'admin',17,'name','Modul',NULL,NULL,1,2,'2017-04-21 08:44:37',NULL,NULL),(313,'admin',87,'ingrediens','Hozzávalók',NULL,NULL,1,2,'2017-04-21 09:37:25',NULL,NULL),(314,'admin',87,'making','Elkészítés',NULL,NULL,1,2,'2017-04-21 09:49:22',NULL,NULL),(315,'admin',10,'comment','Megjegyzés',NULL,NULL,1,2,'2017-04-21 10:03:42',NULL,NULL),(316,'admin',89,'name','Cím',NULL,NULL,1,2,'2017-04-26 22:42:05',NULL,NULL),(317,'admin',89,'makeYear','Mikor',NULL,NULL,1,2,'2017-04-26 22:42:41',NULL,NULL),(318,'admin',89,'rateNumber','Pont',NULL,NULL,1,2,'2017-04-26 22:43:09',NULL,NULL),(319,'admin',89,'story','Történet',NULL,NULL,1,2,'2017-04-27 12:34:49',NULL,NULL),(320,'admin',89,'watchWhen','Megtekintve',NULL,NULL,1,2,'2017-04-27 22:38:43',NULL,NULL),(321,'admin',7,'name','Titulus',NULL,NULL,1,2,'2017-04-28 06:51:59',NULL,NULL),(322,'admin',90,'name','Megnevezés',NULL,NULL,1,2,'2017-04-28 23:27:06',NULL,NULL),(323,'admin',90,'bgcolor','Háttér',NULL,NULL,1,2,'2017-04-28 23:27:57',NULL,NULL),(324,'admin',90,'fgcolor','Előtér',NULL,NULL,1,2,'2017-04-28 23:28:10',NULL,NULL),(325,'admin',90,'path','Útvonal',NULL,NULL,1,2,'2017-04-28 23:30:06',NULL,NULL),(326,'admin',92,'name','Kategória',NULL,NULL,1,2,'2017-04-29 14:32:09',NULL,NULL),(327,'admin',91,'training_topicID','Kategória',NULL,NULL,1,2,'2017-04-29 14:33:23',NULL,NULL),(328,'admin',91,'training_topicName','Kategória',NULL,NULL,1,2,'2017-04-29 14:33:44',NULL,NULL),(329,'admin',91,'runTime','Idő',NULL,NULL,1,2,'2017-04-29 14:35:07',NULL,NULL),(330,'admin',91,'distance','Táv',NULL,NULL,1,2,'2017-04-29 14:35:24',NULL,NULL),(331,'admin',91,'kcal','Kalória',NULL,NULL,1,2,'2017-04-29 14:35:40',NULL,NULL),(332,'admin',89,'makeYearEmpty','Üres Megjelenés!',NULL,NULL,1,2,'2017-04-29 15:28:49',NULL,NULL),(333,'admin',89,'storyEmpty','Üres Történet!',NULL,NULL,1,2,'2017-04-29 15:29:28',NULL,NULL),(334,'admin',91,'runTimeEmpty','Üres Idő!',NULL,NULL,1,2,'2017-04-29 15:30:37',NULL,NULL),(335,'admin',91,'distanceEmpty','Üres Táv!',NULL,NULL,1,2,'2017-04-29 15:31:01',NULL,NULL),(336,'admin',91,'kcalEmpty','Üres Kalória!',NULL,NULL,1,2,'2017-04-29 15:31:25',NULL,NULL),(337,'admin',91,'training_topicIDEmpty','Üres Kategória!',NULL,NULL,1,2,'2017-04-29 15:32:34',NULL,NULL),(338,'admin',87,'recipetopicIDEmpty','Üres Kategória!',NULL,NULL,1,2,'2017-04-29 15:35:52',NULL,NULL),(339,'admin',10,'nameDuplicate','Van mér ilyen tétel!',NULL,NULL,1,2,'2017-04-29 15:37:04',NULL,NULL),(340,'admin',95,'name','Kategória',NULL,NULL,1,2,'2017-04-29 18:17:08',NULL,NULL),(341,'admin',94,'medicine_topicID','Kategória',NULL,NULL,1,2,'2017-04-29 18:18:09',NULL,NULL),(342,'admin',94,'medicine_topicName','Kategória',NULL,NULL,1,2,'2017-04-29 18:18:25',NULL,NULL),(343,'admin',94,'quantity','Mennyiség',NULL,NULL,1,2,'2017-04-29 18:47:49',NULL,NULL),(344,'admin',94,'quantityEmpty','Üres Mennyiség!',NULL,NULL,1,2,'2017-04-29 18:48:19',NULL,NULL),(345,'admin',94,'medicine_topicIDEmpty','Üres Kategória!',NULL,NULL,1,2,'2017-04-29 18:48:52',NULL,NULL),(346,'admin',96,'name','Megnevezés',NULL,NULL,1,2,'2017-04-29 19:27:33',NULL,NULL),(347,'admin',96,'systole','Systole',NULL,NULL,1,2,'2017-04-29 19:28:02',NULL,NULL),(348,'admin',96,'asystole','Asystole',NULL,NULL,1,2,'2017-04-29 19:28:23',NULL,NULL),(349,'admin',96,'pulse','Pulzus',NULL,NULL,1,2,'2017-04-29 19:28:40',NULL,NULL),(350,'admin',96,'systoleEmpty','Üres Systole!',NULL,NULL,1,2,'2017-04-29 19:31:08',NULL,NULL),(351,'admin',96,'asystoleEmpty','Üres Asystole!',NULL,NULL,1,2,'2017-04-29 19:31:17',NULL,NULL),(352,'admin',96,'pulseEmpty','Üres Pulzus!',NULL,NULL,1,2,'2017-04-29 19:31:36',NULL,NULL),(353,'admin',91,'name','Név',NULL,NULL,1,2,'2020-08-14 15:57:03',NULL,NULL),(354,'admin',99,'name','Kategória',NULL,NULL,1,2,'2021-12-15 10:00:46',NULL,NULL),(355,'admin',100,'infotopicIDEmpty','Üres Kategória!',NULL,NULL,1,2,'2021-12-15 12:43:03',NULL,NULL),(356,'admin',100,'infotopicName','Kategória',NULL,NULL,1,2,'2021-12-15 12:43:30',NULL,NULL),(357,'admin',100,'infotopicID','Kategória',NULL,NULL,1,2,'2021-12-15 12:43:47',NULL,NULL),(358,'admin',100,'name','Megnevezés',NULL,NULL,1,2,'2021-12-15 12:45:04',NULL,NULL),(359,'admin',100,'shortDescription','Rövid leírés',NULL,NULL,1,2,'2021-12-15 12:46:02',NULL,NULL),(360,'admin',100,'status','Állapot',NULL,NULL,1,2,'2021-12-15 12:46:48',NULL,NULL),(361,'admin',10,'home','Főoldal',NULL,NULL,1,2,'2024-05-12 13:32:27',NULL,NULL),(362,'admin',101,'name','Megnevezés',NULL,NULL,1,2,'2024-05-22 15:48:57',NULL,NULL),(363,'admin',101,'wwwAddress','Cím',NULL,NULL,1,2,'2024-05-22 16:33:07',NULL,NULL),(364,'admin',101,'lang','Nyelv',NULL,NULL,1,2,'2024-05-22 17:48:16',NULL,NULL),(365,'admin',101,'langID','Nyelv',NULL,NULL,1,2,'2024-05-22 18:05:59',NULL,NULL),(366,'admin',103,'name','Megnevezés',NULL,NULL,1,2,'2024-05-22 21:04:42',NULL,NULL),(367,'admin',103,'contactName','Kapcsolatartó',NULL,NULL,1,2,'2024-05-22 22:00:51',NULL,NULL),(368,'admin',103,'phone','Telefon',NULL,NULL,1,2,'2024-05-22 22:01:42',NULL,NULL),(369,'admin',103,'fax','Fax',NULL,NULL,1,2,'2024-05-22 22:14:45',NULL,NULL),(370,'admin',103,'mobile','Mobil',NULL,NULL,1,2,'2024-05-22 22:15:16',NULL,NULL),(371,'admin',110,'name','Megnevezés',NULL,NULL,1,2,'2024-05-28 11:08:19',NULL,NULL);
/*!40000 ALTER TABLE `core_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_messagewall`
--

DROP TABLE IF EXISTS `core_messagewall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_messagewall` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `targetUserID` bigint unsigned DEFAULT NULL,
  `targetGroupID` bigint unsigned DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_messagewall`
--

LOCK TABLES `core_messagewall` WRITE;
/*!40000 ALTER TABLE `core_messagewall` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_messagewall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_settlement`
--

DROP TABLE IF EXISTS `core_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_settlement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zipCode` int NOT NULL,
  `settlement` varchar(127) NOT NULL,
  `core_countyID` bigint NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `county_id` (`core_countyID`)
) ENGINE=MyISAM AUTO_INCREMENT=3137 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_settlement`
--

LOCK TABLES `core_settlement` WRITE;
/*!40000 ALTER TABLE `core_settlement` DISABLE KEYS */;
INSERT INTO `core_settlement` VALUES (1,8127,'Aba',6,47.0333,18.5167),(2,5241,'Abádszalók',10,47.4667,20.602),(3,7678,'Abaliget',2,46.15,18.1167),(4,3261,'Abasár',9,47.81,20.01),(5,3882,'Abaújalpár',4,48.3167,21.2333),(6,3882,'Abaújkér',4,48.31,40.01),(7,3815,'Abaújlak',4,48.4034,20.9667),(8,3881,'Abaújszántó',4,48.2833,20.01),(9,3809,'Abaújszolnok',4,48.3667,20.9833),(10,3898,'Abaújvár',4,48.5333,21.3167),(11,9151,'Abda',7,47.695,17.55),(12,3753,'Abod',4,20.7949,40.01),(13,2740,'Abony',13,47.1833,20.01),(14,8256,'Ábrahámhegy',18,46.8167,17.5667),(15,2941,'Ács',11,47.69,18.0167),(16,2683,'Acsa',13,47.8073,19.3833),(17,9746,'Acsád',17,47.3167,16.7333),(18,9168,'Acsalag',7,47.6833,40.01),(19,2887,'Ácsteszér',11,47.4157,18.0167),(20,3292,'Adács',9,19.9758,19.9833),(21,8653,'Ádánd',14,46.8667,18.1667),(22,8561,'Adásztevel',18,47.3066,17.55),(23,2457,'Adony',6,47.1167,18.8667),(24,8497,'Adorjánháza',18,47.2333,17.25),(25,7841,'Adorjás',2,45.8506,18.0628),(26,7381,'Ág',2,46.2833,40.01),(27,6076,'Ágasegyháza',1,46.8333,19.45),(28,9423,'Ágfalva',7,47.6833,16.5167),(29,3759,'Aggtelek',4,48.4667,20.5167),(30,9441,'Agyagosszergény',7,47.6167,16.95),(31,4524,'Ajak',15,48.1833,22.0667),(32,8400,'Ajka',18,47.1007,17.5667),(33,2862,'Aka',11,47.3997,18.0667),(34,6221,'Akasztó',1,46.6917,19.2081),(35,3779,'Alacska',4,48.2167,20.65),(36,7011,'Alap',6,46.7946,18.6904),(37,5142,'Alattyán',10,47.4333,40.01),(38,2730,'Albertirsa',13,47.25,19.6167),(39,8087,'Alcsútdoboz',6,47.4167,18.6167),(40,3353,'Aldebrő',9,47.7855,20.2333),(41,6750,'Algyő',5,46.17,20.17),(42,8921,'Alibánfa',19,46.8833,16.9333),(43,7934,'Almamellék',2,46.15,17.8833),(44,2931,'Almásfüzitő',11,47.7167,18.2667),(45,8935,'Almásháza',19,46.85,40.01),(46,5747,'Almáskamarás',3,46.4667,40.01),(47,7932,'Almáskeresztúr',2,46.1167,40.01),(48,4285,'Álmosd',8,47.4167,21.9833),(49,3985,'Alsóberecki',4,48.35,40.01),(50,7443,'Alsóbogát',14,46.5056,17.75),(51,3717,'Alsódobsza',4,48.1833,21.01),(52,3837,'Alsógagy',4,48.3974,21.0333),(53,7345,'Alsómocsolád',2,46.3167,18.25),(54,7147,'Alsónána',16,46.25,18.6667),(55,2351,'Alsónémedi',13,47.3167,19.1667),(56,8924,'Alsónemesapáti',19,46.8481,16.01),(57,7148,'Alsónyék',16,46.2013,18.7333),(58,8226,'Alsóörs',18,46.9833,17.9833),(59,8394,'Alsópáhok',19,46.7667,17.1833),(60,2617,'Alsópetény',12,47.8833,19.25),(61,8767,'Alsórajk',19,46.65,17.01),(62,3989,'Alsóregmec',4,48.4667,21.6167),(63,8973,'Alsószenterzsébet',19,46.75,16.4833),(64,7012,'Alsószentiván',6,46.7833,18.7333),(65,7826,'Alsószentmárton',2,45.7892,18.3056),(66,9983,'Alsószölnök',17,46.9278,16.2086),(67,3726,'Alsószuha',4,48.3667,20.5167),(68,3735,'Alsótelekes',4,48.4167,20.6667),(69,3069,'Alsótold',12,47.95,40.01),(70,9842,'Alsóújlak',17,47.0819,40.01),(71,3811,'Alsóvadász',4,48.25,20.9167),(72,3571,'Alsózsolca',4,48.0667,20.8833),(73,6916,'Ambrózfalva',5,46.35,20.7333),(74,4546,'Anarcs',15,48.1833,22.1167),(75,8675,'Andocs',14,46.65,17.9333),(76,3399,'Andornaktálya',9,47.85,20.4167),(77,9811,'Andrásfa',17,46.9667,40.01),(78,2529,'Annavölgy',11,47.6625,18.6771),(79,8477,'Apácatorna',18,47.1167,40.01),(80,4553,'Apagy',15,47.9667,21.9333),(81,2345,'Apaj',13,47.1167,40.01),(82,7186,'Aparhant',16,46.3333,18.45),(83,6931,'Apátfalva',5,46.1667,20.5833),(84,9982,'Apátistvánfalva',17,46.9006,16.2647),(85,7720,'Apátvarasd',2,46.1833,18.4833),(86,3032,'Apc',9,47.7934,40.01),(87,2338,'Áporka',13,47.2333,19.0167),(88,6088,'Apostag',1,46.8833,18.95),(89,4634,'Aranyosapáti',15,48.1989,22.2667),(90,7671,'Aranyosgadány',2,46.0001,18.1167),(91,3885,'Arka',4,48.35,21.25),(92,3663,'Arló',4,48.1833,20.2667),(93,3713,'Arnót',4,48.1333,20.8667),(94,3467,'Ároktő',4,47.7333,20.95),(95,6623,'Árpádhalom',5,46.6167,20.55),(96,9132,'Árpás',7,47.5167,40.01),(97,4115,'Ártánd',8,47.1167,21.7667),(98,6783,'Ásotthalom',5,46.2006,19.7906),(99,9177,'Ásványráró',7,47.8333,40.01),(100,3841,'Aszaló',4,48.2167,20.9667),(101,2170,'Aszód',13,47.65,40.01),(102,8241,'Aszófő',18,46.9333,17.8333),(103,7763,'Áta',2,45.9364,18.2947),(104,3371,'Átány',9,47.6167,20.3667),(105,3213,'Atkár',9,47.7167,40.01),(106,7252,'Attala',16,46.3524,18.0143),(107,7757,'Babarc',2,45.9981,18.5547),(108,7814,'Babarcszőlős',2,45.8992,18.1364),(109,7584,'Babócsa',14,46.0333,17.3667),(110,2943,'Bábolna',11,47.6333,17.9833),(111,8658,'Bábonymegyer',14,46.75,18.1167),(112,8983,'Babosdöbréte',19,46.8167,16.7833),(113,9351,'Babót',7,47.5667,17.0833),(114,6430,'Bácsalmás',1,46.1253,19.3361),(115,6453,'Bácsbokod',1,46.1219,19.1589),(116,6454,'Bácsborsód',1,46.0964,19.1581),(117,6511,'Bácsszentgyörgy',1,45.9722,19.0389),(118,6425,'Bácsszőlős',1,46.15,19.45),(119,8258,'Badacsonytomaj',18,46.8093,17.5167),(120,8263,'Badacsonytördemic',18,46.8167,17.4833),(121,2191,'Bag',13,47.6333,19.4833),(122,4286,'Bagamér',8,47.45,22.01),(123,8977,'Baglad',19,46.6833,16.4833),(124,8992,'Bagod',19,46.8781,16.7444),(125,9145,'Bágyogszovát',7,47.5833,17.3667),(126,2836,'Baj',11,47.65,18.3667),(127,6500,'Baja',1,46.1833,18.9667),(128,9944,'Bajánsenye',17,48.8004,16.3833),(129,2525,'Bajna',11,47.65,40.01),(130,2533,'Bajót',11,47.7333,18.5667),(131,8945,'Bak',19,46.7292,16.8464),(132,7585,'Bakháza',14,46.1062,17.3667),(133,7393,'Bakóca',2,46.2167,18.01),(134,4164,'Bakonszeg',8,47.1833,21.45),(135,7675,'Bakonya',2,46.0833,18.0833),(136,2885,'Bakonybánk',11,47.4667,40.01),(137,8427,'Bakonybél',18,47.25,17.7333),(138,8056,'Bakonycsernye',6,47.3167,18.0833),(139,8433,'Bakonygyirót',18,47.4142,17.825),(140,8581,'Bakonyjákó',18,47.2167,40.01),(141,8571,'Bakonykoppány',18,47.3333,17.6833),(142,8046,'Bakonykúti',6,47.25,40.01),(143,8422,'Bakonynána',18,47.2833,17.9667),(144,8418,'Bakonyoszlop',18,47.35,17.9333),(145,8436,'Bakonypéterd',7,0.47,17.01),(146,8457,'Bakonypölöske',18,47.2057,17.4833),(147,8557,'Bakonyság',18,47.3982,17.65),(148,2861,'Bakonysárkány',11,47.45,40.01),(149,8557,'Bakonyszentiván',18,47.389,17.6667),(150,8430,'Bakonyszentkirály',18,47.3667,17.8833),(151,8431,'Bakonyszentlászló',18,47.3891,17.8252),(152,2884,'Bakonyszombathely',11,47.4667,17.9667),(153,8572,'Bakonyszücs',18,47.3333,17.6833),(154,8555,'Bakonytamási',18,47.4167,17.7333),(155,6768,'Baks',5,46.55,40.01),(156,7834,'Baksa',2,45.9536,18.0889),(157,3836,'Baktakék',4,48.3833,21.0333),(158,4561,'Baktalórántháza',15,48.0001,22.0833),(159,8946,'Baktüttös',19,47.3887,16.8167),(160,3780,'Balajt',4,48.3195,20.7333),(161,2660,'Balassagyarmat',12,48.0833,40.01),(162,6764,'Balástya',5,46.4167,20.0167),(163,3347,'Balaton',9,46.811,20.3167),(164,8243,'Balatonakali',18,46.8833,17.75),(165,8220,'Balatonalmádi',18,47.033,18.0164),(166,8649,'Balatonberény',14,46.7167,17.3167),(167,8630,'Balatonboglár',14,46.7667,17.6667),(168,8272,'Balatoncsicsó',18,46.9333,17.6667),(169,8312,'Balatonederics',18,46.8167,17.3833),(170,8613,'Balatonendréd',14,46.8333,17.9833),(171,8646,'Balatonfenyves',14,46.7167,40.01),(172,8164,'Balatonfőkajár',18,47.0167,18.2167),(173,8623,'Balatonföldvár',14,46.85,17.8833),(174,8230,'Balatonfüred',18,46.95,17.8833),(175,8175,'Balatonfűzfő',18,47.0667,40.01),(176,8313,'Balatongyörök',19,46.75,17.3667),(177,8275,'Balatonhenye',18,46.9167,17.6167),(178,8174,'Balatonkenese',18,47.0333,18.1167),(179,8647,'Balatonkeresztúr',14,48.6959,17.3833),(180,8638,'Balatonlelle',14,46.7833,17.6833),(181,8753,'Balatonmagyaród',19,46.5936,17.1833),(182,8647,'Balatonmáriafürdő',14,46.7027,17.3833),(183,8637,'Balatonőszöd',14,46.8025,40.01),(184,8255,'Balatonrendes',18,46.8333,17.5833),(185,8651,'Balatonszabadi',14,46.8833,18.1333),(186,8624,'Balatonszárszó',14,46.8333,17.8333),(187,8636,'Balatonszemes',14,46.8167,17.7833),(188,8710,'Balatonszentgyörgy',14,46.6833,40.01),(189,8252,'Balatonszepezd',18,46.85,17.6667),(190,8230,'Balatonszőlős',18,46.9616,17.875),(191,8242,'Balatonudvari',18,46.9034,17.8167),(192,8712,'Balatonújlak',14,46.6667,17.3833),(193,8171,'Balatonvilágos',18,46.9667,18.1667),(194,8055,'Balinka',6,47.3167,18.1833),(195,4233,'Balkány',15,47.7667,21.8667),(196,6035,'Ballószög',1,46.8667,19.5833),(197,4060,'Balmazújváros',8,47.6167,21.35),(198,9771,'Balogunyom',17,47.1667,16.65),(199,6412,'Balotaszállás',1,46.35,19.5333),(200,4468,'Balsa',15,48.1833,21.55),(201,8614,'Bálványos',14,46.7833,17.95),(202,2944,'Bana',11,47.65,17.9167),(203,8443,'Bánd',18,47.1167,40.01),(204,7914,'Bánfa',2,45.9833,17.8833),(205,3642,'Bánhorváti',4,48.2333,20.5167),(206,2653,'Bánk',12,47.9333,19.1833),(207,8891,'Bánokszentgyörgy',19,46.5456,16.7872),(208,3654,'Bánréve',4,48.2962,20.3667),(209,7711,'Bár',2,46.046,18.7167),(210,4937,'Barabás',15,48.2333,22.4333),(211,2426,'Baracs',6,46.8833,18.8833),(212,2471,'Baracska',6,47.2833,18.7667),(213,4161,'Báránd',8,47.29,21.2333),(214,7841,'Baranyahidvég',2,45.8464,18.0233),(215,7384,'Baranyajenő',2,46.2667,40.01),(216,7383,'Baranyaszentgyörgy',2,46.2333,18.0167),(217,9169,'Barbacs',7,47.65,40.01),(218,7570,'Barcs',14,45.96,17.4586),(219,7478,'Bárdudvarnok',14,46.3333,17.6833),(220,8948,'Barlahida',19,46.7158,16.7025),(221,3126,'Bárna',12,48.0983,19.9333),(222,8291,'Barnag',18,46.9833,17.75),(223,2883,'Bársonyos',11,47.5167,17.9167),(224,7922,'Basal',2,46.0667,17.7833),(225,3881,'Baskó',4,48.3333,21.3333),(226,7149,'Báta',16,46.1333,18.7833),(227,7164,'Bátaapáti',16,46.2167,40.01),(228,7140,'Bátaszék',16,46.1833,18.7333),(229,7258,'Baté',14,46.35,17.9667),(230,6528,'Bátmonostor',1,46.1029,18.9333),(231,3070,'Bátonyterenye',12,47.9667,19.8333),(232,3336,'Bátor',9,47.9833,20.2667),(233,4343,'Bátorliget',15,47.8083,22.25),(234,5830,'Battonya',3,46.2833,21.0167),(235,6351,'Bátya',1,46.4833,18.95),(236,8797,'Batyk',19,46.9833,17.0333),(237,8887,'Bázakerettye',19,46.5233,16.7294),(238,8352,'Bazsi',18,46.9333,17.25),(239,8565,'Béb',18,47.35,40.01),(240,8866,'Becsehely',19,46.4458,16.7928),(241,2693,'Becske',12,47.9167,19.3833),(242,3768,'Becskeháza',4,48.5333,20.85),(243,8985,'Becsvölgye',19,46.7667,40.01),(244,8666,'Bedegkér',14,46.65,18.0667),(245,4128,'Bedő',8,47.1667,21.75),(246,9683,'Bejcgyertyános',17,47.15,16.01),(247,8515,'Békás',18,47.3333,17.35),(248,3903,'Bekecs',4,48.15,21.1833),(249,5630,'Békés',3,46.7667,21.1333),(250,5600,'Békéscsaba',3,46.6833,40.01),(251,5946,'Békéssámson',3,46.4167,20.6333),(252,5561,'Békésszentandrás',3,46.8667,20.4833),(253,3343,'Bekölce',9,48.0833,20.2833),(254,3346,'Bélapátfalva',9,48.0499,20.3667),(255,7589,'Bélavár',14,46.1167,17.2167),(256,7061,'Belecska',16,46.65,18.4167),(257,9343,'Beled',7,47.4667,40.01),(258,7543,'Beleg',14,46.3167,17.4167),(259,8855,'Belezna',19,46.3278,16.94),(260,5643,'Bélmegyer',3,46.8667,21.1833),(261,2455,'Beloiannisz',6,47.1667,18.8333),(262,8978,'Belsősárd',19,46.65,16.4833),(263,7747,'Belvárdgyula',2,45.9722,18.4339),(264,4643,'Benk',15,48.2997,22.2333),(265,2216,'Bénye',13,47.35,19.55),(266,3045,'Bér',12,47.8667,40.01),(267,9831,'Bérbaltavár',17,47.0167,16.9667),(268,2687,'Bercel',12,47.8667,19.4167),(269,4934,'Beregdaróc',15,48.1961,22.5333),(270,4933,'Beregsurány',15,48.1667,22.55),(271,4116,'Berekböszörmény',8,47.0667,21.6833),(272,5309,'Berekfürdő',10,47.3833,20.85),(273,7827,'Beremend',2,45.7853,18.4347),(274,0,'Berente',4,48.2432,20.6646),(275,3834,'Beret',4,48.35,21.0333),(276,4100,'Berettyóújfalu',8,47.2167,21.55),(277,8181,'Berhida',18,47.1167,18.1333),(278,2641,'Berkenye',12,47.8833,19.0833),(279,7664,'Berkesd',2,46.0667,18.4167),(280,4521,'Berkesz',15,48.0869,21.9833),(281,2639,'Bernecebaráti',13,48.0333,18.9167),(282,3575,'Berzék',4,48.0167,20.95),(283,7516,'Berzence',14,46.2023,17.15),(284,7838,'Besence',2,45.8902,17.9667),(285,4557,'Besenyőd',15,47.9667,22.0167),(286,3373,'Besenyőtelek',9,47.6942,20.4333),(287,5071,'Besenyszög',10,47.2929,20.2667),(288,2456,'Besnyő',6,47.1833,18.8167),(289,4488,'Beszterec',15,48.15,21.85),(290,7782,'Bezedek',2,45.8647,18.5864),(291,9223,'Bezenye',7,47.9667,17.2167),(292,8934,'Bezeréd',19,46.8667,17.0167),(293,9162,'Bezi',7,47.6667,40.01),(294,2051,'Biatorbágy',13,47.4667,18.8167),(295,7671,'Bicsérd',2,46.0167,18.0833),(296,2060,'Bicske',6,47.4833,18.6333),(297,4175,'Bihardancsháza',8,47.2333,21.3167),(298,4110,'Biharkeresztes',8,47.1333,21.7167),(299,4172,'Biharnagybajom',8,47.2167,21.2333),(300,4174,'Bihartorda',8,47.2167,21.3667),(301,5538,'Biharugra',3,46.9667,40.01),(302,7043,'Bikács',16,46.6833,18.6667),(303,7346,'Bikal',2,46.3333,18.2833),(304,4235,'Biri',15,47.8167,21.85),(305,7747,'Birján',2,45.9978,18.3747),(306,7811,'Bisse',2,45.9078,18.2581),(307,9542,'Boba',17,47.1794,17.1833),(308,8943,'Bocfölde',19,46.7833,16.8333),(309,3368,'Boconád',9,47.6333,40.01),(310,6235,'Bócsa',1,46.6133,40.01),(311,8776,'Bocska',19,46.55,16.9167),(312,4241,'Bocskaikert',8,47.4333,21.9167),(313,7672,'Boda',2,46.0833,40.01),(314,8053,'Bodajk',6,47.3167,18.2333),(315,8080,'Bodmér',6,47.45,18.55),(316,7394,'Bodolyabér',2,46.1977,18.1167),(317,9134,'Bodonhely',7,47.5667,40.01),(318,3243,'Bodony',9,47.95,20.0333),(319,8471,'Bodorfa',18,47.0667,17.3333),(320,7439,'Bodrog',14,46.4667,17.6667),(321,3987,'Bodroghalom',4,46.2942,21.7167),(322,3916,'Bodrogkeresztúr',4,48.1667,21.3667),(323,3917,'Bodrogkisfalud',4,48.1833,21.3667),(324,3943,'Bodrogolaszi',4,48.2833,21.5167),(325,3768,'Bódvalenke',4,48.55,20.8167),(326,3764,'Bódvarákó',4,48.5167,20.75),(327,3763,'Bódvaszilas',4,48.5333,20.7333),(328,3412,'Bogács',4,47.9035,20.5333),(329,7741,'Bogád',2,46.0833,18.3333),(330,7836,'Bogádmindszent',2,45.9069,18.0406),(331,7966,'Bogdása',2,45.8833,40.01),(332,7132,'Bogyiszló',16,46.3833,18.8333),(333,9324,'Bogyoszló',7,47.5667,17.1833),(334,4114,'Bojt',8,47.1914,21.7333),(335,8741,'Bókaháza',19,46.7667,40.01),(336,2855,'Bokod',11,47.4906,18.25),(337,3066,'Bokor',12,47.9333,19.55),(338,3016,'Boldog',9,47.5967,40.01),(339,7937,'Boldogasszonyfa',2,46.1833,17.8333),(340,3884,'Boldogkőújfalu',4,48.3167,21.25),(341,3885,'Boldogkőváralja',4,48.3333,21.2333),(342,3794,'Boldva',4,48.2167,40.01),(343,7517,'Bolhás',14,46.2667,17.2833),(344,7586,'Bolhó',14,46.0333,40.01),(345,7754,'Bóly',2,45.9672,18.5183),(346,8992,'Boncodfölde',19,46.8667,16.7333),(347,7281,'Bonnya',14,46.5833,40.01),(348,7150,'Bonyhád',16,46.293,18.5333),(349,7158,'Bonyhádvarasd',16,46.3667,18.4833),(350,6795,'Bordány',5,46.3217,19.01),(351,9554,'Borgáta',17,47.1667,17.0833),(352,7756,'Borjád',2,45.9339,18.4672),(353,6445,'Borota',1,46.2631,19.2253),(354,8885,'Borsfa',19,46.5167,16.7833),(355,3658,'Borsodbóta',4,48.2167,40.01),(356,3426,'Borsodgeszt',4,47.95,40.01),(357,3462,'Borsodivánka',4,47.6976,20.6667),(358,3671,'Borsodnádasd',4,48.1167,20.25),(359,3623,'Borsodszentgyörgy',4,48.1833,40.01),(360,3796,'Borsodszirák',4,48.2667,20.7667),(361,2644,'Borsosberény',12,47.9667,19.1167),(362,8479,'Borszörcsök',18,47.1333,40.01),(363,8428,'Borzavár',18,47.2898,17.8333),(364,7811,'Bosta',2,45.9483,18.2092),(365,4955,'Botpalád',15,48.0333,40.01),(366,7900,'Botykapeterd',2,47.2891,17.8667),(367,9727,'Bozsok',17,47.3333,40.01),(368,9752,'Bozzai',17,47.2052,16.7667),(369,3994,'Bózsva',4,48.4667,21.4667),(370,9625,'Bő',17,47.3667,40.01),(371,3574,'Bőcs',4,48.0352,20.9667),(372,8991,'Böde',19,46.8375,16.7206),(373,8969,'Bödeháza',19,46.65,16.4167),(374,9612,'Bögöt',17,47.25,40.01),(375,9675,'Bögöte',17,47.1667,17.0367),(376,8719,'Böhönye',14,46.4041,40.01),(377,4231,'Bököny',15,47.7333,21.75),(378,7025,'Bölcske',16,46.7333,18.9667),(379,9073,'Bőny',7,47.65,17.8667),(380,9152,'Börcs',7,47.6833,40.01),(381,8772,'Börzönce',19,46.5833,40.01),(382,9167,'Bősárkány',7,47.6833,17.25),(383,7475,'Bőszénfa',14,46.2333,17.85),(384,5527,'Bucsa',3,47.202,21.01),(385,9792,'Bucsu',17,47.2667,40.01),(386,8925,'Bucsuszentlászló',19,46.7861,16.9314),(387,8893,'Bucsuta',19,46.5667,16.85),(388,2093,'Budajenő',13,47.55,40.01),(389,2011,'Budakalász',13,47.6167,40.01),(390,2092,'Budakeszi',13,47.5167,18.9333),(391,2040,'Budaörs',13,47.4531,18.9602),(392,1011,'Budapest',20,47.5011,19.0469),(393,6114,'Bugac',1,46.6889,19.6794),(394,6114,'Bugacpusztaháza',1,46.6889,19.6794),(395,2347,'Bugyi',13,47.2167,19.15),(396,4483,'Buj',15,48.0941,21.65),(397,3047,'Buják',12,47.8833,19.55),(398,8695,'Buzsák',14,46.65,17.5833),(399,9737,'Bük',17,47.3833,16.75),(400,3422,'Bükkábrány',4,47.8833,20.6833),(401,3554,'Bükkaranyos',4,47.9833,20.7833),(402,3648,'Bükkmogyorósd',4,48.1333,20.3667),(403,7682,'Bükkösd',2,46.109,17.9833),(404,3335,'Bükkszék',9,47.9833,20.1833),(405,3257,'Bükkszenterzsébet',9,48.0527,20.1667),(406,3557,'Bükkszentkereszt',4,48.0667,20.6333),(407,3346,'Bükkszentmárton',9,48.0667,20.35),(408,3414,'Bükkzsérc',4,47.9667,40.01),(409,7973,'Bürüs',2,45.9667,17.7667),(410,7273,'Büssü',14,46.4667,17.9667),(411,3821,'Büttös',4,48.4833,21.0167),(412,9725,'Cák',17,47.35,16.5167),(413,9165,'Cakóháza',7,47.6937,17.2833),(414,7013,'Cece',6,46.7667,18.65),(415,4732,'Cégénydányád',15,47.9333,22.55),(416,2700,'Cegléd',13,47.1667,20.6027),(417,2737,'Ceglédbercel',13,47.2167,19.6833),(418,9500,'Celldömölk',17,47.25,17.15),(419,3123,'Cered',12,48.15,19.9667),(420,9624,'Chernelházadamonya',17,47.35,16.85),(421,5462,'Cibakháza',10,46.9667,40.01),(422,3973,'Cigánd',4,48.25,40.01),(423,7161,'Cikó',16,46.25,18.5667),(424,9364,'Cirák',7,47.4667,17.0333),(425,5551,'Csabacsűd',3,46.8333,20.65),(426,5609,'Csabaszabadi',3,46.6833,21.0833),(427,2064,'Csabdi',6,47.5167,18.6167),(428,8474,'Csabrendek',18,47.0167,40.01),(429,9375,'Csáfordjánosfa',7,47.4167,16.95),(430,4967,'Csaholc',15,47.9833,22.7333),(431,8163,'Csajág',18,47.0704,18.1833),(432,8735,'Csákány',14,46.5333,17.2833),(433,9919,'Csákánydoroszló',17,46.9708,16.5069),(434,8073,'Csákberény',6,47.35,18.3333),(435,8083,'Csákvár',6,47.3892,18.45),(436,6915,'Csanádalberti',5,46.3333,20.7167),(437,5662,'Csanádapáca',3,46.55,20.8833),(438,6913,'Csanádpalota',5,46.25,20.7333),(439,9654,'Csánig',17,47.3944,17.0056),(440,3015,'Csány',9,47.65,19.8333),(441,7964,'Csányoszró',2,45.8819,17.9019),(442,6647,'Csanytelek',5,46.604,20.1167),(443,8756,'Csapi',19,46.5333,40.01),(444,9372,'Csapod',7,47.5167,16.9167),(445,5621,'Csárdaszállás',3,46.8667,20.9333),(446,7811,'Csarnóta',2,45.8953,18.2147),(447,4844,'Csaroda',15,48.1667,22.4667),(448,2858,'Császár',11,47.4979,18.15),(449,6239,'Császártöltés',1,46.4219,19.1836),(450,4973,'Császló',15,47.9167,22.7333),(451,6523,'Csátalja',1,46.0333,18.95),(452,8943,'Csatár',19,46.7833,16.8833),(453,5064,'Csataszög',10,47.2833,40.01),(454,2888,'Csatka',11,47.3667,17.9833),(455,6448,'Csávoly',1,46.1892,19.1467),(456,7935,'Csebény',2,46.1833,17.9333),(457,3052,'Csécse',12,47.8667,19.6333),(458,4742,'Csegöld',15,47.8875,22.6875),(459,8445,'Csehbánya',18,47.1833,17.6833),(460,9833,'Csehi',17,47.0333,16.95),(461,9834,'Csehimindszent',17,47.0469,16.95),(462,2949,'Csém',11,47.6833,40.01),(463,2713,'Csemő',13,47.1167,40.01),(464,9764,'Csempeszkopács',17,47.15,40.01),(465,6765,'Csengele',5,46.5333,19.8667),(466,4765,'Csenger',15,47.8333,22.6833),(467,4743,'Csengersima',15,47.8667,22.7333),(468,4764,'Csengerújfalu',15,47.8024,22.6333),(469,6222,'Csengőd',1,46.7167,19.2667),(470,9611,'Csénye',17,47.2333,16.8667),(471,3837,'Csenyéte',4,48.4333,40.01),(472,2946,'Csép',11,47.5833,18.0667),(473,5475,'Csépa',10,46.8062,20.1333),(474,9735,'Csepreg',17,47.4021,16.7167),(475,9375,'Csér',7,47.4167,16.9333),(476,7683,'Cserdi',2,46.0667,18.01),(477,7472,'Cserénfa',14,46.3167,17.8833),(478,3413,'Cserépfalu',4,47.9333,20.5333),(479,3417,'Cserépváralja',4,47.9333,20.5667),(480,2694,'Cserháthaláp',12,47.9833,19.3667),(481,2676,'Cserhátsurány',12,47.9833,19.4333),(482,3066,'Cserhátszentiván',12,47.9333,19.5833),(483,5465,'Cserkeszőlő',10,46.8667,20.1833),(484,7673,'Cserkút',2,46.0667,18.1333),(485,3648,'Csernely',4,48.15,20.35),(486,8372,'Cserszegtomaj',19,46.805,17.2167),(487,8951,'Csertalakos',19,46.65,40.01),(488,7900,'Csertő',2,46.0893,17.8167),(489,8419,'Csesznek',18,47.35,17.8833),(490,8973,'Csesztreg',19,46.7136,16.5203),(491,2678,'Csesztve',12,48.0167,19.2833),(492,8417,'Csetény',18,47.3167,18.01),(493,2212,'Csévharaszt',13,47.2902,19.4333),(494,7225,'Csibrák',16,46.4667,18.35),(495,6424,'Csikéria',1,46.1222,19.4789),(496,7341,'Csikóstőttős',16,46.3333,18.1667),(497,8534,'Csikvánd',7,47.4667,17.45),(498,3442,'Csincse',4,47.8833,20.7667),(499,9836,'Csipkerek',17,47.0667,16.95),(500,2673,'Csitár',12,48.0546,19.4333),(501,3848,'Csobád',4,48.2833,21.0333),(502,3927,'Csobaj',4,48.0467,21.35),(503,2014,'Csobánka',13,47.6333,18.9667),(504,8074,'Csókakő',6,47.35,18.2667),(505,7555,'Csokonyavisonta',14,46.0833,17.45),(506,3647,'Csokvaomány',4,48.1667,20.3833),(507,2521,'Csolnok',11,47.6872,18.7167),(508,6135,'Csólyospálos',1,46.4183,19.8436),(509,7253,'Csoma',14,46.3667,40.01),(510,2161,'Csomád',13,47.6667,19.2333),(511,7432,'Csombárd',14,46.45,17.6833),(512,6640,'Csongrád',5,46.7046,20.15),(513,8918,'Csonkahegyhát',19,46.7983,16.7242),(514,7940,'Csonkamindszent',2,46.0522,17.9667),(515,8229,'Csopak',18,46.9833,17.9333),(516,8041,'Csór',6,47.2069,18.2667),(517,9300,'Csorna',7,47.6167,17.25),(518,5920,'Csorvás',3,46.6333,20.8333),(519,8558,'Csót',18,47.3667,17.6167),(520,8999,'Csöde',19,46.8167,16.5333),(521,8495,'Csögle',18,47.2167,17.2667),(522,4145,'Csökmő',8,47.0333,40.01),(523,7526,'Csököly',14,46.3003,17.55),(524,8700,'Csömend',14,46.5667,40.01),(525,8957,'Csömödér',19,46.6083,16.6442),(526,2141,'Csömör',13,47.55,19.2333),(527,9513,'Csönge',17,47.3361,17.1139),(528,8873,'Csörnyeföld',19,46.5008,16.6319),(529,9962,'Csörötnek',17,46.9514,16.3764),(530,8122,'Csősz',6,47.0333,18.4167),(531,2615,'Csővár',13,47.8167,19.3333),(532,8840,'Csurgó',14,46.2667,40.01),(533,8840,'Csurgónagymarton',14,46.2959,17.0833),(534,7843,'Cún',2,45.8125,18.0669),(535,2370,'Dabas',13,47.1833,19.3167),(536,8345,'Dabronc',18,47.0333,17.1667),(537,8485,'Dabrony',18,47.25,17.3333),(538,2854,'Dad',11,47.5167,18.2333),(539,2522,'Dág',11,47.6667,18.7167),(540,8592,'Dáka',18,47.2833,17.4333),(541,7211,'Dalmand',16,46.4933,18.1833),(542,3780,'Damak',4,48.3167,20.8333),(543,3978,'Dámóc',4,48.3667,22.0333),(544,2735,'Dánszentmiklós',13,47.2167,19.55),(545,2118,'Dány',13,47.5167,19.55),(546,9917,'Daraboshegy',17,46.9667,16.5667),(547,7988,'Darány',14,45.9803,17.5853),(548,4737,'Darnó',15,47.9667,22.6667),(549,9232,'Darnózseli',7,47.85,17.4333),(550,4144,'Darvas',8,47.1027,21.35),(551,6524,'Dávod',1,45.995,18.9172),(552,2694,'Debercsény',12,47.9667,19.3167),(553,4000,'Debrecen',8,47.7675,21.24),(554,3825,'Debréte',4,48.4971,20.8667),(555,7144,'Decs',16,46.2833,18.7667),(556,3643,'Dédestapolcsány',4,48.1833,20.4833),(557,8135,'Dég',6,46.8667,18.45),(558,2649,'Dejtár',12,48.0333,19.1667),(559,2337,'Délegyháza',13,47.25,19.0667),(560,4516,'Demecser',15,48.1167,21.9167),(561,3395,'Demjén',9,47.8333,20.3333),(562,7915,'Dencsháza',2,46.0001,17.8333),(563,9365,'Dénesfa',7,47.45,17.0333),(564,4130,'Derecske',8,47.35,21.5667),(565,6621,'Derekegyház',5,46.5833,20.3667),(566,6772,'Deszk',5,46.2167,20.25),(567,3834,'Detek',4,48.3333,21.0333),(568,3275,'Detk',9,47.75,40.01),(569,5510,'Dévaványa',3,47.0333,20.9667),(570,8460,'Devecser',18,47.1053,17.4333),(571,7683,'Dinnyeberki',2,46.0833,17.95),(572,7072,'Diósberény',16,46.5333,18.45),(573,2049,'Diósd',13,47.4035,18.95),(574,2643,'Diósjenő',12,47.95,40.01),(575,8764,'Dióskál',19,46.6667,40.01),(576,7817,'Diósviszló',2,45.8772,18.1633),(577,8482,'Doba',18,47.1667,17.3833),(578,5624,'Doboz',3,46.7333,21.25),(579,8874,'Dobri',19,46.5167,16.5833),(580,8917,'Dobronhegy',19,46.8167,16.75),(581,6766,'Dóc',5,46.4333,20.1333),(582,3627,'Domaháza',4,48.1833,20.1167),(583,6781,'Domaszék',5,46.2492,20.0111),(584,5836,'Dombegyház',3,46.3333,21.1333),(585,5745,'Dombiratos',3,46.4167,21.1167),(586,7200,'Dombóvár',16,46.3833,18.1167),(587,4492,'Dombrád',15,48.2333,21.9333),(588,2182,'Domony',13,47.65,19.4333),(589,3263,'Domoszló',9,47.8333,20.1167),(590,3374,'Dormánd',9,47.7167,20.4167),(591,2510,'Dorog',11,47.7167,18.7333),(592,3153,'Dorogháza',12,47.9833,40.01),(593,9791,'Dozmat',17,47.2333,16.5167),(594,9914,'Döbörhegy',17,46.9833,40.01),(595,8357,'Döbröce',19,46.9333,40.01),(596,7228,'Döbrököz',16,46.4167,18.25),(597,8597,'Döbrönte',18,47.2333,17.55),(598,4495,'Döge',15,48.2667,22.0833),(599,2027,'Dömös',11,47.7667,18.9167),(600,2344,'Dömsöd',13,47.0833,19.01),(601,9147,'Dör',7,47.4581,40.01),(602,8244,'Dörgicse',18,46.9167,17.7167),(603,9913,'Döröske',17,47.0167,40.01),(604,8799,'Dötk',19,46.95,17.0167),(605,3721,'Dövény',4,48.35,20.55),(606,6342,'Drágszél',1,46.4667,40.01),(607,7851,'Drávacsehi',2,45.8128,18.1672),(608,7846,'Drávacsepely',2,45.8292,18.1386),(609,7967,'Drávafok',2,45.8864,17.76),(610,7977,'Drávagárdony',14,45.95,17.6167),(611,7960,'Drávaiványi',2,45.85,17.8167),(612,7967,'Drávakeresztúr',2,45.8333,17.7667),(613,7851,'Drávapalkonya',2,45.8031,18.1789),(614,7843,'Drávapiski',2,45.84,18.1011),(615,7851,'Drávaszabolcs',2,45.8058,18.2114),(616,7847,'Drávaszerdahely',2,45.8358,18.1633),(617,7960,'Drávasztára',2,45.8167,17.8167),(618,7979,'Drávatamási',14,45.9444,17.5694),(619,2646,'Drégelypalánk',12,48.0508,40.01),(620,3635,'Dubicsány',4,48.2833,40.01),(621,8416,'Dudar',18,47.3085,17.95),(622,9556,'Duka',17,47.181,17.0929),(623,2545,'Dunaalmás',11,47.7333,18.3333),(624,2023,'Dunabogdány',13,47.7833,19.0333),(625,6323,'Dunaegyháza',1,46.8333,18.95),(626,6513,'Dunafalva',1,46.0611,18.9611),(627,7020,'Dunaföldvár',16,46.8004,18.9333),(628,2330,'Dunaharaszti',13,47.35,19.0833),(629,2120,'Dunakeszi',13,47.6333,19.1333),(630,9225,'Dunakiliti',7,47.9667,17.2833),(631,6328,'Dunapataj',1,46.64,19.0022),(632,9235,'Dunaremete',7,47.8833,17.4333),(633,9174,'Dunaszeg',7,47.7667,17.55),(634,7712,'Dunaszekcső',2,46.0833,18.7667),(635,6333,'Dunaszentbenedek',1,46.5928,18.8947),(636,7135,'Dunaszentgyörgy',16,46.5333,18.8333),(637,2897,'Dunaszentmiklós',11,47.703,18.3833),(638,9175,'Dunaszentpál',7,47.7833,40.01),(639,9226,'Dunasziget',7,47.9333,17.3667),(640,6325,'Dunatetétlen',1,46.75,19.1167),(641,2400,'Dunaújváros',6,46.9833,18.9333),(642,2336,'Dunavarsány',13,47.2833,19.0667),(643,6087,'Dunavecse',1,46.9167,18.9833),(644,6353,'Dusnok',1,46.3833,18.9667),(645,7224,'Dúzs',16,46.4833,18.3833),(646,9451,'Ebergőc',7,47.5667,16.8167),(647,4211,'Ebes',8,47.4667,40.01),(648,9083,'Écs',7,47.55,17.7167),(649,3013,'Ecséd',9,47.7333,19.7833),(650,3053,'Ecseg',12,47.8962,40.01),(651,5515,'Ecsegfalva',3,47.15,20.9167),(652,7457,'Ecseny',14,46.55,17.85),(653,2233,'Ecser',13,47.45,19.3333),(654,7443,'Edde',14,46.5167,17.7167),(655,3780,'Edelény',4,48.2952,20.7333),(656,9343,'Edve',7,47.45,17.1333),(657,3300,'Eger',9,47.9058,20.3709),(658,7763,'Egerág',2,45.9839,18.3047),(659,8497,'Egeralja',18,47.2333,17.25),(660,8765,'Egeraracsa',19,46.6667,17.0833),(661,3321,'Egerbakta',9,47.9333,40.01),(662,3337,'Egerbocs',9,48.0333,20.2667),(663,3341,'Egercsehi',9,48.0553,20.2833),(664,3379,'Egerfarmos',9,47.7167,20.55),(665,3461,'Egerlövő',4,47.7167,20.6333),(666,3394,'Egerszalók',9,47.8667,20.3333),(667,3328,'Egerszólát',9,47.8833,20.2667),(668,3757,'Égerszög',4,48.45,20.5833),(669,8913,'Egervár',19,46.9336,16.8553),(670,9684,'Egervölgy',17,47.1167,16.9167),(671,9314,'Egyed',7,47.5167,17.35),(672,4069,'Egyek',8,47.6333,40.01),(673,3043,'Egyházasdengeleg',12,47.7968,19.5667),(674,9473,'Egyházasfalu',7,47.4667,16.7667),(675,3185,'Egyházasgerge',12,48.1833,19.65),(676,7824,'Egyházasharaszti',2,45.8094,18.3336),(677,9554,'Egyházashetye',17,47.1667,17.1167),(678,9781,'Egyházashollós',17,47.0516,16.6833),(679,8523,'Egyházaskesző',18,47.4167,17.3333),(680,7347,'Egyházaskozár',2,46.3333,18.3167),(681,9783,'Egyházasrádóc',17,47.0833,16.6167),(682,5742,'Elek',3,46.5333,21.25),(683,7744,'Ellend',2,46.0567,18.3833),(684,2424,'Előszállás',6,46.8333,18.8167),(685,3432,'Emőd',4,47.9333,20.8167),(686,3860,'Encs',4,48.3333,21.1333),(687,4374,'Encsencs',15,47.7333,22.1167),(688,3165,'Endrefalva',12,48.1333,19.5833),(689,7973,'Endrőc',2,45.9294,17.7586),(690,9143,'Enese',7,47.65,17.4167),(691,8130,'Enying',6,46.9333,18.25),(692,6624,'Eperjes',5,46.6833,20.5667),(693,4646,'Eperjeske',15,48.35,22.2167),(694,8413,'Eplény',18,47.2167,17.9167),(695,2526,'Epöl',11,47.65,18.65),(696,2451,'Ercsi',6,47.25,40.01),(697,2030,'Érd',13,47.3667,18.9333),(698,3932,'Erdőbénye',4,48.2667,21.3667),(699,3935,'Erdőhorváti',4,48.3167,21.4333),(700,2113,'Erdőkertes',13,47.6667,19.3167),(701,3252,'Erdőkövesd',9,48.0333,40.01),(702,2176,'Erdőkürt',12,47.7667,19.4667),(703,7735,'Erdősmárok',2,46.0564,18.55),(704,7723,'Erdősmecske',2,46.1833,18.5167),(705,2177,'Erdőtarcsa',12,47.7667,19.55),(706,3358,'Erdőtelek',9,47.6833,20.3167),(707,3295,'Erk',9,47.6167,20.0833),(708,4245,'Érpatak',15,47.8049,21.7667),(709,6347,'Érsekcsanád',1,46.25,18.9833),(710,6348,'Érsekhalma',1,46.35,19.1167),(711,2659,'Érsekvadkert',12,48.0001,40.01),(712,7093,'Értény',16,46.6167,18.1333),(713,7661,'Erzsébet',2,46.0978,18.4667),(714,4124,'Esztár',8,47.2833,21.7833),(715,8882,'Eszteregnye',19,46.4667,16.8833),(716,8742,'Esztergályhorváti',19,46.7005,17.1167),(717,2500,'Esztergom',11,47.7909,18.75),(718,2947,'Ete',11,47.5303,18.0333),(719,3136,'Etes',12,48.1167,19.7167),(720,2091,'Etyek',6,47.45,18.75),(721,4354,'Fábiánháza',15,47.8333,22.3667),(722,6625,'Fábiánsebestyén',5,46.6833,20.4667),(723,7136,'Fácánkert',16,46.45,18.7333),(724,7133,'Fadd',16,46.4667,18.8333),(725,3865,'Fáj',4,48.4167,21.0833),(726,6352,'Fajsz',1,46.4167,18.9167),(727,3855,'Fancsal',4,48.35,21.0667),(728,9321,'Farád',7,47.0627,40.01),(729,8582,'Farkasgyepű',18,47.2037,17.6333),(730,0,'Farkaslyuk',4,48.1859,20.3128),(731,2765,'Farmos',13,47.3667,19.85),(732,7732,'Fazekasboda',2,46.1167,18.4833),(733,3255,'Fedémes',9,48.0333,40.01),(734,5231,'Fegyvernek',10,47.2667,20.5333),(735,4900,'Fehérgyarmat',15,47.9833,22.5167),(736,9163,'Fehértó',7,47.6833,17.35),(737,8052,'Fehérvárcsurgó',6,47.2893,18.2667),(738,7724,'Feked',2,46.1667,18.5667),(739,9211,'Feketeerdő',7,47.9333,17.2833),(740,8086,'Felcsút',6,47.45,18.5833),(741,3352,'Feldebrő',9,47.8167,20.25),(742,6645,'Felgyő',5,46.65,40.01),(743,9122,'Felpéc',7,47.5167,40.01),(744,3985,'Felsőberecki',4,48.3667,40.01),(745,9794,'Felsőcsatár',17,47.2167,16.45),(746,3847,'Felsődobsza',4,48.2667,21.0667),(747,7370,'Felsőegerszeg',2,46.25,18.1333),(748,3837,'Felsőgagy',4,48.4333,21.0167),(749,9934,'Felsőjánosfa',17,46.85,16.5667),(750,3722,'Felsőkelecsény',4,48.3667,40.01),(751,6055,'Felsőlajos',1,47.0667,19.5167),(752,9918,'Felsőmarác',17,46.9333,16.5167),(753,7456,'Felsőmocsolád',14,46.5833,17.8333),(754,7175,'Felsőnána',16,46.4667,18.5333),(755,3721,'Felsőnyárád',4,48.3333,40.01),(756,7099,'Felsőnyék',16,46.7833,40.01),(757,8227,'Felsőörs',18,47.0167,17.95),(758,8380,'Felsőpáhok',19,46.7899,17.1838),(759,2363,'Felsőpakony',13,47.35,19.25),(760,2611,'Felsőpetény',12,47.8833,40.01),(761,8767,'Felsőrajk',19,46.6833,17.01),(762,3989,'Felsőregmec',4,48.4833,21.6167),(763,8973,'Felsőszenterzsébet',19,46.75,16.45),(764,6447,'Felsőszentiván',1,46.195,19.1903),(765,7968,'Felsőszentmárton',2,45.8522,40.01),(766,9985,'Felsőszölnök',17,46.8797,16.1731),(767,3324,'Felsőtárkány',9,47.9667,20.4167),(768,3735,'Felsőtelekes',4,48.4057,20.6333),(769,3067,'Felsőtold',12,47.9667,19.6167),(770,3814,'Felsővadász',4,48.3667,20.9333),(771,3561,'Felsőzsolca',4,48.1079,20.8667),(772,4621,'Fényeslitke',15,48.2667,40.01),(773,8432,'Fenyőfő',18,48.1084,17.01),(774,6774,'Ferencszállás',5,46.2167,20.35),(775,9493,'Fertőboz',7,47.6333,40.01),(776,9431,'Fertőd',7,47.6167,16.8667),(777,9442,'Fertőendréd',7,47.604,16.9167),(778,9492,'Fertőhomok',7,47.6167,16.7667),(779,9421,'Fertőrákos',7,47.7167,16.65),(780,9444,'Fertőszentmiklós',7,47.5833,16.8833),(781,9436,'Fertőszéplak',7,47.6167,16.8333),(782,7282,'Fiad',14,46.6333,17.85),(783,3994,'Filkeháza',4,48.4921,40.01),(784,8835,'Fityeház',19,46.3667,16.9167),(785,6331,'Foktő',1,46.5167,18.9167),(786,4090,'Folyás',8,47.8078,21.1333),(787,7271,'Fonó',14,46.3992,17.95),(788,3893,'Fony',4,48.3902,40.01),(789,8640,'Fonyód',14,46.7333,17.55),(790,6793,'Forráskút',5,46.3667,19.9167),(791,3849,'Forró',4,48.3167,21.0833),(792,2151,'Fót',13,47.6167,18.8964),(793,6922,'Földeák',5,46.3167,40.01),(794,4177,'Földes',8,47.2856,21.3667),(795,8732,'Főnyed',14,46.6333,17.2667),(796,3864,'Fulókércs',4,48.4333,21.1167),(797,4141,'Furta',8,47.1333,21.4667),(798,8157,'Füle',6,47.051,18.25),(799,4964,'Fülesd',15,48.0167,22.6833),(800,4266,'Fülöp',8,47.6003,22.0667),(801,6042,'Fülöpháza',1,46.8833,19.4167),(802,6116,'Fülöpjakab',1,46.6767,19.8343),(803,6085,'Fülöpszállás',1,46.8178,19.2386),(804,4754,'Fülpösdaróc',15,47.9333,40.01),(805,7087,'Fürged',16,46.7167,40.01),(806,3996,'Füzér',4,48.55,21.4667),(807,3994,'Füzérkajata',4,48.5167,40.01),(808,3997,'Füzérkomlós',4,48.5167,21.4667),(809,3993,'Füzérradvány',4,48.4833,21.5333),(810,3390,'Füzesabony',9,47.75,20.4167),(811,5525,'Füzesgyarmat',3,47.106,21.2167),(812,8777,'Füzvölgy',19,46.5167,16.95),(813,4122,'Gáborján',8,47.2333,21.6667),(814,8969,'Gáborjánháza',19,46.6333,16.4167),(815,4972,'Gacsály',15,47.9333,22.7667),(816,7276,'Gadács',14,46.5333,18.0167),(817,8716,'Gadány',14,46.5167,40.01),(818,3815,'Gadna',4,48.3992,20.9333),(819,5932,'Gádoros',3,46.6667,40.01),(820,3837,'Gagyapáti',4,48.4167,40.01),(821,3817,'Gagybátor',4,48.4333,20.95),(822,3816,'Gagyvendégi',4,48.4333,20.9833),(823,8754,'Galambok',19,46.5167,17.1333),(824,2686,'Galgaguta',12,47.85,40.01),(825,2681,'Galgagyörk',13,47.7333,19.3833),(826,2193,'Galgahévíz',13,47.6167,19.5667),(827,2183,'Galgamácsa',13,47.693,19.3833),(828,7473,'Gálosfa',14,46.25,40.01),(829,3752,'Galvács',4,48.4167,20.7833),(830,8685,'Gamás',14,46.6167,17.7667),(831,8597,'Ganna',18,47.2333,17.5333),(832,8082,'Gánt',6,47.3833,40.01),(833,6522,'Gara',1,46.0319,19.0428),(834,3067,'Garáb',12,47.9833,19.65),(835,8747,'Garabonc',19,46.5833,17.1333),(836,3873,'Garadna',4,48.4167,21.1833),(837,4976,'Garbolc',15,47.95,22.8667),(838,2483,'Gárdony',6,47.1957,18.65),(839,7812,'Garé',2,45.9189,18.1933),(840,9952,'Gasztony',17,46.9625,16.4594),(841,6111,'Gátér',1,46.6833,19.9667),(842,4471,'Gávavencsellő',15,48.1667,40.01),(843,4754,'Géberjén',15,47.9333,22.4667),(844,8543,'Gecse',18,47.45,17.5333),(845,6334,'Géderlak',1,46.6167,18.9167),(846,4517,'Gégény',15,48.15,21.95),(847,3444,'Gelej',4,47.8333,20.7833),(848,4935,'Gelénes',15,48.2022,22.45),(849,8981,'Gellénháza',19,46.7614,16.7878),(850,8774,'Gelse',19,46.6015,40.01),(851,8774,'Gelsesziget',19,46.5667,40.01),(852,4567,'Gemzse',15,48.1333,40.01),(853,9721,'Gencsapáti',17,47.2833,40.01),(854,9672,'Gérce',17,47.2167,17.0167),(855,7951,'Gerde',2,45.9897,18.0242),(856,5925,'Gerendás',3,46.5939,20.8667),(857,7362,'Gerényes',2,46.3049,18.1833),(858,7733,'Geresdlak',2,46.1068,18.5333),(859,7134,'Gerjen',16,46.4919,40.01),(860,9813,'Gersekarát',17,46.9739,16.7467),(861,5734,'Geszt',3,46.8833,21.5833),(862,3715,'Gesztely',4,48.1033,20.9667),(863,4232,'Geszteréd',15,47.7667,21.7833),(864,8762,'Gétye',19,46.7667,17.0667),(865,8435,'Gic',18,47.4333,17.7667),(866,7527,'Gige',14,46.2977,17.6167),(867,7954,'Gilvánfa',2,45.9167,17.9667),(868,3578,'Girincs',4,47.9667,20.9833),(869,8346,'Gógánfa',18,47.0167,17.1833),(870,3906,'Golop',4,48.2333,40.01),(871,2217,'Gomba',13,47.3667,19.5333),(872,8984,'Gombosszeg',19,46.75,16.7333),(873,9625,'Gór',17,47.3667,40.01),(874,7853,'Gordisa',2,45.7964,18.2333),(875,8978,'Gosztola',19,46.5833,16.5333),(876,2131,'Göd',13,47.6904,19.1333),(877,2100,'Gödöllő',13,47.5969,19.3667),(878,7385,'Gödre',2,46.2833,17.9833),(879,7272,'Gölle',14,46.4333,18.0167),(880,3728,'Gömörszőlős',4,48.3833,20.4333),(881,3895,'Gönc',4,48.4667,21.2833),(882,3894,'Göncruszka',4,48.45,21.25),(883,9071,'Gönyű',7,47.7333,17.8333),(884,4075,'Görbeháza',8,47.8333,21.2333),(885,7833,'Görcsöny',2,45.9694,18.1358),(886,7728,'Görcsönydoboka',2,46.0667,18.6333),(887,7553,'Görgeteg',14,46.15,17.4333),(888,8913,'Gősfa',19,46.9667,16.8667),(889,7162,'Grábóc',16,46.2833,18.6167),(890,4842,'Gulács',15,48.0833,22.4667),(891,8951,'Gutorfölde',19,46.6414,16.7383),(892,2360,'Gyál',13,47.3833,19.2333),(893,9474,'Gyalóka',7,47.45,40.01),(894,9774,'Gyanógeregye',17,47.1167,16.7667),(895,8545,'Gyarmat',7,47.4667,40.01),(896,8851,'Gyékényes',14,46.2378,17.0053),(897,8315,'Gyenesdiás',19,46.7667,17.2833),(898,8473,'Gyepükaján',18,47.1428,17.3333),(899,2821,'Gyermely',11,47.5882,18.65),(900,7668,'Gyód',2,45.9958,18.1786),(901,5500,'Gyomaendrőd',3,46.9333,20.8333),(902,9363,'Gyóró',7,47.4902,17.0167),(903,9124,'Gyömöre',7,47.4969,17.5667),(904,2230,'Gyömrő',13,47.4167,19.3997),(905,7954,'Gyöngyfa',2,45.9667,17.95),(906,3200,'Gyöngyös',9,47.7833,19.9333),(907,9724,'Gyöngyösfalu',17,47.3167,16.5833),(908,3212,'Gyöngyöshalász',9,47.7333,19.9333),(909,7972,'Gyöngyösmellék',2,45.9833,40.01),(910,3211,'Gyöngyösoroszi',9,47.8333,40.01),(911,3035,'Gyöngyöspata',9,47.8167,40.01),(912,3231,'Gyöngyössolymos',9,47.8167,19.9333),(913,3036,'Gyöngyöstarján',9,47.8105,19.8667),(914,7064,'Gyönk',16,46.55,18.4833),(915,9000,'Győr',7,47.6076,17.7819),(916,9093,'Győrasszonyfa',7,47.4948,40.01),(917,7352,'Györe',16,46.2927,40.01),(918,3954,'Györgytarló',4,48.2043,21.6667),(919,7045,'Györköny',16,46.6333,40.01),(920,9173,'Győrladamér',7,47.75,17.5667),(921,4625,'Győröcske',15,48.3833,22.15),(922,9084,'Győrság',7,47.5667,17.75),(923,9161,'Győrsövényház',7,47.6876,17.3667),(924,9121,'Győrszemere',7,47.55,17.5667),(925,4752,'Győrtelek',15,47.9333,22.4333),(926,9081,'Győrújbarát',7,47.5955,17.65),(927,9171,'Győrújfalu',7,47.7167,17.6167),(928,9821,'Győrvár',17,46.9878,16.8417),(929,9172,'Győrzámoly',7,47.7333,17.5833),(930,8692,'Gyugy',14,46.6833,17.6833),(931,5700,'Gyula',3,46.6474,21.2773),(932,4545,'Gyulaháza',15,48.1333,22.1167),(933,7227,'Gyulaj',16,46.5037,40.01),(934,8286,'Gyulakeszi',18,46.8667,17.4833),(935,2464,'Gyúró',6,47.3833,18.7333),(936,4733,'Gyügye',15,47.9333,22.5667),(937,4813,'Gyüre',15,48.1833,22.2833),(938,8932,'Gyűrűs',19,46.8833,40.01),(939,8694,'Hács',14,46.65,17.6833),(940,8992,'Hagyárosbörönd',19,46.9093,16.7167),(941,8771,'Hahót',19,46.6425,16.9236),(942,4273,'Hajdúbagos',8,47.392,21.6667),(943,4220,'Hajdúböszörmény',8,47.6667,21.5167),(944,4087,'Hajdúdorog',8,47.8167,40.01),(945,4242,'Hajdúhadház',8,47.6833,21.6667),(946,4080,'Hajdúnánás',8,47.85,21.4333),(947,4251,'Hajdúsámson',8,47.3919,21.7667),(948,4200,'Hajdúszoboszló',8,47.4467,21.3924),(949,4212,'Hajdúszovát',8,47.3833,21.4833),(950,7473,'Hajmás',14,46.2833,17.9167),(951,8192,'Hajmáskér',18,47.15,18.0167),(952,6344,'Hajós',1,46.3986,19.1206),(953,9814,'Halastó',17,46.95,40.01),(954,9228,'Halászi',7,47.8833,17.3333),(955,2314,'Halásztelek',13,47.3667,18.9833),(956,8452,'Halimba',18,47.0333,17.5333),(957,3842,'Halmaj',4,48.25,21.01),(958,3273,'Halmajugra',9,47.7667,20.0667),(959,9917,'Halogy',17,46.9667,16.5667),(960,3795,'Hangács',4,48.2892,20.8333),(961,3626,'Hangony',4,48.2333,40.01),(962,2434,'Hantos',6,47.0001,40.01),(963,9784,'Harasztifalu',17,47.0482,16.55),(964,7172,'Harc',16,46.399,18.6333),(965,9422,'Harka',7,47.6333,40.01),(966,6136,'Harkakötöny',1,46.45,40.01),(967,7815,'Harkány',2,45.8478,18.2375),(968,7585,'Háromfa',14,46.1021,17.3333),(969,3936,'Háromhuta',4,48.3833,21.4333),(970,3555,'Harsány',4,47.9667,20.75),(971,8442,'Hárskút',18,47.1833,17.8167),(972,6326,'Harta',1,46.6936,19.0314),(973,7745,'Hásságy',2,46.0333,18.3833),(974,3000,'Hatvan',9,47.6667,19.6833),(975,9178,'Hédervár',7,47.8333,17.4667),(976,7533,'Hedrehely',14,46.1833,17.6667),(977,8296,'Hegyesd',18,46.9167,17.5167),(978,9222,'Hegyeshalom',7,47.9167,17.1667),(979,9631,'Hegyfalu',17,47.35,16.8833),(980,9915,'Hegyháthodász',17,46.9333,16.65),(981,7348,'Hegyhátmaróc',2,46.3167,18.3333),(982,9915,'Hegyhátsál',17,46.9667,16.65),(983,9934,'Hegyhátszentjakab',17,46.8661,16.5547),(984,9931,'Hegyhátszentmárton',17,46.9333,16.4833),(985,9821,'Hegyhátszentpéter',17,46.9833,16.8167),(986,9437,'Hegykő',7,47.6167,40.01),(987,8265,'Hegymagas',18,46.8333,17.4333),(988,3786,'Hegymeg',4,48.3333,20.8667),(989,7837,'Hegyszentmárton',2,45.9039,40.01),(990,3041,'Héhalom',12,47.7791,40.01),(991,3892,'Hejce',4,48.4333,21.2833),(992,3593,'Hejőbába',4,47.9077,20.95),(993,3597,'Hejőkeresztúr',4,47.9667,20.8833),(994,3588,'Hejőkürt',4,47.8667,21.01),(995,3594,'Hejőpapi',4,47.8949,20.9167),(996,3595,'Hejőszalonta',4,47.9333,20.8833),(997,7683,'Helesfa',2,46.0833,17.9833),(998,6034,'Helvécia',1,46.8333,19.6167),(999,4123,'Hencida',8,47.25,40.01),(1000,7532,'Hencse',14,46.1954,17.6333),(1001,2053,'Herceghalom',13,47.4966,18.75),(1002,3958,'Hercegkút',4,48.3333,21.5333),(1003,6525,'Hercegszántó',1,45.95,18.9392),(1004,3011,'Heréd',9,47.7052,19.6333),(1005,2832,'Héreg',11,47.65,18.5167),(1006,2677,'Herencsény',12,47.9833,19.4833),(1007,8440,'Herend',18,47.1333,17.75),(1008,7587,'Heresznye',14,46.0553,17.2833),(1009,4735,'Hermánszeg',15,47.9046,22.6333),(1010,2376,'Hernád',13,47.1667,19.4333),(1011,3853,'Hernádbűd',4,48.2969,21.1333),(1012,3887,'Hernádcéce',4,48.35,40.01),(1013,3563,'Hernádkak',4,48.0833,20.9667),(1014,3846,'Hernádkércs',4,48.25,40.01),(1015,3564,'Hernádnémeti',4,48.0667,20.9833),(1016,3874,'Hernádpetri',4,48.4833,21.1667),(1017,3852,'Hernádszentandrás',4,48.2833,40.01),(1018,3875,'Hernádszurdok',4,48.4833,21.2167),(1019,3874,'Hernádvécse',4,48.45,21.1667),(1020,8957,'Hernyék',19,46.65,16.65),(1021,3655,'Hét',4,48.2833,20.3833),(1022,4843,'Hetefejércse',15,48.1167,22.4833),(1023,7432,'Hetes',14,46.4167,40.01),(1024,7681,'Hetvehely',2,46.1333,40.01),(1025,8344,'Hetyefő',18,47.0452,17.1667),(1026,3360,'Heves',9,47.5919,20.2833),(1027,3322,'Hevesaranyos',9,48.0167,20.2333),(1028,3383,'Hevesvezekény',9,47.55,20.3667),(1029,8380,'Hévíz',19,46.7833,17.1667),(1030,2192,'Hévízgyörk',13,47.6333,19.5167),(1031,7696,'Hidas',2,46.2667,40.01),(1032,3876,'Hidasnémeti',4,48.4988,21.2333),(1033,8247,'Hidegkút',18,47.0001,17.8333),(1034,9491,'Hidegség',7,47.6333,16.75),(1035,3768,'Hidvégardó',4,48.5667,20.85),(1036,7735,'Himesháza',2,46.0833,18.5667),(1037,9362,'Himod',7,47.5167,17.0167),(1038,7838,'Hirics',2,45.8167,18.01),(1039,7971,'Hobol',2,46.0167,17.7667),(1040,4334,'Hodász',15,47.9167,22.2167),(1041,6800,'Hódmezővásárhely',5,46.4167,20.3333),(1042,8731,'Hollád',14,46.6333,17.3167),(1043,3999,'Hollóháza',4,48.55,21.4167),(1044,3176,'Hollókő',12,48.0001,40.01),(1045,8563,'Homokbödöge',18,47.3032,40.01),(1046,8777,'Homokkomárom',19,465023,16.9167),(1047,6341,'Homokmégy',1,46.4869,19.0744),(1048,7537,'Homokszentgyörgy',14,46.1167,17.5833),(1049,7716,'Homorúd',2,45.9814,18.7922),(1050,3812,'Homrogd',4,48.2833,20.9167),(1051,2647,'Hont',12,48.05,19.01),(1052,2658,'Horpács',12,48.0001,19.1333),(1053,3014,'Hort',9,47.6897,19.7833),(1054,4071,'Hortobágy',8,47.5833,21.1667),(1055,7935,'Horváthertelend',2,46.1667,17.9167),(1056,9796,'Horvátlövő',17,47.1833,16.45),(1057,9733,'Horvátzsidány',17,47.4167,16.6167),(1058,7694,'Hosszúhetény',2,46.15,18.35),(1059,4274,'Hosszúpályi',8,47.3903,21.75),(1060,9676,'Hosszúpereszteg',17,470940,17.0167),(1061,8716,'Hosszúvíz',14,46.5167,17.45),(1062,8777,'Hosszúvölgy',19,46.5167,16.9333),(1063,8475,'Hosztót',18,47.0833,17.25),(1064,8991,'Hottó',19,46.85,16.75),(1065,7191,'Hőgyész',16,46.4833,18.4167),(1066,9361,'Hövej',7,47.55,17.0167),(1067,2672,'Hugyag',12,48.0833,19.4333),(1068,5555,'Hunya',3,46.8167,20.85),(1069,5063,'Hunyadfalva',10,47.3167,20.3833),(1070,7678,'Husztót',2,46.1667,18.0833),(1071,7935,'Ibafa',2,46.15,17.9167),(1072,8984,'Iborfia',19,46.7333,16.75),(1073,4484,'Ibrány',15,48.1333,21.7167),(1074,7275,'Igal',14,46.5333,17.95),(1075,7015,'Igar',6,46.7833,18.5167),(1076,3459,'Igrici',4,47.8667,20.8833),(1077,8726,'Iharos',14,46.3333,40.01),(1078,8725,'Iharosberény',14,46.3667,17.1167),(1079,9756,'Ikervár',17,47.2081,40.01),(1080,2181,'Iklad',13,47.6667,19.45),(1081,9634,'Iklanberény',17,47.4167,40.01),(1082,8958,'Iklódbördőce',19,46.6033,16.6167),(1083,9141,'Ikrény',7,47.65,17.5333),(1084,2675,'Iliny',12,48.0333,19.4333),(1085,4566,'Ilk',15,48.1167,22.2333),(1086,7775,'Illocska',2,45.8003,18.5225),(1087,3724,'Imola',4,48.4167,20.55),(1088,6238,'Imrehegy',1,46.4833,19.3167),(1089,3851,'Ináncs',4,48.2833,21.0667),(1090,2365,'Inárcs',13,47.2667,19.3333),(1091,8724,'Inke',14,46.3932,40.01),(1092,7847,'Ipacsfa',2,45.8347,18.2033),(1093,2631,'Ipolydamásd',13,47.85,18.8333),(1094,3138,'Ipolytarnóc',12,48.2333,19.6333),(1095,2633,'Ipolytölgyes',13,47.9167,18.7833),(1096,2669,'Ipolyvece',12,48.0667,19.1167),(1097,7095,'Iregszemcse',16,46.694,18.1833),(1098,3786,'Irota',4,48.3965,20.8833),(1099,2117,'Isaszeg',13,47.5333,40.01),(1100,9941,'Ispánk',17,46.8667,16.45),(1101,3253,'Istenmezeje',9,48.0833,40.01),(1102,7987,'Istvándi',14,46.0167,17.6333),(1103,8043,'Iszkaszentgyörgy',6,47.2333,40.01),(1104,8493,'Iszkáz',18,47.1667,40.01),(1105,8045,'Isztimér',6,47.2833,40.01),(1106,3248,'Ivád',9,48.0167,20.0667),(1107,9374,'Iván',7,47.45,16.9167),(1108,7772,'Ivánbattyán',2,45.9072,18.4181),(1109,9931,'Ivánc',17,46.9333,40.01),(1110,2454,'Iváncsa',6,47.15,18.8167),(1111,7781,'Ivándárda',2,45.8306,18.5903),(1112,7353,'Izmény',16,46.3167,18.4167),(1113,6070,'Izsák',1,46.8014,19.3547),(1114,3741,'Izsófalva',4,48.3969,20.6667),(1115,7362,'Jágónak',16,46.3167,18.0833),(1116,9798,'Ják',17,47.1333,16.5833),(1117,6078,'Jakabszállás',1,46.7603,19.6072),(1118,9643,'Jákfa',17,47.3333,16.9667),(1119,3721,'Jákfalva',4,48.3333,20.5833),(1120,7525,'Jákó',14,46.3333,17.55),(1121,4841,'Jánd',15,48.1167,22.3833),(1122,4741,'Jánkmajtis',15,47.95,22.65),(1123,6440,'Jánoshalma',1,46.2986,19.3258),(1124,9545,'Jánosháza',17,47.1167,17.1667),(1125,5143,'Jánoshida',10,47.3833,20.0667),(1126,9241,'Jánossomorja',7,48.3947,17.1167),(1127,3664,'Járdánháza',4,48.15,20.25),(1128,4337,'Jármi',15,47.9667,22.25),(1129,8424,'Jásd',18,47.2833,18.0333),(1130,5124,'Jászágó',10,47.5872,19.8667),(1131,5054,'Jászalsószentgyörgy',10,47.3667,40.01),(1132,5130,'Jászapáti',10,47.5167,20.15),(1133,5123,'Jászárokszállás',10,47.6333,19.9833),(1134,5100,'Jászberény',10,47.4985,19.9167),(1135,5144,'Jászboldogháza',10,47.3667,20.01),(1136,5122,'Jászdózsa',10,47.5667,20.0167),(1137,5111,'Jászfelsőszentgyörgy',10,47.5064,40.01),(1138,5126,'Jászfényszaru',10,47.5667,19.7167),(1139,5135,'Jászivány',10,47.5333,20.25),(1140,5121,'Jászjákóhalma',10,47.5167,20.01),(1141,2746,'Jászkarajenő',13,47.0497,20.0667),(1142,5137,'Jászkisér',10,47.45,20.2167),(1143,5055,'Jászladány',10,47.3667,20.1667),(1144,5136,'Jászszentandrás',10,47.5833,20.1833),(1145,6133,'Jászszentlászló',1,46.5681,19.7611),(1146,5141,'Jásztelek',10,47.4833,20.01),(1147,4611,'Jéke',15,48.2333,22.1667),(1148,8146,'Jenő',6,47.1036,18.25),(1149,9323,'Jobaháza',7,47.5833,40.01),(1150,3063,'Jobbágyi',12,47.8333,19.6833),(1151,3758,'Jósvafő',4,48.4833,20.5667),(1152,7431,'Juta',14,47.1035,17.75),(1153,4183,'Kaba',8,47.35,21.2833),(1154,8773,'Kacorlak',19,46.5667,16.9667),(1155,3424,'Kács',4,47.95,20.6167),(1156,7940,'Kacsóta',2,46.0333,17.95),(1157,7530,'Kadarkút',14,46.2333,17.6333),(1158,9123,'Kajárpéc',7,47.4833,17.6333),(1159,2472,'Kajászó',6,47.3167,18.7333),(1160,7051,'Kajdacs',16,46.5667,18.6333),(1161,7122,'Kakasd',16,46.35,40.01),(1162,7958,'Kákics',2,45.9025,17.8528),(1163,2366,'Kakucs',13,47.25,19.3667),(1164,3350,'Kál',9,47.7333,20.2667),(1165,7194,'Kalaznó',16,46.4996,18.4833),(1166,9673,'Káld',17,47.1667,40.01),(1167,2175,'Kálló',12,47.75,40.01),(1168,8785,'Kallósd',19,46.8667,17.0667),(1169,4324,'Kállósemjén',15,47.8667,21.9333),(1170,7538,'Kálmáncsa',14,46.0667,17.6167),(1171,4434,'Kálmánháza',15,47.8833,21.5833),(1172,8988,'Kálócfa',19,46.75,16.5667),(1173,6300,'Kalocsa',1,46.5339,18.9861),(1174,8124,'Káloz',6,46.95,18.4833),(1175,9841,'Kám',17,47.1034,16.8833),(1176,8469,'Kamond',18,47.1333,40.01),(1177,5673,'Kamut',3,46.7667,20.9833),(1178,3735,'Kánó',4,48.4333,40.01),(1179,4335,'Kántorjánosi',15,47.9333,22.15),(1180,3821,'Kány',4,48.5167,21.0167),(1181,8667,'Kánya',14,46.6959,18.0667),(1182,8956,'Kányavár',19,46.5667,16.6833),(1183,8294,'Kapolcs',18,46.95,17.6167),(1184,3355,'Kápolna',9,47.7667,20.25),(1185,2475,'Kápolnásnyék',6,47.2333,18.6833),(1186,8671,'Kapoly',14,46.7333,17.9667),(1187,7523,'Kaposfő',14,46.3667,17.6667),(1188,7473,'Kaposgyarmat',14,46.2833,17.8833),(1189,7261,'Kaposhomok',14,46.3667,17.9167),(1190,7258,'Kaposkeresztúr',14,46.3333,17.9667),(1191,7521,'Kaposmérő',14,46.3667,17.7167),(1192,7251,'Kapospula',16,46.3524,18.0143),(1193,7361,'Kaposszekcső',16,46.3333,18.1333),(1194,7476,'Kaposszerdahely',14,46.3167,17.75),(1195,7522,'Kaposújlak',14,46.3667,17.7333),(1196,7400,'Kaposvár',14,46.3667,17.7971),(1197,8471,'Káptalanfa',18,47.0667,17.35),(1198,8283,'Káptalantóti',18,46.85,17.5167),(1199,9330,'Kapuvár',7,47.5812,17.0333),(1200,7285,'Kára',14,46.6167,18.0167),(1201,3281,'Karácsond',9,47.7333,20.0333),(1202,8676,'Karád',14,46.6833,17.85),(1203,9547,'Karakó',17,47.1167,40.01),(1204,8491,'Karakószörcsök',18,47.1333,17.2833),(1205,3181,'Karancsalja',12,48.1333,19.75),(1206,3137,'Karancsberény',12,48.1833,19.75),(1207,3183,'Karancskeszi',12,48.1667,40.01),(1208,3182,'Karancslapujtő',12,48.15,19.7333),(1209,3163,'Karancsság',12,48.1167,19.6667),(1210,7333,'Kárász',2,46.2667,18.3167),(1211,5300,'Karcag',10,47.3167,20.9333),(1212,3963,'Karcsa',4,48.3167,40.01),(1213,5552,'Kardos',3,46.8167,20.7708),(1214,5945,'Kardoskút',3,46.4833,20.6667),(1215,8354,'Karmacs',19,46.8333,17.1833),(1216,3962,'Karos',4,48.3333,21.75),(1217,2173,'Kartal',13,47.6667,19.55),(1218,7827,'Kásád',2,45.7783,18.3989),(1219,6211,'Kaskantyú',1,46.6667,40.01),(1220,7977,'Kastélyosdombó',14,45.9544,17.6133),(1221,5948,'Kaszaper',3,46.4667,20.8333),(1222,7564,'Kaszó',14,46.3542,17.4333),(1223,7914,'Katádfa',2,46.0001,17.8667),(1224,9915,'Katafa',17,46.9833,16.6333),(1225,7661,'Kátoly',2,46.0667,18.45),(1226,6455,'Katymár',1,46.0322,19.2108),(1227,2215,'Káva',13,47.35,19.5833),(1228,8994,'Kávás',19,46.8667,16.7167),(1229,3127,'Kazár',12,48.0478,19.8667),(1230,3700,'Kazincbarcika',4,48.25,20.6333),(1231,3831,'Kázsmárk',4,48.2833,20.9833),(1232,7274,'Kazsok',14,46.4833,17.9667),(1233,6237,'Kecel',1,46.5253,19.2519),(1234,2852,'Kecskéd',11,47.5167,18.3167),(1235,6000,'Kecskemét',1,46.8979,19.7833),(1236,8784,'Kehidakustány',19,46.85,40.01),(1237,4515,'Kék',15,48.1167,21.8833),(1238,4494,'Kékcse',15,48.25,40.01),(1239,3899,'Kéked',4,48.55,21.35),(1240,7661,'Kékesd',2,46.1011,18.4667),(1241,8254,'Kékkút',18,46.85,17.5667),(1242,6423,'Kelebia',1,46.1939,19.6119),(1243,9549,'Keléd',17,47.0833,17.1167),(1244,3728,'Kelemér',4,48.35,20.4333),(1245,6444,'Kéleshalom',1,46.3667,19.25),(1246,8714,'Kelevíz',14,46.5167,17.4167),(1247,4501,'Kemecse',15,48.0667,40.01),(1248,2638,'Kemence',13,48.0167,40.01),(1249,8931,'Kemendollár',19,46.9032,16.9667),(1250,8516,'Kemeneshőgyész',18,47.35,40.01),(1251,9553,'Kemeneskápolna',17,47.2083,17.1167),(1252,9522,'Kemenesmagasi',17,47.3333,17.2167),(1253,9511,'Kemenesmihályfa',17,47.2833,17.1167),(1254,9544,'Kemenespálfa',17,47.1333,17.1833),(1255,9517,'Kemenessömjén',17,47.2937,17.1333),(1256,9521,'Kemenesszentmárton',17,47.2907,17.1667),(1257,8518,'Kemenesszentpéter',18,47.4333,17.2333),(1258,8995,'Keménfa',19,46.8333,16.6333),(1259,7843,'Kémes',2,45.8242,18.1011),(1260,9923,'Kemestaródfa',17,47.0001,16.5167),(1261,7839,'Kemse',2,45.8167,17.9167),(1262,5331,'Kenderes',10,47.25,20.6833),(1263,9752,'Kenéz',17,47.2033,16.7833),(1264,3955,'Kenézlő',4,48.1974,21.5333),(1265,5083,'Kengyel',10,47.0833,20.3333),(1266,9514,'Kenyeri',17,47.3833,17.0833),(1267,9945,'Kercaszomor',17,46.7833,16.3667),(1268,7256,'Kercseliget',14,46.3333,18.0667),(1269,3396,'Kerecsend',9,47.7958,20.35),(1270,8745,'Kerecseny',19,46.6167,40.01),(1271,6041,'Kerekegyháza',1,46.9372,19.4781),(1272,8618,'Kereki',14,46.7928,17.9167),(1273,2882,'Kerékteleki',11,47.5167,17.9333),(1274,2144,'Kerepes',13,47.5333,19.2667),(1275,3821,'Keresztéte',4,48.496,20.95),(1276,8971,'Kerkabarabás',19,46.6833,16.5667),(1277,8973,'Kerkafalva',19,46.7667,40.01),(1278,8973,'Kerkakutas',19,46.7667,40.01),(1279,9944,'Kerkáskápolna',17,46.7833,16.4333),(1280,8874,'Kerkaszentkirály',19,46.4946,16.5833),(1281,8879,'Kerkateskánd',19,46.5833,16.5833),(1282,4912,'Kérsemjén',15,48.0167,22.4167),(1283,8492,'Kerta',18,47.1667,17.2833),(1284,5526,'Kertészsziget',3,47.15,21.0667),(1285,2616,'Keszeg',12,47.8333,19.25),(1286,3579,'Kesznyéten',4,47.9667,40.01),(1287,7062,'Keszőhidegkút',16,46.6167,18.4333),(1288,8360,'Keszthely',19,46.7658,17.2574),(1289,2517,'Kesztölc',11,47.7167,40.01),(1290,7668,'Keszü',2,46.0167,18.1833),(1291,2655,'Kétbodony',12,47.9333,19.2667),(1292,5741,'Kétegyháza',3,46.5333,21.1833),(1293,8713,'Kéthely',14,46.65,40.01),(1294,5411,'Kétpó',10,47.0833,20.4667),(1295,5674,'Kétsoprony',3,46.7167,20.8667),(1296,7975,'Kétújfalu',2,45.9669,17.01),(1297,9982,'Kétvölgy',17,46.8833,16.2167),(1298,7174,'Kéty',16,46.4333,18.5333),(1299,5744,'Kevermes',3,46.4167,21.1833),(1300,8774,'Kilimán',19,46.6333,40.01),(1301,9181,'Kimle',7,47.8333,17.3667),(1302,8044,'Kincsesbánya',6,47.25,18.2667),(1303,3657,'Királd',4,48.25,40.01),(1304,7953,'Királyegyháza',2,46.0001,17.9667),(1305,6911,'Királyhegyes',5,46.2667,20.6167),(1306,8195,'Királyszentistván',18,47.1085,40.01),(1307,8284,'Kisapáti',18,46.85,17.4667),(1308,2428,'Kisapostag',6,46.8941,18.9333),(1309,4921,'Kisar',15,48.0577,22.5167),(1310,7523,'Kisasszond',14,46.3333,17.6333),(1311,7954,'Kisasszonyfa',2,45.9467,18.0061),(1312,9133,'Kisbabot',7,47.55,17.4167),(1313,3046,'Kisbágyon',12,47.8167,19.5833),(1314,9062,'Kisbajcs',7,47.75,17.6833),(1315,7542,'Kisbajom',14,46.3034,40.01),(1316,7282,'Kisbárapáti',14,46.6005,17.8667),(1317,3075,'Kisbárkány',12,48.0167,19.6833),(1318,2870,'Kisbér',11,47.5008,18.0333),(1319,8693,'Kisberény',14,46.6333,17.6667),(1320,8477,'Kisberzseny',18,47.1067,17.2667),(1321,7391,'Kisbeszterce',2,46.2021,18.0333),(1322,9234,'Kisbodak',7,47.8947,17.4167),(1323,8925,'Kisbucsa',19,46.8167,16.95),(1324,7756,'Kisbudmér',2,45.9125,18.4475),(1325,3578,'Kiscsécs',4,47.9667,21.0167),(1326,8888,'Kiscsehi',19,46.5167,16.6667),(1327,8494,'Kiscsősz',18,47.1969,17.2833),(1328,7814,'Kisdér',2,45.9406,18.1281),(1329,7985,'Kisdobsza',2,46.0333,17.6667),(1330,5837,'Kisdombegyház',3,46.3667,40.01),(1331,7159,'Kisdorog',16,46.3833,40.01),(1332,2655,'Kisecset',12,47.9333,19.3167),(1333,9341,'Kisfalud',7,47.5167,40.01),(1334,3256,'Kisfüzes',9,47.9833,20.1333),(1335,8356,'Kisgörbő',19,46.9333,17.1667),(1336,7279,'Kisgyalán',14,46.4167,17.9833),(1337,3556,'Kisgyőr',4,48.0167,40.01),(1338,7391,'Kishajmás',2,46.2002,18.0833),(1339,7800,'Kisharsány',2,45.8586,18.3642),(1340,3161,'Kishartyán',12,48.0833,19.7167),(1341,7763,'Kisherend',2,45.9661,18.3297),(1342,4977,'Kishódos',15,47.9667,22.8333),(1343,3994,'Kishuta',4,48.45,21.4833),(1344,2948,'Kisigmánd',11,47.65,40.01),(1345,7773,'Kisjakabfalva',2,45.8958,18.4347),(1346,7766,'Kiskassa',2,45.9531,18.3978),(1347,3843,'Kiskinizs',4,48.25,40.01),(1348,7524,'Kiskorpád',14,46.35,17.6167),(1349,3384,'Kisköre',9,47.4978,40.01),(1350,6200,'Kiskőrös',1,46.6206,19.2886),(1351,6100,'Kiskunfélegyháza',1,46.7136,19.8522),(1352,6400,'Kiskunhalas',1,46.4314,19.4875),(1353,2340,'Kiskunlacháza',13,47.1893,19.0167),(1354,6120,'Kiskunmajsa',1,46.4903,19.74),(1355,8911,'Kiskutas',19,46.9167,40.01),(1356,8156,'Kisláng',6,46.9667,18.3833),(1357,4325,'Kisléta',15,47.8333,22.0167),(1358,7775,'Kislippó',2,45.8272,18.5297),(1359,8446,'Kislőd',18,47.15,17.6167),(1360,7356,'Kismányok',16,46.2667,18.4833),(1361,4126,'Kismarja',8,47.25,21.8333),(1362,2623,'Kismaros',13,47.8333,19.0333),(1363,4737,'Kisnamény',15,47.95,40.01),(1364,3264,'Kisnána',9,47.85,20.15),(1365,2165,'Kisnémedi',13,47.7333,40.01),(1366,7759,'Kisnyárád',2,46.0333,18.5667),(1367,2024,'Kisoroszi',13,47.8067,19.0167),(1368,4956,'Kispalád',15,48.0167,22.8333),(1369,8912,'Kispáli',19,46.9167,16.8167),(1370,8496,'Kispirit',18,47.1989,17.25),(1371,9936,'Kisrákos',17,46.8667,40.01),(1372,8756,'Kisrécse',19,46.501,17.0667),(1373,3965,'Kisrozvágy',4,48.35,21.95),(1374,3627,'Kissikátor',4,48.1906,20.1333),(1375,9555,'Kissomlyó',17,47.1333,40.01),(1376,6421,'Kisszállás',1,46.2783,19.4961),(1377,7082,'Kisszékely',16,46.6833,18.55),(1378,4963,'Kisszekeres',15,47.9667,22.6333),(1379,7841,'Kisszentmárton',2,45.8242,18.0242),(1380,8957,'Kissziget',19,46.6167,16.6667),(1381,8483,'Kisszőlős',18,47.1965,17.3333),(1382,7981,'Kistamási',2,46.0167,17.7333),(1383,7823,'Kistapolca',2,45.8219,18.3847),(1384,2143,'Kistarcsa',13,47.5333,19.2667),(1385,6760,'Kistelek',5,46.4725,19.9797),(1386,3553,'Kistokaj',4,47.1965,20.85),(1387,8868,'Kistolmács',19,46.4833,16.75),(1388,7068,'Kistormás',16,46.4982,18.5667),(1389,7768,'Kistótfalu',2,45.9075,18.3075),(1390,5310,'Kisújszállás',10,47.2167,20.7667),(1391,9772,'Kisunyom',17,47.15,16.65),(1392,4600,'Kisvárda',15,48.2167,22.0833),(1393,4811,'Kisvarsány',15,48.15,40.01),(1394,8341,'Kisvásárhely',19,47.0001,40.01),(1395,7381,'Kisvaszar',2,46.2833,18.2167),(1396,7183,'Kisvejke',16,46.3833,18.4167),(1397,6775,'Kiszombor',5,46.1833,20.4333),(1398,9733,'Kiszsidány',17,47.4167,16.65),(1399,6773,'Klárafalva',5,46.2167,20.3333),(1400,2898,'Kocs',11,47.6055,18.2167),(1401,2755,'Kocsér',13,47.0053,19.9114),(1402,7212,'Kocsola',16,46.5333,18.1833),(1403,4751,'Kocsord',15,47.95,22.3833),(1404,2243,'Kóka',13,47.4833,19.5833),(1405,4284,'Kokad',8,47.4063,21.95),(1406,8468,'Kolontár',18,47.0833,17.4833),(1407,4138,'Komádi',8,47.0001,40.01),(1408,2900,'Komárom',11,47.7333,18.1167),(1409,3765,'Komjáti',4,48.55,20.7667),(1410,7300,'Komló',2,16.834,18.2667),(1411,4765,'Komlódtótfalu',15,47.85,40.01),(1412,7582,'Komlósd',14,46.0167,17.3833),(1413,3937,'Komlóska',4,48.3333,21.4667),(1414,4622,'Komoró',15,48.3006,22.1167),(1415,3356,'Kompolt',9,47.7333,20.25),(1416,3775,'Kondó',4,48.1884,20.65),(1417,9943,'Kondorfa',17,46.895,16.4017),(1418,5553,'Kondoros',3,46.7667,40.01),(1419,9144,'Kóny',7,47.6333,17.3667),(1420,4133,'Konyár',8,47.3167,21.6667),(1421,9495,'Kópháza',7,47.6333,16.65),(1422,7094,'Koppányszántó',16,46.1908,18.1167),(1423,3886,'Korlát',4,48.3833,21.25),(1424,9113,'Koroncó',7,47.5966,17.5333),(1425,7841,'Kórós',2,45.8669,18.0844),(1426,2612,'Kosd',13,47.8098,19.1833),(1427,2625,'Kóspallag',13,47.8833,18.9333),(1428,4482,'Kótaj',15,48.0383,21.7167),(1429,7847,'Kovácshida',2,45.8342,18.1814),(1430,7678,'Kovácsszénája',2,46.1667,18.1167),(1431,3992,'Kovácsvágás',4,48.45,21.5333),(1432,3053,'Kozárd',12,47.9167,19.6167),(1433,7761,'Kozármisleny',2,46.0333,40.01),(1434,8988,'Kozmadombja',19,46.7667,16.55),(1435,7334,'Köblény',2,16862,40.01),(1436,9553,'Köcsk',17,47.1833,17.0833),(1437,7668,'Kökény',2,45.9969,18.2028),(1438,7530,'Kőkút',14,46.1833,17.5833),(1439,4965,'Kölcse',15,48.0492,22.7167),(1440,7052,'Kölesd',16,46.5167,18.5833),(1441,7717,'Kölked',2,45.9503,18.7078),(1442,7300,'Kömlő',9,16.834,18.2667),(1443,2853,'Kömlőd',11,47.55,18.2667),(1444,4622,'Kömörő',15,48.0291,22.1167),(1445,6134,'Kömpöc',1,46.4667,19.8667),(1446,9900,'Körmend',17,47.0167,40.01),(1447,2851,'Környe',11,47.55,18.3333),(1448,3577,'Köröm',4,47.9833,20.95),(1449,8617,'Kőröshegy',14,46.8333,17.9025),(1450,5516,'Körösladány',3,46.9667,21.0833),(1451,5539,'Körösnagyharsány',3,47.0001,21.65),(1452,5622,'Köröstarcsa',3,46.8833,21.0333),(1453,2745,'Kőröstetétlen',13,47.0973,20.0333),(1454,5536,'Körösújfalu',3,46.9667,40.01),(1455,4136,'Körösszakál',8,47.0167,40.01),(1456,4135,'Körösszegapáti',8,47.0333,21.6333),(1457,8152,'Kőszárhegy',6,47.0915,18.3333),(1458,9730,'Kőszeg',17,47.3833,16.55),(1459,9725,'Kőszegdoroszló',17,47.35,16.55),(1460,9739,'Kőszegpaty',17,47.3333,16.65),(1461,9725,'Kőszegszerdahely',17,47.3333,16.5167),(1462,8627,'Kötcse',14,46.75,17.8667),(1463,5725,'Kötegyán',3,46.7333,21.4833),(1464,5062,'Kőtelek',10,47.3333,20.45),(1465,8254,'Kővágóörs',18,46.85,40.01),(1466,7673,'Kővágószőlős',2,46.0833,18.1333),(1467,7675,'Kővágótőttős',2,46.0833,18.0833),(1468,6912,'Kövegy',5,46.2167,20.6833),(1469,8274,'Köveskál',18,46.8833,40.01),(1470,3821,'Krasznokvajda',4,48.4667,20.9833),(1471,2458,'Kulcs',6,47.0555,18.9167),(1472,6097,'Kunadacs',1,46.95,19.3167),(1473,5746,'Kunágota',3,46.4333,40.01),(1474,6435,'Kunbaja',1,46.0836,19.4278),(1475,6043,'Kunbaracs',1,46.9833,19.4167),(1476,5412,'Kuncsorba',10,47.1333,20.5667),(1477,6413,'Kunfehértó',1,46.35,19.4167),(1478,5340,'Kunhegyes',10,47.3667,20.6333),(1479,5321,'Kunmadaras',10,47.4333,40.01),(1480,6096,'Kunpeszér',1,47.0667,19.2833),(1481,6115,'Kunszállás',1,46.7667,19.75),(1482,5440,'Kunszentmárton',10,46.8333,20.2833),(1483,6090,'Kunszentmiklós',1,47.0333,19.1333),(1484,9184,'Kunsziget',7,47.7333,17.5167),(1485,8595,'Kup',18,47.25,17.4667),(1486,3813,'Kupa',4,48.3333,20.9167),(1487,7226,'Kurd',16,46.45,18.3167),(1488,3732,'Kurityán',4,48.3167,20.6333),(1489,8919,'Kustánszeg',19,46.7839,16.6875),(1490,7541,'Kutas',14,46.3333,17.45),(1491,3066,'Kutasó',12,47.95,19.55),(1492,6755,'Kübekháza',5,46.15,20.2833),(1493,8978,'Külsősárd',19,46.6333,40.01),(1494,9532,'Külsővat',18,47.2971,17.2333),(1495,8162,'Küngös',18,47.0667,18.1833),(1496,2541,'Lábatlan',11,47.75,40.01),(1497,7551,'Lábod',14,46.2041,17.45),(1498,3967,'Lácacséke',4,48.3667,40.01),(1499,7535,'Lad',14,46.15,17.65),(1500,6045,'Ladánybene',1,47.0333,19.45),(1501,3780,'Ládbesenyő',4,48.3423,20.7333),(1502,8136,'Lajoskomárom',6,46.85,18.35),(1503,6050,'Lajosmizse',1,47.0167,19.55),(1504,3786,'Lak',4,48.35,20.8667),(1505,8913,'Lakhegy',19,46.9333,16.8667),(1506,6065,'Lakitelek',1,46.8761,19.9889),(1507,7918,'Lakócsa',14,45.8964,17.6839),(1508,7759,'Lánycsók',2,46.0001,18.6333),(1509,7214,'Lápafő',16,46.5167,18.0667),(1510,7775,'Lapáncsa',2,45.8192,18.4978),(1511,4543,'Laskod',15,48.0511,40.01),(1512,8887,'Lasztonya',19,46.5667,16.7167),(1513,8681,'Látrány',14,46.75,17.75),(1514,8437,'Lázi',7,47.4634,17.825),(1515,2016,'Leányfalu',13,47.7167,19.0833),(1516,2518,'Leányvár',11,47.6833,18.7833),(1517,9155,'Lébény',7,47.7333,17.3833),(1518,2619,'Legénd',12,47.8833,19.3167),(1519,3904,'Legyesbénye',4,48.1667,21.15),(1520,3832,'Léh',4,48.2833,20.9833),(1521,3648,'Lénárddaróc',4,48.15,20.3833),(1522,8978,'Lendvadedes',19,46.5833,16.5167),(1523,8977,'Lendvajakabfa',19,46.6833,16.45),(1524,7184,'Lengyel',16,46.3786,18.4357),(1525,8693,'Lengyeltóti',14,46.6667,17.65),(1526,8960,'Lenti',19,46.6217,16.5392),(1527,8132,'Lepsény',6,47.0001,18.25),(1528,8318,'Lesencefalu',18,46.85,17.35),(1529,8319,'Lesenceistvánd',18,46.8667,17.35),(1530,8318,'Lesencetomaj',18,46.85,17.3667),(1531,4281,'Létavértes',8,47.3833,40.01),(1532,8868,'Letenye',19,46.4286,16.7306),(1533,2632,'Letkés',13,47.8833,18.7833),(1534,9221,'Levél',7,47.8892,40.01),(1535,4555,'Levelek',15,47.9667,40.01),(1536,8707,'Libickozma',14,46.5167,17.5333),(1537,8981,'Lickóvadamos',19,46.75,16.7667),(1538,7331,'Liget',2,46.2333,40.01),(1539,8782,'Ligetfalva',19,46.8333,17.0667),(1540,9233,'Lipót',7,47.8667,17.4667),(1541,7781,'Lippó',2,45.8628,18.57),(1542,7757,'Liptód',2,46.0423,18.5167),(1543,8888,'Lispeszentadorján',19,46.5333,40.01),(1544,8831,'Liszó',19,46.3667,40.01),(1545,8196,'Litér',18,47.1008,18.0167),(1546,3866,'Litka',4,48.45,21.0667),(1547,3186,'Litke',12,48.2167,40.01),(1548,9634,'Lócs',17,47.4028,16.8167),(1549,8425,'Lókút',18,47.2042,17.8667),(1550,4836,'Lónya',15,48.3167,22.2833),(1551,2309,'Lórév',13,47.1167,40.01),(1552,7761,'Lothárd',2,45.9989,18.3525),(1553,8228,'Lovas',18,47.0001,17.9667),(1554,8093,'Lovasberény',6,47.3117,18.55),(1555,7720,'Lovászhetény',2,46.1667,18.4833),(1556,8878,'Lovászi',19,46.55,16.5667),(1557,8553,'Lovászpatona',18,47.4333,17.6333),(1558,5743,'Lőkösháza',3,46.4333,21.2333),(1559,3021,'Lőrinci',9,47.7333,19.6833),(1560,9461,'Lövő',7,47.5088,16.7833),(1561,4633,'Lövőpetri',15,48.1833,40.01),(1562,3129,'Lucfalva',12,48.0333,40.01),(1563,3188,'Ludányhalászi',12,48.1333,19.5167),(1564,3274,'Ludas',9,47.7333,40.01),(1565,9723,'Lukácsháza',17,47.35,16.5833),(1566,8660,'Lulla',14,46.7833,18.0333),(1567,7838,'Lúzsok',2,45.8333,17.95),(1568,3909,'Mád',4,48.1888,21.2833),(1569,6456,'Madaras',1,46.055,19.2667),(1570,7026,'Madocsa',16,46.6833,18.9667),(1571,9169,'Maglóca',7,47.6667,17.2833),(1572,2234,'Maglód',13,47.45,19.3667),(1573,7342,'Mágocs',2,46.35,18.2333),(1574,4953,'Magosliget',15,48.0533,22.8667),(1575,4556,'Magy',15,47.9333,21.9833),(1576,8071,'Magyaralmás',6,47.2908,18.3333),(1577,7463,'Magyaratád',14,46.4667,40.01),(1578,5667,'Magyarbánhegyes',3,46.45,20.9667),(1579,7775,'Magyarbóly',2,45.8419,18.4914),(1580,6932,'Magyarcsanád',5,46.1667,20.6167),(1581,5838,'Magyardombegyház',3,46.3833,21.0667),(1582,7332,'Magyaregregy',2,46.25,18.3167),(1583,7441,'Magyaregres',14,46.45,17.7833),(1584,8973,'Magyarföld',19,46.7833,16.4167),(1585,3133,'Magyargéc',12,48.0833,19.6167),(1586,8517,'Magyargencs',18,47.3667,40.01),(1587,7394,'Magyarhertelend',2,46.1833,18.15),(1588,4137,'Magyarhomorog',8,47.0167,21.55),(1589,9346,'Magyarkeresztúr',7,47.5167,17.1667),(1590,7098,'Magyarkeszi',16,46.75,18.2333),(1591,9962,'Magyarlak',17,46.95,16.35),(1592,7925,'Magyarlukafa',2,46.1667,17.7667),(1593,7954,'Magyarmecske',2,45.95,17.9667),(1594,9909,'Magyarnádalja',17,47.0001,16.5333),(1595,2694,'Magyarnándor',12,47.9667,19.35),(1596,8449,'Magyarpolány',18,47.1667,17.55),(1597,7761,'Magyarsarlós',2,46.0333,18.3667),(1598,9912,'Magyarszecsőd',17,47.0333,16.65),(1599,7396,'Magyarszék',2,46.1931,40.01),(1600,8776,'Magyarszentmiklós',19,46.5344,16.9383),(1601,8776,'Magyarszerdahely',19,46.55,16.9333),(1602,9946,'Magyarszombatfa',17,46.7628,16.3467),(1603,7954,'Magyartelek',2,45.9333,17.9833),(1604,2339,'Majosháza',13,47.2667,19.01),(1605,7783,'Majs',2,45.9092,18.6003),(1606,2322,'Makád',13,47.0833,18.9333),(1607,3959,'Makkoshotyka',4,48.35,21.5167),(1608,3397,'Maklár',9,47.8028,20.4167),(1609,6900,'Makó',5,46.2167,20.4833),(1610,8533,'Malomsok',18,47.45,40.01),(1611,3434,'Mályi',4,48.0167,20.8333),(1612,3645,'Mályinka',4,48.15,40.01),(1613,4942,'Mánd',15,48.0001,22.6167),(1614,4644,'Mándok',15,48.3167,40.01),(1615,7304,'Mánfa',2,46.1667,18.25),(1616,2065,'Mány',6,47.5333,18.6667),(1617,7733,'Maráza',2,46.0667,18.5167),(1618,9534,'Marcalgergelyi',18,47.3167,17.2667),(1619,8700,'Marcali',14,46.5833,17.4167),(1620,8532,'Marcaltő',18,47.4333,17.3667),(1621,7817,'Márfa',2,45.86,18.1853),(1622,2527,'Máriahalom',11,47.6333,18.7167),(1623,9231,'Máriakálnok',7,47.8667,17.3167),(1624,7663,'Máriakéménd',2,46.0333,18.4667),(1625,2629,'Márianosztra',13,47.8667,18.8833),(1626,4326,'Máriapócs',15,47.8833,22.0333),(1627,3262,'Markaz',9,47.8167,20.0667),(1628,3075,'Márkháza',12,48.0167,19.7333),(1629,8441,'Márkó',18,47.1167,17.8167),(1630,7967,'Markóc',2,45.8667,17.7667),(1631,9164,'Markotabödöge',7,47.6833,17.3167),(1632,8888,'Maróc',19,46.55,16.6667),(1633,7960,'Marócsa',2,45.9167,17.8167),(1634,7774,'Márok',2,45.8736,18.5086),(1635,8976,'Márokföld',19,46.7167,16.45),(1636,4932,'Márokpapi',15,48.15,22.5167),(1637,6921,'Maroslele',5,46.2667,20.35),(1638,6636,'Mártély',5,46.4833,20.2167),(1639,5435,'Martfű',10,47.0167,20.2833),(1640,7720,'Martonfa',2,46.1167,18.3833),(1641,2462,'Martonvásár',6,47.3167,18.7833),(1642,3755,'Martonyi',4,48.4667,20.7667),(1643,4700,'Mátészalka',15,47.95,22.3333),(1644,6452,'Mátételke',1,46.1667,19.2833),(1645,3247,'Mátraballa',9,47.9833,20.0333),(1646,3246,'Mátraderecske',9,47.95,20.0833),(1647,3155,'Mátramindszent',12,47.9667,19.9333),(1648,3143,'Mátranovák',12,48.0333,19.9833),(1649,3142,'Mátraszele',12,48.0536,40.01),(1650,3235,'Mátraszentimre',9,47.9167,19.8833),(1651,3068,'Mátraszőlős',12,47.9667,19.6833),(1652,3145,'Mátraterenye',12,48.0333,19.95),(1653,3077,'Mátraverebély',12,47.9833,19.7833),(1654,8134,'Mátyásdomb',6,46.9167,18.35),(1655,7854,'Matty',2,45.7981,18.2661),(1656,4835,'Mátyus',15,48.2833,22.2833),(1657,7351,'Máza',2,46.2667,40.01),(1658,7695,'Mecseknádasd',2,46.2167,18.4667),(1659,7300,'Mecsekpölöske',2,46.2167,18.2167),(1660,9176,'Mecsér',7,47.796,17.4833),(1661,5663,'Medgyesbodzás',3,46.5167,20.9667),(1662,5666,'Medgyesegyháza',3,46.4962,21.0333),(1663,7057,'Medina',16,46.4667,18.65),(1664,9757,'Meggyeskovácsi',17,47.1667,16.8667),(1665,3718,'Megyaszó',4,48.1833,40.01),(1666,9754,'Megyehid',17,47.2167,16.8333),(1667,8348,'Megyer',18,47.0667,40.01),(1668,5726,'Méhkerék',3,46.7833,21.45),(1669,4975,'Méhtelek',15,47.9333,22.85),(1670,7344,'Mekényes',2,46.3833,18.3333),(1671,6449,'Mélykút',1,46.2111,19.3869),(1672,8271,'Mencshely',18,46.95,40.01),(1673,2235,'Mende',13,47.4167,19.45),(1674,3871,'Méra',4,48.35,21.15),(1675,7981,'Merenye',2,46.0667,40.01),(1676,9136,'Mérges',7,47.5979,17.45),(1677,4352,'Mérk',15,47.7833,22.3667),(1678,7453,'Mernye',14,46.5066,17.8333),(1679,9531,'Mersevát',17,47.2833,17.2167),(1680,9662,'Mesterháza',17,47.3667,16.8667),(1681,9551,'Mesteri',17,47.2167,17.0833),(1682,5452,'Mesterszállás',10,46.95,20.4333),(1683,3754,'Meszes',4,48.4333,40.01),(1684,9745,'Meszlen',17,47.3333,40.01),(1685,8716,'Mesztegnyő',14,46.5037,17.4333),(1686,5650,'Mezőberény',3,46.8167,21.0333),(1687,3450,'Mezőcsát',4,47.8167,20.9167),(1688,7434,'Mezőcsokonya',14,46.4333,17.65),(1689,7370,'Meződ',2,46.2833,40.01),(1690,2422,'Mezőfalva',6,46.9333,18.7667),(1691,5732,'Mezőgyán',3,46.8667,21.5333),(1692,5820,'Mezőhegyes',3,46.3167,20.8167),(1693,5453,'Mezőhék',10,47.0001,40.01),(1694,3441,'Mezőkeresztes',4,47.8333,40.01),(1695,8137,'Mezőkomárom',6,46.8333,18.2833),(1696,5800,'Mezőkovácsháza',3,46.4062,20.9167),(1697,3400,'Mezőkövesd',4,47.8167,20.5833),(1698,4641,'Mezőladány',15,48.2833,22.2167),(1699,8514,'Mezőlak',18,47.3333,17.3667),(1700,3443,'Mezőnagymihály',4,47.8167,20.7333),(1701,3421,'Mezőnyárád',4,47.8667,20.6833),(1702,9097,'Mezőörs',7,47.5667,17.8833),(1703,4118,'Mezőpeterd',8,47.1667,21.6167),(1704,4134,'Mezősas',8,47.1167,21.5667),(1705,3378,'Mezőszemere',9,47.75,20.5333),(1706,8133,'Mezőszentgyörgy',6,47.0001,18.2833),(1707,7017,'Mezőszilas',6,46.8167,18.4833),(1708,3375,'Mezőtárkány',9,47.7167,20.4833),(1709,5400,'Mezőtúr',10,47.0001,20.6333),(1710,3931,'Mezőzombor',4,48.15,21.2667),(1711,8825,'Miháld',19,46.45,17.1333),(1712,8341,'Mihályfa',19,46.9833,17.1833),(1713,3184,'Mihálygerge',12,48.1946,19.6333),(1714,8513,'Mihályháza',18,47.3042,17.3333),(1715,9342,'Mihályi',7,47.5167,40.01),(1716,7512,'Mike',14,46.2333,17.5333),(1717,2736,'Mikebuda',13,47.1667,19.6333),(1718,8949,'Mikekarácsonyfa',19,46.65,40.01),(1719,4271,'Mikepércs',8,47.45,21.6333),(1720,7286,'Miklósi',14,46.65,18.01),(1721,3344,'Mikófalva',9,48.0562,20.3167),(1722,3989,'Mikóháza',4,48.475,21.6167),(1723,9835,'Mikosszéplak',17,47.0333,16.9833),(1724,8917,'Milejszeg',19,46.7882,16.75),(1725,4948,'Milota',15,48.1032,22.7833),(1726,6630,'Mindszent',5,46.5333,40.01),(1727,7391,'Mindszentgodisa',2,46.2167,18.0667),(1728,8282,'Mindszentkálla',18,46.8667,17.55),(1729,8935,'Misefa',19,46.8048,16.9833),(1730,6343,'Miske',1,46.4417,19.0322),(1731,3500,'Miskolc',4,47.9804,20.9354),(1732,7065,'Miszla',16,46.6333,18.4833),(1733,2911,'Mocsa',11,47.6667,18.1833),(1734,2146,'Mogyoród',13,47.5954,19.25),(1735,2535,'Mogyorósbánya',11,47.7333,40.01),(1736,3893,'Mogyoróska',4,48.3833,21.3333),(1737,8042,'Moha',6,47.25,18.3333),(1738,7700,'Mohács',2,45.9931,18.6831),(1739,2698,'Mohora',12,47.9833,19.3333),(1740,8863,'Molnári',19,46.3833,16.8333),(1741,9912,'Molnaszecsőd',17,47.0456,16.6833),(1742,7981,'Molvány',2,46.0333,17.75),(1743,3812,'Monaj',4,48.3063,20.95),(1744,3905,'Monok',4,48.2167,21.15),(1745,2200,'Monor',13,47.35,19.45),(1746,3345,'Mónosbél',9,48.0333,20.35),(1747,8296,'Monostorapáti',18,46.9167,17.5667),(1748,4275,'Monostorpályi',8,47.3868,21.7833),(1749,8273,'Monoszló',18,46.902,17.65),(1750,7751,'Monyoród',2,46.0001,18.4833),(1751,8060,'Mór',6,47.3833,40.01),(1752,7165,'Mórágy',16,46.2167,18.65),(1753,6782,'Mórahalom',5,46.2194,19.8911),(1754,6132,'Móricgát',1,46.4915,19.7487),(1755,9131,'Mórichida',7,47.5167,17.4167),(1756,7257,'Mosdós',14,46.35,18.01),(1757,9200,'Mosonmagyaróvár',7,47.8667,17.2833),(1758,9154,'Mosonszentmiklós',7,47.7333,17.3833),(1759,9245,'Mosonszolnok',7,47.85,17.1833),(1760,7932,'Mozsgó',2,46.1167,17.85),(1761,7163,'Mőcsény',16,46.2667,40.01),(1762,7185,'Mucsfa',16,46.35,18.4167),(1763,7195,'Mucsi',16,46.4333,40.01),(1764,3744,'Múcsony',4,48.2667,20.6833),(1765,3552,'Muhi',4,47.9833,20.9333),(1766,8834,'Murakeresztúr',19,46.3522,16.8781),(1767,8868,'Murarátka',19,46.4531,16.01),(1768,8872,'Muraszemenye',19,46.4667,16.6167),(1769,7176,'Murga',16,46.4667,18.4833),(1770,5672,'Murony',3,46.7667,40.01),(1771,4911,'Nábrád',15,48.0001,22.45),(1772,8097,'Nadap',6,47.2667,18.6167),(1773,9915,'Nádasd',17,46.9636,16.6192),(1774,8145,'Nádasdladány',6,47.1333,18.25),(1775,4181,'Nádudvar',8,47.4167,21.1667),(1776,8674,'Nágocs',14,46.6667,17.9667),(1777,8521,'Nagyacsád',18,47.3667,17.3667),(1778,8484,'Nagyalásony',18,47.2333,17.35),(1779,4922,'Nagyar',15,48.0556,22.5667),(1780,7500,'Nagyatád',14,46.2167,17.3667),(1781,9063,'Nagybajcs',7,47.7667,40.01),(1782,7561,'Nagybajom',14,46.3833,17.5167),(1783,8821,'Nagybakónak',19,46.55,40.01),(1784,5668,'Nagybánhegyes',3,46.4667,40.01),(1785,6527,'Nagybaracska',1,46.0392,40.01),(1786,3641,'Nagybarca',4,48.25,20.5333),(1787,3075,'Nagybárkány',12,48.0001,40.01),(1788,8656,'Nagyberény',14,46.7977,18.1667),(1789,7255,'Nagyberki',14,46.3667,18.0167),(1790,2634,'Nagybörzsöny',13,47.9333,18.8333),(1791,7756,'Nagybudmér',2,45.9361,18.4456),(1792,9485,'Nagycenk',7,47.6016,40.01),(1793,7838,'Nagycsány',2,45.8667,17.95),(1794,3598,'Nagycsécs',4,47.9667,20.95),(1795,8628,'Nagycsepely',14,46.75,17.8333),(1796,4445,'Nagycserkesz',15,47.9667,21.5333),(1797,8554,'Nagydém',18,47.4333,17.6833),(1798,4823,'Nagydobos',15,48.0513,22.3167),(1799,7985,'Nagydobsza',2,46.0333,17.6667),(1800,7044,'Nagydorog',16,46.6333,18.6667),(1801,4355,'Nagyecsed',15,47.8667,40.01),(1802,6917,'Nagyér',5,46.3667,20.7333),(1803,8415,'Nagyesztergár',18,47.2833,40.01),(1804,3282,'Nagyfüged',9,47.6833,20.1167),(1805,9664,'Nagygeresd',17,47.3833,16.9167),(1806,8356,'Nagygörbő',19,46.9333,17.1833),(1807,8551,'Nagygyimót',18,47.3333,17.55),(1808,7343,'Nagyhajmás',2,46.3278,18.2944),(1809,4485,'Nagyhalász',15,48.1333,21.7667),(1810,7822,'Nagyharsány',2,45.8464,18.3922),(1811,4064,'Nagyhegyes',8,47.5167,21.4167),(1812,4977,'Nagyhódos',15,47.9667,22.85),(1813,3994,'Nagyhuta',4,48.4333,40.01),(1814,2942,'Nagyigmánd',11,47.6333,18.0833),(1815,5363,'Nagyiván',10,47.4833,20.9333),(1816,4320,'Nagykálló',15,47.8833,21.85),(1817,5751,'Nagykamarás',3,46.4667,21.1167),(1818,8800,'Nagykanizsa',19,46.4618,17.0102),(1819,8935,'Nagykapornak',19,46.8167,17.01),(1820,2425,'Nagykarácsony',6,46.8667,18.7833),(1821,2760,'Nagykáta',13,47.4167,19.75),(1822,4127,'Nagykereki',8,47.1833,40.01),(1823,0,'Nagykeresztúr',12,48.0347,19.7238),(1824,3844,'Nagykinizs',4,48.2333,21.0333),(1825,7092,'Nagykónyi',16,46.5833,40.01),(1826,7545,'Nagykorpád',14,46.2667,17.4667),(1827,2094,'Nagykovácsi',13,47.5833,18.8833),(1828,7741,'Nagykozár',2,46.0667,18.3333),(1829,3012,'Nagykökényes',9,47.7333,40.01),(1830,9784,'Nagykölked',17,47.0667,16.55),(1831,2750,'Nagykőrös',13,47.0333,19.7833),(1832,5065,'Nagykörű',10,47.2667,20.45),(1833,8911,'Nagykutas',19,46.9236,16.8078),(1834,6933,'Nagylak',5,46.1667,20.7167),(1835,8983,'Nagylengyel',19,46.7833,16.7667),(1836,3175,'Nagylóc',12,48.0333,19.5833),(1837,2435,'Nagylók',6,46.9667,18.6667),(1838,9482,'Nagylózs',7,47.5667,16.7833),(1839,6622,'Nagymágocs',5,46.5833,40.01),(1840,7355,'Nagymányok',16,46.2833,18.4667),(1841,2626,'Nagymaros',13,47.7833,18.9667),(1842,9913,'Nagymizdó',17,46.9833,16.6667),(1843,7784,'Nagynyárád',2,45.9433,18.5781),(1844,2645,'Nagyoroszi',12,48.0001,40.01),(1845,8912,'Nagypáli',19,46.9167,16.85),(1846,7731,'Nagypall',2,46.15,18.45),(1847,7912,'Nagypeterd',2,46.0482,40.01),(1848,8496,'Nagypirit',18,47.2008,17.2333),(1849,4173,'Nagyrábé',8,47.2003,21.3333),(1850,8746,'Nagyrada',19,46.6167,17.1167),(1851,9938,'Nagyrákos',17,46.8333,16.4667),(1852,8756,'Nagyrécse',19,46.4833,40.01),(1853,3214,'Nagyréde',9,47.7667,19.85),(1854,5463,'Nagyrév',10,46.95,20.15),(1855,3965,'Nagyrozvágy',4,48.3333,21.9167),(1856,2524,'Nagysáp',11,47.6833,40.01),(1857,9561,'Nagysimonyi',17,47.2667,17.0667),(1858,8739,'Nagyszakácsi',14,46.4833,17.3167),(1859,7085,'Nagyszékely',16,46.65,18.5333),(1860,4962,'Nagyszekeres',15,47.9667,22.6167),(1861,5931,'Nagyszénás',3,46.6833,20.6667),(1862,9072,'Nagyszentjános',7,47.7167,17.8833),(1863,7097,'Nagyszokoly',16,46.7167,18.2167),(1864,3398,'Nagytálya',9,47.8167,20.4167),(1865,2142,'Nagytarcsa',13,47.5333,19.2833),(1866,8562,'Nagytevel',18,47.2945,17.5667),(1867,9832,'Nagytilaj',17,46.9733,16.9653),(1868,7800,'Nagytótfalu',2,45.8639,18.3453),(1869,6612,'Nagytőke',5,47.2949,20.2833),(1870,3357,'Nagyút',9,47.7167,20.1667),(1871,4812,'Nagyvarsány',15,48.1667,22.2833),(1872,7912,'Nagyváty',2,46.0667,17.9333),(1873,8291,'Nagyvázsony',18,46.9833,40.01),(1874,7186,'Nagyvejke',16,46.3833,18.45),(1875,8065,'Nagyveleg',6,47.3667,18.1167),(1876,2421,'Nagyvenyim',6,46.9667,18.85),(1877,3349,'Nagyvisnyó',9,48.1333,20.4333),(1878,7215,'Nak',16,46.4833,18.0667),(1879,4552,'Napkor',15,47.9333,21.8833),(1880,9797,'Nárai',17,47.1922,16.5667),(1881,9793,'Narda',17,47.2333,16.4667),(1882,2899,'Naszály',11,47.6973,18.2667),(1883,3463,'Négyes',4,47.6999,20.7167),(1884,3646,'Nekézseny',4,48.1667,20.4333),(1885,8923,'Nemesapáti',19,46.8667,16.95),(1886,3592,'Nemesbikk',4,47.8833,20.9667),(1887,4942,'Nemesborzova',15,47.9833,22.6333),(1888,9749,'Nemesbőd',17,47.2667,16.7333),(1889,8371,'Nemesbük',19,46.8167,17.15),(1890,9739,'Nemescsó',17,47.35,16.6167),(1891,8722,'Nemesdéd',14,46.4333,17.25),(1892,8522,'Nemesgörzsöny',18,47.3924,17.3667),(1893,8284,'Nemesgulács',18,46.8333,17.4833),(1894,8471,'Nemeshany',18,47.0667,17.3667),(1895,8925,'Nemeshetés',19,46.8022,16.9167),(1896,7981,'Nemeske',2,46.0167,17.7167),(1897,9471,'Nemeskér',7,47.4833,40.01),(1898,9548,'Nemeskeresztúr',17,47.0924,40.01),(1899,8717,'Nemeskisfalud',14,46.4333,17.3667),(1900,9542,'Nemeskocs',17,47.2024,17.1833),(1901,9775,'Nemeskolta',17,47.15,16.7667),(1902,9663,'Nemesládony',17,47.3999,16.8833),(1903,9953,'Nemesmedves',17,47.0001,40.01),(1904,6345,'Nemesnádudvar',1,46.3356,19.0531),(1905,8976,'Nemesnép',19,46.7006,16.4625),(1906,8856,'Nemespátró',19,46.3167,17.0167),(1907,8915,'Nemesrádó',19,46.7833,17.01),(1908,9782,'Nemesrempehollós',17,47.0833,16.6833),(1909,8925,'Nemessándorháza',19,46.7833,16.95),(1910,9533,'Nemesszalók',18,47.2833,40.01),(1911,8925,'Nemesszentandrás',19,46.7667,16.95),(1912,8248,'Nemesvámos',18,47.0566,17.8833),(1913,8738,'Nemesvid',14,46.49,17.2667),(1914,8311,'Nemesvita',18,46.8167,17.3667),(1915,8581,'Németbánya',18,47.2167,17.65),(1916,8918,'Németfalu',19,46.8208,16.6736),(1917,7039,'Németkér',16,46.7167,18.7667),(1918,3152,'Nemti',12,48.0167,40.01),(1919,2544,'Neszmély',11,47.7333,18.3667),(1920,2618,'Nézsa',12,47.85,40.01),(1921,9652,'Nick',17,47.4019,17.0167),(1922,8706,'Nikla',14,46.5833,17.5167),(1923,2642,'Nógrád',12,47.9167,40.01),(1924,2691,'Nógrádkövesd',12,47.8667,19.3833),(1925,2675,'Nógrádmarcal',12,48.0333,40.01),(1926,3132,'Nógrádmegyer',12,48.0667,19.6333),(1927,2685,'Nógrádsáp',12,47.8333,19.35),(1928,3179,'Nógrádsipek',12,48.0167,40.01),(1929,3187,'Nógrádszakál',12,48.1833,19.5333),(1930,8591,'Nóráp',18,47.2667,17.4667),(1931,8456,'Noszlop',18,47.1833,17.4667),(1932,3325,'Noszvaj',9,47.9333,20.4833),(1933,8948,'Nova',19,46.6839,16.6839),(1934,3327,'Novaj',9,47.85,20.4833),(1935,3872,'Novajidrány',4,48.4023,21.1833),(1936,2610,'Nőtincs',12,47.8833,19.15),(1937,9096,'Nyalka',7,47.55,17.8167),(1938,8512,'Nyárád',18,47.2833,17.3667),(1939,2723,'Nyáregyháza',13,47.25,40.01),(1940,6032,'Nyárlőrinc',1,46.8622,19.8733),(1941,2712,'Nyársapát',13,47.0989,40.01),(1942,3433,'Nyékládháza',4,47.9833,20.8333),(1943,2536,'Nyergesújfalu',11,47.7667,18.55),(1944,3809,'Nyésta',4,48.3667,20.95),(1945,8612,'Nyim',14,46.8022,18.1167),(1946,4264,'Nyírábrány',8,47.55,22.0333),(1947,4262,'Nyíracsád',8,47.5995,21.9833),(1948,8454,'Nyirád',18,47.0001,17.45),(1949,4254,'Nyíradony',8,47.6833,21.9167),(1950,4300,'Nyírbátor',15,47.8333,22.1333),(1951,4372,'Nyírbéltek',15,47.697,22.1333),(1952,4361,'Nyírbogát',15,47.8006,22.0667),(1953,4511,'Nyírbogdány',15,48.0505,21.8833),(1954,4356,'Nyírcsaholy',15,47.9028,22.3333),(1955,4331,'Nyírcsászári',15,47.8667,22.1833),(1956,4332,'Nyírderzs',15,47.8928,22.1667),(1957,4400,'Nyíregyháza',15,47.95,21.7167),(1958,4362,'Nyírgelse',15,47.75,21.9833),(1959,4311,'Nyírgyulaj',15,47.8833,40.01),(1960,3997,'Nyíri',4,48.498,21.45),(1961,4535,'Nyíribrony',15,48.0167,21.9667),(1962,4541,'Nyírjákó',15,48.0333,22.0833),(1963,4544,'Nyírkarász',15,48.0942,22.1034),(1964,4333,'Nyírkáta',15,47.8667,22.2667),(1965,4537,'Nyírkércs',15,48.0167,40.01),(1966,4632,'Nyírlövő',15,48.2014,22.1833),(1967,4371,'Nyírlugos',15,47.69,22.0446),(1968,4564,'Nyírmada',15,48.0667,40.01),(1969,4263,'Nyírmártonfalva',8,47.5833,40.01),(1970,4722,'Nyírmeggyes',15,47.9167,22.2667),(1971,4363,'Nyírmihálydi',15,47.7333,21.9833),(1972,4822,'Nyírparasznya',15,48.0333,22.2833),(1973,4531,'Nyírpazony',15,47.9833,40.01),(1974,4376,'Nyírpilis',15,47.7833,22.1833),(1975,4522,'Nyírtass',15,48.1167,22.0333),(1976,4461,'Nyírtelek',15,48.0167,21.6333),(1977,4554,'Nyírtét',15,48.0167,21.9333),(1978,4532,'Nyírtura',15,48.0167,21.8333),(1979,4341,'Nyírvasvári',15,47.8167,22.1833),(1980,3795,'Nyomár',4,48.2833,20.8167),(1981,9682,'Nyőgér',17,47.1833,16.9333),(1982,7912,'Nyugotszenterzsébet',2,46.0833,17.9167),(1983,9082,'Nyúl',7,47.5833,17.6833),(1984,7695,'Óbánya',2,46.2167,18.4167),(1985,0,'Óbarok',6,47.489,18.574),(1986,8272,'Óbudavár',18,46.9333,40.01),(1987,2364,'Ócsa',13,47.2892,19.2333),(1988,7814,'Ócsárd',2,45.9342,18.1519),(1989,7695,'Ófalu',2,46.2167,18.5333),(1990,4558,'Ófehértó',15,47.9333,40.01),(1991,6923,'Óföldeák',5,46.2955,20.45),(1992,8342,'Óhid',19,46.9667,17.1833),(1993,5534,'Okány',3,46.8959,21.35),(1994,7957,'Okorág',2,45.9167,17.8833),(1995,7681,'Okorvölgy',2,46.15,18.0667),(1996,7745,'Olasz',2,46.0167,18.4167),(1997,9824,'Olaszfa',17,47.0167,16.8833),(1998,8414,'Olaszfalu',18,47.2333,17.9167),(1999,3933,'Olaszliszka',4,48.25,21.4333),(2000,4826,'Olcsva',15,48.0833,22.3333),(2001,4914,'Olcsvaapáti',15,48.0833,22.35),(2002,7824,'Old',2,45.7881,18.3522),(2003,9733,'Ólmod',17,47.4167,40.01),(2004,8886,'Oltárc',19,46.5272,16.8372),(2005,3562,'Onga',4,48.1167,20.9167),(2006,3551,'Ónod',4,48.0001,20.9167),(2007,4821,'Ópályi',15,48.0001,22.3167),(2008,6767,'Ópusztaszer',5,46.4833,20.0833),(2009,8935,'Orbányosfa',19,46.85,16.9833),(2010,7400,'Orci',14,46.4059,17.8667),(2011,8635,'Ordacsehi',14,46.7333,17.6167),(2012,6335,'Ordas',1,46.6333,18.95),(2013,9982,'Orfalu',17,46.8833,16.2833),(2014,7677,'Orfű',2,46.1333,18.15),(2015,6077,'Orgovány',1,46.7486,19.4736),(2016,8983,'Ormándlak',19,46.75,16.75),(2017,3743,'Ormosbánya',4,48.35,20.65),(2018,5900,'Orosháza',3,46.5667,20.6667),(2019,8458,'Oroszi',18,47.15,17.4167),(2020,2840,'Oroszlány',11,47.4833,18.3167),(2021,7370,'Oroszló',2,46.2167,18.1333),(2022,8744,'Orosztony',19,46.6333,17.0667),(2023,8954,'Ortaháza',19,46.6167,16.6833),(2024,9354,'Osli',7,47.6333,17.0833),(2025,9512,'Ostffyasszonyfa',17,47.3167,40.01),(2026,3326,'Ostoros',9,47.8667,20.4333),(2027,9825,'Oszkó',17,47.0333,16.8833),(2028,3591,'Oszlár',4,47.8833,21.0333),(2029,7444,'Osztopán',14,46.5167,17.6667),(2030,3600,'Ózd',4,48.2167,20.2909),(2031,7836,'Ózdfalu',2,45.9292,18.0217),(2032,8998,'Ozmánbük',19,46.9167,16.6833),(2033,7086,'Ozora',16,46.75,40.01),(2034,8292,'Öcs',18,47.0001,17.6167),(2035,7143,'Őcsény',16,46.3167,18.7667),(2036,5451,'Öcsöd',10,46.8969,20.3974),(2037,4755,'Ököritófülpös',15,47.9167,22.5167),(2038,9621,'Ölbő',17,47.2979,16.8667),(2039,4373,'Ömböly',15,47.702,22.2167),(2040,4336,'Őr',15,47.9833,40.01),(2041,2162,'Őrbottyán',13,47.6833,19.2667),(2042,6311,'Öregcsertő',1,46.5139,19.1117),(2043,8697,'Öreglak',14,46.6016,17.6167),(2044,2671,'Őrhalom',12,48.0833,19.4167),(2045,9933,'Őrimagyarósd',17,46.8883,16.5397),(2046,9941,'Őriszentpéter',17,46.8408,16.4294),(2047,2377,'Örkény',13,47.1333,19.4333),(2048,5222,'Örményes',10,47.1888,20.5833),(2049,5556,'Örménykút',3,46.85,20.7833),(2050,8854,'Őrtilos',14,46.2797,16.9294),(2051,8242,'Örvényes',18,46.9167,17.8167),(2052,2616,'Ősagárd',12,47.8667,40.01),(2053,8161,'Ősi',18,47.15,40.01),(2054,8191,'Öskü',18,47.1667,18.0833),(2055,9153,'Öttevény',7,47.7333,17.4833),(2056,6784,'Öttömös',5,46.2833,19.6833),(2057,7511,'Ötvöskónyi',14,46.2167,17.3667),(2058,3964,'Pácin',4,48.3333,21.8333),(2059,8761,'Pacsa',19,46.7167,17.0167),(2060,9823,'Pácsony',17,47.0167,16.8667),(2061,8935,'Padár',19,46.85,17.0167),(2062,6075,'Páhi',1,46.7167,40.01),(2063,8956,'Páka',19,46.5894,16.6506),(2064,8799,'Pakod',19,46.9667,17.01),(2065,8095,'Pákozd',6,47.2167,18.55),(2066,7030,'Paks',16,46.6333,18.8667),(2067,7370,'Palé',2,46.2667,18.0667),(2068,7042,'Pálfa',16,46.7167,18.6333),(2069,8917,'Pálfiszeg',19,46.7833,16.7333),(2070,3994,'Pálháza',4,48.4667,21.5167),(2071,9345,'Páli',7,47.4667,17.1667),(2072,7771,'Palkonya',2,45.8967,18.3897),(2073,7561,'Pálmajor',14,46.3833,17.5667),(2074,6112,'Pálmonostora',1,46.6278,19.9422),(2075,7727,'Palotabozsok',2,46.1333,18.65),(2076,3042,'Palotás',12,47.2423,20.226),(2077,8229,'Paloznak',18,46.9833,17.95),(2078,3821,'Pamlény',4,48.493,20.9333),(2079,8698,'Pamuk',14,46.55,17.65),(2080,2214,'Pánd',13,47.35,19.6333),(2081,9937,'Pankasz',17,46.8333,40.01),(2082,9090,'Pannonhalma',7,47.55,17.75),(2083,3898,'Pányok',4,48.5333,21.3667),(2084,4913,'Panyola',15,48.0405,22.399),(2085,4631,'Pap',15,48.2167,22.15),(2086,8500,'Pápa',18,47.3333,17.4667),(2087,8593,'Pápadereske',18,47.2914,17.4015),(2088,8596,'Pápakovácsi',18,47.2667,17.4833),(2089,8594,'Pápasalamon',18,47.2333,17.4333),(2090,8556,'Pápateszér',18,47.3833,40.01),(2091,8183,'Papkeszi',18,47.0833,18.0833),(2092,9515,'Pápoc',17,47.4167,17.1333),(2093,4338,'Papos',15,47.9833,22.25),(2094,7838,'Páprád',2,45.8925,18.0097),(2095,3240,'Parád',9,47.9167,20.0333),(2096,3242,'Parádsasvár',9,47.9167,19.9833),(2097,3777,'Parasznya',4,48.1667,20.65),(2098,4475,'Paszab',15,48.15,21.6833),(2099,3060,'Pásztó',12,47.9167,40.01),(2100,9311,'Pásztori',7,47.55,17.2667),(2101,8825,'Pat',19,46.4333,17.1833),(2102,2648,'Patak',12,48.0333,19.15),(2103,7463,'Patalom',14,46.45,17.9167),(2104,7922,'Patapoklosi',2,46.0667,17.75),(2105,7477,'Patca',14,46.2833,17.7167),(2106,8092,'Pátka',6,47.2833,40.01),(2107,7536,'Patosfa',14,46.1333,17.6667),(2108,4523,'Pátroha',15,48.1667,22.01),(2109,2668,'Patvarc',12,48.0667,19.35),(2110,2071,'Páty',13,47.5167,18.8333),(2111,4766,'Pátyod',15,47.8667,22.6167),(2112,2476,'Pázmánd',6,47.2833,18.6667),(2113,9085,'Pázmándfalu',7,47.5667,17.7833),(2114,2119,'Pécel',13,47.4833,19.35),(2115,9754,'Pecöl',17,47.2033,16.8333),(2116,7600,'Pécs',2,46.0967,18.2068),(2117,7951,'Pécsbagota',2,45.9903,18.0733),(2118,7766,'Pécsdevecser',2,45.9567,18.3842),(2119,8245,'Pécsely',18,46.95,17.7833),(2120,7762,'Pécsudvard',2,46.0167,18.2833),(2121,7720,'Pécsvárad',2,46.15,18.4167),(2122,7831,'Pellérd',2,46.0333,18.15),(2123,3381,'Pély',9,47.4833,20.35),(2124,2614,'Penc',13,47.8024,19.25),(2125,4267,'Penészlek',15,47.6333,22.15),(2126,8426,'Pénzesgyőr',18,47.2333,17.7833),(2127,4941,'Penyige',15,47.9833,22.5667),(2128,9099,'Pér',7,47.6167,40.01),(2129,2074,'Perbál',13,47.5886,18.7667),(2130,3853,'Pere',4,48.2833,21.1333),(2131,3821,'Perecse',4,48.4996,21.01),(2132,7664,'Pereked',2,46.0093,18.3833),(2133,9722,'Perenye',17,47.2865,16.5833),(2134,9734,'Peresznye',17,47.4333,16.65),(2135,9484,'Pereszteg',7,47.287,16.7333),(2136,2431,'Perkáta',6,47.0477,18.7903),(2137,3756,'Perkupa',4,48.4667,40.01),(2138,2637,'Perőcsény',13,48.0001,18.8667),(2139,7766,'Peterd',2,45.9742,18.3589),(2140,7582,'Péterhida',14,46.0167,17.3667),(2141,2209,'Péteri',13,47.3833,19.4167),(2142,3250,'Pétervására',9,48.0167,40.01),(2143,8105,'Pétfürdő',18,47.1667,18.1167),(2144,8921,'Pethőhenye',19,46.8833,16.9167),(2145,4542,'Petneháza',15,48.0667,22.0833),(2146,3023,'Petőfibánya',9,47.7667,19.7167),(2147,6113,'Petőfiszállás',1,46.6167,19.8333),(2148,9443,'Petőháza',7,47.5981,16.8969),(2149,9826,'Petőmihályfa',17,46.9833,16.7833),(2150,8984,'Petrikeresztúr',19,46.7333,16.7333),(2151,8866,'Petrivente',19,46.4333,16.85),(2152,7972,'Pettend',2,46.0001,40.01),(2153,3134,'Piliny',12,48.15,40.01),(2154,2721,'Pilis',13,47.2833,19.55),(2155,2097,'Pilisborosjenő',13,47.6167,19.01),(2156,2081,'Piliscsaba',13,47.6167,18.8333),(2157,2519,'Piliscsév',11,47.6833,18.8167),(2158,2080,'Pilisjászfalu',13,47.6042,18.8521),(2159,2028,'Pilismarót',11,47.7833,18.8833),(2160,2095,'Pilisszántó',13,47.6667,40.01),(2161,2084,'Pilisszentiván',13,47.6167,40.01),(2162,2098,'Pilisszentkereszt',13,47.6918,18.9047),(2163,2009,'Pilisszentlászló',13,47.7167,19.01),(2164,2085,'Pilisvörösvár',13,47.6167,18.9167),(2165,7084,'Pincehely',16,46.6833,18.45),(2166,9922,'Pinkamindszent',17,47.0333,16.4833),(2167,9481,'Pinnye',7,47.5833,16.7667),(2168,4375,'Piricse',15,47.7667,22.15),(2169,6414,'Pirtó',1,46.5167,19.4333),(2170,7838,'Piskó',2,45.8167,17.95),(2172,7756,'Pócsa',2,45.9097,18.4708),(2173,4125,'Pocsaj',8,47.2833,21.8167),(2174,2017,'Pócsmegyer',13,47.7167,40.01),(2175,4327,'Pócspetri',15,47.8833,22.01),(2176,7666,'Pogány',2,45.98,18.26),(2177,8728,'Pogányszentpéter',14,46.3833,17.0667),(2178,8932,'Pókaszepetk',19,46.9233,16.9683),(2179,7458,'Polány',14,46.55,17.7833),(2180,4090,'Polgár',8,47.8667,21.1167),(2181,8154,'Polgárdi',6,47.0506,18.3086),(2182,2019,'Pomáz',13,47.65,19.0333),(2183,4761,'Porcsalma',15,47.8833,22.5667),(2184,9796,'Pornóapáti',17,47.15,16.4667),(2185,3388,'Poroszló',9,47.65,20.6667),(2186,9612,'Porpác',17,47.25,40.01),(2187,8858,'Porrog',14,46.2833,17.0333),(2188,8858,'Porrogszentkirály',14,46.2833,40.01),(2189,8858,'Porrogszentpál',14,46.2833,17.0167),(2190,8986,'Pórszombat',19,46.7264,16.5781),(2191,8429,'Porva',18,47.3167,17.8167),(2192,9636,'Pósfa',17,47.3333,16.85),(2193,7977,'Potony',14,45.9303,17.6433),(2194,9324,'Potyond',7,47.55,17.1833),(2195,8929,'Pölöske',19,46.75,16.9333),(2196,8773,'Pölöskefő',19,46.6017,16.95),(2197,7142,'Pörböly',16,46.2047,18.8167),(2198,8956,'Pördefölde',19,46.5833,16.7167),(2199,8767,'Pötréte',19,46.6833,16.95),(2200,3925,'Prügy',4,48.0833,21.25),(2201,8291,'Pula',18,47.0001,17.65),(2202,8986,'Pusztaapáti',19,46.7667,16.6167),(2203,2658,'Pusztaberki',12,47.9667,19.1667),(2204,9373,'Pusztacsalád',7,47.4833,40.01),(2205,9739,'Pusztacsó',17,47.3333,16.6333),(2206,4565,'Pusztadobos',15,48.0667,22.2333),(2207,8946,'Pusztaederics',19,46.65,40.01),(2208,3995,'Pusztafalu',4,48.55,40.01),(2209,5919,'Pusztaföldvár',3,46.5333,40.01),(2210,7038,'Pusztahencse',16,46.5979,18.7167),(2211,8707,'Pusztakovácsi',14,46.5333,17.5833),(2212,8895,'Pusztamagyaród',19,46.6007,16.8333),(2213,6785,'Pusztamérges',5,46.3333,19.6833),(2214,8455,'Pusztamiske',18,47.0667,17.45),(2215,5125,'Pusztamonostor',10,47.55,40.01),(2216,5665,'Pusztaottlaka',3,46.55,20.9833),(2217,3874,'Pusztaradvány',4,48.4667,21.1333),(2218,2490,'Pusztaszabolcs',6,47.1333,18.7667),(2219,8619,'Pusztaszemes',14,46.7667,17.9333),(2220,8896,'Pusztaszentlászló',19,46.6369,16.8442),(2221,6769,'Pusztaszer',5,46.55,19.9833),(2222,2378,'Pusztavacs',13,47.1667,40.01),(2223,8066,'Pusztavám',6,47.4333,18.2333),(2224,2039,'Pusztazámor',13,47.4018,18.7833),(2225,3630,'Putnok',4,48.291,20.4333),(2226,9235,'Püski',7,47.8833,40.01),(2227,2682,'Püspökhatvan',13,47.7667,19.3667),(2228,4150,'Püspökladány',8,47.3167,21.1167),(2229,9776,'Püspökmolnári',17,47.09,16.796),(2230,2166,'Püspökszilágy',13,47.7333,19.3167),(2231,9313,'Rábacsanak',7,47.5333,40.01),(2232,9136,'Rábacsécsény',7,47.5833,17.4333),(2233,9961,'Rábagyarmat',17,46.9406,16.4286),(2234,9777,'Rábahidvég',17,47.0667,16.75),(2235,9344,'Rábakecöl',7,47.4333,17.1167),(2236,9142,'Rábapatona',7,47.6333,17.4833),(2237,9641,'Rábapaty',17,47.3026,16.9333),(2238,9146,'Rábapordány',7,47.5667,17.3333),(2239,9327,'Rábasebes',7,47.4333,17.2333),(2240,9316,'Rábaszentandrás',7,47.45,17.3333),(2241,9135,'Rábaszentmihály',7,47.5833,17.4333),(2242,9133,'Rábaszentmiklós',7,47.5333,17.4167),(2243,9322,'Rábatamási',7,47.5833,17.1667),(2244,9766,'Rábatöttös',17,47.125,16.8333),(2245,9165,'Rábcakapi',7,47.7085,17.2833),(2246,2459,'Rácalmás',6,47.0167,18.95),(2247,2465,'Ráckeresztúr',6,47.2667,18.8333),(2248,2300,'Ráckeve',13,47.1667,18.95),(2249,2613,'Rád',13,47.792,19.2333),(2250,7817,'Rádfalva',2,45.8597,18.1258),(2251,9784,'Rádóckölked',17,47.0833,40.01),(2252,3776,'Radostyán',4,48.1833,20.6667),(2253,3724,'Ragály',4,48.4066,20.5167),(2254,9224,'Rajka',7,48.0001,40.01),(2255,3825,'Rakaca',4,48.4667,40.01),(2256,3826,'Rakacaszend',4,48.4667,20.85),(2257,4465,'Rakamaz',15,48.1333,21.4667),(2258,5085,'Rákóczifalva',10,47.0833,20.2333),(2259,5084,'Rákócziújfalu',10,47.0667,20.2667),(2260,7464,'Ráksi',14,46.5167,17.9167),(2261,8973,'Ramocsa',19,46.7833,16.45),(2262,4536,'Ramocsaháza',15,48.0394,22.01),(2263,4756,'Rápolt',15,47.9167,22.5667),(2264,8300,'Raposka',18,46.8806,17.4362),(2265,3833,'Rásonysápberencs',4,48.3167,21.01),(2266,3908,'Rátka',4,48.2167,21.2333),(2267,9951,'Rátót',17,46.9667,16.4333),(2268,9091,'Ravazd',7,47.5167,17.75),(2269,3245,'Recsk',9,47.9333,20.1167),(2270,2886,'Réde',11,47.4333,17.9167),(2271,8978,'Rédics',19,46.6142,16.4775),(2272,3893,'Regéc',4,48.3888,21.35),(2273,7833,'Regenye',2,45.9692,18.1681),(2274,7193,'Regöly',16,46.5833,18.4167),(2275,6446,'Rém',1,46.2431,19.1461),(2276,2090,'Remeteszőlős',13,47.5599,18.8981),(2277,3559,'Répáshuta',4,48.0477,20.5333),(2278,9653,'Répcelak',17,47.4167,17.0167),(2279,9375,'Répceszemere',7,47.4333,16.9833),(2280,9623,'Répceszentgyörgy',17,47.35,16.85),(2281,9475,'Répcevis',7,47.45,16.6833),(2282,8977,'Resznek',19,46.6619,16.4792),(2283,9074,'Rétalap',7,47.6009,17.9167),(2284,4525,'Rétközberencs',15,48.2015,22.0167),(2285,2651,'Rétság',12,47.9333,19.1333),(2286,8253,'Révfülöp',18,46.8333,17.6333),(2287,3976,'Révleányvár',4,48.3167,40.01),(2288,8373,'Rezi',19,46.85,17.2167),(2289,3974,'Ricse',4,48.3333,21.9667),(2290,8348,'Rigács',18,47.0667,17.2167),(2291,8883,'Rigyác',19,46.4667,16.8667),(2292,3177,'Rimóc',12,48.0333,19.5333),(2293,7552,'Rinyabesenyő',14,46.1667,17.5167),(2294,7527,'Rinyakovácsi',14,46.2833,40.01),(2295,7513,'Rinyaszentkirály',14,46.15,40.01),(2296,7556,'Rinyaújlak',14,46.0833,17.4167),(2297,7584,'Rinyaújnép',14,46.0833,17.35),(2298,4563,'Rohod',15,48.0333,22.1333),(2299,8434,'Románd',18,47.4474,17.825),(2300,2654,'Romhány',12,47.9333,19.2667),(2301,7741,'Romonya',2,46.0833,18.35),(2302,7914,'Rózsafa',2,46.0167,17.8833),(2303,4971,'Rozsály',15,47.9167,40.01),(2304,3033,'Rózsaszentmárton',9,47.7833,19.75),(2305,9451,'Röjtökmuzsaj',7,47.55,16.8333),(2306,9954,'Rönök',17,46.9833,16.35),(2307,6758,'Röszke',5,46.1833,40.01),(2308,3733,'Rudabánya',4,48.3833,20.6333),(2309,3742,'Rudolftelep',4,48.3167,20.6833),(2310,9766,'Rum',17,47.1333,16.85),(2311,6786,'Ruzsa',5,46.2897,19.7544),(2312,3162,'Ságújfalu',12,48.1036,19.6833),(2313,8654,'Ságvár',14,46.8333,18.1167),(2314,3792,'Sajóbábony',4,48.1667,20.7333),(2315,3793,'Sajóecseg',4,48.1907,20.7833),(2316,3636,'Sajógalgóc',4,48.2943,20.5333),(2317,3576,'Sajóhidvég',4,48.0001,20.01),(2318,3720,'Sajóivánka',4,48.2667,20.5833),(2319,3773,'Sajókápolna',4,48.1935,20.6876),(2320,3720,'Sajókaza',4,48.2833,20.5833),(2321,3791,'Sajókeresztúr',4,48.1667,20.7833),(2322,3572,'Sajólád',4,48.0412,20.9052),(2323,3773,'Sajólászlófalva',4,48.1833,20.6833),(2324,3656,'Sajómercse',4,48.25,20.4167),(2325,3652,'Sajónémeti',4,48.2667,20.3833),(2326,3586,'Sajóörös',4,47.95,21.0333),(2327,3714,'Sajópálfala',4,48.1667,20.85),(2328,3573,'Sajópetri',4,48.0333,40.01),(2329,3653,'Sajópüspöki',4,48.2833,20.35),(2330,3712,'Sajósenye',4,48.1938,20.8333),(2331,3770,'Sajószentpéter',4,48.2167,20.7167),(2332,3599,'Sajószöged',4,47.95,21.01),(2333,3712,'Sajóvámos',4,48.1833,20.85),(2334,3656,'Sajóvelezd',4,48.2667,20.4667),(2335,9632,'Sajtoskál',17,47.403,16.8667),(2336,8256,'Salföld',18,46.8333,17.55),(2337,3100,'Salgótarján',12,48.1167,19.8167),(2338,9742,'Salköveskút',17,47.2929,16.6963),(2339,8995,'Salomvár',19,46.8489,16.6633),(2340,3425,'Sály',4,47.95,20.6667),(2341,7841,'Sámod',2,45.8544,18.0375),(2342,3074,'Sámsonháza',12,47.9833,19.7333),(2343,8824,'Sand',19,46.4167,17.1333),(2344,6762,'Sándorfalva',5,46.3667,40.01),(2345,7479,'Sántos',14,46.35,17.8833),(2346,4176,'Sáp',8,47.25,21.3667),(2347,4272,'Sáránd',8,47.4098,21.6333),(2348,3942,'Sárazsadány',4,48.2667,40.01),(2349,7000,'Sárbogárd',6,46.8833,18.6333),(2350,7014,'Sáregres',6,46.7833,40.01),(2351,9813,'Sárfimizdó',17,46.95,16.7167),(2352,8944,'Sárhida',19,46.75,16.85),(2353,2523,'Sárisáp',11,47.6833,18.6833),(2354,5720,'Sarkad',3,46.75,21.3833),(2355,5731,'Sarkadkeresztúr',3,47.4121,21.3833),(2356,8051,'Sárkeresztes',6,47.25,18.35),(2357,8125,'Sárkeresztúr',6,47.0001,18.55),(2358,8144,'Sárkeszi',6,47.1667,18.2833),(2359,8391,'Sármellék',19,46.7167,17.1667),(2360,7781,'Sárok',2,45.8411,18.6114),(2361,2433,'Sárosd',6,47.0391,18.65),(2362,3950,'Sárospatak',4,48.3167,21.5833),(2363,7145,'Sárpilis',16,46.25,18.75),(2364,4171,'Sárrétudvari',8,47.2333,40.01),(2365,9435,'Sarród',7,47.6333,16.8667),(2366,8126,'Sárszentágota',6,46.9667,18.5667),(2367,7047,'Sárszentlőrinc',16,46.6333,18.6167),(2368,8143,'Sárszentmihály',6,47.15,18.3333),(2369,3386,'Sarud',9,47.5833,40.01),(2370,9600,'Sárvár',17,47.255,16.944),(2371,7370,'Sásd',2,46.25,18.1167),(2372,8308,'Sáska',18,46.9333,17.4833),(2373,3659,'Sáta',4,48.1833,40.01),(2374,3980,'Sátoraljaújhely',4,48.3901,21.6667),(2375,7785,'Sátorhely',2,45.9408,18.6344),(2376,8732,'Sávoly',14,46.5833,17.2667),(2377,9789,'Sé',17,47.2333,16.5667),(2378,7562,'Segesd',14,46.35,17.35),(2379,7960,'Sellye',2,45.8747,17.8439),(2380,3809,'Selyeb',4,48.3333,20.9667),(2381,3974,'Semjén',4,48.35,21.9667),(2382,8862,'Semjénháza',19,46.3916,16.85),(2383,8788,'Sénye',19,46.8952,17.1333),(2384,4533,'Sényő',15,48.0001,21.8833),(2385,8111,'Seregélyes',6,47.1058,18.5833),(2386,3729,'Serényfalva',4,48.3167,40.01),(2387,8660,'Sérsekszőlős',14,46.7667,18.0167),(2388,8439,'Sikátor',18,47.4347,17.825),(2389,7800,'Siklós',2,45.8553,18.2986),(2390,7814,'Siklósbodony',2,45.9103,18.1203),(2391,7823,'Siklósnagyfalu',2,45.8197,18.3614),(2392,3881,'Sima',4,48.2961,21.3059),(2393,9633,'Simaság',17,47.4167,16.85),(2394,7474,'Simonfa',14,46.2833,17.8333),(2395,7081,'Simontornya',16,46.75,18.55),(2396,7171,'Sióagárd',16,46.3944,18.65),(2397,8600,'Siófok',14,46.9058,18.0485),(2398,8652,'Siójut',14,46.8833,18.1333),(2399,3332,'Sirok',9,47.9333,40.01),(2400,9671,'Sitke',17,47.2333,17.0333),(2401,9315,'Sobor',7,47.4833,17.3833),(2402,9112,'Sokorópátka',7,47.4833,40.01),(2403,6320,'Solt',1,46.7997,19.0161),(2404,6223,'Soltszentimre',1,46.7697,19.2831),(2405,6230,'Soltvadkert',1,46.5781,19.3958),(2406,8193,'Sóly',18,47.1333,18.0333),(2407,2083,'Solymár',13,47.5833,18.9333),(2408,8655,'Som',14,46.8037,18.15),(2409,7728,'Somberek',2,46.0833,18.6667),(2410,8478,'Somlójenő',18,47.1167,17.3667),(2411,8483,'Somlószőlős',18,47.1667,17.3667),(2412,8481,'Somlóvásárhely',18,47.1167,17.3833),(2413,8484,'Somlóvecse',18,47.1907,17.3539),(2414,7454,'Somodor',14,46.4833,17.85),(2415,7283,'Somogyacsa',14,46.5833,17.95),(2416,7922,'Somogyapáti',2,46.0833,17.75),(2417,7584,'Somogyaracs',14,46.0597,17.392),(2418,7452,'Somogyaszaló',14,46.45,17.8167),(2419,8684,'Somogybabod',14,46.6667,17.7833),(2420,8858,'Somogybükkösd',14,46.2979,17.01),(2421,8726,'Somogycsicsó',14,46.3167,17.1333),(2422,7284,'Somogydöröcske',14,46.5833,18.01),(2423,8666,'Somogyegres',14,46.6667,18.0333),(2424,8708,'Somogyfajsz',14,46.5167,17.5667),(2425,7455,'Somogygeszti',14,46.5167,17.7833),(2426,7925,'Somogyhárságy',2,46.1667,17.7833),(2427,7921,'Somogyhatvan',2,46.1167,17.7167),(2428,7443,'Somogyjád',14,46.4888,17.7185),(2429,8673,'Somogymeggyes',14,46.7167,17.9167),(2430,8733,'Somogysámson',14,46.5833,40.01),(2431,7435,'Somogysárd',14,46.4167,40.01),(2432,8737,'Somogysimonyi',14,46.4833,17.2167),(2433,8705,'Somogyszentpál',14,46.65,17.4833),(2434,7276,'Somogyszil',14,46.5167,18.01),(2435,7563,'Somogyszob',14,46.2913,17.2986),(2436,8683,'Somogytúr',14,46.7067,17.7667),(2437,7515,'Somogyudvarhely',14,46.1667,40.01),(2438,8699,'Somogyvámos',14,46.5667,17.6833),(2439,8698,'Somogyvár',14,46.5833,17.6667),(2440,7922,'Somogyviszló',2,46.1167,17.7667),(2441,8734,'Somogyzsitfa',14,46.5667,40.01),(2442,4954,'Sonkád',15,48.0538,22.75),(2443,8123,'Soponya',6,47.0167,18.45),(2444,9400,'Sopron',7,47.672,16.5852),(2445,9463,'Sopronhorpács',7,47.4833,16.7333),(2446,9483,'Sopronkövesd',7,47.55,16.75),(2447,9325,'Sopronnémeti',7,47.5333,17.2167),(2448,9774,'Sorkifalud',17,47.1333,16.7333),(2449,9774,'Sorkikápolna',17,47.1333,40.01),(2450,8881,'Sormás',19,46.45,16.9167),(2451,9773,'Sorokpolány',17,47.1333,16.6667),(2452,3131,'Sóshartyán',12,48.0667,19.6833),(2453,2038,'Sóskút',13,47.4052,18.8333),(2454,3716,'Sóstófalva',4,48.15,21.01),(2455,7960,'Sósvertike',2,45.8333,17.8667),(2456,9681,'Sótony',17,47.1959,16.95),(2457,8897,'Söjtör',19,46.6672,16.8583),(2458,9743,'Söpte',17,47.2833,16.65),(2459,8072,'Söréd',6,47.3167,18.2833),(2460,8096,'Sukoró',6,47.2333,18.6167),(2461,7960,'Sumony',2,45.9714,17.9058),(2462,2889,'Súr',11,47.3667,18.0333),(2463,8856,'Surd',19,46.3192,16.9706),(2464,6346,'Sükösd',1,46.2833,19.01),(2465,2241,'Sülysáp',13,47.45,19.5583),(2466,8330,'Sümeg',18,46.9833,17.2833),(2467,8357,'Sümegcsehi',19,46.95,17.2167),(2468,8351,'Sümegprága',18,46.9333,17.2833),(2469,2543,'Süttő',11,47.75,18.45),(2470,8151,'Szabadbattyán',6,47.1167,18.3833),(2471,2432,'Szabadegyháza',6,47.0667,18.6833),(2472,8138,'Szabadhidvég',6,46.8167,18.2833),(2473,7253,'Szabadi',14,46.3667,18.0333),(2474,5712,'Szabadkígyós',3,46.6167,40.01),(2475,6080,'Szabadszállás',1,46.8728,19.2242),(2476,7951,'Szabadszentkirály',2,46.0167,18.0333),(2477,7544,'Szabás',14,46.2833,17.45),(2478,4467,'Szabolcs',15,48.1833,18.2641),(2479,4547,'Szabolcsbáka',15,48.15,22.15),(2480,4496,'Szabolcsveresmart',15,48.2894,22.0167),(2481,2111,'Szada',13,47.6333,19.3167),(2482,7383,'Szágy',2,46.2333,17.95),(2483,7753,'Szajk',2,45.9906,18.5314),(2484,3334,'Szajla',9,47.9667,20.15),(2485,5081,'Szajol',10,47.1833,20.3013),(2486,3786,'Szakácsi',4,48.3833,20.8667),(2487,7071,'Szakadát',16,46.5333,18.4833),(2488,3596,'Szakáld',4,47.95,20.9167),(2489,7192,'Szakály',16,46.5333,18.3833),(2490,7213,'Szakcs',16,46.5133,40.01),(2491,6336,'Szakmár',1,46.5522,19.0742),(2492,9934,'Szaknyér',17,46.8667,16.5333),(2493,4234,'Szakoly',15,47.7667,21.9167),(2494,9474,'Szakony',7,47.4333,16.7167),(2495,9983,'Szakonyfalu',17,46.9167,16.2333),(2496,2856,'Szákszend',11,47.55,18.1667),(2497,9942,'Szalafő',17,46.8667,16.3667),(2498,7811,'Szalánta',2,45.9486,18.2375),(2499,8341,'Szalapa',19,46.9833,17.15),(2500,3863,'Szalaszend',4,48.3833,21.1333),(2501,7334,'Szalatnak',2,46.2833,18.2833),(2502,7121,'Szálka',16,46.2833,18.6333),(2503,6086,'Szalkszentmárton',1,46.9742,40.01),(2504,3163,'Szalmatercs',12,48.1167,19.6333),(2505,3754,'Szalonna',4,48.45,20.75),(2506,4767,'Szamosangyalos',15,47.8667,22.6667),(2507,4745,'Szamosbecs',15,47.8667,40.01),(2508,4721,'Szamoskér',15,48.0167,22.4167),(2509,4735,'Szamossályi',15,48.2892,22.6167),(2510,4824,'Szamosszeg',15,48.041,22.3667),(2511,4746,'Szamostatárfalva',15,47.8667,22.6667),(2512,4734,'Szamosújlak',15,47.9167,40.01),(2513,2697,'Szanda',12,47.9333,19.45),(2514,6131,'Szank',1,46.5544,19.6722),(2515,8622,'Szántód',14,46.8667,40.01),(2516,9317,'Szany',7,47.4667,40.01),(2517,8423,'Szápár',18,47.3167,18.0333),(2518,7843,'Szaporca',2,45.8136,18.1044),(2519,2066,'Szár',6,47.4833,18.5167),(2520,7184,'Szárász',2,46.3786,18.4357),(2521,7063,'Szárazd',16,46.5667,18.4333),(2522,9353,'Szárföld',7,47.5884,17.1167),(2523,2067,'Szárliget',11,47.4952,18.6095),(2524,5540,'Szarvas',3,46.8667,20.55),(2525,3051,'Szarvasgede',12,47.8167,19.65),(2527,5053,'Szászberek',10,47.3167,40.01),(2528,3821,'Szászfa',4,48.4667,20.95),(2529,7349,'Szászvár',2,46.2667,18.3667),(2530,4945,'Szatmárcseke',15,48.0833,22.6333),(2531,2656,'Szátok',12,47.95,19.2333),(2532,9938,'Szatta',17,46.7994,16.4833),(2533,6763,'Szatymaz',5,46.35,40.01),(2534,7813,'Szava',2,45.9022,18.1761),(2535,2440,'Százhalombatta',13,47.3333,18.9333),(2536,7725,'Szebény',2,46.1333,40.01),(2537,2692,'Szécsénke',12,47.9034,19.3333),(2538,3170,'Szécsény',12,48.0833,19.5167),(2539,3135,'Szécsényfelfalu',12,48.15,19.5667),(2540,8879,'Szécsisziget',19,46.5667,40.01),(2541,7751,'Szederkény',2,45.9969,18.4578),(2542,7056,'Szedres',16,46.4833,18.6833),(2543,6700,'Szeged',5,46.318,20.027),(2544,8732,'Szegerdő',14,46.6333,17.2833),(2545,5520,'Szeghalom',3,47.0333,21.1667),(2546,3918,'Szegi',4,48.1959,21.3833),(2547,3918,'Szegilong',4,48.2167,40.01),(2548,6635,'Szegvár',5,46.5833,20.2333),(2549,4534,'Székely',15,48.0667,21.95),(2550,7737,'Székelyszabar',2,46.0424,40.01),(2551,8000,'Székesfehérvár',6,47.1937,18.4166),(2552,6821,'Székkutas',5,46.5056,20.5333),(2553,7100,'Szekszárd',16,46.35,18.7167),(2554,9622,'Szeleste',17,47.3167,16.8333),(2555,5476,'Szelevény',10,46.8333,20.2833),(2556,7661,'Szellő',2,46.0667,18.4667),(2557,7763,'Szemely',2,46.0167,18.3333),(2558,9685,'Szemenye',17,47.101,16.9165),(2559,3866,'Szemere',4,48.4667,40.01),(2560,2640,'Szendehely',12,47.85,19.1167),(2561,3752,'Szendrő',4,48.404,20.7333),(2562,3751,'Szendrőlád',4,48.35,20.75),(2563,7477,'Szenna',14,46.3086,17.7333),(2564,8849,'Szenta',14,46.25,17.1833),(2565,8272,'Szentantalfa',18,46.9167,17.6833),(2566,7472,'Szentbalázs',14,46.3167,40.01),(2567,8281,'Szentbékkálla',18,46.8833,17.5667),(2568,7918,'Szentborbás',14,45.8833,17.6667),(2569,7913,'Szentdénes',2,46.0001,17.9333),(2570,3259,'Szentdomonkos',9,48.0667,40.01),(2571,2655,'Szente',12,47.9667,19.2833),(2572,7915,'Szentegát',2,45.9667,17.8333),(2573,2000,'Szentendre',13,47.6667,19.0833),(2574,6600,'Szentes',5,46.65,20.2667),(2575,8444,'Szentgál',18,47.1167,17.7333),(2576,7465,'Szentgáloskér',14,46.5013,17.8833),(2577,9970,'Szentgotthárd',17,46.9519,16.3256),(2578,8393,'Szentgyörgyvár',19,46.75,17.1333),(2579,8975,'Szentgyörgyvölgy',19,46.7244,16.4156),(2580,8475,'Szentimrefalva',18,47.0667,17.2833),(2581,3418,'Szentistván',4,47.7667,20.6667),(2582,3844,'Szentistvánbaksa',4,48.2167,21.0333),(2583,8272,'Szentjakabfa',18,46.9333,17.6667),(2584,7681,'Szentkatalin',2,46.1667,40.01),(2585,6031,'Szentkirály',1,46.9167,19.9333),(2586,8225,'Szentkirályszabadja',18,47.059,17.9667),(2587,8947,'Szentkozmadombja',19,46.6833,16.7667),(2588,7936,'Szentlászló',2,46.15,17.8333),(2589,8893,'Szentliszló',19,46.5756,16.8239),(2590,7940,'Szentlőrinc',2,46.0409,17.9833),(2591,2255,'Szentlőrinckáta',13,47.5167,19.75),(2592,8872,'Szentmargitfalva',19,46.4963,16.6667),(2593,2254,'Szentmártonkáta',13,47.45,40.01),(2594,9799,'Szentpéterfa',17,47.0912,16.4833),(2595,8953,'Szentpéterfölde',19,46.6167,16.7667),(2596,4121,'Szentpéterszeg',8,47.2333,21.6167),(2597,8762,'Szentpéterúr',19,46.7667,17.0333),(2598,8717,'Szenyér',14,46.4667,17.3833),(2599,8861,'Szepetnek',19,46.4308,16.905),(2600,8544,'Szerecseny',7,47.4667,17.55),(2601,6512,'Szeremle',1,46.15,18.8833),(2602,3900,'Szerencs',4,48.1667,40.01),(2603,4163,'Szerep',8,47.2333,21.15),(2604,9523,'Szergény',17,47.3167,17.2667),(2605,2321,'Szigetbecse',13,47.1333,18.95),(2606,2317,'Szigetcsép',13,47.2667,18.9833),(2607,2315,'Szigethalom',13,47.3333,19.01),(2608,2015,'Szigetmonostor',13,47.6833,19.1167),(2609,2318,'Szigetszentmárton',13,47.2333,18.9667),(2610,2310,'Szigetszentmiklós',13,47.35,40.01),(2611,2319,'Szigetújfalu',13,47.2333,18.9333),(2612,7900,'Szigetvár',2,46.0466,17.815),(2613,8264,'Szigliget',18,46.8008,17.4333),(2614,3377,'Szihalom',9,47.7667,20.4833),(2615,8969,'Szijártóháza',19,46.6333,16.45),(2616,3800,'Szikszó',4,48.1932,20.9333),(2617,9326,'Szil',7,47.5034,17.2333),(2618,7664,'Szilágy',2,46.1011,18.4167),(2619,3125,'Szilaspogony',12,48.1167,20.0333),(2620,9312,'Szilsárkány',7,47.55,17.2667),(2621,8986,'Szilvágy',19,46.7333,16.6333),(2622,7811,'Szilvás',2,45.9622,40.01),(2623,3348,'Szilvásvárad',9,48.1057,20.3906),(2624,7477,'Szilvásszentmárton',14,46.2667,17.7333),(2625,3761,'Szin',4,48.4955,20.6667),(2626,3761,'Szinpetri',4,48.4833,20.6333),(2627,3044,'Szirák',12,47.8333,19.5333),(2628,3711,'Szirmabesenyő',4,48.15,40.01),(2629,2628,'Szob',13,47.8167,18.8667),(2630,2624,'Szokolya',13,47.8667,19.0167),(2631,8625,'Szólád',14,46.7833,17.85),(2632,5000,'Szolnok',10,47.1833,40.01),(2633,9700,'Szombathely',17,47.2448,16.6168),(2634,2896,'Szomód',11,47.6833,18.35),(2635,3411,'Szomolya',4,47.8893,20.4997),(2636,2822,'Szomor',11,47.5833,18.6667),(2637,7285,'Szorosad',14,46.6009,18.0333),(2638,8452,'Szőc',18,47.0167,17.5167),(2639,9935,'Szőce',17,46.8833,16.5833),(2640,2134,'Sződ',13,47.7167,40.01),(2641,2133,'Sződliget',13,47.7333,19.15),(2642,3762,'Szögliget',4,48.5167,20.6833),(2643,7833,'Szőke',2,45.96,18.1858),(2644,7763,'Szőkéd',2,45.9667,18.2869),(2645,8736,'Szőkedencs',14,46.55,17.25),(2646,3757,'Szőlősardó',4,48.45,20.6333),(2647,8692,'Szőlősgyörök',14,46.7167,17.6833),(2648,7976,'Szörény',2,45.9667,17.6833),(2649,3341,'Szúcs',9,48.0468,20.25),(2650,3154,'Szuha',12,47.9833,19.9167),(2651,3726,'Szuhafő',4,48.4167,20.45),(2652,3731,'Szuhakálló',4,48.2833,20.6667),(2653,3734,'Szuhogy',4,48.3833,20.6833),(2654,7932,'Szulimán',2,46.1333,40.01),(2655,7539,'Szulok',14,46.0526,17.55),(2656,3064,'Szurdokpüspöki',12,47.85,19.6833),(2657,3034,'Szűcsi',9,47.798,19.7667),(2658,2699,'Szügy',12,48.0333,19.3333),(2659,7735,'Szűr',2,46.0991,18.5833),(2660,8660,'Tab',14,46.7333,18.0333),(2661,8088,'Tabajd',6,47.4003,18.6333),(2662,6224,'Tabdi',1,46.6833,40.01),(2663,2381,'Táborfalva',13,47.0833,19.4667),(2664,8121,'Tác',6,47.0833,40.01),(2665,8272,'Tagyon',18,46.9031,17.6833),(2666,2021,'Tahitótfalu',13,47.75,40.01),(2667,8541,'Takácsi',18,47.3956,17.4833),(2668,4845,'Tákos',15,48.15,22.4333),(2669,2335,'Taksony',13,47.3333,19.0833),(2670,3926,'Taktabáj',4,48.0667,21.3167),(2671,3922,'Taktaharkány',4,48.0833,21.1333),(2672,3924,'Taktakenéz',4,48.0483,21.2167),(2673,3921,'Taktaszada',4,48.1167,21.1833),(2674,8295,'Taliándörögd',18,46.9833,17.5667),(2675,3907,'Tállya',4,48.2333,21.2333),(2676,7090,'Tamási',16,46.6333,18.2833),(2677,9762,'Tanakajd',17,47.1844,16.7333),(2678,9095,'Táp',7,47.5167,17.8333),(2679,2764,'Tápióbicske',13,47.3667,19.6833),(2680,2767,'Tápiógyörgye',13,47.3333,19.95),(2681,2253,'Tápióság',13,47.1837,19.6167),(2682,2251,'Tápiószecső',13,47.45,40.01),(2683,2766,'Tápiószele',13,47.3333,19.8833),(2684,2711,'Tápiószentmárton',13,47.3333,19.75),(2685,2769,'Tápiószőlős',13,47.3017,19.85),(2686,9761,'Táplánszentkereszt',17,47.3003,19.8244),(2687,8300,'Tapolca',18,46.8833,17.4333),(2688,8718,'Tapsony',14,46.4667,17.3333),(2689,9094,'Tápszentmiklós',7,47.4925,17.85),(2690,3073,'Tar',12,47.95,19.75),(2691,7514,'Tarany',14,46.1833,17.3041),(2692,3915,'Tarcal',4,48.1333,21.35),(2693,3416,'Tard',4,47.8833,20.6167),(2694,3644,'Tardona',4,48.1667,20.5333),(2695,2834,'Tardos',11,47.6667,18.45),(2696,5641,'Tarhos',3,46.8167,21.2167),(2697,2831,'Tarján',11,47.6167,18.5167),(2698,9092,'Tarjánpuszta',7,47.5046,17.7833),(2699,2945,'Tárkány',11,47.5833,18.01),(2700,3369,'Tarnabod',9,47.6833,20.2333),(2701,4074,'Tarnalelesz',9,47.7708,21.2167),(2702,3284,'Tarnaméra',9,47.65,20.1667),(2703,3294,'Tarnaörs',9,47.66,40.01),(2704,3331,'Tarnaszentmária',9,47.8833,40.01),(2705,3382,'Tarnaszentmiklós',9,47.5333,20.3833),(2706,3283,'Tarnazsadány',9,47.6667,20.1667),(2707,2461,'Tárnok',13,47.3667,18.85),(2708,9165,'Tárnokréti',7,47.7167,17.3167),(2709,4931,'Tarpa',15,48.1025,22.5333),(2710,7362,'Tarrós',2,46.3056,18.1389),(2711,8696,'Táska',14,46.6167,17.5333),(2712,6098,'Tass',1,47.0167,19.0333),(2713,7261,'Taszár',14,46.3667,17.9167),(2714,2534,'Tát',11,47.75,18.65),(2715,2890,'Tata',11,47.65,18.3167),(2716,2800,'Tatabánya',11,47.5667,18.4167),(2717,6451,'Tataháza',1,46.1742,19.3061),(2718,2375,'Tatárszentgyörgy',13,47.0667,19.3833),(2719,6236,'Tázlár',1,46.5486,19.5203),(2720,4243,'Téglás',8,47.7167,21.6833),(2721,7381,'Tékes',2,46.2833,18.1667),(2722,7973,'Teklafalu',2,45.95,17.7333),(2723,9812,'Telekes',17,46.9389,16.7725),(2724,5675,'Telekgerendás',3,46.65,20.9667),(2725,8626,'Teleki',14,46.7667,17.8333),(2726,2089,'Telki',13,47.55,18.8333),(2727,3896,'Telkibánya',4,48.4833,21.3667),(2728,7054,'Tengelic',16,46.5333,18.7167),(2729,7834,'Tengeri',2,45.9261,18.0881),(2730,8668,'Tengőd',14,46.6997,18.1003),(2731,3359,'Tenk',9,47.65,20.35),(2732,9111,'Tényő',7,47.5333,17.65),(2733,4132,'Tépe',8,47.3167,21.5833),(2734,4342,'Terem',15,47.7941,22.3167),(2735,2696,'Terény',12,47.95,19.45),(2736,2652,'Tereske',12,47.95,40.01),(2737,3757,'Teresztenye',4,48.45,20.6167),(2738,3334,'Terpes',9,47.9667,20.15),(2739,8109,'Tés',18,47.2667,18.0333),(2740,2636,'Tésa',13,48.0333,18.85),(2741,7843,'Tésenfa',2,45.8131,18.1183),(2742,7834,'Téseny',2,45.9399,18.0885),(2743,8991,'Teskánd',19,46.8469,16.7758),(2744,9100,'Tét',7,47.5167,17.5167),(2745,4184,'Tetétlen',8,47.3167,40.01),(2746,7181,'Tevel',16,46.4167,18.45),(2747,3423,'Tibolddaróc',4,47.9167,20.6333),(2748,4353,'Tiborszállás',15,47.8167,22.4167),(2749,8237,'Tihany',18,46.9167,17.8898),(2750,8731,'Tikos',14,46.6333,40.01),(2751,8782,'Tilaj',19,46.8046,17.0459),(2752,4466,'Timár',15,48.1667,21.4667),(2753,2086,'Tinnye',13,47.6167,18.7833),(2754,4833,'Tiszaadony',15,48.2333,40.01),(2755,6066,'Tiszaalpár',1,46.8217,19.9842),(2756,3465,'Tiszabábolna',4,47.6833,20.8167),(2757,4951,'Tiszabecs',15,48.0981,22.8167),(2758,4474,'Tiszabercel',15,48.15,21.65),(2759,4624,'Tiszabezdéd',15,48.3667,22.15),(2760,5232,'Tiszabő',10,47.3019,20.4833),(2761,5235,'Tiszabura',10,47.45,20.4667),(2762,4947,'Tiszacsécse',15,48.1098,22.75),(2763,4066,'Tiszacsege',8,47.6983,21.01),(2764,3972,'Tiszacsermely',4,48.2333,21.7833),(2765,4455,'Tiszadada',15,48.0333,21.25),(2766,5243,'Tiszaderzs',10,47.5167,20.65),(2767,4456,'Tiszadob',15,48.0167,21.1667),(2768,3466,'Tiszadorogma',4,47.6833,20.8667),(2769,4464,'Tiszaeszlár',15,48.0327,21.4667),(2770,5430,'Tiszaföldvár',10,46.9833,20.25),(2771,5350,'Tiszafüred',10,47.6167,20.7667),(2772,5233,'Tiszagyenda',10,47.3833,20.5167),(2773,4097,'Tiszagyulaháza',8,47.95,21.15),(2774,5361,'Tiszaigar',10,47.5333,40.01),(2775,5464,'Tiszainoka',10,46.9027,20.15),(2776,5094,'Tiszajenő',10,47.0333,20.15),(2777,4493,'Tiszakanyár',15,48.25,21.9667),(2778,3971,'Tiszakarád',4,48.1942,21.7167),(2779,6060,'Tiszakécske',1,46.9333,40.01),(2780,4834,'Tiszakerecseny',15,48.2667,40.01),(2781,3458,'Tiszakeszi',4,47.7833,21.01),(2782,4946,'Tiszakóród',15,48.1069,22.7167),(2783,5471,'Tiszakürt',10,46.8833,20.1167),(2784,3929,'Tiszaladány',4,48.0667,21.4167),(2785,4450,'Tiszalök',15,48.0167,21.3833),(2786,3565,'Tiszalúc',4,48.0333,21.0833),(2787,4645,'Tiszamogyorós',15,48.3167,22.2333),(2788,4463,'Tiszanagyfalu',15,48.0933,21.4833),(2789,3385,'Tiszanána',9,47.5667,20.5333),(2790,5362,'Tiszaörs',10,47.5167,20.8333),(2791,3587,'Tiszapalkonya',4,47.8833,21.0667),(2792,5211,'Tiszapüspöki',10,47.2167,20.3167),(2793,4503,'Tiszarád',15,48.1167,40.01),(2794,5234,'Tiszaroff',10,47.3942,20.45),(2795,5474,'Tiszasas',10,46.8167,20.0833),(2796,5061,'Tiszasüly',10,47.3833,40.01),(2797,4831,'Tiszaszalka',15,48.1833,22.3167),(2798,5322,'Tiszaszentimre',10,47.4833,20.7333),(2799,4628,'Tiszaszentmárton',15,48.3833,22.2333),(2800,6756,'Tiszasziget',5,46.1667,20.1667),(2801,3928,'Tiszatardos',4,48.0385,21.3833),(2802,3589,'Tiszatarján',4,47.8333,21.0167),(2803,4487,'Tiszatelek',15,48.1893,40.01),(2804,5082,'Tiszatenyő',10,47.1333,20.3833),(2805,5473,'Tiszaug',1,46.8333,20.1542),(2806,3580,'Tiszaújváros',4,47.9333,21.0833),(2807,3464,'Tiszavalk',4,47.6833,20.75),(2808,5092,'Tiszavárkony',10,47.0667,20.1833),(2809,4440,'Tiszavasvári',15,47.9667,21.35),(2810,4832,'Tiszavid',15,48.1934,22.2991),(2811,4969,'Tisztaberek',15,47.95,40.01),(2812,4921,'Tivadar',15,48.0667,22.5167),(2813,2252,'Tóalmás',13,47.5167,19.6667),(2814,3354,'Tófalu',9,47.7833,20.25),(2815,8946,'Tófej',19,46.6703,16.8056),(2816,7348,'Tófű',2,46.3167,18.3667),(2817,3910,'Tokaj',4,48.1167,21.4167),(2818,2531,'Tokod',11,47.7167,18.6667),(2819,2532,'Tokodaltáró',11,47.7444,18.5972),(2820,9561,'Tokorcs',17,47.2667,40.01),(2821,3934,'Tolcsva',4,48.2833,21.45),(2822,4117,'Told',8,47.1167,21.65),(2823,2657,'Tolmács',12,47.9333,19.1333),(2824,7130,'Tolna',16,46.4333,18.7833),(2825,7083,'Tolnanémedi',16,46.7167,18.4833),(2826,5324,'Tomajmonostora',10,47.4333,20.7167),(2827,3787,'Tomor',4,48.3333,20.8833),(2828,6422,'Tompa',1,46.2178,19.5422),(2829,9662,'Tompaládony',17,47.3833,40.01),(2830,2463,'Tordas',6,47.35,18.75),(2831,8876,'Tormafölde',19,46.5386,16.5944),(2832,7383,'Tormás',2,46.2333,18.01),(2833,9736,'Tormásliget',17,47.3846,16.6321),(2834,3765,'Tornabarakony',4,48.4912,20.8167),(2835,3761,'Tornakápolna',4,48.4667,20.6167),(2836,3767,'Tornanádaska',4,48.5667,20.7833),(2837,3765,'Tornaszentandrás',4,48.5167,20.7833),(2838,3769,'Tornaszentjakab',4,48.5167,20.8833),(2839,8877,'Tornyiszentmiklós',19,46.515,16.5578),(2840,3877,'Tornyosnémeti',4,48.5167,21.2667),(2841,4642,'Tornyospálca',15,48.2667,22.1833),(2842,9791,'Torony',17,47.2333,16.5333),(2843,8660,'Torvaj',14,46.7667,40.01),(2844,5091,'Tószeg',10,47.0957,20.15),(2845,5940,'Tótkomlós',3,46.4167,20.7333),(2846,7981,'Tótszentgyörgy',2,46.0333,17.725),(2847,8865,'Tótszentmárton',19,46.4167,16.8167),(2848,8864,'Tótszerdahely',19,46.3992,16.7969),(2849,7918,'Tótújfalu',14,45.8994,17.6556),(2850,8246,'Tótvázsony',18,47.0167,17.7833),(2851,2073,'Tök',13,47.5667,18.7333),(2852,2316,'Tököl',13,47.3104,19.0021),(2853,9086,'Töltéstava',7,47.6167,17.7333),(2854,9738,'Tömörd',17,47.3667,16.6833),(2855,6646,'Tömörkény',5,46.6167,20.0333),(2856,2045,'Törökbálint',13,47.4333,18.9167),(2857,7285,'Törökkoppány',14,46.5986,18.0519),(2858,5200,'Törökszentmiklós',10,47.1833,20.4167),(2859,2747,'Törtel',13,47.1167,19.9333),(2860,7755,'Töttös',2,45.9156,18.5422),(2861,3724,'Trizs',4,48.4333,40.01),(2862,4731,'Tunyogmatolcs',15,47.9667,22.4667),(2863,2194,'Tura',13,47.6167,40.01),(2864,4944,'Túristvándi',15,48.0512,22.65),(2865,5420,'Túrkeve',10,47.1044,20.75),(2866,7811,'Túrony',2,45.9044,18.2317),(2867,4968,'Túrricse',15,47.9667,22.7667),(2868,4623,'Tuzsér',15,48.35,22.1333),(2869,8796,'Türje',19,46.9833,40.01),(2870,8477,'Tüskevár',18,47.1167,17.3167),(2871,4762,'Tyukod',15,47.85,22.55),(2872,7718,'Udvar',2,45.9006,18.6597),(2873,7066,'Udvari',16,46.5903,18.5167),(2874,8564,'Ugod',18,47.3167,40.01),(2875,2066,'Újbarok',6,47.4833,18.5667),(2876,3716,'Újcsanálos',4,48.1333,21.0167),(2877,4491,'Újdombrád',15,48.2333,21.9333),(2878,4244,'Újfehértó',15,47.7948,21.6833),(2879,2367,'Újhartyán',13,47.2167,19.3833),(2880,4146,'Újiráz',8,46.9833,21.3667),(2881,7095,'Újireg',16,46.65,18.1833),(2882,4635,'Újkenéz',15,48.25,22.2333),(2883,9472,'Újkér',7,47.4667,16.8167),(2884,5661,'Újkígyós',3,46.5833,21.0333),(2885,2724,'Újlengyel',13,47.2167,19.45),(2886,4288,'Újléta',8,47.4667,21.8833),(2887,3387,'Újlőrincfalva',9,47.6333,40.01),(2888,7766,'Újpetre',2,45.9367,18.3625),(2889,9244,'Újrónafő',7,47.7972,21.6896),(2890,6321,'Újsolt',1,46.8667,19.1167),(2891,5727,'Újszalonta',3,46.8086,21.4926),(2892,5052,'Újszász',10,47.2826,20.0833),(2893,6754,'Újszentiván',5,46.1833,20.1833),(2894,4065,'Újszentmargita',8,47.7333,40.01),(2895,2768,'Újszilvás',13,47.2833,19.9333),(2896,6337,'Újtelek',1,46.59,19.0586),(2897,4096,'Újtikos',8,47.9167,21.1833),(2898,8778,'Újudvar',19,46.5333,17.01),(2899,7436,'Újvárfalva',14,46.4333,17.5833),(2900,8347,'Ukk',18,47.0431,17.2167),(2901,9464,'Und',7,47.4833,40.01),(2902,2528,'Úny',11,47.6333,18.7333),(2903,3622,'Uppony',4,48.2167,20.4333),(2904,4763,'Ura',15,47.8167,22.6167),(2905,9651,'Uraiújfalu',17,47.3667,16.9833),(2906,8142,'Úrhida',6,47.1333,18.3333),(2907,2244,'Úri',13,47.4167,19.5333),(2908,8409,'Úrkút',18,47.0833,17.6333),(2909,4952,'Uszka',15,48.0667,22.8667),(2910,6332,'Uszód',1,46.5667,18.9167),(2911,8321,'Uzsa',18,46.8984,17.3333),(2912,6794,'Üllés',5,46.3381,19.8519),(2913,2225,'Üllő',13,47.3833,19.35),(2914,2096,'Üröm',13,47.5981,19.0167),(2915,2600,'Vác',13,47.7833,19.1333),(2916,2167,'Vácduka',13,47.75,19.2167),(2917,2184,'Vácegres',13,47.6833,19.3667),(2918,2164,'Váchartyán',13,47.7333,19.2667),(2919,2185,'Váckisújfalu',13,47.7051,19.35),(2920,2163,'Vácrátót',13,47.7167,19.2333),(2921,2115,'Vácszentlászló',13,47.5833,19.5333),(2922,3636,'Vadna',4,48.2667,20.5667),(2923,9346,'Vadosfa',7,47.4983,17.1333),(2924,9327,'Vág',7,47.45,17.2167),(2925,3992,'Vágáshuta',4,48.4167,21.55),(2926,4562,'Vaja',15,48.0001,22.1667),(2927,3961,'Vajdácska',4,48.3167,21.6667),(2928,7838,'Vajszló',2,45.8633,17.9761),(2929,7041,'Vajta',6,46.7167,18.6667),(2930,2473,'Vál',6,47.3667,18.6833),(2931,2114,'Valkó',13,47.5667,19.5167),(2932,8885,'Valkonya',19,46.4987,16.8167),(2933,4351,'Vállaj',15,47.7667,22.3833),(2934,8316,'Vállus',19,46.85,40.01),(2935,4936,'Vámosatya',15,48.2003,22.4167),(2936,9665,'Vámoscsalád',17,47.3833,16.9667),(2937,3291,'Vámosgyörk',9,47.6833,19.9333),(2938,2635,'Vámosmikola',13,47.9833,18.7833),(2939,4966,'Vámosoroszi',15,47.9833,22.6833),(2940,4287,'Vámospércs',8,47.5333,40.01),(2941,3941,'Vámosújfalu',4,48.2667,21.4667),(2942,9061,'Vámosszabadi',7,47.7667,17.65),(2943,4119,'Váncsod',8,47.1989,21.65),(2944,2688,'Vanyarc',12,47.8333,19.45),(2945,8552,'Vanyola',18,47.3833,17.5833),(2946,7973,'Várad',2,45.9667,17.75),(2947,7354,'Váralja',16,46.2667,18.4333),(2948,8723,'Varászló',14,46.4333,17.2167),(2949,3254,'Váraszó',9,48.0333,20.1167),(2950,9243,'Várbalog',7,47.85,17.0833),(2951,3778,'Varbó',4,48.1667,20.6333),(2952,3756,'Varbóc',4,48.4667,20.65),(2953,7442,'Várda',14,46.45,17.7333),(2954,7146,'Várdomb',16,46.25,40.01),(2955,8891,'Várfölde',19,46.5667,16.7667),(2956,7370,'Varga',2,46.2333,18.15),(2957,2824,'Várgesztes',11,47.4667,40.01),(2958,8523,'Várkesző',18,47.4333,17.3167),(2959,7214,'Várong',16,46.5333,40.01),(2960,6033,'Városföld',1,46.8167,19.7667),(2961,8445,'Városlőd',18,47.15,17.65),(2962,8100,'Várpalota',18,47.1965,18.1333),(2963,7067,'Varsád',16,46.5333,18.5167),(2964,3178,'Varsány',12,48.0333,40.01),(2965,8316,'Várvölgy',19,46.8667,40.01),(2966,2211,'Vasad',13,47.3167,40.01),(2967,9921,'Vasalja',17,47.0167,16.5167),(2968,7926,'Vásárosbéc',2,46.1833,17.7333),(2969,7362,'Vásárosdombó',2,46.3065,18.15),(2970,9343,'Vásárosfalu',7,47.45,17.1167),(2971,9552,'Vásárosmiske',17,47.2037,17.0667),(2972,4800,'Vásárosnamény',15,48.1333,22.3167),(2973,9744,'Vasasszonyfa',17,47.3167,16.6667),(2974,8914,'Vasboldogasszony',19,46.95,16.8833),(2975,9661,'Vasegerszeg',17,47.3667,16.9167),(2976,9674,'Vashosszúfalu',17,47.1167,17.0667),(2977,9795,'Vaskeresztes',17,47.1932,16.45),(2978,6521,'Vaskút',1,46.1167,18.9833),(2979,4502,'Vasmegyer',15,48.1167,21.8167),(2980,8998,'Vaspör',19,46.9161,16.65),(2981,9741,'Vassurány',17,47.2833,40.01),(2982,8245,'Vászoly',18,46.9333,17.7667),(2983,9763,'Vasszécseny',17,47.1833,16.7667),(2984,9953,'Vasszentmihály',17,46.9667,16.4167),(2985,9747,'Vasszilvágy',17,47.2993,16.75),(2986,9800,'Vasvár',17,47.0498,40.01),(2987,8542,'Vaszar',18,47.4011,17.5167),(2988,9748,'Vát',17,47.2833,16.7833),(2989,3431,'Vatta',4,47.9167,20.75),(2990,7370,'Vázsnok',2,46.2667,18.1333),(2991,3265,'Vécs',9,47.8167,20.1667),(2992,2220,'Vecsés',13,47.4018,19.2458),(2993,5811,'Végegyháza',3,46.3833,20.8667),(2994,7838,'Vejti',2,45.8167,17.9667),(2995,7333,'Vékény',2,46.2667,18.35),(2996,4143,'Vekerd',8,47.4012,40.01),(2997,9726,'Velem',17,47.35,16.4951),(2998,9946,'Velemér',17,46.7333,16.3833),(2999,2481,'Velence',6,47.2333,18.65),(3000,7951,'Velény',2,45.9803,18.0533),(3001,7726,'Véménd',2,46.15,18.6167),(3002,9062,'Vének',7,47.7333,17.7667),(3003,9751,'Vép',17,47.2333,16.7333),(3004,2477,'Vereb',6,47.3167,18.6167),(3005,2112,'Veresegyház',13,47.65,19.2833),(3006,2621,'Verőce',13,47.8333,19.0333),(3007,3351,'Verpelét',9,47.85,20.2333),(3008,2174,'Verseg',13,47.7167,19.55),(3009,7752,'Versend',2,45.9953,18.5114),(3010,8089,'Vértesacsa',6,47.3667,18.5833),(3011,8085,'Vértesboglár',6,47.4333,18.5333),(3012,2859,'Vérteskethely',11,47.4833,18.0833),(3013,2823,'Vértessomló',11,47.5167,18.3667),(3014,2833,'Vértestolna',11,47.6333,18.45),(3015,2837,'Vértesszőlős',11,47.6167,18.3833),(3016,8721,'Vése',14,46.4167,40.01),(3017,9352,'Veszkény',7,47.6006,17.0833),(3018,8200,'Veszprém',18,47.0918,17.9167),(3019,8248,'Veszprémfajsz',18,47.0333,40.01),(3020,8475,'Veszprémgalsa',18,47.0944,17.2833),(3021,8438,'Veszprémvarsány',18,47.4289,17.825),(3022,5530,'Vésztő',3,46.9167,21.2667),(3023,5093,'Vezseny',10,47.0333,20.2167),(3024,8484,'Vid',18,47.2167,17.35),(3025,8294,'Vigántpetend',18,46.9667,17.6333),(3026,7773,'Villány',2,45.8689,18.4539),(3027,7772,'Villánykövesd',2,45.8822,18.4253),(3028,3891,'Vilmány',4,48.4167,21.2333),(3029,8194,'Vilonya',18,47.1167,18.0667),(3030,3991,'Vilyvitány',4,48.4961,21.5667),(3031,9541,'Vinár',18,47.125,17.175),(3032,8354,'Vindornyafok',19,46.85,17.1833),(3033,8353,'Vindornyalak',19,46.8833,40.01),(3034,8355,'Vindornyaszőlős',19,46.8977,17.1667),(3035,2025,'Visegrád',13,47.7833,18.9833),(3036,7533,'Visnye',14,46.1833,17.6833),(3037,3271,'Visonta',9,47.7833,20.0333),(3038,3956,'Viss',4,48.2167,21.5167),(3039,8681,'Visz',14,46.7333,17.7833),(3040,9932,'Viszák',17,46.8833,40.01),(3041,3825,'Viszló',4,48.4914,40.01),(3042,3293,'Visznek',9,47.65,20.0333),(3043,9371,'Vitnyéd',7,47.5833,16.9833),(3044,7588,'Vízvár',14,46.0833,17.2333),(3045,3128,'Vizslás',12,48.0485,19.8167),(3046,3888,'Vizsoly',4,48.3833,21.2167),(3047,7768,'Vokány',2,45.9094,18.3361),(3048,8314,'Vonyarcvashegy',19,46.75,17.3167),(3049,8931,'Vöckönd',19,46.8833,16.95),(3050,9462,'Völcsej',7,47.4833,16.7667),(3051,9516,'Vönöck',17,47.3167,17.1667),(3052,8291,'Vöröstó',18,46.9667,17.7167),(3053,8711,'Vörs',14,46.6667,17.2667),(3054,3124,'Zabar',12,48.1333,40.01),(3055,7976,'Zádor',2,45.9667,17.6653),(3056,3726,'Zádorfalva',4,48.3833,20.4833),(3057,5051,'Zagyvarékas',10,47.2667,20.1333),(3058,3031,'Zagyvaszántó',9,47.7833,19.6833),(3059,4625,'Záhony',15,48.4167,22.1833),(3060,8868,'Zajk',19,46.4833,16.7167),(3061,4974,'Zajta',15,47.9075,22.7983),(3062,8852,'Zákány',14,46.2744,16.9511),(3063,6787,'Zákányszék',5,46.2667,19.9167),(3064,8660,'Zala',14,46.7333,18.01),(3065,8741,'Zalaapáti',19,46.7333,17.1167),(3066,8971,'Zalabaksa',19,46.6997,16.5522),(3067,8798,'Zalabér',19,46.9667,17.0333),(3068,8992,'Zalaboldogfa',19,46.897,16.7667),(3069,8782,'Zalacsány',19,46.8077,17.1167),(3070,8996,'Zalacséb',19,46.8603,16.6639),(3071,8900,'Zalaegerszeg',19,46.84,16.8439),(3072,8344,'Zalaerdőd',18,47.0505,17.1333),(3073,8349,'Zalagyömörő',18,47.0167,17.2333),(3074,8308,'Zalahaláp',18,46.9167,17.4667),(3075,8997,'Zalaháshágy',19,46.89,16.6328),(3076,8761,'Zalaigrice',19,46.75,17.0167),(3077,8932,'Zalaistvánd',19,46.9167,16.9833),(3078,8749,'Zalakaros',19,46.5667,17.1333),(3079,8751,'Zalakomár',19,46.55,17.1833),(3080,8354,'Zalaköveskút',19,46.85,17.15),(3081,8999,'Zalalövő',19,46.8483,16.5936),(3082,8348,'Zalameggyes',18,47.0833,17.2167),(3083,8747,'Zalamerenye',19,46.5667,40.01),(3084,8756,'Zalasárszeg',19,46.4938,17.0833),(3085,8743,'Zalaszabar',19,46.65,17.1167),(3086,8353,'Zalaszántó',19,46.8833,17.2333),(3087,8476,'Zalaszegvár',18,47.0979,17.2333),(3088,8772,'Zalaszentbalázs',19,46.5878,16.9186),(3089,8790,'Zalaszentgrót',19,46.95,17.0833),(3090,8994,'Zalaszentgyörgy',19,46.8667,16.7167),(3091,8921,'Zalaszentiván',19,46.8886,16.8994),(3092,8827,'Zalaszentjakab',19,46.4833,17.1333),(3093,8788,'Zalaszentlászló',19,46.8833,17.1167),(3094,8921,'Zalaszentlőrinc',19,46.9167,16.8833),(3095,8764,'Zalaszentmárton',19,46.7039,17.0667),(3096,8936,'Zalaszentmihály',19,46.725,16.9494),(3097,8969,'Zalaszombatfa',19,46.6333,16.45),(3098,7839,'Zaláta',2,45.8167,17.8833),(3099,8947,'Zalatárnok',19,46.7019,16.7628),(3100,8822,'Zalaújlak',19,46.55,17.0833),(3101,8392,'Zalavár',19,46.6667,17.1667),(3102,8792,'Zalavég',19,47.0001,17.0333),(3103,3957,'Zalkod',4,48.1833,21.4667),(3104,8621,'Zamárdi',14,46.8833,17.95),(3105,8081,'Zámoly',6,47.3167,18.4167),(3106,8251,'Zánka',18,46.8833,17.6833),(3107,3296,'Zaránk',9,47.65,20.1167),(3108,7182,'Závod',16,46.7039,18.4167),(3109,8957,'Zebecke',19,46.65,16.6833),(3110,2627,'Zebegény',13,47.8003,18.9167),(3111,3977,'Zemplénagárd',4,48.35,22.0833),(3112,7720,'Zengővárkony',2,46.1667,18.4333),(3113,8112,'Zichyújfalu',6,47.1333,18.6833),(3114,8672,'Zics',14,46.6833,17.9833),(3115,3794,'Ziliz',4,48.25,40.01),(3116,7471,'Zimány',14,46.4167,17.9167),(3117,8420,'Zirc',18,47.2667,17.8667),(3118,7671,'Zók',2,46.0001,40.01),(3119,7173,'Zomba',16,15.3833,18.5667),(3120,5537,'Zsadány',3,46.9167,40.01),(3121,4142,'Zsáka',8,47.1333,21.4333),(3122,2072,'Zsámbék',13,47.55,18.7167),(3123,2116,'Zsámbok',13,47.55,19.6167),(3124,6411,'Zsana',1,46.4167,19.6833),(3125,4961,'Zsarolyán',15,47.95,40.01),(3126,9346,'Zsebeháza',7,47.5167,40.01),(3127,9635,'Zsédeny',17,47.3333,40.01),(3128,7477,'Zselickisfalud',14,46.2667,17.7333),(3129,7400,'Zselickislak',14,46.3167,17.8167),(3130,7474,'Zselicszentpál',14,46.3642,17.8333),(3131,9766,'Zsennye',17,47.1167,16.8167),(3132,9476,'Zsira',7,47.45,16.6833),(3133,6792,'Zsombó',5,46.3333,19.9833),(3134,3897,'Zsujta',4,48.4947,21.2833),(3135,4627,'Zsurk',15,48.4167,22.2167),(3136,3723,'Zubogy',4,48.3833,20.5833);
/*!40000 ALTER TABLE `core_settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_support`
--

DROP TABLE IF EXISTS `core_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_support` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `core_configsID` bigint unsigned DEFAULT NULL,
  `core_support_topicID` int unsigned DEFAULT '0',
  `core_support_typeID` int unsigned DEFAULT '0',
  `planTime` int unsigned DEFAULT NULL,
  `realTime` int unsigned DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `comment` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `core_support_statusID` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_support`
--

LOCK TABLES `core_support` WRITE;
/*!40000 ALTER TABLE `core_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_support_action`
--

DROP TABLE IF EXISTS `core_support_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_support_action` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `core_supportID` bigint unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `planTime` int unsigned DEFAULT NULL,
  `realTime` int unsigned DEFAULT NULL,
  `downloadURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_support_action`
--

LOCK TABLES `core_support_action` WRITE;
/*!40000 ALTER TABLE `core_support_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_support_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_support_status`
--

DROP TABLE IF EXISTS `core_support_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_support_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_support_status`
--

LOCK TABLES `core_support_status` WRITE;
/*!40000 ALTER TABLE `core_support_status` DISABLE KEYS */;
INSERT INTO `core_support_status` VALUES (1,'Bejelentve',NULL,1,2,'2012-03-30 15:59:55',NULL,NULL),(2,'Folyamatban',NULL,1,2,'2012-03-30 16:00:09',NULL,NULL),(3,'Továbbítva',NULL,1,2,'2012-03-30 16:00:22',NULL,NULL),(4,'Javítva',NULL,1,2,'2012-03-30 16:00:31',NULL,NULL),(5,'Javítva és értesítve',NULL,1,2,'2012-03-30 16:01:07',NULL,NULL),(6,'Lezárva',NULL,1,2,'2012-03-30 16:01:22',NULL,NULL),(7,'Tervezett',NULL,1,2,'2012-03-30 16:01:33',NULL,NULL),(8,'Törölve',NULL,1,2,'2012-03-30 16:01:42',NULL,NULL);
/*!40000 ALTER TABLE `core_support_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_support_topic`
--

DROP TABLE IF EXISTS `core_support_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_support_topic` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_support_topic`
--

LOCK TABLES `core_support_topic` WRITE;
/*!40000 ALTER TABLE `core_support_topic` DISABLE KEYS */;
INSERT INTO `core_support_topic` VALUES (1,'Hiba',NULL,1,2,'2012-03-30 15:58:36',NULL,NULL),(2,'Bővítés',NULL,1,2,'2012-03-30 15:59:12',NULL,NULL),(3,'Módosítás',NULL,1,2,'2012-03-30 15:59:24',NULL,NULL),(4,'Érdeklődés',NULL,1,2,'2013-08-02 12:39:17',NULL,NULL);
/*!40000 ALTER TABLE `core_support_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_support_type`
--

DROP TABLE IF EXISTS `core_support_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_support_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_support_type`
--

LOCK TABLES `core_support_type` WRITE;
/*!40000 ALTER TABLE `core_support_type` DISABLE KEYS */;
INSERT INTO `core_support_type` VALUES (1,'Frontend',NULL,1,2,'2012-03-30 16:02:10',NULL,NULL),(2,'Admin',NULL,1,2,'2012-03-30 16:02:18',NULL,NULL);
/*!40000 ALTER TABLE `core_support_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_themes`
--

DROP TABLE IF EXISTS `core_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `bgcolor` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fgcolor` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_themes`
--

LOCK TABLES `core_themes` WRITE;
/*!40000 ALTER TABLE `core_themes` DISABLE KEYS */;
INSERT INTO `core_themes` VALUES (1,'black','#000000','#FFFFFF',NULL,1,2,'2010-09-24 00:41:33',2,'2010-09-27 14:08:51'),(2,'white','#FFFFFF','#000000',NULL,1,2,'2010-09-24 00:41:53',2,'2010-09-27 14:16:18'),(3,'silver','#C0C0C0','#000000',NULL,1,2,'2010-09-24 00:42:20',2,'2010-09-27 14:17:10'),(4,'gray','#808080','#FFFFFF',NULL,1,2,'2010-09-24 00:55:14',2,'2010-09-27 14:18:47'),(5,'maroon','#800000','#FFFFFF',NULL,1,2,'2010-09-24 00:55:45',2,'2010-09-27 14:18:30'),(6,'purple','#800080','#FFFFFF',NULL,1,2,'2010-09-24 00:55:57',2,'2010-09-27 14:19:23'),(7,'fuchsia','#FF00FF','#FFFFFF',NULL,1,2,'2010-09-26 14:09:10',2,'2010-09-27 14:21:51'),(8,'green','#008000','#FFFFFF',NULL,1,2,'2010-09-26 14:09:41',2,'2010-09-27 14:22:20'),(9,'lime','#00FF00','#000000',NULL,1,2,'2010-09-26 14:21:39',2,'2010-09-27 14:23:00'),(10,'olive','#808000','#FFFFFF',NULL,1,2,'2010-09-26 15:20:25',2,'2010-09-27 14:23:30'),(11,'yellow','#FFFF00','#000000',NULL,1,2,'2010-09-26 22:24:13',2,'2010-09-27 14:24:10'),(12,'navy','#000080','#FFFFFF',NULL,1,2,'2010-09-26 23:22:00',2,'2010-09-27 14:24:54'),(13,'blue','#0000FF','#FFFFFF',NULL,1,2,'2010-09-27 13:12:59',2,'2010-09-27 14:25:26'),(14,'teal','#008080','#FFFFFF',NULL,1,2,'2010-09-27 14:54:08',NULL,NULL),(15,'aqua','#00FFFF','#000000',NULL,1,2,'2010-09-27 16:26:35',NULL,NULL),(16,'orange','#FFA500','#000000',NULL,1,2,'2010-09-27 17:09:27',2,'2017-04-28 11:02:18');
/*!40000 ALTER TABLE `core_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `core_userstitleID` bigint unsigned DEFAULT NULL,
  `surname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `forename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `firmName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `contactName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `contactPhone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `active` int unsigned DEFAULT '1',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lastLoginWhen` datetime DEFAULT NULL,
  `lastLogoutWhen` datetime DEFAULT NULL,
  `activationCode` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `regmailWhen` datetime DEFAULT NULL,
  `activationWhen` datetime DEFAULT NULL,
  `core_groupsID` bigint NOT NULL DEFAULT '3',
  `pictureURL` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `newsletter` int DEFAULT '0',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,NULL,NULL,NULL,'Guest','','','','','','',1,NULL,NULL,'2024-05-12 13:40:42',NULL,NULL,NULL,1,NULL,0,NULL,NULL,2,'2012-01-24 11:06:15','2006-03-28 23:38:24',2),(2,NULL,'Szabó','Sándor','SzSanyi','phoenix','rodnas@uw.hu','Első','Első','Első','Első',1,NULL,'2013-09-02 13:09:13','2024-06-06 12:04:50',NULL,NULL,NULL,2,NULL,0,NULL,'2005-02-19 09:00:00',2,'2013-11-04 10:14:52','2009-06-03 09:01:09',2);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users_config`
--

DROP TABLE IF EXISTS `core_users_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fieldValue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `autoload` int unsigned DEFAULT NULL,
  `active` int unsigned DEFAULT '1',
  `core_usersID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users_config`
--

LOCK TABLES `core_users_config` WRITE;
/*!40000 ALTER TABLE `core_users_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_users_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users_rights`
--

DROP TABLE IF EXISTS `core_users_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users_rights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `core_usersID` bigint unsigned DEFAULT NULL,
  `core_configsID` bigint unsigned DEFAULT NULL,
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users_rights`
--

LOCK TABLES `core_users_rights` WRITE;
/*!40000 ALTER TABLE `core_users_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_users_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_userslog`
--

DROP TABLE IF EXISTS `core_userslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_userslog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usersID` bigint unsigned DEFAULT NULL,
  `modul` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `actionWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_userslog`
--

LOCK TABLES `core_userslog` WRITE;
/*!40000 ALTER TABLE `core_userslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_userslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_userstitle`
--

DROP TABLE IF EXISTS `core_userstitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_userstitle` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `insertUserID` bigint unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` bigint unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_userstitle`
--

LOCK TABLES `core_userstitle` WRITE;
/*!40000 ALTER TABLE `core_userstitle` DISABLE KEYS */;
INSERT INTO `core_userstitle` VALUES (1,'dr',NULL,1,2,'2013-07-26 08:48:39',NULL,NULL);
/*!40000 ALTER TABLE `core_userstitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `themesID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,NULL,'VendÃ©g',NULL,1,1,2,'2005-08-29 21:08:54',2,'2010-09-04 22:06:50'),(2,NULL,'Supervisor','abrakadabra<br>hejhÃ³<br>',1,1,1,'2005-08-29 21:08:54',2,'2011-12-26 14:56:34'),(3,NULL,'Rendszergazda',NULL,1,1,1,'2005-08-29 21:10:02',NULL,NULL),(4,NULL,'Tag','blabla',1,1,1,'2005-08-29 21:10:55',2,'2010-10-05 12:23:21');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_rights`
--

DROP TABLE IF EXISTS `groups_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_rights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int unsigned DEFAULT NULL,
  `groupsID` int unsigned NOT NULL DEFAULT '0',
  `modulID` int unsigned NOT NULL DEFAULT '0',
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_rights`
--

LOCK TABLES `groups_rights` WRITE;
/*!40000 ALTER TABLE `groups_rights` DISABLE KEYS */;
INSERT INTO `groups_rights` VALUES (2,1,2,2,31,0,1,1,2,'2010-10-05 21:50:29',NULL,NULL),(3,1,2,3,15,0,1,1,2,'2010-10-05 21:50:42',NULL,NULL),(4,1,2,4,15,0,1,1,2,'2010-10-05 21:50:49',NULL,NULL),(5,1,2,5,15,0,1,1,2,'2010-10-05 21:50:55',NULL,NULL),(7,1,2,112,31,0,1,1,2,'2010-10-05 21:51:53',NULL,NULL),(20,1,2,89,15,0,1,1,2,'2010-10-05 21:56:11',NULL,NULL),(21,1,2,99,0,0,1,1,2,'2010-10-05 21:56:20',NULL,NULL),(22,1,2,78,15,0,1,1,2,'2010-10-05 21:56:50',NULL,NULL),(31,1,2,7,15,0,1,1,2,'2010-10-05 22:33:39',NULL,NULL),(34,1,3,112,13,0,1,1,2,'2010-10-26 22:04:17',NULL,NULL),(43,1,2,126,15,0,1,1,2,'2011-03-04 07:42:42',NULL,NULL),(44,1,2,127,15,0,1,1,2,'2011-03-04 07:43:09',NULL,NULL),(45,1,2,128,15,0,1,1,2,'2011-03-04 07:43:25',NULL,NULL),(46,1,2,123,15,0,1,1,2,'2011-03-04 07:43:47',NULL,NULL),(50,1,3,123,13,0,1,1,2,'2011-03-04 07:45:04',NULL,NULL),(53,1,3,126,13,0,1,1,2,'2011-03-04 07:45:35',NULL,NULL),(54,1,3,127,13,0,1,1,2,'2011-03-04 07:45:46',NULL,NULL),(55,1,3,128,13,0,1,1,2,'2011-03-04 07:46:00',NULL,NULL),(57,1,2,130,15,0,1,1,2,'2011-03-09 20:09:32',NULL,NULL),(58,1,3,130,8,0,1,1,2,'2011-03-09 20:09:55',2,'2012-01-26 12:44:18'),(61,1,2,133,15,0,1,1,2,'2012-01-16 10:08:15',NULL,NULL),(63,1,2,134,15,0,1,1,2,'2012-01-16 13:46:52',NULL,NULL),(64,1,2,135,8,0,1,1,2,'2012-01-23 12:14:12',NULL,NULL),(65,1,3,78,13,0,1,1,2,'2012-01-26 13:24:00',NULL,NULL);
/*!40000 ALTER TABLE `groups_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` VALUES (1,'HU','images/public/button/hu.gif');
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `wwwAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `visitcounter` int unsigned DEFAULT NULL,
  `lastvisit` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'Éljünkjól','http://eljunkjol.hu',NULL,1,1,2,'2012-01-18 12:09:58',2,'2012-01-25 15:48:01',NULL,NULL,'2012-01-18 12:09:58',2),(2,'Tőzsdefórum','http://www.tozsdeforum.hu','aaaaa',1,1,2,'2012-01-25 15:47:31',2,'2024-05-22 18:03:31',NULL,NULL,'2020-08-13 10:31:55',2);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertiserID` int unsigned DEFAULT NULL,
  `siteID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `sizeWidth` int unsigned DEFAULT NULL,
  `sizeHeight` int unsigned DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,NULL,NULL,'Full Banner',468,60,NULL,1,1,2,'2012-01-24 14:08:50',NULL,NULL),(2,NULL,NULL,'Half Banner',234,60,NULL,1,1,2,'2012-01-24 14:10:17',NULL,NULL),(3,NULL,NULL,'Micro Banner',88,31,NULL,1,1,2,'2012-01-24 14:10:37',NULL,NULL),(4,NULL,NULL,'Button 1',120,90,NULL,1,1,2,'2012-01-24 14:11:10',NULL,NULL),(5,NULL,NULL,'Button 2',120,60,NULL,1,1,2,'2012-01-24 14:11:28',NULL,NULL),(6,NULL,NULL,'Vertical Banner',120,240,NULL,1,1,2,'2012-01-24 14:12:02',NULL,NULL),(7,NULL,NULL,'Square Button',125,125,NULL,1,1,2,'2012-01-24 14:12:23',NULL,NULL),(8,NULL,NULL,'Leaderboard',728,90,NULL,1,1,2,'2012-01-24 14:12:58',NULL,NULL),(9,NULL,NULL,'Wide Skyscraper',160,600,NULL,1,1,2,'2012-01-24 14:13:30',NULL,NULL),(10,NULL,NULL,'Skyscraper',120,600,NULL,1,1,2,'2012-01-24 14:14:17',NULL,NULL),(11,NULL,NULL,'Half Page Ad',300,600,NULL,1,1,2,'2012-01-24 14:14:38',NULL,NULL),(12,NULL,NULL,'Medium Rectangle',300,250,NULL,1,1,2,'2012-01-24 14:15:03',NULL,NULL),(13,NULL,NULL,'Square Pop-Up',250,250,NULL,1,1,2,'2012-01-24 14:15:24',NULL,NULL),(14,NULL,NULL,'Vertical Rectangle',240,400,NULL,1,1,2,'2012-01-24 14:15:56',NULL,NULL),(15,NULL,NULL,'Large Rectangle',336,280,NULL,1,1,2,'2012-01-24 14:16:16',NULL,NULL),(16,NULL,NULL,'Rectangle',180,150,NULL,1,1,2,'2012-01-24 14:16:45',NULL,NULL),(17,NULL,NULL,'3:1 Rectangle',300,100,NULL,1,1,2,'2012-01-24 14:17:05',NULL,NULL),(18,NULL,NULL,'Pop-Under',720,300,NULL,1,1,2,'2012-01-24 14:17:23',NULL,NULL);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertiserID` int unsigned DEFAULT NULL,
  `siteID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES (1,1,1,'Flash',NULL,1,1,2,'2012-01-18 13:40:52',NULL,NULL),(2,1,1,'kÃ©p',NULL,1,1,2,'2012-01-23 11:17:41',NULL,NULL);
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bgcolor` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fgcolor` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `visitcounter` int unsigned DEFAULT NULL,
  `lastvisit` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'black','edgablack','#000000','#FFFFFF',NULL,1,1,2,'2010-09-24 00:41:33',2,'2010-09-27 14:08:51',NULL,NULL,'2010-09-24 00:41:33',2),(2,'white','edgawhite','#FFFFFF','#000000',NULL,1,1,2,'2010-09-24 00:41:53',2,'2010-09-27 14:16:18',NULL,NULL,'2010-09-24 00:41:53',2),(3,'silver','edgasilver','#C0C0C0','#000000',NULL,1,1,2,'2010-09-24 00:42:20',2,'2010-09-27 14:17:10',NULL,NULL,'2010-09-24 00:42:20',2),(4,'gray','edgagray','#808080','#FFFFFF',NULL,1,1,2,'2010-09-24 00:55:14',2,'2010-09-27 14:18:47',NULL,NULL,'2010-09-24 00:55:14',2),(5,'maroon','edgamaroon','#800000','#FFFFFF',NULL,1,1,2,'2010-09-24 00:55:45',2,'2010-09-27 14:18:30',NULL,NULL,'2010-09-24 00:55:45',2),(6,'purple','edgapurple','#800080','#FFFFFF',NULL,1,1,2,'2010-09-24 00:55:57',2,'2010-09-27 14:19:23',NULL,NULL,'2010-09-24 00:55:57',2),(7,'fuchsia','edgafuchsia','#FF00FF','#FFFFFF',NULL,1,1,2,'2010-09-26 14:09:10',2,'2010-09-27 14:21:51',NULL,NULL,'2010-09-26 14:09:10',2),(8,'green','edgagreen','#008000','#FFFFFF',NULL,1,1,2,'2010-09-26 14:09:41',2,'2010-09-27 14:22:20',NULL,NULL,'2010-09-26 14:09:41',2),(9,'lime','edgalime','#00FF00','#000000',NULL,1,1,2,'2010-09-26 14:21:39',2,'2010-09-27 14:23:00',NULL,NULL,'2010-09-26 14:21:39',2),(10,'olive','edgaolive','#808000','#FFFFFF',NULL,1,1,2,'2010-09-26 15:20:25',2,'2010-09-27 14:23:30',NULL,NULL,'2010-09-26 15:20:25',2),(11,'yellow','edgayellow','#FFFF00','#000000',NULL,1,1,2,'2010-09-26 22:24:13',2,'2010-09-27 14:24:10',NULL,NULL,'2010-09-26 22:24:13',2),(12,'navy','edganavy','#000080','#FFFFFF',NULL,1,1,2,'2010-09-26 23:22:00',2,'2010-09-27 14:24:54',NULL,NULL,'2010-09-26 23:22:00',2),(13,'blue','edgablue','#0000FF','#FFFFFF',NULL,1,1,2,'2010-09-27 13:12:59',2,'2010-09-27 14:25:26',NULL,NULL,'2010-09-27 13:12:59',2),(14,'teal','edgateal','#008080','#FFFFFF',NULL,1,1,2,'2010-09-27 14:54:08',NULL,NULL,NULL,NULL,'2010-09-27 14:54:08',2),(15,'aqua','edgaaqua','#00FFFF','#000000',NULL,1,1,2,'2010-09-27 16:26:35',NULL,NULL,NULL,NULL,'2010-09-27 16:26:35',2),(16,'orange','edgaorange','#FFA500','#000000',NULL,1,1,2,'2010-09-27 17:09:27',NULL,NULL,NULL,NULL,'2010-09-27 17:09:27',2);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `themesID` int unsigned DEFAULT NULL,
  `usertitleID` int unsigned DEFAULT NULL,
  `surname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `forename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `active` int unsigned DEFAULT '1',
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lastLoginWhen` datetime DEFAULT NULL,
  `lastLogoutWhen` datetime DEFAULT NULL,
  `activationCode` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `regmailWhen` datetime DEFAULT NULL,
  `activationWhen` datetime DEFAULT NULL,
  `groupsID` int unsigned NOT NULL DEFAULT '3',
  `pictureURL` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `newsletter` int DEFAULT '0',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned DEFAULT NULL,
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  `visitcounter` int unsigned DEFAULT NULL,
  `lastvisit` datetime DEFAULT NULL,
  `isReadWhen` datetime DEFAULT NULL,
  `isReadUserID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,10,NULL,'Guest','Guest','Guest','','guest@guest.hu',1,NULL,NULL,'2009-12-18 09:53:56',NULL,NULL,NULL,1,NULL,0,1,NULL,NULL,2,'2012-01-24 11:16:33',NULL,NULL,'2006-03-28 23:38:24',2),(2,10,NULL,'SzabÃ³','SÃ¡ndor','SzSanyi','phoenix','rodnas@uw.hu',1,'abrakadabra<br>hejhÃ³ka','2024-05-24 07:01:13','2010-08-29 00:48:58',NULL,NULL,NULL,2,'users_2.gif',0,1,NULL,'2005-02-19 09:00:00',2,'2012-01-20 09:48:32',NULL,NULL,'2009-06-03 09:01:09',2),(3,NULL,NULL,'Nagy','Bence','Bence','Bence','nagy.bence@bergman.hu',1,NULL,'2012-01-26 13:23:00',NULL,NULL,NULL,NULL,3,NULL,0,1,2,'2012-01-26 13:21:12',NULL,NULL,NULL,NULL,'2012-01-26 13:21:12',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_rights`
--

DROP TABLE IF EXISTS `users_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_rights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int unsigned DEFAULT NULL,
  `usersID` int unsigned NOT NULL DEFAULT '0',
  `modulID` int unsigned NOT NULL DEFAULT '0',
  `allrecs` int unsigned DEFAULT '0',
  `ownrecs` int unsigned DEFAULT '0',
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_rights`
--

LOCK TABLES `users_rights` WRITE;
/*!40000 ALTER TABLE `users_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userslog`
--

DROP TABLE IF EXISTS `userslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userslog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int unsigned DEFAULT NULL,
  `usersID` int unsigned DEFAULT NULL,
  `modul` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `langID` int unsigned DEFAULT NULL,
  `actionWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userslog`
--

LOCK TABLES `userslog` WRITE;
/*!40000 ALTER TABLE `userslog` DISABLE KEYS */;
INSERT INTO `userslog` VALUES (1,NULL,3,'login',NULL,'2012-01-26 13:23:00');
/*!40000 ALTER TABLE `userslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertitle`
--

DROP TABLE IF EXISTS `usertitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertitle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertitle`
--

LOCK TABLES `usertitle` WRITE;
/*!40000 ALTER TABLE `usertitle` DISABLE KEYS */;
INSERT INTO `usertitle` VALUES (1,NULL,'dr',NULL,1,1,2,'2012-01-24 11:16:13',NULL,NULL);
/*!40000 ALTER TABLE `usertitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertiserID` int unsigned DEFAULT NULL,
  `siteID` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `active` int unsigned DEFAULT '1',
  `langID` int unsigned NOT NULL DEFAULT '0',
  `insertUserID` int unsigned NOT NULL DEFAULT '0',
  `insertWhen` datetime DEFAULT NULL,
  `modifyUserID` int unsigned DEFAULT NULL,
  `modifyWhen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,1,1,'ElsÅ‘ zÃ³na',NULL,1,1,2,'2012-01-18 12:11:28',NULL,NULL),(2,1,1,'MÃ¡sodik zÃ³na',NULL,1,1,2,'2012-01-24 20:20:21',NULL,NULL),(3,1,1,'Harmadik zÃ³na',NULL,1,1,2,'2012-01-25 12:13:00',NULL,NULL),(4,NULL,2,'LeaderHead',NULL,1,1,2,'2012-01-25 16:28:05',NULL,NULL),(5,NULL,1,'Negyedik zÃ³na',NULL,1,1,2,'2012-01-26 08:04:06',NULL,NULL);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-13 21:24:16
