# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.01 (MySQL 8.2.0)
# Database: core_banking
# Generation Time: 2024-01-29 02:35:42 +0000
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


# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) DEFAULT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9f8d0972aeeb5a2277e40332d2` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;

INSERT INTO `currencies` (`id`, `created_at`, `updated_at`, `deleted_at`, `code`, `name`)
VALUES
	(1,'2023-10-20 10:56:00.257009','2023-10-20 10:56:00.257009',NULL,'NGN','Naira');

/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transaction_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transaction_types`;

CREATE TABLE `transaction_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `direction` enum('credit','debit') NOT NULL,
  `limit` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX_TRANSACTION_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `transaction_types` WRITE;
/*!40000 ALTER TABLE `transaction_types` DISABLE KEYS */;

INSERT INTO `transaction_types` (`id`, `name`, `description`, `direction`, `limit`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Account Opening','Open a new account','credit',0.0000,'2023-10-19 15:34:26.659130','2023-10-19 15:34:26.659130',NULL),
	(3,'Fund With Card','Funds account from card transaction','credit',0.0000,'2023-10-19 15:35:52.588234','2023-10-19 15:35:52.588234',NULL),
	(4,'Debit Reversal','For reversal of debit transactions','credit',0.0000,'2023-10-19 15:37:33.354952','2023-10-19 15:37:33.354952',NULL),
	(5,'Credit Reversal','For reversal of credit transactions','debit',0.0000,'2023-10-19 15:37:45.347871','2023-10-19 15:37:45.347871',NULL),
	(6,'Overdraft Credit','Repay an overdraft','credit',0.0000,'2023-11-10 03:59:03.586541','2023-11-10 03:59:03.586541',NULL),
	(7,'Overdraft Debit','borrow from overdraft','debit',0.0000,'2023-11-10 03:59:55.645019','2023-11-10 03:59:55.645019',NULL),
	(8,'External Transfer','transfer fund to external account','debit',0.0000,'2023-11-13 02:39:49.782581','2023-11-13 02:39:49.782581',NULL),
	(9,'WithHolding','pending WithHolding transaction','credit',0.0000,'2024-01-25 08:02:56.359000','2024-01-25 08:02:56.359000',NULL),
	(11,'Lien','pending WithHolding transaction','credit',0.0000,'2024-01-25 08:04:39.370727','2024-01-25 08:04:39.370727',NULL),
	(15,'Delete Me','pending WithHolding transaction','credit',0.0000,'2024-01-25 08:08:19.931899','2024-01-25 08:12:49.000000','2024-01-25 08:12:49.000000');

/*!40000 ALTER TABLE `transaction_types` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
