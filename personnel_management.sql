/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : personnel_management

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-05-05 21:37:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pm_attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `pm_attendance_record`;
CREATE TABLE `pm_attendance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clock_time` datetime NOT NULL,
  `clock_type` varchar(10) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `same_day_time` date DEFAULT NULL,
  `state` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '无',
  PRIMARY KEY (`id`),
  KEY `fk_emp_id3` (`emp_id`),
  CONSTRAINT `fk_emp_id3` FOREIGN KEY (`emp_id`) REFERENCES `pm_employee_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_authority_management
-- ----------------------------
DROP TABLE IF EXISTS `pm_authority_management`;
CREATE TABLE `pm_authority_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_id` (`user_role_id`),
  CONSTRAINT `fk_user_role_Id` FOREIGN KEY (`user_role_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_basic_information
-- ----------------------------
DROP TABLE IF EXISTS `pm_basic_information`;
CREATE TABLE `pm_basic_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mark` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_employee_information
-- ----------------------------
DROP TABLE IF EXISTS `pm_employee_information`;
CREATE TABLE `pm_employee_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_number` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_sex` varchar(10) DEFAULT NULL,
  `emp_phone` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `emp_age` int(10) DEFAULT NULL,
  `emp_address` varchar(200) DEFAULT NULL,
  `emp_id_card` varchar(100) DEFAULT NULL,
  `emp_nation_type_id` int(10) DEFAULT NULL,
  `emp_political_type_id` int(10) DEFAULT NULL,
  `emp_culture_type_id` int(10) DEFAULT NULL,
  `emp_photo_url` varchar(200) DEFAULT NULL,
  `emp_school` varchar(50) DEFAULT NULL,
  `emp_major` varchar(50) DEFAULT NULL,
  `emp_join_time` date DEFAULT NULL,
  `emp_position_type_id` int(10) DEFAULT NULL,
  `emp_dept_type_id` int(10) DEFAULT NULL,
  `emp_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_nation_type` (`emp_nation_type_id`),
  KEY `fk_culture_type` (`emp_culture_type_id`),
  KEY `fk_dept_type` (`emp_dept_type_id`),
  KEY `fk_position_type` (`emp_position_type_id`),
  KEY `fk_political_type` (`emp_political_type_id`),
  CONSTRAINT `fk_culture_type` FOREIGN KEY (`emp_culture_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_dept_type` FOREIGN KEY (`emp_dept_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_nation_type` FOREIGN KEY (`emp_nation_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_political_type` FOREIGN KEY (`emp_political_type_id`) REFERENCES `pm_basic_information` (`id`),
  CONSTRAINT `fk_position_type` FOREIGN KEY (`emp_position_type_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_module_table
-- ----------------------------
DROP TABLE IF EXISTS `pm_module_table`;
CREATE TABLE `pm_module_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `pm_operation_log`;
CREATE TABLE `pm_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(50) DEFAULT NULL,
  `operator_ip` varchar(255) DEFAULT NULL,
  `operation_content` varchar(500) DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL,
  `operation_current_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for pm_rewards_records
-- ----------------------------
DROP TABLE IF EXISTS `pm_rewards_records`;
CREATE TABLE `pm_rewards_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_reason` varchar(500) DEFAULT NULL,
  `rewards_time` date DEFAULT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `rewards_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_id2` (`emp_id`),
  KEY `fk_reward_type_id` (`rewards_type_id`),
  CONSTRAINT `fk_emp_id2` FOREIGN KEY (`emp_id`) REFERENCES `pm_employee_information` (`id`),
  CONSTRAINT `fk_reward_type_id` FOREIGN KEY (`rewards_type_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_users
-- ----------------------------
DROP TABLE IF EXISTS `pm_users`;
CREATE TABLE `pm_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_is_start` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '是',
  `user_create_time` datetime DEFAULT NULL,
  `user_role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bl_users` (`user_role_id`),
  CONSTRAINT `fk_bl_users` FOREIGN KEY (`user_role_id`) REFERENCES `pm_basic_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for pm_wages_management
-- ----------------------------
DROP TABLE IF EXISTS `pm_wages_management`;
CREATE TABLE `pm_wages_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `years` int(11) NOT NULL,
  `months` int(11) NOT NULL,
  `monthly_wages` decimal(18,2) DEFAULT NULL,
  `performance_royalty` decimal(18,2) DEFAULT NULL,
  `deduct` decimal(18,2) DEFAULT NULL,
  `real_pay` decimal(18,2) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pm_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `pm_work_experience`;
CREATE TABLE `pm_work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `work_company` varchar(100) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
