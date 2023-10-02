-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: morf-course-data-coursera.ckpjakz3adxb.us-east-2.rds.amazonaws.com    Database: accounting_001
-- ------------------------------------------------------
-- Server version	5.7.38-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `access_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `default` tinyint(4) NOT NULL,
  `allow_site_access` tinyint(4) NOT NULL DEFAULT '1',
  `forum_title` varchar(255) NOT NULL,
  `forum_admin` tinyint(4) NOT NULL DEFAULT '0',
  `forum_moderate` tinyint(4) NOT NULL DEFAULT '0',
  `forum_banned` tinyint(4) NOT NULL DEFAULT '0',
  `admin_access` tinyint(4) NOT NULL DEFAULT '0',
  `user_admin` tinyint(4) NOT NULL DEFAULT '0',
  `wiki_admin` tinyint(4) NOT NULL DEFAULT '0',
  `wiki_createpage` tinyint(4) NOT NULL DEFAULT '0',
  `i18n_admin` tinyint(4) NOT NULL DEFAULT '0',
  `staging_admin` tinyint(4) NOT NULL DEFAULT '0',
  `navbar` tinyint(4) NOT NULL DEFAULT '0',
  `dev_admin` tinyint(4) NOT NULL DEFAULT '0',
  `log_admin` tinyint(4) NOT NULL DEFAULT '0',
  `prereg_access` tinyint(4) NOT NULL DEFAULT '0',
  `user_level_priority` int(11) NOT NULL DEFAULT '0',
  `data_access_tier` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `default` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `metadata` longtext NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timeindex` (`timestamp`,`module`,`action`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=695322 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 NOT NULL,
  `session_user_id` varchar(160) NOT NULL,
  `open_time` int(11) DEFAULT NULL,
  `close_time` int(11) NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `email_announcements` enum('no_email','email_staged','email_sent','email_resend_staged') CHARACTER SET utf8mb4 NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `open_time` (`deleted`,`open_time`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `open_time` int(11) DEFAULT NULL,
  `soft_close_time` int(11) DEFAULT NULL,
  `hard_close_time` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `maximum_submissions` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_part_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_part_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `part_order` int(11) NOT NULL,
  `maximum_score` int(11) NOT NULL,
  `retry_delay` int(11) NOT NULL,
  `optional` tinyint(1) NOT NULL,
  `maximum_submissions` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `grader` varchar(255) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `sid` (`sid`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_submission_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_submission_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL COMMENT 'assignment_part_id',
  `session_user_id` varchar(160) NOT NULL,
  `submission_time` int(11) NOT NULL,
  `submission_number` int(11) NOT NULL,
  `raw_score` float DEFAULT NULL,
  `authenticated_submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignment_part_id_user_id` (`item_id`,`session_user_id`),
  KEY `type_2a` (`session_user_id`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_grades`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_user_id` varchar(160) NOT NULL,
  `normal_grade` float DEFAULT NULL,
  `distinction_grade` float DEFAULT NULL,
  `achievement_level` enum('normal','distinction','none') NOT NULL,
  `authenticated_overall` tinyint(4) DEFAULT NULL,
  `ace_grade` float DEFAULT NULL,
  `passed_ace` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`session_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112393 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_comments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_time` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `is_spam` tinyint(4) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL,
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `comment_text` text NOT NULL,
  `user_agent` text NOT NULL,
  `text_type` enum('markdown','html') NOT NULL DEFAULT 'markdown',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4733 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_forums`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` enum('qna','forum') NOT NULL DEFAULT 'forum',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `can_post` tinyint(4) NOT NULL DEFAULT '0',
  `show_threads` tinyint(4) NOT NULL DEFAULT '1',
  `resolved_tag` tinyint(4) NOT NULL DEFAULT '0',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `open_time` int(11) NOT NULL DEFAULT '0',
  `forum_moderators_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ParentID_OpenTime` (`parent_id`,`open_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_posts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_time` int(11) NOT NULL,
  `edit_time` int(11) NOT NULL DEFAULT '-1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `is_spam` tinyint(4) NOT NULL DEFAULT '0',
  `original` tinyint(4) NOT NULL DEFAULT '0',
  `stickied` tinyint(4) NOT NULL DEFAULT '0',
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `user_agent` text NOT NULL,
  `text_type` enum('markdown','html') NOT NULL DEFAULT 'markdown',
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9909 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_reporting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_reporting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_type` enum('inappropriate','technical') NOT NULL,
  `item_type` enum('post','comment') NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tuple` (`user_id`,`report_type`,`item_type`,`item_id`),
  KEY `item_type` (`item_type`,`item_id`,`report_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_reputation_points`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_reputation_points` (
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_reputation_record`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_reputation_record` (
  `user_id` int(11) NOT NULL,
  `pc_id` int(11) NOT NULL,
  `type` enum('post','comment') NOT NULL,
  `direction` tinyint(4) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '-1',
  UNIQUE KEY `user_post` (`user_id`,`type`,`pc_id`),
  KEY `timedindex` (`type`,`pc_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_subscribe_forums`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_subscribe_forums` (
  `user_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  UNIQUE KEY `forum_user_subscribe` (`forum_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_subscribe_threads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_subscribe_threads` (
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  UNIQUE KEY `thread_user_subscribe` (`thread_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_tags`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_tags_threads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_tags_threads` (
  `tag_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `is_spam` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `tag_thread` (`tag_id`,`thread_id`),
  UNIQUE KEY `thread_tag` (`thread_id`,`tag_id`),
  KEY `timestamp_tag` (`timestamp`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum_threads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `posted_time` int(11) NOT NULL,
  `last_updated_time` int(11) NOT NULL,
  `last_updated_user` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `is_spam` tinyint(4) NOT NULL DEFAULT '0',
  `stickied` tinyint(4) NOT NULL DEFAULT '0',
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `unresolved` tinyint(4) NOT NULL DEFAULT '0',
  `instructor_replied` tinyint(4) NOT NULL DEFAULT '0',
  `num_posts` int(11) NOT NULL DEFAULT '1',
  `num_views` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `triage_sync_status` tinyint(1) NOT NULL DEFAULT '0',
  `triage_status` smallint(3) NOT NULL DEFAULT '0',
  `private` int(11) NOT NULL DEFAULT '0',
  `problem_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_delete_sticked` (`forum_id`,`deleted`,`stickied`),
  KEY `last_updated` (`forum_id`,`stickied`,`last_updated_time`),
  KEY `user_id` (`user_id`),
  KEY `problem_id` (`problem_id`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1826 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hash_mapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hash_mapping` (
  `user_id` int(11) NOT NULL,
  `eventing_user_id` varchar(255) NOT NULL,
  `session_user_id` varchar(255) NOT NULL,
  `public_user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_calibration_gradings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_calibration_gradings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` int(8) NOT NULL,
  `calibration_set_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `type` enum('training','groundTruth','staffGradeOnly') DEFAULT NULL,
  `submit_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_number` (`item_number`,`calibration_set_id`),
  KEY `submit_time` (`submit_time`),
  KEY `peer_grading_set_id` (`calibration_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_evaluation_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_evaluation_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(160) NOT NULL,
  `author_group` enum('student','staff') NOT NULL DEFAULT 'student',
  `submission_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `save_time` int(11) NOT NULL,
  `submit_time` int(11) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `ignore` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_group` (`author_group`),
  KEY `author_id` (`author_id`),
  KEY `submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_user_id` varchar(160) NOT NULL,
  `open_time` int(11) DEFAULT NULL,
  `submission_deadline` int(11) DEFAULT NULL,
  `submission_deadline_grace_period` int(11) NOT NULL,
  `grading_start` int(11) DEFAULT NULL,
  `grading_deadline` int(11) DEFAULT NULL,
  `grading_deadline_grace_period` int(11) NOT NULL,
  `display_grades_time` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `max_grade` float NOT NULL,
  `last_updated` int(11) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_overall_evaluation_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_overall_evaluation_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `grade` float DEFAULT NULL,
  `final_grade` float DEFAULT NULL,
  `staff_grade` float DEFAULT NULL,
  `peer_grade` float DEFAULT NULL,
  `self_grade` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_peer_grading_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_peer_grading_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` int(8) NOT NULL,
  `peer_grading_set_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `submit_time` int(11) DEFAULT NULL,
  `required` int(1) NOT NULL,
  `last_required` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_number` (`item_number`,`peer_grading_set_id`),
  KEY `submit_time` (`submit_time`),
  KEY `peer_grading_set_id` (`peer_grading_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_peer_grading_set_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_peer_grading_set_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_user_id` varchar(160) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `status` enum('completed','ongoing') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`session_user_id`,`assessment_id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `user_id` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_self_grading_set_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_self_grading_set_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_user_id` varchar(160) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `status` enum('completed','ongoing') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`session_user_id`,`assessment_id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `user_id` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_submission_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_submission_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(160) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `assessment_id` int(11) NOT NULL,
  `included_in_training` tinyint(1) NOT NULL DEFAULT '0',
  `included_in_grading` tinyint(1) NOT NULL DEFAULT '1',
  `included_in_ground_truth` tinyint(1) NOT NULL,
  `excluded_from_circulation` tinyint(1) NOT NULL,
  `anonymized_if_showcased` tinyint(1) NOT NULL,
  `blank` tinyint(1) NOT NULL,
  `start_time` int(11) NOT NULL,
  `save_time` int(11) NOT NULL,
  `submit_time` int(11) DEFAULT NULL,
  `allocation_score` float DEFAULT NULL,
  `authenticated_submission_id` int(11) DEFAULT NULL,
  `ignore_grade_adjustments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `included_in_grading` (`included_in_grading`),
  KEY `included_in_training` (`included_in_training`),
  KEY `author_id` (`author_id`),
  KEY `allocation_score` (`allocation_score`),
  KEY `excluded_from_circulation` (`excluded_from_circulation`,`anonymized_if_showcased`),
  KEY `included_in_ground_truth` (`included_in_ground_truth`),
  KEY `blank` (`blank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_training_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_training_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` int(8) NOT NULL,
  `training_set_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `submit_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_number` (`item_number`,`training_set_id`),
  KEY `submit_time` (`submit_time`),
  KEY `peer_grading_set_id` (`training_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hg_assessment_training_set_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_assessment_training_set_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_user_id` varchar(160) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `finish_time` int(11) DEFAULT NULL,
  `status` enum('pass','fail','ongoing') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `user_id` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items_sections`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_sections` (
  `item_type` enum('quiz','lecture','assignment','peergrading','coursepage','announcement') NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `section_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`item_type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs2_wiki`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs2_wiki` (
  `id` varchar(128) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `alternate_key` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `metadata` mediumtext,
  `encoding` varchar(64) DEFAULT NULL,
  `schema_version` varchar(64) DEFAULT NULL,
  `content` mediumblob,
  `content_encoding` varchar(64) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `modified_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`),
  UNIQUE KEY `alternate_key` (`alternate_key`,`version`),
  KEY `kvs2_wiki_idx1` (`id`,`version`,`is_deleted`),
  KEY `kvs2_wiki_idx2` (`alternate_key`,`version`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.assignment.data`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.assignment.data` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.assignment.submissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.assignment.submissions` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.forum_readrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.forum_readrecord` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.human_grading`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.human_grading` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.internationalization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.internationalization` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.lecture`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.lecture` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kvs_course.quiz`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvs_course.quiz` (
  `key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext,
  PRIMARY KEY (`key`(160))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `late_days_applied`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `late_days_applied` (
  `item_type` enum('quiz','lecture','assignment') NOT NULL,
  `item_id` int(11) NOT NULL,
  `session_user_id` varchar(160) NOT NULL,
  `late_days_applied` int(11) NOT NULL,
  PRIMARY KEY (`item_type`,`item_id`,`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `late_days_left`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `late_days_left` (
  `session_user_id` varchar(160) NOT NULL,
  `late_days_left` int(11) NOT NULL,
  PRIMARY KEY (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lecture_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `open_time` int(11) DEFAULT NULL,
  `soft_close_time` int(11) DEFAULT NULL,
  `hard_close_time` int(11) DEFAULT NULL,
  `maximum_submissions` int(11) NOT NULL DEFAULT '100',
  `title` varchar(255) DEFAULT NULL,
  `source_video` varchar(255) DEFAULT NULL,
  `video_length` float DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `final` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0',
  `video_id` varchar(255) DEFAULT NULL,
  `video_id_v2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lecture_submission_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_submission_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `session_user_id` varchar(160) NOT NULL,
  `submission_time` int(11) NOT NULL,
  `submission_number` int(11) NOT NULL,
  `raw_score` float DEFAULT NULL,
  `action` enum('view','download') NOT NULL DEFAULT 'view',
  PRIMARY KEY (`id`),
  KEY `type_2` (`item_id`,`session_user_id`),
  KEY `type_2a` (`session_user_id`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2192923 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navbar_list`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbar_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `link_type` enum('circuit','wiki','link','window_link','heading') NOT NULL,
  `link_data` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quiz_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `open_time` int(11) DEFAULT NULL,
  `soft_close_time` int(11) DEFAULT NULL,
  `hard_close_time` int(11) DEFAULT NULL,
  `maximum_submissions` int(11) NOT NULL DEFAULT '100',
  `title` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `quiz_type` enum('quiz','video','exam','homework','survey') NOT NULL,
  `proctoring_requirement` enum('none','proctored','nonproctored') NOT NULL DEFAULT 'none',
  `authentication_required` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quiz_submission_metadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_submission_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `session_user_id` varchar(160) NOT NULL,
  `submission_time` int(11) NOT NULL,
  `submission_number` int(11) NOT NULL,
  `raw_score` float DEFAULT NULL,
  `grading_error` tinyint(1) NOT NULL DEFAULT '0',
  `authenticated_submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_2` (`item_id`,`session_user_id`),
  KEY `type_2a` (`session_user_id`,`item_id`),
  KEY `grading_error` (`grading_error`)
) ENGINE=InnoDB AUTO_INCREMENT=243938 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `last_published_date` int(11) NOT NULL DEFAULT '0',
  `visible_date` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `session_user_id` varchar(160) NOT NULL,
  `locale` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'en_US',
  `timezone` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'America/Los_Angeles',
  `access_group_id` int(11) NOT NULL,
  `registration_time` int(11) NOT NULL DEFAULT '0',
  `last_access_time` int(11) NOT NULL DEFAULT '0',
  `email_announcement` tinyint(4) NOT NULL DEFAULT '1',
  `email_forum` tinyint(4) NOT NULL DEFAULT '1',
  `in_signature_track` tinyint(1) NOT NULL DEFAULT '0',
  `wishes_proctored_exam` tinyint(1) DEFAULT NULL,
  `email_review` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `signature_track_register_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_user_id`),
  KEY `deleted` (`deleted`),
  KEY `access_group_id` (`access_group_id`),
  KEY `access_group_id_2` (`access_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_pages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonical_name` varchar(100) NOT NULL,
  `title` text NOT NULL,
  `creator` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL,
  `current_revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `canonical_name` (`canonical_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_revisions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `session_user_id` varchar(160) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_time` (`page_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'accounting_001'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-05 14:11:09
