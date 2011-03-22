#  Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.37)
# Database: _drupal_inbode
# Generation Time: 2011-03-22 08:14:07 -0500
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` (`aid`,`type`,`callback`,`parameters`,`description`)
VALUES
	('comment_unpublish_action','comment','comment_unpublish_action','','Unpublish comment'),
	('node_publish_action','node','node_publish_action','','Publish post'),
	('node_unpublish_action','node','node_unpublish_action','','Unpublish post'),
	('node_make_sticky_action','node','node_make_sticky_action','','Make post sticky'),
	('node_make_unsticky_action','node','node_make_unsticky_action','','Make post unsticky'),
	('node_promote_action','node','node_promote_action','','Promote post to front page'),
	('node_unpromote_action','node','node_unpromote_action','','Remove post from front page'),
	('node_save_action','node','node_save_action','','Save post'),
	('user_block_user_action','user','user_block_user_action','','Block current user'),
	('user_block_ip_action','user','user_block_ip_action','','Ban IP address of current user'),
	('backup_migrate_backup_action','system','backup_migrate_backup_action','','Backup the database with the default settings');

/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table actions_aid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actions_aid`;

CREATE TABLE `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table authmap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authmap`;

CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;



# Dump of table blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocks`;

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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` (`bid`,`module`,`delta`,`theme`,`status`,`weight`,`region`,`custom`,`throttle`,`visibility`,`pages`,`title`,`cache`)
VALUES
	(1,'user','0','garland',0,1,'',0,0,0,'','',-1),
	(2,'user','1','garland',0,0,'',0,0,0,'','',-1),
	(3,'system','0','garland',0,-5,'',0,0,0,'','',-1),
	(4,'comment','0','garland',0,-4,'',0,0,0,'','',1),
	(5,'menu','primary-links','garland',0,-5,'',0,0,0,'','',-1),
	(6,'menu','secondary-links','garland',0,-3,'',0,0,0,'','',-1),
	(7,'node','0','garland',0,-2,'',0,0,0,'','',-1),
	(8,'user','2','garland',0,-1,'',0,0,0,'','',1),
	(9,'user','3','garland',0,2,'',0,0,0,'','',-1),
	(10,'comment','0','zen_classic',0,-4,'left',0,0,0,'','',1),
	(11,'menu','primary-links','zen_classic',0,-5,'left',0,0,0,'','',-1),
	(12,'menu','secondary-links','zen_classic',0,-3,'left',0,0,0,'','',-1),
	(13,'node','0','zen_classic',0,-2,'left',0,0,0,'','',-1),
	(14,'system','0','zen_classic',0,-5,'left',0,0,0,'','',-1),
	(15,'user','0','zen_classic',0,1,'left',0,0,0,'','',-1),
	(16,'user','1','zen_classic',0,0,'left',0,0,0,'','',-1),
	(17,'user','2','zen_classic',0,-1,'left',0,0,0,'','',1),
	(18,'user','3','zen_classic',0,2,'left',0,0,0,'','',-1),
	(20,'menu','primary-links','inbode',0,-6,'',0,0,0,'','',-1),
	(21,'menu','secondary-links','inbode',0,-5,'',0,0,0,'','',-1),
	(22,'node','0','inbode',0,-4,'',0,0,0,'','',-1),
	(23,'system','0','inbode',0,-7,'',0,0,0,'','',-1),
	(24,'user','0','inbode',0,2,'',0,0,0,'','',-1),
	(25,'user','1','inbode',0,0,'',0,0,0,'','',-1),
	(26,'user','2','inbode',0,-3,'',0,0,0,'','',1),
	(27,'user','3','inbode',0,3,'',0,0,0,'','',-1),
	(28,'block','1','inbode',1,-7,'header',0,0,0,'','',-1),
	(29,'profile','0','inbode',0,-2,'',0,0,0,'','',5),
	(30,'search','0','inbode',0,1,'',0,0,0,'','',-1),
	(31,'logintoboggan','0','inbode',0,0,'',0,0,0,'','',-1),
	(32,'block','2','inbode',1,-1,'header',0,0,0,'','',-1);

/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blocks_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocks_roles`;

CREATE TABLE `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `blocks_roles` WRITE;
/*!40000 ALTER TABLE `blocks_roles` DISABLE KEYS */;
INSERT INTO `blocks_roles` (`module`,`delta`,`rid`)
VALUES
	('block','1',1),
	('block','2',2);

/*!40000 ALTER TABLE `blocks_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table boxes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `boxes`;

CREATE TABLE `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;
INSERT INTO `boxes` (`bid`,`body`,`info`,`format`)
VALUES
	(1,'Hello! <a href=\"/user\">Login</a>','Anonymous Login Block',3),
	(2,'<?php\r\n\r\nglobal $user;\r\nprint \"Hello \";\r\nprint l($user->mail, \"user/\".$user->uid.\"/edit\");\r\nprint \" | \";\r\nprint l(\"Logout\",\"logout\");\r\n\r\n\r\n?>','Greeting Box',5);

/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

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



# Dump of table cache_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_block`;

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



# Dump of table cache_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_content`;

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



# Dump of table cache_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_filter`;

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



# Dump of table cache_form
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_form`;

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



# Dump of table cache_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_location`;

CREATE TABLE `cache_location` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table cache_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_menu`;

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



# Dump of table cache_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_page`;

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



# Dump of table cache_update
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_update`;

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



# Dump of table cache_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_views`;

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



# Dump of table cache_views_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_views_data`;

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



# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

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
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_field_building_amenities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_field_building_amenities`;

CREATE TABLE `content_field_building_amenities` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_building_amenities_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_field_building_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_field_building_images`;

CREATE TABLE `content_field_building_images` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_building_images_fid` int(11) DEFAULT NULL,
  `field_building_images_list` tinyint(4) DEFAULT NULL,
  `field_building_images_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_field_building_more_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_field_building_more_images`;

CREATE TABLE `content_field_building_more_images` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_building_more_images_fid` int(11) DEFAULT NULL,
  `field_building_more_images_list` tinyint(4) DEFAULT NULL,
  `field_building_more_images_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `content_field_building_more_images` WRITE;
/*!40000 ALTER TABLE `content_field_building_more_images` DISABLE KEYS */;
INSERT INTO `content_field_building_more_images` (`vid`,`nid`,`delta`,`field_building_more_images_fid`,`field_building_more_images_list`,`field_building_more_images_data`)
VALUES
	(3,3,0,NULL,NULL,NULL),
	(4,4,0,NULL,NULL,NULL),
	(8,8,0,NULL,NULL,NULL),
	(11,11,0,NULL,NULL,NULL),
	(52,52,0,NULL,NULL,NULL),
	(54,54,0,NULL,NULL,NULL),
	(58,58,0,NULL,NULL,NULL),
	(60,60,0,NULL,NULL,NULL),
	(62,62,0,NULL,NULL,NULL);

/*!40000 ALTER TABLE `content_field_building_more_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_field_unit_amenities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_field_unit_amenities`;

CREATE TABLE `content_field_unit_amenities` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_unit_amenities_value` longtext,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `content_field_unit_amenities` WRITE;
/*!40000 ALTER TABLE `content_field_unit_amenities` DISABLE KEYS */;
INSERT INTO `content_field_unit_amenities` (`vid`,`nid`,`delta`,`field_unit_amenities_value`)
VALUES
	(46,46,0,NULL),
	(50,50,0,NULL);

/*!40000 ALTER TABLE `content_field_unit_amenities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_field_unit_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_field_unit_images`;

CREATE TABLE `content_field_unit_images` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `delta` int(10) unsigned NOT NULL DEFAULT '0',
  `field_unit_images_fid` int(11) DEFAULT NULL,
  `field_unit_images_list` tinyint(4) DEFAULT NULL,
  `field_unit_images_data` text,
  PRIMARY KEY (`vid`,`delta`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `content_field_unit_images` WRITE;
/*!40000 ALTER TABLE `content_field_unit_images` DISABLE KEYS */;
INSERT INTO `content_field_unit_images` (`vid`,`nid`,`delta`,`field_unit_images_fid`,`field_unit_images_list`,`field_unit_images_data`)
VALUES
	(46,46,0,NULL,NULL,NULL),
	(46,46,1,NULL,NULL,NULL),
	(51,11,1,14,1,'a:11:{s:11:\"description\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:0:\"\";s:8:\"duration\";i:0;s:6:\"height\";i:960;s:5:\"width\";i:1280;s:18:\"audio_bitrate_mode\";s:0:\"\";s:18:\"audio_channel_mode\";s:0:\"\";s:12:\"audio_format\";s:0:\"\";s:13:\"audio_bitrate\";i:0;s:17:\"audio_sample_rate\";i:0;}'),
	(50,50,0,NULL,NULL,NULL),
	(50,50,1,NULL,NULL,NULL),
	(51,11,0,13,1,'a:11:{s:11:\"description\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:0:\"\";s:8:\"duration\";i:0;s:6:\"height\";i:960;s:5:\"width\";i:1280;s:18:\"audio_bitrate_mode\";s:0:\"\";s:18:\"audio_channel_mode\";s:0:\"\";s:12:\"audio_format\";s:0:\"\";s:13:\"audio_bitrate\";i:0;s:17:\"audio_sample_rate\";i:0;}');

/*!40000 ALTER TABLE `content_field_unit_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_group`;

CREATE TABLE `content_group` (
  `group_type` varchar(32) NOT NULL DEFAULT 'standard',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_name`,`group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_group_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_group_fields`;

CREATE TABLE `content_group_fields` (
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_name`,`group_name`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_node_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_node_field`;

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

LOCK TABLES `content_node_field` WRITE;
/*!40000 ALTER TABLE `content_node_field` DISABLE KEYS */;
INSERT INTO `content_node_field` (`field_name`,`type`,`global_settings`,`required`,`multiple`,`db_storage`,`module`,`db_columns`,`active`,`locked`)
VALUES
	('field_unit_bedroom','number_integer','a:6:{s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:14:\"allowed_values\";s:23:\"1|1\r\n2|2\r\n3|3\r\n4|4\r\n5|5\";s:18:\"allowed_values_php\";s:0:\"\";}',1,0,1,'number','a:1:{s:5:\"value\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;}}',1,0),
	('field_unit_bathroom','number_integer','a:6:{s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:14:\"allowed_values\";s:42:\"1|1\r\n1.25|1.25\r\n1.5|1.5\r\n2|2\r\n2.5|2.5\r\n3|3\";s:18:\"allowed_values_php\";s:0:\"\";}',1,0,1,'number','a:1:{s:5:\"value\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;}}',1,0),
	('field_unit_price','money','a:2:{s:9:\"precision\";s:2:\"10\";s:8:\"decimals\";s:1:\"2\";}',1,0,1,'money','a:2:{s:6:\"amount\";a:6:{s:4:\"type\";s:7:\"numeric\";s:9:\"precision\";s:2:\"10\";s:5:\"scale\";s:1:\"2\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}s:8:\"currency\";a:5:{s:4:\"type\";s:7:\"varchar\";s:6:\"length\";i:3;s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_area','formatted_integer','a:4:{s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}',1,0,1,'formatted_number','a:1:{s:5:\"value\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;}}',1,0),
	('field_unit_available','date','a:7:{s:11:\"granularity\";a:3:{s:4:\"year\";s:4:\"year\";s:5:\"month\";s:5:\"month\";s:3:\"day\";s:3:\"day\";}s:11:\"timezone_db\";s:0:\"\";s:11:\"tz_handling\";s:4:\"none\";s:6:\"todate\";s:0:\"\";s:6:\"repeat\";i:0;s:16:\"repeat_collapsed\";s:0:\"\";s:14:\"default_format\";s:6:\"medium\";}',1,0,1,'date','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:7:\"varchar\";s:6:\"length\";i:20;s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_amenities','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:126:\"in-unit-laundry|In-unit Laundry\r\ndishwasher|Dishwasher\r\ndisposal|Disposal\r\nbalcony|Balcony\r\nfurnished|Furnished\r\ngarage|Garage\";s:18:\"allowed_values_php\";s:0:\"\";}',0,1,0,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_images','filefield','a:3:{s:10:\"list_field\";s:1:\"0\";s:12:\"list_default\";i:1;s:17:\"description_field\";s:1:\"0\";}',1,4,0,'filefield','a:3:{s:3:\"fid\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:5:\"views\";b:1;}s:4:\"list\";a:4:{s:4:\"type\";s:3:\"int\";s:4:\"size\";s:4:\"tiny\";s:8:\"not null\";b:0;s:5:\"views\";b:1;}s:4:\"data\";a:3:{s:4:\"type\";s:4:\"text\";s:9:\"serialize\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_building_amenities','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:62:\"cats|Cats\r\nsmall-dogs|Small Dogs\r\nbig-dogs|Big Dogs\r\npool|Pool\";s:18:\"allowed_values_php\";s:0:\"\";}',0,1,0,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_building_images','filefield','a:3:{s:10:\"list_field\";s:1:\"0\";s:12:\"list_default\";i:1;s:17:\"description_field\";s:1:\"0\";}',0,1,0,'filefield','a:3:{s:3:\"fid\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:5:\"views\";b:1;}s:4:\"list\";a:4:{s:4:\"type\";s:3:\"int\";s:4:\"size\";s:4:\"tiny\";s:8:\"not null\";b:0;s:5:\"views\";b:1;}s:4:\"data\";a:3:{s:4:\"type\";s:4:\"text\";s:9:\"serialize\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_building','nodereference','a:3:{s:19:\"referenceable_types\";a:3:{s:8:\"building\";s:8:\"building\";s:4:\"page\";i:0;s:4:\"unit\";i:0;}s:13:\"advanced_view\";s:2:\"--\";s:18:\"advanced_view_args\";s:0:\"\";}',1,0,1,'nodereference','a:1:{s:3:\"nid\";a:4:{s:4:\"type\";s:3:\"int\";s:8:\"unsigned\";b:1;s:8:\"not null\";b:0;s:5:\"index\";b:1;}}',1,0),
	('field_building_address','location','a:3:{s:17:\"location_settings\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:8:{s:4:\"name\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"collect\";s:1:\"4\";s:7:\"default\";s:2:\"us\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:2:{s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"20\";}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:7:\"locpick\";s:7:\"locpick\";s:13:\"province_name\";s:13:\"province_name\";s:12:\"country_name\";s:12:\"country_name\";s:8:\"map_link\";s:8:\"map_link\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;}}}s:10:\"gmap_macro\";s:7:\"[gmap ]\";s:11:\"gmap_marker\";s:6:\"drupal\";}',1,0,1,'location_cck','a:1:{s:3:\"lid\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"unsigned\";b:1;s:8:\"not null\";b:0;}}',1,0),
	('field_building_description','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:0:\"\";s:18:\"allowed_values_php\";s:0:\"\";}',0,0,1,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_description','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:0:\"\";s:18:\"allowed_values_php\";s:0:\"\";}',0,0,1,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_status','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:47:\"listed|Listed\r\nrented|Rented\r\ninactive|Inactive\";s:18:\"allowed_values_php\";s:0:\"\";}',1,0,1,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_featureid','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:0:\"\";s:18:\"allowed_values_php\";s:0:\"\";}',0,0,1,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0),
	('field_unit_craigslist_views','number_integer','a:6:{s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:14:\"allowed_values\";s:0:\"\";s:18:\"allowed_values_php\";s:0:\"\";}',0,0,1,'number','a:1:{s:5:\"value\";a:3:{s:4:\"type\";s:3:\"int\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;}}',1,0),
	('field_unit_email','text','a:4:{s:15:\"text_processing\";s:1:\"0\";s:10:\"max_length\";s:0:\"\";s:14:\"allowed_values\";s:0:\"\";s:18:\"allowed_values_php\";s:0:\"\";}',0,0,1,'text','a:1:{s:5:\"value\";a:5:{s:4:\"type\";s:4:\"text\";s:4:\"size\";s:3:\"big\";s:8:\"not null\";b:0;s:8:\"sortable\";b:1;s:5:\"views\";b:1;}}',1,0);

/*!40000 ALTER TABLE `content_node_field` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_node_field_instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_node_field_instance`;

CREATE TABLE `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `content_node_field_instance` WRITE;
/*!40000 ALTER TABLE `content_node_field_instance` DISABLE KEYS */;
INSERT INTO `content_node_field_instance` (`field_name`,`type_name`,`weight`,`label`,`widget_type`,`widget_settings`,`display_settings`,`description`,`widget_module`,`widget_active`)
VALUES
	('field_unit_bedroom','unit',3,'Beds','optionwidgets_select','a:2:{s:13:\"default_value\";a:1:{i:0;a:1:{s:5:\"value\";s:0:\"\";}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','optionwidgets',1),
	('field_unit_bathroom','unit',4,'Baths','optionwidgets_select','a:2:{s:13:\"default_value\";a:1:{i:0;a:1:{s:5:\"value\";s:0:\"\";}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','optionwidgets',1),
	('field_unit_price','unit',5,'Price','money_widget','a:6:{s:20:\"currency_select_mode\";s:4:\"code\";s:21:\"currency_display_mode\";s:5:\"s|+|a\";s:21:\"decimals_display_mode\";s:5:\"field\";s:18:\"allowed_currencies\";a:161:{s:3:\"USD\";s:3:\"USD\";s:3:\"AFA\";i:0;s:3:\"ALL\";i:0;s:3:\"DZD\";i:0;s:3:\"ARS\";i:0;s:3:\"AWG\";i:0;s:3:\"AUD\";i:0;s:3:\"AZN\";i:0;s:3:\"BSD\";i:0;s:3:\"BHD\";i:0;s:3:\"BDT\";i:0;s:3:\"BBD\";i:0;s:3:\"BYR\";i:0;s:3:\"BZD\";i:0;s:3:\"BMD\";i:0;s:3:\"BTN\";i:0;s:3:\"BOB\";i:0;s:3:\"BAM\";i:0;s:3:\"BWP\";i:0;s:3:\"BRL\";i:0;s:3:\"GBP\";i:0;s:3:\"BND\";i:0;s:3:\"BGN\";i:0;s:3:\"BIF\";i:0;s:3:\"KHR\";i:0;s:3:\"CAD\";i:0;s:3:\"CVE\";i:0;s:3:\"KYD\";i:0;s:3:\"XOF\";i:0;s:3:\"XAF\";i:0;s:3:\"CLP\";i:0;s:3:\"CNY\";i:0;s:3:\"COP\";i:0;s:3:\"KMF\";i:0;s:3:\"CRC\";i:0;s:3:\"HRK\";i:0;s:3:\"CUP\";i:0;s:3:\"CYP\";i:0;s:3:\"CZK\";i:0;s:3:\"DKK\";i:0;s:3:\"DJF\";i:0;s:3:\"DOP\";i:0;s:3:\"XCD\";i:0;s:3:\"EGP\";i:0;s:3:\"SVC\";i:0;s:3:\"ERN\";i:0;s:3:\"EEK\";i:0;s:3:\"ETB\";i:0;s:3:\"EUR\";i:0;s:3:\"FKP\";i:0;s:3:\"FJD\";i:0;s:3:\"GMD\";i:0;s:3:\"GHC\";i:0;s:3:\"GIP\";i:0;s:3:\"XAU\";i:0;s:3:\"GTQ\";i:0;s:3:\"GGP\";i:0;s:3:\"GNF\";i:0;s:3:\"GYD\";i:0;s:3:\"HTG\";i:0;s:3:\"HNL\";i:0;s:3:\"HKD\";i:0;s:3:\"HUF\";i:0;s:3:\"ISK\";i:0;s:3:\"INR\";i:0;s:3:\"IDR\";i:0;s:3:\"IRR\";i:0;s:3:\"IQD\";i:0;s:3:\"ILS\";i:0;s:3:\"JMD\";i:0;s:3:\"JPY\";i:0;s:3:\"JOD\";i:0;s:3:\"KZT\";i:0;s:3:\"KES\";i:0;s:3:\"KRW\";i:0;s:3:\"KWD\";i:0;s:3:\"KGS\";i:0;s:3:\"LAK\";i:0;s:3:\"LVL\";i:0;s:3:\"LBP\";i:0;s:3:\"LSL\";i:0;s:3:\"LRD\";i:0;s:3:\"LYD\";i:0;s:3:\"LTL\";i:0;s:3:\"MOP\";i:0;s:3:\"MKD\";i:0;s:3:\"MGA\";i:0;s:3:\"MWK\";i:0;s:3:\"MYR\";i:0;s:3:\"MVR\";i:0;s:3:\"MTL\";i:0;s:3:\"MRO\";i:0;s:3:\"MUR\";i:0;s:3:\"MXN\";i:0;s:3:\"MDL\";i:0;s:3:\"MNT\";i:0;s:3:\"MAD\";i:0;s:3:\"MZM\";i:0;s:3:\"MMK\";i:0;s:3:\"NAD\";i:0;s:3:\"NPR\";i:0;s:3:\"ANG\";i:0;s:3:\"TRY\";i:0;s:3:\"NZD\";i:0;s:3:\"NIO\";i:0;s:3:\"NGN\";i:0;s:3:\"KPW\";i:0;s:3:\"NOK\";i:0;s:3:\"OMR\";i:0;s:3:\"XPF\";i:0;s:3:\"PKR\";i:0;s:3:\"XPD\";i:0;s:3:\"PAB\";i:0;s:3:\"PGK\";i:0;s:3:\"PYG\";i:0;s:3:\"PEN\";i:0;s:3:\"PHP\";i:0;s:3:\"XPT\";i:0;s:3:\"PLN\";i:0;s:3:\"QAR\";i:0;s:3:\"RON\";i:0;s:3:\"RUB\";i:0;s:3:\"RWF\";i:0;s:3:\"WST\";i:0;s:3:\"STD\";i:0;s:3:\"SAR\";i:0;s:3:\"SCR\";i:0;s:3:\"RSD\";i:0;s:3:\"SLL\";i:0;s:3:\"XAG\";i:0;s:3:\"SGD\";i:0;s:3:\"SKK\";i:0;s:3:\"SBD\";i:0;s:3:\"SOS\";i:0;s:3:\"ZAR\";i:0;s:3:\"LKR\";i:0;s:3:\"SHP\";i:0;s:3:\"SDD\";i:0;s:3:\"SRD\";i:0;s:3:\"SZL\";i:0;s:3:\"SEK\";i:0;s:3:\"CHF\";i:0;s:3:\"SYP\";i:0;s:3:\"TWD\";i:0;s:3:\"TZS\";i:0;s:3:\"THB\";i:0;s:3:\"TOP\";i:0;s:3:\"TTD\";i:0;s:3:\"TND\";i:0;s:3:\"AED\";i:0;s:3:\"UGX\";i:0;s:3:\"UAH\";i:0;s:3:\"UYU\";i:0;s:3:\"UZS\";i:0;s:3:\"VUV\";i:0;s:3:\"VEB\";i:0;s:3:\"VND\";i:0;s:3:\"YER\";i:0;s:3:\"YUM\";i:0;s:3:\"ZMK\";i:0;s:3:\"ZWD\";i:0;}s:13:\"default_value\";a:1:{i:0;a:3:{s:6:\"amount\";s:0:\"\";s:8:\"currency\";s:0:\"\";s:14:\"_error_element\";s:49:\"default_value_widget][field_unit_price][0][amount\";}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','money',1),
	('field_unit_area','unit',6,'Area','formatted_number','a:2:{s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:14:\"_error_element\";s:47:\"default_value_widget][field_unit_area][0][value\";}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','formatted_number',1),
	('field_unit_available','unit',7,'Available','date_popup','a:10:{s:13:\"default_value\";s:3:\"now\";s:18:\"default_value_code\";s:0:\"\";s:14:\"default_value2\";s:4:\"same\";s:19:\"default_value_code2\";s:0:\"\";s:12:\"input_format\";s:12:\"m/d/Y - g:ia\";s:19:\"input_format_custom\";s:0:\"\";s:9:\"increment\";s:2:\"30\";s:10:\"text_parts\";a:0:{}s:10:\"year_range\";s:5:\"-9:+9\";s:14:\"label_position\";s:6:\"within\";}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','date',1),
	('field_unit_amenities','unit',9,'Amenities','optionwidgets_buttons','a:2:{s:13:\"default_value\";a:1:{i:0;a:1:{s:5:\"value\";N;}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','optionwidgets',1),
	('field_unit_images','unit',10,'Upload Images','swfupload_widget','a:14:{s:15:\"file_extensions\";s:11:\"jpg gif png\";s:9:\"file_path\";s:20:\"uploaded_unit_images\";s:18:\"progress_indicator\";s:3:\"bar\";s:21:\"max_filesize_per_file\";s:2:\"1M\";s:21:\"max_filesize_per_node\";s:0:\"\";s:14:\"max_resolution\";s:9:\"1280x1024\";s:14:\"min_resolution\";s:7:\"640x480\";s:3:\"alt\";s:0:\"\";s:10:\"custom_alt\";i:0;s:5:\"title\";s:0:\"\";s:12:\"custom_title\";i:0;s:10:\"title_type\";s:9:\"textfield\";s:13:\"default_image\";N;s:17:\"use_default_image\";i:0;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}}','','swfupload',1),
	('field_building_amenities','building',-1,'Amenities','optionwidgets_buttons','a:2:{s:13:\"default_value\";a:1:{i:0;a:1:{s:5:\"value\";N;}}s:17:\"default_value_php\";N;}','a:8:{s:6:\"weight\";s:2:\"-1\";s:6:\"parent\";s:0:\"\";i:4;a:2:{s:6:\"format\";s:6:\"hidden\";s:7:\"exclude\";i:0;}s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','optionwidgets',1),
	('field_building_images','building',0,'Upload Images','swfupload_widget','a:14:{s:15:\"file_extensions\";s:11:\"jpg gif png\";s:9:\"file_path\";s:0:\"\";s:18:\"progress_indicator\";s:3:\"bar\";s:21:\"max_filesize_per_file\";s:2:\"1M\";s:21:\"max_filesize_per_node\";s:0:\"\";s:14:\"max_resolution\";s:9:\"1280x1024\";s:14:\"min_resolution\";s:7:\"640x480\";s:3:\"alt\";s:0:\"\";s:10:\"custom_alt\";i:0;s:5:\"title\";s:0:\"\";s:12:\"custom_title\";i:0;s:10:\"title_type\";s:9:\"textfield\";s:13:\"default_image\";N;s:17:\"use_default_image\";i:0;}','a:8:{s:6:\"weight\";i:0;s:6:\"parent\";s:0:\"\";i:4;a:2:{s:6:\"format\";s:6:\"hidden\";s:7:\"exclude\";i:0;}s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:11:\"image_plain\";s:7:\"exclude\";i:0;}}','','swfupload',1),
	('field_unit_building','unit',1,'Building','nodereference_select','a:4:{s:18:\"autocomplete_match\";s:8:\"contains\";s:4:\"size\";i:60;s:13:\"default_value\";a:1:{i:0;a:1:{s:3:\"nid\";s:0:\"\";}}s:17:\"default_value_php\";N;}','a:6:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','nodereference',1),
	('field_building_address','building',-4,'Building\'s Address','location','a:2:{s:13:\"default_value\";a:1:{i:0;a:7:{s:6:\"street\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"province\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:23:\"cck_preview_in_progress\";b:1;s:17:\"location_settings\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:6:\"Street\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:4:\"City\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:5:\"State\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:3:\"Zip\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";b:0;s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";b:0;s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";a:2:{s:13:\"user_latitude\";s:0:\"\";s:14:\"user_longitude\";s:0:\"\";}s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";a:2:{s:13:\"user_latitude\";s:0:\"\";s:14:\"user_longitude\";s:0:\"\";}s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";b:0;s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"4\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";a:2:{s:13:\"user_latitude\";s:0:\"\";s:14:\"user_longitude\";s:0:\"\";}s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";a:2:{s:13:\"user_latitude\";s:0:\"\";s:14:\"user_longitude\";s:0:\"\";}s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:2:{s:4:\"form\";a:1:{s:6:\"fields\";a:16:{s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";s:1:\"0\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:4:{s:7:\"default\";a:2:{s:13:\"user_latitude\";s:0:\"\";s:14:\"user_longitude\";s:0:\"\";}s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";s:6:\"nodiff\";b:1;}s:23:\"cck_preview_in_progress\";a:1:{s:7:\"default\";b:1;}s:17:\"location_settings\";a:1:{s:7:\"default\";a:1:{s:4:\"form\";a:1:{s:6:\"fields\";a:14:{s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:4:\"name\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";i:2;}s:6:\"street\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";i:4;}s:10:\"additional\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:1;s:6:\"weight\";i:6;}s:4:\"city\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:0;s:6:\"weight\";i:8;}s:8:\"province\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:0;s:6:\"weight\";i:10;}s:11:\"postal_code\";a:3:{s:7:\"default\";s:0:\"\";s:7:\"collect\";i:0;s:6:\"weight\";i:12;}s:7:\"country\";a:3:{s:7:\"default\";s:2:\"us\";s:7:\"collect\";i:1;s:6:\"weight\";i:14;}s:7:\"locpick\";a:4:{s:7:\"default\";b:0;s:7:\"collect\";i:1;s:6:\"weight\";i:20;s:6:\"nodiff\";b:1;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";i:0;s:6:\"street\";i:0;s:10:\"additional\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:7:\"locpick\";s:7:\"locpick\";s:13:\"province_name\";s:13:\"province_name\";s:12:\"country_name\";s:12:\"country_name\";s:8:\"map_link\";s:8:\"map_link\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;}}}}s:3:\"lid\";a:1:{s:7:\"default\";b:0;}s:8:\"latitude\";a:1:{s:7:\"default\";i:0;}s:9:\"longitude\";a:1:{s:7:\"default\";i:0;}s:6:\"source\";a:1:{s:7:\"default\";i:0;}s:10:\"is_primary\";a:1:{s:7:\"default\";i:0;}s:15:\"delete_location\";a:2:{s:7:\"default\";b:0;s:6:\"nodiff\";b:1;}}}s:7:\"display\";a:1:{s:4:\"hide\";a:12:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:7:\"locpick\";s:7:\"locpick\";s:13:\"province_name\";s:13:\"province_name\";s:12:\"country_name\";s:12:\"country_name\";s:8:\"map_link\";s:8:\"map_link\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;}}}s:7:\"country\";s:2:\"us\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','location_cck',1),
	('field_building_description','building',-3,'Description','text_textarea','a:4:{s:4:\"rows\";s:1:\"4\";s:4:\"size\";i:60;s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:14:\"_error_element\";s:58:\"default_value_widget][field_building_description][0][value\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','text',1),
	('field_unit_description','unit',8,'Description','text_textarea','a:4:{s:4:\"rows\";s:1:\"4\";s:4:\"size\";i:60;s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:14:\"_error_element\";s:54:\"default_value_widget][field_unit_description][0][value\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','text',1),
	('field_unit_status','unit',11,'Status','optionwidgets_select','a:2:{s:13:\"default_value\";a:1:{i:0;a:1:{s:5:\"value\";s:6:\"listed\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','optionwidgets',1),
	('field_featureid','unit',17,'Maps Feature ID','text_textfield','a:4:{s:4:\"rows\";i:5;s:4:\"size\";s:2:\"32\";s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:14:\"_error_element\";s:47:\"default_value_widget][field_featureid][0][value\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','This feature ID is the Google Maps ID this unit corresponds to and is populated automatically by the system. It should not be visible to the manager at any stage, so permissions are set carefully on this field. A super admin user will see this box on the page (which is why you are probably reading this now) and others won\'t. :)','text',1),
	('field_unit_craigslist_views','unit',18,'Craigslist Views','number','a:2:{s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:1:\"0\";s:14:\"_error_element\";s:59:\"default_value_widget][field_unit_craigslist_views][0][value\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','number',1),
	('field_unit_email','unit',12,'Contact Email','text_textfield','a:4:{s:4:\"rows\";i:5;s:4:\"size\";s:2:\"60\";s:13:\"default_value\";a:1:{i:0;a:2:{s:5:\"value\";s:0:\"\";s:14:\"_error_element\";s:48:\"default_value_widget][field_unit_email][0][value\";}}s:17:\"default_value_php\";N;}','a:7:{s:5:\"label\";a:2:{s:6:\"format\";s:5:\"above\";s:7:\"exclude\";i:0;}s:6:\"teaser\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:4:\"full\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:4;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:2;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}i:3;a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}s:5:\"token\";a:2:{s:6:\"format\";s:7:\"default\";s:7:\"exclude\";i:0;}}','','text',1);

/*!40000 ALTER TABLE `content_node_field_instance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_type_building
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_type_building`;

CREATE TABLE `content_type_building` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_building_address_lid` int(10) unsigned DEFAULT NULL,
  `field_building_description_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table content_type_unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_type_unit`;

CREATE TABLE `content_type_unit` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `field_unit_bedroom_value` int(11) DEFAULT NULL,
  `field_unit_bathroom_value` int(11) DEFAULT NULL,
  `field_unit_price_amount` decimal(10,2) DEFAULT NULL,
  `field_unit_price_currency` varchar(3) DEFAULT NULL,
  `field_unit_area_value` int(11) DEFAULT NULL,
  `field_unit_available_value` varchar(20) DEFAULT NULL,
  `field_unit_building_nid` int(10) unsigned DEFAULT NULL,
  `field_unit_description_value` longtext,
  `field_unit_status_value` longtext,
  `field_featureid_value` longtext,
  `field_unit_craigslist_views_value` int(11) DEFAULT NULL,
  `field_unit_email_value` longtext,
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `field_unit_building_nid` (`field_unit_building_nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table currencyapi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencyapi`;

CREATE TABLE `currencyapi` (
  `currency_from` varchar(10) NOT NULL DEFAULT '',
  `currency_to` varchar(10) NOT NULL DEFAULT '',
  `rate` float NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`currency_from`,`currency_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table date_format_locale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `date_format_locale`;

CREATE TABLE `date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `language` varchar(12) NOT NULL,
  PRIMARY KEY (`type`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table date_format_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `date_format_types`;

CREATE TABLE `date_format_types` (
  `type` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `date_format_types` WRITE;
/*!40000 ALTER TABLE `date_format_types` DISABLE KEYS */;
INSERT INTO `date_format_types` (`type`,`title`,`locked`)
VALUES
	('long','Long',1),
	('medium','Medium',1),
	('short','Short',1);

/*!40000 ALTER TABLE `date_format_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table date_formats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `date_formats`;

CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
INSERT INTO `date_formats` (`dfid`,`format`,`type`,`locked`)
VALUES
	(1,'Y-m-d H:i','short',1),
	(2,'m/d/Y - H:i','short',1),
	(3,'d/m/Y - H:i','short',1),
	(4,'Y/m/d - H:i','short',1),
	(5,'d.m.Y - H:i','short',1),
	(6,'m/d/Y - g:ia','short',1),
	(7,'d/m/Y - g:ia','short',1),
	(8,'Y/m/d - g:ia','short',1),
	(9,'M j Y - H:i','short',1),
	(10,'j M Y - H:i','short',1),
	(11,'Y M j - H:i','short',1),
	(12,'M j Y - g:ia','short',1),
	(13,'j M Y - g:ia','short',1),
	(14,'Y M j - g:ia','short',1),
	(15,'D, Y-m-d H:i','medium',1),
	(16,'D, m/d/Y - H:i','medium',1),
	(17,'D, d/m/Y - H:i','medium',1),
	(18,'D, Y/m/d - H:i','medium',1),
	(19,'F j, Y - H:i','medium',1),
	(20,'j F, Y - H:i','medium',1),
	(21,'Y, F j - H:i','medium',1),
	(22,'D, m/d/Y - g:ia','medium',1),
	(23,'D, d/m/Y - g:ia','medium',1),
	(24,'D, Y/m/d - g:ia','medium',1),
	(25,'F j, Y - g:ia','medium',1),
	(26,'j F Y - g:ia','medium',1),
	(27,'Y, F j - g:ia','medium',1),
	(28,'j. F Y - G:i','medium',1),
	(29,'l, F j, Y - H:i','long',1),
	(30,'l, j F, Y - H:i','long',1),
	(31,'l, Y,  F j - H:i','long',1),
	(32,'l, F j, Y - g:ia','long',1),
	(33,'l, j F Y - g:ia','long',1),
	(34,'l, Y,  F j - g:ia','long',1),
	(35,'l, j. F Y - G:i','long',1);

/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filefield_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filefield_meta`;

CREATE TABLE `filefield_meta` (
  `fid` int(10) unsigned NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `audio_format` varchar(10) NOT NULL DEFAULT '',
  `audio_sample_rate` mediumint(9) NOT NULL DEFAULT '0',
  `audio_channel_mode` varchar(10) NOT NULL DEFAULT '',
  `audio_bitrate` float NOT NULL DEFAULT '0',
  `audio_bitrate_mode` varchar(4) NOT NULL DEFAULT '',
  `tags` text,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `filefield_meta` WRITE;
/*!40000 ALTER TABLE `filefield_meta` DISABLE KEYS */;
INSERT INTO `filefield_meta` (`fid`,`width`,`height`,`duration`,`audio_format`,`audio_sample_rate`,`audio_channel_mode`,`audio_bitrate`,`audio_bitrate_mode`,`tags`)
VALUES
	(13,1280,960,0,'',0,'',0,'',NULL),
	(14,1280,960,0,'',0,'',0,'',NULL),
	(221,729,1024,0,'',0,'',0,'',NULL),
	(70,640,480,0,'',0,'',0,'','a:0:{}'),
	(165,1213,1024,0,'',0,'',0,'',NULL),
	(167,1213,1024,0,'',0,'',0,'',NULL),
	(189,1213,1024,0,'',0,'',0,'',NULL);

/*!40000 ALTER TABLE `filefield_meta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files`;

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
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`fid`,`uid`,`filename`,`filepath`,`filemime`,`filesize`,`status`,`timestamp`)
VALUES
	(13,7,'IqqwqweMG_0001.JPG','sites/default/files/uploaded_unit_images/IqqwqweMG_0001.JPG','image/jpeg',82333,1,1281015766),
	(14,7,'IqqwqweMG_0001.JPG','sites/default/files/uploaded_unit_images/IqqwqweMG_0001_0.JPG','image/jpeg',82333,1,1281015766),
	(221,1,'CoopersRocket.jpg','sites/default/files/uploaded_unit_images/CoopersRocket.jpg','image/jpeg',312400,0,1300334296),
	(70,1,'640x480.jpg','sites/default/files/640x480.jpg','image/jpeg',8263,1,1299337117),
	(71,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM.png','image/png',235412,0,1299533301),
	(72,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_0.png','image/png',235412,0,1299533322),
	(73,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_1.png','image/png',235412,0,1299533495),
	(74,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_2.png','image/png',235412,0,1299533558),
	(75,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_3.png','image/png',235412,0,1299533613),
	(76,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_4.png','image/png',235412,0,1299534029),
	(77,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_5.png','image/png',235412,0,1299534073),
	(78,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_6.png','image/png',235412,0,1299534154),
	(79,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_7.png','image/png',235412,0,1299534188),
	(80,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_8.png','image/png',235412,0,1299534430),
	(81,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_9.png','image/png',235412,0,1299534469),
	(82,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_10.png','image/png',235412,0,1299534665),
	(83,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_11.png','image/png',235412,0,1299534739),
	(84,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_12.png','image/png',235412,0,1299534774),
	(85,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_13.png','image/png',235412,0,1299534807),
	(86,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_14.png','image/png',235412,0,1299535438),
	(87,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_15.png','image/png',235412,0,1299535475),
	(88,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_16.png','image/png',235412,0,1299539631),
	(89,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_17.png','image/png',235412,0,1299539685),
	(90,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_18.png','image/png',235412,0,1299539712),
	(91,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_19.png','image/png',235412,0,1299539764),
	(92,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_20.png','image/png',235412,0,1299539787),
	(93,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_21.png','image/png',235412,0,1299539827),
	(94,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_22.png','image/png',235412,0,1299539996),
	(95,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_23.png','image/png',235412,0,1299540087),
	(96,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_24.png','image/png',235412,0,1299540146),
	(97,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_25.png','image/png',235412,0,1299540184),
	(98,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_26.png','image/png',235412,0,1299540555),
	(99,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_27.png','image/png',235412,0,1299540576),
	(100,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_28.png','image/png',235412,0,1299540992),
	(101,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_29.png','image/png',235412,0,1299540997),
	(102,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_30.png','image/png',235412,0,1299541000),
	(103,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_31.png','image/png',235412,0,1299541005),
	(104,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_32.png','image/png',235412,0,1299541141),
	(105,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_33.png','image/png',235412,0,1299541145),
	(106,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_34.png','image/png',235412,0,1299541147),
	(107,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_35.png','image/png',235412,0,1299541150),
	(108,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_36.png','image/png',235412,0,1299541153),
	(109,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_37.png','image/png',235412,0,1299541191),
	(110,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_38.png','image/png',235412,0,1299541252),
	(111,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_39.png','image/png',235412,0,1299541254),
	(112,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_40.png','image/png',235412,0,1299541257),
	(113,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_41.png','image/png',235412,0,1299541259),
	(114,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_42.png','image/png',235412,0,1299541261),
	(115,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_43.png','image/png',235412,0,1299542251),
	(116,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_44.png','image/png',235412,0,1299542269),
	(117,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_45.png','image/png',235412,0,1299542328),
	(118,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_46.png','image/png',235412,0,1299542393),
	(119,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_47.png','image/png',235412,0,1299542432),
	(120,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_48.png','image/png',235412,0,1299542525),
	(121,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_49.png','image/png',235412,0,1299542545),
	(122,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_50.png','image/png',235412,0,1299542587),
	(123,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_51.png','image/png',235412,0,1299542623),
	(124,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_52.png','image/png',235412,0,1299542703),
	(125,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_53.png','image/png',235412,0,1299542717),
	(126,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_54.png','image/png',235412,0,1299542737),
	(127,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_55.png','image/png',235412,0,1299542760),
	(128,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_56.png','image/png',235412,0,1299542774),
	(129,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_57.png','image/png',235412,0,1299542801),
	(130,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_58.png','image/png',235412,0,1299542833),
	(131,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_59.png','image/png',235412,0,1299542995),
	(132,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_60.png','image/png',235412,0,1299543020),
	(133,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_61.png','image/png',235412,0,1299543037),
	(134,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_62.png','image/png',235412,0,1299543129),
	(135,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_63.png','image/png',235412,0,1299543352),
	(136,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_64.png','image/png',235412,0,1299543374),
	(137,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_65.png','image/png',235412,0,1299543427),
	(138,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_66.png','image/png',235412,0,1299543456),
	(139,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_67.png','image/png',235412,0,1299543459),
	(140,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_68.png','image/png',235412,0,1299543462),
	(141,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_69.png','image/png',235412,0,1299543465),
	(142,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_70.png','image/png',235412,0,1299543707),
	(143,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_71.png','image/png',235412,0,1299543710),
	(144,1,'Screen shot 2011-03-07 at 3.28.10 PM.png','sites/default/files/Screen shot 2011-03-07 at 3.28.10 PM_72.png','image/png',235412,0,1299543712),
	(145,1,'new-with-border.png','sites/default/files/new-with-border.png','image/png',58222,0,1299625716),
	(146,1,'new-with-border.png','sites/default/files/new-with-border_0.png','image/png',58222,0,1299625742),
	(147,1,'Screen shot 2011-03-08 at 5.21.49 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-08 at 5.21.49 PM.png','image/png',138333,0,1299626575),
	(148,1,'Screen shot 2011-03-08 at 5.21.49 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-08 at 5.21.49 PM_0.png','image/png',138333,0,1299626580),
	(149,1,'Screen shot 2011-03-08 at 5.21.49 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-08 at 5.21.49 PM_1.png','image/png',138333,0,1299626583),
	(150,1,'Screen shot 2011-03-08 at 5.21.49 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-08 at 5.21.49 PM_2.png','image/png',138333,0,1299626585),
	(151,5,'Screen shot 2011-03-09 at 11.10.40 AM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 11.10.40 AM.png','image/png',63808,0,1299697008),
	(152,5,'separate_items.jpg','sites/default/files/separate_items.jpg','image/jpeg',661828,0,1299703959),
	(153,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items.jpg','image/jpeg',661828,0,1299704107),
	(154,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_0.jpg','image/jpeg',661828,0,1299704195),
	(155,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_1.jpg','image/jpeg',661828,0,1299707933),
	(156,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_2.jpg','image/jpeg',661828,0,1299707946),
	(157,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_3.jpg','image/jpeg',661828,0,1299707983),
	(158,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_4.jpg','image/jpeg',661828,0,1299708007),
	(159,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_5.jpg','image/jpeg',661828,0,1299708034),
	(160,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_6.jpg','image/jpeg',661828,0,1299708056),
	(161,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_7.jpg','image/jpeg',661828,0,1299708078),
	(162,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_8.jpg','image/jpeg',661828,0,1299708094),
	(163,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_9.jpg','image/jpeg',661828,0,1299708285),
	(164,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_10.jpg','image/jpeg',661828,0,1299708301),
	(165,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_11.jpg','image/jpeg',661828,0,1299708308),
	(166,5,'separate_items.jpg','sites/default/files/separate_items_0.jpg','image/jpeg',661828,0,1299708321),
	(167,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_12.jpg','image/jpeg',661828,0,1299708401),
	(169,5,'content_page.jpg','sites/default/files/content_page.jpg','image/jpeg',157948,0,1299708516),
	(170,5,'separate_items.jpg','sites/default/files/separate_items_1.jpg','image/jpeg',661828,0,1299708522),
	(171,5,'ten7_news_edit_page.jpg','sites/default/files/ten7_news_edit_page.jpg','image/jpeg',445302,0,1299708558),
	(172,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_13.jpg','image/jpeg',661828,0,1299708572),
	(173,5,'separate_items.jpg','sites/default/files/separate_items_2.jpg','image/jpeg',661828,0,1299708697),
	(174,5,'separate_items.jpg','sites/default/files/separate_items_3.jpg','image/jpeg',661828,0,1299708707),
	(175,5,'separate_items.jpg','sites/default/files/separate_items_4.jpg','image/jpeg',661828,0,1299708769),
	(176,5,'separate_items.jpg','sites/default/files/separate_items_5.jpg','image/jpeg',661828,0,1299708786),
	(177,5,'separate_items.jpg','sites/default/files/separate_items_6.jpg','image/jpeg',661828,0,1299708798),
	(178,5,'separate_items.jpg','sites/default/files/separate_items_7.jpg','image/jpeg',661828,0,1299708814),
	(179,5,'separate_items.jpg','sites/default/files/separate_items_8.jpg','image/jpeg',661828,0,1299708829),
	(180,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_14.jpg','image/jpeg',661828,0,1299708846),
	(181,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_15.jpg','image/jpeg',661828,0,1299708880),
	(182,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_16.jpg','image/jpeg',661828,0,1299708897),
	(183,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_17.jpg','image/jpeg',661828,0,1299708936),
	(184,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_18.jpg','image/jpeg',661828,0,1299708964),
	(185,5,'separate_items.jpg','sites/default/files/separate_items_9.jpg','image/jpeg',661828,0,1299708977),
	(186,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_19.jpg','image/jpeg',661828,0,1299709003),
	(187,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_20.jpg','image/jpeg',661828,0,1299709032),
	(188,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_21.jpg','image/jpeg',661828,0,1299709061),
	(189,5,'separate_items.jpg','sites/default/files/uploaded_unit_images/separate_items_22.jpg','image/jpeg',661828,0,1299709128),
	(190,5,'separate_items.jpg','sites/default/files/separate_items_10.jpg','image/jpeg',661828,0,1299709199),
	(191,5,'separate_items.jpg','sites/default/files/separate_items_11.jpg','image/jpeg',661828,1,1300333677),
	(192,5,'ten7_news_edit_page.jpg','sites/default/files/uploaded_unit_images/ten7_news_edit_page.jpg','image/jpeg',445302,0,1299710583),
	(193,5,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM.png','image/png',320614,0,1299714451),
	(194,5,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM_0.png','image/png',320614,0,1299714703),
	(195,1,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM_1.png','image/png',320614,0,1299714732),
	(196,5,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM_2.png','image/png',320614,0,1299714776),
	(197,5,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM_3.png','image/png',320614,0,1299714844),
	(198,5,'Screen shot 2011-03-09 at 5.47.23 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-09 at 5.47.23 PM_4.png','image/png',320614,0,1299714885),
	(199,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand.png','image/png',183338,0,1299789174),
	(200,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_0.png','image/png',183338,0,1299789179),
	(201,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_1.png','image/png',183338,0,1299789182),
	(202,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_2.png','image/png',183338,0,1299789186),
	(203,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_3.png','image/png',183338,0,1299790019),
	(204,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_4.png','image/png',183338,0,1299790022),
	(205,5,'hover-expand.png','sites/default/files/uploaded_unit_images/hover-expand_5.png','image/png',183338,0,1299790025),
	(206,5,'Screen shot 2011-03-10 at 4.22.28 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-10 at 4.22.28 PM.png','image/png',377682,0,1299795754),
	(207,5,'Screen shot 2011-03-10 at 4.22.28 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-10 at 4.22.28 PM_0.png','image/png',377682,0,1299795757),
	(208,5,'Screen shot 2011-03-10 at 4.22.28 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-10 at 4.22.28 PM_1.png','image/png',377682,0,1299795761),
	(209,5,'Screen shot 2011-03-10 at 4.22.28 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-10 at 4.22.28 PM_2.png','image/png',377682,0,1299795766),
	(223,5,'CoopersRocket.jpg','sites/default/files/uploaded_unit_images/CoopersRocket_0.jpg','image/jpeg',312400,0,1300334727),
	(227,5,'GGB-Logo-Stacked.png','sites/default/files/GGB-Logo-Stacked.png','image/png',145714,0,1300548351),
	(211,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM.png','image/png',839514,0,1299868332),
	(212,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_0.png','image/png',839514,0,1299868966),
	(213,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-11 at 12.32.07 PM.png','image/png',839514,0,1299869041),
	(214,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-11 at 12.32.07 PM_0.png','image/png',839514,0,1299869130),
	(215,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_1.png','image/png',839514,0,1299869210),
	(216,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_2.png','image/png',839514,0,1299869244),
	(217,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/uploaded_unit_images/Screen shot 2011-03-11 at 12.32.07 PM_1.png','image/png',839514,0,1299869294),
	(218,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_3.png','image/png',839514,0,1299869335),
	(219,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_4.png','image/png',839514,0,1299869360),
	(220,5,'Screen shot 2011-03-11 at 12.32.07 PM.png','sites/default/files/Screen shot 2011-03-11 at 12.32.07 PM_5.png','image/png',839514,0,1299869392),
	(226,5,'CoopersRocket.jpg','sites/default/files/CoopersRocket.jpg','image/jpeg',312400,0,1300548349),
	(228,5,'ocnmappic.jpg','sites/default/files/ocnmappic.jpg','image/jpeg',236762,0,1300548451),
	(229,5,'ocnmappic.jpg','sites/default/files/ocnmappic_0.jpg','image/jpeg',236762,0,1300548522),
	(230,5,'CoopersRocket.jpg','sites/default/files/CoopersRocket_0.jpg','image/jpeg',312400,0,1300585601),
	(231,5,'ocnmappic.jpg','sites/default/files/ocnmappic_1.jpg','image/jpeg',236762,0,1300585914),
	(234,5,'ocnmappic.jpg','sites/default/files/uploaded_unit_images/ocnmappic.jpg','image/jpeg',236762,1,1300627090);

/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filter_formats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filter_formats`;

CREATE TABLE `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `filter_formats` WRITE;
/*!40000 ALTER TABLE `filter_formats` DISABLE KEYS */;
INSERT INTO `filter_formats` (`format`,`name`,`roles`,`cache`)
VALUES
	(1,'Filtered HTML',',1,2,',1),
	(2,'Full HTML',',3,',1),
	(3,'Inbode User',',5,',1),
	(4,'Inbode Building Manager',',4,',1),
	(5,'PHP code','',0);

/*!40000 ALTER TABLE `filter_formats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table filters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `filters`;

CREATE TABLE `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` (`fid`,`format`,`module`,`delta`,`weight`)
VALUES
	(1,1,'filter',2,0),
	(2,1,'filter',0,1),
	(3,1,'filter',1,2),
	(4,1,'filter',3,10),
	(12,3,'filter',3,10),
	(14,3,'filter',1,1),
	(13,3,'filter',0,10),
	(15,3,'filter',2,0),
	(16,4,'filter',3,10),
	(17,4,'filter',0,10),
	(18,4,'filter',1,1),
	(19,4,'filter',2,0),
	(20,5,'php',0,0);

/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table flood
# ------------------------------------------------------------

DROP TABLE IF EXISTS `flood`;

CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=2780 DEFAULT CHARSET=utf8;

LOCK TABLES `flood` WRITE;
/*!40000 ALTER TABLE `flood` DISABLE KEYS */;
INSERT INTO `flood` (`fid`,`event`,`hostname`,`timestamp`)
VALUES
	(1922,'inbode_rebuild_registry_warning','127.0.0.1',1296856485),
	(1921,'inbode_rebuild_registry_warning','127.0.0.1',1296856478),
	(1920,'inbode_rebuild_registry_warning','127.0.0.1',1296856478),
	(1919,'inbode_rebuild_registry_warning','127.0.0.1',1296856472),
	(1918,'inbode_rebuild_registry_warning','127.0.0.1',1296856472),
	(1917,'inbode_rebuild_registry_warning','127.0.0.1',1296856438),
	(1916,'inbode_rebuild_registry_warning','127.0.0.1',1296856437),
	(1915,'inbode_rebuild_registry_warning','127.0.0.1',1296855956),
	(1914,'inbode_rebuild_registry_warning','127.0.0.1',1296855956),
	(1913,'inbode_rebuild_registry_warning','127.0.0.1',1296855937),
	(1912,'inbode_rebuild_registry_warning','127.0.0.1',1296855937),
	(1911,'inbode_rebuild_registry_warning','127.0.0.1',1296855915),
	(1910,'inbode_rebuild_registry_warning','127.0.0.1',1296855915),
	(1909,'inbode_rebuild_registry_warning','127.0.0.1',1296855901),
	(1908,'inbode_rebuild_registry_warning','127.0.0.1',1296855901),
	(1907,'inbode_rebuild_registry_warning','127.0.0.1',1296855870),
	(1906,'inbode_rebuild_registry_warning','127.0.0.1',1296855870),
	(1905,'inbode_rebuild_registry_warning','127.0.0.1',1296855735),
	(1904,'inbode_rebuild_registry_warning','127.0.0.1',1296855735),
	(1903,'inbode_rebuild_registry_warning','127.0.0.1',1296855454),
	(1902,'inbode_rebuild_registry_warning','127.0.0.1',1296855454),
	(1901,'inbode_rebuild_registry_warning','127.0.0.1',1296855389),
	(1900,'inbode_rebuild_registry_warning','127.0.0.1',1296855389),
	(1899,'inbode_rebuild_registry_warning','127.0.0.1',1296855388),
	(1898,'inbode_rebuild_registry_warning','127.0.0.1',1296855388),
	(1897,'inbode_rebuild_registry_warning','127.0.0.1',1296855365),
	(1896,'inbode_rebuild_registry_warning','127.0.0.1',1296855365),
	(1895,'inbode_rebuild_registry_warning','127.0.0.1',1296855356),
	(1894,'inbode_rebuild_registry_warning','127.0.0.1',1296855356),
	(1893,'inbode_rebuild_registry_warning','127.0.0.1',1296854887),
	(1892,'inbode_rebuild_registry_warning','127.0.0.1',1296854887),
	(1891,'inbode_rebuild_registry_warning','127.0.0.1',1296854858),
	(1890,'inbode_rebuild_registry_warning','127.0.0.1',1296854857),
	(1889,'inbode_rebuild_registry_warning','127.0.0.1',1296854857),
	(1888,'inbode_rebuild_registry_warning','127.0.0.1',1296854857),
	(1887,'inbode_rebuild_registry_warning','127.0.0.1',1296854753),
	(1886,'inbode_rebuild_registry_warning','127.0.0.1',1296854752),
	(1885,'inbode_rebuild_registry_warning','127.0.0.1',1296854708),
	(1884,'inbode_rebuild_registry_warning','127.0.0.1',1296854708),
	(1883,'inbode_rebuild_registry_warning','127.0.0.1',1296854690),
	(1882,'inbode_rebuild_registry_warning','127.0.0.1',1296854690),
	(1881,'inbode_rebuild_registry_warning','127.0.0.1',1296854690),
	(1880,'inbode_rebuild_registry_warning','127.0.0.1',1296854690),
	(1879,'inbode_rebuild_registry_warning','127.0.0.1',1296854688),
	(1878,'inbode_rebuild_registry_warning','127.0.0.1',1296854687),
	(1877,'inbode_rebuild_registry_warning','127.0.0.1',1296854677),
	(1876,'inbode_rebuild_registry_warning','127.0.0.1',1296854677),
	(1875,'inbode_rebuild_registry_warning','127.0.0.1',1296854639),
	(1874,'inbode_rebuild_registry_warning','127.0.0.1',1296854639),
	(1873,'inbode_rebuild_registry_warning','127.0.0.1',1296854636),
	(1872,'inbode_rebuild_registry_warning','127.0.0.1',1296854636),
	(1871,'inbode_rebuild_registry_warning','127.0.0.1',1296854633),
	(1870,'inbode_rebuild_registry_warning','127.0.0.1',1296854633),
	(1869,'inbode_rebuild_registry_warning','127.0.0.1',1296854612),
	(1868,'inbode_rebuild_registry_warning','127.0.0.1',1296854611),
	(1867,'inbode_rebuild_registry_warning','127.0.0.1',1296854609),
	(1866,'inbode_rebuild_registry_warning','127.0.0.1',1296854609),
	(1865,'inbode_rebuild_registry_warning','127.0.0.1',1296854605),
	(1864,'inbode_rebuild_registry_warning','127.0.0.1',1296854605),
	(1863,'inbode_rebuild_registry_warning','127.0.0.1',1296854599),
	(1862,'inbode_rebuild_registry_warning','127.0.0.1',1296854599),
	(1861,'inbode_rebuild_registry_warning','127.0.0.1',1296854592),
	(1860,'inbode_rebuild_registry_warning','127.0.0.1',1296854592),
	(1859,'inbode_rebuild_registry_warning','127.0.0.1',1296854581),
	(1858,'inbode_rebuild_registry_warning','127.0.0.1',1296854581),
	(1857,'inbode_rebuild_registry_warning','127.0.0.1',1296854576),
	(1856,'inbode_rebuild_registry_warning','127.0.0.1',1296854576),
	(1855,'inbode_rebuild_registry_warning','127.0.0.1',1296854562),
	(1854,'inbode_rebuild_registry_warning','127.0.0.1',1296854562),
	(1853,'inbode_rebuild_registry_warning','127.0.0.1',1296854558),
	(1852,'inbode_rebuild_registry_warning','127.0.0.1',1296854558),
	(1851,'inbode_rebuild_registry_warning','127.0.0.1',1296854519),
	(1850,'inbode_rebuild_registry_warning','127.0.0.1',1296854519),
	(1849,'inbode_rebuild_registry_warning','127.0.0.1',1296854513),
	(1848,'inbode_rebuild_registry_warning','127.0.0.1',1296854513),
	(1847,'inbode_rebuild_registry_warning','127.0.0.1',1296854506),
	(1846,'inbode_rebuild_registry_warning','127.0.0.1',1296854506),
	(1845,'inbode_rebuild_registry_warning','127.0.0.1',1296854500),
	(1844,'inbode_rebuild_registry_warning','127.0.0.1',1296854500),
	(1843,'inbode_rebuild_registry_warning','127.0.0.1',1296854497),
	(1842,'inbode_rebuild_registry_warning','127.0.0.1',1296854497),
	(1841,'inbode_rebuild_registry_warning','127.0.0.1',1296854492),
	(1840,'inbode_rebuild_registry_warning','127.0.0.1',1296854492),
	(1839,'inbode_rebuild_registry_warning','127.0.0.1',1296854492),
	(1838,'inbode_rebuild_registry_warning','127.0.0.1',1296854492),
	(1837,'inbode_rebuild_registry_warning','127.0.0.1',1296854458),
	(1836,'inbode_rebuild_registry_warning','127.0.0.1',1296854457),
	(1835,'inbode_rebuild_registry_warning','127.0.0.1',1296854449),
	(1834,'inbode_rebuild_registry_warning','127.0.0.1',1296854449),
	(1833,'inbode_rebuild_registry_warning','127.0.0.1',1296854431),
	(1832,'inbode_rebuild_registry_warning','127.0.0.1',1296854431),
	(1831,'inbode_rebuild_registry_warning','127.0.0.1',1296854427),
	(1830,'inbode_rebuild_registry_warning','127.0.0.1',1296854427),
	(1829,'inbode_rebuild_registry_warning','127.0.0.1',1296854380),
	(1828,'inbode_rebuild_registry_warning','127.0.0.1',1296854380),
	(1827,'inbode_rebuild_registry_warning','127.0.0.1',1296854375),
	(1826,'inbode_rebuild_registry_warning','127.0.0.1',1296854375),
	(1825,'inbode_rebuild_registry_warning','127.0.0.1',1296854368),
	(1824,'inbode_rebuild_registry_warning','127.0.0.1',1296854368),
	(1823,'inbode_rebuild_registry_warning','127.0.0.1',1296854364),
	(1822,'inbode_rebuild_registry_warning','127.0.0.1',1296854364),
	(1821,'inbode_rebuild_registry_warning','127.0.0.1',1296854361),
	(1820,'inbode_rebuild_registry_warning','127.0.0.1',1296854361),
	(1819,'inbode_rebuild_registry_warning','127.0.0.1',1296854227),
	(1818,'inbode_rebuild_registry_warning','127.0.0.1',1296854227),
	(1817,'inbode_rebuild_registry_warning','127.0.0.1',1296854190),
	(1816,'inbode_rebuild_registry_warning','127.0.0.1',1296854189),
	(1815,'inbode_rebuild_registry_warning','127.0.0.1',1296854144),
	(1814,'inbode_rebuild_registry_warning','127.0.0.1',1296854144),
	(1813,'inbode_rebuild_registry_warning','127.0.0.1',1296854087),
	(1812,'inbode_rebuild_registry_warning','127.0.0.1',1296854087),
	(1811,'inbode_rebuild_registry_warning','127.0.0.1',1296854052),
	(1810,'inbode_rebuild_registry_warning','127.0.0.1',1296854052),
	(1809,'inbode_rebuild_registry_warning','127.0.0.1',1296854049),
	(1808,'inbode_rebuild_registry_warning','127.0.0.1',1296854048),
	(1807,'inbode_rebuild_registry_warning','127.0.0.1',1296854042),
	(1806,'inbode_rebuild_registry_warning','127.0.0.1',1296854042),
	(1805,'inbode_rebuild_registry_warning','127.0.0.1',1296854035),
	(1804,'inbode_rebuild_registry_warning','127.0.0.1',1296854035),
	(1803,'inbode_rebuild_registry_warning','127.0.0.1',1296853899),
	(1802,'inbode_rebuild_registry_warning','127.0.0.1',1296853899),
	(1801,'inbode_rebuild_registry_warning','127.0.0.1',1296853896),
	(1800,'inbode_rebuild_registry_warning','127.0.0.1',1296853896),
	(1799,'inbode_rebuild_registry_warning','127.0.0.1',1296853890),
	(1798,'inbode_rebuild_registry_warning','127.0.0.1',1296853890),
	(1797,'inbode_rebuild_registry_warning','127.0.0.1',1296853887),
	(1796,'inbode_rebuild_registry_warning','127.0.0.1',1296853887),
	(1795,'inbode_rebuild_registry_warning','127.0.0.1',1296853884),
	(1794,'inbode_rebuild_registry_warning','127.0.0.1',1296853884),
	(1793,'inbode_rebuild_registry_warning','127.0.0.1',1296853881),
	(1792,'inbode_rebuild_registry_warning','127.0.0.1',1296853881),
	(1791,'inbode_rebuild_registry_warning','127.0.0.1',1296853852),
	(1790,'inbode_rebuild_registry_warning','127.0.0.1',1296853852),
	(1789,'inbode_rebuild_registry_warning','127.0.0.1',1296853842),
	(1788,'inbode_rebuild_registry_warning','127.0.0.1',1296853842),
	(1787,'inbode_rebuild_registry_warning','127.0.0.1',1296853747),
	(1786,'inbode_rebuild_registry_warning','127.0.0.1',1296853747),
	(1785,'inbode_rebuild_registry_warning','127.0.0.1',1296853697),
	(1784,'inbode_rebuild_registry_warning','127.0.0.1',1296853696),
	(1783,'inbode_rebuild_registry_warning','127.0.0.1',1296853683),
	(1782,'inbode_rebuild_registry_warning','127.0.0.1',1296853683),
	(1781,'inbode_rebuild_registry_warning','127.0.0.1',1296853628),
	(1780,'inbode_rebuild_registry_warning','127.0.0.1',1296853628),
	(1779,'inbode_rebuild_registry_warning','127.0.0.1',1296853608),
	(1778,'inbode_rebuild_registry_warning','127.0.0.1',1296853607),
	(1777,'inbode_rebuild_registry_warning','127.0.0.1',1296853607),
	(1776,'inbode_rebuild_registry_warning','127.0.0.1',1296853607),
	(1775,'inbode_rebuild_registry_warning','127.0.0.1',1296853600),
	(1774,'inbode_rebuild_registry_warning','127.0.0.1',1296853600),
	(1773,'inbode_rebuild_registry_warning','127.0.0.1',1296853564),
	(1772,'inbode_rebuild_registry_warning','127.0.0.1',1296853564),
	(1771,'inbode_rebuild_registry_warning','127.0.0.1',1296851882),
	(1770,'inbode_rebuild_registry_warning','127.0.0.1',1296851881),
	(1769,'inbode_rebuild_registry_warning','127.0.0.1',1296851866),
	(1768,'inbode_rebuild_registry_warning','127.0.0.1',1296851866),
	(1767,'inbode_rebuild_registry_warning','127.0.0.1',1296851766),
	(1766,'inbode_rebuild_registry_warning','127.0.0.1',1296851766),
	(1765,'inbode_rebuild_registry_warning','127.0.0.1',1296851761),
	(1764,'inbode_rebuild_registry_warning','127.0.0.1',1296851761),
	(1763,'inbode_rebuild_registry_warning','127.0.0.1',1296851756),
	(1762,'inbode_rebuild_registry_warning','127.0.0.1',1296851756),
	(1761,'inbode_rebuild_registry_warning','127.0.0.1',1296851753),
	(1760,'inbode_rebuild_registry_warning','127.0.0.1',1296851753),
	(1759,'inbode_rebuild_registry_warning','127.0.0.1',1296851677),
	(1758,'inbode_rebuild_registry_warning','127.0.0.1',1296851677),
	(1757,'inbode_rebuild_registry_warning','127.0.0.1',1296851644),
	(1756,'inbode_rebuild_registry_warning','127.0.0.1',1296851644),
	(1755,'inbode_rebuild_registry_warning','127.0.0.1',1296851610),
	(1754,'inbode_rebuild_registry_warning','127.0.0.1',1296851609),
	(1753,'inbode_rebuild_registry_warning','127.0.0.1',1296851594),
	(1752,'inbode_rebuild_registry_warning','127.0.0.1',1296851594),
	(1751,'inbode_rebuild_registry_warning','127.0.0.1',1296851348),
	(1750,'inbode_rebuild_registry_warning','127.0.0.1',1296851348),
	(1749,'inbode_rebuild_registry_warning','127.0.0.1',1296851328),
	(1748,'inbode_rebuild_registry_warning','127.0.0.1',1296851328),
	(1747,'inbode_rebuild_registry_warning','127.0.0.1',1296851311),
	(1746,'inbode_rebuild_registry_warning','127.0.0.1',1296851311),
	(1745,'inbode_rebuild_registry_warning','127.0.0.1',1296851278),
	(1744,'inbode_rebuild_registry_warning','127.0.0.1',1296851278),
	(1743,'inbode_rebuild_registry_warning','127.0.0.1',1296851258),
	(1742,'inbode_rebuild_registry_warning','127.0.0.1',1296851257),
	(1741,'inbode_rebuild_registry_warning','127.0.0.1',1296851226),
	(1740,'inbode_rebuild_registry_warning','127.0.0.1',1296851226),
	(1739,'inbode_rebuild_registry_warning','127.0.0.1',1296851116),
	(1738,'inbode_rebuild_registry_warning','127.0.0.1',1296851116),
	(1737,'inbode_rebuild_registry_warning','127.0.0.1',1296850762),
	(1736,'inbode_rebuild_registry_warning','127.0.0.1',1296850762),
	(1735,'inbode_rebuild_registry_warning','127.0.0.1',1296850669),
	(1734,'inbode_rebuild_registry_warning','127.0.0.1',1296850669),
	(1733,'inbode_rebuild_registry_warning','127.0.0.1',1296850338),
	(1732,'inbode_rebuild_registry_warning','127.0.0.1',1296850338),
	(1731,'inbode_rebuild_registry_warning','127.0.0.1',1296850338),
	(1730,'inbode_rebuild_registry_warning','127.0.0.1',1296850338),
	(1729,'inbode_rebuild_registry_warning','127.0.0.1',1296850327),
	(1728,'inbode_rebuild_registry_warning','127.0.0.1',1296850327),
	(1727,'inbode_rebuild_registry_warning','127.0.0.1',1296850324),
	(1726,'inbode_rebuild_registry_warning','127.0.0.1',1296850324),
	(1725,'inbode_rebuild_registry_warning','127.0.0.1',1296850308),
	(1724,'inbode_rebuild_registry_warning','127.0.0.1',1296850307),
	(1723,'inbode_rebuild_registry_warning','127.0.0.1',1296850305),
	(1722,'inbode_rebuild_registry_warning','127.0.0.1',1296850305),
	(1721,'inbode_rebuild_registry_warning','127.0.0.1',1296850279),
	(1720,'inbode_rebuild_registry_warning','127.0.0.1',1296850279),
	(1719,'inbode_rebuild_registry_warning','127.0.0.1',1296850274),
	(1718,'inbode_rebuild_registry_warning','127.0.0.1',1296850274),
	(1717,'inbode_rebuild_registry_warning','127.0.0.1',1296850274),
	(1716,'inbode_rebuild_registry_warning','127.0.0.1',1296850274),
	(1715,'inbode_rebuild_registry_warning','127.0.0.1',1296850263),
	(1714,'inbode_rebuild_registry_warning','127.0.0.1',1296850263),
	(1713,'inbode_rebuild_registry_warning','127.0.0.1',1296850259),
	(1712,'inbode_rebuild_registry_warning','127.0.0.1',1296850259),
	(1711,'inbode_rebuild_registry_warning','127.0.0.1',1296850258),
	(1710,'inbode_rebuild_registry_warning','127.0.0.1',1296850258),
	(1709,'inbode_rebuild_registry_warning','127.0.0.1',1296850228),
	(1708,'inbode_rebuild_registry_warning','127.0.0.1',1296850228),
	(1707,'inbode_rebuild_registry_warning','127.0.0.1',1296849894),
	(1706,'inbode_rebuild_registry_warning','127.0.0.1',1296849894),
	(1705,'inbode_rebuild_registry_warning','127.0.0.1',1296849885),
	(1704,'inbode_rebuild_registry_warning','127.0.0.1',1296849885),
	(1703,'inbode_rebuild_registry_warning','127.0.0.1',1296849879),
	(1702,'inbode_rebuild_registry_warning','127.0.0.1',1296849879),
	(1701,'inbode_rebuild_registry_warning','127.0.0.1',1296849875),
	(1700,'inbode_rebuild_registry_warning','127.0.0.1',1296849875),
	(1699,'inbode_rebuild_registry_warning','127.0.0.1',1296849869),
	(1698,'inbode_rebuild_registry_warning','127.0.0.1',1296849869),
	(1697,'inbode_rebuild_registry_warning','127.0.0.1',1296849866),
	(1696,'inbode_rebuild_registry_warning','127.0.0.1',1296849866),
	(1695,'inbode_rebuild_registry_warning','127.0.0.1',1296849852),
	(1694,'inbode_rebuild_registry_warning','127.0.0.1',1296849852),
	(1693,'inbode_rebuild_registry_warning','127.0.0.1',1296849848),
	(1692,'inbode_rebuild_registry_warning','127.0.0.1',1296849848),
	(1691,'inbode_rebuild_registry_warning','127.0.0.1',1296849828),
	(1690,'inbode_rebuild_registry_warning','127.0.0.1',1296849828),
	(1689,'inbode_rebuild_registry_warning','127.0.0.1',1296849820),
	(1688,'inbode_rebuild_registry_warning','127.0.0.1',1296849820),
	(1687,'inbode_rebuild_registry_warning','127.0.0.1',1296849818),
	(1686,'inbode_rebuild_registry_warning','127.0.0.1',1296849818),
	(1685,'inbode_rebuild_registry_warning','127.0.0.1',1296849310),
	(1684,'inbode_rebuild_registry_warning','127.0.0.1',1296849310),
	(1683,'inbode_rebuild_registry_warning','127.0.0.1',1296849247),
	(1682,'inbode_rebuild_registry_warning','127.0.0.1',1296849247),
	(1681,'inbode_rebuild_registry_warning','127.0.0.1',1296849235),
	(1680,'inbode_rebuild_registry_warning','127.0.0.1',1296849234),
	(1679,'inbode_rebuild_registry_warning','127.0.0.1',1296849228),
	(1678,'inbode_rebuild_registry_warning','127.0.0.1',1296849228),
	(1677,'inbode_rebuild_registry_warning','127.0.0.1',1296849225),
	(1676,'inbode_rebuild_registry_warning','127.0.0.1',1296849225),
	(1675,'inbode_rebuild_registry_warning','127.0.0.1',1296849216),
	(1674,'inbode_rebuild_registry_warning','127.0.0.1',1296849216),
	(1673,'inbode_rebuild_registry_warning','127.0.0.1',1296849176),
	(1672,'inbode_rebuild_registry_warning','127.0.0.1',1296849176),
	(1671,'inbode_rebuild_registry_warning','127.0.0.1',1296849169),
	(1670,'inbode_rebuild_registry_warning','127.0.0.1',1296849169),
	(1669,'inbode_rebuild_registry_warning','127.0.0.1',1296849157),
	(1668,'inbode_rebuild_registry_warning','127.0.0.1',1296849157),
	(1667,'inbode_rebuild_registry_warning','127.0.0.1',1296849142),
	(1666,'inbode_rebuild_registry_warning','127.0.0.1',1296849141),
	(1665,'inbode_rebuild_registry_warning','127.0.0.1',1296849134),
	(1664,'inbode_rebuild_registry_warning','127.0.0.1',1296849134),
	(1663,'inbode_rebuild_registry_warning','127.0.0.1',1296849129),
	(1662,'inbode_rebuild_registry_warning','127.0.0.1',1296849129),
	(1661,'inbode_rebuild_registry_warning','127.0.0.1',1296849119),
	(1660,'inbode_rebuild_registry_warning','127.0.0.1',1296849119),
	(1659,'inbode_rebuild_registry_warning','127.0.0.1',1296849107),
	(1658,'inbode_rebuild_registry_warning','127.0.0.1',1296849107),
	(1657,'inbode_rebuild_registry_warning','127.0.0.1',1296849059),
	(1656,'inbode_rebuild_registry_warning','127.0.0.1',1296849058),
	(1655,'inbode_rebuild_registry_warning','127.0.0.1',1296849042),
	(1654,'inbode_rebuild_registry_warning','127.0.0.1',1296849042),
	(1653,'inbode_rebuild_registry_warning','127.0.0.1',1296849033),
	(1652,'inbode_rebuild_registry_warning','127.0.0.1',1296849033),
	(1651,'inbode_rebuild_registry_warning','127.0.0.1',1296849004),
	(1650,'inbode_rebuild_registry_warning','127.0.0.1',1296849004),
	(1649,'inbode_rebuild_registry_warning','127.0.0.1',1296848949),
	(1648,'inbode_rebuild_registry_warning','127.0.0.1',1296848949),
	(1647,'inbode_rebuild_registry_warning','127.0.0.1',1296848928),
	(1646,'inbode_rebuild_registry_warning','127.0.0.1',1296848928),
	(1645,'inbode_rebuild_registry_warning','127.0.0.1',1296848914),
	(1644,'inbode_rebuild_registry_warning','127.0.0.1',1296848914),
	(1643,'inbode_rebuild_registry_warning','127.0.0.1',1296848899),
	(1642,'inbode_rebuild_registry_warning','127.0.0.1',1296848899),
	(1641,'inbode_rebuild_registry_warning','127.0.0.1',1296848851),
	(1640,'inbode_rebuild_registry_warning','127.0.0.1',1296848850),
	(1639,'inbode_rebuild_registry_warning','127.0.0.1',1296848810),
	(1638,'inbode_rebuild_registry_warning','127.0.0.1',1296848810),
	(1637,'inbode_rebuild_registry_warning','127.0.0.1',1296848798),
	(1636,'inbode_rebuild_registry_warning','127.0.0.1',1296848798),
	(1635,'inbode_rebuild_registry_warning','127.0.0.1',1296848795),
	(1634,'inbode_rebuild_registry_warning','127.0.0.1',1296848795),
	(1633,'inbode_rebuild_registry_warning','127.0.0.1',1296848789),
	(1632,'inbode_rebuild_registry_warning','127.0.0.1',1296848789),
	(1631,'inbode_rebuild_registry_warning','127.0.0.1',1296848779),
	(1630,'inbode_rebuild_registry_warning','127.0.0.1',1296848779),
	(1629,'inbode_rebuild_registry_warning','127.0.0.1',1296848774),
	(1628,'inbode_rebuild_registry_warning','127.0.0.1',1296848774),
	(1627,'inbode_rebuild_registry_warning','127.0.0.1',1296848759),
	(1626,'inbode_rebuild_registry_warning','127.0.0.1',1296848759),
	(1625,'inbode_rebuild_registry_warning','127.0.0.1',1296848176),
	(1624,'inbode_rebuild_registry_warning','127.0.0.1',1296848172),
	(1623,'inbode_rebuild_registry_warning','127.0.0.1',1296848171),
	(1622,'inbode_rebuild_registry_warning','127.0.0.1',1296842641),
	(1621,'inbode_rebuild_registry_warning','127.0.0.1',1296842638),
	(1620,'inbode_rebuild_registry_warning','127.0.0.1',1296842637),
	(1619,'inbode_rebuild_registry_warning','127.0.0.1',1296815089),
	(1618,'inbode_rebuild_registry_warning','127.0.0.1',1296815089),
	(1617,'inbode_rebuild_registry_warning','127.0.0.1',1296815080),
	(1616,'inbode_rebuild_registry_warning','127.0.0.1',1296815079),
	(1615,'inbode_rebuild_registry_warning','127.0.0.1',1296815063),
	(1614,'inbode_rebuild_registry_warning','127.0.0.1',1296815063),
	(1613,'inbode_rebuild_registry_warning','127.0.0.1',1296815053),
	(1612,'inbode_rebuild_registry_warning','127.0.0.1',1296815053),
	(1611,'inbode_rebuild_registry_warning','127.0.0.1',1296815014),
	(1610,'inbode_rebuild_registry_warning','127.0.0.1',1296815014),
	(1609,'inbode_rebuild_registry_warning','127.0.0.1',1296814998),
	(1608,'inbode_rebuild_registry_warning','127.0.0.1',1296814998),
	(1607,'inbode_rebuild_registry_warning','127.0.0.1',1296814912),
	(1606,'inbode_rebuild_registry_warning','127.0.0.1',1296814912),
	(1605,'inbode_rebuild_registry_warning','127.0.0.1',1296814905),
	(1604,'inbode_rebuild_registry_warning','127.0.0.1',1296814905),
	(1603,'inbode_rebuild_registry_warning','127.0.0.1',1296814898),
	(1602,'inbode_rebuild_registry_warning','127.0.0.1',1296814898),
	(1601,'inbode_rebuild_registry_warning','127.0.0.1',1296814892),
	(1600,'inbode_rebuild_registry_warning','127.0.0.1',1296814892),
	(1599,'inbode_rebuild_registry_warning','127.0.0.1',1296814885),
	(1598,'inbode_rebuild_registry_warning','127.0.0.1',1296814885),
	(1597,'inbode_rebuild_registry_warning','127.0.0.1',1296814874),
	(1596,'inbode_rebuild_registry_warning','127.0.0.1',1296814874),
	(1595,'inbode_rebuild_registry_warning','127.0.0.1',1296814865),
	(1594,'inbode_rebuild_registry_warning','127.0.0.1',1296814865),
	(1593,'inbode_rebuild_registry_warning','127.0.0.1',1296814745),
	(1592,'inbode_rebuild_registry_warning','127.0.0.1',1296814745),
	(1591,'inbode_rebuild_registry_warning','127.0.0.1',1296814745),
	(1590,'inbode_rebuild_registry_warning','127.0.0.1',1296814745),
	(1589,'inbode_rebuild_registry_warning','127.0.0.1',1296814743),
	(1588,'inbode_rebuild_registry_warning','127.0.0.1',1296814743),
	(1587,'inbode_rebuild_registry_warning','127.0.0.1',1296814734),
	(1586,'inbode_rebuild_registry_warning','127.0.0.1',1296814734),
	(1585,'inbode_rebuild_registry_warning','127.0.0.1',1296814733),
	(1584,'inbode_rebuild_registry_warning','127.0.0.1',1296814733),
	(1583,'inbode_rebuild_registry_warning','127.0.0.1',1296814731),
	(1582,'inbode_rebuild_registry_warning','127.0.0.1',1296814731),
	(1581,'inbode_rebuild_registry_warning','127.0.0.1',1296814712),
	(1580,'inbode_rebuild_registry_warning','127.0.0.1',1296814712),
	(1579,'inbode_rebuild_registry_warning','127.0.0.1',1296814706),
	(1578,'inbode_rebuild_registry_warning','127.0.0.1',1296814706),
	(1577,'inbode_rebuild_registry_warning','127.0.0.1',1296814687),
	(1576,'inbode_rebuild_registry_warning','127.0.0.1',1296814686),
	(1575,'inbode_rebuild_registry_warning','127.0.0.1',1296814670),
	(1574,'inbode_rebuild_registry_warning','127.0.0.1',1296814670),
	(1573,'inbode_rebuild_registry_warning','127.0.0.1',1296814667),
	(1572,'inbode_rebuild_registry_warning','127.0.0.1',1296814667),
	(1571,'inbode_rebuild_registry_warning','127.0.0.1',1296814661),
	(1570,'inbode_rebuild_registry_warning','127.0.0.1',1296814660),
	(1569,'inbode_rebuild_registry_warning','127.0.0.1',1296814638),
	(1568,'inbode_rebuild_registry_warning','127.0.0.1',1296814637),
	(1567,'inbode_rebuild_registry_warning','127.0.0.1',1296814511),
	(1566,'inbode_rebuild_registry_warning','127.0.0.1',1296814397),
	(1565,'inbode_rebuild_registry_warning','127.0.0.1',1296814381),
	(1564,'inbode_rebuild_registry_warning','127.0.0.1',1296814370),
	(1563,'inbode_rebuild_registry_warning','127.0.0.1',1296814365),
	(1562,'inbode_rebuild_registry_warning','127.0.0.1',1296814041),
	(1561,'inbode_rebuild_registry_warning','127.0.0.1',1296814017),
	(1560,'inbode_rebuild_registry_warning','127.0.0.1',1296813997),
	(1559,'inbode_rebuild_registry_warning','127.0.0.1',1296813964),
	(1558,'inbode_rebuild_registry_warning','127.0.0.1',1296813731),
	(1557,'inbode_rebuild_registry_warning','127.0.0.1',1296813731),
	(1556,'inbode_rebuild_registry_warning','127.0.0.1',1296813686),
	(1555,'inbode_rebuild_registry_warning','127.0.0.1',1296813686),
	(1554,'inbode_rebuild_registry_warning','127.0.0.1',1296813570),
	(1553,'inbode_rebuild_registry_warning','127.0.0.1',1296813570),
	(1552,'inbode_rebuild_registry_warning','127.0.0.1',1296813565),
	(1551,'inbode_rebuild_registry_warning','127.0.0.1',1296813565),
	(1516,'inbode_rebuild_registry_warning','127.0.0.1',1296813240),
	(1517,'inbode_rebuild_registry_warning','127.0.0.1',1296813241),
	(1518,'inbode_rebuild_registry_warning','127.0.0.1',1296813250),
	(1519,'inbode_rebuild_registry_warning','127.0.0.1',1296813308),
	(1520,'inbode_rebuild_registry_warning','127.0.0.1',1296813308),
	(1521,'inbode_rebuild_registry_warning','127.0.0.1',1296813313),
	(1522,'inbode_rebuild_registry_warning','127.0.0.1',1296813313),
	(1523,'inbode_rebuild_registry_warning','127.0.0.1',1296813317),
	(1524,'inbode_rebuild_registry_warning','127.0.0.1',1296813317),
	(1525,'inbode_rebuild_registry_warning','127.0.0.1',1296813355),
	(1526,'inbode_rebuild_registry_warning','127.0.0.1',1296813355),
	(1527,'inbode_rebuild_registry_warning','127.0.0.1',1296813358),
	(1528,'inbode_rebuild_registry_warning','127.0.0.1',1296813359),
	(1529,'inbode_rebuild_registry_warning','127.0.0.1',1296813437),
	(1530,'inbode_rebuild_registry_warning','127.0.0.1',1296813437),
	(1531,'inbode_rebuild_registry_warning','127.0.0.1',1296813440),
	(1532,'inbode_rebuild_registry_warning','127.0.0.1',1296813440),
	(1533,'inbode_rebuild_registry_warning','127.0.0.1',1296813471),
	(1534,'inbode_rebuild_registry_warning','127.0.0.1',1296813471),
	(1535,'inbode_rebuild_registry_warning','127.0.0.1',1296813475),
	(1536,'inbode_rebuild_registry_warning','127.0.0.1',1296813475),
	(1537,'inbode_rebuild_registry_warning','127.0.0.1',1296813491),
	(1538,'inbode_rebuild_registry_warning','127.0.0.1',1296813491),
	(1539,'inbode_rebuild_registry_warning','127.0.0.1',1296813496),
	(1540,'inbode_rebuild_registry_warning','127.0.0.1',1296813496),
	(1541,'inbode_rebuild_registry_warning','127.0.0.1',1296813500),
	(1542,'inbode_rebuild_registry_warning','127.0.0.1',1296813500),
	(1543,'inbode_rebuild_registry_warning','127.0.0.1',1296813505),
	(1544,'inbode_rebuild_registry_warning','127.0.0.1',1296813505),
	(1545,'inbode_rebuild_registry_warning','127.0.0.1',1296813510),
	(1546,'inbode_rebuild_registry_warning','127.0.0.1',1296813510),
	(1547,'inbode_rebuild_registry_warning','127.0.0.1',1296813513),
	(1548,'inbode_rebuild_registry_warning','127.0.0.1',1296813513),
	(1549,'inbode_rebuild_registry_warning','127.0.0.1',1296813554),
	(1550,'inbode_rebuild_registry_warning','127.0.0.1',1296813554),
	(1923,'inbode_rebuild_registry_warning','127.0.0.1',1296856485),
	(1924,'inbode_rebuild_registry_warning','127.0.0.1',1296856500),
	(1925,'inbode_rebuild_registry_warning','127.0.0.1',1296856500),
	(1926,'inbode_rebuild_registry_warning','127.0.0.1',1296856504),
	(1927,'inbode_rebuild_registry_warning','127.0.0.1',1296856504),
	(1928,'inbode_rebuild_registry_warning','127.0.0.1',1296856509),
	(1929,'inbode_rebuild_registry_warning','127.0.0.1',1296856509),
	(1930,'inbode_rebuild_registry_warning','127.0.0.1',1296856585),
	(1931,'inbode_rebuild_registry_warning','127.0.0.1',1296856585),
	(1932,'inbode_rebuild_registry_warning','127.0.0.1',1296856642),
	(1933,'inbode_rebuild_registry_warning','127.0.0.1',1296856642),
	(1934,'inbode_rebuild_registry_warning','127.0.0.1',1296856687),
	(1935,'inbode_rebuild_registry_warning','127.0.0.1',1296856687),
	(1936,'inbode_rebuild_registry_warning','127.0.0.1',1296856698),
	(1937,'inbode_rebuild_registry_warning','127.0.0.1',1296856698),
	(1938,'inbode_rebuild_registry_warning','127.0.0.1',1296856701),
	(1939,'inbode_rebuild_registry_warning','127.0.0.1',1296856701),
	(1940,'inbode_rebuild_registry_warning','127.0.0.1',1296856703),
	(1941,'inbode_rebuild_registry_warning','127.0.0.1',1296856703),
	(1942,'inbode_rebuild_registry_warning','127.0.0.1',1296856704),
	(1943,'inbode_rebuild_registry_warning','127.0.0.1',1296856704),
	(1944,'inbode_rebuild_registry_warning','127.0.0.1',1296856712),
	(1945,'inbode_rebuild_registry_warning','127.0.0.1',1296856712),
	(1946,'inbode_rebuild_registry_warning','127.0.0.1',1296856828),
	(1947,'inbode_rebuild_registry_warning','127.0.0.1',1296856828),
	(1948,'inbode_rebuild_registry_warning','127.0.0.1',1296857186),
	(1949,'inbode_rebuild_registry_warning','127.0.0.1',1296857186),
	(1950,'inbode_rebuild_registry_warning','127.0.0.1',1296857211),
	(1951,'inbode_rebuild_registry_warning','127.0.0.1',1296857211),
	(1952,'inbode_rebuild_registry_warning','127.0.0.1',1296857646),
	(1953,'inbode_rebuild_registry_warning','127.0.0.1',1296857646),
	(1954,'inbode_rebuild_registry_warning','127.0.0.1',1296857659),
	(1955,'inbode_rebuild_registry_warning','127.0.0.1',1296857659),
	(1956,'inbode_rebuild_registry_warning','127.0.0.1',1297057469),
	(1957,'inbode_rebuild_registry_warning','127.0.0.1',1297057469),
	(1958,'inbode_rebuild_registry_warning','127.0.0.1',1297353475),
	(1959,'inbode_rebuild_registry_warning','127.0.0.1',1297353475),
	(1960,'inbode_rebuild_registry_warning','127.0.0.1',1297353486),
	(1961,'inbode_rebuild_registry_warning','127.0.0.1',1297353486),
	(1962,'inbode_rebuild_registry_warning','127.0.0.1',1297353489),
	(1963,'inbode_rebuild_registry_warning','127.0.0.1',1297353489),
	(1964,'inbode_rebuild_registry_warning','127.0.0.1',1297353499),
	(1965,'inbode_rebuild_registry_warning','127.0.0.1',1297353499),
	(1966,'inbode_rebuild_registry_warning','127.0.0.1',1297353502),
	(1967,'inbode_rebuild_registry_warning','127.0.0.1',1297353502),
	(1968,'inbode_rebuild_registry_warning','127.0.0.1',1297353502),
	(1969,'inbode_rebuild_registry_warning','127.0.0.1',1297353502),
	(1970,'inbode_rebuild_registry_warning','127.0.0.1',1298991660),
	(1971,'inbode_rebuild_registry_warning','127.0.0.1',1298991660),
	(1972,'inbode_rebuild_registry_warning','127.0.0.1',1298991664),
	(1973,'inbode_rebuild_registry_warning','127.0.0.1',1298991670),
	(1974,'inbode_rebuild_registry_warning','127.0.0.1',1298991670),
	(1975,'inbode_rebuild_registry_warning','127.0.0.1',1298991847),
	(1976,'inbode_rebuild_registry_warning','127.0.0.1',1298991847),
	(1977,'inbode_rebuild_registry_warning','127.0.0.1',1298991920),
	(1978,'inbode_rebuild_registry_warning','127.0.0.1',1298991920),
	(1979,'inbode_rebuild_registry_warning','127.0.0.1',1298991928),
	(1980,'inbode_rebuild_registry_warning','127.0.0.1',1298991928),
	(1981,'inbode_rebuild_registry_warning','127.0.0.1',1298992122),
	(1982,'inbode_rebuild_registry_warning','127.0.0.1',1298992122),
	(1983,'inbode_rebuild_registry_warning','127.0.0.1',1298992127),
	(1984,'inbode_rebuild_registry_warning','127.0.0.1',1298992127),
	(1985,'inbode_rebuild_registry_warning','127.0.0.1',1298992435),
	(1986,'inbode_rebuild_registry_warning','127.0.0.1',1298992435),
	(1987,'inbode_rebuild_registry_warning','127.0.0.1',1298992442),
	(1988,'inbode_rebuild_registry_warning','127.0.0.1',1298992442),
	(1989,'inbode_rebuild_registry_warning','127.0.0.1',1298992490),
	(1990,'inbode_rebuild_registry_warning','127.0.0.1',1298992490),
	(1991,'inbode_rebuild_registry_warning','127.0.0.1',1298993317),
	(1992,'inbode_rebuild_registry_warning','127.0.0.1',1298993317),
	(1993,'inbode_rebuild_registry_warning','127.0.0.1',1298993320),
	(1994,'inbode_rebuild_registry_warning','127.0.0.1',1298993320),
	(1995,'inbode_rebuild_registry_warning','127.0.0.1',1298993851),
	(1996,'inbode_rebuild_registry_warning','127.0.0.1',1298993851),
	(1997,'inbode_rebuild_registry_warning','127.0.0.1',1298993858),
	(1998,'inbode_rebuild_registry_warning','127.0.0.1',1298993858),
	(1999,'inbode_rebuild_registry_warning','127.0.0.1',1298998002),
	(2000,'inbode_rebuild_registry_warning','127.0.0.1',1298998002),
	(2001,'inbode_rebuild_registry_warning','127.0.0.1',1298998002),
	(2002,'inbode_rebuild_registry_warning','127.0.0.1',1298998002),
	(2003,'inbode_rebuild_registry_warning','127.0.0.1',1299001325),
	(2004,'inbode_rebuild_registry_warning','127.0.0.1',1299001325),
	(2005,'inbode_rebuild_registry_warning','127.0.0.1',1299002734),
	(2006,'inbode_rebuild_registry_warning','127.0.0.1',1299004932),
	(2007,'inbode_rebuild_registry_warning','127.0.0.1',1299004932),
	(2008,'inbode_rebuild_registry_warning','127.0.0.1',1299007107),
	(2009,'inbode_rebuild_registry_warning','127.0.0.1',1299008581),
	(2010,'inbode_rebuild_registry_warning','127.0.0.1',1299008581),
	(2011,'inbode_rebuild_registry_warning','127.0.0.1',1299008581),
	(2012,'inbode_rebuild_registry_warning','127.0.0.1',1299012210),
	(2013,'inbode_rebuild_registry_warning','127.0.0.1',1299012210),
	(2014,'inbode_rebuild_registry_warning','127.0.0.1',1299012217),
	(2015,'inbode_rebuild_registry_warning','127.0.0.1',1299014731),
	(2016,'inbode_rebuild_registry_warning','127.0.0.1',1299014731),
	(2017,'inbode_rebuild_registry_warning','127.0.0.1',1299014753),
	(2018,'inbode_rebuild_registry_warning','127.0.0.1',1299014754),
	(2019,'inbode_rebuild_registry_warning','127.0.0.1',1299014754),
	(2020,'inbode_rebuild_registry_warning','127.0.0.1',1299014754),
	(2021,'inbode_rebuild_registry_warning','127.0.0.1',1299014789),
	(2022,'inbode_rebuild_registry_warning','127.0.0.1',1299014789),
	(2023,'inbode_rebuild_registry_warning','127.0.0.1',1299014795),
	(2024,'inbode_rebuild_registry_warning','127.0.0.1',1299014795),
	(2025,'inbode_rebuild_registry_warning','127.0.0.1',1299014798),
	(2026,'inbode_rebuild_registry_warning','127.0.0.1',1299014798),
	(2027,'inbode_rebuild_registry_warning','127.0.0.1',1299014815),
	(2028,'inbode_rebuild_registry_warning','127.0.0.1',1299014815),
	(2029,'inbode_rebuild_registry_warning','127.0.0.1',1299014816),
	(2030,'inbode_rebuild_registry_warning','127.0.0.1',1299014816),
	(2031,'inbode_rebuild_registry_warning','127.0.0.1',1299014827),
	(2032,'inbode_rebuild_registry_warning','127.0.0.1',1299014827),
	(2033,'inbode_rebuild_registry_warning','127.0.0.1',1299014832),
	(2034,'inbode_rebuild_registry_warning','127.0.0.1',1299014832),
	(2035,'inbode_rebuild_registry_warning','127.0.0.1',1299014833),
	(2036,'inbode_rebuild_registry_warning','127.0.0.1',1299014833),
	(2037,'inbode_rebuild_registry_warning','127.0.0.1',1299014848),
	(2038,'inbode_rebuild_registry_warning','127.0.0.1',1299014848),
	(2039,'inbode_rebuild_registry_warning','127.0.0.1',1299014863),
	(2040,'inbode_rebuild_registry_warning','127.0.0.1',1299014863),
	(2041,'inbode_rebuild_registry_warning','127.0.0.1',1299014863),
	(2042,'inbode_rebuild_registry_warning','127.0.0.1',1299014863),
	(2043,'inbode_rebuild_registry_warning','127.0.0.1',1299014879),
	(2044,'inbode_rebuild_registry_warning','127.0.0.1',1299014880),
	(2045,'inbode_rebuild_registry_warning','127.0.0.1',1299014890),
	(2046,'inbode_rebuild_registry_warning','127.0.0.1',1299014890),
	(2047,'inbode_rebuild_registry_warning','127.0.0.1',1299014890),
	(2048,'inbode_rebuild_registry_warning','127.0.0.1',1299014890),
	(2049,'inbode_rebuild_registry_warning','127.0.0.1',1299015436),
	(2050,'inbode_rebuild_registry_warning','127.0.0.1',1299015436),
	(2051,'inbode_rebuild_registry_warning','127.0.0.1',1299015439),
	(2052,'inbode_rebuild_registry_warning','127.0.0.1',1299015439),
	(2053,'inbode_rebuild_registry_warning','127.0.0.1',1299015489),
	(2054,'inbode_rebuild_registry_warning','127.0.0.1',1299015489),
	(2055,'inbode_rebuild_registry_warning','127.0.0.1',1299015489),
	(2056,'inbode_rebuild_registry_warning','127.0.0.1',1299015489),
	(2057,'inbode_rebuild_registry_warning','127.0.0.1',1299015542),
	(2058,'inbode_rebuild_registry_warning','127.0.0.1',1299015542),
	(2059,'inbode_rebuild_registry_warning','127.0.0.1',1299015555),
	(2060,'inbode_rebuild_registry_warning','127.0.0.1',1299015555),
	(2061,'inbode_rebuild_registry_warning','127.0.0.1',1299015576),
	(2062,'inbode_rebuild_registry_warning','127.0.0.1',1299015576),
	(2063,'inbode_rebuild_registry_warning','127.0.0.1',1299015577),
	(2064,'inbode_rebuild_registry_warning','127.0.0.1',1299015577),
	(2065,'inbode_rebuild_registry_warning','127.0.0.1',1299015592),
	(2066,'inbode_rebuild_registry_warning','127.0.0.1',1299015592),
	(2067,'inbode_rebuild_registry_warning','127.0.0.1',1299015593),
	(2068,'inbode_rebuild_registry_warning','127.0.0.1',1299015593),
	(2069,'inbode_rebuild_registry_warning','127.0.0.1',1299015744),
	(2070,'inbode_rebuild_registry_warning','127.0.0.1',1299015744),
	(2071,'inbode_rebuild_registry_warning','127.0.0.1',1299015848),
	(2072,'inbode_rebuild_registry_warning','127.0.0.1',1299015848),
	(2073,'inbode_rebuild_registry_warning','127.0.0.1',1299015852),
	(2074,'inbode_rebuild_registry_warning','127.0.0.1',1299015852),
	(2075,'inbode_rebuild_registry_warning','127.0.0.1',1299015853),
	(2076,'inbode_rebuild_registry_warning','127.0.0.1',1299015853),
	(2077,'inbode_rebuild_registry_warning','127.0.0.1',1299016037),
	(2078,'inbode_rebuild_registry_warning','127.0.0.1',1299016037),
	(2079,'inbode_rebuild_registry_warning','127.0.0.1',1299016041),
	(2080,'inbode_rebuild_registry_warning','127.0.0.1',1299016041),
	(2081,'inbode_rebuild_registry_warning','127.0.0.1',1299016042),
	(2082,'inbode_rebuild_registry_warning','127.0.0.1',1299016042),
	(2083,'inbode_rebuild_registry_warning','127.0.0.1',1299016105),
	(2084,'inbode_rebuild_registry_warning','127.0.0.1',1299016105),
	(2085,'inbode_rebuild_registry_warning','127.0.0.1',1299016113),
	(2086,'inbode_rebuild_registry_warning','127.0.0.1',1299016113),
	(2087,'inbode_rebuild_registry_warning','127.0.0.1',1299016113),
	(2088,'inbode_rebuild_registry_warning','127.0.0.1',1299016113),
	(2089,'inbode_rebuild_registry_warning','127.0.0.1',1299016168),
	(2090,'inbode_rebuild_registry_warning','127.0.0.1',1299016168),
	(2091,'inbode_rebuild_registry_warning','127.0.0.1',1299016174),
	(2092,'inbode_rebuild_registry_warning','127.0.0.1',1299016174),
	(2093,'inbode_rebuild_registry_warning','127.0.0.1',1299016175),
	(2094,'inbode_rebuild_registry_warning','127.0.0.1',1299016175),
	(2095,'inbode_rebuild_registry_warning','127.0.0.1',1299018433),
	(2096,'inbode_rebuild_registry_warning','127.0.0.1',1299018433),
	(2097,'inbode_rebuild_registry_warning','127.0.0.1',1299258623),
	(2098,'inbode_rebuild_registry_warning','127.0.0.1',1299258623),
	(2099,'inbode_rebuild_registry_warning','127.0.0.1',1299258629),
	(2100,'inbode_rebuild_registry_warning','127.0.0.1',1299262547),
	(2101,'inbode_rebuild_registry_warning','127.0.0.1',1299262547),
	(2102,'inbode_rebuild_registry_warning','127.0.0.1',1299262553),
	(2103,'inbode_rebuild_registry_warning','127.0.0.1',1299326676),
	(2104,'inbode_rebuild_registry_warning','127.0.0.1',1299326676),
	(2105,'inbode_rebuild_registry_warning','127.0.0.1',1299326681),
	(2106,'inbode_rebuild_registry_warning','127.0.0.1',1299331425),
	(2107,'inbode_rebuild_registry_warning','127.0.0.1',1299331425),
	(2108,'inbode_rebuild_registry_warning','127.0.0.1',1299331426),
	(2109,'inbode_rebuild_registry_warning','127.0.0.1',1299336374),
	(2110,'inbode_rebuild_registry_warning','127.0.0.1',1299336375),
	(2111,'inbode_rebuild_registry_warning','127.0.0.1',1299336647),
	(2112,'inbode_rebuild_registry_warning','127.0.0.1',1299355331),
	(2113,'inbode_rebuild_registry_warning','127.0.0.1',1299355332),
	(2114,'inbode_rebuild_registry_warning','127.0.0.1',1299355338),
	(2115,'inbode_rebuild_registry_warning','127.0.0.1',1299359533),
	(2116,'inbode_rebuild_registry_warning','127.0.0.1',1299359534),
	(2117,'inbode_rebuild_registry_warning','127.0.0.1',1299359842),
	(2118,'inbode_rebuild_registry_warning','127.0.0.1',1299359966),
	(2119,'inbode_rebuild_registry_warning','127.0.0.1',1299359966),
	(2120,'inbode_rebuild_registry_warning','127.0.0.1',1299360180),
	(2121,'inbode_rebuild_registry_warning','127.0.0.1',1299360180),
	(2122,'inbode_rebuild_registry_warning','127.0.0.1',1299360195),
	(2123,'inbode_rebuild_registry_warning','127.0.0.1',1299360195),
	(2124,'inbode_rebuild_registry_warning','127.0.0.1',1299360229),
	(2125,'inbode_rebuild_registry_warning','127.0.0.1',1299360229),
	(2126,'inbode_rebuild_registry_warning','127.0.0.1',1299360233),
	(2127,'inbode_rebuild_registry_warning','127.0.0.1',1299360233),
	(2128,'inbode_rebuild_registry_warning','127.0.0.1',1299360235),
	(2129,'inbode_rebuild_registry_warning','127.0.0.1',1299360235),
	(2130,'inbode_rebuild_registry_warning','127.0.0.1',1299360238),
	(2131,'inbode_rebuild_registry_warning','127.0.0.1',1299360238),
	(2132,'inbode_rebuild_registry_warning','127.0.0.1',1299360266),
	(2133,'inbode_rebuild_registry_warning','127.0.0.1',1299360267),
	(2134,'inbode_rebuild_registry_warning','127.0.0.1',1299360281),
	(2135,'inbode_rebuild_registry_warning','127.0.0.1',1299360281),
	(2136,'inbode_rebuild_registry_warning','127.0.0.1',1299360304),
	(2137,'inbode_rebuild_registry_warning','127.0.0.1',1299360304),
	(2138,'inbode_rebuild_registry_warning','127.0.0.1',1299360307),
	(2139,'inbode_rebuild_registry_warning','127.0.0.1',1299360308),
	(2140,'inbode_rebuild_registry_warning','127.0.0.1',1299360311),
	(2141,'inbode_rebuild_registry_warning','127.0.0.1',1299360311),
	(2142,'inbode_rebuild_registry_warning','127.0.0.1',1299360316),
	(2143,'inbode_rebuild_registry_warning','127.0.0.1',1299360317),
	(2144,'inbode_rebuild_registry_warning','127.0.0.1',1299360319),
	(2145,'inbode_rebuild_registry_warning','127.0.0.1',1299360319),
	(2146,'inbode_rebuild_registry_warning','127.0.0.1',1299360337),
	(2147,'inbode_rebuild_registry_warning','127.0.0.1',1299360338),
	(2148,'inbode_rebuild_registry_warning','127.0.0.1',1299360354),
	(2149,'inbode_rebuild_registry_warning','127.0.0.1',1299360354),
	(2150,'inbode_rebuild_registry_warning','127.0.0.1',1299360358),
	(2151,'inbode_rebuild_registry_warning','127.0.0.1',1299360358),
	(2152,'inbode_rebuild_registry_warning','127.0.0.1',1299360362),
	(2153,'inbode_rebuild_registry_warning','127.0.0.1',1299360362),
	(2154,'inbode_rebuild_registry_warning','127.0.0.1',1299518114),
	(2155,'inbode_rebuild_registry_warning','127.0.0.1',1299518114),
	(2156,'inbode_rebuild_registry_warning','127.0.0.1',1299518119),
	(2157,'inbode_rebuild_registry_warning','127.0.0.1',1299521527),
	(2158,'inbode_rebuild_registry_warning','127.0.0.1',1299521527),
	(2159,'inbode_rebuild_registry_warning','127.0.0.1',1299521536),
	(2160,'inbode_rebuild_registry_warning','127.0.0.1',1299521536),
	(2161,'inbode_rebuild_registry_warning','127.0.0.1',1299521552),
	(2162,'inbode_rebuild_registry_warning','127.0.0.1',1299521552),
	(2163,'inbode_rebuild_registry_warning','127.0.0.1',1299521553),
	(2164,'inbode_rebuild_registry_warning','127.0.0.1',1299521553),
	(2165,'inbode_rebuild_registry_warning','127.0.0.1',1299521553),
	(2166,'inbode_rebuild_registry_warning','127.0.0.1',1299521553),
	(2167,'inbode_rebuild_registry_warning','127.0.0.1',1299521554),
	(2168,'inbode_rebuild_registry_warning','127.0.0.1',1299521554),
	(2169,'inbode_rebuild_registry_warning','127.0.0.1',1299521576),
	(2170,'inbode_rebuild_registry_warning','127.0.0.1',1299521576),
	(2171,'inbode_rebuild_registry_warning','127.0.0.1',1299521579),
	(2172,'inbode_rebuild_registry_warning','127.0.0.1',1299521579),
	(2173,'inbode_rebuild_registry_warning','127.0.0.1',1299526361),
	(2174,'inbode_rebuild_registry_warning','127.0.0.1',1299526362),
	(2175,'inbode_rebuild_registry_warning','127.0.0.1',1299526419),
	(2176,'inbode_rebuild_registry_warning','127.0.0.1',1299529617),
	(2177,'inbode_rebuild_registry_warning','127.0.0.1',1299529618),
	(2178,'inbode_rebuild_registry_warning','127.0.0.1',1299529725),
	(2179,'inbode_rebuild_registry_warning','127.0.0.1',1299529725),
	(2180,'inbode_rebuild_registry_warning','127.0.0.1',1299529757),
	(2181,'inbode_rebuild_registry_warning','127.0.0.1',1299529757),
	(2182,'inbode_rebuild_registry_warning','127.0.0.1',1299530053),
	(2183,'inbode_rebuild_registry_warning','127.0.0.1',1299530053),
	(2184,'inbode_rebuild_registry_warning','127.0.0.1',1299530186),
	(2185,'inbode_rebuild_registry_warning','127.0.0.1',1299530186),
	(2186,'inbode_rebuild_registry_warning','127.0.0.1',1299530191),
	(2187,'inbode_rebuild_registry_warning','127.0.0.1',1299530191),
	(2188,'inbode_rebuild_registry_warning','127.0.0.1',1299530193),
	(2189,'inbode_rebuild_registry_warning','127.0.0.1',1299530193),
	(2190,'inbode_rebuild_registry_warning','127.0.0.1',1299530196),
	(2191,'inbode_rebuild_registry_warning','127.0.0.1',1299530196),
	(2192,'inbode_rebuild_registry_warning','127.0.0.1',1299530196),
	(2193,'inbode_rebuild_registry_warning','127.0.0.1',1299530196),
	(2194,'inbode_rebuild_registry_warning','127.0.0.1',1299530199),
	(2195,'inbode_rebuild_registry_warning','127.0.0.1',1299530199),
	(2196,'inbode_rebuild_registry_warning','127.0.0.1',1299530199),
	(2197,'inbode_rebuild_registry_warning','127.0.0.1',1299530199),
	(2198,'inbode_rebuild_registry_warning','127.0.0.1',1299530253),
	(2199,'inbode_rebuild_registry_warning','127.0.0.1',1299530253),
	(2200,'inbode_rebuild_registry_warning','127.0.0.1',1299530290),
	(2201,'inbode_rebuild_registry_warning','127.0.0.1',1299530290),
	(2202,'inbode_rebuild_registry_warning','127.0.0.1',1299530337),
	(2203,'inbode_rebuild_registry_warning','127.0.0.1',1299530337),
	(2204,'inbode_rebuild_registry_warning','127.0.0.1',1299530360),
	(2205,'inbode_rebuild_registry_warning','127.0.0.1',1299530360),
	(2206,'inbode_rebuild_registry_warning','127.0.0.1',1299530397),
	(2207,'inbode_rebuild_registry_warning','127.0.0.1',1299530397),
	(2208,'inbode_rebuild_registry_warning','127.0.0.1',1299530404),
	(2209,'inbode_rebuild_registry_warning','127.0.0.1',1299530404),
	(2210,'inbode_rebuild_registry_warning','127.0.0.1',1299530404),
	(2211,'inbode_rebuild_registry_warning','127.0.0.1',1299530404),
	(2212,'inbode_rebuild_registry_warning','127.0.0.1',1299530605),
	(2213,'inbode_rebuild_registry_warning','127.0.0.1',1299530605),
	(2214,'inbode_rebuild_registry_warning','127.0.0.1',1299530612),
	(2215,'inbode_rebuild_registry_warning','127.0.0.1',1299530612),
	(2216,'inbode_rebuild_registry_warning','127.0.0.1',1299530615),
	(2217,'inbode_rebuild_registry_warning','127.0.0.1',1299530615),
	(2218,'inbode_rebuild_registry_warning','127.0.0.1',1299530619),
	(2219,'inbode_rebuild_registry_warning','127.0.0.1',1299530619),
	(2220,'inbode_rebuild_registry_warning','127.0.0.1',1299530622),
	(2221,'inbode_rebuild_registry_warning','127.0.0.1',1299530622),
	(2222,'inbode_rebuild_registry_warning','127.0.0.1',1299531021),
	(2223,'inbode_rebuild_registry_warning','127.0.0.1',1299531022),
	(2224,'inbode_rebuild_registry_warning','127.0.0.1',1299531024),
	(2225,'inbode_rebuild_registry_warning','127.0.0.1',1299531024),
	(2226,'inbode_rebuild_registry_warning','127.0.0.1',1299534622),
	(2227,'inbode_rebuild_registry_warning','127.0.0.1',1299534624),
	(2228,'inbode_rebuild_registry_warning','127.0.0.1',1299534624),
	(2229,'inbode_rebuild_registry_warning','127.0.0.1',1299539282),
	(2230,'inbode_rebuild_registry_warning','127.0.0.1',1299539282),
	(2231,'inbode_rebuild_registry_warning','127.0.0.1',1299539283),
	(2232,'inbode_rebuild_registry_warning','127.0.0.1',1299542905),
	(2233,'inbode_rebuild_registry_warning','127.0.0.1',1299542905),
	(2234,'inbode_rebuild_registry_warning','127.0.0.1',1299542906),
	(2235,'inbode_rebuild_registry_warning','127.0.0.1',1299599700),
	(2236,'inbode_rebuild_registry_warning','127.0.0.1',1299599700),
	(2237,'inbode_rebuild_registry_warning','127.0.0.1',1299608950),
	(2238,'inbode_rebuild_registry_warning','127.0.0.1',1299608951),
	(2239,'inbode_rebuild_registry_warning','127.0.0.1',1299608952),
	(2240,'inbode_rebuild_registry_warning','127.0.0.1',1299612559),
	(2241,'inbode_rebuild_registry_warning','127.0.0.1',1299612559),
	(2242,'inbode_rebuild_registry_warning','127.0.0.1',1299612559),
	(2243,'inbode_rebuild_registry_warning','127.0.0.1',1299615272),
	(2244,'inbode_rebuild_registry_warning','127.0.0.1',1299615272),
	(2245,'inbode_rebuild_registry_warning','127.0.0.1',1299615284),
	(2246,'inbode_rebuild_registry_warning','127.0.0.1',1299615284),
	(2247,'inbode_rebuild_registry_warning','127.0.0.1',1299615290),
	(2248,'inbode_rebuild_registry_warning','127.0.0.1',1299615290),
	(2249,'inbode_rebuild_registry_warning','127.0.0.1',1299616427),
	(2250,'inbode_rebuild_registry_warning','127.0.0.1',1299616427),
	(2251,'inbode_rebuild_registry_warning','127.0.0.1',1299617525),
	(2252,'inbode_rebuild_registry_warning','127.0.0.1',1299617525),
	(2253,'inbode_rebuild_registry_warning','127.0.0.1',1299617533),
	(2254,'inbode_rebuild_registry_warning','127.0.0.1',1299617533),
	(2255,'inbode_rebuild_registry_warning','127.0.0.1',1299617552),
	(2256,'inbode_rebuild_registry_warning','127.0.0.1',1299617552),
	(2257,'inbode_rebuild_registry_warning','127.0.0.1',1299617554),
	(2258,'inbode_rebuild_registry_warning','127.0.0.1',1299617554),
	(2259,'inbode_rebuild_registry_warning','127.0.0.1',1299617558),
	(2260,'inbode_rebuild_registry_warning','127.0.0.1',1299617558),
	(2261,'inbode_rebuild_registry_warning','127.0.0.1',1299617558),
	(2262,'inbode_rebuild_registry_warning','127.0.0.1',1299617558),
	(2263,'inbode_rebuild_registry_warning','127.0.0.1',1299617633),
	(2264,'inbode_rebuild_registry_warning','127.0.0.1',1299617633),
	(2265,'inbode_rebuild_registry_warning','127.0.0.1',1299617639),
	(2266,'inbode_rebuild_registry_warning','127.0.0.1',1299617639),
	(2267,'inbode_rebuild_registry_warning','127.0.0.1',1299617751),
	(2268,'inbode_rebuild_registry_warning','127.0.0.1',1299617751),
	(2269,'inbode_rebuild_registry_warning','127.0.0.1',1299617751),
	(2270,'inbode_rebuild_registry_warning','127.0.0.1',1299617751),
	(2271,'inbode_rebuild_registry_warning','127.0.0.1',1299617769),
	(2272,'inbode_rebuild_registry_warning','127.0.0.1',1299617769),
	(2273,'inbode_rebuild_registry_warning','127.0.0.1',1299624916),
	(2274,'inbode_rebuild_registry_warning','127.0.0.1',1299624916),
	(2275,'inbode_rebuild_registry_warning','127.0.0.1',1299624941),
	(2276,'inbode_rebuild_registry_warning','127.0.0.1',1299624999),
	(2277,'inbode_rebuild_registry_warning','127.0.0.1',1299624999),
	(2278,'inbode_rebuild_registry_warning','127.0.0.1',1299625027),
	(2279,'inbode_rebuild_registry_warning','127.0.0.1',1299625027),
	(2280,'inbode_rebuild_registry_warning','127.0.0.1',1299625034),
	(2281,'inbode_rebuild_registry_warning','127.0.0.1',1299625034),
	(2282,'inbode_rebuild_registry_warning','127.0.0.1',1299625142),
	(2283,'inbode_rebuild_registry_warning','127.0.0.1',1299625142),
	(2284,'inbode_rebuild_registry_warning','127.0.0.1',1299625143),
	(2285,'inbode_rebuild_registry_warning','127.0.0.1',1299625143),
	(2286,'inbode_rebuild_registry_warning','127.0.0.1',1299625145),
	(2287,'inbode_rebuild_registry_warning','127.0.0.1',1299625145),
	(2288,'inbode_rebuild_registry_warning','127.0.0.1',1299625149),
	(2289,'inbode_rebuild_registry_warning','127.0.0.1',1299625149),
	(2290,'inbode_rebuild_registry_warning','127.0.0.1',1299625149),
	(2291,'inbode_rebuild_registry_warning','127.0.0.1',1299625149),
	(2292,'inbode_rebuild_registry_warning','127.0.0.1',1299625151),
	(2293,'inbode_rebuild_registry_warning','127.0.0.1',1299625151),
	(2294,'inbode_rebuild_registry_warning','127.0.0.1',1299625154),
	(2295,'inbode_rebuild_registry_warning','127.0.0.1',1299625154),
	(2296,'inbode_rebuild_registry_warning','127.0.0.1',1299625155),
	(2297,'inbode_rebuild_registry_warning','127.0.0.1',1299625155),
	(2298,'inbode_rebuild_registry_warning','127.0.0.1',1299689594),
	(2299,'inbode_rebuild_registry_warning','127.0.0.1',1299689594),
	(2300,'inbode_rebuild_registry_warning','127.0.0.1',1299689594),
	(2301,'inbode_rebuild_registry_warning','127.0.0.1',1299689642),
	(2302,'inbode_rebuild_registry_warning','127.0.0.1',1299689642),
	(2303,'inbode_rebuild_registry_warning','127.0.0.1',1299689657),
	(2304,'inbode_rebuild_registry_warning','127.0.0.1',1299689657),
	(2305,'inbode_rebuild_registry_warning','127.0.0.1',1299689657),
	(2306,'inbode_rebuild_registry_warning','127.0.0.1',1299689657),
	(2307,'inbode_rebuild_registry_warning','127.0.0.1',1299689674),
	(2308,'inbode_rebuild_registry_warning','127.0.0.1',1299689674),
	(2309,'inbode_rebuild_registry_warning','127.0.0.1',1299689692),
	(2310,'inbode_rebuild_registry_warning','127.0.0.1',1299689692),
	(2311,'inbode_rebuild_registry_warning','127.0.0.1',1299689724),
	(2312,'inbode_rebuild_registry_warning','127.0.0.1',1299689724),
	(2313,'inbode_rebuild_registry_warning','127.0.0.1',1299689738),
	(2314,'inbode_rebuild_registry_warning','127.0.0.1',1299689738),
	(2315,'inbode_rebuild_registry_warning','127.0.0.1',1299689759),
	(2316,'inbode_rebuild_registry_warning','127.0.0.1',1299689759),
	(2317,'inbode_rebuild_registry_warning','127.0.0.1',1299689763),
	(2318,'inbode_rebuild_registry_warning','127.0.0.1',1299689763),
	(2319,'inbode_rebuild_registry_warning','127.0.0.1',1299689763),
	(2320,'inbode_rebuild_registry_warning','127.0.0.1',1299689763),
	(2321,'inbode_rebuild_registry_warning','127.0.0.1',1299689949),
	(2322,'inbode_rebuild_registry_warning','127.0.0.1',1299689949),
	(2323,'inbode_rebuild_registry_warning','127.0.0.1',1299689996),
	(2324,'inbode_rebuild_registry_warning','127.0.0.1',1299689996),
	(2325,'inbode_rebuild_registry_warning','127.0.0.1',1299689999),
	(2326,'inbode_rebuild_registry_warning','127.0.0.1',1299689999),
	(2327,'inbode_rebuild_registry_warning','127.0.0.1',1299690003),
	(2328,'inbode_rebuild_registry_warning','127.0.0.1',1299690003),
	(2329,'inbode_rebuild_registry_warning','127.0.0.1',1299690003),
	(2330,'inbode_rebuild_registry_warning','127.0.0.1',1299690004),
	(2331,'inbode_rebuild_registry_warning','127.0.0.1',1299690015),
	(2332,'inbode_rebuild_registry_warning','127.0.0.1',1299690015),
	(2333,'inbode_rebuild_registry_warning','127.0.0.1',1299690044),
	(2334,'inbode_rebuild_registry_warning','127.0.0.1',1299690044),
	(2335,'inbode_rebuild_registry_warning','127.0.0.1',1299690044),
	(2336,'inbode_rebuild_registry_warning','127.0.0.1',1299690044),
	(2337,'inbode_rebuild_registry_warning','127.0.0.1',1299690091),
	(2338,'inbode_rebuild_registry_warning','127.0.0.1',1299690091),
	(2339,'inbode_rebuild_registry_warning','127.0.0.1',1299690348),
	(2340,'inbode_rebuild_registry_warning','127.0.0.1',1299690348),
	(2341,'inbode_rebuild_registry_warning','127.0.0.1',1299690398),
	(2342,'inbode_rebuild_registry_warning','127.0.0.1',1299690398),
	(2343,'inbode_rebuild_registry_warning','127.0.0.1',1299690583),
	(2344,'inbode_rebuild_registry_warning','127.0.0.1',1299690583),
	(2345,'inbode_rebuild_registry_warning','127.0.0.1',1299690610),
	(2346,'inbode_rebuild_registry_warning','127.0.0.1',1299690610),
	(2347,'inbode_rebuild_registry_warning','127.0.0.1',1299695836),
	(2348,'inbode_rebuild_registry_warning','127.0.0.1',1299695837),
	(2349,'inbode_rebuild_registry_warning','127.0.0.1',1299695903),
	(2350,'inbode_rebuild_registry_warning','127.0.0.1',1299695903),
	(2351,'inbode_rebuild_registry_warning','127.0.0.1',1299695903),
	(2352,'inbode_rebuild_registry_warning','127.0.0.1',1299695903),
	(2353,'inbode_rebuild_registry_warning','127.0.0.1',1299696386),
	(2354,'inbode_rebuild_registry_warning','127.0.0.1',1299696386),
	(2355,'inbode_rebuild_registry_warning','127.0.0.1',1299696467),
	(2356,'inbode_rebuild_registry_warning','127.0.0.1',1299696468),
	(2357,'inbode_rebuild_registry_warning','127.0.0.1',1299696468),
	(2358,'inbode_rebuild_registry_warning','127.0.0.1',1299696468),
	(2359,'inbode_rebuild_registry_warning','127.0.0.1',1299697266),
	(2360,'inbode_rebuild_registry_warning','127.0.0.1',1299697267),
	(2361,'inbode_rebuild_registry_warning','127.0.0.1',1299697268),
	(2362,'inbode_rebuild_registry_warning','127.0.0.1',1299697268),
	(2363,'inbode_rebuild_registry_warning','127.0.0.1',1299697270),
	(2364,'inbode_rebuild_registry_warning','127.0.0.1',1299697270),
	(2365,'inbode_rebuild_registry_warning','127.0.0.1',1299697276),
	(2366,'inbode_rebuild_registry_warning','127.0.0.1',1299697276),
	(2367,'inbode_rebuild_registry_warning','127.0.0.1',1299697290),
	(2368,'inbode_rebuild_registry_warning','127.0.0.1',1299697290),
	(2369,'inbode_rebuild_registry_warning','127.0.0.1',1299697290),
	(2370,'inbode_rebuild_registry_warning','127.0.0.1',1299697290),
	(2371,'inbode_rebuild_registry_warning','127.0.0.1',1299697295),
	(2372,'inbode_rebuild_registry_warning','127.0.0.1',1299697295),
	(2373,'inbode_rebuild_registry_warning','127.0.0.1',1299697295),
	(2374,'inbode_rebuild_registry_warning','127.0.0.1',1299697295),
	(2375,'inbode_rebuild_registry_warning','127.0.0.1',1299697300),
	(2376,'inbode_rebuild_registry_warning','127.0.0.1',1299697300),
	(2377,'inbode_rebuild_registry_warning','127.0.0.1',1299697308),
	(2378,'inbode_rebuild_registry_warning','127.0.0.1',1299697308),
	(2379,'inbode_rebuild_registry_warning','127.0.0.1',1299697308),
	(2380,'inbode_rebuild_registry_warning','127.0.0.1',1299697308),
	(2381,'inbode_rebuild_registry_warning','127.0.0.1',1299697332),
	(2382,'inbode_rebuild_registry_warning','127.0.0.1',1299697332),
	(2383,'inbode_rebuild_registry_warning','127.0.0.1',1299697344),
	(2384,'inbode_rebuild_registry_warning','127.0.0.1',1299697344),
	(2385,'inbode_rebuild_registry_warning','127.0.0.1',1299697344),
	(2386,'inbode_rebuild_registry_warning','127.0.0.1',1299697344),
	(2387,'inbode_rebuild_registry_warning','127.0.0.1',1299697359),
	(2388,'inbode_rebuild_registry_warning','127.0.0.1',1299697359),
	(2389,'inbode_rebuild_registry_warning','127.0.0.1',1299697363),
	(2390,'inbode_rebuild_registry_warning','127.0.0.1',1299697363),
	(2391,'inbode_rebuild_registry_warning','127.0.0.1',1299697364),
	(2392,'inbode_rebuild_registry_warning','127.0.0.1',1299697364),
	(2393,'inbode_rebuild_registry_warning','127.0.0.1',1299698043),
	(2394,'inbode_rebuild_registry_warning','127.0.0.1',1299698043),
	(2395,'inbode_rebuild_registry_warning','127.0.0.1',1299698045),
	(2396,'inbode_rebuild_registry_warning','127.0.0.1',1299698045),
	(2397,'inbode_rebuild_registry_warning','127.0.0.1',1299698057),
	(2398,'inbode_rebuild_registry_warning','127.0.0.1',1299698057),
	(2399,'inbode_rebuild_registry_warning','127.0.0.1',1299698057),
	(2400,'inbode_rebuild_registry_warning','127.0.0.1',1299698057),
	(2401,'inbode_rebuild_registry_warning','127.0.0.1',1299701634),
	(2402,'inbode_rebuild_registry_warning','127.0.0.1',1299701634),
	(2403,'inbode_rebuild_registry_warning','127.0.0.1',1299701639),
	(2404,'inbode_rebuild_registry_warning','127.0.0.1',1299701639),
	(2405,'inbode_rebuild_registry_warning','127.0.0.1',1299701821),
	(2406,'inbode_rebuild_registry_warning','127.0.0.1',1299701821),
	(2407,'inbode_rebuild_registry_warning','127.0.0.1',1299701835),
	(2408,'inbode_rebuild_registry_warning','127.0.0.1',1299701835),
	(2409,'inbode_rebuild_registry_warning','127.0.0.1',1299701881),
	(2410,'inbode_rebuild_registry_warning','127.0.0.1',1299701882),
	(2411,'inbode_rebuild_registry_warning','127.0.0.1',1299701961),
	(2412,'inbode_rebuild_registry_warning','127.0.0.1',1299701961),
	(2413,'inbode_rebuild_registry_warning','127.0.0.1',1299701965),
	(2414,'inbode_rebuild_registry_warning','127.0.0.1',1299701966),
	(2415,'inbode_rebuild_registry_warning','127.0.0.1',1299701966),
	(2416,'inbode_rebuild_registry_warning','127.0.0.1',1299701966),
	(2417,'inbode_rebuild_registry_warning','127.0.0.1',1299704481),
	(2418,'inbode_rebuild_registry_warning','127.0.0.1',1299704481),
	(2419,'inbode_rebuild_registry_warning','127.0.0.1',1299704484),
	(2420,'inbode_rebuild_registry_warning','127.0.0.1',1299704484),
	(2421,'inbode_rebuild_registry_warning','127.0.0.1',1299704485),
	(2422,'inbode_rebuild_registry_warning','127.0.0.1',1299704485),
	(2423,'inbode_rebuild_registry_warning','127.0.0.1',1299704502),
	(2424,'inbode_rebuild_registry_warning','127.0.0.1',1299704502),
	(2425,'inbode_rebuild_registry_warning','127.0.0.1',1299704588),
	(2426,'inbode_rebuild_registry_warning','127.0.0.1',1299704588),
	(2427,'inbode_rebuild_registry_warning','127.0.0.1',1299704589),
	(2428,'inbode_rebuild_registry_warning','127.0.0.1',1299704589),
	(2429,'inbode_rebuild_registry_warning','127.0.0.1',1299704716),
	(2430,'inbode_rebuild_registry_warning','127.0.0.1',1299704716),
	(2431,'inbode_rebuild_registry_warning','127.0.0.1',1299704739),
	(2432,'inbode_rebuild_registry_warning','127.0.0.1',1299704739),
	(2433,'inbode_rebuild_registry_warning','127.0.0.1',1299704740),
	(2434,'inbode_rebuild_registry_warning','127.0.0.1',1299704740),
	(2435,'inbode_rebuild_registry_warning','127.0.0.1',1299704740),
	(2436,'inbode_rebuild_registry_warning','127.0.0.1',1299704740),
	(2437,'inbode_rebuild_registry_warning','127.0.0.1',1299704741),
	(2438,'inbode_rebuild_registry_warning','127.0.0.1',1299704741),
	(2439,'inbode_rebuild_registry_warning','127.0.0.1',1299704799),
	(2440,'inbode_rebuild_registry_warning','127.0.0.1',1299704799),
	(2441,'inbode_rebuild_registry_warning','127.0.0.1',1299704799),
	(2442,'inbode_rebuild_registry_warning','127.0.0.1',1299704799),
	(2443,'inbode_rebuild_registry_warning','127.0.0.1',1299704816),
	(2444,'inbode_rebuild_registry_warning','127.0.0.1',1299704816),
	(2445,'inbode_rebuild_registry_warning','127.0.0.1',1299704816),
	(2446,'inbode_rebuild_registry_warning','127.0.0.1',1299704816),
	(2447,'inbode_rebuild_registry_warning','127.0.0.1',1299708457),
	(2448,'inbode_rebuild_registry_warning','127.0.0.1',1299708457),
	(2449,'inbode_rebuild_registry_warning','127.0.0.1',1299708461),
	(2450,'inbode_rebuild_registry_warning','127.0.0.1',1299708463),
	(2451,'inbode_rebuild_registry_warning','127.0.0.1',1299708464),
	(2452,'inbode_rebuild_registry_warning','127.0.0.1',1299708472),
	(2453,'inbode_rebuild_registry_warning','127.0.0.1',1299708472),
	(2454,'inbode_rebuild_registry_warning','127.0.0.1',1299708473),
	(2455,'inbode_rebuild_registry_warning','127.0.0.1',1299708473),
	(2456,'inbode_rebuild_registry_warning','127.0.0.1',1299708473),
	(2457,'inbode_rebuild_registry_warning','127.0.0.1',1299708473),
	(2458,'inbode_rebuild_registry_warning','127.0.0.1',1299712846),
	(2459,'inbode_rebuild_registry_warning','127.0.0.1',1299712846),
	(2460,'inbode_rebuild_registry_warning','127.0.0.1',1299712850),
	(2461,'inbode_rebuild_registry_warning','127.0.0.1',1299714398),
	(2462,'inbode_rebuild_registry_warning','127.0.0.1',1299714398),
	(2463,'inbode_rebuild_registry_warning','127.0.0.1',1299714636),
	(2464,'inbode_rebuild_registry_warning','127.0.0.1',1299714636),
	(2465,'inbode_rebuild_registry_warning','127.0.0.1',1299714668),
	(2466,'inbode_rebuild_registry_warning','127.0.0.1',1299714668),
	(2467,'inbode_rebuild_registry_warning','127.0.0.1',1299714670),
	(2468,'inbode_rebuild_registry_warning','127.0.0.1',1299714670),
	(2469,'inbode_rebuild_registry_warning','127.0.0.1',1299714677),
	(2470,'inbode_rebuild_registry_warning','127.0.0.1',1299714677),
	(2471,'inbode_rebuild_registry_warning','127.0.0.1',1299714680),
	(2472,'inbode_rebuild_registry_warning','127.0.0.1',1299714680),
	(2473,'inbode_rebuild_registry_warning','127.0.0.1',1299714685),
	(2474,'inbode_rebuild_registry_warning','127.0.0.1',1299714685),
	(2475,'inbode_rebuild_registry_warning','127.0.0.1',1299714685),
	(2476,'inbode_rebuild_registry_warning','127.0.0.1',1299714685),
	(2477,'inbode_rebuild_registry_warning','127.0.0.1',1299781776),
	(2478,'inbode_rebuild_registry_warning','127.0.0.1',1299781776),
	(2479,'inbode_rebuild_registry_warning','127.0.0.1',1299781924),
	(2480,'inbode_rebuild_registry_warning','127.0.0.1',1299781958),
	(2481,'inbode_rebuild_registry_warning','127.0.0.1',1299781958),
	(2482,'inbode_rebuild_registry_warning','127.0.0.1',1299781959),
	(2483,'inbode_rebuild_registry_warning','127.0.0.1',1299781959),
	(2484,'inbode_rebuild_registry_warning','127.0.0.1',1299782042),
	(2485,'inbode_rebuild_registry_warning','127.0.0.1',1299782042),
	(2486,'inbode_rebuild_registry_warning','127.0.0.1',1299782048),
	(2487,'inbode_rebuild_registry_warning','127.0.0.1',1299782048),
	(2488,'inbode_rebuild_registry_warning','127.0.0.1',1299782050),
	(2489,'inbode_rebuild_registry_warning','127.0.0.1',1299782050),
	(2490,'inbode_rebuild_registry_warning','127.0.0.1',1299782059),
	(2491,'inbode_rebuild_registry_warning','127.0.0.1',1299782059),
	(2492,'inbode_rebuild_registry_warning','127.0.0.1',1299782059),
	(2493,'inbode_rebuild_registry_warning','127.0.0.1',1299782059),
	(2494,'inbode_rebuild_registry_warning','127.0.0.1',1299782068),
	(2495,'inbode_rebuild_registry_warning','127.0.0.1',1299782068),
	(2496,'inbode_rebuild_registry_warning','127.0.0.1',1299782070),
	(2497,'inbode_rebuild_registry_warning','127.0.0.1',1299782070),
	(2498,'inbode_rebuild_registry_warning','127.0.0.1',1299782076),
	(2499,'inbode_rebuild_registry_warning','127.0.0.1',1299782076),
	(2500,'inbode_rebuild_registry_warning','127.0.0.1',1299782076),
	(2501,'inbode_rebuild_registry_warning','127.0.0.1',1299782076),
	(2502,'inbode_rebuild_registry_warning','127.0.0.1',1299789955),
	(2503,'inbode_rebuild_registry_warning','127.0.0.1',1299789955),
	(2504,'inbode_rebuild_registry_warning','127.0.0.1',1299789982),
	(2505,'inbode_rebuild_registry_warning','127.0.0.1',1299789982),
	(2506,'inbode_rebuild_registry_warning','127.0.0.1',1299789988),
	(2507,'inbode_rebuild_registry_warning','127.0.0.1',1299789988),
	(2508,'inbode_rebuild_registry_warning','127.0.0.1',1299792200),
	(2509,'inbode_rebuild_registry_warning','127.0.0.1',1299792200),
	(2510,'inbode_rebuild_registry_warning','127.0.0.1',1299798117),
	(2511,'inbode_rebuild_registry_warning','127.0.0.1',1299798117),
	(2512,'inbode_rebuild_registry_warning','127.0.0.1',1299798118),
	(2513,'inbode_rebuild_registry_warning','127.0.0.1',1299798170),
	(2514,'inbode_rebuild_registry_warning','127.0.0.1',1299798170),
	(2515,'inbode_rebuild_registry_warning','127.0.0.1',1299798231),
	(2516,'inbode_rebuild_registry_warning','127.0.0.1',1299798231),
	(2517,'inbode_rebuild_registry_warning','127.0.0.1',1299865241),
	(2518,'inbode_rebuild_registry_warning','127.0.0.1',1299865241),
	(2519,'inbode_rebuild_registry_warning','127.0.0.1',1299865246),
	(2520,'inbode_rebuild_registry_warning','127.0.0.1',1299874671),
	(2521,'inbode_rebuild_registry_warning','127.0.0.1',1299874671),
	(2522,'inbode_rebuild_registry_warning','127.0.0.1',1299874677),
	(2523,'inbode_rebuild_registry_warning','127.0.0.1',1300131739),
	(2524,'inbode_rebuild_registry_warning','127.0.0.1',1300131739),
	(2525,'inbode_rebuild_registry_warning','127.0.0.1',1300131745),
	(2526,'inbode_rebuild_registry_warning','127.0.0.1',1300136318),
	(2527,'inbode_rebuild_registry_warning','127.0.0.1',1300136318),
	(2528,'inbode_rebuild_registry_warning','127.0.0.1',1300136320),
	(2529,'inbode_rebuild_registry_warning','127.0.0.1',1300138807),
	(2530,'inbode_rebuild_registry_warning','127.0.0.1',1300138807),
	(2531,'inbode_rebuild_registry_warning','127.0.0.1',1300138824),
	(2532,'inbode_rebuild_registry_warning','127.0.0.1',1300138824),
	(2533,'inbode_rebuild_registry_warning','127.0.0.1',1300324003),
	(2534,'inbode_rebuild_registry_warning','127.0.0.1',1300324003),
	(2535,'inbode_rebuild_registry_warning','127.0.0.1',1300324010),
	(2536,'inbode_rebuild_registry_warning','127.0.0.1',1300333109),
	(2537,'inbode_rebuild_registry_warning','127.0.0.1',1300333109),
	(2538,'inbode_rebuild_registry_warning','127.0.0.1',1300333110),
	(2539,'inbode_rebuild_registry_warning','127.0.0.1',1300333690),
	(2540,'inbode_rebuild_registry_warning','127.0.0.1',1300333691),
	(2541,'inbode_rebuild_registry_warning','127.0.0.1',1300334532),
	(2542,'inbode_rebuild_registry_warning','127.0.0.1',1300334533),
	(2543,'inbode_rebuild_registry_warning','127.0.0.1',1300334537),
	(2544,'inbode_rebuild_registry_warning','127.0.0.1',1300334537),
	(2545,'inbode_rebuild_registry_warning','127.0.0.1',1300334696),
	(2546,'inbode_rebuild_registry_warning','127.0.0.1',1300334696),
	(2547,'inbode_rebuild_registry_warning','127.0.0.1',1300334700),
	(2548,'inbode_rebuild_registry_warning','127.0.0.1',1300334700),
	(2549,'inbode_rebuild_registry_warning','127.0.0.1',1300334807),
	(2550,'inbode_rebuild_registry_warning','127.0.0.1',1300334807),
	(2551,'inbode_rebuild_registry_warning','127.0.0.1',1300334812),
	(2552,'inbode_rebuild_registry_warning','127.0.0.1',1300334812),
	(2553,'inbode_rebuild_registry_warning','127.0.0.1',1300336164),
	(2554,'inbode_rebuild_registry_warning','127.0.0.1',1300336164),
	(2555,'inbode_rebuild_registry_warning','127.0.0.1',1300336172),
	(2556,'inbode_rebuild_registry_warning','127.0.0.1',1300336172),
	(2557,'inbode_rebuild_registry_warning','127.0.0.1',1300336175),
	(2558,'inbode_rebuild_registry_warning','127.0.0.1',1300336176),
	(2559,'inbode_rebuild_registry_warning','127.0.0.1',1300336178),
	(2560,'inbode_rebuild_registry_warning','127.0.0.1',1300336178),
	(2561,'inbode_rebuild_registry_warning','127.0.0.1',1300336332),
	(2562,'inbode_rebuild_registry_warning','127.0.0.1',1300336332),
	(2563,'inbode_rebuild_registry_warning','127.0.0.1',1300336338),
	(2564,'inbode_rebuild_registry_warning','127.0.0.1',1300336338),
	(2565,'inbode_rebuild_registry_warning','127.0.0.1',1300336549),
	(2566,'inbode_rebuild_registry_warning','127.0.0.1',1300336549),
	(2567,'inbode_rebuild_registry_warning','127.0.0.1',1300336553),
	(2568,'inbode_rebuild_registry_warning','127.0.0.1',1300336553),
	(2569,'inbode_rebuild_registry_warning','127.0.0.1',1300336616),
	(2570,'inbode_rebuild_registry_warning','127.0.0.1',1300336616),
	(2571,'inbode_rebuild_registry_warning','127.0.0.1',1300336626),
	(2572,'inbode_rebuild_registry_warning','127.0.0.1',1300336626),
	(2573,'inbode_rebuild_registry_warning','127.0.0.1',1300336628),
	(2574,'inbode_rebuild_registry_warning','127.0.0.1',1300336628),
	(2575,'inbode_rebuild_registry_warning','127.0.0.1',1300336629),
	(2576,'inbode_rebuild_registry_warning','127.0.0.1',1300336629),
	(2577,'inbode_rebuild_registry_warning','127.0.0.1',1300546546),
	(2578,'inbode_rebuild_registry_warning','127.0.0.1',1300546546),
	(2579,'inbode_rebuild_registry_warning','127.0.0.1',1300546551),
	(2580,'inbode_rebuild_registry_warning','127.0.0.1',1300546551),
	(2581,'inbode_rebuild_registry_warning','127.0.0.1',1300546559),
	(2582,'inbode_rebuild_registry_warning','127.0.0.1',1300546559),
	(2583,'inbode_rebuild_registry_warning','127.0.0.1',1300546561),
	(2584,'inbode_rebuild_registry_warning','127.0.0.1',1300546561),
	(2585,'inbode_rebuild_registry_warning','127.0.0.1',1300546562),
	(2586,'inbode_rebuild_registry_warning','127.0.0.1',1300546562),
	(2587,'inbode_rebuild_registry_warning','127.0.0.1',1300547058),
	(2588,'inbode_rebuild_registry_warning','127.0.0.1',1300547058),
	(2589,'inbode_rebuild_registry_warning','127.0.0.1',1300547061),
	(2590,'inbode_rebuild_registry_warning','127.0.0.1',1300547062),
	(2591,'inbode_rebuild_registry_warning','127.0.0.1',1300547064),
	(2592,'inbode_rebuild_registry_warning','127.0.0.1',1300547064),
	(2593,'inbode_rebuild_registry_warning','127.0.0.1',1300547065),
	(2594,'inbode_rebuild_registry_warning','127.0.0.1',1300547065),
	(2595,'inbode_rebuild_registry_warning','127.0.0.1',1300547286),
	(2596,'inbode_rebuild_registry_warning','127.0.0.1',1300547287),
	(2597,'inbode_rebuild_registry_warning','127.0.0.1',1300547506),
	(2598,'inbode_rebuild_registry_warning','127.0.0.1',1300547506),
	(2599,'inbode_rebuild_registry_warning','127.0.0.1',1300547611),
	(2600,'inbode_rebuild_registry_warning','127.0.0.1',1300547611),
	(2601,'inbode_rebuild_registry_warning','127.0.0.1',1300547620),
	(2602,'inbode_rebuild_registry_warning','127.0.0.1',1300547621),
	(2603,'inbode_rebuild_registry_warning','127.0.0.1',1300547631),
	(2604,'inbode_rebuild_registry_warning','127.0.0.1',1300547631),
	(2605,'inbode_rebuild_registry_warning','127.0.0.1',1300547632),
	(2606,'inbode_rebuild_registry_warning','127.0.0.1',1300547632),
	(2607,'inbode_rebuild_registry_warning','127.0.0.1',1300547639),
	(2608,'inbode_rebuild_registry_warning','127.0.0.1',1300547639),
	(2609,'inbode_rebuild_registry_warning','127.0.0.1',1300547675),
	(2610,'inbode_rebuild_registry_warning','127.0.0.1',1300547675),
	(2611,'inbode_rebuild_registry_warning','127.0.0.1',1300547675),
	(2612,'inbode_rebuild_registry_warning','127.0.0.1',1300547675),
	(2613,'inbode_rebuild_registry_warning','127.0.0.1',1300547685),
	(2614,'inbode_rebuild_registry_warning','127.0.0.1',1300547685),
	(2615,'inbode_rebuild_registry_warning','127.0.0.1',1300547707),
	(2616,'inbode_rebuild_registry_warning','127.0.0.1',1300547708),
	(2617,'inbode_rebuild_registry_warning','127.0.0.1',1300547714),
	(2618,'inbode_rebuild_registry_warning','127.0.0.1',1300547714),
	(2619,'inbode_rebuild_registry_warning','127.0.0.1',1300547719),
	(2620,'inbode_rebuild_registry_warning','127.0.0.1',1300547719),
	(2621,'inbode_rebuild_registry_warning','127.0.0.1',1300547726),
	(2622,'inbode_rebuild_registry_warning','127.0.0.1',1300547726),
	(2623,'inbode_rebuild_registry_warning','127.0.0.1',1300547767),
	(2624,'inbode_rebuild_registry_warning','127.0.0.1',1300547767),
	(2625,'inbode_rebuild_registry_warning','127.0.0.1',1300548817),
	(2626,'inbode_rebuild_registry_warning','127.0.0.1',1300548817),
	(2627,'inbode_rebuild_registry_warning','127.0.0.1',1300549537),
	(2628,'inbode_rebuild_registry_warning','127.0.0.1',1300549537),
	(2629,'inbode_rebuild_registry_warning','127.0.0.1',1300549570),
	(2630,'inbode_rebuild_registry_warning','127.0.0.1',1300549570),
	(2631,'inbode_rebuild_registry_warning','127.0.0.1',1300549574),
	(2632,'inbode_rebuild_registry_warning','127.0.0.1',1300549574),
	(2633,'inbode_rebuild_registry_warning','127.0.0.1',1300549577),
	(2634,'inbode_rebuild_registry_warning','127.0.0.1',1300549577),
	(2635,'inbode_rebuild_registry_warning','127.0.0.1',1300549582),
	(2636,'inbode_rebuild_registry_warning','127.0.0.1',1300549582),
	(2637,'inbode_rebuild_registry_warning','127.0.0.1',1300549877),
	(2638,'inbode_rebuild_registry_warning','127.0.0.1',1300549877),
	(2639,'inbode_rebuild_registry_warning','127.0.0.1',1300550060),
	(2640,'inbode_rebuild_registry_warning','127.0.0.1',1300550060),
	(2641,'inbode_rebuild_registry_warning','127.0.0.1',1300550890),
	(2642,'inbode_rebuild_registry_warning','127.0.0.1',1300550890),
	(2643,'inbode_rebuild_registry_warning','127.0.0.1',1300550931),
	(2644,'inbode_rebuild_registry_warning','127.0.0.1',1300550931),
	(2645,'inbode_rebuild_registry_warning','127.0.0.1',1300551068),
	(2646,'inbode_rebuild_registry_warning','127.0.0.1',1300551068),
	(2647,'inbode_rebuild_registry_warning','127.0.0.1',1300551725),
	(2648,'inbode_rebuild_registry_warning','127.0.0.1',1300551725),
	(2649,'inbode_rebuild_registry_warning','127.0.0.1',1300566681),
	(2650,'inbode_rebuild_registry_warning','127.0.0.1',1300566682),
	(2651,'inbode_rebuild_registry_warning','127.0.0.1',1300566839),
	(2652,'inbode_rebuild_registry_warning','127.0.0.1',1300566840),
	(2653,'inbode_rebuild_registry_warning','127.0.0.1',1300585549),
	(2654,'inbode_rebuild_registry_warning','127.0.0.1',1300585550),
	(2655,'inbode_rebuild_registry_warning','127.0.0.1',1300586302),
	(2656,'inbode_rebuild_registry_warning','127.0.0.1',1300586302),
	(2657,'inbode_rebuild_registry_warning','127.0.0.1',1300586312),
	(2658,'inbode_rebuild_registry_warning','127.0.0.1',1300586312),
	(2659,'inbode_rebuild_registry_warning','127.0.0.1',1300586313),
	(2660,'inbode_rebuild_registry_warning','127.0.0.1',1300586313),
	(2661,'inbode_rebuild_registry_warning','127.0.0.1',1300587383),
	(2662,'inbode_rebuild_registry_warning','127.0.0.1',1300587383),
	(2663,'inbode_rebuild_registry_warning','127.0.0.1',1300587394),
	(2664,'inbode_rebuild_registry_warning','127.0.0.1',1300587394),
	(2665,'inbode_rebuild_registry_warning','127.0.0.1',1300587416),
	(2666,'inbode_rebuild_registry_warning','127.0.0.1',1300587416),
	(2667,'inbode_rebuild_registry_warning','127.0.0.1',1300587426),
	(2668,'inbode_rebuild_registry_warning','127.0.0.1',1300587426),
	(2669,'inbode_rebuild_registry_warning','127.0.0.1',1300587435),
	(2670,'inbode_rebuild_registry_warning','127.0.0.1',1300587435),
	(2671,'inbode_rebuild_registry_warning','127.0.0.1',1300587437),
	(2672,'inbode_rebuild_registry_warning','127.0.0.1',1300587437),
	(2673,'inbode_rebuild_registry_warning','127.0.0.1',1300587461),
	(2674,'inbode_rebuild_registry_warning','127.0.0.1',1300587461),
	(2675,'inbode_rebuild_registry_warning','127.0.0.1',1300587514),
	(2676,'inbode_rebuild_registry_warning','127.0.0.1',1300587514),
	(2677,'inbode_rebuild_registry_warning','127.0.0.1',1300587539),
	(2678,'inbode_rebuild_registry_warning','127.0.0.1',1300587539),
	(2679,'inbode_rebuild_registry_warning','127.0.0.1',1300587541),
	(2680,'inbode_rebuild_registry_warning','127.0.0.1',1300587541),
	(2681,'inbode_rebuild_registry_warning','127.0.0.1',1300624085),
	(2682,'inbode_rebuild_registry_warning','127.0.0.1',1300624086),
	(2683,'inbode_rebuild_registry_warning','127.0.0.1',1300624119),
	(2684,'inbode_rebuild_registry_warning','127.0.0.1',1300624119),
	(2685,'inbode_rebuild_registry_warning','127.0.0.1',1300624227),
	(2686,'inbode_rebuild_registry_warning','127.0.0.1',1300624227),
	(2687,'inbode_rebuild_registry_warning','127.0.0.1',1300624229),
	(2688,'inbode_rebuild_registry_warning','127.0.0.1',1300624229),
	(2689,'inbode_rebuild_registry_warning','127.0.0.1',1300625248),
	(2690,'inbode_rebuild_registry_warning','127.0.0.1',1300625248),
	(2691,'inbode_rebuild_registry_warning','127.0.0.1',1300625260),
	(2692,'inbode_rebuild_registry_warning','127.0.0.1',1300625260),
	(2693,'inbode_rebuild_registry_warning','127.0.0.1',1300625304),
	(2694,'inbode_rebuild_registry_warning','127.0.0.1',1300625304),
	(2695,'inbode_rebuild_registry_warning','127.0.0.1',1300625344),
	(2696,'inbode_rebuild_registry_warning','127.0.0.1',1300625344),
	(2697,'inbode_rebuild_registry_warning','127.0.0.1',1300625344),
	(2698,'inbode_rebuild_registry_warning','127.0.0.1',1300625344),
	(2699,'inbode_rebuild_registry_warning','127.0.0.1',1300625348),
	(2700,'inbode_rebuild_registry_warning','127.0.0.1',1300625348),
	(2701,'inbode_rebuild_registry_warning','127.0.0.1',1300625349),
	(2702,'inbode_rebuild_registry_warning','127.0.0.1',1300625349),
	(2703,'inbode_rebuild_registry_warning','127.0.0.1',1300625745),
	(2704,'inbode_rebuild_registry_warning','127.0.0.1',1300625745),
	(2705,'inbode_rebuild_registry_warning','127.0.0.1',1300626153),
	(2706,'inbode_rebuild_registry_warning','127.0.0.1',1300626153),
	(2707,'inbode_rebuild_registry_warning','127.0.0.1',1300626162),
	(2708,'inbode_rebuild_registry_warning','127.0.0.1',1300626162),
	(2709,'inbode_rebuild_registry_warning','127.0.0.1',1300626592),
	(2710,'inbode_rebuild_registry_warning','127.0.0.1',1300626592),
	(2711,'inbode_rebuild_registry_warning','127.0.0.1',1300626627),
	(2712,'inbode_rebuild_registry_warning','127.0.0.1',1300626627),
	(2713,'inbode_rebuild_registry_warning','127.0.0.1',1300626635),
	(2714,'inbode_rebuild_registry_warning','127.0.0.1',1300626635),
	(2715,'inbode_rebuild_registry_warning','127.0.0.1',1300626722),
	(2716,'inbode_rebuild_registry_warning','127.0.0.1',1300626722),
	(2717,'inbode_rebuild_registry_warning','127.0.0.1',1300626735),
	(2718,'inbode_rebuild_registry_warning','127.0.0.1',1300626735),
	(2719,'inbode_rebuild_registry_warning','127.0.0.1',1300626738),
	(2720,'inbode_rebuild_registry_warning','127.0.0.1',1300626738),
	(2721,'inbode_rebuild_registry_warning','127.0.0.1',1300626744),
	(2722,'inbode_rebuild_registry_warning','127.0.0.1',1300626744),
	(2723,'inbode_rebuild_registry_warning','127.0.0.1',1300638175),
	(2724,'inbode_rebuild_registry_warning','127.0.0.1',1300638175),
	(2725,'inbode_rebuild_registry_warning','127.0.0.1',1300638511),
	(2726,'inbode_rebuild_registry_warning','127.0.0.1',1300638511),
	(2727,'inbode_rebuild_registry_warning','127.0.0.1',1300639478),
	(2728,'inbode_rebuild_registry_warning','127.0.0.1',1300639478),
	(2729,'inbode_rebuild_registry_warning','127.0.0.1',1300639485),
	(2730,'inbode_rebuild_registry_warning','127.0.0.1',1300639485),
	(2731,'inbode_rebuild_registry_warning','127.0.0.1',1300639488),
	(2732,'inbode_rebuild_registry_warning','127.0.0.1',1300639488),
	(2733,'inbode_rebuild_registry_warning','127.0.0.1',1300639489),
	(2734,'inbode_rebuild_registry_warning','127.0.0.1',1300639489),
	(2735,'inbode_rebuild_registry_warning','127.0.0.1',1300639574),
	(2736,'inbode_rebuild_registry_warning','127.0.0.1',1300639574),
	(2737,'inbode_rebuild_registry_warning','127.0.0.1',1300655421),
	(2738,'inbode_rebuild_registry_warning','127.0.0.1',1300655422),
	(2739,'inbode_rebuild_registry_warning','127.0.0.1',1300655435),
	(2740,'inbode_rebuild_registry_warning','127.0.0.1',1300758702),
	(2741,'inbode_rebuild_registry_warning','127.0.0.1',1300758702),
	(2742,'inbode_rebuild_registry_warning','127.0.0.1',1300758715),
	(2743,'inbode_rebuild_registry_warning','127.0.0.1',1300758715),
	(2744,'inbode_rebuild_registry_warning','127.0.0.1',1300758756),
	(2745,'inbode_rebuild_registry_warning','127.0.0.1',1300758757),
	(2746,'inbode_rebuild_registry_warning','127.0.0.1',1300758759),
	(2747,'inbode_rebuild_registry_warning','127.0.0.1',1300758759),
	(2748,'inbode_rebuild_registry_warning','127.0.0.1',1300758781),
	(2749,'inbode_rebuild_registry_warning','127.0.0.1',1300758781),
	(2750,'inbode_rebuild_registry_warning','127.0.0.1',1300758782),
	(2751,'inbode_rebuild_registry_warning','127.0.0.1',1300758782),
	(2752,'inbode_rebuild_registry_warning','127.0.0.1',1300758809),
	(2753,'inbode_rebuild_registry_warning','127.0.0.1',1300758809),
	(2754,'inbode_rebuild_registry_warning','127.0.0.1',1300758809),
	(2755,'inbode_rebuild_registry_warning','127.0.0.1',1300758809),
	(2756,'inbode_rebuild_registry_warning','127.0.0.1',1300758864),
	(2757,'inbode_rebuild_registry_warning','127.0.0.1',1300758864),
	(2758,'inbode_rebuild_registry_warning','127.0.0.1',1300758865),
	(2759,'inbode_rebuild_registry_warning','127.0.0.1',1300758865),
	(2760,'inbode_rebuild_registry_warning','127.0.0.1',1300758872),
	(2761,'inbode_rebuild_registry_warning','127.0.0.1',1300758872),
	(2762,'inbode_rebuild_registry_warning','127.0.0.1',1300758872),
	(2763,'inbode_rebuild_registry_warning','127.0.0.1',1300758872),
	(2764,'inbode_rebuild_registry_warning','127.0.0.1',1300760933),
	(2765,'inbode_rebuild_registry_warning','127.0.0.1',1300760933),
	(2766,'inbode_rebuild_registry_warning','127.0.0.1',1300760944),
	(2767,'inbode_rebuild_registry_warning','127.0.0.1',1300760944),
	(2768,'inbode_rebuild_registry_warning','127.0.0.1',1300760945),
	(2769,'inbode_rebuild_registry_warning','127.0.0.1',1300760945),
	(2770,'inbode_rebuild_registry_warning','127.0.0.1',1300760987),
	(2771,'inbode_rebuild_registry_warning','127.0.0.1',1300760988),
	(2772,'inbode_rebuild_registry_warning','127.0.0.1',1300761334),
	(2773,'inbode_rebuild_registry_warning','127.0.0.1',1300761334),
	(2774,'inbode_rebuild_registry_warning','127.0.0.1',1300799565),
	(2775,'inbode_rebuild_registry_warning','127.0.0.1',1300799565),
	(2776,'inbode_rebuild_registry_warning','127.0.0.1',1300799573),
	(2777,'inbode_rebuild_registry_warning','127.0.0.1',1300799573),
	(2778,'inbode_rebuild_registry_warning','127.0.0.1',1300799574),
	(2779,'inbode_rebuild_registry_warning','127.0.0.1',1300799574);

/*!40000 ALTER TABLE `flood` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`uid`,`nid`,`timestamp`)
VALUES
	(1,2,1296788967),
	(1,85,1296448841),
	(1,79,1296448113),
	(1,65,1296492725),
	(1,124,1296487768),
	(1,127,1296489267),
	(1,130,1296490557),
	(1,128,1296490572),
	(1,125,1296492924),
	(1,143,1296851859),
	(1,133,1296844586),
	(1,144,1300657600),
	(9,144,1296855538),
	(1,149,1300334225),
	(1,151,1300334248),
	(5,152,1299708438),
	(5,153,1300333850),
	(5,154,1300333750),
	(5,149,1299879743),
	(1,145,1300334323),
	(5,155,1300333736),
	(5,156,1300336114),
	(1,150,1300334314),
	(1,157,1300334370),
	(5,158,1300334679),
	(5,159,1300336149),
	(5,160,1300336566),
	(5,161,1300336764),
	(5,165,1300624279),
	(5,191,1300642949),
	(1,191,1300763425);

/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table inbode_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inbode_auth`;

CREATE TABLE `inbode_auth` (
  `token` varchar(2048) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `inbode_auth` WRITE;
/*!40000 ALTER TABLE `inbode_auth` DISABLE KEYS */;
INSERT INTO `inbode_auth` (`token`,`id`)
VALUES
	('DQAAAKABAAAPy4pqK9kOfdbzvC13B9MP5CuqQD7WG-mzmnG9K2B2lSpJzfbnR17LsOQ-3BwhH16OxFOoQpaJWf8ryEaSnlrp8PH-YQUyNCXt8w7NR1peoX6ceQ4Pu2LQ62w2WhDSWQ4Zz4GNAGbs1cXkVyOgQdj-iYkaB7scIJ89czr0vn_X6xgat9yi7tMKLY49wyjU24IH59uXFaMhfa8GVv5jzQrtlwQkTi7W_j5ff68PYUkOVvbR1au_IdtMLu3nt2mDLaVhhFemODq5SqqzvqNUU8ZWMbxnLOqh8pC0pNwvlQaLQ2mah-Lnym2jDu1vPwyAXFDponomN3StULCepinuZPNSMaWBrEqSBHdLwV9aNiEzskrKdZWTiZIn6gJpDI78emLvGj1SDDb5XNQQlTbRy2PSB95CWBEPfhxShnOsR0j-3bOy6QhkK_3YA5R0fnC284TU-du6qlzsDfSNZq9bilwovk2qoBpT4K4BWUcdDq1KxrnfMyho5ShRAiWqbCk7PqZG4FGvqYSZfUDbFm7rifSHYXNcBoX6ZdjVNMBZ3lTn0g',1);

/*!40000 ALTER TABLE `inbode_auth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table inbode_cache_geocode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inbode_cache_geocode`;

CREATE TABLE `inbode_cache_geocode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searched_location` varchar(256) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

LOCK TABLES `inbode_cache_geocode` WRITE;
/*!40000 ALTER TABLE `inbode_cache_geocode` DISABLE KEYS */;
INSERT INTO `inbode_cache_geocode` (`id`,`searched_location`,`lat`,`lng`,`hash`)
VALUES
	(1,'55423',44.8782,-93.2814,'dbabd990018375b75b0dc3120d8165a1'),
	(6,'Minneapolis',44.98,-93.2638,'c39584729495496984371f0ec2f38974'),
	(5,'minneapolis',44.98,-93.2638,'15f13e8329e31ebb05e0073a20f51d9b'),
	(7,'Minneapolis,MN',44.98,-93.2638,'4fc425fcc46ad1c034f560fb9948becc'),
	(8,'Richfield,MN',44.8833,-93.283,'6f7941dd1691308cdaf447a4e500ea60'),
	(9,'richfield',44.8833,-93.283,'cb0b8db6261139b7504dd1f66f33452e'),
	(10,'Richfield',44.8833,-93.283,'c26dc640b650d62060dac4fe99f2e82f'),
	(11,'Minneapolis, MN, USA',44.98,-93.2638,'65e9d72a020703cc9605b8c638b1c2e4'),
	(12,'edina',44.8897,-93.35,'32d68a79027f3090da2bc72d89124187'),
	(13,'Richfield, MN, USA',44.8833,-93.283,'410b5537d1e44bfceb3cefb2d8adf827'),
	(14,'Phillips, Minneapolis, MN, USA',44.9514,-93.2559,'aac791e6d7dcc007a18973c34d6f50e1');

/*!40000 ALTER TABLE `inbode_cache_geocode` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `additional` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(16) NOT NULL DEFAULT '',
  `postal_code` varchar(16) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT '',
  `latitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `longitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `source` tinyint(4) NOT NULL DEFAULT '0',
  `is_primary` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`lid`,`name`,`street`,`additional`,`city`,`province`,`postal_code`,`country`,`latitude`,`longitude`,`source`,`is_primary`)
VALUES
	(1,'','111 3rd Ave S','','Minneapolis','MN','55401','us',44.981859,-93.262507,3,0);

/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location_instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_instance`;

CREATE TABLE `location_instance` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `genid` varchar(255) NOT NULL DEFAULT '',
  `lid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `nid` (`nid`),
  KEY `vid` (`vid`),
  KEY `uid` (`uid`),
  KEY `genid` (`genid`),
  KEY `lid` (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table menu_custom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_custom`;

CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `menu_custom` WRITE;
/*!40000 ALTER TABLE `menu_custom` DISABLE KEYS */;
INSERT INTO `menu_custom` (`menu_name`,`title`,`description`)
VALUES
	('navigation','Navigation','The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
	('primary-links','Primary links','Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
	('secondary-links','Secondary links','Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');

/*!40000 ALTER TABLE `menu_custom` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_links`;

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
) ENGINE=MyISAM AUTO_INCREMENT=2498 DEFAULT CHARSET=utf8;

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` (`menu_name`,`mlid`,`plid`,`link_path`,`router_path`,`link_title`,`options`,`module`,`hidden`,`external`,`has_children`,`expanded`,`weight`,`depth`,`customized`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`,`updated`)
VALUES
	('navigation',1,0,'batch','batch','','a:0:{}','system',-1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0),
	('navigation',2,0,'admin','admin','Administer','a:0:{}','system',0,0,1,0,9,1,0,2,0,0,0,0,0,0,0,0,0),
	('navigation',3,0,'node','node','Content','a:0:{}','system',-1,0,0,0,0,1,0,3,0,0,0,0,0,0,0,0,0),
	('navigation',4,0,'logout','logout','Log out','a:0:{}','system',0,0,0,0,10,1,0,4,0,0,0,0,0,0,0,0,0),
	('navigation',5,0,'rss.xml','rss.xml','RSS feed','a:0:{}','system',-1,0,0,0,0,1,0,5,0,0,0,0,0,0,0,0,0),
	('navigation',6,0,'user','user','User account','a:0:{}','system',-1,0,0,0,0,1,0,6,0,0,0,0,0,0,0,0,0),
	('navigation',7,0,'node/%','node/%','','a:0:{}','system',-1,0,0,0,0,1,0,7,0,0,0,0,0,0,0,0,0),
	('navigation',8,2,'admin/compact','admin/compact','Compact mode','a:0:{}','system',-1,0,0,0,0,2,0,2,8,0,0,0,0,0,0,0,0),
	('navigation',9,0,'filter/tips','filter/tips','Compose tips','a:0:{}','system',1,0,0,0,0,1,0,9,0,0,0,0,0,0,0,0,0),
	('navigation',10,2,'admin/content','admin/content','Content management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:27:\"Manage your site\'s content.\";}}','system',0,0,1,0,-10,2,0,2,10,0,0,0,0,0,0,0,0),
	('navigation',11,0,'node/add','node/add','Create content','a:0:{}','system',0,0,1,0,1,1,0,11,0,0,0,0,0,0,0,0,0),
	('navigation',14,0,'system/files','system/files','File download','a:0:{}','system',-1,0,0,0,0,1,0,14,0,0,0,0,0,0,0,0,0),
	('navigation',16,2,'admin/reports','admin/reports','Reports','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"View reports from system logs and other status information.\";}}','system',0,0,1,0,5,2,0,2,16,0,0,0,0,0,0,0,0),
	('navigation',17,2,'admin/build','admin/build','Site building','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:38:\"Control how your site looks and feels.\";}}','system',0,0,1,0,-10,2,0,2,17,0,0,0,0,0,0,0,0),
	('navigation',18,2,'admin/settings','admin/settings','Site configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Adjust basic site configuration options.\";}}','system',0,0,1,0,-5,2,0,2,18,0,0,0,0,0,0,0,0),
	('navigation',19,0,'user/autocomplete','user/autocomplete','User autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,19,0,0,0,0,0,0,0,0,0),
	('navigation',20,2,'admin/user','admin/user','User management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"Manage your site\'s users, groups and access to site features.\";}}','system',0,0,1,0,0,2,0,2,20,0,0,0,0,0,0,0,0),
	('navigation',21,0,'user/%','user/%','My account','a:0:{}','system',0,0,1,0,0,1,0,21,0,0,0,0,0,0,0,0,0),
	('navigation',22,20,'admin/user/rules','admin/user/rules','Access rules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:80:\"List and create rules to disallow usernames, e-mail addresses, and IP addresses.\";}}','system',0,0,0,0,0,3,0,2,20,22,0,0,0,0,0,0,0),
	('navigation',23,18,'admin/settings/actions','admin/settings/actions','Actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',0,0,0,0,0,3,0,2,18,23,0,0,0,0,0,0,0),
	('navigation',24,18,'admin/settings/admin','admin/settings/admin','Administration theme','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:55:\"Settings for how your administrative pages should look.\";}}','system',0,0,0,0,0,3,0,2,18,24,0,0,0,0,0,0,0),
	('navigation',25,17,'admin/build/block','admin/build/block','Blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Configure what block content appears in your site\'s sidebars and other regions.\";}}','system',0,0,0,0,0,3,0,2,17,25,0,0,0,0,0,0,0),
	('navigation',26,18,'admin/settings/clean-urls','admin/settings/clean-urls','Clean URLs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Enable or disable clean URLs for your site.\";}}','system',0,0,0,0,0,3,0,2,18,26,0,0,0,0,0,0,0),
	('navigation',28,10,'admin/content/node','admin/content/node','Content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View, edit, and delete your site\'s content.\";}}','system',0,0,0,0,0,3,0,2,10,28,0,0,0,0,0,0,0),
	('navigation',29,10,'admin/content/types','admin/content/types','Content types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Manage posts by content type, including default status, front page promotion, etc.\";}}','system',0,0,0,0,0,3,0,2,10,29,0,0,0,0,0,0,0),
	('navigation',30,18,'admin/settings/date-time','admin/settings/date-time','Date and time','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:89:\"Settings for how Drupal displays date and time, as well as the system\'s default timezone.\";}}','system',0,0,0,0,0,3,0,2,18,30,0,0,0,0,0,0,0),
	('navigation',31,0,'node/%/delete','node/%/delete','Delete','a:0:{}','system',-1,0,0,0,1,1,0,31,0,0,0,0,0,0,0,0,0),
	('navigation',32,21,'user/%/delete','user/%/delete','Delete','a:0:{}','system',-1,0,0,0,0,2,0,21,32,0,0,0,0,0,0,0,0),
	('navigation',33,18,'admin/settings/error-reporting','admin/settings/error-reporting','Error reporting','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:93:\"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.\";}}','system',0,0,0,0,0,3,0,2,18,33,0,0,0,0,0,0,0),
	('navigation',34,18,'admin/settings/file-system','admin/settings/file-system','File system','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:68:\"Tell Drupal where to store uploaded files and how they are accessed.\";}}','system',0,0,0,0,0,3,0,2,18,34,0,0,0,0,0,0,0),
	('navigation',35,18,'admin/settings/image-toolkit','admin/settings/image-toolkit','Image toolkit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Choose which image toolkit to use if you have installed optional toolkits.\";}}','system',0,0,0,0,0,3,0,2,18,35,0,0,0,0,0,0,0),
	('navigation',36,18,'admin/settings/filters','admin/settings/filters','Input formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:127:\"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.\";}}','system',0,0,0,0,0,3,0,2,18,36,0,0,0,0,0,0,0),
	('navigation',37,18,'admin/settings/logging','admin/settings/logging','Logging and alerts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:156:\"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.\";}}','system',0,0,1,0,0,3,0,2,18,37,0,0,0,0,0,0,0),
	('navigation',39,17,'admin/build/modules','admin/build/modules','Modules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Enable or disable add-on modules for your site.\";}}','system',0,0,0,0,0,3,0,2,17,39,0,0,0,0,0,0,0),
	('navigation',40,18,'admin/settings/performance','admin/settings/performance','Performance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.\";}}','system',0,0,0,0,0,3,0,2,18,40,0,0,0,0,0,0,0),
	('navigation',41,20,'admin/user/permissions','admin/user/permissions','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',0,0,0,0,0,3,0,2,20,41,0,0,0,0,0,0,0),
	('navigation',42,10,'admin/content/node-settings','admin/content/node-settings','Post settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:126:\"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.\";}}','system',0,0,0,0,0,3,0,2,10,42,0,0,0,0,0,0,0),
	('navigation',43,10,'admin/content/rss-publishing','admin/content/rss-publishing','RSS publishing','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:92:\"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.\";}}','system',0,0,0,0,0,3,0,2,10,43,0,0,0,0,0,0,0),
	('navigation',45,20,'admin/user/roles','admin/user/roles','Roles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"List, edit, or add user roles.\";}}','system',0,0,0,0,0,3,0,2,20,45,0,0,0,0,0,0,0),
	('navigation',46,18,'admin/settings/site-information','admin/settings/site-information','Site information','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:107:\"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.\";}}','system',0,0,0,0,0,3,0,2,18,46,0,0,0,0,0,0,0),
	('navigation',47,18,'admin/settings/site-maintenance','admin/settings/site-maintenance','Site maintenance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"Take the site off-line for maintenance or bring it back online.\";}}','system',0,0,0,0,0,3,0,2,18,47,0,0,0,0,0,0,0),
	('navigation',48,16,'admin/reports/status','admin/reports/status','Status report','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Get a status report about your site\'s operation and any detected problems.\";}}','system',0,0,0,0,10,3,0,2,16,48,0,0,0,0,0,0,0),
	('navigation',49,17,'admin/build/themes','admin/build/themes','Themes','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:57:\"Change which theme your site uses or allows users to set.\";}}','system',0,0,0,0,0,3,0,2,17,49,0,0,0,0,0,0,0),
	('navigation',50,20,'admin/user/settings','admin/user/settings','User settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Configure default behavior of users, including registration requirements, e-mails, and user pictures.\";}}','system',0,0,0,0,0,3,0,2,20,50,0,0,0,0,0,0,0),
	('navigation',51,20,'admin/user/user','admin/user/user','Users','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"List, add, and edit users.\";}}','system',0,0,0,0,0,3,0,2,20,51,0,0,0,0,0,0,0),
	('navigation',61,36,'admin/settings/filters/%','admin/settings/filters/%','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,61,0,0,0,0,0,0),
	('navigation',62,26,'admin/settings/clean-urls/check','admin/settings/clean-urls/check','Clean URL check','a:0:{}','system',-1,0,0,0,0,4,0,2,18,26,62,0,0,0,0,0,0),
	('navigation',63,23,'admin/settings/actions/configure','admin/settings/actions/configure','Configure an advanced action','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,63,0,0,0,0,0,0),
	('navigation',64,25,'admin/build/block/configure','admin/build/block/configure','Configure block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,64,0,0,0,0,0,0),
	('navigation',66,30,'admin/settings/date-time/lookup','admin/settings/date-time/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,2,18,30,66,0,0,0,0,0,0),
	('navigation',67,25,'admin/build/block/delete','admin/build/block/delete','Delete block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,67,0,0,0,0,0,0),
	('navigation',68,36,'admin/settings/filters/delete','admin/settings/filters/delete','Delete input format','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,68,0,0,0,0,0,0),
	('navigation',69,22,'admin/user/rules/delete','admin/user/rules/delete','Delete rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,69,0,0,0,0,0,0),
	('navigation',70,45,'admin/user/roles/edit','admin/user/roles/edit','Edit role','a:0:{}','system',-1,0,0,0,0,4,0,2,20,45,70,0,0,0,0,0,0),
	('navigation',71,22,'admin/user/rules/edit','admin/user/rules/edit','Edit rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,71,0,0,0,0,0,0),
	('navigation',72,48,'admin/reports/status/php','admin/reports/status/php','PHP','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,72,0,0,0,0,0,0),
	('navigation',73,42,'admin/content/node-settings/rebuild','admin/content/node-settings/rebuild','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,4,0,2,10,42,73,0,0,0,0,0,0),
	('navigation',74,23,'admin/settings/actions/orphan','admin/settings/actions/orphan','Remove orphans','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,74,0,0,0,0,0,0),
	('navigation',75,48,'admin/reports/status/run-cron','admin/reports/status/run-cron','Run cron','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,75,0,0,0,0,0,0),
	('navigation',76,48,'admin/reports/status/sql','admin/reports/status/sql','SQL','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,76,0,0,0,0,0,0),
	('navigation',77,23,'admin/settings/actions/delete/%','admin/settings/actions/delete/%','Delete action','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:17:\"Delete an action.\";}}','system',-1,0,0,0,0,4,0,2,18,23,77,0,0,0,0,0,0),
	('navigation',79,25,'admin/build/block/list/js','admin/build/block/list/js','JavaScript List Form','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,79,0,0,0,0,0,0),
	('navigation',80,39,'admin/build/modules/list/confirm','admin/build/modules/list/confirm','List','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,80,0,0,0,0,0,0),
	('navigation',81,0,'user/reset/%/%/%','user/reset/%/%/%','Reset password','a:0:{}','system',-1,0,0,0,0,1,0,81,0,0,0,0,0,0,0,0,0),
	('navigation',82,39,'admin/build/modules/uninstall/confirm','admin/build/modules/uninstall/confirm','Uninstall','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,82,0,0,0,0,0,0),
	('navigation',83,0,'node/%/revisions/%/delete','node/%/revisions/%/delete','Delete earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,83,0,0,0,0,0,0,0,0,0),
	('navigation',84,0,'node/%/revisions/%/revert','node/%/revisions/%/revert','Revert to earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,84,0,0,0,0,0,0,0,0,0),
	('navigation',85,0,'node/%/revisions/%/view','node/%/revisions/%/view','Revisions','a:0:{}','system',-1,0,0,0,0,1,0,85,0,0,0,0,0,0,0,0,0),
	('navigation',106,11,'node/add/page','node/add/page','Page','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";}}','system',0,0,0,0,0,2,0,11,106,0,0,0,0,0,0,0,0),
	('navigation',1346,10,'admin/content/node-type/unit','admin/content/node-type/unit','Unit','a:0:{}','system',-1,0,0,0,0,3,0,2,10,1346,0,0,0,0,0,0,0),
	('navigation',1347,0,'admin/content/node-type/unit/delete','admin/content/node-type/unit/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,1347,0,0,0,0,0,0,0,0,0),
	('navigation',110,10,'admin/content/node-type/page','admin/content/node-type/page','Page','a:0:{}','system',-1,0,0,0,0,3,0,2,10,110,0,0,0,0,0,0,0),
	('navigation',112,0,'admin/content/node-type/page/delete','admin/content/node-type/page/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,112,0,0,0,0,0,0,0,0,0),
	('admin_menu',2412,2404,'admin/content/node-type/unit/fields/field_unit_description','admin/content/node-type/unit/fields/field_unit_description','Description','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2412,0,0,0,0,0),
	('admin_menu',2321,2319,'admin/content/node-type/building/relationships/erd','admin/content/node-type/building/relationships/erd','Entity relations diagram','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2319,2321,0,0,0,0,0),
	('admin_menu',2322,2319,'admin/content/node-type/building/relationships/noderef','admin/content/node-type/building/relationships/noderef','Node reference extras','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2047,2319,2322,0,0,0,0,0),
	('admin_menu',2394,2393,'admin/content/node-type/page/display/basic','admin/content/node-type/page/display/basic','Basic','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2062,2393,2394,0,0,0,0,0),
	('admin_menu',2395,2393,'admin/content/node-type/page/display/rss','admin/content/node-type/page/display/rss','RSS','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2062,2393,2395,0,0,0,0,0),
	('admin_menu',2396,2393,'admin/content/node-type/page/display/search','admin/content/node-type/page/display/search','Search','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2062,2393,2396,0,0,0,0,0),
	('admin_menu',2397,2393,'admin/content/node-type/page/display/token','admin/content/node-type/page/display/token','Token','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2062,2393,2397,0,0,0,0,0),
	('admin_menu',2398,2062,'admin/content/node-type/page/fields','admin/content/node-type/page/fields','Manage fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,4,0,1880,1894,2062,2398,0,0,0,0,0,0),
	('admin_menu',2319,2047,'admin/content/node-type/building/relationships','admin/content/node-type/building/relationships','Relationships','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,10,4,0,1880,1894,2047,2319,0,0,0,0,0,0),
	('admin_menu',2320,2319,'admin/content/node-type/building/relationships/backref','admin/content/node-type/building/relationships/backref','Back reference settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,2,5,0,1880,1894,2047,2319,2320,0,0,0,0,0),
	('admin_menu',2290,2272,'admin/settings/imce/subdirectory','admin/settings/imce/subdirectory','Directory creation tool','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,3,0,1884,2272,2290,0,0,0,0,0,0,0),
	('admin_menu',2291,1894,'admin/content/types/export','admin/content/types/export','Export','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,3,3,0,1880,1894,2291,0,0,0,0,0,0,0),
	('admin_menu',2292,1894,'admin/content/types/fields','admin/content/types/fields','Fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,1894,2292,0,0,0,0,0,0,0),
	('admin_menu',2293,1897,'admin/settings/date-time/formats','admin/settings/date-time/formats','Formats','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,1,3,0,1884,1897,2293,0,0,0,0,0,0,0),
	('admin_menu',2294,2274,'admin/settings/location/geocoding','admin/settings/location/geocoding','Geocoding options','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,2,3,0,1884,2274,2294,0,0,0,0,0,0,0),
	('admin_menu',2289,1930,'admin/build/path/delete_bulk','admin/build/path/delete_bulk','Delete aliases','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,30,3,0,1883,1930,2289,0,0,0,0,0,0,0),
	('navigation',2380,0,'admin/content/node-type/unit/fields/field_unit_price/remove','admin/content/node-type/unit/fields/field_unit_price/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2380,0,0,0,0,0,0,0,0,0),
	('navigation',2378,0,'admin/content/node-type/unit/fields/field_unit_description/remove','admin/content/node-type/unit/fields/field_unit_description/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2378,0,0,0,0,0,0,0,0,0),
	('navigation',2214,17,'admin/build/path-redirect','admin/build/path-redirect','URL redirects','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:39:\"Redirect users from one URL to another.\";}}','system',0,0,0,0,0,3,0,2,17,2214,0,0,0,0,0,0,0),
	('navigation',2215,18,'admin/settings/wysiwyg','admin/settings/wysiwyg','Wysiwyg profiles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"Configure client-side editors.\";}}','system',0,0,0,0,0,3,0,2,18,2215,0,0,0,0,0,0,0),
	('navigation',2213,0,'noderelationships/ahah/search','noderelationships/ahah/search','Search and reference','a:0:{}','system',-1,0,0,0,0,1,0,2213,0,0,0,0,0,0,0,0,0),
	('navigation',2208,20,'admin/user/nodeaccess','admin/user/nodeaccess','Nodeaccess','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:50:\"Change default settings for the Nodeaccess module.\";}}','system',0,0,0,0,0,3,0,2,20,2208,0,0,0,0,0,0,0),
	('navigation',2209,18,'admin/settings/format_number','admin/settings/format_number','Number format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Configure site wide number format settings.\";}}','system',0,0,0,0,0,3,0,2,18,2209,0,0,0,0,0,0,0),
	('navigation',2210,0,'toboggan/revalidate/%','toboggan/revalidate/%','Re-send validation e-mail','a:0:{}','system',-1,0,0,0,0,1,0,2210,0,0,0,0,0,0,0,0,0),
	('navigation',2211,18,'admin/settings/robotstxt','admin/settings/robotstxt','RobotsTxt','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:28:\"Manage your robots.txt file.\";}}','system',0,0,0,0,0,3,0,2,18,2211,0,0,0,0,0,0,0),
	('navigation',2212,18,'admin/settings/search404','admin/settings/search404','Search 404 settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Administer search 404.\";}}','system',0,0,0,0,0,3,0,2,18,2212,0,0,0,0,0,0,0),
	('admin_menu',2073,1894,'admin/content/node-type/unit','admin/content/node-type/unit','Edit !content-type','a:2:{s:1:\"t\";a:1:{s:13:\"!content-type\";s:4:\"Unit\";}s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,3,0,1880,1894,2073,0,0,0,0,0,0,0),
	('admin_menu',2411,2404,'admin/content/node-type/unit/fields/field_unit_building','admin/content/node-type/unit/fields/field_unit_building','Building','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2411,0,0,0,0,0),
	('admin_menu',2410,2404,'admin/content/node-type/unit/fields/field_unit_bedroom','admin/content/node-type/unit/fields/field_unit_bedroom','Beds','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2410,0,0,0,0,0),
	('admin_menu',2406,2404,'admin/content/node-type/unit/fields/field_unit_amenities','admin/content/node-type/unit/fields/field_unit_amenities','Amenities','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2406,0,0,0,0,0),
	('admin_menu',2407,2404,'admin/content/node-type/unit/fields/field_unit_area','admin/content/node-type/unit/fields/field_unit_area','Area','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2407,0,0,0,0,0),
	('navigation',2204,18,'admin/settings/imageapi','admin/settings/imageapi','ImageAPI','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:19:\"Configure ImageAPI.\";}}','system',0,0,0,0,0,3,0,2,18,2204,0,0,0,0,0,0,0),
	('navigation',2205,18,'admin/settings/location','admin/settings/location','Location','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:28:\"Settings for Location module\";}}','system',0,0,0,0,0,3,0,2,18,2205,0,0,0,0,0,0,0),
	('navigation',2206,20,'admin/user/login_destination','admin/user/login_destination','Login Destination','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:55:\"Control where users are redirected to, once they login.\";}}','system',0,0,0,0,0,3,0,2,20,2206,0,0,0,0,0,0,0),
	('navigation',2207,20,'admin/user/logintoboggan','admin/user/logintoboggan','LoginToboggan','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:102:\"Set up custom login options like instant login, login redirects, pre-authorized validation roles, etc.\";}}','system',0,0,0,0,0,3,0,2,20,2207,0,0,0,0,0,0,0),
	('admin_menu',2062,1894,'admin/content/node-type/page','admin/content/node-type/page','Edit !content-type','a:2:{s:1:\"t\";a:1:{s:13:\"!content-type\";s:4:\"Page\";}s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,3,0,1880,1894,2062,0,0,0,0,0,0,0),
	('admin_menu',2408,2404,'admin/content/node-type/unit/fields/field_unit_available','admin/content/node-type/unit/fields/field_unit_available','Available','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2408,0,0,0,0,0),
	('admin_menu',2409,2404,'admin/content/node-type/unit/fields/field_unit_bathroom','admin/content/node-type/unit/fields/field_unit_bathroom','Baths','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2409,0,0,0,0,0),
	('admin_menu',2390,2388,'admin/content/node-type/building/fields/field_building_amenities','admin/content/node-type/building/fields/field_building_amenities','Amenities','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2388,2390,0,0,0,0,0),
	('admin_menu',2391,2388,'admin/content/node-type/building/fields/field_building_description','admin/content/node-type/building/fields/field_building_description','Description','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2388,2391,0,0,0,0,0),
	('admin_menu',2307,2293,'admin/settings/date-time/formats/custom','admin/settings/date-time/formats/custom','Custom formats','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,2,4,0,1884,1897,2293,2307,0,0,0,0,0,0),
	('navigation',2227,1194,'admin/help/nodeaccess','admin/help/nodeaccess','nodeaccess','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2227,0,0,0,0,0,0,0),
	('navigation',2228,1194,'admin/help/path_redirect','admin/help/path_redirect','path_redirect','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2228,0,0,0,0,0,0,0),
	('navigation',2229,1194,'admin/help/pathauto','admin/help/pathauto','pathauto','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2229,0,0,0,0,0,0,0),
	('navigation',2200,18,'admin/settings/currency_api','admin/settings/currency_api','Currency API','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"Settings for currency API.\";}}','system',0,0,0,0,0,3,0,2,18,2200,0,0,0,0,0,0,0),
	('navigation',2201,18,'admin/settings/date_popup','admin/settings/date_popup','Date Popup Configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:53:\"Allows the user to configure the Date Popup settings.\";}}','system',0,0,0,0,0,3,0,2,18,2201,0,0,0,0,0,0,0),
	('navigation',2202,18,'admin/settings/globalredirect','admin/settings/globalredirect','Global Redirect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"Chose which features you would like enabled for Global Redirect\";}}','system',0,0,0,0,0,3,0,2,18,2202,0,0,0,0,0,0,0),
	('navigation',2203,18,'admin/settings/imce','admin/settings/imce','IMCE','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:42:\"Control how your image/file browser works.\";}}','system',0,0,0,0,0,3,0,2,18,2203,0,0,0,0,0,0,0),
	('navigation',2196,0,'wysiwyg/%','wysiwyg/%','','a:0:{}','system',-1,0,0,0,0,1,0,2196,0,0,0,0,0,0,0,0,0),
	('navigation',2197,0,'noderelationships/noderelationships-backref','noderelationships/noderelationships-backref','','a:0:{}','system',-1,0,0,0,0,1,0,2197,0,0,0,0,0,0,0,0,0),
	('navigation',2198,0,'js/path_redirect/autocomplete_404','js/path_redirect/autocomplete_404','','a:0:{}','system',-1,0,0,0,0,1,0,2198,0,0,0,0,0,0,0,0,0),
	('navigation',2199,18,'admin/settings/admin_menu','admin/settings/admin_menu','Administration menu','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"Adjust administration menu settings.\";}}','system',0,0,0,0,0,3,0,2,18,2199,0,0,0,0,0,0,0),
	('admin_menu',2047,1894,'admin/content/node-type/building','admin/content/node-type/building','Edit !content-type','a:2:{s:1:\"t\";a:1:{s:13:\"!content-type\";s:8:\"Building\";}s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,3,0,1880,1894,2047,0,0,0,0,0,0,0),
	('admin_menu',2046,2043,'node/add/unit','node/add/unit','Unit','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,2043,2046,0,0,0,0,0,0,0),
	('admin_menu',2045,2043,'node/add/page','node/add/page','Page','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,2043,2045,0,0,0,0,0,0,0),
	('admin_menu',2044,2043,'node/add/building','node/add/building','Building','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,2043,2044,0,0,0,0,0,0,0),
	('admin_menu',2043,1880,'node/add','node/add','Create content','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1880,2043,0,0,0,0,0,0,0,0),
	('admin_menu',2042,2009,'http://drupal.org/project/issues/wysiwyg','','Wysiwyg issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2042,0,0,0,0,0,0,0),
	('admin_menu',2041,2009,'http://drupal.org/project/issues/views','','Views issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2041,0,0,0,0,0,0,0),
	('admin_menu',2040,2009,'http://drupal.org/project/issues/view_own','','View own issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2040,0,0,0,0,0,0,0),
	('admin_menu',2039,2009,'http://drupal.org/project/issues/typogrify','','Typogrify issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2039,0,0,0,0,0,0,0),
	('admin_menu',2038,2009,'http://drupal.org/project/issues/token','','Token issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2038,0,0,0,0,0,0,0),
	('admin_menu',2037,2009,'http://drupal.org/project/issues/search404','','Search 404 issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2037,0,0,0,0,0,0,0),
	('admin_menu',2036,2009,'http://drupal.org/project/issues/robotstxt','','robots.txt issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2036,0,0,0,0,0,0,0),
	('admin_menu',2034,2009,'http://drupal.org/project/issues/path_redirect','','Path redirect issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2034,0,0,0,0,0,0,0),
	('admin_menu',2035,2009,'http://drupal.org/project/issues/pathauto','','Pathauto issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2035,0,0,0,0,0,0,0),
	('admin_menu',2033,2009,'http://drupal.org/project/issues/noderelationships','','Node Relationships issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2033,0,0,0,0,0,0,0),
	('admin_menu',2306,2293,'admin/settings/date-time/formats/configure','admin/settings/date-time/formats/configure','Configure','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,4,0,1884,1897,2293,2306,0,0,0,0,0,0),
	('admin_menu',2270,1884,'admin/settings/date_popup','admin/settings/date_popup','Date Popup Configuration','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2270,0,0,0,0,0,0,0,0),
	('navigation',1186,0,'search','search','Search','a:0:{}','system',1,0,0,0,0,1,0,1186,0,0,0,0,0,0,0,0,0),
	('navigation',1187,0,'profile','profile','User list','a:0:{}','system',1,0,0,0,0,1,0,1187,0,0,0,0,0,0,0,0,0),
	('navigation',2182,0,'robots.txt','robots.txt','','a:0:{}','system',-1,0,0,0,0,1,0,2182,0,0,0,0,0,0,0,0,0),
	('navigation',2183,0,'imce','imce','File browser','a:0:{}','system',-1,0,0,0,0,1,0,2183,0,0,0,0,0,0,0,0,0),
	('navigation',2184,0,'location/autocomplete','location/autocomplete','','a:0:{}','system',-1,0,0,0,0,1,0,2184,0,0,0,0,0,0,0,0,0),
	('navigation',1192,0,'taxonomy/autocomplete','taxonomy/autocomplete','Autocomplete taxonomy','a:0:{}','system',-1,0,0,0,0,1,0,1192,0,0,0,0,0,0,0,0,0),
	('navigation',1194,2,'admin/help','admin/help','Help','a:0:{}','system',0,0,0,0,9,2,0,2,1194,0,0,0,0,0,0,0,0),
	('navigation',1196,1187,'profile/autocomplete','profile/autocomplete','Profile autocomplete','a:0:{}','system',-1,0,0,0,0,2,0,1187,1196,0,0,0,0,0,0,0,0),
	('admin_menu',2305,2293,'admin/settings/date-time/formats/add','admin/settings/date-time/formats/add','Add format','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,3,4,0,1884,1897,2293,2305,0,0,0,0,0,0),
	('navigation',2379,0,'admin/content/node-type/unit/fields/field_unit_images/remove','admin/content/node-type/unit/fields/field_unit_images/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2379,0,0,0,0,0,0,0,0,0),
	('admin_menu',2268,1884,'admin/settings/admin_menu','admin/settings/admin_menu','Administration menu','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2268,0,0,0,0,0,0,0,0),
	('admin_menu',2269,1884,'admin/settings/currency_api','admin/settings/currency_api','Currency API','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2269,0,0,0,0,0,0,0,0),
	('navigation',1201,16,'admin/reports/updates','admin/reports/updates','Available updates','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Get a status report about available updates for your installed modules and themes.\";}}','system',0,0,0,0,10,3,0,2,16,1201,0,0,0,0,0,0,0),
	('admin_menu',2392,2388,'admin/content/node-type/building/fields/field_building_images','admin/content/node-type/building/fields/field_building_images','Upload Images','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2388,2392,0,0,0,0,0),
	('admin_menu',2287,2273,'admin/settings/imageapi/config','admin/settings/imageapi/config','Configure','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,3,0,1884,2273,2287,0,0,0,0,0,0,0),
	('admin_menu',2286,1930,'admin/build/path/pathauto','admin/build/path/pathauto','Automated alias settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,10,3,0,1883,1930,2286,0,0,0,0,0,0,0),
	('navigation',1209,17,'admin/build/menu','admin/build/menu','Menus','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:116:\"Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.\";}}','system',0,0,1,0,0,3,0,2,17,1209,0,0,0,0,0,0,0),
	('navigation',1210,20,'admin/user/profile','admin/user/profile','Profiles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:42:\"Create customizable fields for your users.\";}}','system',0,0,0,0,0,3,0,2,20,1210,0,0,0,0,0,0,0),
	('navigation',1211,16,'admin/reports/dblog','admin/reports/dblog','Recent log entries','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View events that have recently been logged.\";}}','system',0,0,0,0,-1,3,0,2,16,1211,0,0,0,0,0,0,0),
	('admin_menu',2393,2062,'admin/content/node-type/page/display','admin/content/node-type/page/display','Display fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,2,4,0,1880,1894,2062,2393,0,0,0,0,0,0),
	('navigation',2363,0,'admin/content/node-type/building/groups/%','admin/content/node-type/building/groups/%','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2363,0,0,0,0,0,0,0,0,0),
	('admin_menu',2105,2009,'http://drupal.org/project/issues/nodeaccess','','Nodeaccess issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2105,0,0,0,0,0,0,0),
	('admin_menu',2332,2329,'admin/content/node-type/page/relationships/noderef','admin/content/node-type/page/relationships/noderef','Node reference extras','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2062,2329,2332,0,0,0,0,0),
	('navigation',1215,18,'admin/settings/search','admin/settings/search','Search settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:66:\"Configure relevance settings for search and other indexing options\";}}','system',0,0,0,0,0,3,0,2,18,1215,0,0,0,0,0,0,0),
	('navigation',1216,10,'admin/content/taxonomy','admin/content/taxonomy','Taxonomy','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Manage tagging, categorization, and classification of your content.\";}}','system',0,0,0,0,0,3,0,2,10,1216,0,0,0,0,0,0,0),
	('navigation',1217,0,'taxonomy/term/%','taxonomy/term/%','Taxonomy term','a:0:{}','system',-1,0,0,0,0,1,0,1217,0,0,0,0,0,0,0,0,0),
	('navigation',1218,16,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"View \'access denied\' errors (403s).\";}}','system',0,0,0,0,0,3,0,2,16,1218,0,0,0,0,0,0,0),
	('navigation',1219,16,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View \'page not found\' errors (404s).\";}}','system',0,0,0,0,0,3,0,2,16,1219,0,0,0,0,0,0,0),
	('navigation',1220,16,'admin/reports/search','admin/reports/search','Top search phrases','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:33:\"View most popular search phrases.\";}}','system',0,0,0,0,0,3,0,2,16,1220,0,0,0,0,0,0,0),
	('navigation',1221,17,'admin/build/path','admin/build/path','URL aliases','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:46:\"Change your site\'s URL paths by aliasing them.\";}}','system',0,0,0,0,0,3,0,2,17,1221,0,0,0,0,0,0,0),
	('admin_menu',2331,2329,'admin/content/node-type/page/relationships/erd','admin/content/node-type/page/relationships/erd','Entity relations diagram','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2062,2329,2331,0,0,0,0,0),
	('admin_menu',2285,2281,'admin/build/path-redirect/add','admin/build/path-redirect/add','Add redirect','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,2281,2285,0,0,0,0,0,0,0),
	('navigation',1225,1194,'admin/help/block','admin/help/block','block','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1225,0,0,0,0,0,0,0),
	('navigation',2195,0,'views/ajax','views/ajax','Views','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:31:\"Ajax callback for view loading.\";}}','system',-1,0,0,0,0,1,0,2195,0,0,0,0,0,0,0,0,0),
	('navigation',1227,1194,'admin/help/dblog','admin/help/dblog','dblog','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1227,0,0,0,0,0,0,0),
	('navigation',1228,1194,'admin/help/filter','admin/help/filter','filter','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1228,0,0,0,0,0,0,0),
	('admin_menu',2283,1884,'admin/settings/getid3','admin/settings/getid3','getID3()','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2283,0,0,0,0,0,0,0,0),
	('admin_menu',2284,1884,'admin/settings/jquery_update','admin/settings/jquery_update','jQuery Update','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2284,0,0,0,0,0,0,0,0),
	('admin_menu',2282,1884,'admin/settings/wysiwyg','admin/settings/wysiwyg','Wysiwyg profiles','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,2282,0,0,0,0,0,0,0,0),
	('navigation',1232,1194,'admin/help/help','admin/help/help','help','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1232,0,0,0,0,0,0,0),
	('admin_menu',2032,2009,'http://drupal.org/project/issues/money','','Money CCK field issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2032,0,0,0,0,0,0,0),
	('navigation',1234,1194,'admin/help/menu','admin/help/menu','menu','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1234,0,0,0,0,0,0,0),
	('navigation',1235,1194,'admin/help/node','admin/help/node','node','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1235,0,0,0,0,0,0,0),
	('navigation',1236,1194,'admin/help/path','admin/help/path','path','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1236,0,0,0,0,0,0,0),
	('navigation',1238,1194,'admin/help/profile','admin/help/profile','profile','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1238,0,0,0,0,0,0,0),
	('admin_menu',2330,2329,'admin/content/node-type/page/relationships/backref','admin/content/node-type/page/relationships/backref','Back reference settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,2,5,0,1880,1894,2062,2329,2330,0,0,0,0,0),
	('navigation',1240,1194,'admin/help/search','admin/help/search','search','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1240,0,0,0,0,0,0,0),
	('navigation',1241,1194,'admin/help/system','admin/help/system','system','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1241,0,0,0,0,0,0,0),
	('navigation',1242,1194,'admin/help/taxonomy','admin/help/taxonomy','taxonomy','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1242,0,0,0,0,0,0,0),
	('navigation',1244,1194,'admin/help/update','admin/help/update','update','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1244,0,0,0,0,0,0,0),
	('navigation',1245,1194,'admin/help/user','admin/help/user','user','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1245,0,0,0,0,0,0,0),
	('admin_menu',2281,1883,'admin/build/path-redirect','admin/build/path-redirect','URL redirects','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,2281,0,0,0,0,0,0,0,0),
	('navigation',1247,1210,'admin/user/profile/add','admin/user/profile/add','Add field','a:0:{}','system',-1,0,0,0,0,4,0,2,20,1210,1247,0,0,0,0,0,0),
	('admin_menu',2288,1897,'admin/settings/date-time/configure','admin/settings/date-time/configure','Date and time','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,1897,2288,0,0,0,0,0,0,0),
	('navigation',1249,1215,'admin/settings/search/wipe','admin/settings/search/wipe','Clear index','a:0:{}','system',-1,0,0,0,0,4,0,2,18,1215,1249,0,0,0,0,0,0),
	('navigation',1250,17,'admin/build/menu-customize/%','admin/build/menu-customize/%','Customize menu','a:0:{}','system',-1,0,0,0,0,3,0,2,17,1250,0,0,0,0,0,0,0),
	('navigation',1251,37,'admin/settings/logging/dblog','admin/settings/logging/dblog','Database logging','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:169:\"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.\";}}','system',0,0,0,0,0,4,0,2,18,37,1251,0,0,0,0,0,0),
	('navigation',1252,1221,'admin/build/path/delete','admin/build/path/delete','Delete alias','a:0:{}','system',-1,0,0,0,0,4,0,2,17,1221,1252,0,0,0,0,0,0),
	('navigation',1253,1210,'admin/user/profile/delete','admin/user/profile/delete','Delete field','a:0:{}','system',-1,0,0,0,0,4,0,2,20,1210,1253,0,0,0,0,0,0),
	('navigation',1254,16,'admin/reports/event/%','admin/reports/event/%','Details','a:0:{}','system',-1,0,0,0,0,3,0,2,16,1254,0,0,0,0,0,0,0),
	('navigation',1255,1221,'admin/build/path/edit','admin/build/path/edit','Edit alias','a:0:{}','system',-1,0,0,0,0,4,0,2,17,1221,1255,0,0,0,0,0,0),
	('navigation',1256,1210,'admin/user/profile/edit','admin/user/profile/edit','Edit field','a:0:{}','system',-1,0,0,0,0,4,0,2,20,1210,1256,0,0,0,0,0,0),
	('navigation',1257,1216,'admin/content/taxonomy/%','admin/content/taxonomy/%','List terms','a:0:{}','system',-1,0,0,0,0,4,0,2,10,1216,1257,0,0,0,0,0,0),
	('navigation',1258,1201,'admin/reports/updates/check','admin/reports/updates/check','Manual update check','a:0:{}','system',-1,0,0,0,0,4,0,2,16,1201,1258,0,0,0,0,0,0),
	('navigation',1259,1210,'admin/user/profile/autocomplete','admin/user/profile/autocomplete','Profile category autocomplete','a:0:{}','system',-1,0,0,0,0,4,0,2,20,1210,1259,0,0,0,0,0,0),
	('navigation',1260,0,'admin/build/menu-customize/%/delete','admin/build/menu-customize/%/delete','Delete menu','a:0:{}','system',-1,0,0,0,0,1,0,1260,0,0,0,0,0,0,0,0,0),
	('admin_menu',2413,2404,'admin/content/node-type/unit/fields/field_unit_images','admin/content/node-type/unit/fields/field_unit_images','Upload Images','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2413,0,0,0,0,0),
	('navigation',2225,1194,'admin/help/location','admin/help/location','location','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2225,0,0,0,0,0,0,0),
	('navigation',2226,1194,'admin/help/logintoboggan','admin/help/logintoboggan','logintoboggan','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2226,0,0,0,0,0,0,0),
	('navigation',1264,1216,'admin/content/taxonomy/edit/term','admin/content/taxonomy/edit/term','Edit term','a:0:{}','system',-1,0,0,0,0,4,0,2,10,1216,1264,0,0,0,0,0,0),
	('navigation',1265,1209,'admin/build/menu/item/%/delete','admin/build/menu/item/%/delete','Delete menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,1209,1265,0,0,0,0,0,0),
	('navigation',2377,0,'admin/content/node-type/unit/fields/field_unit_building/remove','admin/content/node-type/unit/fields/field_unit_building/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2377,0,0,0,0,0,0,0,0,0),
	('admin_menu',2031,2009,'http://drupal.org/project/issues/modalframe','','Modal Frame API issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2031,0,0,0,0,0,0,0),
	('navigation',1268,1209,'admin/build/menu/item/%/edit','admin/build/menu/item/%/edit','Edit menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,1209,1268,0,0,0,0,0,0),
	('navigation',1269,1216,'admin/content/taxonomy/edit/vocabulary/%','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','a:0:{}','system',-1,0,0,0,0,4,0,2,10,1216,1269,0,0,0,0,0,0),
	('navigation',1270,1209,'admin/build/menu/item/%/reset','admin/build/menu/item/%/reset','Reset menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,1209,1270,0,0,0,0,0,0),
	('admin_menu',2029,2009,'http://drupal.org/project/issues/login_destination','','Login destination issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2029,0,0,0,0,0,0,0),
	('navigation',1273,1209,'admin/build/menu-customize/navigation','admin/build/menu-customize/%','Navigation','a:0:{}','menu',0,0,0,0,0,4,0,2,17,1209,1273,0,0,0,0,0,0),
	('navigation',1274,1209,'admin/build/menu-customize/primary-links','admin/build/menu-customize/%','Primary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,1209,1274,0,0,0,0,0,0),
	('navigation',1275,1209,'admin/build/menu-customize/secondary-links','admin/build/menu-customize/%','Secondary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,1209,1275,0,0,0,0,0,0),
	('admin_menu',2030,2009,'http://drupal.org/project/issues/logintoboggan','','LoginToboggan issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2030,0,0,0,0,0,0,0),
	('admin_menu',2028,2009,'http://drupal.org/project/issues/location','','Location issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2028,0,0,0,0,0,0,0),
	('admin_menu',2027,2009,'http://drupal.org/project/issues/jquery_update','','jQuery Update issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2027,0,0,0,0,0,0,0),
	('admin_menu',2023,2009,'http://drupal.org/project/issues/imagefield_crop','','Image crop issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2023,0,0,0,0,0,0,0),
	('admin_menu',2024,2009,'http://drupal.org/project/issues/imce','','IMCE issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2024,0,0,0,0,0,0,0),
	('admin_menu',2025,2009,'http://drupal.org/project/issues/imce_wysiwyg','','IMCE Wysiwyg API bridge issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2025,0,0,0,0,0,0,0),
	('admin_menu',2026,2009,'http://drupal.org/project/issues/jquery_ui','','jQuery UI issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2026,0,0,0,0,0,0,0),
	('admin_menu',2022,2009,'http://drupal.org/project/issues/imagefield','','ImageField issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2022,0,0,0,0,0,0,0),
	('admin_menu',2021,2009,'http://drupal.org/project/issues/imageapi','','ImageAPI issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2021,0,0,0,0,0,0,0),
	('admin_menu',2020,2009,'http://drupal.org/project/issues/globalredirect','','Global Redirect issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2020,0,0,0,0,0,0,0),
	('admin_menu',2019,2009,'http://drupal.org/project/issues/getid3','','getID3() issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2019,0,0,0,0,0,0,0),
	('admin_menu',2017,2009,'http://drupal.org/project/issues/format_number','','Format Number API issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2017,0,0,0,0,0,0,0),
	('admin_menu',2018,2009,'http://drupal.org/project/issues/formatted_number','','Formatted Number CCK issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2018,0,0,0,0,0,0,0),
	('admin_menu',2016,2009,'http://drupal.org/project/issues/filefield','','FileField issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2016,0,0,0,0,0,0,0),
	('admin_menu',2015,2009,'http://drupal.org/project/issues/email_registration','','Email Registration issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2015,0,0,0,0,0,0,0),
	('admin_menu',2014,2009,'http://drupal.org/project/issues/date','','Date issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2014,0,0,0,0,0,0,0),
	('admin_menu',2013,2009,'http://drupal.org/project/issues/currency','','Currency API issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2013,0,0,0,0,0,0,0),
	('admin_menu',2011,2009,'http://drupal.org/project/issues/admin_menu','','Administration menu issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2011,0,0,0,0,0,0,0),
	('admin_menu',2012,2009,'http://drupal.org/project/issues/cck','','Content issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2012,0,0,0,0,0,0,0),
	('admin_menu',2010,2009,'http://drupal.org/project/issues/drupal','','Drupal issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,-10,3,0,1877,2009,2010,0,0,0,0,0,0,0),
	('admin_menu',2009,1877,'http://drupal.org','','Drupal.org','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,1,0,100,2,0,1877,2009,0,0,0,0,0,0,0,0),
	('admin_menu',2008,1884,'admin/by-module','admin/by-module','By module','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,2,0,1884,2008,0,0,0,0,0,0,0,0),
	('admin_menu',2405,2404,'admin/content/node-type/unit/fields/field_featureid','admin/content/node-type/unit/fields/field_featureid','Maps Feature ID','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2405,0,0,0,0,0),
	('admin_menu',2006,1877,'admin/reports/status/run-cron','admin/reports/status/run-cron','Run cron','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,50,2,0,1877,2006,0,0,0,0,0,0,0,0),
	('admin_menu',2005,1925,'admin/content/taxonomy/add/vocabulary','admin/content/taxonomy/add/vocabulary','Add vocabulary','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,1925,2005,0,0,0,0,0,0,0),
	('admin_menu',2004,1947,'admin/build/themes/settings/inbode','admin/build/themes/settings/inbode','inbode','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,2004,0,0,0,0,0,0),
	('admin_menu',2003,1958,'admin/build/block/list/inbode','admin/build/block/list/inbode','inbode','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,4,0,1883,1891,1958,2003,0,0,0,0,0,0),
	('admin_menu',2002,1947,'admin/build/themes/settings/STARTERKIT','admin/build/themes/settings/STARTERKIT','Zen Themer’s Starter Kit','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,2002,0,0,0,0,0,0),
	('admin_menu',2000,1947,'admin/build/themes/settings/zen_classic','admin/build/themes/settings/zen_classic','Zen Classic','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,2000,0,0,0,0,0,0),
	('admin_menu',2001,1958,'admin/build/block/list/STARTERKIT','admin/build/block/list/STARTERKIT','Zen Themer’s Starter Kit','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,2001,0,0,0,0,0,0),
	('admin_menu',1999,1958,'admin/build/block/list/zen_classic','admin/build/block/list/zen_classic','Zen Classic','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1999,0,0,0,0,0,0),
	('admin_menu',1998,1947,'admin/build/themes/settings/zen','admin/build/themes/settings/zen','Zen','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1998,0,0,0,0,0,0),
	('admin_menu',1997,1958,'admin/build/block/list/zen','admin/build/block/list/zen','Zen','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1997,0,0,0,0,0,0),
	('admin_menu',1996,1947,'admin/build/themes/settings/pushbutton','admin/build/themes/settings/pushbutton','Pushbutton','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1996,0,0,0,0,0,0),
	('admin_menu',1995,1958,'admin/build/block/list/pushbutton','admin/build/block/list/pushbutton','Pushbutton','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1995,0,0,0,0,0,0),
	('admin_menu',1994,1947,'admin/build/themes/settings/minnelli','admin/build/themes/settings/minnelli','Minnelli','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1994,0,0,0,0,0,0),
	('admin_menu',1993,1958,'admin/build/block/list/minnelli','admin/build/block/list/minnelli','Minnelli','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1993,0,0,0,0,0,0),
	('admin_menu',1992,1947,'admin/build/themes/settings/marvin','admin/build/themes/settings/marvin','Marvin','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1992,0,0,0,0,0,0),
	('admin_menu',1991,1958,'admin/build/block/list/marvin','admin/build/block/list/marvin','Marvin','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1991,0,0,0,0,0,0),
	('navigation',1345,11,'node/add/unit','node/add/unit','Unit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:29:\"A unit as part of a building.\";}}','system',0,0,0,0,0,2,0,11,1345,0,0,0,0,0,0,0,0),
	('admin_menu',1990,1947,'admin/build/themes/settings/global','admin/build/themes/settings/global','Global settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-1,4,0,1883,1926,1947,1990,0,0,0,0,0,0),
	('admin_menu',1989,1947,'admin/build/themes/settings/garland','admin/build/themes/settings/garland','Garland','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1989,0,0,0,0,0,0),
	('admin_menu',1988,1958,'admin/build/block/list/garland','admin/build/block/list/garland','Garland','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1988,0,0,0,0,0,0),
	('navigation',2376,0,'admin/content/node-type/unit/fields/field_unit_bedroom/remove','admin/content/node-type/unit/fields/field_unit_bedroom/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2376,0,0,0,0,0,0,0,0,0),
	('navigation',2248,2205,'admin/settings/location/geocoding/%/%','admin/settings/location/geocoding/%/%','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,2205,2248,0,0,0,0,0,0),
	('admin_menu',1985,1947,'admin/build/themes/settings/chameleon','admin/build/themes/settings/chameleon','Chameleon','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1985,0,0,0,0,0,0),
	('admin_menu',1984,1958,'admin/build/block/list/chameleon','admin/build/block/list/chameleon','Chameleon','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1984,0,0,0,0,0,0),
	('admin_menu',1983,1947,'admin/build/themes/settings/bluemarine','admin/build/themes/settings/bluemarine','Bluemarine','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1926,1947,1983,0,0,0,0,0,0),
	('admin_menu',1982,1958,'admin/build/block/list/bluemarine','admin/build/block/list/bluemarine','Bluemarine','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1883,1891,1958,1982,0,0,0,0,0,0),
	('admin_menu',1980,1910,'admin/build/modules/uninstall','admin/build/modules/uninstall','Uninstall','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,1910,1980,0,0,0,0,0,0,0),
	('navigation',2245,30,'admin/settings/date-time/formats/delete/%','admin/settings/date-time/formats/delete/%','Delete date format','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Allow users to delete a configured date format.\";}}','system',-1,0,0,0,0,4,0,2,18,30,2245,0,0,0,0,0,0),
	('navigation',2375,0,'admin/content/node-type/unit/fields/field_unit_bathroom/remove','admin/content/node-type/unit/fields/field_unit_bathroom/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2375,0,0,0,0,0,0,0,0,0),
	('admin_menu',1977,1890,'admin/reports/updates/settings','admin/reports/updates/settings','Settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1882,1890,1977,0,0,0,0,0,0,0),
	('admin_menu',1976,1909,'admin/build/menu/settings','admin/build/menu/settings','Settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,5,3,0,1883,1909,1976,0,0,0,0,0,0,0),
	('admin_menu',2280,1884,'admin/settings/search404','admin/settings/search404','Search 404 settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2280,0,0,0,0,0,0,0,0),
	('admin_menu',2279,1884,'admin/settings/robotstxt','admin/settings/robotstxt','RobotsTxt','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2279,0,0,0,0,0,0,0,0),
	('admin_menu',1973,1887,'admin/settings/actions/manage','admin/settings/actions/manage','Manage actions','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-2,3,0,1884,1887,1973,0,0,0,0,0,0,0),
	('admin_menu',2278,1884,'admin/settings/format_number','admin/settings/format_number','Number format','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2278,0,0,0,0,0,0,0,0),
	('admin_menu',2277,1885,'admin/user/nodeaccess','admin/user/nodeaccess','Nodeaccess','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,2277,0,0,0,0,0,0,0,0),
	('admin_menu',1970,1909,'admin/build/menu/list','admin/build/menu/list','List menus','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1883,1909,1970,0,0,0,0,0,0,0),
	('admin_menu',1969,1904,'admin/settings/filters/list','admin/settings/filters/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,1904,1969,0,0,0,0,0,0,0),
	('admin_menu',1968,1890,'admin/reports/updates/list','admin/reports/updates/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1882,1890,1968,0,0,0,0,0,0,0),
	('admin_menu',1966,1926,'admin/build/themes/select','admin/build/themes/select','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-1,3,0,1883,1926,1966,0,0,0,0,0,0,0),
	('admin_menu',1967,1910,'admin/build/modules/list','admin/build/modules/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,1910,1967,0,0,0,0,0,0,0),
	('navigation',2224,18,'admin/settings/jquery_update','admin/settings/jquery_update','jQuery Update','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Configure settings for jQuery Update module.\";}}','system',0,0,0,0,0,3,0,2,18,2224,0,0,0,0,0,0,0),
	('admin_menu',1965,1933,'admin/user/user/list','admin/user/user/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1885,1933,1965,0,0,0,0,0,0,0),
	('navigation',2374,0,'admin/content/node-type/unit/fields/field_unit_available/remove','admin/content/node-type/unit/fields/field_unit_available/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2374,0,0,0,0,0,0,0,0,0),
	('admin_menu',1963,1894,'admin/content/types/list','admin/content/types/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1880,1894,1963,0,0,0,0,0,0,0),
	('admin_menu',1964,1886,'admin/user/rules/list','admin/user/rules/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1885,1886,1964,0,0,0,0,0,0,0),
	('admin_menu',2276,1885,'admin/user/logintoboggan','admin/user/logintoboggan','LoginToboggan','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,2276,0,0,0,0,0,0,0,0),
	('navigation',2243,2,'admin/views/ajax/autocomplete/user','admin/views/ajax/autocomplete/user','','a:0:{}','system',-1,0,0,0,0,2,0,2,2243,0,0,0,0,0,0,0,0),
	('navigation',2244,0,'user/validate/%/%/%','user/validate/%/%/%','Validate e-mail address','a:0:{}','system',-1,0,0,0,0,1,0,2244,0,0,0,0,0,0,0,0,0),
	('admin_menu',1961,1893,'admin/content/node/overview','admin/content/node/overview','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1880,1893,1961,0,0,0,0,0,0,0),
	('admin_menu',1962,1925,'admin/content/taxonomy/list','admin/content/taxonomy/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1880,1925,1962,0,0,0,0,0,0,0),
	('admin_menu',2389,2388,'admin/content/node-type/building/fields/field_building_address','admin/content/node-type/building/fields/field_building_address','Building\'s Address','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2388,2389,0,0,0,0,0),
	('admin_menu',2329,2062,'admin/content/node-type/page/relationships','admin/content/node-type/page/relationships','Relationships','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,10,4,0,1880,1894,2062,2329,0,0,0,0,0,0),
	('admin_menu',1959,1930,'admin/build/path/list','admin/build/path/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1883,1930,1959,0,0,0,0,0,0,0),
	('admin_menu',1958,1891,'admin/build/block/list','admin/build/block/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,-10,3,0,1883,1891,1958,0,0,0,0,0,0,0),
	('admin_menu',2304,2287,'admin/settings/imageapi/config/imageapi_gd','admin/settings/imageapi/config/imageapi_gd','@name','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,4,0,1884,2273,2287,2304,0,0,0,0,0,0),
	('navigation',2233,1194,'admin/help/typogrify','admin/help/typogrify','typogrify','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2233,0,0,0,0,0,0,0),
	('navigation',2234,1194,'admin/help/wysiwyg','admin/help/wysiwyg','wysiwyg','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2234,0,0,0,0,0,0,0),
	('navigation',2235,0,'noderelationships/noderelationships-noderef/page-grid','noderelationships/noderelationships-noderef/page-grid','','a:0:{}','system',-1,0,0,0,0,1,0,2235,0,0,0,0,0,0,0,0,0),
	('navigation',2236,0,'noderelationships/noderelationships-noderef/page-table','noderelationships/noderelationships-noderef/page-table','','a:0:{}','system',-1,0,0,0,0,1,0,2236,0,0,0,0,0,0,0,0,0),
	('navigation',2237,2203,'admin/settings/imce/profile','admin/settings/imce/profile','Add new profile','a:0:{}','system',-1,0,0,0,0,4,0,2,18,2203,2237,0,0,0,0,0,0),
	('navigation',2238,30,'admin/settings/date-time/formats/lookup','admin/settings/date-time/formats/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,2,18,30,2238,0,0,0,0,0,0),
	('navigation',2239,30,'admin/settings/date-time/delete/%','admin/settings/date-time/delete/%','Delete date format type','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:52:\"Allow users to delete a configured date format type.\";}}','system',-1,0,0,0,0,4,0,2,18,30,2239,0,0,0,0,0,0),
	('navigation',2240,0,'filefield/ahah/%/%/%','filefield/ahah/%/%/%','','a:0:{}','system',-1,0,0,0,0,1,0,2240,0,0,0,0,0,0,0,0,0),
	('navigation',2241,2214,'admin/build/path-redirect/delete/%','admin/build/path-redirect/delete/%','Delete redirect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:32:\"Delete an existing URL redirect.\";}}','system',-1,0,0,0,0,4,0,2,17,2214,2241,0,0,0,0,0,0),
	('navigation',2242,2214,'admin/build/path-redirect/edit/%','admin/build/path-redirect/edit/%','Edit redirect','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"Edit an existing URL redirect.\";}}','system',-1,0,0,0,0,4,0,2,17,2214,2242,0,0,0,0,0,0),
	('navigation',2185,0,'admin_menu/flush-cache','admin_menu/flush-cache','','a:0:{}','system',-1,0,0,0,0,1,0,2185,0,0,0,0,0,0,0,0,0),
	('navigation',2186,0,'admin_menu/toggle-modules','admin_menu/toggle-modules','','a:0:{}','system',-1,0,0,0,0,1,0,2186,0,0,0,0,0,0,0,0,0),
	('navigation',2187,0,'content/js_add_more','content/js_add_more','','a:0:{}','system',-1,0,0,0,0,1,0,2187,0,0,0,0,0,0,0,0,0),
	('navigation',2188,0,'filefield/progress','filefield/progress','','a:0:{}','system',-1,0,0,0,0,1,0,2188,0,0,0,0,0,0,0,0,0),
	('navigation',2189,0,'nodereference/autocomplete','nodereference/autocomplete','Nodereference autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,2189,0,0,0,0,0,0,0,0,0),
	('navigation',2190,0,'toboggan/denied','toboggan/denied','Access denied','a:0:{}','system',-1,0,0,0,0,1,0,2190,0,0,0,0,0,0,0,0,0),
	('navigation',2191,0,'noderelationships/create','noderelationships/create','Create and reference','a:0:{}','system',-1,0,0,0,0,1,0,2191,0,0,0,0,0,0,0,0,0),
	('navigation',2192,0,'noderelationships/search','noderelationships/search','Search and reference','a:0:{}','system',-1,0,0,0,0,1,0,2192,0,0,0,0,0,0,0,0,0),
	('navigation',2193,0,'user/timezone','user/timezone','User timezone','a:0:{}','system',-1,0,0,0,0,1,0,2193,0,0,0,0,0,0,0,0,0),
	('navigation',2194,0,'userreference/autocomplete','userreference/autocomplete','Userreference autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,2194,0,0,0,0,0,0,0,0,0),
	('admin_menu',1947,1926,'admin/build/themes/settings','admin/build/themes/settings','Configure','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,3,0,1883,1926,1947,0,0,0,0,0,0,0),
	('admin_menu',2404,2073,'admin/content/node-type/unit/fields','admin/content/node-type/unit/fields','Manage fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,1,4,0,1880,1894,2073,2404,0,0,0,0,0,0),
	('admin_menu',1948,1906,'admin/settings/logging/dblog','admin/settings/logging/dblog','Database logging','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,1906,1948,0,0,0,0,0,0,0),
	('navigation',1413,11,'node/add/building','node/add/building','Building','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:29:\"A building, containing units.\";}}','system',0,0,0,0,0,2,0,11,1413,0,0,0,0,0,0,0,0),
	('navigation',1414,10,'admin/content/node-type/building','admin/content/node-type/building','Building','a:0:{}','system',-1,0,0,0,0,3,0,2,10,1414,0,0,0,0,0,0,0),
	('navigation',1415,0,'admin/content/node-type/building/delete','admin/content/node-type/building/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,1415,0,0,0,0,0,0,0,0,0),
	('navigation',2223,1194,'admin/help/globalredirect','admin/help/globalredirect','globalredirect','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2223,0,0,0,0,0,0,0),
	('navigation',2222,1194,'admin/help/getid3','admin/help/getid3','getid3','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2222,0,0,0,0,0,0,0),
	('admin_menu',1946,1886,'admin/user/rules/check','admin/user/rules/check','Check rules','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1885,1886,1946,0,0,0,0,0,0,0),
	('admin_menu',1944,1933,'admin/user/user/create','admin/user/user/create','Add user','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1885,1933,1944,0,0,0,0,0,0,0),
	('admin_menu',1943,1886,'admin/user/rules/add','admin/user/rules/add','Add rule','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1885,1886,1943,0,0,0,0,0,0,0),
	('admin_menu',1941,1909,'admin/build/menu/add','admin/build/menu/add','Add menu','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,1909,1941,0,0,0,0,0,0,0),
	('admin_menu',1938,1891,'admin/build/block/add','admin/build/block/add','Add block','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,1891,1938,0,0,0,0,0,0,0),
	('admin_menu',1939,1894,'admin/content/types/add','admin/content/types/add','Add content type','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1880,1894,1939,0,0,0,0,0,0,0),
	('admin_menu',1940,1904,'admin/settings/filters/add','admin/settings/filters/add','Add input format','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,3,0,1884,1904,1940,0,0,0,0,0,0,0),
	('admin_menu',1937,1930,'admin/build/path/add','admin/build/path/add','Add alias','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1883,1930,1937,0,0,0,0,0,0,0),
	('navigation',2216,1194,'admin/help/admin_menu','admin/help/admin_menu','admin_menu','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2216,0,0,0,0,0,0,0),
	('navigation',2217,1194,'admin/help/content','admin/help/content','content','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2217,0,0,0,0,0,0,0),
	('navigation',2218,1194,'admin/help/currency_api','admin/help/currency_api','currency_api','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2218,0,0,0,0,0,0,0),
	('navigation',2219,1194,'admin/help/date','admin/help/date','date','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2219,0,0,0,0,0,0,0),
	('navigation',2220,1194,'admin/help/format_number','admin/help/format_number','format_number','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2220,0,0,0,0,0,0,0),
	('navigation',2221,18,'admin/settings/getid3','admin/settings/getid3','getID3()','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Configure settings associated with getID3().\";}}','system',0,0,0,0,0,3,0,2,18,2221,0,0,0,0,0,0,0),
	('admin_menu',1932,1885,'admin/user/settings','admin/user/settings','User settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,1932,0,0,0,0,0,0,0,0),
	('admin_menu',2403,2399,'admin/content/node-type/unit/display/token','admin/content/node-type/unit/display/token','Token','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2073,2399,2403,0,0,0,0,0),
	('admin_menu',2302,2272,'admin/settings/imce/profiles','admin/settings/imce/profiles','Settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,2272,2302,0,0,0,0,0,0,0),
	('admin_menu',2303,2281,'admin/build/path-redirect/settings','admin/build/path-redirect/settings','Settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,10,3,0,1883,2281,2303,0,0,0,0,0,0,0),
	('admin_menu',1933,1885,'admin/user/user','admin/user/user','Users','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1885,1933,0,0,0,0,0,0,0,0),
	('admin_menu',2388,2047,'admin/content/node-type/building/fields','admin/content/node-type/building/fields','Manage fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,1,4,0,1880,1894,2047,2388,0,0,0,0,0,0),
	('admin_menu',1930,1883,'admin/build/path','admin/build/path','URL aliases','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,1930,0,0,0,0,0,0,0,0),
	('admin_menu',2301,2274,'admin/settings/location/maplinking','admin/settings/location/maplinking','Map links','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,3,0,1884,2274,2301,0,0,0,0,0,0,0),
	('admin_menu',1929,1882,'admin/reports/search','admin/reports/search','Top search phrases','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1882,1929,0,0,0,0,0,0,0,0),
	('admin_menu',1928,1882,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1882,1928,0,0,0,0,0,0,0,0),
	('admin_menu',1927,1882,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1882,1927,0,0,0,0,0,0,0,0),
	('admin_menu',1926,1883,'admin/build/themes','admin/build/themes','Themes','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,1926,0,0,0,0,0,0,0,0),
	('admin_menu',1925,1880,'admin/content/taxonomy','admin/content/taxonomy','Taxonomy','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1880,1925,0,0,0,0,0,0,0,0),
	('admin_menu',1924,1882,'admin/reports/status','admin/reports/status','Status report','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,10,2,0,1882,1924,0,0,0,0,0,0,0,0),
	('admin_menu',1923,1884,'admin/settings/site-maintenance','admin/settings/site-maintenance','Site maintenance','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1923,0,0,0,0,0,0,0,0),
	('admin_menu',1921,1884,'admin/settings/search','admin/settings/search','Search settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1921,0,0,0,0,0,0,0,0),
	('admin_menu',1922,1884,'admin/settings/site-information','admin/settings/site-information','Site information','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1922,0,0,0,0,0,0,0,0),
	('navigation',2368,0,'admin/content/node-type/building/fields/field_building_amenities/remove','admin/content/node-type/building/fields/field_building_amenities/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2368,0,0,0,0,0,0,0,0,0),
	('navigation',2369,0,'admin/content/node-type/building/fields/field_building_description/remove','admin/content/node-type/building/fields/field_building_description/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2369,0,0,0,0,0,0,0,0,0),
	('admin_menu',1917,1882,'admin/reports/dblog','admin/reports/dblog','Recent log entries','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-1,2,0,1882,1917,0,0,0,0,0,0,0,0),
	('admin_menu',1919,1885,'admin/user/roles','admin/user/roles','Roles','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,1919,0,0,0,0,0,0,0,0),
	('admin_menu',2402,2399,'admin/content/node-type/unit/display/search','admin/content/node-type/unit/display/search','Search','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2073,2399,2402,0,0,0,0,0),
	('admin_menu',1916,1880,'admin/content/rss-publishing','admin/content/rss-publishing','RSS publishing','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1880,1916,0,0,0,0,0,0,0,0),
	('admin_menu',1915,1885,'admin/user/profile','admin/user/profile','Profiles','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,1915,0,0,0,0,0,0,0,0),
	('admin_menu',1914,1880,'admin/content/node-settings','admin/content/node-settings','Post settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1880,1914,0,0,0,0,0,0,0,0),
	('admin_menu',1913,1885,'admin/user/permissions','admin/user/permissions','Permissions','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,1913,0,0,0,0,0,0,0,0),
	('admin_menu',2300,2274,'admin/settings/location/main','admin/settings/location/main','Main settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,2274,2300,0,0,0,0,0,0,0),
	('admin_menu',1910,1883,'admin/build/modules','admin/build/modules','Modules','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,1910,0,0,0,0,0,0,0,0),
	('navigation',2230,1194,'admin/help/prepopulate','admin/help/prepopulate','prepopulate','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2230,0,0,0,0,0,0,0),
	('navigation',2231,1194,'admin/help/robotstxt','admin/help/robotstxt','robotstxt','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2231,0,0,0,0,0,0,0),
	('navigation',2232,1194,'admin/help/token','admin/help/token','token','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2232,0,0,0,0,0,0,0),
	('admin_menu',1912,1884,'admin/settings/performance','admin/settings/performance','Performance','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1912,0,0,0,0,0,0,0,0),
	('admin_menu',2299,2274,'admin/settings/location/util','admin/settings/location/util','Location utilities','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,3,3,0,1884,2274,2299,0,0,0,0,0,0,0),
	('admin_menu',2298,2282,'admin/settings/wysiwyg/profile','admin/settings/wysiwyg/profile','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,3,0,1884,2282,2298,0,0,0,0,0,0,0),
	('navigation',2373,0,'admin/content/node-type/unit/fields/field_unit_area/remove','admin/content/node-type/unit/fields/field_unit_area/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2373,0,0,0,0,0,0,0,0,0),
	('navigation',2372,0,'admin/content/node-type/unit/fields/field_unit_amenities/remove','admin/content/node-type/unit/fields/field_unit_amenities/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2372,0,0,0,0,0,0,0,0,0),
	('navigation',2371,0,'admin/content/node-type/unit/fields/field_featureid/remove','admin/content/node-type/unit/fields/field_featureid/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2371,0,0,0,0,0,0,0,0,0),
	('navigation',2370,0,'admin/content/node-type/building/fields/field_building_images/remove','admin/content/node-type/building/fields/field_building_images/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2370,0,0,0,0,0,0,0,0,0),
	('admin_menu',1909,1883,'admin/build/menu','admin/build/menu','Menus','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,1909,0,0,0,0,0,0,0,0),
	('admin_menu',2401,2399,'admin/content/node-type/unit/display/rss','admin/content/node-type/unit/display/rss','RSS','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2073,2399,2401,0,0,0,0,0),
	('admin_menu',2399,2073,'admin/content/node-type/unit/display','admin/content/node-type/unit/display','Display fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,2,4,0,1880,1894,2073,2399,0,0,0,0,0,0),
	('admin_menu',1904,1884,'admin/settings/filters','admin/settings/filters','Input formats','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,1904,0,0,0,0,0,0,0,0),
	('admin_menu',2275,1885,'admin/user/login_destination','admin/user/login_destination','Login Destination','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1885,2275,0,0,0,0,0,0,0,0),
	('admin_menu',1906,1884,'admin/settings/logging','admin/settings/logging','Logging and alerts','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,1906,0,0,0,0,0,0,0,0),
	('admin_menu',2273,1884,'admin/settings/imageapi','admin/settings/imageapi','ImageAPI','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,2273,0,0,0,0,0,0,0,0),
	('admin_menu',2274,1884,'admin/settings/location','admin/settings/location','Location','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,2274,0,0,0,0,0,0,0,0),
	('admin_menu',2272,1884,'admin/settings/imce','admin/settings/imce','IMCE','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,2272,0,0,0,0,0,0,0,0),
	('admin_menu',1902,1884,'admin/settings/image-toolkit','admin/settings/image-toolkit','Image toolkit','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1902,0,0,0,0,0,0,0,0),
	('admin_menu',1897,1884,'admin/settings/date-time','admin/settings/date-time','Date and time','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,1897,0,0,0,0,0,0,0,0),
	('admin_menu',1898,1884,'admin/settings/error-reporting','admin/settings/error-reporting','Error reporting','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1898,0,0,0,0,0,0,0,0),
	('admin_menu',1899,1884,'admin/settings/file-system','admin/settings/file-system','File system','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1899,0,0,0,0,0,0,0,0),
	('admin_menu',2271,1884,'admin/settings/globalredirect','admin/settings/globalredirect','Global Redirect','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,2271,0,0,0,0,0,0,0,0),
	('admin_menu',1893,1880,'admin/content/node','admin/content/node','Content','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1880,1893,0,0,0,0,0,0,0,0),
	('admin_menu',1894,1880,'admin/content/types','admin/content/types','Content types','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1880,1894,0,0,0,0,0,0,0,0),
	('admin_menu',1892,1884,'admin/settings/clean-urls','admin/settings/clean-urls','Clean URLs','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1892,0,0,0,0,0,0,0,0),
	('admin_menu',2400,2399,'admin/content/node-type/unit/display/basic','admin/content/node-type/unit/display/basic','Basic','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2399,2400,0,0,0,0,0),
	('admin_menu',2297,2273,'admin/settings/imageapi/list','admin/settings/imageapi/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-1,3,0,1884,2273,2297,0,0,0,0,0,0,0),
	('admin_menu',1890,1882,'admin/reports/updates','admin/reports/updates','Available updates','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,10,2,0,1882,1890,0,0,0,0,0,0,0,0),
	('admin_menu',1891,1883,'admin/build/block','admin/build/block','Blocks','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1883,1891,0,0,0,0,0,0,0,0),
	('navigation',1613,1194,'admin/help/php','admin/help/php','php','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,1613,0,0,0,0,0,0,0),
	('admin_menu',1889,1884,'admin/settings/admin','admin/settings/admin','Administration theme','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1884,1889,0,0,0,0,0,0,0,0),
	('admin_menu',1887,1884,'admin/settings/actions','admin/settings/actions','Actions','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1884,1887,0,0,0,0,0,0,0,0),
	('admin_menu',1886,1885,'admin/user/rules','admin/user/rules','Access rules','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,2,0,1885,1886,0,0,0,0,0,0,0,0),
	('admin_menu',1885,0,'admin/user','admin/user','User management','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,0,1,0,1885,0,0,0,0,0,0,0,0,0),
	('admin_menu',1884,0,'admin/settings','admin/settings','Site configuration','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,-5,1,0,1884,0,0,0,0,0,0,0,0,0),
	('admin_menu',1882,0,'admin/reports','admin/reports','Reports','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,5,1,0,1882,0,0,0,0,0,0,0,0,0),
	('admin_menu',1883,0,'admin/build','admin/build','Site building','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,-10,1,0,1883,0,0,0,0,0,0,0,0,0),
	('admin_menu',1881,0,'admin/help','admin/help','Help','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,9,1,0,1881,0,0,0,0,0,0,0,0,0),
	('admin_menu',1880,0,'admin/content','admin/content','Content management','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,-10,1,0,1880,0,0,0,0,0,0,0,0,0),
	('admin_menu',1879,0,'user','user','icon_users','a:3:{s:11:\"extra class\";s:50:\"admin-menu-action admin-menu-icon admin-menu-users\";s:4:\"html\";b:1;s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-90,1,0,1879,0,0,0,0,0,0,0,0,0),
	('admin_menu',1878,0,'logout','logout','Log out @username','a:3:{s:11:\"extra class\";s:35:\"admin-menu-action admin-menu-logout\";s:1:\"t\";a:0:{}s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-100,1,0,1878,0,0,0,0,0,0,0,0,0),
	('admin_menu',1877,0,'<front>','','<img class=\"admin-menu-icon\" src=\"/misc/favicon.ico\" width=\"16\" height=\"16\" alt=\"Home\" />','a:3:{s:11:\"extra class\";s:15:\"admin-menu-icon\";s:4:\"html\";b:1;s:5:\"alter\";b:1;}','admin_menu',0,1,1,0,-100,1,0,1877,0,0,0,0,0,0,0,0,0),
	('admin_menu',2296,2281,'admin/build/path-redirect/list','admin/build/path-redirect/list','List','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,-10,3,0,1883,2281,2296,0,0,0,0,0,0,0),
	('admin_menu',2295,1894,'admin/content/types/import','admin/content/types/import','Import','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,4,3,0,1880,1894,2295,0,0,0,0,0,0,0),
	('navigation',2367,0,'admin/content/node-type/building/fields/field_building_address/remove','admin/content/node-type/building/fields/field_building_address/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2367,0,0,0,0,0,0,0,0,0),
	('navigation',2366,0,'admin/content/node-type/unit/groups/%/remove','admin/content/node-type/unit/groups/%/remove','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2366,0,0,0,0,0,0,0,0,0),
	('navigation',2365,0,'admin/content/node-type/page/groups/%/remove','admin/content/node-type/page/groups/%/remove','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2365,0,0,0,0,0,0,0,0,0),
	('navigation',2364,0,'admin/content/node-type/building/groups/%/remove','admin/content/node-type/building/groups/%/remove','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2364,0,0,0,0,0,0,0,0,0),
	('navigation',2361,0,'admin/content/node-type/page/groups/%','admin/content/node-type/page/groups/%','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2361,0,0,0,0,0,0,0,0,0),
	('navigation',2362,0,'admin/content/node-type/unit/groups/%','admin/content/node-type/unit/groups/%','Edit group','a:0:{}','system',-1,0,0,0,0,1,0,2362,0,0,0,0,0,0,0,0,0),
	('admin_menu',2169,2009,'http://drupal.org/project/issues/prepopulate','','Prepopulate issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2169,0,0,0,0,0,0,0),
	('admin_menu',2172,2009,'http://drupal.org/project/issues/content_access','','Content Access issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2172,0,0,0,0,0,0,0),
	('navigation',2381,0,'admin/content/node-type/unit/fields/field_unit_status/remove','admin/content/node-type/unit/fields/field_unit_status/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2381,0,0,0,0,0,0,0,0,0),
	('admin_menu',2383,2047,'admin/content/node-type/building/display','admin/content/node-type/building/display','Display fields','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,2,4,0,1880,1894,2047,2383,0,0,0,0,0,0),
	('admin_menu',2384,2383,'admin/content/node-type/building/display/basic','admin/content/node-type/building/display/basic','Basic','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2047,2383,2384,0,0,0,0,0),
	('admin_menu',2385,2383,'admin/content/node-type/building/display/rss','admin/content/node-type/building/display/rss','RSS','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2047,2383,2385,0,0,0,0,0),
	('admin_menu',2386,2383,'admin/content/node-type/building/display/search','admin/content/node-type/building/display/search','Search','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2047,2383,2386,0,0,0,0,0),
	('admin_menu',2387,2383,'admin/content/node-type/building/display/token','admin/content/node-type/building/display/token','Token','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2047,2383,2387,0,0,0,0,0),
	('admin_menu',2350,2073,'admin/content/node-type/unit/relationships','admin/content/node-type/unit/relationships','Relationships','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,1,0,10,4,0,1880,1894,2073,2350,0,0,0,0,0,0),
	('admin_menu',2351,2350,'admin/content/node-type/unit/relationships/backref','admin/content/node-type/unit/relationships/backref','Back reference settings','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,2,5,0,1880,1894,2073,2350,2351,0,0,0,0,0),
	('admin_menu',2352,2350,'admin/content/node-type/unit/relationships/erd','admin/content/node-type/unit/relationships/erd','Entity relations diagram','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2350,2352,0,0,0,0,0),
	('admin_menu',2353,2350,'admin/content/node-type/unit/relationships/noderef','admin/content/node-type/unit/relationships/noderef','Node reference extras','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,1,5,0,1880,1894,2073,2350,2353,0,0,0,0,0),
	('admin_menu',2354,1877,'admin_menu/flush-cache','admin_menu/flush-cache','Flush all caches','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,1,0,20,2,0,1877,2354,0,0,0,0,0,0,0,0),
	('admin_menu',2355,2354,'admin_menu/flush-cache/admin_menu','admin_menu/flush-cache','Administration menu','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,0,0,0,3,0,1877,2354,2355,0,0,0,0,0,0,0),
	('admin_menu',2356,2354,'admin_menu/flush-cache/cache','admin_menu/flush-cache','Cache tables','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,0,0,0,3,0,1877,2354,2356,0,0,0,0,0,0,0),
	('admin_menu',2357,2354,'admin_menu/flush-cache/menu','admin_menu/flush-cache','Menu','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,0,0,0,3,0,1877,2354,2357,0,0,0,0,0,0,0),
	('admin_menu',2358,2354,'admin_menu/flush-cache/requisites','admin_menu/flush-cache','Page requisites','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,0,0,0,3,0,1877,2354,2358,0,0,0,0,0,0,0),
	('admin_menu',2359,2354,'admin_menu/flush-cache/theme','admin_menu/flush-cache','Theme registry','a:2:{s:5:\"alter\";b:1;s:5:\"query\";s:11:\"destination\";}','admin_menu',0,0,0,0,0,3,0,1877,2354,2359,0,0,0,0,0,0,0),
	('admin_menu',2360,1877,'admin_menu/toggle-modules','admin_menu/toggle-modules','Disable developer modules','a:2:{s:5:\"query\";s:11:\"destination\";s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,88,2,0,1877,2360,0,0,0,0,0,0,0,0),
	('admin_menu',2414,2404,'admin/content/node-type/unit/fields/field_unit_price','admin/content/node-type/unit/fields/field_unit_price','Price','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2414,0,0,0,0,0),
	('admin_menu',2415,2404,'admin/content/node-type/unit/fields/field_unit_status','admin/content/node-type/unit/fields/field_unit_status','Status','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2415,0,0,0,0,0),
	('admin_menu',2466,1883,'admin/build/jqp','admin/build/jqp','Javascript libraries','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,2,0,1883,2466,0,0,0,0,0,0,0,0),
	('navigation',2446,21,'user/%/inbode/craigslist/preview/%/%','user/%/inbode/craigslist/preview/%/%','','a:0:{}','system',0,0,0,0,0,2,0,21,2446,0,0,0,0,0,0,0,0),
	('navigation',2444,21,'user/%/inbode/craigslist/%/%','user/%/inbode/craigslist/%/%','','a:0:{}','system',0,0,0,0,0,2,0,21,2444,0,0,0,0,0,0,0,0),
	('admin_menu',2496,1877,'update.php','','Run updates','a:2:{s:8:\"external\";b:1;s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,50,2,0,1877,2496,0,0,0,0,0,0,0,0),
	('navigation',2456,0,'jqp_ajax_check_file','jqp_ajax_check_file','','a:0:{}','system',-1,0,0,0,0,1,0,2456,0,0,0,0,0,0,0,0,0),
	('navigation',2457,0,'jqp_autocomplete','jqp_autocomplete','','a:0:{}','system',-1,0,0,0,0,1,0,2457,0,0,0,0,0,0,0,0,0),
	('navigation',2458,0,'swfupload','swfupload','','a:0:{}','system',-1,0,0,0,0,1,0,2458,0,0,0,0,0,0,0,0,0),
	('navigation',2459,0,'jqp_stop_message/%','jqp_stop_message/%','','a:0:{}','system',-1,0,0,0,0,1,0,2459,0,0,0,0,0,0,0,0,0),
	('navigation',2460,17,'admin/build/jqp','admin/build/jqp','Javascript libraries','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:32:\"Administer javascript libraries.\";}}','system',0,0,0,0,0,3,0,2,17,2460,0,0,0,0,0,0,0),
	('navigation',2461,1194,'admin/help/jqp','admin/help/jqp','jqp','a:0:{}','system',-1,0,0,0,0,3,0,2,1194,2461,0,0,0,0,0,0,0),
	('navigation',2462,2460,'admin/build/jqp/rebuild_confirm','admin/build/jqp/rebuild_confirm','Reset all libraries','a:0:{}','system',-1,0,0,0,0,4,0,2,17,2460,2462,0,0,0,0,0,0),
	('navigation',2463,2460,'admin/build/jqp/%/%','admin/build/jqp/%/%','','a:0:{}','system',-1,0,0,0,0,4,0,2,17,2460,2463,0,0,0,0,0,0),
	('navigation',2464,2460,'admin/build/jqp/%library/%/reset','admin/build/jqp/%library/%/reset','Reset library','a:0:{}','system',-1,0,0,0,0,4,0,2,17,2460,2464,0,0,0,0,0,0),
	('navigation',2465,0,'admin/build/jqp/%/%/remove_file','admin/build/jqp/%/%/remove_file','Reset library','a:0:{}','system',-1,0,0,0,0,1,0,2465,0,0,0,0,0,0,0,0,0),
	('admin_menu',2468,2009,'http://drupal.org/project/issues/jqp','','jQuery Plugin Handler issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2468,0,0,0,0,0,0,0),
	('admin_menu',2469,2009,'http://drupal.org/project/issues/swfupload','','SWFupload Widget issue queue','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,1,0,0,0,3,0,1877,2009,2469,0,0,0,0,0,0,0),
	('navigation',2492,0,'admin/content/node-type/unit/fields/field_unit_craigslist_views/remove','admin/content/node-type/unit/fields/field_unit_craigslist_views/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2492,0,0,0,0,0,0,0,0,0),
	('admin_menu',2494,2404,'admin/content/node-type/unit/fields/field_unit_craigslist_views','admin/content/node-type/unit/fields/field_unit_craigslist_views','Craigslist Views','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2494,0,0,0,0,0),
	('navigation',2495,0,'admin/content/node-type/unit/fields/field_unit_email/remove','admin/content/node-type/unit/fields/field_unit_email/remove','Remove field','a:0:{}','system',-1,0,0,0,0,1,0,2495,0,0,0,0,0,0,0,0,0),
	('admin_menu',2497,2404,'admin/content/node-type/unit/fields/field_unit_email','admin/content/node-type/unit/fields/field_unit_email','Contact Email','a:1:{s:5:\"alter\";b:1;}','admin_menu',0,0,0,0,0,5,0,1880,1894,2073,2404,2497,0,0,0,0,0);

/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_router
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_router`;

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

LOCK TABLES `menu_router` WRITE;
/*!40000 ALTER TABLE `menu_router` DISABLE KEYS */;
INSERT INTO `menu_router` (`path`,`load_functions`,`to_arg_functions`,`access_callback`,`access_arguments`,`page_callback`,`page_arguments`,`fit`,`number_parts`,`tab_parent`,`tab_root`,`title`,`title_callback`,`title_arguments`,`type`,`block_callback`,`description`,`position`,`weight`,`file`)
VALUES
	('node','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_page_default','a:0:{}',1,1,'','node','Content','t','',4,'','','',0,''),
	('search404','','','1','a:0:{}','search404_page','a:0:{}',1,1,'','search404','Page not found','t','',128,'','','',0,''),
	('rss.xml','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_feed','a:0:{}',1,1,'','rss.xml','RSS feed','t','',4,'','','',0,''),
	('robots.txt','','','1','a:0:{}','robotstxt_robots','a:0:{}',1,1,'','robots.txt','','t','',4,'','','',0,''),
	('jqp_ajax_check_file','','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','_jqp_ajax_check_file','a:0:{}',1,1,'','jqp_ajax_check_file','','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('jqp_autocomplete','','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','_jqp_autocomplete','a:0:{}',1,1,'','jqp_autocomplete','','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',1,1,'','admin','Administer','t','',6,'','','',9,'modules/system/system.admin.inc'),
	('imce','','','imce_access','a:0:{}','imce_page','a:0:{}',1,1,'','imce','File browser','t','',4,'','','',0,'sites/all/modules/imce/inc/page.inc'),
	('logout','','','user_is_logged_in','a:0:{}','user_logout','a:0:{}',1,1,'','logout','Log out','t','',6,'','','',10,'modules/user/user.pages.inc'),
	('search','','','user_access','a:1:{i:0;s:14:\"search content\";}','search_view','a:0:{}',1,1,'','search','Search','t','',20,'','','',0,'modules/search/search.pages.inc'),
	('user','','','1','a:0:{}','user_page','a:0:{}',1,1,'','user','User account','t','',4,'','','',0,'modules/user/user.pages.inc'),
	('profile','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','profile_browse','a:0:{}',1,1,'','profile','User list','t','',20,'','','',0,'modules/profile/profile.pages.inc'),
	('swfupload','','','swfupload_upload_access','a:0:{}','swfupload_js','a:0:{}',1,1,'','swfupload','','t','',4,'','','',0,'sites/all/modules/swfupload/swfupload.admin.inc'),
	('batch','','','1','a:0:{}','system_batch_page','a:0:{}',1,1,'','batch','','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('user/login','','','user_is_anonymous','a:0:{}','user_page','a:0:{}',3,2,'user','user','Log in','t','',136,'','','',0,'modules/user/user.pages.inc'),
	('location/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','_location_autocomplete','a:0:{}',3,2,'','location/autocomplete','','t','',4,'','','',0,''),
	('system/files','','','1','a:0:{}','file_download','a:0:{}',3,2,'','system/files','File download','t','',4,'','','',0,''),
	('filefield/progress','','','user_access','a:1:{i:0;s:14:\"access content\";}','filefield_progress','a:0:{}',3,2,'','filefield/progress','','t','',4,'','','',0,''),
	('toboggan/denied','','','1','a:0:{}','logintoboggan_denied','a:0:{}',3,2,'','toboggan/denied','Access denied','t','',4,'','','',0,''),
	('user/timezone','','','1','a:0:{}','user_timezone','a:0:{}',3,2,'','user/timezone','User timezone','t','',4,'','','',0,''),
	('userreference/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','userreference_autocomplete','a:0:{}',3,2,'','userreference/autocomplete','Userreference autocomplete','t','',4,'','','',0,''),
	('admin_menu/flush-cache','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','admin_menu_flush_cache','a:0:{}',3,2,'','admin_menu/flush-cache','','t','',4,'','','',0,'sites/all/modules/admin_menu/admin_menu.inc'),
	('admin_menu/toggle-modules','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','admin_menu_toggle_modules','a:0:{}',3,2,'','admin_menu/toggle-modules','','t','',4,'','','',0,'sites/all/modules/admin_menu/admin_menu.inc'),
	('content/js_add_more','','','user_access','a:1:{i:0;s:14:\"access content\";}','content_add_more_js','a:0:{}',3,2,'','content/js_add_more','','t','',4,'','','',0,'sites/all/modules/cck/includes/content.node_form.inc'),
	('taxonomy/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_autocomplete','a:0:{}',3,2,'','taxonomy/autocomplete','Autocomplete taxonomy','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),
	('admin/by-module','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_by_module','a:0:{}',3,2,'admin','admin','By module','t','',128,'','','',2,'modules/system/system.admin.inc'),
	('admin/by-task','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',3,2,'admin','admin','By task','t','',136,'','','',0,'modules/system/system.admin.inc'),
	('admin/compact','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_compact_page','a:0:{}',3,2,'','admin/compact','Compact mode','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('filter/tips','','','1','a:0:{}','filter_tips_long','a:0:{}',3,2,'','filter/tips','Compose tips','t','',20,'','','',0,'modules/filter/filter.pages.inc'),
	('node/add','','','_node_add_access','a:0:{}','node_add_page','a:0:{}',3,2,'','node/add','Create content','t','',6,'','','',1,'modules/node/node.pages.inc'),
	('admin/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_main','a:0:{}',3,2,'','admin/help','Help','t','',6,'','','',9,'modules/help/help.admin.inc'),
	('nodereference/autocomplete','','','nodereference_autocomplete_access','a:1:{i:0;i:2;}','nodereference_autocomplete','a:0:{}',3,2,'','nodereference/autocomplete','Nodereference autocomplete','t','',4,'','','',0,''),
	('profile/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','profile_autocomplete','a:0:{}',3,2,'','profile/autocomplete','Profile autocomplete','t','',4,'','','',0,'modules/profile/profile.pages.inc'),
	('jqp_stop_message/%','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','jqp_stop_message','a:1:{i:0;i:1;}',2,2,'','jqp_stop_message/%','','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('noderelationships/create','','','_node_add_access','a:0:{}','noderelationships_noderef_page','a:1:{i:0;i:1;}',3,2,'','noderelationships/create','Create and reference','t','',4,'','','',0,'sites/all/modules/noderelationships/noderelationships.pages.inc'),
	('user/register','','','user_register_access','a:0:{}','drupal_get_form','a:1:{i:0;s:13:\"user_register\";}',3,2,'user','user','Create new account','t','',128,'','','',0,'modules/user/user.pages.inc'),
	('user/password','','','user_is_anonymous','a:0:{}','drupal_get_form','a:1:{i:0;s:9:\"user_pass\";}',3,2,'user','user','Request new password','t','',128,'','','',0,'modules/user/user.pages.inc'),
	('noderelationships/noderelationships-backref','','','views_access','a:1:{i:0;b:1;}','views_page','a:2:{i:0;s:25:\"noderelationships_backref\";i:1;s:4:\"page\";}',3,2,'','noderelationships/noderelationships-backref','','t','',4,'','','',0,''),
	('noderelationships/search','','','user_access','a:1:{i:0;s:14:\"access content\";}','noderelationships_noderef_page','a:1:{i:0;i:1;}',3,2,'','noderelationships/search','Search and reference','t','',4,'','','',0,'sites/all/modules/noderelationships/noderelationships.pages.inc'),
	('wysiwyg/%','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','wysiwyg_dialog','a:1:{i:0;i:1;}',2,2,'','wysiwyg/%','','t','',4,'','','',0,'sites/all/modules/wysiwyg/wysiwyg.dialog.inc'),
	('user/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','user_autocomplete','a:0:{}',3,2,'','user/autocomplete','User autocomplete','t','',4,'','','',0,'modules/user/user.pages.inc'),
	('views/ajax','','','1','a:0:{}','views_ajax','a:0:{}',3,2,'','views/ajax','Views','t','',4,'','Ajax callback for view loading.','',0,'sites/all/modules/views/includes/ajax.inc'),
	('admin/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/content','Content management','t','',6,'','Manage your site\'s content.','left',-10,'modules/system/system.admin.inc'),
	('admin/reports','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/reports','Reports','t','',6,'','View reports from system logs and other status information.','left',5,'modules/system/system.admin.inc'),
	('admin/build','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/build','Site building','t','',6,'','Control how your site looks and feels.','right',-10,'modules/system/system.admin.inc'),
	('admin/settings','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_settings_overview','a:0:{}',3,2,'','admin/settings','Site configuration','t','',6,'','Adjust basic site configuration options.','right',-5,'modules/system/system.admin.inc'),
	('admin/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/user','User management','t','',6,'','Manage your site\'s users, groups and access to site features.','left',0,'modules/system/system.admin.inc'),
	('node/%','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',2,2,'','node/%','','node_page_title','a:1:{i:0;i:1;}',4,'','','',0,''),
	('user/%','a:1:{i:1;s:22:\"user_uid_optional_load\";}','a:1:{i:1;s:24:\"user_uid_optional_to_arg\";}','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',2,2,'','user/%','My account','user_page_title','a:1:{i:0;i:1;}',6,'','','',0,'modules/user/user.pages.inc'),
	('node/%/view','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',5,3,'node/%','node/%','View','t','',136,'','','',-10,''),
	('user/%/view','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',5,3,'user/%','user/%','View','t','',136,'','','',-10,'modules/user/user.pages.inc'),
	('admin/user/nodeaccess','','','user_access','a:1:{i:0;s:21:\"administer nodeaccess\";}','nodeaccess_admin','a:0:{}',7,3,'','admin/user/nodeaccess','Nodeaccess','t','',6,'','Change default settings for the Nodeaccess module.','',0,''),
	('js/path_redirect/autocomplete_404','','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','path_redirect_js_autocomplete_404','a:0:{}',7,3,'','js/path_redirect/autocomplete_404','','t','',4,'','','',0,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/settings/actions','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',7,3,'','admin/settings/actions','Actions','t','',6,'','Manage the actions defined for your site.','',0,''),
	('noderelationships/ahah/search','','','user_access','a:1:{i:0;s:14:\"access content\";}','noderelationships_noderef_ahah_search','a:0:{}',7,3,'','noderelationships/ahah/search','Search and reference','t','',4,'','','',0,'sites/all/modules/noderelationships/noderelationships.pages.inc'),
	('admin/user/rules','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',7,3,'','admin/user/rules','Access rules','t','',6,'','List and create rules to disallow usernames, e-mail addresses, and IP addresses.','',0,'modules/user/user.admin.inc'),
	('admin/reports/updates','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',7,3,'','admin/reports/updates','Available updates','t','',6,'','Get a status report about available updates for your installed modules and themes.','',10,'modules/update/update.report.inc'),
	('noderelationships/noderelationships-noderef/page-grid','','','views_access','a:1:{i:0;b:1;}','views_page','a:2:{i:0;s:25:\"noderelationships_noderef\";i:1;s:9:\"page_grid\";}',7,3,'','noderelationships/noderelationships-noderef/page-grid','','t','',4,'','','',0,''),
	('admin/build/block','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',7,3,'','admin/build/block','Blocks','t','',6,'','Configure what block content appears in your site\'s sidebars and other regions.','',0,'modules/block/block.admin.inc'),
	('noderelationships/noderelationships-noderef/page-table','','','views_access','a:1:{i:0;b:1;}','views_page','a:2:{i:0;s:25:\"noderelationships_noderef\";i:1;s:10:\"page_table\";}',7,3,'','noderelationships/noderelationships-noderef/page-table','','t','',4,'','','',0,''),
	('admin/settings/currency_api','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"currency_api_admin_settings\";}',7,3,'','admin/settings/currency_api','Currency API','t','',6,'','Settings for currency API.','',0,''),
	('node/%/grant','a:1:{i:1;s:9:\"node_load\";}','','nodeaccess_access','a:2:{i:0;s:5:\"grant\";i:1;i:1;}','nodeaccess_grants','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Grant','t','',128,'','','',5,''),
	('admin/settings/imce','','','user_access','a:1:{i:0;s:28:\"administer imce(execute PHP)\";}','imce_admin','a:0:{}',7,3,'','admin/settings/imce','IMCE','t','',6,'','Control how your image/file browser works.','',0,'sites/all/modules/imce/inc/admin.inc'),
	('admin/settings/imageapi','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:17:\"imageapi_settings\";}',7,3,'','admin/settings/imageapi','ImageAPI','t','',6,'','Configure ImageAPI.','',0,''),
	('user/%/inbode','a:1:{i:1;s:9:\"user_load\";}','','_inbode_access','a:1:{i:0;i:1;}','inbode_summary','a:1:{i:0;i:1;}',5,3,'user/%','user/%','Inbode','t','',128,'','','',0,''),
	('admin/build/jqp','','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','jqp_status_page','a:0:{}',7,3,'','admin/build/jqp','Javascript libraries','t','',6,'','Administer javascript libraries.','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/settings/logging','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_logging_overview','a:0:{}',7,3,'','admin/settings/logging','Logging and alerts','t','',6,'','Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.','',0,'modules/system/system.admin.inc'),
	('admin/user/login_destination','','','user_access','a:1:{i:0;s:28:\"administer login destination\";}','drupal_get_form','a:1:{i:0;s:32:\"login_destination_admin_settings\";}',7,3,'','admin/user/login_destination','Login Destination','t','',6,'','Control where users are redirected to, once they login.','',0,''),
	('toboggan/revalidate/%','a:1:{i:2;s:9:\"user_load\";}','','logintoboggan_revalidate_access','a:1:{i:0;i:2;}','logintoboggan_resend_validation','a:1:{i:0;i:2;}',6,3,'','toboggan/revalidate/%','Re-send validation e-mail','t','',4,'','','',0,''),
	('admin/reports/dblog','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_overview','a:0:{}',7,3,'','admin/reports/dblog','Recent log entries','t','',6,'','View events that have recently been logged.','',-1,'modules/dblog/dblog.admin.inc'),
	('admin/reports/status','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_status','a:0:{}',7,3,'','admin/reports/status','Status report','t','',6,'','Get a status report about your site\'s operation and any detected problems.','',10,'modules/system/system.admin.inc'),
	('taxonomy/term/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}',6,3,'','taxonomy/term/%','Taxonomy term','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),
	('admin/build/path','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_overview','a:0:{}',7,3,'','admin/build/path','URL aliases','t','',6,'','Change your site\'s URL paths by aliasing them.','',0,'modules/path/path.admin.inc'),
	('admin/help/admin_menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/admin_menu','admin_menu','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/block','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/block','block','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/content','content','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/currency_api','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/currency_api','currency_api','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/date','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/date','date','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/dblog','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/dblog','dblog','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/filter','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/filter','filter','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/format_number','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/format_number','format_number','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/getid3','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/getid3','getid3','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/globalredirect','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/globalredirect','globalredirect','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/help','help','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/settings/jquery_update','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:22:\"jquery_update_settings\";}',7,3,'','admin/settings/jquery_update','jQuery Update','t','',6,'','Configure settings for jQuery Update module.','',0,''),
	('admin/help/jqp','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/jqp','jqp','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/location','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/location','location','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/logintoboggan','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/logintoboggan','logintoboggan','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/menu','menu','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/node','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/node','node','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/nodeaccess','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/nodeaccess','nodeaccess','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/path','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/path','path','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/path_redirect','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/path_redirect','path_redirect','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/pathauto','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/pathauto','pathauto','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/php','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/php','php','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/prepopulate','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/prepopulate','prepopulate','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/profile','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/profile','profile','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/robotstxt','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/robotstxt','robotstxt','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/search','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/search','search','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/system','system','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/taxonomy','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/taxonomy','taxonomy','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/token','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/token','token','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/typogrify','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/typogrify','typogrify','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/update','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/update','update','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/user','user','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/help/wysiwyg','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/wysiwyg','wysiwyg','t','',4,'','','',0,'modules/help/help.admin.inc'),
	('admin/settings/admin_menu','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"admin_menu_theme_settings\";}',7,3,'','admin/settings/admin_menu','Administration menu','t','',6,'','Adjust administration menu settings.','',0,'sites/all/modules/admin_menu/admin_menu.inc'),
	('admin/settings/clean-urls','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_clean_url_settings\";}',7,3,'','admin/settings/clean-urls','Clean URLs','t','',6,'','Enable or disable clean URLs for your site.','',0,'modules/system/system.admin.inc'),
	('admin/content/node','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',7,3,'','admin/content/node','Content','t','',6,'','View, edit, and delete your site\'s content.','',0,'modules/node/node.admin.inc'),
	('admin/content/types','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_types_overview','a:0:{}',7,3,'','admin/content/types','Content types','t','',6,'','Manage posts by content type, including default status, front page promotion, etc.','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/settings/date_popup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:19:\"date_popup_settings\";}',7,3,'','admin/settings/date_popup','Date Popup Configuration','t','',6,'','Allows the user to configure the Date Popup settings.','',0,''),
	('admin/settings/date-time','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',7,3,'','admin/settings/date-time','Date and time','t','',6,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),
	('node/%/delete','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"delete\";i:1;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"node_delete_confirm\";i:1;i:1;}',5,3,'','node/%/delete','Delete','t','',4,'','','',1,'modules/node/node.pages.inc'),
	('user/%/delete','a:1:{i:1;s:9:\"user_load\";}','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:2:{i:0;s:19:\"user_confirm_delete\";i:1;i:1;}',5,3,'','user/%/delete','Delete','t','',4,'','','',0,'modules/user/user.pages.inc'),
	('node/%/edit','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"update\";i:1;i:1;}','node_page_edit','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Edit','t','',128,'','','',1,'modules/node/node.pages.inc'),
	('admin/settings/error-reporting','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:31:\"system_error_reporting_settings\";}',7,3,'','admin/settings/error-reporting','Error reporting','t','',6,'','Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.','',0,'modules/system/system.admin.inc'),
	('user/%/imce','a:1:{i:1;s:9:\"user_load\";}','','imce_user_page_access','a:1:{i:0;i:1;}','imce_user_page','a:1:{i:0;i:1;}',5,3,'user/%','user/%','File browser','t','',128,'','','',10,'sites/all/modules/imce/inc/page.inc'),
	('admin/settings/file-system','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_file_system_settings\";}',7,3,'','admin/settings/file-system','File system','t','',6,'','Tell Drupal where to store uploaded files and how they are accessed.','',0,'modules/system/system.admin.inc'),
	('admin/settings/image-toolkit','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"system_image_toolkit_settings\";}',7,3,'','admin/settings/image-toolkit','Image toolkit','t','',6,'','Choose which image toolkit to use if you have installed optional toolkits.','',0,'modules/system/system.admin.inc'),
	('admin/settings/filters','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',7,3,'','admin/settings/filters','Input formats','t','',6,'','Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.','',0,'modules/filter/filter.admin.inc'),
	('admin/settings/location','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"location_admin_settings\";}',7,3,'','admin/settings/location','Location','t','',6,'','Settings for Location module','',0,'sites/all/modules/location/location.admin.inc'),
	('admin/user/logintoboggan','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"logintoboggan_main_settings\";}',7,3,'','admin/user/logintoboggan','LoginToboggan','t','',6,'','Set up custom login options like instant login, login redirects, pre-authorized validation roles, etc.','',0,''),
	('admin/build/menu','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',7,3,'','admin/build/menu','Menus','t','',6,'','Control your site\'s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.','',0,'modules/menu/menu.admin.inc'),
	('admin/build/modules','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',7,3,'','admin/build/modules','Modules','t','',6,'','Enable or disable add-on modules for your site.','',0,'modules/system/system.admin.inc'),
	('admin/settings/format_number','','','user_access','a:1:{i:0;s:31:\"configure default number format\";}','drupal_get_form','a:1:{i:0;s:27:\"format_number_settings_site\";}',7,3,'','admin/settings/format_number','Number format','t','',6,'','Configure site wide number format settings.','',0,'sites/all/modules/format_number/format_number.settings.inc'),
	('admin/settings/performance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_performance_settings\";}',7,3,'','admin/settings/performance','Performance','t','',6,'','Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.','',0,'modules/system/system.admin.inc'),
	('admin/user/permissions','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_perm\";}',7,3,'','admin/user/permissions','Permissions','t','',6,'','Determine access to features by selecting permissions for roles.','',0,'modules/user/user.admin.inc'),
	('admin/content/node-settings','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:14:\"node_configure\";}',7,3,'','admin/content/node-settings','Post settings','t','',6,'','Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.','',0,'modules/node/node.admin.inc'),
	('admin/user/profile','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:22:\"profile_admin_overview\";}',7,3,'','admin/user/profile','Profiles','t','',6,'','Create customizable fields for your users.','',0,'modules/profile/profile.admin.inc'),
	('admin/content/rss-publishing','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_rss_feeds_settings\";}',7,3,'','admin/content/rss-publishing','RSS publishing','t','',6,'','Configure the number of items per feed and whether feeds should be titles/teasers/full-text.','',0,'modules/system/system.admin.inc'),
	('node/%/relationships','a:1:{i:1;s:9:\"node_load\";}','','noderelationships_backref_access','a:1:{i:0;i:1;}','noderelationships_backref_page','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Relationships','t','',128,'','','',10,'sites/all/modules/noderelationships/noderelationships.pages.inc'),
	('node/%/revisions','a:1:{i:1;s:9:\"node_load\";}','','_node_revision_access','a:1:{i:0;i:1;}','node_revision_overview','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Revisions','t','',128,'','','',2,'modules/node/node.pages.inc'),
	('admin/settings/robotstxt','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"robotstxt_admin_settings\";}',7,3,'','admin/settings/robotstxt','RobotsTxt','t','',6,'','Manage your robots.txt file.','',0,'sites/all/modules/robotstxt/robotstxt.admin.inc'),
	('admin/user/roles','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_new_role\";}',7,3,'','admin/user/roles','Roles','t','',6,'','List, edit, or add user roles.','',0,'modules/user/user.admin.inc'),
	('admin/settings/search404','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:18:\"search404_settings\";}',7,3,'','admin/settings/search404','Search 404 settings','t','',6,'','Administer search 404.','',0,''),
	('admin/settings/search','','','user_access','a:1:{i:0;s:17:\"administer search\";}','drupal_get_form','a:1:{i:0;s:21:\"search_admin_settings\";}',7,3,'','admin/settings/search','Search settings','t','',6,'','Configure relevance settings for search and other indexing options','',0,'modules/search/search.admin.inc'),
	('admin/settings/site-information','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_information_settings\";}',7,3,'','admin/settings/site-information','Site information','t','',6,'','Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.','',0,'modules/system/system.admin.inc'),
	('admin/settings/site-maintenance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_maintenance_settings\";}',7,3,'','admin/settings/site-maintenance','Site maintenance','t','',6,'','Take the site off-line for maintenance or bring it back online.','',0,'modules/system/system.admin.inc'),
	('admin/content/taxonomy','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',7,3,'','admin/content/taxonomy','Taxonomy','t','',6,'','Manage tagging, categorization, and classification of your content.','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/build/themes','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',7,3,'','admin/build/themes','Themes','t','',6,'','Change which theme your site uses or allows users to set.','',0,'modules/system/system.admin.inc'),
	('admin/reports/access-denied','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:13:\"access denied\";}',7,3,'','admin/reports/access-denied','Top \'access denied\' errors','t','',6,'','View \'access denied\' errors (403s).','',0,'modules/dblog/dblog.admin.inc'),
	('admin/reports/page-not-found','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:14:\"page not found\";}',7,3,'','admin/reports/page-not-found','Top \'page not found\' errors','t','',6,'','View \'page not found\' errors (404s).','',0,'modules/dblog/dblog.admin.inc'),
	('admin/build/path-redirect','','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:1:{i:0;s:29:\"path_redirect_admin_redirects\";}',7,3,'','admin/build/path-redirect','URL redirects','t','',6,'','Redirect users from one URL to another.','',0,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/user/settings','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}',7,3,'','admin/user/settings','User settings','t','',6,'','Configure default behavior of users, including registration requirements, e-mails, and user pictures.','',0,'modules/user/user.admin.inc'),
	('admin/user/user','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',7,3,'','admin/user/user','Users','t','',6,'','List, add, and edit users.','',0,'modules/user/user.admin.inc'),
	('admin/settings/wysiwyg','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:24:\"wysiwyg_profile_overview\";}',7,3,'','admin/settings/wysiwyg','Wysiwyg profiles','t','',6,'','Configure client-side editors.','',0,'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
	('admin/settings/getid3','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:26:\"getid3_admin_settings_form\";i:1;N;}',7,3,'','admin/settings/getid3','getID3()','t','',6,'','Configure settings associated with getID3().','',0,'sites/all/modules/getid3/getid3.admin.inc'),
	('user/%/edit','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',5,3,'user/%','user/%','Edit','t','',128,'','','',0,'modules/user/user.pages.inc'),
	('admin/settings/globalredirect','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"globalredirect_settings\";}',7,3,'','admin/settings/globalredirect','Global Redirect','t','',6,'','Chose which features you would like enabled for Global Redirect','',0,'sites/all/modules/globalredirect/globalredirect.admin.inc'),
	('admin/reports/search','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:6:\"search\";}',7,3,'','admin/reports/search','Top search phrases','t','',6,'','View most popular search phrases.','',0,'modules/dblog/dblog.admin.inc'),
	('admin/settings/admin','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_admin_theme_settings\";}',7,3,'','admin/settings/admin','Administration theme','t','',6,'system_admin_theme_settings','Settings for how your administrative pages should look.','left',0,'modules/system/system.admin.inc'),
	('node/add/building','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:8:\"building\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/building','Building','check_plain','',6,'','A building, containing units.','',0,'modules/node/node.pages.inc'),
	('node/add/page','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"page\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/page','Page','check_plain','',6,'','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',0,'modules/node/node.pages.inc'),
	('node/add/unit','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"unit\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/unit','Unit','check_plain','',6,'','A unit as part of a building.','',0,'modules/node/node.pages.inc'),
	('search/location/%','a:1:{i:2;N;}','a:1:{i:2;s:16:\"menu_tail_to_arg\";}','_search_menu','a:1:{i:0;s:8:\"location\";}','search_view','a:1:{i:0;s:8:\"location\";}',6,3,'search','search','','module_invoke','a:4:{i:0;s:8:\"location\";i:1;s:6:\"search\";i:2;s:4:\"name\";i:3;b:1;}',128,'','','',0,'modules/search/search.pages.inc'),
	('search/node/%','a:1:{i:2;N;}','a:1:{i:2;s:16:\"menu_tail_to_arg\";}','_search_menu','a:1:{i:0;s:4:\"node\";}','search_view','a:1:{i:0;s:4:\"node\";}',6,3,'search','search','','module_invoke','a:4:{i:0;s:4:\"node\";i:1;s:6:\"search\";i:2;s:4:\"name\";i:3;b:1;}',128,'','','',0,'modules/search/search.pages.inc'),
	('search/user/%','a:1:{i:2;N;}','a:1:{i:2;s:16:\"menu_tail_to_arg\";}','_search_menu','a:1:{i:0;s:4:\"user\";}','search_view','a:1:{i:0;s:4:\"user\";}',6,3,'search','search','','module_invoke','a:4:{i:0;s:4:\"user\";i:1;s:6:\"search\";i:2;s:4:\"name\";i:3;b:1;}',128,'','','',0,'modules/search/search.pages.inc'),
	('admin/build/block/list','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',15,4,'admin/build/block','admin/build/block','List','t','',136,'','','',-10,'modules/block/block.admin.inc'),
	('admin/content/node/overview','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',15,4,'admin/content/node','admin/content/node','List','t','',136,'','','',-10,'modules/node/node.admin.inc'),
	('admin/content/types/list','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_types_overview','a:0:{}',15,4,'admin/content/types','admin/content/types','List','t','',136,'','','',-10,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/path/list','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_overview','a:0:{}',15,4,'admin/build/path','admin/build/path','List','t','',136,'','','',-10,'modules/path/path.admin.inc'),
	('admin/build/path-redirect/list','','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:1:{i:0;s:29:\"path_redirect_admin_redirects\";}',15,4,'admin/build/path-redirect','admin/build/path-redirect','List','t','',136,'','','',-10,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/content/taxonomy/list','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',15,4,'admin/content/taxonomy','admin/content/taxonomy','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/user/rules/list','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',15,4,'admin/user/rules','admin/user/rules','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),
	('admin/user/user/list','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',15,4,'admin/user/user','admin/user/user','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),
	('admin/settings/imageapi/list','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:17:\"imageapi_settings\";}',15,4,'admin/settings/imageapi','admin/settings/imageapi','List','t','',136,'','','',-1,''),
	('admin/settings/filters/list','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',15,4,'admin/settings/filters','admin/settings/filters','List','t','',136,'','','',0,'modules/filter/filter.admin.inc'),
	('admin/build/modules/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',15,4,'admin/build/modules','admin/build/modules','List','t','',136,'','','',0,'modules/system/system.admin.inc'),
	('admin/settings/wysiwyg/profile','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:24:\"wysiwyg_profile_overview\";}',15,4,'admin/settings/wysiwyg','admin/settings/wysiwyg','List','t','',136,'','','',0,'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
	('admin/settings/location/main','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"location_admin_settings\";}',15,4,'admin/settings/location','admin/settings/location','Main settings','t','',136,'','','',0,'sites/all/modules/location/location.admin.inc'),
	('admin/settings/imce/profiles','','','user_access','a:1:{i:0;s:28:\"administer imce(execute PHP)\";}','imce_admin','a:0:{}',15,4,'admin/settings/imce','admin/settings/imce','Settings','t','',136,'','','',0,'sites/all/modules/imce/inc/admin.inc'),
	('user/%/edit/account','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',11,4,'user/%/edit','user/%','Account','t','',136,'','','',0,'modules/user/user.pages.inc'),
	('admin/build/themes/select','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',15,4,'admin/build/themes','admin/build/themes','List','t','',136,'','Select the default theme.','',-1,'modules/system/system.admin.inc'),
	('admin/build/menu/list','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',15,4,'admin/build/menu','admin/build/menu','List menus','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),
	('admin/build/themes/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',15,4,'admin/build/themes','admin/build/themes','Configure','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/settings/actions/manage','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',15,4,'admin/settings/actions','admin/settings/actions','Manage actions','t','',136,'','Manage the actions defined for your site.','',-2,''),
	('admin/settings/actions/orphan','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_remove_orphans','a:0:{}',15,4,'','admin/settings/actions/orphan','Remove orphans','t','',4,'','','',0,''),
	('admin/build/modules/uninstall','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',15,4,'admin/build/modules','admin/build/modules','Uninstall','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/path/add','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_edit','a:0:{}',15,4,'admin/build/path','admin/build/path','Add alias','t','',128,'','','',0,'modules/path/path.admin.inc'),
	('admin/settings/filters/add','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:0:{}',15,4,'admin/settings/filters','admin/settings/filters','Add input format','t','',128,'','','',1,'modules/filter/filter.admin.inc'),
	('admin/settings/imce/profile','','','user_access','a:1:{i:0;s:28:\"administer imce(execute PHP)\";}','imce_profile_operations','a:0:{}',15,4,'','admin/settings/imce/profile','Add new profile','t','',4,'','','',0,'sites/all/modules/imce/inc/admin.inc'),
	('admin/user/rules/add','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_add','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Add rule','t','',128,'','','',0,'modules/user/user.admin.inc'),
	('admin/user/user/create','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:6:\"create\";}',15,4,'admin/user/user','admin/user/user','Add user','t','',128,'','','',0,'modules/user/user.admin.inc'),
	('admin/user/rules/check','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_check','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Check rules','t','',128,'','','',0,'modules/user/user.admin.inc'),
	('admin/settings/clean-urls/check','','','1','a:0:{}','drupal_json','a:1:{i:0;a:1:{s:6:\"status\";b:1;}}',15,4,'','admin/settings/clean-urls/check','Clean URL check','t','',4,'','','',0,''),
	('admin/settings/imageapi/config','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:25:\"imageapi_gd_settings_form\";}',15,4,'admin/settings/imageapi','admin/settings/imageapi','Configure','t','',128,'','','',0,''),
	('admin/settings/actions/configure','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:1:{i:0;s:24:\"system_actions_configure\";}',15,4,'','admin/settings/actions/configure','Configure an advanced action','t','',4,'','','',0,''),
	('admin/settings/date-time/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_lookup','a:0:{}',15,4,'','admin/settings/date-time/lookup','Date and time lookup','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/path/edit','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','path_admin_edit','a:0:{}',15,4,'','admin/build/path/edit','Edit alias','t','',4,'','','',0,'modules/path/path.admin.inc'),
	('admin/user/roles/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_role\";}',15,4,'','admin/user/roles/edit','Edit role','t','',4,'','','',0,'modules/user/user.admin.inc'),
	('admin/user/rules/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_edit','a:0:{}',15,4,'','admin/user/rules/edit','Edit rule','t','',4,'','','',0,'modules/user/user.admin.inc'),
	('admin/content/types/export','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:24:\"content_copy_export_form\";}',15,4,'admin/content/types','admin/content/types','Export','t','',128,'','','',3,''),
	('admin/content/types/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','content_fields_list','a:0:{}',15,4,'admin/content/types','admin/content/types','Fields','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/types/import','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:24:\"content_copy_import_form\";}',15,4,'admin/content/types','admin/content/types','Import','t','',128,'','','',4,''),
	('admin/reports/updates/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',15,4,'admin/reports/updates','admin/reports/updates','List','t','',136,'','','',0,'modules/update/update.report.inc'),
	('admin/reports/updates/check','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_manual_status','a:0:{}',15,4,'','admin/reports/updates/check','Manual update check','t','',4,'','','',0,'modules/update/update.fetch.inc'),
	('admin/reports/status/php','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_php','a:0:{}',15,4,'','admin/reports/status/php','PHP','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/user/profile/autocomplete','','','user_access','a:1:{i:0;s:16:\"administer users\";}','profile_admin_settings_autocomplete','a:0:{}',15,4,'','admin/user/profile/autocomplete','Profile category autocomplete','t','',4,'','','',0,'modules/profile/profile.admin.inc'),
	('admin/content/node-settings/rebuild','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','drupal_get_form','a:1:{i:0;s:30:\"node_configure_rebuild_confirm\";}',15,4,'','admin/content/node-settings/rebuild','Rebuild permissions','t','',4,'','','',0,'modules/node/node.admin.inc'),
	('admin/reports/status/run-cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_run_cron','a:0:{}',15,4,'','admin/reports/status/run-cron','Run cron','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/reports/status/sql','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_sql','a:0:{}',15,4,'','admin/reports/status/sql','SQL','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/block/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}',15,4,'admin/build/block','admin/build/block','Add block','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/content/types/add','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:14:\"node_type_form\";}',15,4,'admin/content/types','admin/content/types','Add content type','t','',128,'','','',0,'modules/node/content_types.inc'),
	('admin/user/profile/add','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:18:\"profile_field_form\";}',15,4,'','admin/user/profile/add','Add field','t','',4,'','','',0,'modules/profile/profile.admin.inc'),
	('admin/build/menu/add','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:14:\"menu_edit_menu\";i:1;s:3:\"add\";}',15,4,'admin/build/menu','admin/build/menu','Add menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/build/path/pathauto','','','user_access','a:1:{i:0;s:19:\"administer pathauto\";}','drupal_get_form','a:1:{i:0;s:23:\"pathauto_admin_settings\";}',15,4,'admin/build/path','admin/build/path','Automated alias settings','t','',128,'','','',10,'sites/all/modules/pathauto/pathauto.admin.inc'),
	('admin/content/node-type/building','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:8:\"building\";s:4:\"name\";s:8:\"Building\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A building, containing units.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:13:\"Building Name\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',15,4,'','admin/content/node-type/building','Building','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/settings/search/wipe','','','user_access','a:1:{i:0;s:17:\"administer search\";}','drupal_get_form','a:1:{i:0;s:19:\"search_wipe_confirm\";}',15,4,'','admin/settings/search/wipe','Clear index','t','',4,'','','',0,'modules/search/search.admin.inc'),
	('admin/build/block/configure','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:21:\"block_admin_configure\";}',15,4,'','admin/build/block/configure','Configure block','t','',4,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/path/delete','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','drupal_get_form','a:1:{i:0;s:25:\"path_admin_delete_confirm\";}',15,4,'','admin/build/path/delete','Delete alias','t','',4,'','','',0,'modules/path/path.admin.inc'),
	('admin/build/path/delete_bulk','','','user_access','a:1:{i:0;s:22:\"administer url aliases\";}','drupal_get_form','a:1:{i:0;s:21:\"pathauto_admin_delete\";}',15,4,'admin/build/path','admin/build/path','Delete aliases','t','',128,'','','',30,'sites/all/modules/pathauto/pathauto.admin.inc'),
	('admin/build/block/delete','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:16:\"block_box_delete\";}',15,4,'','admin/build/block/delete','Delete block','t','',4,'','','',0,'modules/block/block.admin.inc'),
	('admin/user/profile/delete','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:20:\"profile_field_delete\";}',15,4,'','admin/user/profile/delete','Delete field','t','',4,'','','',0,'modules/profile/profile.admin.inc'),
	('admin/settings/filters/delete','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:19:\"filter_admin_delete\";}',15,4,'','admin/settings/filters/delete','Delete input format','t','',4,'','','',0,'modules/filter/filter.admin.inc'),
	('admin/user/rules/delete','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:32:\"user_admin_access_delete_confirm\";}',15,4,'','admin/user/rules/delete','Delete rule','t','',4,'','','',0,'modules/user/user.admin.inc'),
	('admin/reports/event/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_event','a:1:{i:0;i:3;}',14,4,'','admin/reports/event/%','Details','t','',4,'','','',0,'modules/dblog/dblog.admin.inc'),
	('admin/settings/imce/subdirectory','','','user_access','a:1:{i:0;s:28:\"administer imce(execute PHP)\";}','drupal_get_form','a:1:{i:0;s:22:\"imce_form_subdirectory\";}',15,4,'admin/settings/imce','admin/settings/imce','Directory creation tool','t','',128,'','','',1,'sites/all/modules/imce/inc/subdir.inc'),
	('admin/user/profile/edit','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:18:\"profile_field_form\";}',15,4,'','admin/user/profile/edit','Edit field','t','',4,'','','',0,'modules/profile/profile.admin.inc'),
	('admin/settings/location/geocoding','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:31:\"location_geocoding_options_form\";}',15,4,'admin/settings/location','admin/settings/location','Geocoding options','t','',128,'','','',2,'sites/all/modules/location/location.admin.inc'),
	('admin/content/taxonomy/%','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',14,4,'','admin/content/taxonomy/%','List terms','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/settings/location/util','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:18:\"location_util_form\";}',15,4,'admin/settings/location','admin/settings/location','Location utilities','t','',128,'','','',3,'sites/all/modules/location/location.admin.inc'),
	('admin/settings/location/maplinking','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:30:\"location_map_link_options_form\";}',15,4,'admin/settings/location','admin/settings/location','Map links','t','',128,'','','',1,'sites/all/modules/location/location.admin.inc'),
	('admin/content/node-type/page','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',15,4,'','admin/content/node-type/page','Page','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/build/jqp/rebuild_confirm','','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:1:{i:0;s:16:\"jqp_confirm_form\";}',15,4,'','admin/build/jqp/rebuild_confirm','Reset all libraries','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/build/menu/settings','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:1:{i:0;s:14:\"menu_configure\";}',15,4,'admin/build/menu','admin/build/menu','Settings','t','',128,'','','',5,'modules/menu/menu.admin.inc'),
	('admin/reports/updates/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:15:\"update_settings\";}',15,4,'admin/reports/updates','admin/reports/updates','Settings','t','',128,'','','',0,'modules/update/update.settings.inc'),
	('admin/content/node-type/unit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"unit\";s:4:\"name\";s:4:\"Unit\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A unit as part of a building.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:11:\"Unit Number\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',15,4,'','admin/content/node-type/unit','Unit','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/build/path-redirect/add','','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:1:{i:0;s:23:\"path_redirect_edit_form\";}',15,4,'admin/build/path-redirect','admin/build/path-redirect','Add redirect','t','',128,'','Add a new URL redirect.','',0,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/settings/logging/dblog','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"dblog_admin_settings\";}',15,4,'','admin/settings/logging/dblog','Database logging','t','',6,'','Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.','',0,'modules/dblog/dblog.admin.inc'),
	('admin/settings/date-time/configure','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',15,4,'admin/settings/date-time','admin/settings/date-time','Date and time','t','',136,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),
	('admin/settings/date-time/formats','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:26:\"date_api_date_formats_form\";}',15,4,'admin/settings/date-time','admin/settings/date-time','Formats','t','',128,'','Allow users to configure date formats','',1,'sites/all/modules/date/date_api.admin.inc'),
	('admin/build/path-redirect/settings','','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:1:{i:0;s:27:\"path_redirect_settings_form\";}',15,4,'admin/build/path-redirect','admin/build/path-redirect','Settings','t','',128,'','Configure behavior for URL redirects.','',10,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/settings/filters/%','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',14,4,'','admin/settings/filters/%','','filter_admin_format_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/filter/filter.admin.inc'),
	('admin/build/menu-customize/%','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',14,4,'','admin/build/menu-customize/%','Customize menu','menu_overview_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/content/node-type/building/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:8:\"building\";s:4:\"name\";s:8:\"Building\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A building, containing units.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:13:\"Building Name\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',31,5,'admin/content/node-type/building','admin/content/node-type/building','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),
	('admin/content/node-type/page/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),
	('admin/content/node-type/unit/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"unit\";s:4:\"name\";s:4:\"Unit\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A unit as part of a building.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:11:\"Unit Number\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',31,5,'admin/content/node-type/unit','admin/content/node-type/unit','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),
	('admin/build/themes/settings/global','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',31,5,'admin/build/themes/settings','admin/build/themes','Global settings','t','',136,'','','',-1,'modules/system/system.admin.inc'),
	('admin/content/taxonomy/%/list','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',29,5,'admin/content/taxonomy/%','admin/content/taxonomy/%','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/settings/filters/%/edit','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Edit','t','',136,'','','',0,'modules/filter/filter.admin.inc'),
	('admin/build/modules/list/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',31,5,'','admin/build/modules/list/confirm','List','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/menu-customize/%/list','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','List items','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),
	('admin/build/modules/uninstall/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',31,5,'','admin/build/modules/uninstall/confirm','Uninstall','t','',4,'','','',0,'modules/system/system.admin.inc'),
	('admin/settings/date-time/formats/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','date_api_date_time_lookup','a:0:{}',31,5,'','admin/settings/date-time/formats/lookup','Date and time lookup','t','',4,'','','',0,''),
	('admin/build/themes/settings/bluemarine','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/bluemarine/bluemarine.info\";s:4:\"name\";s:10:\"bluemarine\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:10:\"bluemarine\";}',31,5,'admin/build/themes/settings','admin/build/themes','Bluemarine','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/chameleon','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":11:{s:8:\"filename\";s:31:\"themes/chameleon/chameleon.info\";s:4:\"name\";s:9:\"chameleon\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:32:\"themes/chameleon/chameleon.theme\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:9:\"chameleon\";}',31,5,'admin/build/themes/settings','admin/build/themes','Chameleon','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/content/node-type/building/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:8:\"building\";s:4:\"name\";s:8:\"Building\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A building, containing units.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:13:\"Building Name\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',31,5,'','admin/content/node-type/building/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/content/node-type/page/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'','admin/content/node-type/page/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/content/node-type/unit/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"unit\";s:4:\"name\";s:4:\"Unit\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:29:\"A unit as part of a building.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:11:\"Unit Number\";s:8:\"has_body\";s:1:\"0\";s:10:\"body_label\";s:0:\"\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:0:\"\";}}',31,5,'','admin/content/node-type/unit/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),
	('admin/content/taxonomy/edit/term','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_term_edit','a:0:{}',31,5,'','admin/content/taxonomy/edit/term','Edit term','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/build/themes/settings/garland','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:7:\"garland\";}',31,5,'admin/build/themes/settings','admin/build/themes','Garland','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/block/list/js','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display_js','a:0:{}',31,5,'','admin/build/block/list/js','JavaScript List Form','t','',4,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/themes/settings/marvin','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:35:\"themes/chameleon/marvin/marvin.info\";s:4:\"name\";s:6:\"marvin\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:10:\"base_theme\";s:9:\"chameleon\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:6:\"marvin\";}',31,5,'admin/build/themes/settings','admin/build/themes','Marvin','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/minnelli','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:8:\"minnelli\";}',31,5,'admin/build/themes/settings','admin/build/themes','Minnelli','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/pushbutton','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/pushbutton/pushbutton.info\";s:4:\"name\";s:10:\"pushbutton\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:10:\"pushbutton\";}',31,5,'admin/build/themes/settings','admin/build/themes','Pushbutton','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/zen','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"sites/all/themes/zen/zen/zen.info\";s:4:\"name\";s:3:\"zen\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:15:{s:4:\"name\";s:3:\"Zen\";s:11:\"description\";s:41:\"The ultimate starting theme for Drupal 6.\";s:10:\"screenshot\";s:39:\"sites/all/themes/zen/zen/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:6:{s:17:\"html-elements.css\";s:42:\"sites/all/themes/zen/zen/html-elements.css\";s:8:\"tabs.css\";s:33:\"sites/all/themes/zen/zen/tabs.css\";s:12:\"messages.css\";s:37:\"sites/all/themes/zen/zen/messages.css\";s:17:\"block-editing.css\";s:42:\"sites/all/themes/zen/zen/block-editing.css\";s:14:\"wireframes.css\";s:39:\"sites/all/themes/zen/zen/wireframes.css\";s:7:\"zen.css\";s:32:\"sites/all/themes/zen/zen/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:34:\"sites/all/themes/zen/zen/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:9:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:34:\"sites/all/themes/zen/zen/script.js\";}s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:6:{s:17:\"html-elements.css\";s:42:\"sites/all/themes/zen/zen/html-elements.css\";s:8:\"tabs.css\";s:33:\"sites/all/themes/zen/zen/tabs.css\";s:12:\"messages.css\";s:37:\"sites/all/themes/zen/zen/messages.css\";s:17:\"block-editing.css\";s:42:\"sites/all/themes/zen/zen/block-editing.css\";s:14:\"wireframes.css\";s:39:\"sites/all/themes/zen/zen/wireframes.css\";s:7:\"zen.css\";s:32:\"sites/all/themes/zen/zen/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:34:\"sites/all/themes/zen/zen/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:3:\"zen\";}',31,5,'admin/build/themes/settings','admin/build/themes','Zen','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/zen_classic','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/zen/zen_classic/zen_classic.info\";s:4:\"name\";s:11:\"zen_classic\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:11:\"Zen Classic\";s:11:\"description\";s:97:\"Zen sub-theme based on <a href=\"http://www.oswd.org/design/preview/id/2634\">Deliciously Blue</a>.\";s:10:\"screenshot\";s:47:\"sites/all/themes/zen/zen_classic/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:18:\"layout-garland.css\";s:51:\"sites/all/themes/zen/zen_classic/layout-garland.css\";s:17:\"html-elements.css\";s:50:\"sites/all/themes/zen/zen_classic/html-elements.css\";s:9:\"icons.css\";s:42:\"sites/all/themes/zen/zen_classic/icons.css\";s:15:\"zen-classic.css\";s:48:\"sites/all/themes/zen/zen_classic/zen-classic.css\";s:12:\"messages.css\";s:45:\"sites/all/themes/zen/zen_classic/messages.css\";s:14:\"wireframes.css\";s:47:\"sites/all/themes/zen/zen_classic/wireframes.css\";s:7:\"zen.css\";s:40:\"sites/all/themes/zen/zen_classic/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:42:\"sites/all/themes/zen/zen_classic/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:10:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:8:\" :&#58; \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"0\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:17:\"zen_classic_fixed\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:42:\"sites/all/themes/zen/zen_classic/script.js\";}s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:18:\"layout-garland.css\";s:51:\"sites/all/themes/zen/zen_classic/layout-garland.css\";s:17:\"html-elements.css\";s:50:\"sites/all/themes/zen/zen_classic/html-elements.css\";s:9:\"icons.css\";s:42:\"sites/all/themes/zen/zen_classic/icons.css\";s:15:\"zen-classic.css\";s:48:\"sites/all/themes/zen/zen_classic/zen-classic.css\";s:12:\"messages.css\";s:45:\"sites/all/themes/zen/zen_classic/messages.css\";s:14:\"wireframes.css\";s:47:\"sites/all/themes/zen/zen_classic/wireframes.css\";s:7:\"zen.css\";s:40:\"sites/all/themes/zen/zen_classic/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:42:\"sites/all/themes/zen/zen_classic/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:11:\"zen_classic\";}',31,5,'admin/build/themes/settings','admin/build/themes','Zen Classic','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/STARTERKIT','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:47:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.info\";s:4:\"name\";s:10:\"STARTERKIT\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:26:\"Zen Themer’s Starter Kit\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:46:\"sites/all/themes/zen/STARTERKIT/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:5:{s:10:\"layout.css\";s:42:\"sites/all/themes/zen/STARTERKIT/layout.css\";s:17:\"html-elements.css\";s:49:\"sites/all/themes/zen/STARTERKIT/html-elements.css\";s:14:\"STARTERKIT.css\";s:46:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.css\";s:7:\"zen.css\";s:39:\"sites/all/themes/zen/STARTERKIT/zen.css\";s:10:\"screen.css\";s:42:\"sites/all/themes/zen/STARTERKIT/screen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:41:\"sites/all/themes/zen/STARTERKIT/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:41:\"sites/all/themes/zen/STARTERKIT/script.js\";}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:5:{s:10:\"layout.css\";s:42:\"sites/all/themes/zen/STARTERKIT/layout.css\";s:17:\"html-elements.css\";s:49:\"sites/all/themes/zen/STARTERKIT/html-elements.css\";s:14:\"STARTERKIT.css\";s:46:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.css\";s:7:\"zen.css\";s:39:\"sites/all/themes/zen/STARTERKIT/zen.css\";s:10:\"screen.css\";s:42:\"sites/all/themes/zen/STARTERKIT/screen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:41:\"sites/all/themes/zen/STARTERKIT/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:41:\"sites/all/themes/zen/STARTERKIT/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:10:\"STARTERKIT\";}',31,5,'admin/build/themes/settings','admin/build/themes','Zen Themer’s Starter Kit','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/build/themes/settings/inbode','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:35:\"sites/all/themes/inbode/inbode.info\";s:4:\"name\";s:6:\"inbode\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:6:\"inbode\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:38:\"sites/all/themes/inbode/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:10:\"layout.css\";s:34:\"sites/all/themes/inbode/layout.css\";s:17:\"html-elements.css\";s:41:\"sites/all/themes/inbode/html-elements.css\";s:8:\"tabs.css\";s:32:\"sites/all/themes/inbode/tabs.css\";s:10:\"inbode.css\";s:34:\"sites/all/themes/inbode/inbode.css\";s:7:\"zen.css\";s:31:\"sites/all/themes/inbode/zen.css\";s:10:\"screen.css\";s:34:\"sites/all/themes/inbode/screen.css\";s:14:\"morestyles.css\";s:38:\"sites/all/themes/inbode/morestyles.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:33:\"sites/all/themes/inbode/print.css\";}}s:23:\"conditional-stylesheets\";a:2:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}s:7:\"if IE 7\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie7.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"sites/all/themes/inbode/script.js\";}s:7:\"regions\";a:3:{s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:2:{i:0;s:4:\"name\";i:1;s:6:\"slogan\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:10:\"layout.css\";s:34:\"sites/all/themes/inbode/layout.css\";s:17:\"html-elements.css\";s:41:\"sites/all/themes/inbode/html-elements.css\";s:8:\"tabs.css\";s:32:\"sites/all/themes/inbode/tabs.css\";s:10:\"inbode.css\";s:34:\"sites/all/themes/inbode/inbode.css\";s:7:\"zen.css\";s:31:\"sites/all/themes/inbode/zen.css\";s:10:\"screen.css\";s:34:\"sites/all/themes/inbode/screen.css\";s:14:\"morestyles.css\";s:38:\"sites/all/themes/inbode/morestyles.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:33:\"sites/all/themes/inbode/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"sites/all/themes/inbode/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:6:\"inbode\";}',31,5,'admin/build/themes/settings','admin/build/themes','inbode','t','',128,'','','',0,'modules/system/system.admin.inc'),
	('admin/settings/imageapi/config/imageapi_gd','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:25:\"imageapi_gd_settings_form\";}',31,5,'admin/settings/imageapi/config','admin/settings/imageapi','@name','t','a:1:{s:5:\"@name\";s:12:\"ImageAPI GD2\";}',136,'','','',0,''),
	('admin/build/menu-customize/%/add','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:3:\"add\";i:2;N;i:3;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Add item','t','',128,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/build/block/list/bluemarine','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/bluemarine/bluemarine.info\";s:4:\"name\";s:10:\"bluemarine\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:10:\"bluemarine\";}',31,5,'admin/build/block/list','admin/build/block','Bluemarine','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/block/list/chameleon','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":11:{s:8:\"filename\";s:31:\"themes/chameleon/chameleon.info\";s:4:\"name\";s:9:\"chameleon\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:32:\"themes/chameleon/chameleon.theme\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}}}','block_admin_display','a:1:{i:0;s:9:\"chameleon\";}',31,5,'admin/build/block/list','admin/build/block','Chameleon','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/settings/filters/%/configure','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_configure_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Configure','t','',128,'','','',1,'modules/filter/filter.admin.inc'),
	('admin/settings/date-time/formats/custom','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','date_api_configure_custom_date_formats','a:0:{}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Custom formats','t','',128,'','Allow users to configure custom date formats.','',2,'sites/all/modules/date/date_api.admin.inc'),
	('admin/settings/actions/delete/%','a:1:{i:4;s:12:\"actions_load\";}','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:2:{i:0;s:26:\"system_actions_delete_form\";i:1;i:4;}',30,5,'','admin/settings/actions/delete/%','Delete action','t','',4,'','Delete an action.','',0,''),
	('admin/build/menu-customize/%/delete','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_delete_menu_page','a:1:{i:0;i:3;}',29,5,'','admin/build/menu-customize/%/delete','Delete menu','t','',4,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/content/node-type/page/display','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Display fields','t','',128,'','','',2,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/display','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"unit\";}',31,5,'admin/content/node-type/unit','admin/content/node-type/unit','Display fields','t','',128,'','','',2,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/menu-customize/%/edit','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:3:{i:0;s:14:\"menu_edit_menu\";i:1;s:4:\"edit\";i:2;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Edit menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/build/block/list/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:7:\"garland\";}',31,5,'admin/build/block/list','admin/build/block','Garland','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/content/node-type/building/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:27:\"content_field_overview_form\";i:1;s:8:\"building\";}',31,5,'admin/content/node-type/building','admin/content/node-type/building','Manage fields','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/page/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:27:\"content_field_overview_form\";i:1;s:4:\"page\";}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Manage fields','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/views/ajax/autocomplete/user','','','user_access','a:1:{i:0;s:14:\"access content\";}','views_ajax_autocomplete_user','a:0:{}',31,5,'','admin/views/ajax/autocomplete/user','','t','',4,'','','',0,'sites/all/modules/views/includes/ajax.inc'),
	('admin/content/node-type/building/display','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:29:\"content_display_overview_form\";i:1;s:8:\"building\";}',31,5,'admin/content/node-type/building','admin/content/node-type/building','Display fields','t','',128,'','','',2,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:27:\"content_field_overview_form\";i:1;s:4:\"unit\";}',31,5,'admin/content/node-type/unit','admin/content/node-type/unit','Manage fields','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/block/list/marvin','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:35:\"themes/chameleon/marvin/marvin.info\";s:4:\"name\";s:6:\"marvin\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:10:\"base_theme\";s:9:\"chameleon\";}}','block_admin_display','a:1:{i:0;s:6:\"marvin\";}',31,5,'admin/build/block/list','admin/build/block','Marvin','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/block/list/pushbutton','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/pushbutton/pushbutton.info\";s:4:\"name\";s:10:\"pushbutton\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:10:\"pushbutton\";}',31,5,'admin/build/block/list','admin/build/block','Pushbutton','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('filefield/ahah/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','filefield_edit_access','a:2:{i:0;i:2;i:1;i:3;}','filefield_js','a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}',24,5,'','filefield/ahah/%/%/%','','t','',4,'','','',0,''),
	('admin/build/block/list/minnelli','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','block_admin_display','a:1:{i:0;s:8:\"minnelli\";}',31,5,'admin/build/block/list','admin/build/block','Minnelli','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/settings/filters/%/order','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_order_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Rearrange','t','',128,'','','',2,'modules/filter/filter.admin.inc'),
	('admin/content/node-type/building/relationships','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:8:\"building\";}',31,5,'admin/content/node-type/building','admin/content/node-type/building','Relationships','t','',128,'','','',10,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/page/relationships','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"page\";}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Relationships','t','',128,'','','',10,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/relationships','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"unit\";}',31,5,'admin/content/node-type/unit','admin/content/node-type/unit','Relationships','t','',128,'','','',10,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('user/reset/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','1','a:0:{}','drupal_get_form','a:4:{i:0;s:15:\"user_pass_reset\";i:1;i:2;i:2;i:3;i:3;i:4;}',24,5,'','user/reset/%/%/%','Reset password','t','',4,'','','',0,'modules/user/user.pages.inc'),
	('user/validate/%/%/%','a:3:{i:2;s:9:\"user_load\";i:3;N;i:4;N;}','','logintoboggan_validate_email_access','a:2:{i:0;i:2;i:1;i:3;}','logintoboggan_validate_email','a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}',24,5,'','user/validate/%/%/%','Validate e-mail address','t','',4,'','','',0,''),
	('admin/build/block/list/zen','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"sites/all/themes/zen/zen/zen.info\";s:4:\"name\";s:3:\"zen\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:15:{s:4:\"name\";s:3:\"Zen\";s:11:\"description\";s:41:\"The ultimate starting theme for Drupal 6.\";s:10:\"screenshot\";s:39:\"sites/all/themes/zen/zen/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:6:{s:17:\"html-elements.css\";s:42:\"sites/all/themes/zen/zen/html-elements.css\";s:8:\"tabs.css\";s:33:\"sites/all/themes/zen/zen/tabs.css\";s:12:\"messages.css\";s:37:\"sites/all/themes/zen/zen/messages.css\";s:17:\"block-editing.css\";s:42:\"sites/all/themes/zen/zen/block-editing.css\";s:14:\"wireframes.css\";s:39:\"sites/all/themes/zen/zen/wireframes.css\";s:7:\"zen.css\";s:32:\"sites/all/themes/zen/zen/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:34:\"sites/all/themes/zen/zen/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:9:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:34:\"sites/all/themes/zen/zen/script.js\";}s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:6:{s:17:\"html-elements.css\";s:42:\"sites/all/themes/zen/zen/html-elements.css\";s:8:\"tabs.css\";s:33:\"sites/all/themes/zen/zen/tabs.css\";s:12:\"messages.css\";s:37:\"sites/all/themes/zen/zen/messages.css\";s:17:\"block-editing.css\";s:42:\"sites/all/themes/zen/zen/block-editing.css\";s:14:\"wireframes.css\";s:39:\"sites/all/themes/zen/zen/wireframes.css\";s:7:\"zen.css\";s:32:\"sites/all/themes/zen/zen/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:34:\"sites/all/themes/zen/zen/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:3:\"zen\";}',31,5,'admin/build/block/list','admin/build/block','Zen','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/block/list/zen_classic','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:49:\"sites/all/themes/zen/zen_classic/zen_classic.info\";s:4:\"name\";s:11:\"zen_classic\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:11:\"Zen Classic\";s:11:\"description\";s:97:\"Zen sub-theme based on <a href=\"http://www.oswd.org/design/preview/id/2634\">Deliciously Blue</a>.\";s:10:\"screenshot\";s:47:\"sites/all/themes/zen/zen_classic/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:18:\"layout-garland.css\";s:51:\"sites/all/themes/zen/zen_classic/layout-garland.css\";s:17:\"html-elements.css\";s:50:\"sites/all/themes/zen/zen_classic/html-elements.css\";s:9:\"icons.css\";s:42:\"sites/all/themes/zen/zen_classic/icons.css\";s:15:\"zen-classic.css\";s:48:\"sites/all/themes/zen/zen_classic/zen-classic.css\";s:12:\"messages.css\";s:45:\"sites/all/themes/zen/zen_classic/messages.css\";s:14:\"wireframes.css\";s:47:\"sites/all/themes/zen/zen_classic/wireframes.css\";s:7:\"zen.css\";s:40:\"sites/all/themes/zen/zen_classic/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:42:\"sites/all/themes/zen/zen_classic/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:10:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:8:\" :&#58; \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"0\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:17:\"zen_classic_fixed\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:42:\"sites/all/themes/zen/zen_classic/script.js\";}s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:18:\"layout-garland.css\";s:51:\"sites/all/themes/zen/zen_classic/layout-garland.css\";s:17:\"html-elements.css\";s:50:\"sites/all/themes/zen/zen_classic/html-elements.css\";s:9:\"icons.css\";s:42:\"sites/all/themes/zen/zen_classic/icons.css\";s:15:\"zen-classic.css\";s:48:\"sites/all/themes/zen/zen_classic/zen-classic.css\";s:12:\"messages.css\";s:45:\"sites/all/themes/zen/zen_classic/messages.css\";s:14:\"wireframes.css\";s:47:\"sites/all/themes/zen/zen_classic/wireframes.css\";s:7:\"zen.css\";s:40:\"sites/all/themes/zen/zen_classic/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:42:\"sites/all/themes/zen/zen_classic/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','block_admin_display','a:1:{i:0;s:11:\"zen_classic\";}',31,5,'admin/build/block/list','admin/build/block','Zen Classic','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/block/list/STARTERKIT','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:47:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.info\";s:4:\"name\";s:10:\"STARTERKIT\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:26:\"Zen Themer’s Starter Kit\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:46:\"sites/all/themes/zen/STARTERKIT/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:5:{s:10:\"layout.css\";s:42:\"sites/all/themes/zen/STARTERKIT/layout.css\";s:17:\"html-elements.css\";s:49:\"sites/all/themes/zen/STARTERKIT/html-elements.css\";s:14:\"STARTERKIT.css\";s:46:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.css\";s:7:\"zen.css\";s:39:\"sites/all/themes/zen/STARTERKIT/zen.css\";s:10:\"screen.css\";s:42:\"sites/all/themes/zen/STARTERKIT/screen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:41:\"sites/all/themes/zen/STARTERKIT/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:41:\"sites/all/themes/zen/STARTERKIT/script.js\";}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:5:{s:10:\"layout.css\";s:42:\"sites/all/themes/zen/STARTERKIT/layout.css\";s:17:\"html-elements.css\";s:49:\"sites/all/themes/zen/STARTERKIT/html-elements.css\";s:14:\"STARTERKIT.css\";s:46:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.css\";s:7:\"zen.css\";s:39:\"sites/all/themes/zen/STARTERKIT/zen.css\";s:10:\"screen.css\";s:42:\"sites/all/themes/zen/STARTERKIT/screen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:41:\"sites/all/themes/zen/STARTERKIT/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:41:\"sites/all/themes/zen/STARTERKIT/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','block_admin_display','a:1:{i:0;s:10:\"STARTERKIT\";}',31,5,'admin/build/block/list','admin/build/block','Zen Themer’s Starter Kit','t','',128,'','','',0,'modules/block/block.admin.inc'),
	('admin/build/block/list/inbode','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":14:{s:8:\"filename\";s:35:\"sites/all/themes/inbode/inbode.info\";s:4:\"name\";s:6:\"inbode\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:16:{s:4:\"name\";s:6:\"inbode\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:38:\"sites/all/themes/inbode/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:10:\"layout.css\";s:34:\"sites/all/themes/inbode/layout.css\";s:17:\"html-elements.css\";s:41:\"sites/all/themes/inbode/html-elements.css\";s:8:\"tabs.css\";s:32:\"sites/all/themes/inbode/tabs.css\";s:10:\"inbode.css\";s:34:\"sites/all/themes/inbode/inbode.css\";s:7:\"zen.css\";s:31:\"sites/all/themes/inbode/zen.css\";s:10:\"screen.css\";s:34:\"sites/all/themes/inbode/screen.css\";s:14:\"morestyles.css\";s:38:\"sites/all/themes/inbode/morestyles.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:33:\"sites/all/themes/inbode/print.css\";}}s:23:\"conditional-stylesheets\";a:2:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}s:7:\"if IE 7\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie7.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"sites/all/themes/inbode/script.js\";}s:7:\"regions\";a:3:{s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:2:{i:0;s:4:\"name\";i:1;s:6:\"slogan\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:10:\"layout.css\";s:34:\"sites/all/themes/inbode/layout.css\";s:17:\"html-elements.css\";s:41:\"sites/all/themes/inbode/html-elements.css\";s:8:\"tabs.css\";s:32:\"sites/all/themes/inbode/tabs.css\";s:10:\"inbode.css\";s:34:\"sites/all/themes/inbode/inbode.css\";s:7:\"zen.css\";s:31:\"sites/all/themes/inbode/zen.css\";s:10:\"screen.css\";s:34:\"sites/all/themes/inbode/screen.css\";s:14:\"morestyles.css\";s:38:\"sites/all/themes/inbode/morestyles.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:33:\"sites/all/themes/inbode/print.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"sites/all/themes/inbode/script.js\";}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:3:\"zen\";}}','block_admin_display','a:1:{i:0;s:6:\"inbode\";}',31,5,'admin/build/block/list','admin/build/block','inbode','t','',136,'','','',-10,'modules/block/block.admin.inc'),
	('admin/settings/date-time/formats/add','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:30:\"date_api_add_date_formats_form\";}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Add format','t','',128,'','Allow users to add additional date formats.','',3,'sites/all/modules/date/date_api.admin.inc'),
	('admin/content/taxonomy/add/vocabulary','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:24:\"taxonomy_form_vocabulary\";}',31,5,'admin/content/taxonomy','admin/content/taxonomy','Add vocabulary','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/settings/date-time/formats/configure','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:26:\"date_api_date_formats_form\";}',31,5,'admin/settings/date-time/formats','admin/settings/date-time','Configure','t','',136,'','Allow users to configure date formats','',1,'sites/all/modules/date/date_api.admin.inc'),
	('admin/settings/date-time/delete/%','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:32:\"date_api_delete_format_type_form\";i:1;i:4;}',30,5,'','admin/settings/date-time/delete/%','Delete date format type','t','',4,'','Allow users to delete a configured date format type.','',0,'sites/all/modules/date/date_api.admin.inc'),
	('admin/build/path-redirect/delete/%','a:1:{i:4;s:18:\"path_redirect_load\";}','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:2:{i:0;s:25:\"path_redirect_delete_form\";i:1;i:4;}',30,5,'','admin/build/path-redirect/delete/%','Delete redirect','t','',4,'','Delete an existing URL redirect.','',0,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('admin/build/path-redirect/edit/%','a:1:{i:4;s:18:\"path_redirect_load\";}','','user_access','a:1:{i:0;s:20:\"administer redirects\";}','drupal_get_form','a:2:{i:0;s:23:\"path_redirect_edit_form\";i:1;i:4;}',30,5,'','admin/build/path-redirect/edit/%','Edit redirect','t','',4,'','Edit an existing URL redirect.','',0,'sites/all/modules/path_redirect/path_redirect.admin.inc'),
	('node/%/revisions/%/view','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:1:{i:0;i:1;}','node_show','a:3:{i:0;i:1;i:1;N;i:2;b:1;}',21,5,'','node/%/revisions/%/view','Revisions','t','',4,'','','',0,''),
	('node/%/revisions/%/delete','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"delete\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_delete_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/delete','Delete earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),
	('node/%/revisions/%/revert','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"update\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_revert_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/revert','Revert to earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),
	('admin/build/jqp/%/%','a:2:{i:3;s:16:\"jqp_library_load\";i:4;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:3:{i:0;s:16:\"jqp_library_edit\";i:1;i:3;i:2;i:4;}',28,5,'','admin/build/jqp/%/%','','jqp_overview_title','a:2:{i:0;i:3;i:1;i:4;}',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/build/jqp/%/%/list','a:2:{i:3;s:16:\"jqp_library_load\";i:4;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:3:{i:0;s:16:\"jqp_library_edit\";i:1;i:3;i:2;i:4;}',57,6,'admin/build/jqp/%/%','admin/build/jqp/%/%','List files','t','',136,'','','',-10,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/content/node-type/building/display/basic','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:8:\"building\";i:2;s:5:\"basic\";}',63,6,'admin/content/node-type/building/display','admin/content/node-type/building','Basic','t','',136,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/page/display/basic','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:5:\"basic\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','Basic','t','',136,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/display/basic','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"unit\";i:2;s:5:\"basic\";}',63,6,'admin/content/node-type/unit/display','admin/content/node-type/unit','Basic','t','',136,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/display/rss','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:8:\"building\";i:2;s:3:\"rss\";}',63,6,'admin/content/node-type/building/display','admin/content/node-type/building','RSS','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/page/display/rss','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:3:\"rss\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','RSS','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/display/rss','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"unit\";i:2;s:3:\"rss\";}',63,6,'admin/content/node-type/unit/display','admin/content/node-type/unit','RSS','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/display/search','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:8:\"building\";i:2;s:6:\"search\";}',63,6,'admin/content/node-type/building/display','admin/content/node-type/building','Search','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/page/display/search','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:6:\"search\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','Search','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/display/search','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"unit\";i:2;s:6:\"search\";}',63,6,'admin/content/node-type/unit/display','admin/content/node-type/unit','Search','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/display/token','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:8:\"building\";i:2;s:5:\"token\";}',63,6,'admin/content/node-type/building/display','admin/content/node-type/building','Token','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/page/display/token','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"page\";i:2;s:5:\"token\";}',63,6,'admin/content/node-type/page/display','admin/content/node-type/page','Token','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/display/token','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:29:\"content_display_overview_form\";i:1;s:4:\"unit\";i:2;s:5:\"token\";}',63,6,'admin/content/node-type/unit/display','admin/content/node-type/unit','Token','t','',128,'','','',1,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/settings/location/geocoding/%/%','a:2:{i:4;N;i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','location_geocoding_parameters_page','a:2:{i:0;i:4;i:1;i:5;}',60,6,'','admin/settings/location/geocoding/%/%','','t','',4,'','','',0,''),
	('admin/content/node-type/building/groups/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:26:\"fieldgroup_group_edit_form\";i:1;s:8:\"building\";i:2;i:5;}',62,6,'','admin/content/node-type/building/groups/%','Edit group','t','',4,'','','',0,''),
	('admin/content/node-type/page/groups/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:26:\"fieldgroup_group_edit_form\";i:1;s:4:\"page\";i:2;i:5;}',62,6,'','admin/content/node-type/page/groups/%','Edit group','t','',4,'','','',0,''),
	('admin/content/node-type/unit/groups/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:26:\"fieldgroup_group_edit_form\";i:1;s:4:\"unit\";i:2;i:5;}',62,6,'','admin/content/node-type/unit/groups/%','Edit group','t','',4,'','','',0,''),
	('user/%/inbode/craigslist/%/%','a:3:{i:1;s:9:\"user_load\";i:4;s:9:\"node_load\";i:5;s:9:\"node_load\";}','','_inbode_access','a:1:{i:0;i:1;}','inbode_craigslist','a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}',44,6,'','user/%/inbode/craigslist/%/%','','t','',6,'','','',0,''),
	('admin/build/jqp/%/%/add','a:2:{i:3;s:16:\"jqp_library_load\";i:4;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:4:{i:0;s:16:\"jqp_library_edit\";i:1;i:3;i:2;i:4;i:3;i:5;}',57,6,'admin/build/jqp/%/%','admin/build/jqp/%/%','Add file','t','',128,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/content/node-type/building/fields/field_building_amenities','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:8:\"building\";i:2;s:24:\"field_building_amenities\";}',63,6,'admin/content/node-type/building/fields','admin/content/node-type/building','Amenities','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_amenities','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:20:\"field_unit_amenities\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Amenities','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_area','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:15:\"field_unit_area\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Area','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_available','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:20:\"field_unit_available\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Available','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/relationships/backref','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:8:\"building\";}',63,6,'admin/content/node-type/building/relationships','admin/content/node-type/building','Back reference settings','t','',128,'','','',2,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/page/relationships/backref','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"page\";}',63,6,'admin/content/node-type/page/relationships','admin/content/node-type/page','Back reference settings','t','',128,'','','',2,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/relationships/backref','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"unit\";}',63,6,'admin/content/node-type/unit/relationships','admin/content/node-type/unit','Back reference settings','t','',128,'','','',2,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_bathroom','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:19:\"field_unit_bathroom\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Baths','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_bedroom','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:18:\"field_unit_bedroom\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Beds','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_building','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:19:\"field_unit_building\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Building','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/fields/field_building_address','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:8:\"building\";i:2;s:22:\"field_building_address\";}',63,6,'admin/content/node-type/building/fields','admin/content/node-type/building','Building\'s Address','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_email','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:16:\"field_unit_email\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Contact Email','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_craigslist_views','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:27:\"field_unit_craigslist_views\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Craigslist Views','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/menu/item/%/delete','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_item_delete_page','a:1:{i:0;i:4;}',61,6,'','admin/build/menu/item/%/delete','Delete menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/content/node-type/building/fields/field_building_description','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:8:\"building\";i:2;s:26:\"field_building_description\";}',63,6,'admin/content/node-type/building/fields','admin/content/node-type/building','Description','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_description','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:22:\"field_unit_description\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Description','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/menu/item/%/edit','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:4:\"edit\";i:2;i:4;i:3;N;}',61,6,'','admin/build/menu/item/%/edit','Edit menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/content/taxonomy/edit/vocabulary/%','a:1:{i:5;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_vocabulary_edit','a:1:{i:0;i:5;}',62,6,'','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/content/node-type/building/relationships/erd','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:8:\"building\";}',63,6,'admin/content/node-type/building/relationships','admin/content/node-type/building','Entity relations diagram','t','',136,'','','',0,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/page/relationships/erd','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"page\";}',63,6,'admin/content/node-type/page/relationships','admin/content/node-type/page','Entity relations diagram','t','',136,'','','',0,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/relationships/erd','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"unit\";}',63,6,'admin/content/node-type/unit/relationships','admin/content/node-type/unit','Entity relations diagram','t','',136,'','','',0,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/fields/field_featureid','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:15:\"field_featureid\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Maps Feature ID','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/relationships/noderef','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:8:\"building\";}',63,6,'admin/content/node-type/building/relationships','admin/content/node-type/building','Node reference extras','t','',128,'','','',1,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/page/relationships/noderef','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"page\";}',63,6,'admin/content/node-type/page/relationships','admin/content/node-type/page','Node reference extras','t','',128,'','','',1,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/relationships/noderef','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','noderelationships_admin_page','a:2:{i:0;i:5;i:1;s:4:\"unit\";}',63,6,'admin/content/node-type/unit/relationships','admin/content/node-type/unit','Node reference extras','t','',128,'','','',1,'sites/all/modules/noderelationships/noderelationships.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_price','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:16:\"field_unit_price\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Price','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/build/jqp/%library/%/reset','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:3:{i:0;s:16:\"jqp_confirm_form\";i:1;i:3;i:2;i:4;}',61,6,'','admin/build/jqp/%library/%/reset','Reset library','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/build/jqp/%/%/remove_file','a:2:{i:3;s:16:\"jqp_library_load\";i:4;N;}','','user_access','a:1:{i:0;s:31:\"administer javascript libraries\";}','drupal_get_form','a:3:{i:0;s:16:\"jqp_confirm_form\";i:1;i:3;i:2;i:4;}',57,6,'','admin/build/jqp/%/%/remove_file','Reset library','t','',4,'','','',0,'sites/all/modules/jqp/jqp.admin.inc'),
	('admin/build/menu/item/%/reset','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:23:\"menu_reset_item_confirm\";i:1;i:4;}',61,6,'','admin/build/menu/item/%/reset','Reset menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_status','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:17:\"field_unit_status\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Status','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/fields/field_building_images','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:8:\"building\";i:2;s:21:\"field_building_images\";}',63,6,'admin/content/node-type/building/fields','admin/content/node-type/building','Upload Images','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_images','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"content_field_edit_form\";i:1;s:4:\"unit\";i:2;s:17:\"field_unit_images\";}',63,6,'admin/content/node-type/unit/fields','admin/content/node-type/unit','Upload Images','t','',128,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/taxonomy/%/add/term','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_add_term_page','a:1:{i:0;i:3;}',59,6,'admin/content/taxonomy/%','admin/content/taxonomy/%','Add term','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),
	('admin/settings/date-time/formats/delete/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:27:\"date_api_delete_format_form\";i:1;i:5;}',62,6,'','admin/settings/date-time/formats/delete/%','Delete date format','t','',4,'','Allow users to delete a configured date format.','',0,'sites/all/modules/date/date_api.admin.inc'),
	('admin/settings/wysiwyg/profile/%/edit','a:1:{i:4;s:20:\"wysiwyg_profile_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:2:{i:0;s:20:\"wysiwyg_profile_form\";i:1;i:4;}',61,6,'admin/settings/wysiwyg/profile/%wysiwyg_profile','admin/settings/wysiwyg/profile','Edit','t','',128,'','','',0,'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
	('admin/settings/wysiwyg/profile/%/delete','a:1:{i:4;s:20:\"wysiwyg_profile_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:2:{i:0;s:30:\"wysiwyg_profile_delete_confirm\";i:1;i:4;}',61,6,'admin/settings/wysiwyg/profile/%wysiwyg_profile','admin/settings/wysiwyg/profile','Remove','t','',128,'','','',10,'sites/all/modules/wysiwyg/wysiwyg.admin.inc'),
	('admin/content/node-type/building/groups/%/remove','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"fieldgroup_remove_group\";i:1;s:8:\"building\";i:2;i:5;}',125,7,'','admin/content/node-type/building/groups/%/remove','Edit group','t','',4,'','','',0,''),
	('admin/content/node-type/page/groups/%/remove','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"fieldgroup_remove_group\";i:1;s:4:\"page\";i:2;i:5;}',125,7,'','admin/content/node-type/page/groups/%/remove','Edit group','t','',4,'','','',0,''),
	('admin/content/node-type/unit/groups/%/remove','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:23:\"fieldgroup_remove_group\";i:1;s:4:\"unit\";i:2;i:5;}',125,7,'','admin/content/node-type/unit/groups/%/remove','Edit group','t','',4,'','','',0,''),
	('user/%/inbode/craigslist/preview/%/%','a:3:{i:1;s:9:\"user_load\";i:5;s:9:\"node_load\";i:6;s:9:\"node_load\";}','','_inbode_craigslist','a:0:{}','inbode_craigslist_preview','a:3:{i:0;i:1;i:1;i:5;i:2;i:6;}',92,7,'','user/%/inbode/craigslist/preview/%/%','','t','',6,'','','',0,''),
	('admin/content/node-type/building/fields/field_building_address/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:8:\"building\";i:2;s:22:\"field_building_address\";}',127,7,'','admin/content/node-type/building/fields/field_building_address/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/fields/field_building_amenities/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:8:\"building\";i:2;s:24:\"field_building_amenities\";}',127,7,'','admin/content/node-type/building/fields/field_building_amenities/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/fields/field_building_description/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:8:\"building\";i:2;s:26:\"field_building_description\";}',127,7,'','admin/content/node-type/building/fields/field_building_description/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/building/fields/field_building_images/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:8:\"building\";i:2;s:21:\"field_building_images\";}',127,7,'','admin/content/node-type/building/fields/field_building_images/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_featureid/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:15:\"field_featureid\";}',127,7,'','admin/content/node-type/unit/fields/field_featureid/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_amenities/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:20:\"field_unit_amenities\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_amenities/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_area/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:15:\"field_unit_area\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_area/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_available/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:20:\"field_unit_available\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_available/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_bathroom/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:19:\"field_unit_bathroom\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_bathroom/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_bedroom/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:18:\"field_unit_bedroom\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_bedroom/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_building/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:19:\"field_unit_building\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_building/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_craigslist_views/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:27:\"field_unit_craigslist_views\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_craigslist_views/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_description/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:22:\"field_unit_description\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_description/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_email/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:16:\"field_unit_email\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_email/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_images/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:17:\"field_unit_images\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_images/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_price/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:16:\"field_unit_price\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_price/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc'),
	('admin/content/node-type/unit/fields/field_unit_status/remove','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:3:{i:0;s:25:\"content_field_remove_form\";i:1;s:4:\"unit\";i:2;s:17:\"field_unit_status\";}',127,7,'','admin/content/node-type/unit/fields/field_unit_status/remove','Remove field','t','',4,'','','',0,'sites/all/modules/cck/includes/content.admin.inc');

/*!40000 ALTER TABLE `menu_router` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node`;

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
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` (`nid`,`vid`,`type`,`language`,`title`,`uid`,`status`,`created`,`changed`,`comment`,`promote`,`moderate`,`sticky`,`tnid`,`translate`)
VALUES
	(144,144,'page','','easy online apartment search',1,1,1296854541,1296854708,0,0,0,0,0,0);

/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node_access`;

CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
INSERT INTO `node_access` (`nid`,`gid`,`realm`,`grant_view`,`grant_update`,`grant_delete`)
VALUES
	(144,1,'nodeaccess_author',1,1,1);

/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node_comment_statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node_comment_statistics`;

CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table node_counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node_counter`;

CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table node_revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node_revisions`;

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
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

LOCK TABLES `node_revisions` WRITE;
/*!40000 ALTER TABLE `node_revisions` DISABLE KEYS */;
INSERT INTO `node_revisions` (`nid`,`vid`,`uid`,`title`,`body`,`teaser`,`log`,`timestamp`,`format`)
VALUES
	(46,46,0,'sdfs','','','',1280946703,0),
	(50,50,0,'asdasdasdasdasd','','','',1280947088,0),
	(144,144,1,'easy online apartment search','','','',1296854708,3);

/*!40000 ALTER TABLE `node_revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node_type`;

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

LOCK TABLES `node_type` WRITE;
/*!40000 ALTER TABLE `node_type` DISABLE KEYS */;
INSERT INTO `node_type` (`type`,`name`,`module`,`description`,`help`,`has_title`,`title_label`,`has_body`,`body_label`,`min_word_count`,`custom`,`modified`,`locked`,`orig_type`)
VALUES
	('page','Page','node','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',1,'Title',1,'Body',0,1,1,0,'page'),
	('unit','Unit','node','A unit as part of a building.','',1,'Unit Number',0,'',0,1,1,0,''),
	('building','Building','node','A building, containing units.','',1,'Building Name',0,'',0,1,1,0,'');

/*!40000 ALTER TABLE `node_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nodeaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nodeaccess`;

CREATE TABLE `nodeaccess` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table nodeaccess_role_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nodeaccess_role_alias`;

CREATE TABLE `nodeaccess_role_alias` (
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table noderelationships_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `noderelationships_settings`;

CREATE TABLE `noderelationships_settings` (
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `relation_type` varchar(10) NOT NULL DEFAULT '',
  `related_type` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  PRIMARY KEY (`type_name`,`relation_type`,`related_type`,`field_name`),
  KEY `type_field_relation` (`type_name`,`field_name`,`relation_type`),
  KEY `related_field_relation` (`related_type`,`field_name`,`relation_type`),
  KEY `field_name` (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table path_redirect
# ------------------------------------------------------------

DROP TABLE IF EXISTS `path_redirect`;

CREATE TABLE `path_redirect` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `redirect` varchar(255) NOT NULL,
  `query` varchar(255) DEFAULT NULL,
  `fragment` varchar(50) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL,
  `last_used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `source_language` (`source`,`language`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `path_redirect` WRITE;
/*!40000 ALTER TABLE `path_redirect` DISABLE KEYS */;
INSERT INTO `path_redirect` (`rid`,`source`,`redirect`,`query`,`fragment`,`language`,`type`,`last_used`)
VALUES
	(1,'node','home','','','',301,1296787889),
	(2,'content/test','node/144','','','',301,1296854708);

/*!40000 ALTER TABLE `path_redirect` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`pid`,`rid`,`perm`,`tid`)
VALUES
	(133,4,'edit field_building_address, edit field_building_amenities, edit field_building_description, edit field_building_images, edit field_unit_amenities, edit field_unit_area, edit field_unit_available, edit field_unit_bathroom, edit field_unit_bedroom, edit field_unit_building, edit field_unit_description, edit field_unit_images, edit field_unit_more_images, edit field_unit_price, edit field_unit_status, view field_building_address, view field_building_amenities, view field_building_description, view field_building_images, view field_featureid, view field_unit_amenities, view field_unit_area, view field_unit_available, view field_unit_bathroom, view field_unit_bedroom, view field_unit_building, view field_unit_description, view field_unit_images, view field_unit_more_images, view field_unit_price, view field_unit_status, view inbode summary, access content, create building content, create unit content, delete own building content, delete own unit content, edit own building content, edit own unit content, revert revisions, view revisions, upload files with swfupload',0),
	(132,3,'access administration menu, display drupal links, administer blocks, use PHP for block visibility, Use PHP input for field settings (dangerous - grant with care), edit field_building_address, edit field_building_amenities, edit field_building_description, edit field_building_images, edit field_featureid, edit field_unit_amenities, edit field_unit_area, edit field_unit_available, edit field_unit_bathroom, edit field_unit_bedroom, edit field_unit_building, edit field_unit_description, edit field_unit_images, edit field_unit_more_images, edit field_unit_price, edit field_unit_status, view field_building_address, view field_building_amenities, view field_building_description, view field_building_images, view field_featureid, view field_unit_amenities, view field_unit_area, view field_unit_available, view field_unit_bathroom, view field_unit_bedroom, view field_unit_building, view field_unit_description, view field_unit_images, view field_unit_more_images, view field_unit_price, view field_unit_status, view date repeats, administer filters, configure default number format, administer imageapi, administer imce(execute PHP), view inbode summary, submit latitude/longitude, view location directory, view node location table, view user location table, administer login destination, administer menu, access content, administer content types, administer nodes, create building content, create page content, create unit content, delete any building content, delete any page content, delete any unit content, delete own building content, delete own page content, delete own unit content, delete revisions, edit any building content, edit any page content, edit any unit content, edit own building content, edit own page content, edit own unit content, revert revisions, view revisions, administer nodeaccess, grant deletable node permissions, grant editable node permissions, grant node permissions, grant own node permissions, administer url aliases, create url aliases, administer redirects, administer pathauto, notify of path changes, administer search, search content, use advanced search, upload files with swfupload, access administration pages, access site reports, administer actions, administer files, administer site configuration, select different theme, administer taxonomy, access user profiles, administer permissions, administer users, change own username, access all views, administer views',0),
	(130,1,'view field_building_address, view field_building_amenities, view field_building_description, view field_building_images, view field_featureid, view field_unit_amenities, view field_unit_area, view field_unit_available, view field_unit_bathroom, view field_unit_bedroom, view field_unit_building, view field_unit_description, view field_unit_images, view field_unit_more_images, view field_unit_price, view field_unit_status, access content',0),
	(131,2,'view field_building_address, view field_building_amenities, view field_building_description, view field_building_images, view field_featureid, view field_unit_amenities, view field_unit_area, view field_unit_available, view field_unit_bathroom, view field_unit_bedroom, view field_unit_building, view field_unit_description, view field_unit_images, view field_unit_more_images, view field_unit_price, view field_unit_status, access content',0),
	(134,5,'view field_building_address, view field_building_amenities, view field_building_description, view field_building_images, view field_featureid, view field_unit_amenities, view field_unit_area, view field_unit_available, view field_unit_bathroom, view field_unit_bedroom, view field_unit_building, view field_unit_description, view field_unit_images, view field_unit_more_images, view field_unit_price, view field_unit_status, access content',0);

/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profile_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_fields`;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table profile_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile_values`;

CREATE TABLE `profile_values` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`rid`,`name`)
VALUES
	(1,'anonymous user'),
	(2,'authenticated user'),
	(3,'inbode super admin '),
	(4,'inbode building manager'),
	(5,'inbode user');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table search_dataset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_dataset`;

CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_index`;

CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `score` float DEFAULT NULL,
  UNIQUE KEY `word_sid_type` (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table search_node_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_node_links`;

CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `caption` longtext,
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table search_total
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_total`;

CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `search_total` WRITE;
/*!40000 ALTER TABLE `search_total` DISABLE KEYS */;
INSERT INTO `search_total` (`word`,`count`)
VALUES
	('sample',0.0163904),
	('content',0.0163904),
	('headline',0.0248236),
	('sub',0.0263289),
	('some',0.30103),
	('regular',0.30103),
	('paragraph',0.30103),
	('text',0.30103),
	('here',0.30103),
	('the',0.0151337),
	('mill',0.0146241),
	('place',0.0146241),
	('111',0.30103),
	('3rd',0.30103),
	('ave',0.176091),
	('minneapolis',0.30103),
	('55401',0.30103),
	('historic',0.30103),
	('cats',0.176091),
	('small',0.176091),
	('dogs',0.09691),
	('big',0.176091),
	('pool',0.176091),
	('suite',0.0163904),
	('130',0.0163904),
	('listed',0.124939),
	('1',0.0669468),
	('100000',0.30103),
	('100square',0.30103),
	('feet',0.124939),
	('mon',0.124939),
	('1312011',0.124939),
	('12pm',0.176091),
	('403',0.30103),
	('stegic',0.0140561),
	('residence',0.0140561),
	('6526',0.30103),
	('5th',0.30103),
	('richfield',0.30103),
	('55423',0.30103),
	('sublet',0.0163904),
	('james',0.0163904),
	('room',0.0163904),
	('30000',0.30103),
	('50square',0.30103),
	('inunit',0.30103),
	('laundry',0.30103),
	('dishwasher',0.30103),
	('disposal',0.30103),
	('balcony',0.30103),
	('furnished',0.30103),
	('garage',0.30103),
	('1401',0.30103),
	('test',0.0163904),
	('1111100',0.30103),
	('111square',0.30103),
	('4pm',0.30103),
	('604',0.30103),
	('home',0.0163904);

/*!40000 ALTER TABLE `search_total` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table semaphore
# ------------------------------------------------------------

DROP TABLE IF EXISTS `semaphore`;

CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

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



# Dump of table system
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system`;

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

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` (`filename`,`name`,`type`,`owner`,`status`,`throttle`,`bootstrap`,`schema_version`,`weight`,`info`)
VALUES
	('modules/system/system.module','system','module','',1,0,0,6055,0,'a:10:{s:4:\"name\";s:6:\"System\";s:11:\"description\";s:54:\"Handles general site configuration for administrators.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/aggregator/aggregator.module','aggregator','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Aggregator\";s:11:\"description\";s:57:\"Aggregates syndicated content (RSS, RDF, and Atom feeds).\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/block/block.module','block','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Block\";s:11:\"description\";s:62:\"Controls the boxes that are displayed around the main content.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/blog/blog.module','blog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Blog\";s:11:\"description\";s:69:\"Enables keeping easily and regularly updated user web pages or blogs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/blogapi/blogapi.module','blogapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Blog API\";s:11:\"description\";s:79:\"Allows users to post content using applications that support XML-RPC blog APIs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/book/book.module','book','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Book\";s:11:\"description\";s:63:\"Allows users to structure site pages in a hierarchy or outline.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/color/color.module','color','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Color\";s:11:\"description\";s:61:\"Allows the user to change the color scheme of certain themes.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/comment/comment.module','comment','module','',0,0,0,6003,0,'a:10:{s:4:\"name\";s:7:\"Comment\";s:11:\"description\";s:57:\"Allows users to comment on and discuss published content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/contact/contact.module','contact','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Contact\";s:11:\"description\";s:61:\"Enables the use of both personal and site-wide contact forms.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/dblog/dblog.module','dblog','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:16:\"Database logging\";s:11:\"description\";s:47:\"Logs and records system events to the database.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/filter/filter.module','filter','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:6:\"Filter\";s:11:\"description\";s:60:\"Handles the filtering of content in preparation for display.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/forum/forum.module','forum','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Forum\";s:11:\"description\";s:50:\"Enables threaded discussions about general topics.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/help/help.module','help','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Help\";s:11:\"description\";s:35:\"Manages the display of online help.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/locale/locale.module','locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Locale\";s:11:\"description\";s:119:\"Adds language handling functionality and enables the translation of the user interface to languages other than English.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/menu/menu.module','menu','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Menu\";s:11:\"description\";s:60:\"Allows administrators to customize the site navigation menu.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/node/node.module','node','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Node\";s:11:\"description\";s:66:\"Allows content to be submitted to the site and displayed on pages.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/openid/openid.module','openid','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"OpenID\";s:11:\"description\";s:48:\"Allows users to log into your site using OpenID.\";s:7:\"version\";s:4:\"6.20\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/path/path.module','path','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Path\";s:11:\"description\";s:28:\"Allows users to rename URLs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/php/php.module','php','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:10:\"PHP filter\";s:11:\"description\";s:50:\"Allows embedded PHP code/snippets to be evaluated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/ping/ping.module','ping','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Ping\";s:11:\"description\";s:51:\"Alerts other sites when your site has been updated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/poll/poll.module','poll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Poll\";s:11:\"description\";s:95:\"Allows your site to capture votes on different topics in the form of multiple choice questions.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/profile/profile.module','profile','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:7:\"Profile\";s:11:\"description\";s:36:\"Supports configurable user profiles.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/search/search.module','search','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:36:\"Enables site-wide keyword searching.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/statistics/statistics.module','statistics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Statistics\";s:11:\"description\";s:37:\"Logs access statistics for your site.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/syslog/syslog.module','syslog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Syslog\";s:11:\"description\";s:41:\"Logs and records system events to syslog.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/taxonomy/taxonomy.module','taxonomy','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"Taxonomy\";s:11:\"description\";s:38:\"Enables the categorization of content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/throttle/throttle.module','throttle','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Throttle\";s:11:\"description\";s:66:\"Handles the auto-throttling mechanism, to control site congestion.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/tracker/tracker.module','tracker','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Tracker\";s:11:\"description\";s:43:\"Enables tracking of recent posts for users.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/translation/translation.module','translation','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content translation\";s:11:\"description\";s:57:\"Allows content to be translated into different languages.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/trigger/trigger.module','trigger','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Trigger\";s:11:\"description\";s:90:\"Enables actions to be fired on certain system events, such as when new content is created.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/update/update.module','update','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:13:\"Update status\";s:11:\"description\";s:88:\"Checks the status of available updates for Drupal and your installed modules and themes.\";s:7:\"version\";s:4:\"6.20\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/upload/upload.module','upload','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Upload\";s:11:\"description\";s:51:\"Allows users to upload and attach files to content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('modules/user/user.module','user','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"User\";s:11:\"description\";s:47:\"Manages the user registration and login system.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/imce_wysiwyg/imce_wysiwyg.module','imce_wysiwyg','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:23:\"IMCE Wysiwyg API bridge\";s:11:\"description\";s:82:\"Makes IMCE available as plugin for client-side editors integrated via Wysiwyg API.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:4:\"imce\";i:1;s:7:\"wysiwyg\";}s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:12:\"imce_wysiwyg\";s:9:\"datestamp\";s:10:\"1268433606\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/seo_checklist/seochecklist.module','seochecklist','module','',0,0,0,6001,0,'a:10:{s:4:\"name\";s:15:\"\"SEO\" Checklist\";s:11:\"description\";s:52:\"A Search Engine Optimization checklist for Drupal 6.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:15:\"\"SEO\" Checklist\";s:7:\"version\";s:7:\"6.x-2.0\";s:7:\"project\";s:13:\"seo_checklist\";s:9:\"datestamp\";s:10:\"1249685460\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/admin_menu/admin_menu.module','admin_menu','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:19:\"Administration menu\";s:11:\"description\";s:123:\"Provides a dropdown menu to most administrative tasks and other common destinations (to users with the proper permissions).\";s:7:\"package\";s:14:\"Administration\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:10:\"admin_menu\";s:9:\"datestamp\";s:10:\"1283512306\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/backup_migrate/backup_migrate.module','backup_migrate','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:18:\"Backup and Migrate\";s:11:\"description\";s:75:\"Backup or migrate the Drupal Database quickly and without unnecessary data.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:14:\"backup_migrate\";s:9:\"datestamp\";s:10:\"1232247609\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/content.module','content','module','',1,0,0,6010,0,'a:10:{s:4:\"name\";s:7:\"Content\";s:11:\"description\";s:50:\"Allows administrators to define new content types.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/content_copy/content_copy.module','content_copy','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:12:\"Content Copy\";s:11:\"description\";s:51:\"Enables ability to import/export field definitions.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/content_permissions/content_permissions.module','content_permissions','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:19:\"Content Permissions\";s:11:\"description\";s:43:\"Set field-level permissions for CCK fields.\";s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/disqus/disqus.module','disqus','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:6:\"Disqus\";s:11:\"description\";s:48:\"Uses the Disqus web service to enhance comments.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:6:\"disqus\";s:9:\"datestamp\";s:10:\"1259864129\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/feedburner/feedburner.module','feedburner','module','',0,0,0,-1,-1,'a:10:{s:4:\"name\";s:10:\"Feedburner\";s:11:\"description\";s:64:\"Integrates with FeedBurner services, primarily feed redirection.\";s:4:\"core\";s:3:\"6.x\";s:8:\"suggests\";a:2:{i:0;s:10:\"commentrss\";i:1;s:13:\"advanced_help\";}s:7:\"version\";s:13:\"6.x-1.0-beta4\";s:7:\"project\";s:10:\"feedburner\";s:9:\"datestamp\";s:10:\"1240182938\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module','fieldgroup','module','',1,0,0,6007,9,'a:10:{s:4:\"name\";s:10:\"Fieldgroup\";s:11:\"description\";s:37:\"Create display groups for CCK fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/globalredirect/globalredirect.module','globalredirect','module','',1,0,0,6100,0,'a:9:{s:4:\"name\";s:15:\"Global Redirect\";s:11:\"description\";s:129:\"Searches for an alias of the current URL and 301 redirects if found. Stops duplicate content arising when path module is enabled.\";s:12:\"dependencies\";a:1:{i:0;s:4:\"path\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:14:\"globalredirect\";s:9:\"datestamp\";s:10:\"1229943020\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/google_analytics/googleanalytics.module','googleanalytics','module','',0,0,0,6200,0,'a:10:{s:4:\"name\";s:16:\"Google Analytics\";s:11:\"description\";s:72:\"Adds Google Analytics javascript tracking code to all your site\'s pages.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:10:\"Statistics\";s:7:\"version\";s:7:\"6.x-2.2\";s:7:\"project\";s:16:\"google_analytics\";s:9:\"datestamp\";s:10:\"1238610067\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/imagefield/imagefield.module','imagefield','module','',1,0,0,6006,0,'a:10:{s:4:\"name\";s:10:\"ImageField\";s:11:\"description\";s:28:\"Defines an image field type.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:9:\"filefield\";}s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:7:\"6.x-3.9\";s:7:\"project\";s:10:\"imagefield\";s:9:\"datestamp\";s:10:\"1292197241\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/imagefield_crop/imagefield_crop.module','imagefield_crop','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:10:\"Image crop\";s:11:\"description\";s:47:\"Add cropping ability to images using javascript\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:10:\"imagefield\";i:1;s:8:\"imageapi\";}s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:11:\"6.x-1.0-rc2\";s:7:\"project\";s:15:\"imagefield_crop\";s:9:\"datestamp\";s:10:\"1276617612\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/jquery_update/jquery_update.module','jquery_update','module','',1,0,0,6200,99,'a:10:{s:4:\"name\";s:13:\"jQuery Update\";s:11:\"description\";s:51:\"Updates Drupal to use the latest version of jQuery.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-alpha1\";s:7:\"project\";s:13:\"jquery_update\";s:9:\"datestamp\";s:10:\"1272041110\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/lightbox2/lightbox2.module','lightbox2','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:9:\"Lightbox2\";s:11:\"description\";s:28:\"Enables Lightbox2 for Drupal\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:9:\"lightbox2\";s:9:\"datestamp\";s:10:\"1231421439\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/nodereference/nodereference.module','nodereference','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:14:\"Node Reference\";s:11:\"description\";s:59:\"Defines a field type for referencing one node from another.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/number/number.module','number','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:6:\"Number\";s:11:\"description\";s:28:\"Defines numeric field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module','optionwidgets','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:14:\"Option Widgets\";s:11:\"description\";s:82:\"Defines selection, check box and radio button widgets for text and numeric fields.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/path_redirect/path_redirect.module','path_redirect','module','',1,0,0,6103,0,'a:12:{s:4:\"name\";s:13:\"Path redirect\";s:11:\"description\";s:39:\"Redirect users from one URL to another.\";s:4:\"core\";s:3:\"6.x\";s:8:\"enhances\";a:1:{i:0;s:8:\"pathauto\";}s:8:\"suggests\";a:1:{i:0;s:15:\"global_redirect\";}s:10:\"recommends\";a:1:{i:0;s:8:\"elements\";}s:7:\"version\";s:11:\"6.x-1.0-rc2\";s:7:\"project\";s:13:\"path_redirect\";s:9:\"datestamp\";s:10:\"1291583783\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/pathauto/pathauto.module','pathauto','module','',1,0,0,7,1,'a:10:{s:4:\"name\";s:8:\"Pathauto\";s:11:\"description\";s:95:\"Provides a mechanism for modules to automatically generate aliases for the content they manage.\";s:12:\"dependencies\";a:2:{i:0;s:4:\"path\";i:1;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:10:\"recommends\";a:1:{i:0;s:13:\"path_redirect\";}s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:8:\"pathauto\";s:9:\"datestamp\";s:10:\"1286469664\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/robotstxt/robotstxt.module','robotstxt','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:10:\"robots.txt\";s:11:\"description\";s:116:\"Generates the robots.txt file dynamically and gives you the chance to edit it, on a per-site basis, from the web UI.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:9:\"robotstxt\";s:9:\"datestamp\";s:10:\"1236422443\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/search404/search404.module','search404','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:10:\"Search 404\";s:11:\"description\";s:10:\"Search 404\";s:12:\"dependencies\";a:1:{i:0;s:6:\"search\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.10\";s:7:\"project\";s:9:\"search404\";s:9:\"datestamp\";s:10:\"1292785873\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/text/text.module','text','module','',1,0,0,6003,0,'a:10:{s:4:\"name\";s:4:\"Text\";s:11:\"description\";s:32:\"Defines simple text field types.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/token/token.module','token','module','',1,0,0,1,10,'a:9:{s:4:\"name\";s:5:\"Token\";s:11:\"description\";s:79:\"Provides a shared API for replacement of textual placeholders with actual data.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.15\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1286469963\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/token/token_actions.module','token_actions','module','',0,0,0,0,0,'a:9:{s:4:\"name\";s:13:\"Token actions\";s:11:\"description\";s:73:\"Provides enhanced versions of core Drupal actions using the Token module.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.15\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1286469963\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/typogrify/typogrify.module','typogrify','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:9:\"Typogrify\";s:11:\"description\";s:29:\"Adds typographic refinements.\";s:7:\"package\";s:13:\"Input filters\";s:7:\"project\";s:9:\"typogrify\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.0\";s:9:\"datestamp\";s:10:\"1243608988\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/cck/modules/userreference/userreference.module','userreference','module','',1,0,0,6002,0,'a:10:{s:4:\"name\";s:14:\"User Reference\";s:11:\"description\";s:56:\"Defines a field type for referencing a user from a node.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:4:\"text\";i:2;s:13:\"optionwidgets\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:3:\"cck\";s:9:\"datestamp\";s:10:\"1294407979\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/views/views.module','views','module','',1,0,0,6009,10,'a:10:{s:4:\"name\";s:5:\"Views\";s:11:\"description\";s:55:\"Create customized lists and queries from your database.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.12\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1292446272\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/views/views_export/views_export.module','views_export','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:14:\"Views exporter\";s:11:\"description\";s:40:\"Allows exporting multiple views at once.\";s:7:\"package\";s:5:\"Views\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.12\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1292446272\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/views/views_ui.module','views_ui','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"Views UI\";s:11:\"description\";s:93:\"Administrative interface to views. Without this module, you cannot create or edit your views.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:7:\"version\";s:8:\"6.x-2.12\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1292446272\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/wysiwyg/wysiwyg.module','wysiwyg','module','',1,0,0,6201,0,'a:10:{s:4:\"name\";s:7:\"Wysiwyg\";s:11:\"description\";s:55:\"Allows users to edit contents with client-side editors.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:7:\"wysiwyg\";s:9:\"datestamp\";s:10:\"1296430415\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/themes/zen/zen_classic/zen_classic.info','zen_classic','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:16:{s:4:\"name\";s:11:\"Zen Classic\";s:11:\"description\";s:97:\"Zen sub-theme based on <a href=\"http://www.oswd.org/design/preview/id/2634\">Deliciously Blue</a>.\";s:10:\"screenshot\";s:47:\"sites/all/themes/zen/zen_classic/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:18:\"layout-garland.css\";s:51:\"sites/all/themes/zen/zen_classic/layout-garland.css\";s:17:\"html-elements.css\";s:50:\"sites/all/themes/zen/zen_classic/html-elements.css\";s:9:\"icons.css\";s:42:\"sites/all/themes/zen/zen_classic/icons.css\";s:15:\"zen-classic.css\";s:48:\"sites/all/themes/zen/zen_classic/zen-classic.css\";s:12:\"messages.css\";s:45:\"sites/all/themes/zen/zen_classic/messages.css\";s:14:\"wireframes.css\";s:47:\"sites/all/themes/zen/zen_classic/wireframes.css\";s:7:\"zen.css\";s:40:\"sites/all/themes/zen/zen_classic/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:42:\"sites/all/themes/zen/zen_classic/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:10:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:8:\" :&#58; \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"0\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:17:\"zen_classic_fixed\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:42:\"sites/all/themes/zen/zen_classic/script.js\";}s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),
	('sites/all/themes/zen/zen/zen.info','zen','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:15:{s:4:\"name\";s:3:\"Zen\";s:11:\"description\";s:41:\"The ultimate starting theme for Drupal 6.\";s:10:\"screenshot\";s:39:\"sites/all/themes/zen/zen/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:6:{s:17:\"html-elements.css\";s:42:\"sites/all/themes/zen/zen/html-elements.css\";s:8:\"tabs.css\";s:33:\"sites/all/themes/zen/zen/tabs.css\";s:12:\"messages.css\";s:37:\"sites/all/themes/zen/zen/messages.css\";s:17:\"block-editing.css\";s:42:\"sites/all/themes/zen/zen/block-editing.css\";s:14:\"wireframes.css\";s:39:\"sites/all/themes/zen/zen/wireframes.css\";s:7:\"zen.css\";s:32:\"sites/all/themes/zen/zen/zen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:34:\"sites/all/themes/zen/zen/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:5:\"if IE\";a:1:{s:3:\"all\";a:1:{i:0;s:6:\"ie.css\";}}}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:9:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:34:\"sites/all/themes/zen/zen/script.js\";}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/themes/zen/STARTERKIT/STARTERKIT.info','STARTERKIT','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:16:{s:4:\"name\";s:26:\"Zen Themer’s Starter Kit\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:46:\"sites/all/themes/zen/STARTERKIT/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:5:{s:10:\"layout.css\";s:42:\"sites/all/themes/zen/STARTERKIT/layout.css\";s:17:\"html-elements.css\";s:49:\"sites/all/themes/zen/STARTERKIT/html-elements.css\";s:14:\"STARTERKIT.css\";s:46:\"sites/all/themes/zen/STARTERKIT/STARTERKIT.css\";s:7:\"zen.css\";s:39:\"sites/all/themes/zen/STARTERKIT/zen.css\";s:10:\"screen.css\";s:42:\"sites/all/themes/zen/STARTERKIT/screen.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:41:\"sites/all/themes/zen/STARTERKIT/print.css\";}}s:23:\"conditional-stylesheets\";a:1:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:41:\"sites/all/themes/zen/STARTERKIT/script.js\";}s:7:\"regions\";a:8:{s:4:\"left\";s:12:\"left sidebar\";s:5:\"right\";s:13:\"right sidebar\";s:6:\"navbar\";s:14:\"navigation bar\";s:11:\"content_top\";s:11:\"content top\";s:14:\"content_bottom\";s:14:\"content bottom\";s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:10:{i:0;s:4:\"logo\";i:1;s:4:\"name\";i:2;s:6:\"slogan\";i:3;s:7:\"mission\";i:4;s:17:\"node_user_picture\";i:5;s:20:\"comment_user_picture\";i:6;s:6:\"search\";i:7;s:7:\"favicon\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),
	('sites/all/themes/inbode/inbode.info','inbode','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0,-1,0,'a:16:{s:4:\"name\";s:6:\"inbode\";s:11:\"description\";s:94:\"Read the <a href=\"http://drupal.org/node/226507\">online docs</a> on how to create a sub-theme.\";s:10:\"screenshot\";s:38:\"sites/all/themes/inbode/screenshot.png\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:3:\"zen\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:7:{s:10:\"layout.css\";s:34:\"sites/all/themes/inbode/layout.css\";s:17:\"html-elements.css\";s:41:\"sites/all/themes/inbode/html-elements.css\";s:8:\"tabs.css\";s:32:\"sites/all/themes/inbode/tabs.css\";s:10:\"inbode.css\";s:34:\"sites/all/themes/inbode/inbode.css\";s:7:\"zen.css\";s:31:\"sites/all/themes/inbode/zen.css\";s:10:\"screen.css\";s:34:\"sites/all/themes/inbode/screen.css\";s:14:\"morestyles.css\";s:38:\"sites/all/themes/inbode/morestyles.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:33:\"sites/all/themes/inbode/print.css\";}}s:23:\"conditional-stylesheets\";a:2:{s:7:\"if IE 6\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie6.css\";}}s:7:\"if IE 7\";a:1:{s:3:\"all\";a:1:{i:0;s:14:\"screen.ie7.css\";}}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"sites/all/themes/inbode/script.js\";}s:7:\"regions\";a:3:{s:6:\"header\";s:6:\"header\";s:6:\"footer\";s:6:\"footer\";s:14:\"closure_region\";s:7:\"closure\";}s:8:\"features\";a:2:{i:0;s:4:\"name\";i:1;s:6:\"slogan\";}s:8:\"settings\";a:8:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:3:\"zen\";s:9:\"datestamp\";s:10:\"1234555897\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),
	('themes/garland/minnelli/minnelli.info','minnelli','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),
	('sites/all/modules/filefield/filefield.module','filefield','module','',1,0,0,6104,0,'a:10:{s:4:\"name\";s:9:\"FileField\";s:11:\"description\";s:26:\"Defines a file field type.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"content\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.9\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1292197563\";s:10:\"dependents\";a:0:{}}'),
	('sites/all/modules/filefield/filefield_meta/filefield_meta.module','filefield_meta','module','',1,0,0,6100,0,'a:10:{s:4:\"name\";s:14:\"FileField Meta\";s:11:\"description\";s:48:\"Add metadata gathering and storage to FileField.\";s:12:\"dependencies\";a:2:{i:0;s:9:\"filefield\";i:1;s:6:\"getid3\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.0\";s:7:\"version\";s:7:\"6.x-3.9\";s:7:\"project\";s:9:\"filefield\";s:9:\"datestamp\";s:10:\"1292197563\";s:10:\"dependents\";a:0:{}}'),
	('sites/all/modules/imageapi/imageapi.module','imageapi','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"ImageAPI\";s:11:\"description\";s:38:\"ImageAPI supporting multiple toolkits.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.1\";s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1287340884\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),
	('sites/all/modules/imageapi/imageapi_gd.module','imageapi_gd','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:12:\"ImageAPI GD2\";s:11:\"description\";s:49:\"Uses PHP\'s built-in GD2 image processing support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1287340884\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/imageapi/imageapi_imagemagick.module','imageapi_imagemagick','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:20:\"ImageAPI ImageMagick\";s:11:\"description\";s:33:\"Command Line ImageMagick support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.9\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1287340884\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/menu_block_split/menu_block_split.module','menu_block_split','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:16:\"Menu block split\";s:11:\"description\";s:53:\"Allow to have an splitted menu tree within two blocks\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.1\";s:7:\"project\";s:16:\"menu_block_split\";s:9:\"datestamp\";s:10:\"1235255727\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/couloir_slideshow/couloir_slideshow.module','couloir_slideshow','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:17:\"Couloir Slideshow\";s:11:\"description\";s:27:\"Javascript block slideshow.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:17:\"couloir_slideshow\";s:9:\"datestamp\";s:10:\"1219797904\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/imce/imce.module','imce','module','',1,0,0,6002,0,'a:9:{s:4:\"name\";s:4:\"IMCE\";s:11:\"description\";s:82:\"An image/file uploader and browser supporting personal directories and user quota.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:4:\"imce\";s:9:\"datestamp\";s:10:\"1275099907\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/token/tokenSTARTER.module','tokenSTARTER','module','',0,0,0,0,0,'a:9:{s:4:\"name\";s:12:\"TokenSTARTER\";s:11:\"description\";s:72:\"Provides additional tokens and a base on which to build your own tokens.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.15\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1286469963\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/greetingbox/greetingbox.module','greetingbox','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:12:\"Greeting Box\";s:11:\"description\";s:71:\"Displays a custom message to a user based on which site they came from.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/captcha/captcha.module','captcha','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"CAPTCHA\";s:11:\"description\";s:61:\"Base CAPTCHA module for adding challenges to arbitrary forms.\";s:7:\"package\";s:12:\"Spam control\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.0\";s:7:\"project\";s:7:\"captcha\";s:9:\"datestamp\";s:10:\"1253743243\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/captcha/image_captcha/image_captcha.module','image_captcha','module','',0,0,0,6201,0,'a:10:{s:4:\"name\";s:13:\"Image CAPTCHA\";s:11:\"description\";s:32:\"Provides an image based CAPTCHA.\";s:7:\"package\";s:12:\"Spam control\";s:12:\"dependencies\";a:1:{i:0;s:7:\"captcha\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.0\";s:7:\"project\";s:7:\"captcha\";s:9:\"datestamp\";s:10:\"1253743243\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/recaptcha/recaptcha.module','recaptcha','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"reCAPTCHA\";s:11:\"description\";s:61:\"Uses the reCAPTCHA web service to improve the CAPTCHA system.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"captcha\";}s:7:\"package\";s:12:\"Spam control\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:9:\"recaptcha\";s:9:\"datestamp\";s:10:\"1259888472\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/recaptcha/recaptcha_mailhide.module','recaptcha_mailhide','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:18:\"reCAPTCHA Mailhide\";s:11:\"description\";s:58:\"Uses the reCAPTCHA web service to protect email addresses.\";s:7:\"package\";s:12:\"Spam control\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:9:\"recaptcha\";s:9:\"datestamp\";s:10:\"1259888472\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/captcha/text_captcha/text_captcha.module','text_captcha','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:12:\"Text CAPTCHA\";s:11:\"description\";s:37:\"Provides a simple text based CAPTCHA.\";s:7:\"package\";s:12:\"Spam control\";s:12:\"dependencies\";a:1:{i:0;s:7:\"captcha\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:11:\"6.x-1.0-rc2\";s:7:\"project\";s:7:\"captcha\";s:9:\"datestamp\";s:10:\"1207904704\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/webform/webform.module','webform','module','',0,0,0,-1,-1,'a:9:{s:4:\"name\";s:7:\"Webform\";s:11:\"description\";s:49:\"Enables the creation of forms and questionnaires.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.9\";s:7:\"project\";s:7:\"webform\";s:9:\"datestamp\";s:10:\"1257475622\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/inbode/inbode.module','inbode','module','',1,0,0,0,0,'a:7:{s:4:\"name\";s:10:\"inbode.com\";s:11:\"description\";s:89:\"Custom functionality for inbode.com by <a href=\"http://ten7i.com/\">Ten 7 Interactive</a>.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),
	('themes/pushbutton/pushbutton.info','pushbutton','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),
	('themes/garland/garland.info','garland','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),
	('themes/chameleon/marvin/marvin.info','marvin','theme','',0,0,0,-1,0,'a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/swfupload/swfupload.module','swfupload','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:16:\"SWFupload Widget\";s:11:\"description\";s:93:\"A widget for CCK\'s Filefield which enables multiple file uploads using the SWFUpload library.\";s:7:\"package\";s:3:\"CCK\";s:7:\"version\";s:13:\"6.x-2.0-beta8\";s:12:\"dependencies\";a:2:{i:0;s:9:\"filefield\";i:1;s:3:\"jqp\";}s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:9:\"swfupload\";s:9:\"datestamp\";s:10:\"1291307743\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/adsense.module','adsense','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"AdSense core\";s:11:\"description\";s:116:\"Displays Google AdSense ads on your site to earn revenue. Requires at least one additional ad unit generator module.\";s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/contrib/adsense_click/adsense_click.module','adsense_click','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:22:\"AdSense Click Tracking\";s:11:\"description\";s:31:\"Tracks clicks to Google Adsense\";s:12:\"dependencies\";a:1:{i:0;s:7:\"adsense\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/cse/adsense_cse.module','adsense_cse','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:10:\"CSE Search\";s:11:\"description\";s:122:\"AdSense for Search generator module. This module uses the new Custom Search Engine code created via the Adsense interface.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"adsense\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/managed/adsense_managed.module','adsense_managed','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:11:\"Managed ads\";s:11:\"description\";s:96:\"Ad unit generator module using the new managed ads feature available in the Google AdSense site.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"adsense\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/old/oldcode/adsense_oldcode.module','adsense_oldcode','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:9:\"Ads (old)\";s:11:\"description\";s:109:\"Ad unit generator module using the old format code in which the colours are specified in the ad\'s JavaScript.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"adsense\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/old/search/adsense_search.module','adsense_search','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:12:\"Search (old)\";s:11:\"description\";s:154:\"AdSense for Search generator module. This module uses the \'old\' code in which the user can select to search the entire Web or 1 to 3 user-defined domains.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"adsense\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/adsense/old/revenue_sharing_basic/revenue_sharing_basic.module','revenue_sharing_basic','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:27:\"Revenue sharing basic (old)\";s:11:\"description\";s:45:\"Revenue sharing for the Google Adsense module\";s:12:\"dependencies\";a:2:{i:0;s:7:\"adsense\";i:1;s:7:\"profile\";}s:7:\"package\";s:7:\"Adsense\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:7:\"adsense\";s:9:\"datestamp\";s:10:\"1249507210\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/disqus/disqus_migrate.module','disqus_migrate','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:14:\"Disqus Migrate\";s:11:\"description\";s:90:\"Provides migration tools for moving comments between Disqus and the Drupal comment system.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:6:\"disqus\";i:1;s:7:\"comment\";}s:3:\"php\";s:1:\"5\";s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:6:\"disqus\";s:9:\"datestamp\";s:10:\"1259864129\";s:10:\"dependents\";a:0:{}}'),
	('sites/all/modules/path_redirect/generate/path_redirect_generate.module','path_redirect_generate','module','',0,0,0,0,0,'a:11:{s:4:\"name\";s:22:\"Path redirect generate\";s:11:\"description\";s:34:\"Bulk create redirects for testing.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:13:\"path_redirect\";i:1;s:14:\"devel_generate\";}s:4:\"tags\";a:1:{i:0;s:9:\"developer\";}s:7:\"version\";s:11:\"6.x-1.0-rc2\";s:7:\"project\";s:13:\"path_redirect\";s:9:\"datestamp\";s:10:\"1291583783\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/devel/devel.module','devel','module','',0,0,0,-1,88,'a:10:{s:4:\"name\";s:5:\"Devel\";s:11:\"description\";s:52:\"Various blocks, pages, and functions for developers.\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:4:\"menu\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1253731828\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/getid3/getid3.module','getid3','module','',1,0,0,0,-10,'a:9:{s:4:\"name\";s:8:\"getID3()\";s:11:\"description\";s:66:\"getID3() extracts useful information from multimedia file formats.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:6:\"getid3\";s:9:\"datestamp\";s:10:\"1280030411\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/devel/devel_generate.module','devel_generate','module','',0,0,0,0,0,'a:10:{s:4:\"name\";s:14:\"Devel generate\";s:11:\"description\";s:48:\"Generate dummy users, nodes, and taxonomy terms.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1253731828\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/devel/devel_node_access.module','devel_node_access','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Devel node access\";s:11:\"description\";s:67:\"Developer block and page illustrating relevant node_access records.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1253731828\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/devel/devel_themer.module','devel_themer','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Theme developer\";s:11:\"description\";s:52:\"Essential theme API information for theme developers\";s:7:\"package\";s:11:\"Development\";s:12:\"dependencies\";a:1:{i:0;s:5:\"devel\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1253731828\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/devel/performance/performance.module','performance','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Performance Logging\";s:11:\"description\";s:91:\"Logs detailed and/or summary page generation time and memory consumption for page requests.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"devel\";s:9:\"datestamp\";s:10:\"1253731828\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/logintoboggan/logintoboggan.module','logintoboggan','module','',1,0,0,6001,0,'a:9:{s:4:\"name\";s:13:\"LoginToboggan\";s:11:\"description\";s:31:\"Improves Drupal\'s login system.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.8\";s:7:\"project\";s:13:\"logintoboggan\";s:9:\"datestamp\";s:10:\"1294339601\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/drupalforfirebug/drupalforfirebug.module','drupalforfirebug','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:18:\"Drupal for Firebug\";s:11:\"description\";s:69:\"A helper extension for the Drupal for Firebug Firefox extension addon\";s:7:\"package\";s:18:\"Drupal for Firebug\";s:12:\"dependencies\";a:1:{i:0;s:27:\"drupalforfirebug_preprocess\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:16:\"drupalforfirebug\";s:9:\"datestamp\";s:10:\"1246501517\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/drupalforfirebug/drupalforfirebug_preprocess.module','drupalforfirebug_preprocess','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:31:\"Drupal for Firebug Preprocessor\";s:11:\"description\";s:92:\"A helper extension for the Drupal for Firebug Firefox extension to do preprocessing of forms\";s:7:\"package\";s:18:\"Drupal for Firebug\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:16:\"drupalforfirebug\";s:9:\"datestamp\";s:10:\"1246501517\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/money/money.module','money','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:15:\"Money CCK field\";s:11:\"description\";s:50:\"Defines a CCK field with an amount and a currency.\";s:12:\"dependencies\";a:4:{i:0;s:7:\"content\";i:1;s:12:\"currency_api\";i:2;s:13:\"format_number\";i:3;s:16:\"formatted_number\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"money\";s:9:\"datestamp\";s:10:\"1247092302\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/money/modules/money_conversion_dialog/money_conversion_dialog.module','money_conversion_dialog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:33:\"Money CCK field Conversion Dialog\";s:11:\"description\";s:58:\"Provides a \'Click to convert!\' addon for Money CCK fields.\";s:12:\"dependencies\";a:6:{i:0;s:7:\"content\";i:1;s:12:\"currency_api\";i:2;s:13:\"format_number\";i:3;s:16:\"formatted_number\";i:4;s:5:\"money\";i:5;s:9:\"jquery_ui\";}s:7:\"package\";s:3:\"CCK\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"money\";s:9:\"datestamp\";s:10:\"1247092302\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/currency/currency.module','currency','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Currency\";s:11:\"description\";s:45:\"This module provides currency exchange rates.\";s:12:\"dependencies\";a:1:{i:0;s:12:\"currency_api\";}s:7:\"package\";s:8:\"Currency\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:8:\"currency\";s:9:\"datestamp\";s:10:\"1262807404\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/currency/currency_api/currency_api.module','currency_api','module','',1,0,0,1,0,'a:10:{s:4:\"name\";s:12:\"Currency API\";s:11:\"description\";s:52:\"This module provides an API for currency conversion.\";s:7:\"package\";s:8:\"Currency\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:8:\"currency\";s:9:\"datestamp\";s:10:\"1262807404\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/formatted_number/formatted_number.module','formatted_number','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:20:\"Formatted Number CCK\";s:11:\"description\";s:118:\"Defines CCK numeric types where thousands separator and decimal point are inherited from the Format Number API module.\";s:7:\"package\";s:3:\"CCK\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:13:\"format_number\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:16:\"formatted_number\";s:9:\"datestamp\";s:10:\"1253449838\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/format_number/format_number.module','format_number','module','',1,0,0,6000,0,'a:9:{s:4:\"name\";s:17:\"Format Number API\";s:11:\"description\";s:268:\"This module provides a method to configure number formats (site default and user defined) with configurable decimal point and thousand separators. It also exposes several functions that can be used by other contributed or custom modules to display numbers accordingly.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:13:\"format_number\";s:9:\"datestamp\";s:10:\"1261813832\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date/date.module','date','module','',1,0,0,6005,0,'a:10:{s:4:\"name\";s:4:\"Date\";s:11:\"description\";s:41:\"Defines CCK date/time fields and widgets.\";s:12:\"dependencies\";a:3:{i:0;s:7:\"content\";i:1;s:8:\"date_api\";i:2;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_api.module','date_api','module','',1,0,0,6006,0,'a:10:{s:4:\"name\";s:8:\"Date API\";s:11:\"description\";s:45:\"A Date API that can be used by other modules.\";s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_locale/date_locale.module','date_locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:11:\"Date Locale\";s:11:\"description\";s:124:\"Allows the site admin to configure multiple formats for date/time display to tailor dates for a specific locale or audience.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:6:\"locale\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_php4/date_php4.module','date_php4','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"Date PHP4\";s:11:\"description\";s:134:\"Emulate PHP 5.2 date functions in PHP 4.x, PHP 5.0, and PHP 5.1. Required when using the Date API with PHP versions less than PHP 5.2.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_popup/date_popup.module','date_popup','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:10:\"Date Popup\";s:11:\"description\";s:84:\"Enables jquery popup calendars and time entry widgets for selecting dates and times.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"date_api\";i:1;s:13:\"date_timezone\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_repeat/date_repeat.module','date_repeat','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Date Repeat API\";s:11:\"description\";s:73:\"A Date Repeat API to calculate repeating dates and times from iCal rules.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_timezone/date_timezone.module','date_timezone','module','',1,0,0,5200,0,'a:10:{s:4:\"name\";s:13:\"Date Timezone\";s:11:\"description\";s:111:\"Needed when using Date API. Overrides site and user timezone handling to set timezone names instead of offsets.\";s:7:\"package\";s:9:\"Date/Time\";s:12:\"dependencies\";a:1:{i:0;s:8:\"date_api\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/date/date_tools/date_tools.module','date_tools','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Date Tools\";s:11:\"description\";s:52:\"Tools to import and auto-create dates and calendars.\";s:12:\"dependencies\";a:2:{i:0;s:7:\"content\";i:1;s:4:\"date\";}s:7:\"package\";s:9:\"Date/Time\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.7\";s:7:\"project\";s:4:\"date\";s:9:\"datestamp\";s:10:\"1294059080\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/location.module','location','module','',1,0,0,6309,0,'a:10:{s:4:\"name\";s:8:\"Location\";s:7:\"package\";s:8:\"Location\";s:11:\"description\";s:213:\"The location module allows you to associate a geographic location with content and users. Users can do proximity searches by postal code.  This is useful for organizing communities that have a geographic presence.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_addanother/location_addanother.module','location_addanother','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:20:\"Location Add Another\";s:11:\"description\";s:94:\"Allows you to quickly add locations directly from a node without having to click \'edit\' first.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"location\";i:1;s:13:\"location_node\";}s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_cck/location_cck.module','location_cck','module','',1,0,0,6301,0,'a:10:{s:4:\"name\";s:12:\"Location CCK\";s:11:\"description\";s:30:\"Defines a Location field type.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:3:\"CCK\";s:12:\"dependencies\";a:2:{i:0;s:8:\"location\";i:1;s:7:\"content\";}s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_fax/location_fax.module','location_fax','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Location Fax\";s:7:\"package\";s:8:\"Location\";s:11:\"description\";s:45:\"Allows you to add a fax number to a location.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"location\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_generate/location_generate.module','location_generate','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Location Generate\";s:11:\"description\";s:52:\"Bulk assign random latitude and longitudes to nodes.\";s:7:\"package\";s:11:\"Development\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:14:\"devel_generate\";i:1;s:8:\"location\";}s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_phone/location_phone.module','location_phone','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Location Phone\";s:7:\"package\";s:8:\"Location\";s:11:\"description\";s:47:\"Allows you to add a phone number to a location.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"location\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_search/location_search.module','location_search','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"Location Search\";s:7:\"package\";s:8:\"Location\";s:11:\"description\";s:35:\"Advanced search page for locations.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:3:{i:0;s:6:\"search\";i:1;s:8:\"location\";i:2;s:4:\"gmap\";}s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/location_user.module','location_user','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"User Locations\";s:11:\"description\";s:31:\"Associate locations with users.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"location\";}s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/gmap/gmap.module','gmap','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"GMap\";s:11:\"description\";s:53:\"Filter to allow insertion of a google map into a node\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:8:\"Location\";s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:4:\"gmap\";s:9:\"datestamp\";s:10:\"1229117118\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/gmap/gmap_location.module','gmap_location','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"GMap Location\";s:11:\"description\";s:50:\"Display location.module information on Google Maps\";s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:4:\"gmap\";i:1;s:8:\"location\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:4:\"gmap\";s:9:\"datestamp\";s:10:\"1229117118\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/gmap/gmap_macro_builder.module','gmap_macro_builder','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:18:\"GMap Macro Builder\";s:11:\"description\";s:28:\"UI for building GMap macros.\";s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:4:\"gmap\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:4:\"gmap\";s:9:\"datestamp\";s:10:\"1229117118\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/gmap/gmap_taxonomy.module','gmap_taxonomy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"GMap Taxonomy Markers\";s:11:\"description\";s:22:\"Taxonomy based markers\";s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:4:\"gmap\";}s:7:\"version\";s:7:\"6.x-1.0\";s:7:\"project\";s:4:\"gmap\";s:9:\"datestamp\";s:10:\"1229117118\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/location_node.module','location_node','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:14:\"Node Locations\";s:11:\"description\";s:31:\"Associate locations with nodes.\";s:12:\"dependencies\";a:1:{i:0;s:8:\"location\";}s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/location/contrib/location_taxonomy/location_taxonomy.module','location_taxonomy','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:17:\"Location Taxonomy\";s:11:\"description\";s:40:\"Associate locations with taxonomy terms.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"location\";i:1;s:8:\"taxonomy\";}s:7:\"package\";s:8:\"Location\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-3.1\";s:7:\"project\";s:8:\"location\";s:9:\"datestamp\";s:10:\"1278427508\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/email_registration/email_registration.module','email_registration','module','',1,0,0,3,10,'a:9:{s:4:\"name\";s:18:\"Email Registration\";s:11:\"description\";s:44:\"For registration process without a username.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:18:\"email_registration\";s:9:\"datestamp\";s:10:\"1267137008\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/jquery_ui/jquery_ui.module','jquery_ui','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:9:\"jQuery UI\";s:11:\"description\";s:55:\"Provides the jQuery UI plug-in to other Drupal modules.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:9:\"jquery_ui\";s:9:\"datestamp\";s:10:\"1284001909\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/login_destination/login_destination.module','login_destination','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:17:\"Login destination\";s:11:\"description\";s:52:\"Control where users are directed to once they login.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.12\";s:7:\"project\";s:17:\"login_destination\";s:9:\"datestamp\";s:10:\"1288637148\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/view_own/view_own.module','view_own','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:8:\"View own\";s:11:\"description\";s:68:\"Provide \'view own\' and \'view any\' access right for all content types\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:8:\"view_own\";s:9:\"datestamp\";s:10:\"1220502629\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/modalframe/modalframe.module','modalframe','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:15:\"Modal Frame API\";s:11:\"description\";s:95:\"Provides an API to render an iframe within a modal dialog based on the jQuery UI Dialog plugin.\";s:7:\"package\";s:11:\"Modal frame\";s:12:\"dependencies\";a:1:{i:0;s:9:\"jquery_ui\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.7\";s:7:\"project\";s:10:\"modalframe\";s:9:\"datestamp\";s:10:\"1273809616\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/modalframe/modules/modalframe_example/modalframe_example.module','modalframe_example','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Modal Frame Example\";s:11:\"description\";s:32:\"Example for the Modal Frame API.\";s:7:\"package\";s:11:\"Modal frame\";s:12:\"dependencies\";a:1:{i:0;s:10:\"modalframe\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.7\";s:7:\"project\";s:10:\"modalframe\";s:9:\"datestamp\";s:10:\"1273809616\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/noderelationships/noderelationships.module','noderelationships','module','',1,0,0,6003,1,'a:10:{s:4:\"name\";s:18:\"Node Relationships\";s:11:\"description\";s:121:\"Provides methods to complete two way relationships between content types enhancing the features of node reference fields.\";s:7:\"package\";s:3:\"CCK\";s:12:\"dependencies\";a:5:{i:0;s:7:\"content\";i:1;s:13:\"nodereference\";i:2;s:5:\"views\";i:3;s:10:\"modalframe\";i:4;s:9:\"jquery_ui\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.6\";s:7:\"project\";s:17:\"noderelationships\";s:9:\"datestamp\";s:10:\"1274035809\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/image_upload/image_upload.module','image_upload','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Image Upload\";s:11:\"description\";s:103:\"Allows users to upload and attach images to content, similar to Imagefield. Based on the upload module.\";s:7:\"package\";s:5:\"Other\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:12:\"image_upload\";s:9:\"datestamp\";s:10:\"1231334717\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/nodeaccess/nodeaccess.module','nodeaccess','module','',1,0,0,3,0,'a:9:{s:4:\"name\";s:10:\"Nodeaccess\";s:11:\"description\";s:32:\"Provides per node access control\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.3\";s:7:\"project\";s:10:\"nodeaccess\";s:9:\"datestamp\";s:10:\"1236471659\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/prepopulate/prepopulate.module','prepopulate','module','',1,0,0,0,10,'a:9:{s:4:\"name\";s:11:\"Prepopulate\";s:11:\"description\";s:53:\"Allows form elements to be prepopulated from the URL.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.1\";s:7:\"project\";s:11:\"prepopulate\";s:9:\"datestamp\";s:10:\"1282629408\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/content_access/content_access.module','content_access','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Content Access\";s:11:\"description\";s:40:\"Provides flexible content access control\";s:7:\"package\";s:14:\"Access control\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:14:\"content_access\";s:9:\"datestamp\";s:10:\"1249035332\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/logintoboggan/contrib/logintoboggan_rules/logintoboggan_rules.module','logintoboggan_rules','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:31:\"LoginToboggan Rules Integration\";s:11:\"description\";s:42:\"Integrates LoginToboggan with Rules module\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:13:\"logintoboggan\";i:1;s:5:\"rules\";}s:7:\"version\";s:7:\"6.x-1.8\";s:7:\"project\";s:13:\"logintoboggan\";s:9:\"datestamp\";s:10:\"1294339601\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('themes/chameleon/chameleon.info','chameleon','theme','themes/chameleon/chameleon.theme',0,0,0,-1,0,'a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),
	('themes/bluemarine/bluemarine.info','bluemarine','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.20\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1292447788\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/jqp/jqp.module','jqp','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:21:\"jQuery Plugin Handler\";s:11:\"description\";s:126:\"Provides both an API for modules, and an UI for administrators, to manage and include javascript libraries like jQuery plugins\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.5\";s:7:\"project\";s:3:\"jqp\";s:9:\"datestamp\";s:10:\"1285670162\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('swfupload-module-jqp','swfupload','javascript library','',1,0,0,-1,0,'a:11:{s:4:\"name\";s:9:\"SWFUpload\";s:11:\"description\";s:97:\"This library allows you to upload multiple files at once by ctrl/shift-selecting in dialog boxed.\";s:11:\"project_url\";s:35:\"http://code.google.com/p/swfupload/\";s:7:\"scripts\";a:1:{s:7:\"2.2.0.1\";a:2:{s:42:\"sites/all/libraries/swfupload/swfupload.js\";s:42:\"sites/all/libraries/swfupload/swfupload.js\";s:7:\"changed\";b:1;}}s:8:\"filename\";s:20:\"swfupload-module-jqp\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:12:\"old_filename\";s:20:\"swfupload-module-jqp\";s:7:\"version\";N;s:4:\"base\";N;}'),
	('sites/all/modules/ajax/ajax.module','ajax','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Ajax\";s:11:\"description\";s:63:\"Automatically validates and submits any Drupal form using AJAX.\";s:7:\"package\";s:4:\"Ajax\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/captcha/ajax_captcha.module','ajax_captcha','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"Ajax plugin - captcha\";s:11:\"description\";s:160:\"Enables AJAX functionality with CAPTCHA-enabled forms. This module requires that the patches in \'ajax/plugins/captcha/patches\' be applied to the CAPTCHA module.\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"captcha\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/comment/ajax_comment.module','ajax_comment','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"Ajax plugin - comment\";s:11:\"description\";s:44:\"Enables ajax functionality for comment forms\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"comment\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/disable_redirect/ajax_disable_redirect.module','ajax_disable_redirect','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:30:\"Ajax plugin - disable_redirect\";s:11:\"description\";s:54:\"Allows form redirections to be disabled for Ajax forms\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"ajax_ui\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/fckeditor/ajax_fckeditor.module','ajax_fckeditor','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:23:\"Ajax plugin - fckeditor\";s:11:\"description\";s:40:\"Enables AJAX functionality for FCKEditor\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:9:\"fckeditor\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/loggintoboggan/ajax_logintoboggan.module','ajax_logintoboggan','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:27:\"Ajax plugin - logintoboggan\";s:11:\"description\";s:50:\"Enables AJAX functionality for LoginToboggan forms\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:13:\"logintoboggan\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/quicktabs/ajax_quicktabs.module','ajax_quicktabs','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:23:\"Ajax plugin - quicktabs\";s:11:\"description\";s:42:\"Enhances AJAX functionality for quicktabs.\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:9:\"quicktabs\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/thickbox/ajax_thickbox.module','ajax_thickbox','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:22:\"Ajax plugin - thickbox\";s:11:\"description\";s:41:\"Enhances AJAX functionality for thickbox.\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:1:{i:0;s:4:\"ajax\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/tinymce/ajax_tinymce.module','ajax_tinymce','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"Ajax plugin - tinymce\";s:11:\"description\";s:38:\"Enables AJAX functionality for tinymce\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"tinymce\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/ajax_ui/ajax_ui.module','ajax_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Ajax ui\";s:11:\"description\";s:93:\"User Interface for Ajax forms. You will not be able to manage Ajax forms without this module.\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:1:{i:0;s:4:\"ajax\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/webform/ajax_webform.module','ajax_webform','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"Ajax plugin - webform\";s:11:\"description\";s:39:\"Enables AJAX functionality for webforms\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"webform\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),
	('sites/all/modules/ajax/plugins/wysiwyg/ajax_wysiwyg.module','ajax_wysiwyg','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:21:\"Ajax plugin - wysiwyg\";s:11:\"description\";s:42:\"Enables AJAX functionality for wysiwyg API\";s:7:\"package\";s:4:\"Ajax\";s:12:\"dependencies\";a:2:{i:0;s:4:\"ajax\";i:1;s:7:\"wysiwyg\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.14\";s:7:\"project\";s:4:\"ajax\";s:9:\"datestamp\";s:10:\"1240859105\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}');

/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table term_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `term_data`;

CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `term_data` WRITE;
/*!40000 ALTER TABLE `term_data` DISABLE KEYS */;
INSERT INTO `term_data` (`tid`,`vid`,`name`,`description`,`weight`)
VALUES
	(1,1,'Default','',0);

/*!40000 ALTER TABLE `term_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table term_hierarchy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `term_hierarchy`;

CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `term_hierarchy` WRITE;
/*!40000 ALTER TABLE `term_hierarchy` DISABLE KEYS */;
INSERT INTO `term_hierarchy` (`tid`,`parent`)
VALUES
	(1,0);

/*!40000 ALTER TABLE `term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table term_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `term_node`;

CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table term_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `term_relation`;

CREATE TABLE `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table term_synonym
# ------------------------------------------------------------

DROP TABLE IF EXISTS `term_synonym`;

CREATE TABLE `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_alias`;

CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
INSERT INTO `url_alias` (`pid`,`src`,`dst`,`language`)
VALUES
	(6,'user/4','users/2kulf4bwgd',''),
	(7,'user/5','users/lcjy7ta6gz',''),
	(186,'user/8','users/35xq3algj8',''),
	(132,'node/116/feed','unit/116/feed',''),
	(188,'node/144','home',''),
	(16,'taxonomy/term/1','category/image-upload/default',''),
	(91,'node/46','unit/46',''),
	(92,'node/46/feed','unit/46/feed',''),
	(99,'node/50','unit/50',''),
	(100,'node/50/feed','unit/50/feed',''),
	(187,'user/9','users/te7ybxjx3h',''),
	(189,'node/144/feed','content/test/feed','');

/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

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
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `timezone_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`,`name`,`pass`,`mail`,`mode`,`sort`,`threshold`,`theme`,`signature`,`created`,`access`,`login`,`status`,`timezone`,`language`,`picture`,`init`,`data`,`signature_format`,`timezone_name`)
VALUES
	(0,'','','',0,0,0,'','',0,0,0,0,NULL,'','','',NULL,0,''),
	(1,'tenseven','a09a3ead1dedcc6822cfdefe6863e79a','admin@ten7i.net',0,0,0,'','',1240964328,1300799567,1300324003,1,'-18000','','','admin@ten7i.net','a:1:{s:13:\"form_build_id\";s:37:\"form-397ca35a59c3a16135a0fdff30afcf50\";}',0,'America/Chicago'),
	(5,'inbodemanager','f6af13728d25fdaa6ac92d9753a7287a','inbodemanager@ten7i.net',0,0,0,'','',1273513191,1300799520,1300761357,1,'-18000','','','inbodemanager@ten7i.net','a:1:{s:13:\"form_build_id\";s:37:\"form-43a6596f665e460d99ea395a5b9d4d80\";}',0,''),
	(4,'inbodeuser','308bf42d888e00d2b43b5ed7b56a82d7','inbodeuser@ten7i.net',0,0,0,'','',1273513169,1297057538,1297057537,1,'-18000','','','inbodeuser@ten7i.net','a:1:{s:13:\"form_build_id\";s:37:\"form-0ebba288904d2536fa13db0a52133f18\";}',0,''),
	(8,'charlie','d1ba39c0f022e1f8dc46752d0e615366','charlie@inbode.com',0,0,0,'','',1296850258,1296850258,0,1,NULL,'','','charlie@inbode.com','a:1:{s:13:\"form_build_id\";s:37:\"form-c5aa2a6306f5960d9aa758e191261eeb\";}',0,''),
	(9,'matt','d3309ec68bcc494dd1d4d91c216762af','matt@inbode.com',0,0,0,'','',1296850274,1296855503,1296855538,1,NULL,'','','matt@inbode.com','a:1:{s:13:\"form_build_id\";s:37:\"form-fd0702f7333a9690ac38c2240eeeb58a\";}',0,'');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` (`uid`,`rid`)
VALUES
	(4,5),
	(5,4),
	(8,3),
	(9,3);

/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table variable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `variable`;

CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` (`name`,`value`)
VALUES
	('theme_default','s:6:\"inbode\";'),
	('filter_html_1','i:1;'),
	('node_options_forum','a:1:{i:0;s:6:\"status\";}'),
	('drupal_private_key','s:64:\"98090e99f104d960eea773f4e6877da4f98bbcde2d94663f9b0c9d96498e92cc\";'),
	('menu_masks','a:25:{i:0;i:127;i:1;i:125;i:2;i:92;i:3;i:63;i:4;i:62;i:5;i:61;i:6;i:60;i:7;i:59;i:8;i:57;i:9;i:44;i:10;i:31;i:11;i:30;i:12;i:29;i:13;i:28;i:14;i:24;i:15;i:21;i:16;i:15;i:17;i:14;i:18;i:11;i:19;i:7;i:20;i:6;i:21;i:5;i:22;i:3;i:23;i:2;i:24;i:1;}'),
	('seo_checklist_link','i:0;'),
	('install_task','s:4:\"done\";'),
	('menu_expanded','a:0:{}'),
	('site_name','s:6:\"inbode\";'),
	('site_mail','s:15:\"admin@ten7i.net\";'),
	('date_default_timezone','i:-21600;'),
	('user_email_verification','i:0;'),
	('clean_url','s:1:\"1\";'),
	('install_time','i:1240964363;'),
	('node_options_page','a:0:{}'),
	('comment_page','i:0;'),
	('theme_settings','a:20:{s:11:\"toggle_logo\";i:0;s:11:\"toggle_name\";i:1;s:13:\"toggle_slogan\";i:0;s:14:\"toggle_mission\";i:0;s:24:\"toggle_node_user_picture\";i:0;s:27:\"toggle_comment_user_picture\";i:0;s:13:\"toggle_search\";i:0;s:14:\"toggle_favicon\";i:0;s:20:\"toggle_primary_links\";i:0;s:22:\"toggle_secondary_links\";i:0;s:25:\"toggle_node_info_building\";i:0;s:21:\"toggle_node_info_page\";i:0;s:21:\"toggle_node_info_unit\";i:0;s:25:\"toggle_node_info_betahome\";i:0;s:12:\"default_logo\";i:0;s:9:\"logo_path\";s:0:\"\";s:11:\"logo_upload\";s:0:\"\";s:15:\"default_favicon\";i:0;s:12:\"favicon_path\";s:0:\"\";s:14:\"favicon_upload\";s:0:\"\";}'),
	('drupal_http_request_fails','b:0;'),
	('css_js_query_string','s:20:\"93MscBFOI7jyGPmi1oUl\";'),
	('install_profile','s:7:\"default\";'),
	('update_last_check','i:1300639585;'),
	('file_directory_temp','s:4:\"/tmp\";'),
	('javascript_parsed','a:0:{}'),
	('admin_menu_margin_top','i:1;'),
	('cron_last','i:1296813564;'),
	('admin_menu_position_fixed','i:1;'),
	('admin_menu_tweak_modules','i:0;'),
	('admin_menu_tweak_tabs','i:0;'),
	('wipe','s:16:\"Wipe and rebuild\";'),
	('jquery_update_compression_type','s:4:\"none\";'),
	('googleanalytics_visibility','i:0;'),
	('googleanalytics_pages','s:41:\"admin\nadmin/*\nuser/*/*\nnode/add*\nnode/*/*\";'),
	('jquery_update_replace','b:1;'),
	('conditional_styles_zen_classic','s:130:\"<!--[if IE]>\n<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/sites/all/themes/zen/zen_classic/ie.css?B\" />\n<![endif]-->\n\";'),
	('theme_zen_settings','a:30:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";s:7:\"mission\";s:0:\"\";s:12:\"default_logo\";i:1;s:9:\"logo_path\";s:0:\"\";s:15:\"default_favicon\";i:1;s:12:\"favicon_path\";s:0:\"\";s:13:\"primary_links\";i:1;s:15:\"secondary_links\";i:1;s:11:\"toggle_logo\";i:1;s:14:\"toggle_favicon\";i:1;s:11:\"toggle_name\";i:1;s:13:\"toggle_search\";i:0;s:13:\"toggle_slogan\";i:0;s:14:\"toggle_mission\";i:1;s:24:\"toggle_node_user_picture\";i:0;s:27:\"toggle_comment_user_picture\";i:0;s:20:\"toggle_primary_links\";i:1;s:22:\"toggle_secondary_links\";i:1;s:25:\"toggle_node_info_betahome\";i:0;s:11:\"logo_upload\";s:0:\"\";s:14:\"favicon_upload\";s:0:\"\";s:22:\"toggle_node_info_story\";i:0;}'),
	('theme_zen_classic_settings','a:29:{s:17:\"zen_block_editing\";i:1;s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:8:\" &rarr; \";s:19:\"zen_breadcrumb_home\";i:1;s:23:\"zen_breadcrumb_trailing\";i:0;s:20:\"zen_breadcrumb_title\";i:0;s:17:\"zen_classic_fixed\";i:0;s:10:\"zen_layout\";s:22:\"border-politics-liquid\";s:20:\"zen_rebuild_registry\";s:1:\"0\";s:14:\"zen_wireframes\";s:1:\"0\";s:7:\"mission\";s:0:\"\";s:12:\"default_logo\";i:0;s:9:\"logo_path\";s:0:\"\";s:15:\"default_favicon\";i:0;s:12:\"favicon_path\";s:0:\"\";s:13:\"primary_links\";i:1;s:15:\"secondary_links\";i:1;s:11:\"toggle_logo\";i:0;s:14:\"toggle_favicon\";i:0;s:11:\"toggle_name\";i:1;s:13:\"toggle_search\";i:0;s:13:\"toggle_slogan\";i:0;s:14:\"toggle_mission\";i:0;s:24:\"toggle_node_user_picture\";i:0;s:27:\"toggle_comment_user_picture\";i:0;s:20:\"toggle_primary_links\";i:0;s:22:\"toggle_secondary_links\";i:0;s:11:\"logo_upload\";s:0:\"\";s:14:\"favicon_upload\";s:0:\"\";}'),
	('admin_theme','s:1:\"0\";'),
	('node_admin_theme','i:1;'),
	('site_offline','s:1:\"0\";'),
	('site_offline_message','s:97:\"This site is currently under maintenance. We should be back shortly. Thank you for your patience.\";'),
	('image_toolkit','s:2:\"gd\";'),
	('robotstxt','s:1397:\"# Ten Seven Interactive\r\n# http://tenseveninteractive.com/\r\n# Adapted from the default drupal file\r\n#\r\n# robots.txt\r\n#\r\n# This file is to prevent the crawling and indexing of certain parts\r\n# of your site by web crawlers and spiders run by sites like Yahoo!\r\n# and Google. By telling these robots where not to go on your site,\r\n# you save bandwidth and server resources.\r\n#\r\n# This file will be ignored unless it is at the root of your host:\r\n# Used:    http://example.com/robots.txt\r\n# Ignored: http://example.com/site/robots.txt\r\n#\r\n# For more information about the robots.txt standard, see:\r\n# http://www.robotstxt.org/wc/robots.html\r\n#\r\n\r\nUser-agent: *\r\nCrawl-delay: 10\r\n# Directories\r\nDisallow: /includes/\r\nDisallow: /misc/\r\nDisallow: /modules/\r\nDisallow: /profiles/\r\nDisallow: /scripts/\r\nDisallow: /sites/\r\nDisallow: /themes/\r\n# Files\r\nDisallow: /cron.php\r\nDisallow: /update.php\r\nDisallow: /xmlrpc.php\r\n# Paths (clean URLs)\r\nDisallow: /admin/\r\nDisallow: /comment/reply/\r\nDisallow: /contact/\r\nDisallow: /logout/\r\nDisallow: /node/add/\r\nDisallow: /search/\r\nDisallow: /user/register/\r\nDisallow: /user/password/\r\nDisallow: /user/login/\r\n# Paths (no clean URLs)\r\nDisallow: /?q=admin/\r\nDisallow: /?q=comment/reply/\r\nDisallow: /?q=contact/\r\nDisallow: /?q=logout/\r\nDisallow: /?q=node/add/\r\nDisallow: /?q=search/\r\nDisallow: /?q=user/password/\r\nDisallow: /?q=user/register/\r\nDisallow: /?q=user/login/\r\n\";'),
	('googleanalytics_last_cache','i:1251405426;'),
	('content_schema_version','i:6009;'),
	('imce_profiles','a:2:{i:1;a:10:{s:4:\"name\";s:6:\"User-1\";s:8:\"filesize\";i:0;s:5:\"quota\";i:0;s:7:\"tuquota\";i:0;s:10:\"extensions\";s:1:\"*\";s:10:\"dimensions\";s:9:\"1200x1200\";s:7:\"filenum\";i:0;s:11:\"directories\";a:1:{i:0;a:7:{s:4:\"name\";s:1:\".\";s:6:\"subnav\";i:1;s:6:\"browse\";i:1;s:6:\"upload\";i:1;s:5:\"thumb\";i:1;s:6:\"delete\";i:1;s:6:\"resize\";i:1;}}s:10:\"thumbnails\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"Small\";s:10:\"dimensions\";s:5:\"90x90\";s:6:\"prefix\";s:6:\"small_\";s:6:\"suffix\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"Medium\";s:10:\"dimensions\";s:7:\"120x120\";s:6:\"prefix\";s:7:\"medium_\";s:6:\"suffix\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:5:\"Large\";s:10:\"dimensions\";s:7:\"180x180\";s:6:\"prefix\";s:6:\"large_\";s:6:\"suffix\";s:0:\"\";}}s:7:\"usertab\";i:1;}i:2;a:10:{s:4:\"name\";s:14:\"Sample profile\";s:8:\"filesize\";i:1;s:5:\"quota\";i:2;s:7:\"tuquota\";i:0;s:10:\"extensions\";s:16:\"gif png jpg jpeg\";s:10:\"dimensions\";s:7:\"800x600\";s:7:\"filenum\";i:1;s:11:\"directories\";a:1:{i:0;a:7:{s:4:\"name\";s:5:\"u%uid\";s:6:\"subnav\";i:0;s:6:\"browse\";i:1;s:6:\"upload\";i:1;s:5:\"thumb\";i:1;s:6:\"delete\";i:0;s:6:\"resize\";i:0;}}s:10:\"thumbnails\";a:1:{i:0;a:4:{s:4:\"name\";s:5:\"Thumb\";s:10:\"dimensions\";s:5:\"90x90\";s:6:\"prefix\";s:6:\"thumb_\";s:6:\"suffix\";s:0:\"\";}}s:7:\"usertab\";i:1;}}'),
	('imce_roles_profiles','a:0:{}'),
	('pathauto_modulelist','a:3:{i:0;s:4:\"node\";i:1;s:8:\"taxonomy\";i:2;s:4:\"user\";}'),
	('pathauto_taxonomy_supportsfeeds','s:6:\"0/feed\";'),
	('pathauto_taxonomy_pattern','s:34:\"category/[vocab-raw]/[catpath-raw]\";'),
	('pathauto_taxonomy_bulkupdate','i:0;'),
	('pathauto_taxonomy_applytofeeds','s:0:\"\";'),
	('pathauto_taxonomy_2_pattern','s:0:\"\";'),
	('pathauto_taxonomy_1_pattern','s:0:\"\";'),
	('pathauto_ignore_words','s:108:\"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with\";'),
	('pathauto_indexaliases','b:0;'),
	('pathauto_indexaliases_bulkupdate','b:0;'),
	('pathauto_max_component_length','s:3:\"100\";'),
	('pathauto_max_length','s:3:\"100\";'),
	('pathauto_node_bulkupdate','i:0;'),
	('pathauto_node_forum_pattern','s:0:\"\";'),
	('pathauto_node_image_pattern','s:0:\"\";'),
	('pathauto_node_page_pattern','s:0:\"\";'),
	('pathauto_node_pattern','s:19:\"content/[title-raw]\";'),
	('pathauto_node_story_pattern','s:0:\"\";'),
	('pathauto_punctuation_quotes','s:1:\"0\";'),
	('pathauto_separator','s:1:\"-\";'),
	('pathauto_update_action','s:1:\"0\";'),
	('pathauto_user_bulkupdate','i:0;'),
	('pathauto_user_pattern','s:16:\"users/[user-raw]\";'),
	('pathauto_user_supportsfeeds','N;'),
	('pathauto_verbose','i:0;'),
	('pathauto_punctuation_hyphen','s:1:\"1\";'),
	('site_404','s:9:\"search404\";'),
	('node_cron_comments_scale','d:1;'),
	('node_cron_views_scale','d:1;'),
	('fieldgroup_schema_version','i:6000;'),
	('image_captcha_bilinear_interpolation','b:0;'),
	('seo_checklist_thanks','i:0;'),
	('seo_checklist_podcast','i:0;'),
	('site_slogan','s:28:\"easy online apartment search\";'),
	('site_mission','s:0:\"\";'),
	('site_footer','s:0:\"\";'),
	('anonymous','s:9:\"Anonymous\";'),
	('site_frontpage','s:4:\"node\";'),
	('node_options_unit','a:1:{i:0;s:6:\"status\";}'),
	('form_build_id_unit','s:37:\"form-ac78882c1ae3f48be6b650c921d518db\";'),
	('content_extra_weights_unit','a:7:{s:5:\"title\";s:1:\"2\";s:20:\"revision_information\";s:2:\"14\";s:6:\"author\";s:2:\"16\";s:7:\"options\";s:2:\"19\";s:4:\"menu\";s:2:\"13\";s:4:\"path\";s:2:\"15\";s:13:\"path_redirect\";s:2:\"20\";}'),
	('cache','s:1:\"0\";'),
	('cache_lifetime','s:1:\"0\";'),
	('page_compression','s:1:\"0\";'),
	('block_cache','s:1:\"0\";'),
	('preprocess_css','s:1:\"0\";'),
	('preprocess_js','s:1:\"0\";'),
	('clear','s:17:\"Clear cached data\";'),
	('date_api_version','s:3:\"5.2\";'),
	('node_options_building','a:1:{i:0;s:6:\"status\";}'),
	('form_build_id_page','s:37:\"form-9e865493c4ddbbfd8a2e1fa5eca2485c\";'),
	('form_build_id_building','s:37:\"form-8ae21e9f0a6a8bcfb31c76d5b3481cc4\";'),
	('content_extra_weights_building','a:5:{s:5:\"title\";s:2:\"-5\";s:10:\"body_field\";s:2:\"-2\";s:20:\"revision_information\";s:1:\"2\";s:4:\"menu\";s:1:\"1\";s:4:\"path\";s:1:\"3\";}'),
	('conditional_styles_inbode','s:253:\"<!--[if IE]>\n<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/sites/all/themes/zen/zen/ie.css?9\" />\n<![endif]-->\n<!--[if IE 7]>\n<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/sites/all/themes/inbode/screen.ie7.css?9\" />\n<![endif]-->\n\";'),
	('theme_inbode_settings','a:29:{s:17:\"zen_block_editing\";s:1:\"1\";s:14:\"zen_breadcrumb\";s:3:\"yes\";s:24:\"zen_breadcrumb_separator\";s:5:\" › \";s:19:\"zen_breadcrumb_home\";s:1:\"1\";s:23:\"zen_breadcrumb_trailing\";s:1:\"1\";s:20:\"zen_breadcrumb_title\";s:1:\"0\";s:20:\"zen_rebuild_registry\";s:1:\"1\";s:14:\"zen_wireframes\";s:1:\"0\";s:7:\"mission\";s:0:\"\";s:12:\"default_logo\";i:0;s:9:\"logo_path\";s:0:\"\";s:15:\"default_favicon\";i:0;s:12:\"favicon_path\";s:0:\"\";s:13:\"primary_links\";i:1;s:15:\"secondary_links\";i:1;s:11:\"toggle_logo\";i:0;s:14:\"toggle_favicon\";i:0;s:11:\"toggle_name\";i:1;s:13:\"toggle_search\";i:0;s:13:\"toggle_slogan\";i:0;s:14:\"toggle_mission\";i:0;s:24:\"toggle_node_user_picture\";i:0;s:27:\"toggle_comment_user_picture\";i:0;s:20:\"toggle_primary_links\";i:0;s:22:\"toggle_secondary_links\";i:0;s:25:\"toggle_node_info_betahome\";i:0;s:11:\"logo_upload\";s:0:\"\";s:14:\"favicon_upload\";s:0:\"\";s:22:\"toggle_node_info_story\";i:0;}'),
	('imageapi_image_toolkit','s:11:\"imageapi_gd\";'),
	('imageapi_jpeg_quality','s:3:\"100\";'),
	('rebuild_marker_js','s:10:\"Regenerate\";'),
	('user_mail_register_admin_created_body','s:468:\"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team\";'),
	('user_mail_register_no_approval_required_subject','s:38:\"Account details for !username at !site\";'),
	('user_mail_register_no_approval_required_body','s:442:\"!username,\r\n\r\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team\";'),
	('date_popup_css_file','s:59:\"sites/all/modules/date/date_popup/themes/datepicker.1.7.css\";'),
	('user_register','s:1:\"0\";'),
	('user_registration_help','s:0:\"\";'),
	('user_mail_register_admin_created_subject','s:52:\"An administrator created an account for you at !site\";'),
	('location_default_country','s:2:\"us\";'),
	('location_display_location','s:1:\"0\";'),
	('location_usegmap','i:0;'),
	('location_locpick_macro','s:6:\"[gmap]\";'),
	('location_geocode_us','s:6:\"google\";'),
	('location_general_geocoders_in_use','a:1:{s:6:\"google\";s:6:\"google\";}'),
	('location_geocode_al','s:4:\"none\";'),
	('location_geocode_au','s:4:\"none\";'),
	('location_geocode_at','s:4:\"none\";'),
	('location_geocode_by','s:4:\"none\";'),
	('location_geocode_be','s:4:\"none\";'),
	('location_geocode_ba','s:4:\"none\";'),
	('location_geocode_br','s:4:\"none\";'),
	('location_geocode_bg','s:4:\"none\";'),
	('location_geocode_ca','s:4:\"none\";'),
	('location_geocode_cl','s:4:\"none\";'),
	('location_geocode_cz','s:4:\"none\";'),
	('location_geocode_dk','s:4:\"none\";'),
	('location_geocode_ec','s:4:\"none\";'),
	('location_geocode_sv','s:4:\"none\";'),
	('location_geocode_ee','s:4:\"none\";'),
	('location_geocode_fi','s:4:\"none\";'),
	('location_geocode_fr','s:4:\"none\";'),
	('location_geocode_de','s:4:\"none\";'),
	('location_geocode_gr','s:4:\"none\";'),
	('location_geocode_hk','s:4:\"none\";'),
	('location_geocode_hu','s:4:\"none\";'),
	('location_geocode_in','s:4:\"none\";'),
	('location_geocode_ie','s:4:\"none\";'),
	('location_geocode_it','s:4:\"none\";'),
	('location_geocode_ci','s:4:\"none\";'),
	('location_geocode_jp','s:4:\"none\";'),
	('location_geocode_lv','s:4:\"none\";'),
	('location_geocode_li','s:4:\"none\";'),
	('location_geocode_lt','s:4:\"none\";'),
	('location_geocode_lu','s:4:\"none\";'),
	('location_geocode_mo','s:4:\"none\";'),
	('location_geocode_mx','s:4:\"none\";'),
	('location_geocode_md','s:4:\"none\";'),
	('location_geocode_me','s:4:\"none\";'),
	('location_geocode_nl','s:4:\"none\";'),
	('location_geocode_nc','s:4:\"none\";'),
	('location_geocode_ni','s:4:\"none\";'),
	('location_geocode_no','s:4:\"none\";'),
	('location_geocode_pl','s:4:\"none\";'),
	('location_geocode_pt','s:4:\"none\";'),
	('location_geocode_ro','s:4:\"none\";'),
	('location_geocode_ru','s:4:\"none\";'),
	('location_geocode_sm','s:4:\"none\";'),
	('location_geocode_rs','s:4:\"none\";'),
	('location_geocode_sg','s:4:\"none\";'),
	('location_geocode_sk','s:4:\"none\";'),
	('location_geocode_si','s:4:\"none\";'),
	('location_geocode_es','s:4:\"none\";'),
	('location_geocode_se','s:4:\"none\";'),
	('location_geocode_ch','s:4:\"none\";'),
	('location_geocode_tw','s:4:\"none\";'),
	('location_geocode_th','s:4:\"none\";'),
	('location_geocode_tr','s:4:\"none\";'),
	('location_geocode_ua','s:4:\"none\";'),
	('location_geocode_uk','s:4:\"none\";'),
	('location_geocode_uy','s:4:\"none\";'),
	('location_settings_node_building','a:4:{s:8:\"multiple\";a:3:{s:3:\"min\";s:1:\"0\";s:3:\"max\";s:1:\"0\";s:3:\"add\";s:1:\"0\";}s:4:\"form\";a:4:{s:6:\"weight\";s:2:\"-9\";s:11:\"collapsible\";i:0;s:9:\"collapsed\";i:0;s:6:\"fields\";a:7:{s:4:\"name\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"collect\";s:1:\"2\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"collect\";s:1:\"4\";s:7:\"default\";s:2:\"us\";s:6:\"weight\";s:2:\"14\";}}}s:7:\"display\";a:4:{s:6:\"weight\";s:1:\"2\";s:4:\"hide\";a:11:{s:4:\"name\";s:4:\"name\";s:10:\"additional\";s:10:\"additional\";s:7:\"country\";s:7:\"country\";s:13:\"province_name\";s:13:\"province_name\";s:12:\"country_name\";s:12:\"country_name\";s:8:\"map_link\";s:8:\"map_link\";s:6:\"coords\";s:6:\"coords\";s:6:\"street\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;}s:6:\"teaser\";i:0;s:4:\"full\";i:0;}s:3:\"rss\";a:1:{s:4:\"mode\";s:4:\"none\";}}'),
	('location_maxnum_building','s:1:\"0\";'),
	('location_defaultnum_building','s:1:\"0\";'),
	('pathauto_transliterate','b:0;'),
	('location_jit_geocoding','i:0;'),
	('pathauto_node_supportsfeeds','s:4:\"feed\";'),
	('pathauto_case','s:1:\"1\";'),
	('pathauto_max_bulk_update','s:2:\"50\";'),
	('pathauto_reduce_ascii','i:0;'),
	('pathauto_punctuation_double_quotes','s:1:\"0\";'),
	('pathauto_punctuation_backtick','s:1:\"0\";'),
	('pathauto_punctuation_comma','s:1:\"0\";'),
	('pathauto_punctuation_period','s:1:\"0\";'),
	('pathauto_punctuation_underscore','s:1:\"0\";'),
	('pathauto_punctuation_colon','s:1:\"0\";'),
	('pathauto_punctuation_semicolon','s:1:\"0\";'),
	('pathauto_punctuation_pipe','s:1:\"0\";'),
	('pathauto_punctuation_left_curly','s:1:\"0\";'),
	('pathauto_punctuation_left_square','s:1:\"0\";'),
	('pathauto_punctuation_right_curly','s:1:\"0\";'),
	('pathauto_punctuation_right_square','s:1:\"0\";'),
	('pathauto_punctuation_plus','s:1:\"0\";'),
	('pathauto_punctuation_equal','s:1:\"0\";'),
	('pathauto_punctuation_asterisk','s:1:\"0\";'),
	('pathauto_punctuation_ampersand','s:1:\"0\";'),
	('pathauto_punctuation_percent','s:1:\"0\";'),
	('pathauto_punctuation_caret','s:1:\"0\";'),
	('pathauto_punctuation_dollar','s:1:\"0\";'),
	('pathauto_punctuation_hash','s:1:\"0\";'),
	('pathauto_punctuation_at','s:1:\"0\";'),
	('pathauto_punctuation_exclamation','s:1:\"0\";'),
	('pathauto_punctuation_tilde','s:1:\"0\";'),
	('pathauto_punctuation_left_parenthesis','s:1:\"0\";'),
	('pathauto_punctuation_right_parenthesis','s:1:\"0\";'),
	('pathauto_punctuation_question_mark','s:1:\"0\";'),
	('pathauto_punctuation_less_than','s:1:\"0\";'),
	('pathauto_punctuation_greater_than','s:1:\"0\";'),
	('pathauto_punctuation_back_slash','s:1:\"0\";'),
	('pathauto_node_building_pattern','s:14:\"building/[nid]\";'),
	('pathauto_node_unit_pattern','s:10:\"unit/[nid]\";'),
	('pathauto_node_applytofeeds','s:4:\"feed\";'),
	('logintoboggan_login_with_email','s:1:\"1\";'),
	('logintoboggan_confirm_email_at_registration','s:1:\"1\";'),
	('logintoboggan_pre_auth_role','s:1:\"5\";'),
	('logintoboggan_purge_unvalidated_user_interval','s:1:\"0\";'),
	('logintoboggan_immediate_login_on_register','i:1;'),
	('logintoboggan_redirect_on_register','s:0:\"\";'),
	('logintoboggan_redirect_on_confirm','s:0:\"\";'),
	('logintoboggan_override_destination_parameter','i:1;'),
	('site_403','s:0:\"\";'),
	('logintoboggan_login_successful_message','s:1:\"0\";'),
	('logintoboggan_minimum_password_length','s:1:\"8\";'),
	('date_popup_timepicker','s:4:\"none\";'),
	('filter_default_format','s:1:\"3\";'),
	('date_default_timezone_name','s:15:\"America/Chicago\";'),
	('configurable_timezones','s:1:\"0\";'),
	('date_first_day','s:1:\"0\";'),
	('date_format_long','s:16:\"l, F j, Y - g:ia\";'),
	('date_format_medium','s:15:\"D, m/d/Y - g:ia\";'),
	('date_format_short','s:11:\"m/d/Y - H:i\";'),
	('add_date_format_title','s:0:\"\";'),
	('add_date_format_type','s:0:\"\";'),
	('ld_url_destination','s:4:\"home\";'),
	('node_cron_last','s:10:\"1296813332\";'),
	('ld_url_type','s:6:\"static\";'),
	('ld_destination','i:0;'),
	('ld_condition_snippet','s:0:\"\";'),
	('ld_condition_type','s:6:\"always\";'),
	('views_block_hashes','a:0:{}'),
	('devel_query_sort','s:1:\"0\";'),
	('nodeaccess_building','a:5:{i:0;a:5:{s:3:\"gid\";i:1;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:1;a:5:{s:3:\"gid\";i:2;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:2;a:5:{s:3:\"gid\";i:4;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:3;a:5:{s:3:\"gid\";i:3;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:4;a:5:{s:3:\"gid\";i:5;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}}'),
	('devel_krumo_skin','s:7:\"default\";'),
	('smtp_library','s:0:\"\";'),
	('devel_rebuild_theme_registry','i:0;'),
	('admin_menu_display','s:1:\"0\";'),
	('admin_menu_show_all','i:0;'),
	('nodeaccess_page','a:5:{i:0;a:5:{s:3:\"gid\";i:1;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:1;a:5:{s:3:\"gid\";i:2;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:2;a:5:{s:3:\"gid\";i:4;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:3;a:5:{s:3:\"gid\";i:3;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:4;a:5:{s:3:\"gid\";i:5;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:0;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}}'),
	('nodeaccess_unit','a:5:{i:0;a:5:{s:3:\"gid\";i:1;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:1;a:5:{s:3:\"gid\";i:2;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:2;a:5:{s:3:\"gid\";i:4;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:3;a:5:{s:3:\"gid\";i:3;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}i:4;a:5:{s:3:\"gid\";i:5;s:5:\"realm\";s:14:\"nodeaccess_rid\";s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:0;s:12:\"grant_delete\";i:0;}}'),
	('nodeaccess_authors','a:3:{s:8:\"building\";a:3:{s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:1;s:12:\"grant_delete\";i:1;}s:4:\"page\";a:3:{s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:1;s:12:\"grant_delete\";i:1;}s:4:\"unit\";a:3:{s:10:\"grant_view\";i:1;s:12:\"grant_update\";i:1;s:12:\"grant_delete\";i:1;}}'),
	('nodeaccess-grants','a:3:{s:4:\"view\";i:1;s:4:\"edit\";i:1;s:6:\"delete\";i:1;}'),
	('nodeaccess-priority','i:0;'),
	('nodeaccess-preserve','i:1;'),
	('nodeaccess-roles','a:5:{i:1;i:0;i:2;i:0;i:4;i:0;i:3;i:0;i:5;i:0;}'),
	('nodeaccess-types','a:3:{s:8:\"building\";i:0;s:4:\"page\";i:0;s:4:\"unit\";i:0;}'),
	('user_mail_register_pending_approval_subject','s:63:\"Account details for !username at !site (pending admin approval)\";'),
	('user_mail_register_pending_approval_body','s:273:\"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\r\n\r\n\r\n--  !site team\";'),
	('user_mail_password_reset_subject','s:52:\"Replacement login information for !username at !site\";'),
	('user_mail_password_reset_body','s:419:\"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it\'s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\";'),
	('user_mail_status_activated_notify','i:1;'),
	('user_mail_status_activated_subject','s:49:\"Account details for !username at !site (approved)\";'),
	('user_mail_status_activated_body','s:434:\"!username,\r\n\r\nYour account at !site has been activated.\r\n\r\nYou may now log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\nOnce you have set your own password, you will be able to log in to !login_uri in the future using:\r\n\r\nusername: !username\r\n\";'),
	('user_mail_status_blocked_notify','i:0;'),
	('user_mail_status_blocked_subject','s:48:\"Account details for !username at !site (blocked)\";'),
	('user_mail_status_blocked_body','s:53:\"!username,\r\n\r\nYour account on !site has been blocked.\";'),
	('user_mail_status_deleted_notify','i:0;'),
	('user_mail_status_deleted_subject','s:48:\"Account details for !username at !site (deleted)\";'),
	('user_mail_status_deleted_body','s:53:\"!username,\r\n\r\nYour account on !site has been deleted.\";'),
	('user_signatures','s:1:\"0\";'),
	('user_pictures','s:1:\"0\";'),
	('user_picture_path','s:8:\"pictures\";'),
	('user_picture_default','s:0:\"\";'),
	('user_picture_dimensions','s:5:\"85x85\";'),
	('user_picture_file_size','s:2:\"30\";'),
	('user_picture_guidelines','s:0:\"\";'),
	('location_settings_node_betahome','a:4:{s:8:\"multiple\";a:3:{s:3:\"min\";s:1:\"0\";s:3:\"max\";s:1:\"1\";s:3:\"add\";s:1:\"1\";}s:4:\"form\";a:4:{s:6:\"weight\";i:0;s:11:\"collapsible\";i:1;s:9:\"collapsed\";i:1;s:6:\"fields\";a:8:{s:4:\"name\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:2:\"us\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:2:{s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";}}}s:7:\"display\";a:4:{s:6:\"weight\";i:0;s:4:\"hide\";a:12:{s:4:\"name\";i:0;s:6:\"street\";i:0;s:10:\"additional\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}s:6:\"teaser\";i:1;s:4:\"full\";i:1;}s:3:\"rss\";a:1:{s:4:\"mode\";s:6:\"simple\";}}'),
	('location_maxnum_betahome','s:1:\"1\";'),
	('location_defaultnum_betahome','s:1:\"1\";'),
	('node_options_betahome','a:1:{i:0;s:6:\"status\";}'),
	('form_build_id_betahome','s:37:\"form-1cb67d9687903cf019dc3c59795b3df6\";'),
	('location_settings_node_unit','a:4:{s:8:\"multiple\";a:3:{s:3:\"min\";s:1:\"0\";s:3:\"max\";s:1:\"0\";s:3:\"add\";s:1:\"0\";}s:4:\"form\";a:4:{s:6:\"weight\";s:1:\"0\";s:11:\"collapsible\";i:1;s:9:\"collapsed\";i:1;s:6:\"fields\";a:8:{s:4:\"name\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"2\";}s:6:\"street\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"4\";}s:10:\"additional\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"6\";}s:4:\"city\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:1:\"8\";}s:8:\"province\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"10\";}s:11:\"postal_code\";a:3:{s:7:\"collect\";s:1:\"0\";s:7:\"default\";s:0:\"\";s:6:\"weight\";s:2:\"12\";}s:7:\"country\";a:3:{s:7:\"collect\";s:1:\"1\";s:7:\"default\";s:2:\"us\";s:6:\"weight\";s:2:\"14\";}s:7:\"locpick\";a:2:{s:7:\"collect\";s:1:\"1\";s:6:\"weight\";s:2:\"20\";}}}s:7:\"display\";a:4:{s:6:\"weight\";s:1:\"0\";s:4:\"hide\";a:12:{s:4:\"name\";i:0;s:6:\"street\";i:0;s:10:\"additional\";i:0;s:4:\"city\";i:0;s:8:\"province\";i:0;s:11:\"postal_code\";i:0;s:7:\"country\";i:0;s:7:\"locpick\";i:0;s:13:\"province_name\";i:0;s:12:\"country_name\";i:0;s:8:\"map_link\";i:0;s:6:\"coords\";i:0;}s:6:\"teaser\";i:1;s:4:\"full\";i:1;}s:3:\"rss\";a:1:{s:4:\"mode\";s:6:\"simple\";}}'),
	('location_maxnum_unit','s:1:\"0\";'),
	('location_defaultnum_unit','s:1:\"0\";'),
	('location_use_province_abbreviation','s:1:\"1\";'),
	('location_maplink_external','i:0;'),
	('location_maplink_external_method','s:15:\"target=\"_blank\"\";'),
	('jqp_directory','s:19:\"sites/all/libraries\";');

/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table views_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `views_display`;

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



# Dump of table views_object_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `views_object_cache`;

CREATE TABLE `views_object_cache` (
  `sid` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `obj` varchar(32) DEFAULT NULL,
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  KEY `sid_obj_name` (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table views_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `views_view`;

CREATE TABLE `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `view_php` blob,
  `base_table` varchar(64) NOT NULL DEFAULT '',
  `is_cacheable` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table vocabulary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vocabulary`;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` (`vid`,`name`,`description`,`help`,`relations`,`hierarchy`,`multiple`,`required`,`tags`,`module`,`weight`)
VALUES
	(1,'Image Upload','The terms from this vocabulary are used as image upload categories,\n                      where each category is a separate container for uploaded images.','',1,1,0,0,0,'taxonomy',0);

/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vocabulary_node_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vocabulary_node_types`;

CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table watchdog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `watchdog`;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table webform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webform`;

CREATE TABLE `webform` (
  `nid` int(10) unsigned NOT NULL,
  `confirmation` text NOT NULL,
  `teaser` tinyint(4) NOT NULL DEFAULT '0',
  `submit_text` varchar(255) DEFAULT NULL,
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1',
  `submit_interval` int(11) NOT NULL DEFAULT '-1',
  `email` varchar(255) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `email_from_address` varchar(255) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `additional_validate` text NOT NULL,
  `additional_submit` text NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table webform_component
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webform_component`;

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
  `email` tinyint(4) NOT NULL DEFAULT '0',
  `weight` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table webform_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webform_roles`;

CREATE TABLE `webform_roles` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table webform_submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webform_submissions`;

CREATE TABLE `webform_submissions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table webform_submitted_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webform_submitted_data`;

CREATE TABLE `webform_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`nid`,`sid`,`cid`,`no`),
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table wysiwyg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wysiwyg`;

CREATE TABLE `wysiwyg` (
  `format` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(128) NOT NULL DEFAULT '',
  `settings` text,
  PRIMARY KEY (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `wysiwyg` WRITE;
/*!40000 ALTER TABLE `wysiwyg` DISABLE KEYS */;
INSERT INTO `wysiwyg` (`format`,`editor`,`settings`)
VALUES
	(1,'tinymce',NULL),
	(2,'tinymce','a:21:{s:7:\"default\";i:1;s:11:\"user_choose\";i:0;s:11:\"show_toggle\";i:1;s:5:\"theme\";s:8:\"advanced\";s:8:\"language\";s:2:\"en\";s:7:\"buttons\";a:6:{s:7:\"default\";a:16:{s:4:\"bold\";i:1;s:6:\"italic\";i:1;s:9:\"underline\";i:1;s:13:\"strikethrough\";i:1;s:7:\"bullist\";i:1;s:7:\"numlist\";i:1;s:7:\"outdent\";i:1;s:6:\"indent\";i:1;s:4:\"link\";i:1;s:6:\"unlink\";i:1;s:6:\"anchor\";i:1;s:5:\"image\";i:1;s:3:\"sup\";i:1;s:3:\"sub\";i:1;s:10:\"blockquote\";i:1;s:2:\"hr\";i:1;}s:4:\"font\";a:1:{s:12:\"formatselect\";i:1;}s:10:\"fullscreen\";a:1:{s:10:\"fullscreen\";i:1;}s:5:\"paste\";a:1:{s:9:\"pasteword\";i:1;}s:5:\"table\";a:1:{s:13:\"tablecontrols\";i:1;}s:4:\"imce\";a:1:{s:4:\"imce\";i:1;}}s:11:\"toolbar_loc\";s:3:\"top\";s:13:\"toolbar_align\";s:4:\"left\";s:8:\"path_loc\";s:6:\"bottom\";s:8:\"resizing\";i:1;s:11:\"verify_html\";i:1;s:12:\"preformatted\";i:0;s:22:\"convert_fonts_to_spans\";i:1;s:17:\"remove_linebreaks\";i:1;s:23:\"apply_source_formatting\";i:0;s:27:\"paste_auto_cleanup_on_paste\";i:0;s:13:\"block_formats\";s:32:\"p,address,pre,h2,h3,h4,h5,h6,div\";s:11:\"css_setting\";s:5:\"theme\";s:8:\"css_path\";s:0:\"\";s:11:\"css_classes\";s:0:\"\";s:13:\"form_build_id\";s:37:\"form-e7a9c22539e1e6176c14dedfa7dde13b\";}'),
	(3,'',NULL),
	(4,'tinymce','a:21:{s:7:\"default\";i:1;s:11:\"user_choose\";i:0;s:11:\"show_toggle\";i:0;s:5:\"theme\";s:8:\"advanced\";s:8:\"language\";s:2:\"en\";s:7:\"buttons\";a:0:{}s:11:\"toolbar_loc\";s:3:\"top\";s:13:\"toolbar_align\";s:4:\"left\";s:8:\"path_loc\";s:6:\"bottom\";s:8:\"resizing\";i:1;s:11:\"verify_html\";i:1;s:12:\"preformatted\";i:0;s:22:\"convert_fonts_to_spans\";i:1;s:17:\"remove_linebreaks\";i:1;s:23:\"apply_source_formatting\";i:0;s:27:\"paste_auto_cleanup_on_paste\";i:0;s:13:\"block_formats\";s:32:\"p,address,pre,h2,h3,h4,h5,h6,div\";s:11:\"css_setting\";s:5:\"theme\";s:8:\"css_path\";s:0:\"\";s:11:\"css_classes\";s:0:\"\";s:13:\"form_build_id\";s:37:\"form-753b3798d807209354a1c12fda494a1e\";}');

/*!40000 ALTER TABLE `wysiwyg` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wysiwyg_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wysiwyg_user`;

CREATE TABLE `wysiwyg_user` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `format` int(11) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `format` (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table zipcodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zipcodes`;

CREATE TABLE `zipcodes` (
  `zip` varchar(16) NOT NULL DEFAULT '0',
  `city` varchar(30) NOT NULL DEFAULT '',
  `state` varchar(30) NOT NULL DEFAULT '',
  `latitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `longitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `timezone` tinyint(4) NOT NULL DEFAULT '0',
  `dst` tinyint(4) NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `pc` (`country`,`zip`),
  KEY `zip` (`zip`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `country` (`country`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
