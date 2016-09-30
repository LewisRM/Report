/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : hap_dev

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-09-28 14:52:44
*/

SET FOREIGN_KEY_CHECKS=0;

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
