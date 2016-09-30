/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : hap_dev

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-09-28 00:26:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rep_datasource
-- ----------------------------
DROP TABLE IF EXISTS `rep_datasource`;
CREATE TABLE `rep_datasource` (
  `datasource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `jdbc_url` varchar(500) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`datasource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for rep_report_header_b
-- ----------------------------
DROP TABLE IF EXISTS `rep_report_header_b`;
CREATE TABLE `rep_report_header_b` (
  `rep_header_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ds_id` bigint(20) DEFAULT NULL,
  `program_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `sql_text` text,
  `enable` varchar(1) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) NOT NULL DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`rep_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_report_header_tl
-- ----------------------------
DROP TABLE IF EXISTS `rep_report_header_tl`;
CREATE TABLE `rep_report_header_tl` (
  `rep_header_id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lang` varchar(15) NOT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`rep_header_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_report_line_b
-- ----------------------------
DROP TABLE IF EXISTS `rep_report_line_b`;
CREATE TABLE `rep_report_line_b` (
  `rep_line_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rep_header_id` bigint(20) DEFAULT NULL,
  `column_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `data_type` varchar(50) DEFAULT NULL,
  `column_width` int(11) DEFAULT NULL,
  `display_width` int(11) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `sort` varchar(1) DEFAULT NULL,
  `display` varchar(1) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`rep_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rep_report_line_tl
-- ----------------------------
DROP TABLE IF EXISTS `rep_report_line_tl`;
CREATE TABLE `rep_report_line_tl` (
  `rep_line_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lang` varchar(15) NOT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`rep_line_id`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_query_params_b
-- ----------------------------
DROP TABLE IF EXISTS `rep_query_params_b`;
CREATE TABLE `rep_query_params_b` (
  `query_params_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rep_header_id` bigint(20) DEFAULT NULL,
  `params_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `default_type` varchar(50) DEFAULT NULL,
  `default_value` text,
  `default_text` varchar(50) DEFAULT NULL,
  `data_type` varchar(20) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `show_width` int(11) DEFAULT NULL,
  `form_element` varchar(20) DEFAULT NULL,
  `content_source` varchar(20) DEFAULT NULL,
  `content` text,
  `required` varchar(1) DEFAULT NULL,
  `display` varchar(1) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT '',
  PRIMARY KEY (`query_params_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for rep_query_params_tl
-- ----------------------------
DROP TABLE IF EXISTS `rep_query_params_tl`;
CREATE TABLE `rep_query_params_tl` (
  `query_params_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `lang` varchar(15) NOT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`query_params_id`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_flex_vset_b
-- ----------------------------
DROP TABLE IF EXISTS `rep_flex_vset_b`;
CREATE TABLE `rep_flex_vset_b` (
  `flex_value_set_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flex_value_set_name` varchar(240) DEFAULT NULL,
  `validation_type` varchar(1) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `table_name` varchar(360) DEFAULT NULL,
  `where_condition` text,
  `width` bigint(20) DEFAULT NULL,
  `height` bigint(20) DEFAULT NULL,
  `title` varchar(240) DEFAULT NULL,
  `delayed_loading_flag` varchar(1) DEFAULT NULL,
  `enabled_flag` varchar(1) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `creation_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '-1',
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` date DEFAULT NULL,
  `last_update_login` bigint(20) DEFAULT NULL,
  `program_application_id` bigint(20) DEFAULT NULL,
  `program_id` bigint(20) DEFAULT NULL,
  `program_update_date` date DEFAULT NULL,
  `request_id` bigint(20) DEFAULT NULL,
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  `expand_method` text,
  PRIMARY KEY (`flex_value_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rep_flex_vset_tl
-- ----------------------------
DROP TABLE IF EXISTS `rep_flex_vset_tl`;
CREATE TABLE `rep_flex_vset_tl` (
  `flex_value_set_id` bigint(20) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `description` varchar(240) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `creation_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '-1',
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` date DEFAULT NULL,
  `last_update_login` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flex_value_set_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rep_validate_table_b
-- ----------------------------
DROP TABLE IF EXISTS `rep_validate_table_b`;
CREATE TABLE `rep_validate_table_b` (
  `validate_table_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flex_value_set_id` bigint(20) DEFAULT NULL,
  `column_name` varchar(60) DEFAULT NULL,
  `column_flag` varchar(1) DEFAULT NULL,
  `condition_flag` varchar(1) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `width` bigint(4) DEFAULT NULL,
  `value_field` varchar(60) DEFAULT NULL,
  `text_field` varchar(60) DEFAULT NULL,
  `hidden_flag` varchar(1) DEFAULT NULL,
  `algin` varchar(240) DEFAULT NULL,
  `enabled_flag` varchar(1) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `creation_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '-1',
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` date DEFAULT NULL,
  `last_update_login` bigint(20) DEFAULT NULL,
  `program_application_id` bigint(20) DEFAULT NULL,
  `program_id` bigint(20) DEFAULT NULL,
  `program_update_date` date DEFAULT NULL,
  `request_id` bigint(20) DEFAULT NULL,
  `attribute_category` varchar(30) DEFAULT NULL,
  `attribute1` varchar(240) DEFAULT NULL,
  `attribute2` varchar(240) DEFAULT NULL,
  `attribute3` varchar(240) DEFAULT NULL,
  `attribute4` varchar(240) DEFAULT NULL,
  `attribute5` varchar(240) DEFAULT NULL,
  `attribute6` varchar(240) DEFAULT NULL,
  `attribute7` varchar(240) DEFAULT NULL,
  `attribute8` varchar(240) DEFAULT NULL,
  `attribute9` varchar(240) DEFAULT NULL,
  `attribute10` varchar(240) DEFAULT NULL,
  `attribute11` varchar(240) DEFAULT NULL,
  `attribute12` varchar(240) DEFAULT NULL,
  `attribute13` varchar(240) DEFAULT NULL,
  `attribute14` varchar(240) DEFAULT NULL,
  `attribute15` varchar(240) DEFAULT NULL,
  `column_alias` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`validate_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_validate_table_tl
-- ----------------------------
DROP TABLE IF EXISTS `rep_validate_table_tl`;
CREATE TABLE `rep_validate_table_tl` (
  `validate_table_id` bigint(20) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `description` varchar(240) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `creation_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '-1',
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` date DEFAULT NULL,
  `last_update_login` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`validate_table_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for rep_compenent_content
-- ----------------------------
DROP TABLE IF EXISTS `rep_compenent_content`;
CREATE TABLE `rep_compenent_content` (
  `mapper_id` bigint(11) NOT NULL,
  `compenent` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_compenent_content
-- ----------------------------
INSERT INTO `rep_compenent_content` VALUES ('1', 'SINGLE_SELECT', 'SQL');
INSERT INTO `rep_compenent_content` VALUES ('2', 'SINGLE_SELECT', 'STRING');
INSERT INTO `rep_compenent_content` VALUES ('3', 'MULTI_SELECT', 'SQL');
INSERT INTO `rep_compenent_content` VALUES ('4', 'MULTI_SELECT', 'STRING');
INSERT INTO `rep_compenent_content` VALUES ('5', 'COMBOBOX', 'SQL');
INSERT INTO `rep_compenent_content` VALUES ('6', 'COMBOBOX', 'STRING');
INSERT INTO `rep_compenent_content` VALUES ('7', 'CHECKBOX', 'SQL');
INSERT INTO `rep_compenent_content` VALUES ('8', 'CHECKBOX', 'STRING');
INSERT INTO `rep_compenent_content` VALUES ('9', 'DATE', 'NULL');
INSERT INTO `rep_compenent_content` VALUES ('10', 'TIME', 'NULL');
INSERT INTO `rep_compenent_content` VALUES ('11', 'INPUT', 'NULL');
INSERT INTO `rep_compenent_content` VALUES ('12', 'LOV', 'LOV');
INSERT INTO `rep_compenent_content` VALUES ('13', 'LOV', 'VALUE_SET');



