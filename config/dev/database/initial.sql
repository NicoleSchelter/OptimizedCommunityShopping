# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.16.15 (MySQL 5.5.5-10.3.16-MariaDB-1:10.3.16+maria~bionic-log)
# Datenbank: cn1
# Erstellt am: 2019-08-30 17:30:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle application_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `application_logs`;

CREATE TABLE `application_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` text DEFAULT NULL,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` int(11) unsigned DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# Export von Tabelle assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `customSettings` longtext DEFAULT NULL,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT 0,
  `versionCount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `path` (`path`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `parentId`, `type`, `filename`, `path`, `mimetype`, `creationDate`, `modificationDate`, `userOwner`, `userModification`, `customSettings`, `hasMetaData`, `versionCount`)
VALUES
	(1,0,'folder',X'',X'2F',NULL,1567182446,1567182446,1,1,NULL,0,0);

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle assets_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets_metadata`;

CREATE TABLE `assets_metadata` (
  `cid` int(11) NOT NULL,
  `name` varchar(190) NOT NULL,
  `language` varchar(10) CHARACTER SET ascii NOT NULL DEFAULT '',
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`cid`,`name`,`language`),
  KEY `name` (`name`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `id` varchar(165) CHARACTER SET ascii NOT NULL DEFAULT '',
  `data` longblob DEFAULT NULL,
  `mtime` int(11) unsigned DEFAULT NULL,
  `expire` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;

INSERT INTO `cache` (`id`, `data`, `mtime`, `expire`)
VALUES
	('document_1',X'733A3735373A224F3A32373A2250696D636F72655C4D6F64656C5C446F63756D656E745C50616765223A32373A7B733A383A22002A007469746C65223B733A303A22223B733A31343A22002A006465736372697074696F6E223B733A303A22223B733A31313A22002A006D65746144617461223B613A303A7B7D733A373A22002A0074797065223B733A343A2270616765223B733A31323A22002A0070726574747955726C223B4E3B733A31373A22002A0074617267657447726F7570496473223B733A303A22223B733A393A22002A006D6F64756C65223B4E3B733A31333A22002A00636F6E74726F6C6C6572223B733A373A2264656661756C74223B733A393A22002A00616374696F6E223B733A373A2264656661756C74223B733A31313A22002A0074656D706C617465223B733A303A22223B733A31313A22002A00656C656D656E7473223B4E3B733A32363A22002A00636F6E74656E744D6173746572446F63756D656E744964223B4E3B733A353A22002A006964223B693A313B733A31313A22002A00706172656E744964223B693A303B733A363A22002A006B6579223B733A303A22223B733A373A22002A0070617468223B733A313A222F223B733A383A22002A00696E646578223B693A3939393939393B733A31323A22002A007075626C6973686564223B623A313B733A31353A22002A006372656174696F6E44617465223B693A313536373138323434363B733A31393A22002A006D6F64696669636174696F6E44617465223B693A313536373138323434363B733A31323A22002A00757365724F776E6572223B693A313B733A31393A22002A00757365724D6F64696669636174696F6E223B693A313B733A31313A22002A007369626C696E6773223B4E3B733A31343A22002A006861735369626C696E6773223B4E3B733A393A22002A006C6F636B6564223B4E3B733A31353A22002A0076657273696F6E436F756E74223B693A303B733A32353A22002A005F5F6461746156657273696F6E54696D657374616D70223B693A313536373138323434363B7D223B',1567183139,1569602338),
	('document_properties_1',X'733A363A22613A303A7B7D223B',1567183139,1569602338),
	('site_domain_86c6533b6f9a6abd103534d4b681490a',X'733A31333A22733A363A226661696C6564223B223B',1567183139,1569602327),
	('system_route_redirect',X'733A363A22613A303A7B7D223B',1567183127,1569602327);

/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle cache_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_tags`;

CREATE TABLE `cache_tags` (
  `id` varchar(165) CHARACTER SET ascii NOT NULL DEFAULT '',
  `tag` varchar(165) CHARACTER SET ascii NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `id` (`id`),
  KEY `tag` (`tag`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;

INSERT INTO `cache_tags` (`id`, `tag`)
VALUES
	('system_route_redirect','system'),
	('system_route_redirect','redirect'),
	('system_route_redirect','route'),
	('site_domain_86c6533b6f9a6abd103534d4b681490a','system'),
	('site_domain_86c6533b6f9a6abd103534d4b681490a','site'),
	('document_1','document_1'),
	('document_properties_1','document_properties'),
	('document_properties_1','document_1');

/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` varchar(50) NOT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_collectionrelations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;

CREATE TABLE `classificationstore_collectionrelations` (
  `colId` int(11) unsigned NOT NULL,
  `groupId` int(11) unsigned NOT NULL,
  `sorter` int(10) DEFAULT 0,
  PRIMARY KEY (`colId`,`groupId`),
  KEY `colId` (`colId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_collections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_collections`;

CREATE TABLE `classificationstore_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_groups`;

CREATE TABLE `classificationstore_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `parentId` int(11) unsigned NOT NULL DEFAULT 0,
  `name` varchar(190) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_keys`;

CREATE TABLE `classificationstore_keys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `type` varchar(190) DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  `definition` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_relations`;

CREATE TABLE `classificationstore_relations` (
  `groupId` int(11) unsigned NOT NULL,
  `keyId` int(11) unsigned NOT NULL,
  `sorter` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `groupId` (`groupId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle classificationstore_stores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classificationstore_stores`;

CREATE TABLE `classificationstore_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle custom_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_layouts`;

CREATE TABLE `custom_layouts` (
  `id` varchar(64) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle dependencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dependencies`;

CREATE TABLE `dependencies` (
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int(11) unsigned NOT NULL DEFAULT 0,
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`sourcetype`,`sourceid`,`targetid`,`targettype`),
  KEY `sourceid` (`sourceid`),
  KEY `targetid` (`targetid`),
  KEY `sourcetype` (`sourcetype`),
  KEY `targettype` (`targettype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `index` int(11) unsigned DEFAULT 0,
  `published` tinyint(1) unsigned DEFAULT 1,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `versionCount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `path` (`path`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;

INSERT INTO `documents` (`id`, `parentId`, `type`, `key`, `path`, `index`, `published`, `creationDate`, `modificationDate`, `userOwner`, `userModification`, `versionCount`)
VALUES
	(1,0,'page',X'',X'2F',999999,1,1567182446,1567182446,1,1,0);

/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle documents_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_elements`;

CREATE TABLE `documents_elements` (
  `documentId` int(11) unsigned NOT NULL DEFAULT 0,
  `name` varchar(750) CHARACTER SET ascii NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_email`;

CREATE TABLE `documents_email` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_hardlink
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_hardlink`;

CREATE TABLE `documents_hardlink` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `sourceId` int(11) DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childrenFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_link`;

CREATE TABLE `documents_link` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `internalType` enum('document','asset','object') DEFAULT NULL,
  `internal` int(11) unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_newsletter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_newsletter`;

CREATE TABLE `documents_newsletter` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint(1) unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_page`;

CREATE TABLE `documents_page` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(383) DEFAULT NULL,
  `metaData` text DEFAULT NULL,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  `targetGroupIds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;

INSERT INTO `documents_page` (`id`, `module`, `controller`, `action`, `template`, `title`, `description`, `metaData`, `prettyUrl`, `contentMasterDocumentId`, `targetGroupIds`)
VALUES
	(1,NULL,'default','default','','','',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle documents_printpage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_printpage`;

CREATE TABLE `documents_printpage` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int(11) DEFAULT NULL,
  `lastGenerateMessage` text DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_snippet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_snippet`;

CREATE TABLE `documents_snippet` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle documents_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents_translations`;

CREATE TABLE `documents_translations` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `sourceId` int(11) unsigned NOT NULL DEFAULT 0,
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `sourceId` (`sourceId`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle edit_lock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `edit_lock`;

CREATE TABLE `edit_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT 0,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT 0,
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle element_workflow_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `element_workflow_state`;

CREATE TABLE `element_workflow_state` (
  `cid` int(10) NOT NULL DEFAULT 0,
  `ctype` enum('document','asset','object') NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `workflow` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle email_blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_blacklist`;

CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle email_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_log`;

CREATE TABLE `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `from` varchar(500) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `to` longtext DEFAULT NULL,
  `cc` longtext DEFAULT NULL,
  `bcc` longtext DEFAULT NULL,
  `sentDate` int(11) unsigned DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentDate` (`sentDate`,`id`),
  FULLTEXT KEY `fulltext` (`from`,`to`,`cc`,`bcc`,`subject`,`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle glossary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `glossary`;

CREATE TABLE `glossary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int(11) unsigned DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle gridconfig_favourites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gridconfig_favourites`;

CREATE TABLE `gridconfig_favourites` (
  `ownerId` int(11) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `objectId` int(11) NOT NULL DEFAULT 0,
  `gridConfigId` int(11) DEFAULT NULL,
  `searchType` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ownerId`,`classId`,`searchType`,`objectId`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle gridconfig_shares
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gridconfig_shares`;

CREATE TABLE `gridconfig_shares` (
  `gridConfigId` int(11) NOT NULL,
  `sharedWithUserId` int(11) NOT NULL,
  PRIMARY KEY (`gridConfigId`,`sharedWithUserId`),
  KEY `gridConfigId` (`gridConfigId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle gridconfigs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gridconfigs`;

CREATE TABLE `gridconfigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `searchType` varchar(50) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creationDate` int(11) DEFAULT NULL,
  `modificationDate` int(11) DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle http_error_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `http_error_log`;

CREATE TABLE `http_error_log` (
  `uri` varchar(3000) CHARACTER SET ascii DEFAULT NULL,
  `code` int(3) DEFAULT NULL,
  `parametersGet` longtext DEFAULT NULL,
  `parametersPost` longtext DEFAULT NULL,
  `cookies` longtext DEFAULT NULL,
  `serverVars` longtext DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  `count` bigint(20) unsigned DEFAULT NULL,
  KEY `uri` (`uri`(765)),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle importconfig_shares
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importconfig_shares`;

CREATE TABLE `importconfig_shares` (
  `importConfigId` int(11) NOT NULL,
  `sharedWithUserId` int(11) NOT NULL,
  PRIMARY KEY (`importConfigId`,`sharedWithUserId`),
  KEY `data.sharedRoleIds` (`importConfigId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle importconfigs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `importconfigs`;

CREATE TABLE `importconfigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creationDate` int(11) DEFAULT NULL,
  `modificationDate` int(11) DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locks`;

CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;



# Export von Tabelle notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle notes_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notes_data`;

CREATE TABLE `notes_data` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'info',
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int(11) DEFAULT NULL,
  `recipient` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificationDate` timestamp NULL DEFAULT NULL,
  `linkedElementType` enum('document','asset','object') DEFAULT NULL,
  `linkedElement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle objects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int(11) unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `o_path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `o_index` int(11) unsigned DEFAULT 0,
  `o_published` tinyint(1) unsigned DEFAULT 1,
  `o_creationDate` int(11) unsigned DEFAULT NULL,
  `o_modificationDate` int(11) unsigned DEFAULT NULL,
  `o_userOwner` int(11) unsigned DEFAULT NULL,
  `o_userModification` int(11) unsigned DEFAULT NULL,
  `o_classId` varchar(50) DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  `o_childrenSortBy` enum('key','index') DEFAULT NULL,
  `o_versionCount` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `path` (`o_path`),
  KEY `index` (`o_index`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;

INSERT INTO `objects` (`o_id`, `o_parentId`, `o_type`, `o_key`, `o_path`, `o_index`, `o_published`, `o_creationDate`, `o_modificationDate`, `o_userOwner`, `o_userModification`, `o_classId`, `o_className`, `o_childrenSortBy`, `o_versionCount`)
VALUES
	(1,0,'folder',X'',X'2F',999999,1,1567182446,1567182446,1,1,NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle pimcore_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pimcore_migrations`;

CREATE TABLE `pimcore_migrations` (
  `migration_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migrated_at` datetime NOT NULL,
  PRIMARY KEY (`migration_set`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `pimcore_migrations` WRITE;
/*!40000 ALTER TABLE `pimcore_migrations` DISABLE KEYS */;

INSERT INTO `pimcore_migrations` (`migration_set`, `version`, `migrated_at`)
VALUES
	('pimcore_core','20180724144005','2019-08-30 16:27:27'),
	('pimcore_core','20180830113528','2019-08-30 16:27:27'),
	('pimcore_core','20180830122128','2019-08-30 16:27:27'),
	('pimcore_core','20180904201947','2019-08-30 16:27:27'),
	('pimcore_core','20180906142115','2019-08-30 16:27:27'),
	('pimcore_core','20180907115436','2019-08-30 16:27:27'),
	('pimcore_core','20180912140913','2019-08-30 16:27:27'),
	('pimcore_core','20180913132106','2019-08-30 16:27:27'),
	('pimcore_core','20180924111736','2019-08-30 16:27:27'),
	('pimcore_core','20181008132414','2019-08-30 16:27:27'),
	('pimcore_core','20181009135158','2019-08-30 16:27:27'),
	('pimcore_core','20181115114003','2019-08-30 16:27:27'),
	('pimcore_core','20181126094412','2019-08-30 16:27:27'),
	('pimcore_core','20181126144341','2019-08-30 16:27:27'),
	('pimcore_core','20181128074035','2019-08-30 16:27:27'),
	('pimcore_core','20181128112320','2019-08-30 16:27:27'),
	('pimcore_core','20181214145532','2019-08-30 16:27:27'),
	('pimcore_core','20190102143436','2019-08-30 16:27:27'),
	('pimcore_core','20190102153226','2019-08-30 16:27:27'),
	('pimcore_core','20190108131401','2019-08-30 16:27:27'),
	('pimcore_core','20190124105627','2019-08-30 16:27:27'),
	('pimcore_core','20190131074054','2019-08-30 16:27:27'),
	('pimcore_core','20190131095936','2019-08-30 16:27:27'),
	('pimcore_core','20190320133439','2019-08-30 16:27:27'),
	('pimcore_core','20190402073052','2019-08-30 16:27:27'),
	('pimcore_core','20190403120728','2019-08-30 16:27:27'),
	('pimcore_core','20190405112707','2019-08-30 16:27:27'),
	('pimcore_core','20190408084129','2019-08-30 16:27:27'),
	('pimcore_core','20190508074339','2019-08-30 16:27:27'),
	('pimcore_core','20190515130651','2019-08-30 16:27:27'),
	('pimcore_core','20190520151448','2019-08-30 16:27:27'),
	('pimcore_core','20190522130545','2019-08-30 16:27:27'),
	('pimcore_core','20190527121800','2019-08-30 16:27:27'),
	('pimcore_core','20190618154000','2019-08-30 16:27:27'),
	('pimcore_core','20190701141857','2019-08-30 16:27:27'),
	('pimcore_core','20190708175236','2019-08-30 16:27:27'),
	('pimcore_core','20190729085052','2019-08-30 16:27:27'),
	('pimcore_core','20190802090149','2019-08-30 16:27:27'),
	('pimcore_core','20190806160450','2019-08-30 16:27:27'),
	('pimcore_core','20190807121356','2019-08-30 16:27:27');

/*!40000 ALTER TABLE `pimcore_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle properties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `properties`;

CREATE TABLE `properties` (
  `cid` int(11) unsigned NOT NULL DEFAULT 0,
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text DEFAULT NULL,
  `inheritable` tinyint(1) unsigned DEFAULT 1,
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `cpath` (`cpath`),
  KEY `inheritable` (`inheritable`),
  KEY `ctype` (`ctype`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Export von Tabelle quantityvalue_units
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quantityvalue_units`;

CREATE TABLE `quantityvalue_units` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` int(11) unsigned DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `converter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baseunit` (`baseunit`),
  CONSTRAINT `fk_baseunit` FOREIGN KEY (`baseunit`) REFERENCES `quantityvalue_units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle recyclebin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recyclebin`;

CREATE TABLE `recyclebin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `redirects`;

CREATE TABLE `redirects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceSite` int(11) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int(11) DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int(2) DEFAULT 0,
  `regex` tinyint(1) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `expiry` int(11) unsigned DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle sanitycheck
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sanitycheck`;

CREATE TABLE `sanitycheck` (
  `id` int(11) unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle schedule_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule_tasks`;

CREATE TABLE `schedule_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle search_backend_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `search_backend_data`;

CREATE TABLE `search_backend_data` (
  `id` int(11) NOT NULL,
  `fullpath` varchar(765) CHARACTER SET utf8 DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(190) DEFAULT NULL,
  `published` int(11) unsigned DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  `userOwner` int(11) DEFAULT NULL,
  `userModification` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `properties` text DEFAULT NULL,
  PRIMARY KEY (`id`,`maintype`),
  KEY `id` (`id`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Export von Tabelle sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text DEFAULT NULL,
  `rootId` int(11) unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT 0,
  `modificationDate` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `idPath` varchar(190) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle tags_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags_assignment`;

CREATE TABLE `tags_assignment` (
  `tagid` int(10) unsigned NOT NULL DEFAULT 0,
  `cid` int(10) NOT NULL DEFAULT 0,
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle targeting_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `targeting_rules`;

CREATE TABLE `targeting_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `prio` smallint(5) unsigned NOT NULL DEFAULT 0,
  `conditions` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle targeting_storage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `targeting_storage`;

CREATE TABLE `targeting_storage` (
  `visitorId` varchar(100) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitorId`,`scope`,`name`),
  KEY `targeting_storage_scope_index` (`scope`),
  KEY `targeting_storage_name_index` (`name`),
  KEY `targeting_storage_visitorId_index` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle targeting_target_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `targeting_target_groups`;

CREATE TABLE `targeting_target_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle tmp_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tmp_store`;

CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `serialized` tinyint(2) NOT NULL DEFAULT 0,
  `date` int(11) unsigned DEFAULT NULL,
  `expiryDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle tracking_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tracking_events`;

CREATE TABLE `tracking_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `data` varchar(190) DEFAULT NULL,
  `timestamp` int(11) unsigned DEFAULT NULL,
  `year` int(5) unsigned DEFAULT NULL,
  `month` int(2) unsigned DEFAULT NULL,
  `day` int(2) unsigned DEFAULT NULL,
  `dayOfWeek` int(1) unsigned DEFAULT NULL,
  `dayOfYear` int(3) unsigned DEFAULT NULL,
  `weekOfYear` int(2) unsigned DEFAULT NULL,
  `hour` int(2) unsigned DEFAULT NULL,
  `minute` int(2) unsigned DEFAULT NULL,
  `second` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle translations_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations_admin`;

CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle translations_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations_website`;

CREATE TABLE `translations_website` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle tree_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tree_locks`;

CREATE TABLE `tree_locks` (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext DEFAULT NULL,
  `admin` tinyint(1) unsigned DEFAULT 0,
  `active` tinyint(1) unsigned DEFAULT 1,
  `permissions` text DEFAULT NULL,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint(1) unsigned DEFAULT 1,
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` text DEFAULT NULL,
  `apiKey` varchar(255) DEFAULT NULL,
  `twoFactorAuthentication` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext DEFAULT NULL,
  `websiteTranslationLanguagesEdit` longtext DEFAULT NULL,
  `websiteTranslationLanguagesView` longtext DEFAULT NULL,
  `lastLogin` int(11) unsigned DEFAULT NULL,
  `keyBindings` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `parentId`, `type`, `name`, `password`, `firstname`, `lastname`, `email`, `language`, `contentLanguages`, `admin`, `active`, `permissions`, `roles`, `welcomescreen`, `closeWarning`, `memorizeTabs`, `allowDirtyClose`, `docTypes`, `classes`, `apiKey`, `twoFactorAuthentication`, `activePerspective`, `perspectives`, `websiteTranslationLanguagesEdit`, `websiteTranslationLanguagesView`, `lastLogin`, `keyBindings`)
VALUES
	(0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,0,'user','admin','$2y$10$VgZD64Znjx2wmFSC3ZFCbOOwHBpj.kP.Nd00/SEnr/WzGxeh.BfBe',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,0,'','',NULL,'null',NULL,'','','',NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle users_permission_definitions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_permission_definitions`;

CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;

INSERT INTO `users_permission_definitions` (`key`)
VALUES
	('admin_translations'),
	('application_logging'),
	('assets'),
	('asset_metadata'),
	('classes'),
	('clear_cache'),
	('clear_fullpage_cache'),
	('clear_temp_files'),
	('dashboards'),
	('documents'),
	('document_types'),
	('emails'),
	('gdpr_data_extractor'),
	('glossary'),
	('http_errors'),
	('notes_events'),
	('notifications'),
	('notifications_send'),
	('objects'),
	('piwik_reports'),
	('piwik_settings'),
	('plugins'),
	('predefined_properties'),
	('qr_codes'),
	('recyclebin'),
	('redirects'),
	('reports'),
	('reports_config'),
	('robots.txt'),
	('routes'),
	('seemode'),
	('seo_document_editor'),
	('share_configurations'),
	('system_settings'),
	('tags_assignment'),
	('tags_configuration'),
	('tags_search'),
	('tag_snippet_management'),
	('targeting'),
	('thumbnails'),
	('translations'),
	('users'),
	('web2print_settings'),
	('website_settings'),
	('workflow_details');

/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle users_workspaces_asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_workspaces_asset`;

CREATE TABLE `users_workspaces_asset` (
  `cid` int(11) unsigned NOT NULL DEFAULT 0,
  `cpath` varchar(765) CHARACTER SET utf8 DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT 0,
  `list` tinyint(1) DEFAULT 0,
  `view` tinyint(1) DEFAULT 0,
  `publish` tinyint(1) DEFAULT 0,
  `delete` tinyint(1) DEFAULT 0,
  `rename` tinyint(1) DEFAULT 0,
  `create` tinyint(1) DEFAULT 0,
  `settings` tinyint(1) DEFAULT 0,
  `versions` tinyint(1) DEFAULT 0,
  `properties` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Export von Tabelle users_workspaces_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_workspaces_document`;

CREATE TABLE `users_workspaces_document` (
  `cid` int(11) unsigned NOT NULL DEFAULT 0,
  `cpath` varchar(765) CHARACTER SET utf8 DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT 0,
  `list` tinyint(1) unsigned DEFAULT 0,
  `view` tinyint(1) unsigned DEFAULT 0,
  `save` tinyint(1) unsigned DEFAULT 0,
  `publish` tinyint(1) unsigned DEFAULT 0,
  `unpublish` tinyint(1) unsigned DEFAULT 0,
  `delete` tinyint(1) unsigned DEFAULT 0,
  `rename` tinyint(1) unsigned DEFAULT 0,
  `create` tinyint(1) unsigned DEFAULT 0,
  `settings` tinyint(1) unsigned DEFAULT 0,
  `versions` tinyint(1) unsigned DEFAULT 0,
  `properties` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Export von Tabelle users_workspaces_object
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_workspaces_object`;

CREATE TABLE `users_workspaces_object` (
  `cid` int(11) unsigned NOT NULL DEFAULT 0,
  `cpath` varchar(765) CHARACTER SET utf8 DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT 0,
  `list` tinyint(1) unsigned DEFAULT 0,
  `view` tinyint(1) unsigned DEFAULT 0,
  `save` tinyint(1) unsigned DEFAULT 0,
  `publish` tinyint(1) unsigned DEFAULT 0,
  `unpublish` tinyint(1) unsigned DEFAULT 0,
  `delete` tinyint(1) unsigned DEFAULT 0,
  `rename` tinyint(1) unsigned DEFAULT 0,
  `create` tinyint(1) unsigned DEFAULT 0,
  `settings` tinyint(1) unsigned DEFAULT 0,
  `versions` tinyint(1) unsigned DEFAULT 0,
  `properties` tinyint(1) unsigned DEFAULT 0,
  `lEdit` text DEFAULT NULL,
  `lView` text DEFAULT NULL,
  `layouts` text DEFAULT NULL,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Export von Tabelle uuids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uuids`;

CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` int(11) unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`itemId`,`type`,`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Export von Tabelle versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `versions`;

CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `note` text DEFAULT NULL,
  `stackTrace` text DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  `public` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `serialized` tinyint(1) unsigned DEFAULT 0,
  `versionCount` int(10) unsigned NOT NULL DEFAULT 0,
  `binaryFileHash` varchar(128) CHARACTER SET ascii DEFAULT NULL,
  `binaryFileId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype_cid` (`ctype`,`cid`),
  KEY `date` (`date`),
  KEY `binaryFileHash` (`binaryFileHash`),
  KEY `binaryFileId` (`binaryFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
