-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: 50.57.219.101    Database: 663259_rcapps
-- ------------------------------------------------------
-- Server version	5.1.61-log

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accesslog`
--

DROP TABLE IF EXISTS `accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesslog` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `url` text,
  `hostname` varchar(128) DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT '0',
  `timer` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `accesslog_timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1316856 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actions_aid`
--

DROP TABLE IF EXISTS `actions_aid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `advanced_help_index`
--

DROP TABLE IF EXISTS `advanced_help_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advanced_help_index` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '',
  `topic` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`),
  KEY `language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_destinations`
--

DROP TABLE IF EXISTS `backup_migrate_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_destinations` (
  `destination_id` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` text NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_profiles`
--

DROP TABLE IF EXISTS `backup_migrate_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_profiles` (
  `profile_id` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `append_timestamp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `timestamp_format` varchar(14) NOT NULL,
  `filters` text NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_schedules`
--

DROP TABLE IF EXISTS `backup_migrate_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_schedules` (
  `schedule_id` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `source_id` varchar(32) NOT NULL DEFAULT 'db',
  `destination_id` varchar(32) NOT NULL DEFAULT '0',
  `profile_id` varchar(32) NOT NULL DEFAULT '0',
  `keep` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cron` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocks_roles`
--

DROP TABLE IF EXISTS `blocks_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_block`
--

DROP TABLE IF EXISTS `cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_content`
--

DROP TABLE IF EXISTS `cache_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_content` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_emfield_xml`
--

DROP TABLE IF EXISTS `cache_emfield_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_emfield_xml` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_filter`
--

DROP TABLE IF EXISTS `cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_form`
--

DROP TABLE IF EXISTS `cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_media_youtube_status`
--

DROP TABLE IF EXISTS `cache_media_youtube_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_media_youtube_status` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_menu`
--

DROP TABLE IF EXISTS `cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_rules`
--

DROP TABLE IF EXISTS `cache_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rules` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_update`
--

DROP TABLE IF EXISTS `cache_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_views`
--

DROP TABLE IF EXISTS `cache_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_views_data`
--

DROP TABLE IF EXISTS `cache_views_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captcha_points`
--

DROP TABLE IF EXISTS `captcha_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_points` (
  `form_id` varchar(128) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `captcha_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captcha_sessions`
--

DROP TABLE IF EXISTS `captcha_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_sessions` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `sid` varchar(64) NOT NULL DEFAULT '',
  `ip_address` varchar(128) DEFAULT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `form_id` varchar(128) NOT NULL,
  `solution` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `csid_ip` (`csid`,`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=512601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`),
  KEY `comment_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conditional_fields`
--

DROP TABLE IF EXISTS `conditional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditional_fields` (
  `control_field_name` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `trigger_values` mediumtext NOT NULL,
  PRIMARY KEY (`control_field_name`,`field_name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_acceleratorsinc9ii`
--

DROP TABLE IF EXISTS `content_field_acceleratorsinc9ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_acceleratorsinc9ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_acceleratorsinc9ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_acknowledgements5`
--

DROP TABLE IF EXISTS `content_field_acknowledgements5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_acknowledgements5` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_acknowledgements5_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_agreement08`
--

DROP TABLE IF EXISTS `content_field_agreement08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_agreement08` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_agreement08_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_certification8`
--

DROP TABLE IF EXISTS `content_field_certification8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_certification8` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_certification8_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_certification9ii`
--

DROP TABLE IF EXISTS `content_field_certification9ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_certification9ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_certification9ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_conflictofinterest`
--

DROP TABLE IF EXISTS `content_field_conflictofinterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_conflictofinterest` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_conflictofinterest_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_eval_org`
--

DROP TABLE IF EXISTS `content_field_eval_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_eval_org` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_eval_org_nid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `field_eval_org_nid` (`field_eval_org_nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_eval_submitted`
--

DROP TABLE IF EXISTS `content_field_eval_submitted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_eval_submitted` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_eval_submitted_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_eval_tally`
--

DROP TABLE IF EXISTS `content_field_eval_tally`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_eval_tally` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_eval_tally_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_finalcertification5`
--

DROP TABLE IF EXISTS `content_field_finalcertification5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_finalcertification5` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_finalcertification5_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_finalcertification8`
--

DROP TABLE IF EXISTS `content_field_finalcertification8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_finalcertification8` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_finalcertification8_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_finalcertification8ii`
--

DROP TABLE IF EXISTS `content_field_finalcertification8ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_finalcertification8ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_finalcertification8ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_finalcertification9`
--

DROP TABLE IF EXISTS `content_field_finalcertification9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_finalcertification9` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_finalcertification9_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_financialsupload`
--

DROP TABLE IF EXISTS `content_field_financialsupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_financialsupload` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_financialsupload_fid` int(11) DEFAULT NULL,
  `field_financialsupload_list` tinyint(4) DEFAULT NULL,
  `field_financialsupload_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_howlearn9ii`
--

DROP TABLE IF EXISTS `content_field_howlearn9ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_howlearn9ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_howlearn9ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_informedaboutsif`
--

DROP TABLE IF EXISTS `content_field_informedaboutsif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_informedaboutsif` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_informedaboutsif_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_informedaboutsif9`
--

DROP TABLE IF EXISTS `content_field_informedaboutsif9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_informedaboutsif9` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_informedaboutsif9_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_innovativepoints`
--

DROP TABLE IF EXISTS `content_field_innovativepoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_innovativepoints` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_innovativepoints_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_keyaccomplish3`
--

DROP TABLE IF EXISTS `content_field_keyaccomplish3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_keyaccomplish3` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_keyaccomplish3_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_keyaccomplish4`
--

DROP TABLE IF EXISTS `content_field_keyaccomplish4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_keyaccomplish4` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_keyaccomplish4_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_keyaccomplishments`
--

DROP TABLE IF EXISTS `content_field_keyaccomplishments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_keyaccomplishments` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_keyaccomplishments_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_moveon7`
--

DROP TABLE IF EXISTS `content_field_moveon7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_moveon7` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_moveon7_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_moveon8`
--

DROP TABLE IF EXISTS `content_field_moveon8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_moveon8` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_moveon8_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_org6_accomplishments`
--

DROP TABLE IF EXISTS `content_field_org6_accomplishments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_org6_accomplishments` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_org6_accomplishments_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_org_submitted`
--

DROP TABLE IF EXISTS `content_field_org_submitted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_org_submitted` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_org_submitted_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_orgfinancialsupload`
--

DROP TABLE IF EXISTS `content_field_orgfinancialsupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_orgfinancialsupload` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_orgfinancialsupload_fid` int(11) DEFAULT NULL,
  `field_orgfinancialsupload_list` tinyint(4) DEFAULT NULL,
  `field_orgfinancialsupload_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_otherorganizations`
--

DROP TABLE IF EXISTS `content_field_otherorganizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_otherorganizations` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_otherorganizations_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_revenuemultchoice9ii`
--

DROP TABLE IF EXISTS `content_field_revenuemultchoice9ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_revenuemultchoice9ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_revenuemultchoice9ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_statementofagreement5`
--

DROP TABLE IF EXISTS `content_field_statementofagreement5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_statementofagreement5` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_statementofagreement5_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_field_workingwithaccelerators8ii`
--

DROP TABLE IF EXISTS `content_field_workingwithaccelerators8ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_field_workingwithaccelerators8ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_workingwithaccelerators8ii_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_group`
--

DROP TABLE IF EXISTS `content_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_group` (
  `group_type` varchar(32) NOT NULL DEFAULT 'standard',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_name`,`group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_group_fields`
--

DROP TABLE IF EXISTS `content_group_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_group_fields` (
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_name`,`group_name`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_node_field`
--

DROP TABLE IF EXISTS `content_node_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_node_field` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `db_storage` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(127) NOT NULL DEFAULT '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_node_field_instance`
--

DROP TABLE IF EXISTS `content_node_field_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(750) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_1`
--

DROP TABLE IF EXISTS `content_type_evaluation_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_1` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_rootcauses_value` longtext,
  `field_eval_social_need_value` longtext,
  `field_program_performance_value` longtext,
  `field_comments_value` longtext,
  `field_impact_value` longtext,
  `field_budget_value` longtext,
  `field_experience_value` longtext,
  `field_compared_to_others_value` longtext,
  `field_strengths_value` longtext,
  `field_interview_value` longtext,
  `field_financialsupport_value` longtext,
  `field_why_value` longtext,
  `field_govt_value` longtext,
  `field_opportunities_growth_value` longtext,
  `field_vision_value` longtext,
  `field_trackmatch_value` longtext,
  `field_sectorleadership_value` longtext,
  `field_scalable_value` longtext,
  `field_eval_advance_value` longtext,
  `field_eval1_jason_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_2`
--

DROP TABLE IF EXISTS `content_type_evaluation_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_2` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_definedsocialneed_value` longtext,
  `field_understandrootcause_value` longtext,
  `field_innovativework_value` longtext,
  `field_numbersprogress_value` longtext,
  `field_collaborative_value` longtext,
  `field_programperfind_value` longtext,
  `field_socialimpind_value` longtext,
  `field_governance_value` longtext,
  `field_leadershipexperience_value` longtext,
  `field_interviewquestions_value` longtext,
  `field_recommendation_value` longtext,
  `field_additionalcomments_value` longtext,
  `field_historyaccomplish_value` longtext,
  `field_generatesupport_value` longtext,
  `field_shouldtheymoveon_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_3`
--

DROP TABLE IF EXISTS `content_type_evaluation_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_3` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_rootcause3_value` longtext,
  `field_definedsocialneed3_value` longtext,
  `field_pp3_value` longtext,
  `field_socialimpact3_value` longtext,
  `field_finandata3_value` longtext,
  `field_appexperience3_value` longtext,
  `field_innovativework3_value` longtext,
  `field_scalable3_value` longtext,
  `field_govtcoll3_value` longtext,
  `field_trackfit3_value` longtext,
  `field_leadership3_value` longtext,
  `field_success3_value` longtext,
  `field_strengths3_value` longtext,
  `field_weaknesses3_value` longtext,
  `field_moveon3_value` longtext,
  `field_whymoveon3_value` longtext,
  `field_interview3_value` longtext,
  `field_comments3_value` longtext,
  `field_furtheradvocacy3_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_4`
--

DROP TABLE IF EXISTS `content_type_evaluation_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_4` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_5`
--

DROP TABLE IF EXISTS `content_type_evaluation_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_5` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_eval5_rootcause_value` longtext,
  `field_eval5_targetpop_value` longtext,
  `field_eval5_programperformance_value` longtext,
  `field_eval5_socialimpact_value` longtext,
  `field_eval5_capacity_value` longtext,
  `field_eval5_innovation_value` longtext,
  `field_eval5_leadinnovator_value` longtext,
  `field_eval5_differentiation_value` longtext,
  `field_eval5_vision_value` longtext,
  `field_eval5_scale_value` longtext,
  `field_eval5_collaboration_value` longtext,
  `field_eval5_inflectionpoint_value` longtext,
  `field_eval5_business_value` longtext,
  `field_eval5_selfsustaining_value` longtext,
  `field_eval5_strengths_value` longtext,
  `field_eval5_weaknesses_value` longtext,
  `field_eval5_advance_value` longtext,
  `field_eval5_interviewquestions_value` longtext,
  `field_eval5_staffonly_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_6`
--

DROP TABLE IF EXISTS `content_type_evaluation_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_6` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_7`
--

DROP TABLE IF EXISTS `content_type_evaluation_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_7` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_definedsocialneed7_value` longtext,
  `field_pp7_value` longtext,
  `field_socialimpact7_value` longtext,
  `field_finandata7_value` longtext,
  `field_appexperience7_value` longtext,
  `field_innovativework7_value` longtext,
  `field_scalable7_value` longtext,
  `field_govtcoll7_value` longtext,
  `field_trackfit7_value` longtext,
  `field_leadership7_value` longtext,
  `field_success7_value` longtext,
  `field_strengths7_value` longtext,
  `field_weaknesses7_value` longtext,
  `field_whymoveon7_value` longtext,
  `field_interview7_value` longtext,
  `field_comments7_value` longtext,
  `field_longterm7_value` longtext,
  `field_rootcause7_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_8ii`
--

DROP TABLE IF EXISTS `content_type_evaluation_8ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_8ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_eval8ii_socialneed_value` longtext,
  `field_eval8ii_skillsexp_value` longtext,
  `field_eval8ii_leadcommitment_value` longtext,
  `field_eval8ii_socialneedaddress_value` longtext,
  `field_eval8ii_socialimpact_value` longtext,
  `field_eval8ii_vision_value` longtext,
  `field_eval8ii_marketopp_value` longtext,
  `field_eval8ii_pricing_value` longtext,
  `field_eval8ii_marketval_value` longtext,
  `field_eval8ii_differentiated_value` longtext,
  `field_eval8ii_orgcapacity_value` longtext,
  `field_eval8ii_scalable_value` longtext,
  `field_eval8ii_selfsustaining_value` longtext,
  `field_eval8ii_ficaphist_value` longtext,
  `field_eval8ii_capneeds_value` longtext,
  `field_eval8ii_inflection_value` longtext,
  `field_eval8ii_board_value` longtext,
  `field_eval8ii_strengths_value` longtext,
  `field_eval8ii_weaknesses_value` longtext,
  `field_eval8ii_interview_value` longtext,
  `field_eval8ii_comments_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_evaluation_9`
--

DROP TABLE IF EXISTS `content_type_evaluation_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_evaluation_9` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_rootcause8_value` longtext,
  `field_definedsocialneed8_value` longtext,
  `field_pp8_value` longtext,
  `field_finandata8_value` longtext,
  `field_appexperience8_value` longtext,
  `field_innovativework8_value` longtext,
  `field_longterm8_value` longtext,
  `field_scalable8_value` longtext,
  `field_strengths8_value` longtext,
  `field_weaknesses8_value` longtext,
  `field_interview8_value` longtext,
  `field_comments8_value` longtext,
  `field_board8_value` longtext,
  `field_revenue8_value` longtext,
  `field_inflection8_value` longtext,
  `field_milestones8_value` longtext,
  `field_movement8_value` longtext,
  `field_measurement8_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_1`
--

DROP TABLE IF EXISTS `content_type_organization_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_1` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_summary_value` longtext,
  `field_socialneed_value` longtext,
  `field_socialissue_value` longtext,
  `field_orgfinancialsupport_value` longtext,
  `field_orgexperience_value` longtext,
  `field_orglongtermvision_value` longtext,
  `field_orginnovativeapproach_value` longtext,
  `field_orgscalability_value` longtext,
  `field_orggovernment_value` longtext,
  `field_socialissue_format` int(10) unsigned DEFAULT NULL,
  `field_socialneed_format` int(10) unsigned DEFAULT NULL,
  `field_orgexperience_format` int(10) unsigned DEFAULT NULL,
  `field_orgfinancialsupport_format` int(10) unsigned DEFAULT NULL,
  `field_orginnovativeapproach_format` int(10) unsigned DEFAULT NULL,
  `field_orglongtermvision_format` int(10) unsigned DEFAULT NULL,
  `field_orgscalability_format` int(10) unsigned DEFAULT NULL,
  `field_orggovernment_format` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_2`
--

DROP TABLE IF EXISTS `content_type_organization_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_2` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_501c3_value` longtext,
  `field_locationdallas_value` longtext,
  `field_counties_value` longtext,
  `field_geographicdescriptions_value` longtext,
  `field_programstart_value` longtext,
  `field_history_value` longtext,
  `field_humansocialneed_value` longtext,
  `field_programdescription_value` longtext,
  `field_constituency_value` longtext,
  `field_inkindsupport_value` longtext,
  `field_purchasedresources_value` longtext,
  `field_relationships_value` longtext,
  `field_ppcomments_value` longtext,
  `field_socailimpactefforts_value` longtext,
  `field_briefdescription_value` longtext,
  `field_governancestructure_value` longtext,
  `field_boardinvolvement_value` longtext,
  `field_totalrevenue_value` int(11) DEFAULT NULL,
  `field_fte_value` decimal(10,2) DEFAULT NULL,
  `field_personalexperience_value` longtext,
  `field_startdate_value` longtext,
  `field_whynot_value` longtext,
  `field_explainanswer2_value` longtext,
  `field_addcomments_value` longtext,
  `field_committedtoorganization_value` longtext,
  `field_typeofapplicant_value` longtext,
  `field_programname_value` longtext,
  `field_taxid_value` int(11) DEFAULT NULL,
  `field_fiscalyear_value` longtext,
  `field_cashflowexplain_value` longtext,
  `field_applicationcriteria_value` longtext,
  `field_othereligibility_value` longtext,
  `field_test_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_3`
--

DROP TABLE IF EXISTS `content_type_organization_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_3` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_applicanttype_value` longtext,
  `field_nameofprogram_value` longtext,
  `field_programmodel_value` longtext,
  `field_socialneed3_value` longtext,
  `field_programstart3_value` longtext,
  `field_programhistory3_value` longtext,
  `field_programperfcom3_value` longtext,
  `field_socialimpcom3_value` longtext,
  `field_fiscalyear3_value` longtext,
  `field_programsummary3_value` longtext,
  `field_innovatorbackground3_value` longtext,
  `field_innovatorstart3_value` longtext,
  `field_innovative3_value` longtext,
  `field_growthplan3_value` longtext,
  `field_govt3_value` longtext,
  `field_hopetogain3_value` longtext,
  `field_committed3_value` longtext,
  `field_commitment3_value` longtext,
  `field_explainwhynot3_value` longtext,
  `field_govtofficials3_value` longtext,
  `field_501c33_value` longtext,
  `field_govtfunding3_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_4`
--

DROP TABLE IF EXISTS `content_type_organization_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_4` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_programstart4_value` longtext,
  `field_programhistory4_value` longtext,
  `field_programperfcom4_value` longtext,
  `field_socialimpcom4_value` longtext,
  `field_fiscalyear4_value` longtext,
  `field_schoolrelationshipcomment4_value` longtext,
  `field_schoolneed4_value` longtext,
  `field_programproposal4_value` longtext,
  `field_strategies4_value` longtext,
  `field_secondarystrat4_value` longtext,
  `field_programmodel4_value` longtext,
  `field_innovative4_value` longtext,
  `field_growthplan4_value` longtext,
  `field_orgstrucandstaff4_value` longtext,
  `field_timeline4_value` longtext,
  `field_organizationname4_value` longtext,
  `field_additionalcomments4_value` longtext,
  `field_programfincomments4_value` longtext,
  `field_bundling4_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_5`
--

DROP TABLE IF EXISTS `content_type_organization_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_5` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_applicanttype5_value` longtext,
  `field_socialneed5_value` longtext,
  `field_orgdescription5_value` longtext,
  `field_parentorg5_value` longtext,
  `field_history5_value` longtext,
  `field_performancecomments5_value` longtext,
  `field_socialimpactcomments5_value` longtext,
  `field_fiscalyear5_value` longtext,
  `field_boardnumbers5_value` longtext,
  `field_innovatorstart5_value` longtext,
  `field_innovatorstory5_value` longtext,
  `field_leaderresume5_fid` int(11) DEFAULT NULL,
  `field_leaderresume5_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume5_data` text,
  `field_optionalresume5_fid` int(11) DEFAULT NULL,
  `field_optionalresume5_list` tinyint(4) DEFAULT NULL,
  `field_optionalresume5_data` text,
  `field_competition5_value` longtext,
  `field_vision5_value` longtext,
  `field_scalingimpact5_value` longtext,
  `field_collaboration5_value` longtext,
  `field_financialcomments5_value` longtext,
  `field_certification5_fid` int(11) DEFAULT NULL,
  `field_certification5_list` tinyint(4) DEFAULT NULL,
  `field_certification5_data` text,
  `field_timing5_value` longtext,
  `field_hopesforsif5_value` longtext,
  `field_consultants5_value` longtext,
  `field_explainother5_value` longtext,
  `field_targetpop5_value` longtext,
  `field_501c3notes5_value` longtext,
  `field_socialinnovation5_value` longtext,
  `field_impactinvesting5_value` longtext,
  `field_impactinvestingfiles5_fid` int(11) DEFAULT NULL,
  `field_impactinvestingfiles5_list` tinyint(4) DEFAULT NULL,
  `field_impactinvestingfiles5_data` text,
  `field_financialdatacomments5_value` longtext,
  `field_innovatorposition5_value` longtext,
  `field_otherpleaseexplain5_value` longtext,
  `field_firstsectoranalysis5_value` longtext,
  `field_secondsectoranalysis5_value` longtext,
  `field_thirdsectoranalysis5_value` longtext,
  `field_impactinvestingcheckbox5_value` longtext,
  `field_impactinvestingdefinition5_value` longtext,
  `field_marketopportunity5_value` longtext,
  `field_pricingstrategy5_value` longtext,
  `field_howmuchofrevenueisearned5_value` longtext,
  `field_deficitbreakevensurplus5_value` longtext,
  `field_deficit5_value` longtext,
  `field_breakeven5_value` longtext,
  `field_surplus5_value` longtext,
  `field_orgfinances_fid` int(11) DEFAULT NULL,
  `field_orgfinances_list` tinyint(4) DEFAULT NULL,
  `field_orgfinances_data` text,
  `field_parentorgfinances_fid` int(11) DEFAULT NULL,
  `field_parentorgfinances_list` tinyint(4) DEFAULT NULL,
  `field_parentorgfinances_data` text,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_6`
--

DROP TABLE IF EXISTS `content_type_organization_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_6` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_org6_boardmembers_value` longtext,
  `field__sif_value` longtext,
  `field_org6_foundout_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_7`
--

DROP TABLE IF EXISTS `content_type_organization_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_7` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_applicanttype7_value` longtext,
  `field_programmodel7_value` longtext,
  `field_innovative7_value` longtext,
  `field_socialneed7_value` longtext,
  `field_programstart7_value` longtext,
  `field_programhistory7_value` longtext,
  `field_programperfcom7_value` longtext,
  `field_commitment7_value` longtext,
  `field_fiscalyear7_value` longtext,
  `field_501c37_value` longtext,
  `field_socialimind7_value` longtext,
  `field_addboard7_value` longtext,
  `field_nomstat7_value` longtext,
  `field_learna7_value` longtext,
  `field_addcomm7_value` longtext,
  `field_prevapp7_value` longtext,
  `field_appbef7_value` longtext,
  `field_3keyaccomp7_value` longtext,
  `field_innovativework27_value` longtext,
  `field_innovativework47_value` longtext,
  `field_keyaccomplish27_value` longtext,
  `field_keyaccomplish37_value` longtext,
  `field_orgsummary8_value` longtext,
  `field_anyotherconsultants8_value` longtext,
  `field_leadinnovatorstart8_value` longtext,
  `field_leadinnovatorhistory8_value` longtext,
  `field_nonprofitproof_fid` int(11) DEFAULT NULL,
  `field_nonprofitproof_list` tinyint(4) DEFAULT NULL,
  `field_nonprofitproof_data` text,
  `field_longtermvision8_value` longtext,
  `field_scalingimpact8_value` longtext,
  `field_whynow8_value` longtext,
  `field_govcollaboration8_value` longtext,
  `field_hopesforsif8_value` longtext,
  `field_innovative8_value` longtext,
  `field_competition8_value` longtext,
  `field_leaderresume2_fid` int(11) DEFAULT NULL,
  `field_leaderresume2_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume2_data` text,
  `field_financialnotes7_value` longtext,
  `field_addlfinancialdoc7_fid` int(11) DEFAULT NULL,
  `field_addlfinancialdoc7_list` tinyint(4) DEFAULT NULL,
  `field_addlfinancialdoc7_data` text,
  `field_leaderresume1_fid` int(11) DEFAULT NULL,
  `field_leaderresume1_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume1_data` text,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_8`
--

DROP TABLE IF EXISTS `content_type_organization_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_8` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_orgdescription8_value` longtext,
  `field_parentorg8_value` longtext,
  `field_socialneed8_value` longtext,
  `field_targetpop8_value` longtext,
  `field_socialinnovation8_value` longtext,
  `field_history8_value` longtext,
  `field_performancecomments8_value` longtext,
  `field_socialimpactcomments8_value` longtext,
  `field_fiscalyear8_value` longtext,
  `field_financialdatacomments8_value` longtext,
  `field_boardnumber8_value` longtext,
  `field_informedaboutsif8_value` longtext,
  `field_explainother8_value` longtext,
  `field_innovatorstart8_value` longtext,
  `field_innovatorposition8_value` longtext,
  `field_innovatorstory8_value` longtext,
  `field_leaderresume8_fid` int(11) DEFAULT NULL,
  `field_leaderresume8_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume8_data` text,
  `field_optionalresume8_fid` int(11) DEFAULT NULL,
  `field_optionalresume8_list` tinyint(4) DEFAULT NULL,
  `field_optionalresume8_data` text,
  `field_firstsectoranalysis8_value` longtext,
  `field_secondsectoranalysis8_value` longtext,
  `field_thirdsectoranalysis8_value` longtext,
  `field_vision8_value` longtext,
  `field_scalingsocialimpact8_value` longtext,
  `field_otherpleaseexplain8_value` longtext,
  `field_orgfinances8_fid` int(11) DEFAULT NULL,
  `field_orgfinances8_list` tinyint(4) DEFAULT NULL,
  `field_orgfinances8_data` text,
  `field_parentorgfinances8_fid` int(11) DEFAULT NULL,
  `field_parentorgfinances8_list` tinyint(4) DEFAULT NULL,
  `field_parentorgfinances8_data` text,
  `field_financialcomments8_value` longtext,
  `field_2013certification8_fid` int(11) DEFAULT NULL,
  `field_2013certification8_list` tinyint(4) DEFAULT NULL,
  `field_2013certification8_data` text,
  `field_501c3notes8_value` longtext,
  `field_timing8_value` longtext,
  `field_hopeforsif8_value` longtext,
  `field_consultant8_value` longtext,
  `field_statementagreement8_value` longtext,
  `field_parentorgfisyearend8_value` longtext,
  `field_advisoryboard8_value` longtext,
  `field_author8_value` longtext,
  `field_noparentorgauthor8_value` longtext,
  `field_leadinnovatorname8_value` longtext,
  `field_firstpeerorgname_value` longtext,
  `field_secondpeerorgname_value` longtext,
  `field_thirdpeerorgname_value` longtext,
  `field_progbudget8_fid` int(11) DEFAULT NULL,
  `field_progbudget8_list` tinyint(4) DEFAULT NULL,
  `field_progbudget8_data` text,
  `field_parentorgbudget_fid` int(11) DEFAULT NULL,
  `field_parentorgbudget_list` tinyint(4) DEFAULT NULL,
  `field_parentorgbudget_data` text,
  `field_collaborationcomments8_value` longtext,
  `field_publication8_value` longtext,
  `field_applicanttype8_value` longtext,
  `field_collaboration8_value` longtext,
  `field_revenuepercentagecomments8_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_8ii`
--

DROP TABLE IF EXISTS `content_type_organization_8ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_8ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_applicanttype8ii_value` longtext,
  `field_orgdescription8ii_value` longtext,
  `field_parentorg8ii_value` longtext,
  `field_socialneed8ii_value` longtext,
  `field_socialinnovation8ii_value` longtext,
  `field_history8ii_value` longtext,
  `field_performancecomments8ii_value` longtext,
  `field_socialimpactcomments8ii_value` longtext,
  `field_fiscalyear8ii_value` longtext,
  `field_financialdatacomments8ii_value` longtext,
  `field_impactinvesting8ii_value` longtext,
  `field_impactinvestingfiles8ii_fid` int(11) DEFAULT NULL,
  `field_impactinvestingfiles8ii_list` tinyint(4) DEFAULT NULL,
  `field_impactinvestingfiles8ii_data` text,
  `field_boardnumber8ii_value` longtext,
  `field_informedaboutsif8ii_value` longtext,
  `field_explainother8ii_value` longtext,
  `field_innovatorstart8ii_value` longtext,
  `field_innovatorposition8ii_value` longtext,
  `field_innovatorstory8ii_value` longtext,
  `field_leaderresume8ii_fid` int(11) DEFAULT NULL,
  `field_leaderresume8ii_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume8ii_data` text,
  `field_optionalresume8ii_fid` int(11) DEFAULT NULL,
  `field_optionalresume8ii_list` tinyint(4) DEFAULT NULL,
  `field_optionalresume8ii_data` text,
  `field_firstsectorresponse8ii_value` longtext,
  `field_secondsectoranalysis8ii_value` longtext,
  `field_thirdsectoranalysis8ii_value` longtext,
  `field_vision8ii_value` longtext,
  `field_orgfinances8ii_fid` int(11) DEFAULT NULL,
  `field_orgfinances8ii_list` tinyint(4) DEFAULT NULL,
  `field_orgfinances8ii_data` text,
  `field_financialcomments8ii_value` longtext,
  `field_parentorgfinances8ii_fid` int(11) DEFAULT NULL,
  `field_parentorgfinances8ii_list` tinyint(4) DEFAULT NULL,
  `field_parentorgfinances8ii_data` text,
  `field_certification8ii_fid` int(11) DEFAULT NULL,
  `field_certification8ii_list` tinyint(4) DEFAULT NULL,
  `field_certification8ii_data` text,
  `field_501c3notes8ii_value` longtext,
  `field_marketopportunity8ii_value` longtext,
  `field_pricingstrategy8ii_value` longtext,
  `field_deficitbreakevensurplus8ii_value` longtext,
  `field_deficit8ii_value` longtext,
  `field_breakeven8ii_value` longtext,
  `field_surplus8ii_value` longtext,
  `field_timing8ii_value` longtext,
  `field_hopesforsif8ii_value` longtext,
  `field_consultants8ii_value` longtext,
  `field_statementofagreement8ii_value` longtext,
  `field_author8ii_value` longtext,
  `field_noparentorgauthor8ii_value` longtext,
  `field_advisoryboard8ii_value` longtext,
  `field_parentfiscalyearend8ii_value` longtext,
  `field_3yearbudget8ii_fid` int(11) DEFAULT NULL,
  `field_3yearbudget8ii_list` tinyint(4) DEFAULT NULL,
  `field_3yearbudget8ii_data` text,
  `field_parentorgbudget8ii_fid` int(11) DEFAULT NULL,
  `field_parentorgbudget8ii_list` tinyint(4) DEFAULT NULL,
  `field_parentorgbudget8ii_data` text,
  `field_firstpeersorgname8ii_value` longtext,
  `field_secondpeerorgname8ii_value` longtext,
  `field_thirdpeerorgname8ii_value` longtext,
  `field_capitalneeds8ii_value` longtext,
  `field_otheraccelerator8ii_value` longtext,
  `field_publication8ii_value` longtext,
  `field_wholeadnoparent8ii_value` longtext,
  `field_wholeadparentorg8ii_value` longtext,
  `field_marketvalidation8ii_value` longtext,
  `field_orgdoc8ii_value` longtext,
  `field_otherorgdoc8ii_value` longtext,
  `field_notyetgenerating8ii_value` longtext,
  `field_breakevenplans8ii_value` longtext,
  `field_salesrevdetails8ii_value` longtext,
  `field_rchelpcapitalneeds8ii_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_9`
--

DROP TABLE IF EXISTS `content_type_organization_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_9` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_applicanttype9_value` longtext,
  `field_author9_value` longtext,
  `field_orgdescription9_value` longtext,
  `field_parentorg9_value` varchar(250) DEFAULT NULL,
  `field_socialneed9_value` longtext,
  `field_performancecomments9_value` longtext,
  `field_parentorgfisyearend9_value` longtext,
  `field_fiscalyear9_value` longtext,
  `field_financialdatacomments9_value` longtext,
  `field_boardnumber9_value` longtext,
  `field_advisoryboard9_value` longtext,
  `field_publication9_value` longtext,
  `field_statementagreement9_value` longtext,
  `field_socialimpactcomments9_value` longtext,
  `field_innovatorstart9_value` longtext,
  `field_innovatorposition9_value` longtext,
  `field_innovatorstory9_value` longtext,
  `field_leaderresume9_fid` int(11) DEFAULT NULL,
  `field_leaderresume9_list` tinyint(4) DEFAULT NULL,
  `field_leaderresume9_data` text,
  `field_optionalresume9_fid` int(11) DEFAULT NULL,
  `field_optionalresume9_list` tinyint(4) DEFAULT NULL,
  `field_optionalresume9_data` text,
  `field_firstpeerorgname9_value` longtext,
  `field_secondpeerorgname9_value` longtext,
  `field_thirdpeerorgname9_value` longtext,
  `field_vision9_value` longtext,
  `field_otherpleaseexplain9_value` longtext,
  `field_revenuepercentagecomments9_value` longtext,
  `field_revenuecomments9_value` longtext,
  `field_orgfinances9_fid` int(11) DEFAULT NULL,
  `field_orgfinances9_list` tinyint(4) DEFAULT NULL,
  `field_orgfinances9_data` text,
  `field_parentorgfinances9_fid` int(11) DEFAULT NULL,
  `field_parentorgfinances9_list` tinyint(4) DEFAULT NULL,
  `field_parentorgfinances9_data` text,
  `field_progbudget9_fid` int(11) DEFAULT NULL,
  `field_progbudget9_list` tinyint(4) DEFAULT NULL,
  `field_progbudget9_data` text,
  `field_parentorgbudget9_fid` int(11) DEFAULT NULL,
  `field_parentorgbudget9_list` tinyint(4) DEFAULT NULL,
  `field_parentorgbudget9_data` text,
  `field_2014certification9_fid` int(11) DEFAULT NULL,
  `field_2014certification9_list` tinyint(4) DEFAULT NULL,
  `field_2014certification9_data` text,
  `field_consultant9_value` longtext,
  `field_explainother9_value` longtext,
  `field_bizplan9_fid` int(11) DEFAULT NULL,
  `field_bizplan9_list` tinyint(4) DEFAULT NULL,
  `field_bizplan9_data` text,
  `field_mediacoveragecomments9_value` longtext,
  `field_leadinnovator9_value` longtext,
  `field_hopesforsif9_value` longtext,
  `field_oneadditionaldoc9_fid` int(11) DEFAULT NULL,
  `field_oneadditionaldoc9_list` tinyint(4) DEFAULT NULL,
  `field_oneadditionaldoc9_data` text,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type_organization_9ii`
--

DROP TABLE IF EXISTS `content_type_organization_9ii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_organization_9ii` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_standaloneorwithin9ii_value` longtext,
  `field_author9ii_value` longtext,
  `field_leadentrepreneur9ii_value` longtext,
  `field_entrepreneurstart9ii_value` longtext,
  `field_entrepreneurposition9ii_value` longtext,
  `field_entrepreneurexperience9ii_value` longtext,
  `field_bizmodel9ii_value` longtext,
  `field_socialneed9ii_value` longtext,
  `field_parentdescription9ii_value` varchar(250) DEFAULT NULL,
  `field_marketvalidation9ii_value` longtext,
  `field_parentorgfisyear9ii_value` longtext,
  `field_fiscalyear9ii_value` longtext,
  `field_financialcomments9ii_value` longtext,
  `field_neartermneeds9ii_value` longtext,
  `field_biggestchallenges9ii_value` longtext,
  `field_leadresume9ii_fid` int(11) DEFAULT NULL,
  `field_leadresume9ii_list` tinyint(4) DEFAULT NULL,
  `field_leadresume9ii_data` text,
  `field_anotherresume9ii_fid` int(11) DEFAULT NULL,
  `field_anotherresume9ii_list` tinyint(4) DEFAULT NULL,
  `field_anotherresume9ii_data` text,
  `field_parentbudget9ii_fid` int(11) DEFAULT NULL,
  `field_parentbudget9ii_list` tinyint(4) DEFAULT NULL,
  `field_parentbudget9ii_data` text,
  `field_applicantbudget9ii_fid` int(11) DEFAULT NULL,
  `field_applicantbudget9ii_list` tinyint(4) DEFAULT NULL,
  `field_applicantbudget9ii_data` text,
  `field_parentfinancials9ii_fid` int(11) DEFAULT NULL,
  `field_parentfinancials9ii_list` tinyint(4) DEFAULT NULL,
  `field_parentfinancials9ii_data` text,
  `field_applicantfinancials9ii_fid` int(11) DEFAULT NULL,
  `field_applicantfinancials9ii_list` tinyint(4) DEFAULT NULL,
  `field_applicantfinancials9ii_data` text,
  `field_bizplan9ii_fid` int(11) DEFAULT NULL,
  `field_bizplan9ii_list` tinyint(4) DEFAULT NULL,
  `field_bizplan9ii_data` text,
  `field_orgdocument9ii_fid` int(11) DEFAULT NULL,
  `field_orgdocument9ii_list` tinyint(4) DEFAULT NULL,
  `field_orgdocument9ii_data` text,
  `field_uploadscomments9ii_value` longtext,
  `field_incubatorsexplain9ii_value` varchar(200) DEFAULT NULL,
  `field_statementofagreement9ii_value` longtext,
  `field_percentageofrevenue9ii_value` varchar(20) DEFAULT NULL,
  `field_whichprintoronline9ii_value` longtext,
  `field_explainother9ii_value` varchar(250) DEFAULT NULL,
  `field_totalrevenuegenerated9ii_value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_format_locale`
--

DROP TABLE IF EXISTS `date_format_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `language` varchar(12) NOT NULL,
  PRIMARY KEY (`type`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_format_types`
--

DROP TABLE IF EXISTS `date_format_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_types` (
  `type` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devel_queries`
--

DROP TABLE IF EXISTS `devel_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devel_queries` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(255) NOT NULL DEFAULT '',
  `query` text NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devel_times`
--

DROP TABLE IF EXISTS `devel_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devel_times` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `time` float DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=2485 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_formats`
--

DROP TABLE IF EXISTS `filter_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_youtube_metadata`
--

DROP TABLE IF EXISTS `media_youtube_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_youtube_metadata` (
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `last_touched` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`),
  KEY `status` (`status`),
  KEY `last_touched` (`last_touched`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_youtube_node_data`
--

DROP TABLE IF EXISTS `media_youtube_node_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_youtube_node_data` (
  `value` varchar(255) DEFAULT NULL,
  `vid` int(10) unsigned NOT NULL,
  `field_name` varchar(255) NOT NULL DEFAULT '',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `value` (`value`),
  KEY `vid` (`vid`),
  KEY `field_name` (`field_name`),
  KEY `delta` (`delta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM AUTO_INCREMENT=33876 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_router`
--

DROP TABLE IF EXISTS `menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM AUTO_INCREMENT=81864 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_counter`
--

DROP TABLE IF EXISTS `node_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_field_matrix_data`
--

DROP TABLE IF EXISTS `node_field_matrix_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_field_matrix_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `row` int(10) unsigned NOT NULL DEFAULT '0',
  `col` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  KEY `nid` (`nid`),
  KEY `vid` (`vid`),
  KEY `field_name` (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_import_status`
--

DROP TABLE IF EXISTS `node_import_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_import_status` (
  `taskid` int(10) unsigned NOT NULL DEFAULT '0',
  `file_offset` int(10) unsigned NOT NULL DEFAULT '0',
  `errors` longtext NOT NULL,
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_import_tasks`
--

DROP TABLE IF EXISTS `node_import_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_import_tasks` (
  `taskid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  `changed` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `has_headers` int(10) unsigned NOT NULL DEFAULT '1',
  `file_options` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT '',
  `map` longtext NOT NULL,
  `defaults` longtext NOT NULL,
  `options` longtext NOT NULL,
  `file_offset` int(10) unsigned NOT NULL DEFAULT '0',
  `row_done` int(10) unsigned NOT NULL DEFAULT '0',
  `row_error` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_revisions`
--

DROP TABLE IF EXISTS `node_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=81865 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_detail`
--

DROP TABLE IF EXISTS `performance_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_detail` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `bytes` int(11) NOT NULL DEFAULT '0',
  `ms` int(11) NOT NULL DEFAULT '0',
  `query_count` int(11) NOT NULL DEFAULT '0',
  `query_timer` int(11) NOT NULL DEFAULT '0',
  `anon` int(11) DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`pid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=960200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_summary`
--

DROP TABLE IF EXISTS `performance_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_summary` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `last_access` int(11) NOT NULL DEFAULT '0',
  `bytes_max` int(11) NOT NULL DEFAULT '0',
  `bytes_avg` int(11) NOT NULL DEFAULT '0',
  `ms_max` int(11) NOT NULL DEFAULT '0',
  `ms_avg` int(11) NOT NULL DEFAULT '0',
  `query_count_max` int(11) NOT NULL DEFAULT '0',
  `query_count_avg` int(11) NOT NULL DEFAULT '0',
  `query_timer_max` int(11) NOT NULL DEFAULT '0',
  `query_timer_avg` int(11) NOT NULL DEFAULT '0',
  `num_accesses` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`path`),
  KEY `last_access` (`last_access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `print_node_conf`
--

DROP TABLE IF EXISTS `print_node_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_node_conf` (
  `nid` int(10) unsigned NOT NULL,
  `link` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `comments` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_list` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `print_page_counter`
--

DROP TABLE IF EXISTS `print_page_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_page_counter` (
  `path` varchar(128) NOT NULL,
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `print_pdf_node_conf`
--

DROP TABLE IF EXISTS `print_pdf_node_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_pdf_node_conf` (
  `nid` int(10) unsigned NOT NULL,
  `link` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `comments` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_list` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `print_pdf_page_counter`
--

DROP TABLE IF EXISTS `print_pdf_page_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_pdf_page_counter` (
  `path` varchar(128) NOT NULL,
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile_fields`
--

DROP TABLE IF EXISTS `profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_fields` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `explanation` text,
  `category` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `register` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `autocomplete` tinyint(4) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile_values`
--

DROP TABLE IF EXISTS `profile_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_values` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_rules`
--

DROP TABLE IF EXISTS `rules_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_rules` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_sets`
--

DROP TABLE IF EXISTS `rules_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_sets` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_dataset`
--

DROP TABLE IF EXISTS `search_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `score` float DEFAULT NULL,
  UNIQUE KEY `word_sid_type` (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_node_links`
--

DROP TABLE IF EXISTS `search_node_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `caption` longtext,
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_total`
--

DROP TABLE IF EXISTS `search_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semaphore`
--

DROP TABLE IF EXISTS `semaphore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_data`
--

DROP TABLE IF EXISTS `term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_hierarchy`
--

DROP TABLE IF EXISTS `term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_node`
--

DROP TABLE IF EXISTS `term_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_relation`
--

DROP TABLE IF EXISTS `term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `term_synonym`
--

DROP TABLE IF EXISTS `term_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_assignments`
--

DROP TABLE IF EXISTS `trigger_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_assignments` (
  `hook` varchar(32) NOT NULL DEFAULT '',
  `op` varchar(32) NOT NULL DEFAULT '',
  `aid` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hook`,`op`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `list` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`,`fid`),
  KEY `fid` (`fid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=51559 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  `timezone_name` varchar(50) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=35498 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `views_display`
--

DROP TABLE IF EXISTS `views_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `id` varchar(64) NOT NULL DEFAULT '',
  `display_title` varchar(64) NOT NULL DEFAULT '',
  `display_plugin` varchar(64) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '0',
  `display_options` longtext,
  PRIMARY KEY (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `views_object_cache`
--

DROP TABLE IF EXISTS `views_object_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_object_cache` (
  `sid` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `obj` varchar(32) DEFAULT NULL,
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  KEY `sid_obj_name` (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `views_view`
--

DROP TABLE IF EXISTS `views_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `base_table` varchar(64) NOT NULL DEFAULT '',
  `core` int(11) DEFAULT '0',
  `human_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vocabulary_node_types`
--

DROP TABLE IF EXISTS `vocabulary_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=1222420 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform`
--

DROP TABLE IF EXISTS `webform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform` (
  `nid` int(10) unsigned NOT NULL,
  `confirmation` text NOT NULL,
  `teaser` tinyint(4) NOT NULL DEFAULT '0',
  `submit_text` varchar(255) DEFAULT NULL,
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1',
  `submit_interval` int(11) NOT NULL DEFAULT '-1',
  `additional_validate` text,
  `additional_submit` text,
  `confirmation_format` tinyint(4) NOT NULL DEFAULT '0',
  `submit_notice` tinyint(4) NOT NULL DEFAULT '1',
  `allow_draft` tinyint(4) NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) DEFAULT '<confirmation>',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `auto_save` tinyint(4) NOT NULL DEFAULT '0',
  `total_submit_limit` int(11) NOT NULL DEFAULT '-1',
  `total_submit_interval` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_component`
--

DROP TABLE IF EXISTS `webform_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_component` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `form_key` varchar(128) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `value` text NOT NULL,
  `extra` text NOT NULL,
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `weight` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_emails`
--

DROP TABLE IF EXISTS `webform_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_emails` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `eid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` text,
  `subject` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `template` text,
  `excluded_components` text NOT NULL,
  `html` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_last_download`
--

DROP TABLE IF EXISTS `webform_last_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_last_download` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `requested` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_roles`
--

DROP TABLE IF EXISTS `webform_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_roles` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_submissions`
--

DROP TABLE IF EXISTS `webform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_submissions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(128) DEFAULT NULL,
  `is_draft` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`),
  KEY `nid_sid` (`nid`,`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=1106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_submitted_data`
--

DROP TABLE IF EXISTS `webform_submitted_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `no` varchar(128) NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`nid`,`sid`,`cid`,`no`),
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wysiwyg`
--

DROP TABLE IF EXISTS `wysiwyg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wysiwyg` (
  `format` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(128) NOT NULL DEFAULT '',
  `settings` text,
  PRIMARY KEY (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-04 22:14:23
