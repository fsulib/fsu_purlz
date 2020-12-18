-- MySQL dump 10.9
--
-- Host: localhost    Database: purlz
-- ------------------------------------------------------
-- Server version	4.1.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `domainmaintainers`
--

DROP TABLE IF EXISTS `domainmaintainers`;
CREATE TABLE `domainmaintainers` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `d_id` int(10) unsigned default NULL,
  `m_id` int(10) unsigned default NULL,
  `type` smallint(6) default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `d_id` (`d_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `domainmaintainers_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `domains` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domainmaintainers`
--

LOCK TABLES `domainmaintainers` WRITE;
/*!40000 ALTER TABLE `domainmaintainers` DISABLE KEYS */;
INSERT INTO `domainmaintainers` VALUES (1,1,1,0);
/*!40000 ALTER TABLE `domainmaintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `d_id` varchar(100) default NULL,
  `public` tinyint(1) default NULL,
  `created` datetime default NULL,
  `lastmodified` datetime default NULL,
  `status` smallint(6) default NULL,
  `indexed` tinyint(1) default NULL,
  PRIMARY KEY  (`z_id`),
  UNIQUE KEY `d_id` (`d_id`),
  KEY `indexed` (`indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'Public Domain /net','/net',1,'2020-12-14 21:55:25','2020-12-14 21:55:25',1,0);
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainwriters`
--

DROP TABLE IF EXISTS `domainwriters`;
CREATE TABLE `domainwriters` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `d_id` int(10) unsigned default NULL,
  `w_id` int(10) unsigned default NULL,
  `type` smallint(6) default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `d_id` (`d_id`),
  KEY `w_id` (`w_id`),
  CONSTRAINT `domainwriters_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `domains` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domainwriters`
--

LOCK TABLES `domainwriters` WRITE;
/*!40000 ALTER TABLE `domainwriters` DISABLE KEYS */;
INSERT INTO `domainwriters` VALUES (1,1,1,0);
/*!40000 ALTER TABLE `domainwriters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmaintainers`
--

DROP TABLE IF EXISTS `groupmaintainers`;
CREATE TABLE `groupmaintainers` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `g_id` int(10) unsigned default NULL,
  `m_id` int(10) unsigned default NULL,
  `type` smallint(6) default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `g_id` (`g_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `groupmaintainers_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `groups` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupmaintainers`
--

LOCK TABLES `groupmaintainers` WRITE;
/*!40000 ALTER TABLE `groupmaintainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupmaintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmembers`
--

DROP TABLE IF EXISTS `groupmembers`;
CREATE TABLE `groupmembers` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `g_id` int(10) unsigned default NULL,
  `m_id` int(10) unsigned default NULL,
  `type` smallint(6) default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `g_id` (`g_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `groups` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupmembers`
--

LOCK TABLES `groupmembers` WRITE;
/*!40000 ALTER TABLE `groupmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `g_id` varchar(100) default NULL,
  `comments` text,
  `created` datetime default NULL,
  `lastmodified` datetime default NULL,
  `status` smallint(6) default NULL,
  `indexed` tinyint(1) default NULL,
  PRIMARY KEY  (`z_id`),
  UNIQUE KEY `g_id` (`g_id`),
  KEY `indexed` (`indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purlhistory`
--

DROP TABLE IF EXISTS `purlhistory`;
CREATE TABLE `purlhistory` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned default NULL,
  `u_id` int(10) unsigned default NULL,
  `status` smallint(6) default NULL,
  `type` varchar(100) default NULL,
  `target` text,
  `modtime` datetime default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `p_id` (`p_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `purlhistory_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `purls` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purlhistory`
--

LOCK TABLES `purlhistory` WRITE;
/*!40000 ALTER TABLE `purlhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `purlhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purlmaintainers`
--

DROP TABLE IF EXISTS `purlmaintainers`;
CREATE TABLE `purlmaintainers` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned default NULL,
  `m_id` int(10) unsigned default NULL,
  `type` smallint(6) default NULL,
  PRIMARY KEY  (`z_id`),
  KEY `p_id` (`p_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `purlmaintainers_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `purls` (`z_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purlmaintainers`
--

LOCK TABLES `purlmaintainers` WRITE;
/*!40000 ALTER TABLE `purlmaintainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `purlmaintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purls`
--

DROP TABLE IF EXISTS `purls`;
CREATE TABLE `purls` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `p_id` text,
  `type` varchar(100) default NULL,
  `target` text,
  `created` datetime default NULL,
  `lastmodified` datetime default NULL,
  `status` smallint(6) default NULL,
  `indexed` tinyint(1) default NULL,
  PRIMARY KEY  (`z_id`),
  UNIQUE KEY `p_id` (`p_id`(750)),
  KEY `indexed` (`indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purls`
--

LOCK TABLES `purls` WRITE;
/*!40000 ALTER TABLE `purls` DISABLE KEYS */;
/*!40000 ALTER TABLE `purls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `z_id` int(10) unsigned NOT NULL auto_increment,
  `admin` tinyint(1) default NULL,
  `fullname` varchar(100) default NULL,
  `affiliation` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `userid` varchar(32) default NULL,
  `password` varchar(100) default NULL,
  `password_hint` varchar(100) default NULL,
  `justification` text,
  `created` datetime default NULL,
  `lastmodified` datetime default NULL,
  `status` smallint(6) default NULL,
  `indexed` tinyint(1) default NULL,
  PRIMARY KEY  (`z_id`),
  UNIQUE KEY `userid` (`userid`),
  KEY `indexed` (`indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'User of Steel','PURL Server','','admin','DF77645E5EF98F323D9C115DE791E9EC','It is a bad security practice.','','2020-12-14 21:55:25','2020-12-14 21:55:25',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

