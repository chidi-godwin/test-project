# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.01 (MySQL 8.2.0)
# Database: core_banking
# Generation Time: 2024-01-31 03:21:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_types`;

CREATE TABLE `account_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `allow_negative_balance` tinyint NOT NULL,
  `allow_overdraft` tinyint NOT NULL,
  `accrue_interest` tinyint NOT NULL,
  `is_public` tinyint NOT NULL DEFAULT '1',
  `is_transactional` tinyint NOT NULL,
  `max_per_owner` int NOT NULL DEFAULT '1',
  `is_primary` tinyint NOT NULL DEFAULT '0',
  `minimum_balance` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_ACCOUNT_TYPE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;

INSERT INTO `account_types` (`id`, `allow_negative_balance`, `allow_overdraft`, `accrue_interest`, `is_public`, `is_transactional`, `max_per_owner`, `is_primary`, `minimum_balance`, `created_at`, `updated_at`, `deleted_at`, `name`, `is_default`)
VALUES
	(1,0,1,0,1,1,20,1,0.0000,'2023-10-19 09:49:07.983844','2023-10-26 13:41:37.580135',NULL,'Savings',1),
	(5,0,1,0,1,1,1,1,0.0000,'2023-10-19 10:01:52.921664','2023-10-19 10:01:52.921664',NULL,'Main',0),
	(6,0,1,1,0,0,1,0,0.0000,'2023-10-19 10:02:42.515270','2023-10-19 10:02:42.515270',NULL,'Flex',0),
	(9,0,0,1,0,0,1,0,0.0000,'2023-10-20 12:54:12.059068','2023-10-23 10:23:53.370756',NULL,'Family',0),
	(10,0,0,1,0,0,1,0,0.0000,'2023-10-20 12:55:40.240884','2023-10-23 21:06:10.719259',NULL,'Target',0),
	(11,0,0,1,0,1,10,0,0.0000,'2023-11-09 23:22:52.322852','2023-11-14 14:28:44.309727',NULL,'Overdraft',0),
	(12,0,0,1,1,0,1,0,0.0000,'2023-11-13 02:26:39.180105','2023-11-14 09:52:28.952837',NULL,'Dynamic',0),
	(13,0,0,1,0,1,1,0,0.0000,'2023-11-14 10:06:55.820643','2023-11-14 10:06:55.820643',NULL,'Fixed',0),
	(14,0,0,1,0,1,1,0,0.0000,'2023-11-14 11:23:19.268823','2023-11-14 11:23:19.268823',NULL,'Chest',0),
	(21,0,0,0,0,0,1,0,0.0000,'2023-11-14 11:28:19.342877','2023-11-14 11:28:19.342877',NULL,'Service',0),
	(22,0,0,0,0,0,1,0,0.0000,'2024-01-19 16:39:47.659775','2024-01-19 16:39:47.659775',NULL,'Lien',0),
	(23,0,0,0,0,0,1,0,0.0000,'2024-01-24 22:32:29.700008','2024-01-24 22:46:10.000000',NULL,'WithHolding',0),
	(24,0,0,0,0,0,1,0,0.0000,'2024-01-24 22:47:36.100905','2024-01-24 22:52:50.000000','2024-01-24 22:52:50.000000','Delete Me',0);

/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
