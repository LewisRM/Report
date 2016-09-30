/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : hap_dev

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-09-30 10:36:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.3)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.3', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-1', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:56', '1', 'EXECUTED', '7:9cac9c56da25e14795c9ad0fa1436c19', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-2', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:57', '2', 'EXECUTED', '7:4fbf94e2b860800c31b0dc741b1cc56d', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-3', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:57', '3', 'EXECUTED', '7:c5d02f6706c09925ada01e78fbec775e', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-4', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:58', '4', 'EXECUTED', '7:98e509fd86f463cfc9f0457b9af1aa24', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-5', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:58', '5', 'EXECUTED', '7:c9394c7c876230a3d1c76ae22cdf51f1', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-6', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:58', '6', 'EXECUTED', '7:39f27d752e50a3fb8c9baf990023933a', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-7', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:58:59', '7', 'EXECUTED', '7:bd36b3d3d7f637818958a20b7c3d0303', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-8', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:00', '8', 'EXECUTED', '7:1aa7bd433cb7d40a9c6a5d2027d93443', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-9', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:01', '9', 'EXECUTED', '7:596ef942250760c5b7c49712bd3474bd', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-10', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:02', '10', 'EXECUTED', '7:39b02b71fe5c8be736b097ba5df03e10', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-11', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:03', '11', 'EXECUTED', '7:e024cbc744bc3604506d75113d761cf2', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-12', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:03', '12', 'EXECUTED', '7:10c94b55779ea6019ffded776921b4e5', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-13', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:03', '13', 'EXECUTED', '7:4d19b9d150cafff27019708e974b01b0', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-14', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:04', '14', 'EXECUTED', '7:d55d120d9276cb99bc0d8ab9f5e3e142', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-15', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:04', '15', 'EXECUTED', '7:c21ceb77d35a4f6401177a4aa8f25941', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-16', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:05', '16', 'EXECUTED', '7:907366948b2002d35918eeef6d753ffa', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-17', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:05', '17', 'EXECUTED', '7:308fe8677e4a2bc4d8b8fbd8f7b9514a', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-18', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:05', '18', 'EXECUTED', '7:5564c78e64e26db869d6b4b4ec1a9bd6', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-19', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:06', '19', 'EXECUTED', '7:e51b9f5d93eba47601a13ab94a9db213', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-20', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:06', '20', 'EXECUTED', '7:529e1311039bbccab38e292fc0eb1b63', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-21', 'hailor', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:07', '21', 'EXECUTED', '7:a8d97f5fbea7695dd972c2f6fd407e68', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attach-category-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:08', '22', 'EXECUTED', '7:b5a431dc604124f68b021b4039aa737a', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:08', '23', 'EXECUTED', '7:46f980483702de13803eab47fc2ffc3c', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-file-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:08', '24', 'EXECUTED', '7:b1d5663b8aa9b271e371a7c2fcf7aef1', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-transaction-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:09', '25', 'EXECUTED', '7:28fade45dde29bf2a80128e871124688', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:09', '26', 'EXECUTED', '7:e9ccb45886267a5da402f7e92ab4b476', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-account-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:09', '27', 'EXECUTED', '7:3ba98793f5db4d49a8b2cb55836f7919', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-config-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:09', '28', 'EXECUTED', '7:fa9bfea2333faaeefc3f8d13b9ea9f71', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:10', '29', 'EXECUTED', '7:e53e13fbb356e1d9a647500afe42361c', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-receiver-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:10', '30', 'EXECUTED', '7:f52225b1bc4c996d9dda6413a3fe0ecb', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-template-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:10', '31', 'EXECUTED', '7:d6b98f815085858bf2b076af486e3a3d', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-preferences-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:10', '32', 'EXECUTED', '7:d572052045ca081c9f1d3697c7c88837', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-account-retrieve-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:10', '33', 'EXECUTED', '7:873ccf0292f0d2c6e5ce7aa1f39df29e', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160922-sys-config-1', 'xuhailin', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:11', '34', 'EXECUTED', '7:23e33d3f3a1946321355d9b49abd0ac1', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160923-sys-config-1', 'xuhailin', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:11', '35', 'EXECUTED', '7:23e33d3f3a1946321355d9b49abd0ac1', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.engine-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:15', '36', 'EXECUTED', '7:db6e32a91292af7bd67a1b554392e055', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.history-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:17', '37', 'EXECUTED', '7:5eb0e316ceac016258fe1a8796c5a04b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.identity-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2016-09-29 15:59:19', '38', 'EXECUTED', '7:d9ba093bbd73a17a565e45a0a3b1b1dc', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee', 'niujiaqing', '2016-09-26-init-migration.groovy', '2016-09-29 15:59:19', '39', 'EXECUTED', '7:b0ce957083bcf8a648bb376a8cb14326', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-unit', 'niujiaqing', '2016-09-26-init-migration.groovy', '2016-09-29 15:59:19', '40', 'EXECUTED', '7:2c34861ed5123f0b00b5fb518c1544af', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-position', 'niujiaqing', '2016-09-26-init-migration.groovy', '2016-09-29 15:59:19', '41', 'EXECUTED', '7:379d82a9e07debb84cbd639cb265117c', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee-assign', 'niujiaqing', '2016-09-26-init-migration.groovy', '2016-09-29 15:59:20', '42', 'EXECUTED', '7:9ffe6dd1dd456e4b90570d3e00a86870', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160927-jessen-alter-column', 'jessen', '2016-09-26-init-migration.groovy', '2016-09-29 15:59:20', '43', 'EXECUTED', '7:25b5206237b820e395446b3aacb9e996', 'renameColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-hailor-1', 'jessen', 'hreport/core/db/2016-06-01-init-migration.groovy', '2016-09-29 15:59:20', '44', 'EXECUTED', '7:b76485f0d91a62fbe3d587195bef479f', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-1', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '45', 'EXECUTED', '7:3a0c488487c90d005ec4fea70a765f79', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-2', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '46', 'EXECUTED', '7:899b2ac196b085c7b617ac664f5b54cb', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-3', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '47', 'EXECUTED', '7:a720aa38a6b3010dfa3d1435c95178c9', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-4', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '48', 'EXECUTED', '7:8cb7c2aa2c26788382d88d149c3bd8c6', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-6', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '49', 'EXECUTED', '7:6009b4db01b196edca243fd0e18c5df6', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-7', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '50', 'EXECUTED', '7:bc535f0c561b98804f2d624b0bdf5c7f', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-8', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '51', 'EXECUTED', '7:0fe8ed7d34cf3587b7ba32276d8ad4b6', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-9', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '52', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-10', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '53', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-11', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:20', '54', 'EXECUTED', '7:c0c17b5bfadb02da27e333a5f22f58d4', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-12', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '55', 'EXECUTED', '7:3e5183dfcfedbca2ea5a35fdea80fcc9', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-13', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '56', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-14', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '57', 'EXECUTED', '7:38c512036289ecc9ba4f8eb228543605', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-15', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '58', 'EXECUTED', '7:e28356e12129c5cf9d7b7d4a75525617', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-16', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '59', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-17', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '60', 'EXECUTED', '7:5141826ee31a6bbe801bc941eb879bae', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-data-18', 'hailor', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '61', 'EXECUTED', '7:ba4c7ddf43520c73bfc7c61f84f181f0', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-attach-category-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '62', 'EXECUTED', '7:d7254fb792a2581c0c921cda8b90698b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-config-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '63', 'EXECUTED', '7:c39e780093128f2d0aafed24b3109466', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-account-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '64', 'EXECUTED', '7:763810fcf72218794f8e4258011bef88', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '65', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-template-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '66', 'EXECUTED', '7:45cef023d3167bf5abed8b84d0c6ee8e', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-preferences-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2016-09-29 15:59:21', '67', 'EXECUTED', '7:a50b8140815dc4bbadaf40c7f8cfc98b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160910-jessen-1', 'jessen', 'patch.groovy', '2016-09-29 15:59:21', '68', 'EXECUTED', '7:b520983eac4e053d3de6ee8f16db61b9', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160921-jessen-1', 'jessen', 'patch.groovy', '2016-09-29 15:59:21', '69', 'EXECUTED', '7:8266719366ff637e4bfbba47b6ff9b8b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160921-jialongzuo-1', 'jialongzuo', 'patch.groovy', '2016-09-29 15:59:21', '70', 'EXECUTED', '7:58d927f8a97620492ed832304161c001', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160922-xuhailin-1', 'xuhailin', 'patch.groovy', '2016-09-29 15:59:21', '71', 'EXECUTED', '7:6839786469b4c2c53bca2382f3f8f5b5', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160923-xuhailin-1', 'xuhailin', 'patch.groovy', '2016-09-29 15:59:21', '72', 'EXECUTED', '7:d5f86daffb2dbb5d07499f694734c80c', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160923-niujiaqing-1', 'niujiaqing', 'patch.groovy', '2016-09-29 15:59:22', '73', 'EXECUTED', '7:740caf6508daa5d514e919da45dc9c58', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160923-niujiaqing-2', 'niujiaqing', 'patch.groovy', '2016-09-29 15:59:22', '74', 'EXECUTED', '7:4a7e8843ec73f3b4b410552225647ef7', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160927-xuhailin-1', 'xuhailin', 'patch.groovy', '2016-09-29 15:59:22', '75', 'EXECUTED', '7:a2ddba38ccd4bc4c10d1a77105b53937', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-yourname-1', 'yourname', 'hreport/core/db/2016-06-01-init-data.groovy', '2016-09-29 15:59:22', '76', 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', null, '3.4.2', null, null);

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for hap_demo
-- ----------------------------
DROP TABLE IF EXISTS `hap_demo`;
CREATE TABLE `hap_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_demo
-- ----------------------------

-- ----------------------------
-- Table structure for hr_employee
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE `hr_employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_CODE` varchar(30) NOT NULL COMMENT '员工编码',
  `NAME` varchar(50) NOT NULL COMMENT '员工姓名',
  `BORN_DATE` date DEFAULT NULL COMMENT '出生日期',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `MOBIL` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `JOIN_DATE` date DEFAULT NULL COMMENT '入职日期',
  `GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `CERTIFICATE_ID` varchar(100) DEFAULT NULL COMMENT '证件号',
  `STATUS` varchar(50) NOT NULL COMMENT '状态',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `HR_EMPLOYEE_U1` (`EMPLOYEE_CODE`),
  UNIQUE KEY `HR_EMPLOYEE_U2` (`CERTIFICATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee
-- ----------------------------

-- ----------------------------
-- Table structure for hr_employee_assign
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_assign`;
CREATE TABLE `hr_employee_assign` (
  `ASSIGN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `POSITION_ID` bigint(20) NOT NULL COMMENT '岗位ID',
  `PRIMARY_POSITION_FLAG` varchar(1) DEFAULT NULL COMMENT '主岗位标示',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`ASSIGN_ID`),
  UNIQUE KEY `HR_EMPLOYEE_ASSIGN_U1` (`EMPLOYEE_ID`,`POSITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee_assign
-- ----------------------------

-- ----------------------------
-- Table structure for hr_org_position_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_b`;
CREATE TABLE `hr_org_position_b` (
  `POSITION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UNIT_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `POSITION_CODE` varchar(50) DEFAULT NULL COMMENT '岗位编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `PARENT_POSITION_ID` bigint(20) DEFAULT NULL COMMENT '父岗位ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_b
-- ----------------------------

-- ----------------------------
-- Table structure for hr_org_position_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_tl`;
CREATE TABLE `hr_org_position_tl` (
  `POSITION_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_tl
-- ----------------------------

-- ----------------------------
-- Table structure for hr_org_unit_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_b`;
CREATE TABLE `hr_org_unit_b` (
  `UNIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) NOT NULL COMMENT '父组织',
  `UNIT_CODE` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `MANAGER_POSITION` bigint(20) DEFAULT NULL COMMENT '组织管理岗位',
  `COMPANY_ID` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_b
-- ----------------------------

-- ----------------------------
-- Table structure for hr_org_unit_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_tl`;
CREATE TABLE `hr_org_unit_tl` (
  `UNIT_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_tl
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'Lenovo-PCa1475201282201', '1475202966444', '20000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_datasource
-- ----------------------------
INSERT INTO `rep_datasource` VALUES ('14', '数据源01', 'jdbc:mysql://localhost/hap_dev?useUnicode=true&characterEncoding=GB2312', 'root', '68d7f376ef5b78bc', '1', '-1', '-1', '3', '2016-09-29 19:31:02', '3', '2016-09-29 19:31:02', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_flex_vset_b
-- ----------------------------

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
-- Records of rep_flex_vset_tl
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_query_params_b
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_query_params_tl
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_report_header_b
-- ----------------------------

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
-- Records of rep_report_header_tl
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_report_line_b
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_report_line_tl
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rep_validate_table_b
-- ----------------------------

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
-- Records of rep_validate_table_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_account_retrieve
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_retrieve`;
CREATE TABLE `sys_account_retrieve` (
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '其他表做外键',
  `RETRIEVE_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIEVE_DATE` datetime DEFAULT NULL COMMENT '时间',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='找回帐号密码历史表';

-- ----------------------------
-- Records of sys_account_retrieve
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SOURCE_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SOURCE_KEY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '失效时间',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_ATTACHMENT_N1` (`CATEGORY_ID`),
  KEY `SYS_ATTACHMENT_N2` (`SOURCE_TYPE`,`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attach_category_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_b`;
CREATE TABLE `sys_attach_category_b` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LEAF_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL COMMENT '层级路径',
  `SOURCE_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ALLOWED_FILE_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ALLOWED_FILE_SIZE` decimal(20,0) DEFAULT NULL,
  `IS_UNIQUE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `CREATED_BY` decimal(20,0) DEFAULT NULL,
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach_category_b
-- ----------------------------
INSERT INTO `sys_attach_category_b` VALUES ('1', '目录1', '0', '目录1', '1', '-1', '1', 'FOLDER', null, null, 'Y', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('2', '目录2', '0', '目录2', '1', '1', '1.2', 'FOLDER', null, null, 'N', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('3', '目录3', '0', '叶节点1', '1', '2', '1.2.3', 'IMG', null, null, 'Y', '/Users/jessen/Pictures/hap/img', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('4', 'Leaf 1.1', '1', 'Leaf 1.1', '1', '3', '1.2.3.4', 'IMG2', '.jpg;.jpeg;.png', null, 'N', '/Users/jessen/Pictures/hap/img', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_attach_category_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_tl`;
CREATE TABLE `sys_attach_category_tl` (
  `CATEGORY_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '表ID，主键，供其他表做外键',
  `CATEGORY_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件分类多语言';

-- ----------------------------
-- Records of sys_attach_category_tl
-- ----------------------------
INSERT INTO `sys_attach_category_tl` VALUES ('1', 'Category1', 'Category1', 'en_GB', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('1', '目录1', '目录1', 'zh_CN', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', 'Category2', 'Category2', 'en_GB', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', '目录2', '目录2', 'zh_CN', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', 'Category3', 'Left1', 'en_GB', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', '目录3', '叶节点1', 'zh_CN', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'Leaf1.1', 'Leaf 1.1', 'en_GB', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'Leaf 1.1', 'Leaf 1.1', 'zh_CN', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_b`;
CREATE TABLE `sys_code_b` (
  `CODE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `SYS_CODE_B_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='快码类型表';

-- ----------------------------
-- Records of sys_code_b
-- ----------------------------
INSERT INTO `sys_code_b` VALUES ('106', 'SYS.RESOURCE_TYPE', '资源类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('121', 'SYS.LOV_EDITOR_TYPE', 'LOV 编辑器类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('122', 'SYS.YES_NO', '是否 YN', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('123', 'SYS.ALIGN_TYPE', '对齐方式', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('124', 'SYS.PROFILE_LEVEL_ID', '配置文件级别', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('125', 'SYS.PRIORITY_LEVEL', '模板优先级', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('126', 'SYS.TIME_ZONE', '时区', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('130', 'SYS.CAPTCHA_POLICY', '验证码策略', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_tl`;
CREATE TABLE `sys_code_tl` (
  `CODE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '表ID，主键，供其他表做外键',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快码类型表(多语言)';

-- ----------------------------
-- Records of sys_code_tl
-- ----------------------------
INSERT INTO `sys_code_tl` VALUES ('106', 'en_GB', '资源类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('106', 'zh_CN', '资源类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('121', 'en_GB', 'LOV 编辑器类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('121', 'zh_CN', 'LOV 编辑器类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('122', 'en_GB', '是否 YN', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('122', 'zh_CN', '是否 YN', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('123', 'en_GB', 'Align Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('123', 'zh_CN', '对齐方式', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('124', 'en_GB', 'Profile Level', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('124', 'zh_CN', '配置文件级别', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('125', 'en_GB', 'Template Priority', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('125', 'zh_CN', '模板优先级', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('126', 'en_GB', 'Time Zone', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('126', 'zh_CN', '时区', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('130', 'en_GB', 'Captcha Policy', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('130', 'zh_CN', '验证码策略', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_value_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_b`;
CREATE TABLE `sys_code_value_b` (
  `CODE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `CODE_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MEANING` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_VALUE_ID`),
  UNIQUE KEY `SYS_CODE_VALUE_B_U1` (`CODE_ID`,`VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='快码值表';

-- ----------------------------
-- Records of sys_code_value_b
-- ----------------------------
INSERT INTO `sys_code_value_b` VALUES ('107', '106', 'HTML', 'HTML页面', 'HTML页面', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('108', '106', 'SERVICE', 'URL服务', 'URL服务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('121', '121', 'INT', '数字框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('122', '121', 'POPUP', '值列表', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('123', '121', 'SELECT', '下拉框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('124', '121', 'TEXT', '文本框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('125', '122', 'Y', '是', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('126', '122', 'N', '否', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('127', '123', 'CENTER', '居中', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('128', '123', 'LEFT', '左对齐', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('129', '123', 'RIGHT', '右对齐', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('130', '124', '10', '全局', '', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('131', '124', '20', '角色', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('132', '124', '30', '用户', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('133', '125', 'NORMAL', '普通', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('134', '125', 'VIP', 'VIP', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('135', '126', 'GMT+0800', '(GMT+8)北京时间', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('136', '126', 'GMT-0800', '(GMT-8)旧金山', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('137', '126', 'GMT-0500', '(GMT-5)纽约', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('141', '130', 'DISABLE', '禁用', null, '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('142', '130', 'AFTER3', '3次后启用', null, '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_b` VALUES ('143', '130', 'ENABLE', '启用', null, '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_value_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_tl`;
CREATE TABLE `sys_code_value_tl` (
  `CODE_VALUE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '表ID，主键，供其他表做外键',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `MEANING` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_VALUE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快码值表(多语言)';

-- ----------------------------
-- Records of sys_code_value_tl
-- ----------------------------
INSERT INTO `sys_code_value_tl` VALUES ('107', 'en_GB', 'HTML页面', 'HTML页面', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('107', 'zh_CN', 'HTML页面', 'HTML页面', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('108', 'en_GB', 'URL服务', 'URL服务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('108', 'zh_CN', 'URL服务', 'URL服务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('121', 'en_GB', 'Number', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('121', 'zh_CN', '数字框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('122', 'en_GB', 'Popup', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('122', 'zh_CN', '值列表', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('123', 'en_GB', 'Select', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('123', 'zh_CN', '下拉框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('124', 'en_GB', 'Text', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('124', 'zh_CN', '文本框', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('125', 'en_GB', 'Yes', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('125', 'zh_CN', '是', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('126', 'en_GB', 'No', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('126', 'zh_CN', '否', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('127', 'en_GB', 'Center', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('127', 'zh_CN', '居中', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('128', 'en_GB', 'Left', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('128', 'zh_CN', '左对齐', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('129', 'en_GB', 'Right', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('129', 'zh_CN', '右对齐', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('130', 'en_GB', 'Global', '', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('130', 'zh_CN', '全局', '', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('131', 'en_GB', 'Role', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('131', 'zh_CN', '角色', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('132', 'en_GB', 'User', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('132', 'zh_CN', '用户', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('133', 'en_GB', 'Normal', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('133', 'zh_CN', '普通', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('134', 'en_GB', 'VIP', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('134', 'zh_CN', 'VIP', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('135', 'en_GB', '(GMT+8)Beijing', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('135', 'zh_CN', '(GMT+8)北京时间', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('136', 'en_GB', '(GMT-8)San Francisco', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('136', 'zh_CN', '(GMT-8)旧金山', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('137', 'en_GB', '(GMT-5)New York', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('137', 'zh_CN', '(GMT-5)纽约', null, '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('141', 'en_GB', 'disable captcha', 'Disable captcha', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('141', 'zh_CN', '禁用验证码', '禁用验证码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('142', 'en_GB', 'after3 enable captcha', 'Login failed three times to enable verification code', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('142', 'zh_CN', '3次后启用验证码', '登录失败3次启用验证码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('143', 'en_GB', 'enable captcha', 'enable captcha', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('143', 'zh_CN', '启用验证码', '启用验证码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `CONFIG_CODE` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIG_VALUE` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT '-1',
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `ATTACHMENT_ID` bigint(20) DEFAULT NULL COMMENT '附件ID',
  `FILE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FILE_PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FILE_SIZE` decimal(20,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `UPLOAD_DATE` datetime DEFAULT NULL COMMENT '上传时间',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `SYS_FILE_N1` (`ATTACHMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_function_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_b`;
CREATE TABLE `sys_function_b` (
  `FUNCTION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `MODULE_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能入口',
  `TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '父功能',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '排序号',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`),
  UNIQUE KEY `SYS_FUNCTION_B_U1` (`FUNCTION_CODE`),
  KEY `SYS_FUNCTION_B_N1` (`PARENT_FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8 COMMENT='功能表';

-- ----------------------------
-- Records of sys_function_b
-- ----------------------------
INSERT INTO `sys_function_b` VALUES ('106', 'SYS', 'fa fa-gears', 'SYSTEM', 'System', 'System', null, 'PAGE', null, 'Y', '99', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('107', 'FUNCTION', 'fa fa-plug', 'FUNCTION', 'Function', 'Functions', null, 'PAGE', '106', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('108', 'SYS', 'fa fa-edit', 'PROMPT', '描述维护', '维护描述', '102', 'PAGE', '106', 'Y', '20', '2', '-1', '-1', '2016-09-29 15:59:20', '-1', '3', '2016-09-29 19:59:25', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('109', 'SYS', 'fa fa-code', 'CODE', 'Code', 'Lookup Code', '103', 'PAGE', '106', 'Y', '30', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('110', 'SYS', 'fa fa-search', 'LOV', 'LOV', 'LOV', '104', 'PAGE', '106', 'Y', '40', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('111', 'SYS', 'fa fa-cogs', 'PROFILE', 'Profile', 'Profiles', '105', 'PAGE', '106', 'Y', '50', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('121', 'FUNCTION', 'fa fa-puzzle-piece', 'FUNCTION_ADD', 'Function Define', 'Function Define', '101', 'PAGE', '107', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('141', 'JOB', 'fa fa-clock-o', 'JOB', 'Task', 'Job', null, 'PAGE', null, 'Y', '40', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('142', 'JOB', 'fa fa-tasks', 'JOB_DETAIL', 'Task Detail', 'Job Detail', '127', 'PAGE', '141', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('143', 'FUNCTION', 'fa fa-share-alt-square', 'SYS_RESOURCE', 'Resource', 'Resources', '121', 'PAGE', '107', 'Y', '20', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('144', 'FUNCTION', 'fa fa-list', 'FUNCTION_ASSIGN', 'Function Assign', 'Function', '122', 'PAGE', '107', 'Y', '90', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('145', 'ACCOUNT', 'fa fa-user', 'ACCOUNT', 'Account', 'Account', null, 'PAGE', '106', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('146', 'ACCOUNT', 'fa fa-user-plus', 'ACCOUNT_USER', 'User', 'Users', '123', 'PAGE', '145', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('147', 'ACCOUNT', 'fa fa-users', 'ACCOUNT_ROLE', 'Role', 'Roles', '125', 'PAGE', '145', 'Y', '20', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('149', 'JOB', 'fa fa-list-ul', 'JOB_RUNNING_INFO', 'Execution Log', 'Execution Log', '128', 'PAGE', '141', 'Y', '20', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('161', 'SYS', 'fa fa-flag', 'LANGUAGE', 'Languages', 'Language', '142', 'PAGE', '106', 'Y', '50', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('162', 'EMAIL', 'fa fa-envelope', 'EMAIL', '邮件', '邮件', null, 'PAGE', '106', 'Y', '80', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('163', 'EMAIL', 'fa fa-envelope', 'EMAIL_ACCOUNT', '邮件账户', '邮件账户', '143', 'PAGE', '162', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('164', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEMPLATE', '邮件模板', '邮件模板', '144', 'PAGE', '162', 'Y', '20', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('165', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEST', 'Email Test', 'Email Test', '145', 'PAGE', '162', 'Y', '30', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('166', 'ATTACH', 'fa fa-cloud-upload', 'ATTACH', '附件管理', '附件管理', null, 'PAGE', null, 'Y', '30', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('167', 'ATTACH', 'fa fa-folder-open', 'ATTACH_CATEGORY', '目录管理', '目录管理', '146', 'PAGE', '166', 'Y', '10', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('168', 'ATTACH', 'fa fa-file', 'ATTACH_FILE', '文件管理', '文件管理', '148', 'PAGE', '166', 'Y', '20', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('169', 'ATTACH', 'fa fa-file', 'ATTACH_TEST', '上传测试', '上传测试', '149', 'PAGE', '166', 'Y', '30', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10001', 'REPORT', 'fa fa-edit', 'DATASOURCE', '数据源', '数据源', '10001', 'PAGE', '10003', null, '10', '4', '-1', '-1', '2016-09-29 19:29:47', '3', '3', '2016-09-29 20:04:57', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10002', 'REPORT', 'fa fa-cogs', 'REPORT', '报表', '报表', null, 'PAGE', null, null, '10', '2', '-1', '-1', '2016-09-29 19:56:35', '3', '3', '2016-09-29 19:59:25', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10003', 'REPORT', 'fa fa-gears', 'REPORT_SET', '报表设置', '报表设置', null, 'PAGE', '10002', null, '10', '1', '-1', '-1', '2016-09-29 19:59:26', '3', '3', '2016-09-29 19:59:26', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10004', 'REPORT', 'fa fa-gears', 'REPORT_LIST', '报表列表', '报表列表', null, 'PAGE', '10002', null, '10', '1', '-1', '-1', '2016-09-29 20:00:39', '3', '3', '2016-09-29 20:00:39', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10005', 'REPORT', 'fa fa-edit', 'REPORT_LOV', '报表LOV', '报表LOV', '10003', 'PAGE', '10003', null, '10', '1', '-1', '-1', '2016-09-29 20:03:53', '3', '3', '2016-09-29 20:03:53', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10006', 'REPORT', 'fa fa-edit', 'REPORT_INFORMATION', '报表信息', '报表信息', '10002', 'PAGE', '10003', null, '10', '1', '-1', '-1', '2016-09-29 20:04:58', '3', '3', '2016-09-29 20:04:58', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_resource`;
CREATE TABLE `sys_function_resource` (
  `FUNC_SRC_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '外键，功能 ID',
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '外键，资源 ID',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNC_SRC_ID`),
  UNIQUE KEY `SYS_FUNCTION_RESOURCE_U1` (`FUNCTION_ID`,`RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COMMENT='功能资源关联表';

-- ----------------------------
-- Records of sys_function_resource
-- ----------------------------
INSERT INTO `sys_function_resource` VALUES ('17', '146', '123', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('18', '146', '126', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('19', '146', '166', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('20', '146', '175', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('21', '146', '176', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('22', '146', '177', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('23', '146', '185', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('24', '146', '186', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('25', '167', '146', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('26', '167', '147', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('27', '167', '256', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('28', '167', '257', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('29', '167', '258', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('37', '169', '149', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('38', '169', '261', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('39', '109', '103', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('40', '109', '157', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('41', '109', '205', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('42', '109', '206', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('43', '109', '207', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('44', '109', '208', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('45', '109', '209', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('57', '163', '143', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('58', '163', '243', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('59', '163', '244', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('60', '163', '245', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('61', '163', '246', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('62', '163', '247', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('63', '163', '248', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('64', '163', '249', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('65', '163', '250', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('66', '163', '251', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('67', '163', '269', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('70', '164', '144', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('71', '164', '271', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('72', '164', '252', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('73', '164', '253', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('74', '164', '254', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('75', '164', '255', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('77', '165', '145', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('78', '165', '272', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('87', '121', '101', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('88', '121', '158', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('89', '121', '159', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('90', '121', '187', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('91', '121', '188', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('92', '121', '190', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('93', '121', '191', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('94', '121', '192', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('95', '121', '193', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('105', '144', '200', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('106', '144', '201', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('107', '144', '202', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('108', '144', '203', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('109', '144', '122', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('110', '144', '165', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('136', '149', '128', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('137', '149', '242', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('138', '161', '142', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('139', '161', '210', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('140', '161', '211', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('141', '161', '212', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('142', '110', '104', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('143', '110', '160', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('144', '110', '161', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('145', '110', '213', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('146', '110', '214', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('147', '110', '215', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('148', '110', '216', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('149', '110', '217', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('150', '110', '218', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('151', '111', '105', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('152', '111', '163', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('153', '111', '222', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('154', '111', '223', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('155', '111', '224', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('156', '111', '225', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('157', '111', '226', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('158', '111', '227', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('159', '108', '102', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('160', '108', '219', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('161', '108', '220', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('162', '108', '221', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('171', '143', '121', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('172', '143', '164', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('173', '143', '165', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('174', '143', '194', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('175', '143', '195', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('176', '143', '196', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('177', '143', '197', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('178', '143', '198', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('179', '143', '199', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('186', '147', '122', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('187', '147', '125', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('188', '147', '165', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('189', '147', '171', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('190', '147', '173', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('191', '147', '174', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('192', '147', '172', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('193', '142', '127', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('194', '142', '230', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('195', '142', '231', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('196', '142', '232', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('197', '142', '233', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('198', '142', '234', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('199', '142', '273', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('200', '142', '274', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('201', '142', '276', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('202', '142', '235', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('208', '168', '148', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('209', '168', '262', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('210', '168', '263', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('211', '168', '264', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('212', '168', '265', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('213', '168', '259', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_tl`;
CREATE TABLE `sys_function_tl` (
  `FUNCTION_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '功能ID',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `FUNCTION_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FUNCTION_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能表（多语言）';

-- ----------------------------
-- Records of sys_function_tl
-- ----------------------------
INSERT INTO `sys_function_tl` VALUES ('106', 'en_GB', 'System', 'System', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('106', 'zh_CN', '系统管理', '系统管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('107', 'en_GB', 'Function', 'Functions', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('107', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('108', 'en_GB', 'Prompt', 'Prompts', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('108', 'zh_CN', '描述维护', '维护描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('109', 'en_GB', 'Code', 'Lookup Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('109', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('110', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('110', 'zh_CN', 'LOV定义', 'LOV定义', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('111', 'en_GB', 'Profile', 'Profiles', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('111', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('121', 'en_GB', 'Function Definition', 'Function Define', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('121', 'zh_CN', '功能维护', '功能定义', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('141', 'en_GB', 'Task', 'Job', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('141', 'zh_CN', '计划任务', '计划任务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('142', 'en_GB', 'Task Detail', 'Job Detail', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('142', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('143', 'en_GB', 'Resource', 'Resources', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('143', 'zh_CN', '资源管理', '资源管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('144', 'en_GB', 'Function Assign', 'Function', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('144', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('145', 'en_GB', 'Account', 'Account', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('145', 'zh_CN', '账户管理', '账户管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('146', 'en_GB', 'User', 'Users', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('146', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('147', 'en_GB', 'Role', 'Roles', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('147', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('149', 'en_GB', 'Execution Log', 'Execution Log', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('149', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('161', 'en_GB', 'Languages', 'Language', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('161', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('162', 'en_GB', 'Email', 'Email', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('162', 'zh_CN', '邮件', '邮件', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('163', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('163', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('164', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('164', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('165', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('165', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('166', 'en_GB', 'Attachment', 'Attachment', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('166', 'zh_CN', '附件管理', '附件管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('167', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('167', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('168', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('168', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('169', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('169', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:29:46', '3', '3', '2016-09-29 19:29:46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:29:47', '3', '3', '2016-09-29 19:29:47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', 'en_GB', 'datasource', 'datasource', '1', '-1', '-1', '2016-09-29 19:29:47', '3', '3', '2016-09-29 19:29:47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', 'zh_CN', '数据源', '数据源', '1', '-1', '-1', '2016-09-29 19:29:47', '3', '3', '2016-09-29 20:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:56:34', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:56:34', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'en_GB', 'report', 'report', '1', '-1', '-1', '2016-09-29 19:56:34', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'zh_CN', '报表', '报表', '1', '-1', '-1', '2016-09-29 19:56:34', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:59:25', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:59:25', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'en_GB', 'REPORT_SET', 'REPORT_SET', '1', '-1', '-1', '2016-09-29 19:59:25', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'zh_CN', '报表设置', '报表设置', '1', '-1', '-1', '2016-09-29 19:59:25', '3', '3', '2016-09-29 19:59:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', '111', '111', '111', '1', '-1', '-1', '2016-09-29 20:00:38', '3', '3', '2016-09-29 20:00:38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', '222', '222', '222', '1', '-1', '-1', '2016-09-29 20:00:38', '3', '3', '2016-09-29 20:00:38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'en_GB', 'REPORT_LIST', 'REPORT_LIST', '1', '-1', '-1', '2016-09-29 20:00:38', '3', '3', '2016-09-29 20:00:38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'zh_CN', '报表列表', '报表列表', '1', '-1', '-1', '2016-09-29 20:00:38', '3', '3', '2016-09-29 20:00:38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', '111', '111', '111', '1', '-1', '-1', '2016-09-29 20:03:53', '3', '3', '2016-09-29 20:03:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', '222', '222', '222', '1', '-1', '-1', '2016-09-29 20:03:53', '3', '3', '2016-09-29 20:03:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'en_GB', 'REPORT_LOV', 'REPORT_LOV', '1', '-1', '-1', '2016-09-29 20:03:53', '3', '3', '2016-09-29 20:03:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'zh_CN', '报表LOV', '报表LOV', '1', '-1', '-1', '2016-09-29 20:03:53', '3', '3', '2016-09-29 20:03:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', '111', '111', '111', '1', '-1', '-1', '2016-09-29 20:04:57', '3', '3', '2016-09-29 20:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', '222', '222', '222', '1', '-1', '-1', '2016-09-29 20:04:57', '3', '3', '2016-09-29 20:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'en_GB', 'REPORT_INFORMATION', 'REPORT_INFORMATION', '1', '-1', '-1', '2016-09-29 20:04:57', '3', '3', '2016-09-29 20:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'zh_CN', '报表信息', '报表信息', '1', '-1', '-1', '2016-09-29 20:04:57', '3', '3', '2016-09-29 20:04:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_job_running_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_running_info`;
CREATE TABLE `sys_job_running_info` (
  `JOB_RUNNING_INFO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_RESULT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_GROUP` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`JOB_RUNNING_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job_running_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_lang_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_lang_b`;
CREATE TABLE `sys_lang_b` (
  `LANG_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `BASE_LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语言表';

-- ----------------------------
-- Records of sys_lang_b
-- ----------------------------
INSERT INTO `sys_lang_b` VALUES ('en_GB', 'zh_CN', 'English', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lang_b` VALUES ('zh_CN', 'zh_CN', '简体中文', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_lov
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov`;
CREATE TABLE `sys_lov` (
  `LOV_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键',
  `CODE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SQL_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VALUE_FIELD` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT_FIELD` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `WIDTH` decimal(20,0) DEFAULT NULL COMMENT '宽度',
  `HEIGHT` decimal(20,0) DEFAULT NULL COMMENT '高度',
  `PLACEHOLDER` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELAY_LOAD` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NEED_QUERY_PARAM` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CAN_POPUP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LOV_ID`),
  UNIQUE KEY `SYS_LOV_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='通用lov配置';

-- ----------------------------
-- Records of sys_lov
-- ----------------------------
INSERT INTO `sys_lov` VALUES ('103', 'user_lov', '查询用户', 'UserMapper.select', 'userId', 'userName', '查询用户', '400', '400', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('104', 'ATTACH_SOURCE_TYPE', '附件来源类型选择', 'AttachCategoryMapper.selectAllLeafCategory', 'sourceType', 'sourceType', 'attachcategory.sourcetype', '450', '200', 'attachcategory.sourcetype', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('105', 'LOV_PARENTFUNCTION', null, 'FunctionMapper.select', 'functionId', 'functionName', null, '550', '350', 'function.parentFunctionId', 'N', 'N', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('106', 'LOV_ROLE', '选择角色', 'RoleMapper.select', 'roleId', 'roleName', null, '450', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('107', 'LOV_RESOURCE', '选择资源', 'ResourceMapper.select', 'resourceId', 'name', null, '500', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('108', 'LOV_PARENTPOSITION', '上级岗位', 'PositionMapper.selectParentPositionName', 'positionId', 'name', '选择', '500', '400', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov` VALUES ('109', 'LOV_UNIT', '部门', 'OrgUnitMapper.select', 'unitId', 'name', '选择', '500', '400', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_lov_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov_item`;
CREATE TABLE `sys_lov_item` (
  `LOV_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `LOV_ID` bigint(20) DEFAULT NULL COMMENT '头表ID',
  `DISPLAY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_AUTOCOMPLETE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '查询字段宽度',
  `CONDITION_FIELD_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_NEWLINE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_SELECT_CODE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_LOV_CODE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_SEQUENCE` decimal(20,0) DEFAULT NULL COMMENT '查询字段排序号',
  `CONDITION_FIELD_SELECT_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_SELECT_VF` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_SELECT_TF` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONDITION_FIELD_TEXTFIELD` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AUTOCOMPLETE_FIELD` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GRID_FIELD` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GRID_FIELD_NAME` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `GRID_FIELD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '表格列排序号',
  `GRID_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '表格列宽',
  `GRID_FIELD_ALIGN` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LOV_ITEM_ID`),
  KEY `SYS_LOV_ITEM_N1` (`LOV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov_item
-- ----------------------------
INSERT INTO `sys_lov_item` VALUES ('102', '103', 'userName', 'Y', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'userName', '10', '100', 'center', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('103', '104', 'attachcategory.categoryname', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryName', '10', '100', 'left', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('104', '104', 'attachcategory.categorypath', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryPath', '30', '200', 'left', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('105', '104', 'attachcategory.sourcetype', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'sourceType', '20', '80', 'center', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('106', '105', 'function.functionCode', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionCode', '1', '100', 'left', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('107', '105', 'function.functionName', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionName', '1', '120', 'center', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('108', '106', 'role.roleName', 'N', 'Y', null, '', '', 'N', '', '', '2', '', '', '', '', 'Y', 'Y', 'roleName', '2', '120', 'center', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('109', '106', 'role.roleDescription', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'roleDescription', '3', '200', 'center', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('110', '106', 'role.roleCode', 'N', 'Y', null, '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'roleCode', '1', '80', 'center', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('111', '107', 'resource.url', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'url', '2', '220', 'center', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('112', '107', 'resource.name', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'name', '1', '160', null, '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('113', '108', 'position.name', 'N', 'Y', null, '', '', 'N', '', '', '2', '', '', '', '', 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('114', '108', 'position.description', 'N', 'Y', null, '', '', 'N', '', '', '3', '', '', '', '', 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('115', '109', 'unit.name', 'N', 'Y', null, '', '', 'N', '', '', '2', '', '', '', '', 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('116', '109', 'unit.description', 'N', 'Y', null, '', '', 'N', '', '', '3', '', '', '', '', 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `MESSAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MESSAGE_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_HOST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUBJECT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONTENT` longtext COMMENT '内容',
  `PRIORITY_LEVEL` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SEND_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_SOURCE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `ATTRIBUTE1` varchar(255) DEFAULT NULL,
  `ATTRIBUTE2` varchar(255) DEFAULT NULL,
  `ATTRIBUTE3` varchar(255) DEFAULT NULL,
  `ATTRIBUTE4` varchar(255) DEFAULT NULL,
  `ATTRIBUTE5` varchar(255) DEFAULT NULL,
  `ATTRIBUTE6` varchar(255) DEFAULT NULL,
  `ATTRIBUTE7` varchar(255) DEFAULT NULL,
  `ATTRIBUTE8` varchar(255) DEFAULT NULL,
  `ATTRIBUTE9` varchar(255) DEFAULT NULL,
  `ATTRIBUTE10` varchar(255) DEFAULT NULL,
  `ATTRIBUTE11` varchar(255) DEFAULT NULL,
  `ATTRIBUTE12` varchar(255) DEFAULT NULL,
  `ATTRIBUTE13` varchar(255) DEFAULT NULL,
  `ATTRIBUTE14` varchar(255) DEFAULT NULL,
  `ATTRIBUTE15` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_N1` (`MESSAGE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_account`;
CREATE TABLE `sys_message_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ACCOUNT_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACCOUNT_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件账号表';

-- ----------------------------
-- Records of sys_message_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_attachment`;
CREATE TABLE `sys_message_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `FILE_ID` bigint(20) DEFAULT NULL COMMENT '附件id',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATED_BY` bigint(20) DEFAULT '-1' COMMENT '被用户创建',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1' COMMENT '最后被用户修改',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改日期',
  `ATTRIBUTE1` varchar(255) DEFAULT NULL COMMENT '属性1',
  `ATTRIBUTE2` varchar(255) DEFAULT NULL COMMENT '属性2',
  `ATTRIBUTE3` varchar(255) DEFAULT NULL COMMENT '属性3',
  `ATTRIBUTE4` varchar(255) DEFAULT NULL COMMENT '属性4',
  `ATTRIBUTE5` varchar(255) DEFAULT NULL COMMENT '属性5',
  `ATTRIBUTE6` varchar(255) DEFAULT NULL COMMENT '属性6',
  `ATTRIBUTE7` varchar(255) DEFAULT NULL COMMENT '属性7',
  `ATTRIBUTE8` varchar(255) DEFAULT NULL COMMENT '属性8',
  `ATTRIBUTE9` varchar(255) DEFAULT NULL COMMENT '属性9',
  `ATTRIBUTE10` varchar(255) DEFAULT NULL COMMENT '属性10',
  `ATTRIBUTE11` varchar(255) DEFAULT NULL COMMENT '属性11',
  `ATTRIBUTE12` varchar(255) DEFAULT NULL COMMENT '属性12',
  `ATTRIBUTE13` varchar(255) DEFAULT NULL COMMENT '属性13',
  `ATTRIBUTE14` varchar(255) DEFAULT NULL COMMENT '属性14',
  `ATTRIBUTE15` varchar(255) DEFAULT NULL COMMENT '属性15',
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N1` (`FILE_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N2` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息附件表';

-- ----------------------------
-- Records of sys_message_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_email_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_account`;
CREATE TABLE `sys_message_email_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIG_ID` bigint(20) DEFAULT NULL,
  `USER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT NULL,
  `REQUEST_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `CREATED_BY` decimal(20,0) DEFAULT NULL,
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_ACCOUNT_U1` (`ACCOUNT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_account
-- ----------------------------
INSERT INTO `sys_message_email_account` VALUES ('1', 'TEST', '5', 'hap_dev@126.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_config`;
CREATE TABLE `sys_message_email_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CONFIG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HOST` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PORT` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TRY_TIMES` decimal(20,0) DEFAULT '3' COMMENT '重试次数',
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USE_WHITE_LIST` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_CONFIG_CODE` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='邮件账号表';

-- ----------------------------
-- Records of sys_message_email_config
-- ----------------------------
INSERT INTO `sys_message_email_config` VALUES ('5', 'TEST126', 'smtp.126.com', '25', '1', 'hap_dev on 126', 'N', 'hap_dev', 'hapdev11', null, '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_white_lt
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_white_lt`;
CREATE TABLE `sys_message_email_white_lt` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADDRESS` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIG_ID` bigint(20) DEFAULT NULL COMMENT '邮箱配置id',
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件账号表';

-- ----------------------------
-- Records of sys_message_email_white_lt
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_receiver`;
CREATE TABLE `sys_message_receiver` (
  `RECEIVER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `MESSAGE_TYPE` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATED_BY` bigint(20) DEFAULT '-1' COMMENT '被用户创建',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1' COMMENT '最后被用户修改',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改日期',
  `ATTRIBUTE1` varchar(255) DEFAULT NULL COMMENT '属性1',
  `ATTRIBUTE2` varchar(255) DEFAULT NULL COMMENT '属性2',
  `ATTRIBUTE3` varchar(255) DEFAULT NULL COMMENT '属性3',
  `ATTRIBUTE4` varchar(255) DEFAULT NULL COMMENT '属性4',
  `ATTRIBUTE5` varchar(255) DEFAULT NULL COMMENT '属性5',
  `ATTRIBUTE6` varchar(255) DEFAULT NULL COMMENT '属性6',
  `ATTRIBUTE7` varchar(255) DEFAULT NULL COMMENT '属性7',
  `ATTRIBUTE8` varchar(255) DEFAULT NULL COMMENT '属性8',
  `ATTRIBUTE9` varchar(255) DEFAULT NULL COMMENT '属性9',
  `ATTRIBUTE10` varchar(255) DEFAULT NULL COMMENT '属性10',
  `ATTRIBUTE11` varchar(255) DEFAULT NULL COMMENT '属性11',
  `ATTRIBUTE12` varchar(255) DEFAULT NULL COMMENT '属性12',
  `ATTRIBUTE13` varchar(255) DEFAULT NULL COMMENT '属性13',
  `ATTRIBUTE14` varchar(255) DEFAULT NULL COMMENT '属性14',
  `ATTRIBUTE15` varchar(255) DEFAULT NULL COMMENT '属性15',
  PRIMARY KEY (`RECEIVER_ID`),
  KEY `SYS_MESSAGE_RECEIVER_N1` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息收件人表';

-- ----------------------------
-- Records of sys_message_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_template`;
CREATE TABLE `sys_message_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SUBJECT` longtext COMMENT '模板标题',
  `CONTENT` longtext COMMENT '模板内容',
  `ACCOUNT_ID` bigint(20) DEFAULT NULL COMMENT '账号id',
  `TEMPLATE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEMPLATE_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_LEVEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TEMPLATE_ID`),
  UNIQUE KEY `SYS_MESSAGE_TEMPLATE_U1` (`TEMPLATE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='消息模板表';

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO `sys_message_template` VALUES ('1', 'THis is a test email', 'test mail send by hap', null, 'TEST', null, 'NORMAL', 'Test Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_transaction
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_transaction`;
CREATE TABLE `sys_message_transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `TRANSACTION_STATUS` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TRANSACTION_MESSAGE` longtext COMMENT '返回信息',
  `MESSAGE_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1' COMMENT 'Record的版本号，每发生update则自增',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATED_BY` bigint(20) DEFAULT '-1' COMMENT '被用户创建',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1' COMMENT '最后被用户修改',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改日期',
  `ATTRIBUTE1` varchar(255) DEFAULT NULL COMMENT '属性1',
  `ATTRIBUTE2` varchar(255) DEFAULT NULL COMMENT '属性2',
  `ATTRIBUTE3` varchar(255) DEFAULT NULL COMMENT '属性3',
  `ATTRIBUTE4` varchar(255) DEFAULT NULL COMMENT '属性4',
  `ATTRIBUTE5` varchar(255) DEFAULT NULL COMMENT '属性5',
  `ATTRIBUTE6` varchar(255) DEFAULT NULL COMMENT '属性6',
  `ATTRIBUTE7` varchar(255) DEFAULT NULL COMMENT '属性7',
  `ATTRIBUTE8` varchar(255) DEFAULT NULL COMMENT '属性8',
  `ATTRIBUTE9` varchar(255) DEFAULT NULL COMMENT '属性9',
  `ATTRIBUTE10` varchar(255) DEFAULT NULL COMMENT '属性10',
  `ATTRIBUTE11` varchar(255) DEFAULT NULL COMMENT '属性11',
  `ATTRIBUTE12` varchar(255) DEFAULT NULL COMMENT '属性12',
  `ATTRIBUTE13` varchar(255) DEFAULT NULL COMMENT '属性13',
  `ATTRIBUTE14` varchar(255) DEFAULT NULL COMMENT '属性14',
  `ATTRIBUTE15` varchar(255) DEFAULT NULL COMMENT '属性15',
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N2` (`TRANSACTION_STATUS`),
  KEY `SYS_MESSAGE_TRANSACTION_N1` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息事务表';

-- ----------------------------
-- Records of sys_message_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for sys_preferences
-- ----------------------------
DROP TABLE IF EXISTS `sys_preferences`;
CREATE TABLE `sys_preferences` (
  `PREFERENCES_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `PREFERENCES` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PREFERENCES_VALUE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '账号ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PREFERENCES_ID`),
  UNIQUE KEY `SYS_PREFERENCES_N1` (`PREFERENCES`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='首选项';

-- ----------------------------
-- Records of sys_preferences
-- ----------------------------
INSERT INTO `sys_preferences` VALUES ('2', 'timeZone', 'GMT+0800', '3', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_profile
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile`;
CREATE TABLE `sys_profile` (
  `PROFILE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `PROFILE_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

-- ----------------------------
-- Records of sys_profile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_profile_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile_value`;
CREATE TABLE `sys_profile_value` (
  `PROFILE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `PROFILE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LEVEL_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LEVEL_VALUE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROFILE_VALUE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件值';

-- ----------------------------
-- Records of sys_profile_value
-- ----------------------------

-- ----------------------------
-- Table structure for sys_prompts
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompts`;
CREATE TABLE `sys_prompts` (
  `PROMPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `PROMPT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROMPT_ID`),
  UNIQUE KEY `SYS_PROMPTS_U1` (`PROMPT_CODE`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=10023 DEFAULT CHARSET=utf8 COMMENT='界面显示文本表';

-- ----------------------------
-- Records of sys_prompts
-- ----------------------------
INSERT INTO `sys_prompts` VALUES ('101', 'hap.main_menu', 'zh_CN', '主菜单', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('102', 'hap.main_menu', 'en_GB', 'Main Menu', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('103', 'hap.home', 'zh_CN', '首页', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('104', 'hap.hone', 'en_GB', 'Home', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('105', 'hap.query', 'zh_CN', '查询', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('106', 'hap.query', 'en_GB', 'Query', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('107', 'hap.cancel', 'zh_CN', '取消', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('108', 'hap.cancel', 'en_GB', 'Cancel', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('109', 'hap.new', 'zh_CN', '新建', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('110', 'hap.new', 'en_GB', 'New', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('111', 'hap.delete', 'zh_CN', '删除', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('112', 'hap.delete', 'en_GB', 'Delete', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('113', 'hap.save', 'zh_CN', '保存', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('114', 'hap.save', 'en_GB', 'Save', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('115', 'hap.reset', 'zh_CN', '重置', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('116', 'hap.reset', 'en_GB', 'Reset', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('117', 'hap.edit', 'zh_CN', '编辑', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('118', 'hap.edit', 'en_GB', 'Edit', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('119', 'hap.prompt', 'zh_CN', '提示', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('120', 'hap.prompt', 'en_GB', 'Prompt', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('121', 'hap.error', 'zh_CN', '错误', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('122', 'hap.error', 'en_GB', 'Error', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('123', 'hap.warning', 'zh_CN', '警告', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('124', 'hap.warning', 'en_GB', 'Warning', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('125', 'hap.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('126', 'hap.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('127', 'hap.validation.notempty', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('128', 'hap.validation.notempty', 'en_GB', '{0} can not be empty!', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('129', 'hap.validation.notnull', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('130', 'hap.validation.notnull', 'en_GB', '{0} can not be null!', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('131', 'hap.validation.email', 'zh_CN', '{0}不是有效的邮件地址。', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('132', 'hap.validation.email', 'en_GB', '{0} is not a email address.', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('133', 'hap.submit', 'zh_CN', '提交', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('134', 'hap.submit', 'en_GB', 'submit', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('135', 'hap.logout', 'zh_CN', '退出', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('136', 'hap.logout', 'en_GB', 'Logout', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('137', 'hap.preferences', 'zh_CN', '首选项', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('138', 'hap.preferences', 'en_GB', 'Preference', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('141', 'hap.ok', 'zh_CN', '确定', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('142', 'hap.ok', 'en_GB', 'OK', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('161', 'lov.placeholder', 'zh_CN', '提示', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('162', 'lov.placeholder', 'en_GB', 'tips', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('163', 'lov.dropdown', 'zh_CN', '自动完成', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('164', 'lov.dropdown', 'en_GB', 'autocomplete', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('165', 'lov.code', 'zh_CN', '代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('166', 'lov.code', 'en_GB', 'Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('167', 'lov.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('168', 'lov.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('169', 'lov.height', 'zh_CN', '高度', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('170', 'lov.height', 'en_GB', 'Height', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('171', 'lov.lovid', 'zh_CN', 'Lov Id', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('172', 'lov.lovid', 'en_GB', 'Lov Id', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('173', 'lov.lovitems', 'zh_CN', 'Lov Items', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('174', 'lov.lovitems', 'en_GB', 'Lov Items', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('175', 'lov.sqlid', 'zh_CN', 'Sql Id', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('176', 'lov.sqlid', 'en_GB', 'Sql Id', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('177', 'lov.textfield', 'zh_CN', 'TextField', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('178', 'lov.textfield', 'en_GB', 'TextField', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('179', 'lov.title', 'zh_CN', '标题', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('180', 'lov.title', 'en_GB', 'Title', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('181', 'lov.valuefield', 'zh_CN', 'ValueField', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('182', 'lov.valuefield', 'en_GB', 'ValueField', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('183', 'lov.width', 'zh_CN', '宽度', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('184', 'lov.width', 'en_GB', 'Width', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('185', 'lovitem.display', 'zh_CN', '显示', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('186', 'lovitem.display', 'en_GB', 'Display', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('187', 'lovitem.name', 'zh_CN', '字段名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('188', 'lovitem.name', 'en_GB', 'Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('189', 'lovitem.gridfieldwidth', 'zh_CN', '列宽度', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('190', 'lovitem.gridfieldwidth', 'en_GB', 'ColumnWidth', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('191', 'lovitem.conditionfield', 'zh_CN', '查询字段', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('192', 'lovitem.conditionfield', 'en_GB', 'Conditions', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('193', 'lovitem.newline', 'zh_CN', '新行', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('194', 'lovitem.newline', 'en_GB', 'Newline', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('195', 'lovitem.type', 'zh_CN', '查询配置', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('196', 'lovitem.type', 'en_GB', 'Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('197', 'lovitem.opts', 'zh_CN', '参数', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('198', 'lovitem.opts', 'en_GB', 'Opts', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('199', 'lovitem.dropdown', 'zh_CN', 'Dropdown', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('200', 'lovitem.dropdown', 'en_GB', 'Dropdown', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('201', 'lovitem.gridcolumn', 'zh_CN', '表格列', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('202', 'lovitem.gridcolumn', 'en_GB', 'GridColumn', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('203', 'lov.delayload', 'zh_CN', '延迟加载', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('204', 'lov.delayload', 'en_GB', 'DelayLoad', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('205', 'lov.needqueryparam', 'zh_CN', '查询条件必输', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('206', 'lov.needqueryparam', 'en_GB', 'NeedQueryParam', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('207', 'lovitem.conditionfieldwidth', 'zh_CN', '查询字段宽度', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('208', 'lovitem.conditionfieldwidth', 'en_GB', 'Width', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('209', 'lovitem.conditionfieldsequence', 'zh_CN', '查询字段序号', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('210', 'lovitem.conditionfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('211', 'lovitem.conditionfieldname', 'zh_CN', '查询字段名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('212', 'lovitem.conditionfieldname', 'en_GB', 'Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('213', 'lovitem.conditionfieldselectcode', 'zh_CN', '快速编码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('214', 'lovitem.conditionfieldselectcode', 'en_GB', 'Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('215', 'lovitem.conditionfieldlovcode', 'zh_CN', '通用lov编码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('216', 'lovitem.conditionfieldlovcode', 'en_GB', 'LovCode', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('217', 'lovitem.gridfieldsequence', 'zh_CN', '列序号', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('218', 'lovitem.gridfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('219', 'lovitem.gridcolumnalign', 'zh_CN', '列对齐方式', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('220', 'lovitem.gridcolumnalign', 'en_GB', 'Column Align', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('221', 'lov.autocompletefield', 'zh_CN', '自动完成显示列', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('222', 'lov.autocompletefield', 'en_GB', 'AutoCompleteColumn', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('223', 'lov.canpopup', 'zh_CN', '弹出选择框', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('224', 'lov.canpopup', 'en_GB', 'popup', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('225', 'lov.editable', 'zh_CN', '可编辑', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('226', 'lov.editable', 'en_GB', 'editable', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('227', 'lovitem.field_type', 'zh_CN', '字段类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('228', 'lovitem.field_type', 'en_GB', 'field type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('229', 'lovitem.ds_type', 'zh_CN', '数据来源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('230', 'lovitem.ds_type', 'en_GB', '数据来源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('231', 'lovitem.ds_type.url', 'zh_CN', 'URL', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('232', 'lovitem.ds_type.url', 'en_GB', 'URL', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('233', 'lovitem.ds_type.code', 'zh_CN', '快速编码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('234', 'lovitem.ds_type.code', 'en_GB', 'Sys Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('235', 'user.username', 'zh_CN', '用户名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('236', 'user.username', 'en_GB', 'User Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('237', 'user.password', 'zh_CN', '密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('238', 'user.password', 'en_GB', 'Password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('239', 'user.email', 'zh_CN', '邮件', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('240', 'user.email', 'en_GB', 'Email', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('241', 'user.phone', 'zh_CN', '电话', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('242', 'user.phone', 'en_GB', 'Phone', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('243', 'role.rolecode', 'zh_CN', '角色代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('244', 'role.rolecode', 'en_GB', 'Role Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('245', 'role.rolename', 'zh_CN', '角色名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('246', 'role.rolename', 'en_GB', 'Role Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('247', 'role.roledescription', 'zh_CN', '角色描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('248', 'role.roledescription', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('249', 'user.allocationrole', 'zh_CN', '角色分配', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('250', 'user.allocationrole', 'en_GB', 'Role Allocate', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('251', 'code.code', 'zh_CN', '代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('252', 'code.code', 'en_GB', 'Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('253', 'code.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('254', 'code.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('255', 'hap.action', 'zh_CN', '操作', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('256', 'hap.action', 'en_GB', 'Operation', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('257', 'codevalue.value', 'zh_CN', '值', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('258', 'codevalue.value', 'en_GB', 'Value', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('259', 'codevalue.meaning', 'zh_CN', '含义', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('260', 'codevalue.meaning', 'en_GB', 'Meaning', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('261', 'codevalue.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('262', 'codevalue.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('263', 'profile.profilename', 'zh_CN', '名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('264', 'profile.profilename', 'en_GB', 'Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('265', 'profile.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('266', 'profile.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('267', 'language.langcode', 'zh_CN', '语言代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('268', 'language.langcode', 'en_GB', 'Lang Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('269', 'language.baselang', 'zh_CN', '基准语言', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('270', 'language.baselang', 'en_GB', 'Base Lang', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('271', 'language.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('272', 'language.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('273', 'jobdetaildto.jobname', 'zh_CN', '任务名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('274', 'jobdetaildto.jobname', 'en_GB', 'Job Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('275', 'jobdetaildto.jobgroup', 'zh_CN', '任务组', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('276', 'jobdetaildto.jobgroup', 'en_GB', 'Job Group', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('277', 'jobdetaildto.jobclassname', 'zh_CN', '任务类名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('278', 'jobdetaildto.jobclassname', 'en_GB', 'Job Class', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('279', 'jobdetaildto.description', 'zh_CN', '任务描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('280', 'jobdetaildto.description', 'en_GB', 'Job Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('281', 'jobrunninginfodto.previousfiretime', 'zh_CN', '上次执行时间', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('282', 'jobrunninginfodto.previousfiretime', 'en_GB', 'Pre Fire Time', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('283', 'jobrunninginfodto.scheduledfiretime', 'zh_CN', '计划执行时间', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('284', 'jobrunninginfodto.scheduledfiretime', 'en_GB', 'Sched Fire Time', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('285', 'jobrunninginfodto.nextfiretime', 'zh_CN', '下次执行时间', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('286', 'jobrunninginfodto.nextfiretime', 'en_GB', 'Next Fire Time', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('287', 'jobrunninginfodto.firetime', 'zh_CN', '实际执行时间', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('288', 'jobrunninginfodto.firetime', 'en_GB', 'Accurate Fire Time', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('289', 'jobrunninginfodto.jobstatus', 'zh_CN', '任务状态', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('290', 'jobrunninginfodto.jobstatus', 'en_GB', 'Job Status', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('291', 'jobrunninginfodto.executionsummary', 'zh_CN', '执行概要', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('292', 'jobrunninginfodto.executionsummary', 'en_GB', 'Execution Summary', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('293', 'hap.pause', 'zh_CN', '暂停', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('294', 'hap.pause', 'en_GB', 'Pause', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('295', 'hap.resume', 'zh_CN', '恢复', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('296', 'hap.resume', 'en_GB', 'Resume', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('297', 'job.newcronjob', 'zh_CN', '新建 CRON 任务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('298', 'job.newcronjob', 'en_GB', 'New Cron Job', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('299', 'job.newsimplejob', 'zh_CN', '新建简单任务', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('300', 'job.newsimplejob', 'en_GB', 'New Simple Job', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('301', 'prompt.promptcode', 'zh_CN', '代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('302', 'prompt.promptcode', 'en_GB', 'Prompt Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('303', 'prompt.sourcelang', 'zh_CN', '语言', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('304', 'prompt.sourcelang', 'en_GB', 'Language', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('305', 'prompt.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('306', 'prompt.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('307', 'function.modulecode', 'zh_CN', '模块代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('308', 'function.modulecode', 'en_GB', 'Module Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('309', 'function.functioncode', 'zh_CN', '功能代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('310', 'funciton.functioncode', 'en_GB', 'Function Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('311', 'function.functionname', 'zh_CN', '功能名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('312', 'function.functionname', 'en_GB', 'Function Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('313', 'function.parentfunctionid', 'zh_CN', '父级功能', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('314', 'function.parentfunctionid', 'en_GB', 'Parent Function', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('315', 'function.functionicon', 'zh_CN', '功能图标', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('316', 'function.functionicon', 'en_GB', 'Function Icon', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('317', 'function.functionsequence', 'zh_CN', '功能序号', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('318', 'function.functionsequence', 'en_GB', 'Function Seq', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('319', 'function.functiondescription', 'zh_CN', '功能描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('320', 'function.functiondescription', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('321', 'function.mainpage', 'zh_CN', '入口页面', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('322', 'function.mainpage', 'en_GB', 'Entry Page', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('323', 'function.functionresource', 'zh_CN', '功能资源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('324', 'function.functionresource', 'en_GB', 'Resources', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('325', 'function.resourceallocation', 'zh_CN', '分配资源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('326', 'function.resourceallocation', 'en_GB', 'Resource Allocation', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('327', 'resource.url', 'zh_CN', 'URL', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('328', 'resource.url', 'en_GB', 'URL', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('329', 'resource.type', 'zh_CN', '类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('330', 'resource.type', 'en_GB', 'Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('331', 'resource.name', 'zh_CN', '名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('332', 'resource.name', 'en_GB', 'Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('333', 'resource.loginrequire', 'zh_CN', '需要登录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('334', 'resource.loginrequire', 'en_GB', 'Login Require', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('335', 'resource.accesscheck', 'zh_CN', '权限控制', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('336', 'resource.accesscheck', 'en_GB', 'Access Check', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('337', 'resource.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('338', 'resource.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('339', 'resource.resourceitem', 'zh_CN', '资源组件', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('340', 'resource.resourceitem', 'en_GB', 'Resource Item', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('341', 'resource.itemallocation', 'zh_CN', '组件定义', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('342', 'resource.itemallocation', 'en_GB', 'Items', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('343', 'resourceitem.itemid', 'zh_CN', '组件标识', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('344', 'resourceitem.itemid', 'en_GB', 'Item ID', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('345', 'resourceitem.itemname', 'zh_CN', '组件名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('346', 'resourceitem.itemname', 'en_GB', 'Item Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('347', 'resourceitem.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('348', 'resourceitem.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('349', 'resourceitem.resource', 'zh_CN', '目标资源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('350', 'resourceitem.resource', 'en_GB', 'Target Resource', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('351', 'hap.expand', 'zh_CN', '展开', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('352', 'hap.expand', 'en_GB', 'Expand', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('353', 'hap.collapse', 'zh_CN', '合并', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('354', 'hap.collapse', 'en_GB', 'Collapse', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('355', 'hap.comment', 'zh_CN', '备注', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('356', 'hap.comment', 'en_GB', 'Comment', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('357', 'messageemailconfig.configcode', 'zh_CN', '配置代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('358', 'messageemailconfig.configcode', 'en_GB', 'Config Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('359', 'messageemailconfig.introduction', 'zh_CN', '简介', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('360', 'messageemailconfig.introduction', 'en_GB', 'Introduction', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('361', 'messageemailconfig.host', 'zh_CN', '发送服务器', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('362', 'messageemailconfig.host', 'en_GB', 'SMTP Host', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('363', 'messageemailconfig.port', 'zh_CN', '端口', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('364', 'messageemailconfig.port', 'en_GB', 'Port', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('365', 'messageemailconfig.trytimes', 'zh_CN', '重试次数', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('366', 'messageemailconfig.trytimes', 'en_GB', 'Try Times', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('367', 'messageemailconfig.usewhitelist', 'zh_CN', '启用白名单', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('368', 'messageemailconfig.usewhitelist', 'en_GB', 'Use White List', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('369', 'messageemailconfig.username', 'zh_CN', '用户名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('370', 'messageemailconfig.username', 'en_GB', 'User Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('371', 'messageemailconfig.password', 'zh_CN', '密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('372', 'messageemailconfig.password', 'en_GB', 'Password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('373', 'messageemailconfig.accountcode', 'zh_CN', '账户代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('374', 'messageemailconfig.accountcode', 'en_GB', 'Account Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('375', 'messageemailconfig.account', 'zh_CN', '账户', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('376', 'messageemailconfig.account', 'en_GB', 'Account', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('377', 'messageemailconfig.whitelist', 'zh_CN', '白名单', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('378', 'messageemailconfig.whitelist', 'en_GB', 'White List', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('379', 'messageemailconfig.address', 'zh_CN', '地址', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('380', 'messageemailconfig.address', 'en_GB', 'Address', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('381', 'messagetemplate.templatecode', 'zh_CN', '模板代码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('382', 'messagetemplate.templatecode', 'en_GB', 'Template Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('383', 'messagetemplate.name', 'zh_CN', '模板名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('384', 'messagetemplate.name', 'en_GB', 'Template Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('385', 'messagetemplate.prioritylevel', 'zh_CN', '优先级', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('386', 'messagetemplate.prioritylevel', 'en_GB', 'Priority', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('387', 'messagetemplate.subject', 'zh_CN', '主题', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('388', 'messagetemplate.subject', 'en_GB', 'Subject', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('389', 'messagetemplate.content', 'zh_CN', '内容', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('390', 'messagetemplate.content', 'en_GB', 'Content', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('391', 'message.subject', 'zh_CN', '主题', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('392', 'message.subject', 'en_GB', 'Subject', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('393', 'message.content', 'zh_CN', '内容', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('394', 'message.content', 'en_GB', 'Content', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('395', 'message.receivers', 'zh_CN', '收件人', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('396', 'message.receivers', 'en_GB', 'Receivers', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('399', 'user.info', 'zh_CN', '用户信息', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('400', 'user.info', 'en_GB', 'User Info', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('401', 'user.status', 'zh_CN', '状态', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('402', 'user.status', 'en_GB', 'Status', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('403', 'user.updatepassword', 'zh_CN', '修改密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('404', 'user.updatepassword', 'en_GB', 'Update Password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('405', 'user.current_password', 'zh_CN', '当前密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('406', 'user.current_password', 'en_GB', 'Current Password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('407', 'user.new_password', 'zh_CN', '新密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('408', 'user.new_password', 'en_GB', 'New Password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('409', 'user.again_new_password', 'zh_CN', '确认新密码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('410', 'user.again_new_password', 'en_GB', 'New Password Again', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('411', 'preference.timezone', 'zh_CN', '时区', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('412', 'preference.timezone', 'en_GB', 'TimeZone', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('413', 'profilevalue.levelid', 'zh_CN', '层级', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('414', 'profilevalue.levelid', 'en_GB', 'Level', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('415', 'profilevalue.levelvalue', 'zh_CN', '层级值', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('416', 'profilevalue.levelvalue', 'en_GB', 'Level Value', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('417', 'profilevalue.profilevalue', 'zh_CN', '配置值', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('418', 'profilevalue.profilevalue', 'en_GB', 'Profile Value', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('419', 'attachcategory.categoryname', 'zh_CN', '目录名称', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('420', 'attachcategory.categoryname', 'en_GB', 'Category Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('421', 'attachcategory.categorypath', 'zh_CN', '存储路径', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('422', 'attachcategory.categorypath', 'en_GB', 'Save Path', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('423', 'attachcategory.description', 'zh_CN', '描述', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('424', 'attachcategory.description', 'en_GB', 'Description', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('425', 'attachcategory.allowedfiletype', 'zh_CN', '文件类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('426', 'attachcategory.allowedfiletype', 'en_GB', 'File Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('427', 'attachcategory.allowedfilesize', 'zh_CN', '最大文件长度', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('428', 'attachcategory.allowedfilesize', 'en_GB', 'Allow File Size', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('429', 'attachcategory.sourcetype', 'zh_CN', '来源类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('430', 'attachcategory.sourcetype', 'en_GB', 'Source Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('431', 'attachcategory.isunique', 'zh_CN', '唯一', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('432', 'attachcategory.isunique', 'en_GB', 'Unique', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('433', 'attachcategory.statusname', 'zh_CN', '状态', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('434', 'attachcategory.statusname', 'en_GB', 'Status', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('435', 'attachcategory.statusname.normal', 'zh_CN', '普通', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('436', 'attachcategory.statusname.normal', 'en_GB', 'Normal', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('437', 'attachcategory.statusname.archived', 'zh_CN', '压缩', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('438', 'attachcategory.statusname.archived', 'en_GB', 'Archived', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('439', 'attachcategory.archive', 'zh_CN', '压缩', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('440', 'attachcategory.archive', 'en_GB', 'Archive', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('441', 'sysfile.filename', 'zh_CN', '文件名', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('442', 'sysfile.filename', 'en_GB', 'File Name', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('443', 'sysfile.filesize', 'zh_CN', '文件大小', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('444', 'sysfile.filesize', 'en_GB', 'File Size', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('445', 'sysfile.uploaddate', 'zh_CN', '上传日期', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('446', 'sysfile.uploaddate', 'en_GB', 'Upload Date', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('447', 'sysfile.filetype', 'zh_CN', '文件类型', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('448', 'sysfile.filetype', 'en_GB', 'File Type', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('449', 'hap.view', 'zh_CN', '查看', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('450', 'hap.view', 'en_GB', 'View', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('451', 'sysfile.upload', 'zh_CN', '上传', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('452', 'sysfile.upload', 'en_GB', 'Upload', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('453', 'hap.tip.info', 'zh_CN', '提示', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('454', 'hap.tip.info', 'en_GB', 'Information', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('455', 'hap.tip.success', 'zh_CN', '成功', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('456', 'hap.tip.success', 'en_GB', 'Success', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('457', 'function.resourcechoose', 'zh_CN', '选择资源', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('458', 'function.resourcechoose', 'en_GB', 'Choose Resource', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('459', 'hap.tip.delete_confirm', 'zh_CN', '确定删除？', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('460', 'hap.tip.delete_confirm', 'en_GB', 'Confirm Delete?', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('461', 'hap.confirm', 'zh_CN', '确认', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('462', 'hap.confirm', 'en_GB', 'Confirm', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('463', 'role.changerole', 'zh_CN', '切换角色', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('464', 'role.changerole', 'en_GB', 'Change Role', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('472', 'user.verificode', 'zh_CN', '验证码', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('473', 'user.verificode', 'en_GB', 'Verify Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('474', 'account.common.logintip', 'zh_CN', '请登录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('475', 'account.common.logintip', 'en_GB', 'Please Login', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('476', 'hap.confirm_exit', 'zh_CN', '确定退出？', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('477', 'hap.confirm_exit', 'en_GB', 'Quit?', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('478', 'rolefunction.select_role', 'zh_CN', '选择角色', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('479', 'rolefunction.select_role', 'en_GB', 'Select Role', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('480', 'hap.login', 'zh_CN', '登录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('481', 'hap.login', 'en_GB', 'Login', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('482', 'hap.multilanguage_editor', 'zh_CN', '多语言编辑', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('483', 'hap.multilanguage_editor', 'en_GB', 'MultiLangauge Edit', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('484', 'error.login.verification_code_error', 'zh_CN', '验证码错误', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('485', 'error.login.verification_code_error', 'en_GB', 'Verification Code Error', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('488', 'error.login.name_password_not_match', 'zh_CN', '用户名或密码错误', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('489', 'error.login.name_password_not_match', 'en_GB', 'Wrong user name or password', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('491', 'job.attributename', 'zh_CN', '参数名称', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('492', 'job.attributename', 'en_GB', 'Attribute Name', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('493', 'job.attributevalue', 'zh_CN', '参数值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('494', 'job.attributevalue', 'en_GB', 'Attribute Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('495', 'crontriggerdto.cronexpression', 'zh_CN', 'Cron 表达式', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('496', 'crontriggerdto.cronexpression', 'en_GB', 'Cron Expression', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('497', 'triggerdto.starttime', 'zh_CN', '开始时间', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('498', 'triggerdto.starttime', 'en_GB', 'Start Time', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('499', 'triggerdto.endtime', 'zh_CN', '结束时间', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('500', 'triggerdto.endtime', 'en_GB', 'End Time', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('501', 'error.user.two_password_not_match', 'zh_CN', '两次密码不匹配', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('502', 'error.user.two_password_not_match', 'en_GB', 'Two Password Not Match', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('503', 'error.user.accout_locked', 'zh_CN', '账户已锁定', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('504', 'error.user.accout_locked', 'en_GB', 'Account Locked', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('505', 'error.user.account_not_active', 'zh_CN', '用户未激活', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('506', 'error.user.account_not_active', 'en_GB', 'User Not Active', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('507', 'error.user.account_expired', 'zh_CN', '用户已过期', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('508', 'error.user.account_expired', 'en_GB', 'User Expired', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('509', 'user.startactivedate', 'zh_CN', '开始有效日期', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('510', 'user.startactivedate', 'en_GB', 'Start Active Date', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('511', 'user.endactivedate', 'zh_CN', '失效日期', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('512', 'user.endactivedate', 'en_GB', 'End Active Date', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('513', 'error.record_not_exists_or_version_not_match', 'zh_CN', '记录不存在或版本不一致。行 ID：{0}', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('514', 'error.record_not_exists_or_version_not_match', 'en_GB', 'Record not exists or version NOT MATCH. RowId:{0}', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('515', 'sys.config.configuration', 'en_GB', 'System Configuration', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('516', 'sys.config.configuration', 'zh_CN', '系统配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('517', 'sys.config.style', 'en_GB', 'Style', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('518', 'sys.config.style', 'zh_CN', '样式', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('519', 'sys.config.safety', 'en_GB', 'Safety Policy', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('520', 'sys.config.safety', 'zh_CN', '安全策略', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('521', 'sys.config.other', 'en_GB', 'PassWord Policy', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('522', 'sys.config.other', 'zh_CN', '密码策略', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('523', 'sys.config.systemtitle', 'en_GB', 'system title', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('524', 'sys.config.systemtitle', 'zh_CN', '系统标题', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('525', 'sys.config.systemlogo', 'en_GB', 'system logo', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('526', 'sys.config.systemlogo', 'zh_CN', '系统图标', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('527', 'sys.config.favicon', 'en_GB', 'favicon', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('528', 'sys.config.favicon', 'zh_CN', 'favicon', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('529', 'sys.config.captcha', 'en_GB', 'captcha', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('530', 'sys.config.captcha', 'zh_CN', '验证码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('531', 'sys.config.defaultpassword', 'en_GB', 'new user default password', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('532', 'sys.config.defaultpassword', 'zh_CN', '新用户默认密码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('533', 'sys.config.systemlogo.desciption', 'en_GB', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为70*30', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('534', 'sys.config.systemlogo.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为70*30', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('535', 'sys.config.favicon.desciption', 'en_GB', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为32*32', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('536', 'sys.config.favicon.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为32*32', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10001', 'preference.locale', 'en_GB', 'Select Language', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10002', 'preference.locale', 'zh_CN', '选择语言', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10003', 'preference.timezone.description', 'en_GB', 'Select your time zone', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10004', 'preference.timezone.description', 'zh_CN', '请选择您所在的区域的时区', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10005', 'preference.locale.description', 'en_GB', 'Select your language', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10006', 'preference.locale.description', 'zh_CN', '请选择语言种类', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10007', 'preference.theme', 'en_GB', 'Select Theme', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10008', 'preference.theme', 'zh_CN', '选择皮肤', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10009', 'position.name', 'en_GB', 'positionName', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10010', 'position.name', 'zh_CN', '岗位名称', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10011', 'position.description', 'en_GB', 'positionDescription', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10012', 'position.description', 'zh_CN', '岗位描述', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10013', 'position.positioncode', 'en_GB', 'positionCode', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10014', 'position.positioncode', 'zh_CN', '岗位编码', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10015', 'position.parentpositionname', 'en_GB', 'parentPositionName', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10016', 'position.parentpositionname', 'zh_CN', '上级岗位', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10017', 'unit.name', 'en_GB', 'unitName', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10018', 'unit.name', 'zh_CN', '部门名称', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10019', 'unit.description', 'en_GB', 'unitDescription', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10020', 'unit.description', 'zh_CN', '部门名称', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10021', 'unit.unitcode', 'en_GB', 'unitCode', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10022', 'unit.unitcode', 'zh_CN', '部门编码', '1', '-1', '-1', '2016-09-29 15:59:22', '-1', '-1', '2016-09-29 15:59:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_b`;
CREATE TABLE `sys_resource_b` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOGIN_REQUIRE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACCESS_CHECK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `SYS_RESOURCE_B_U1` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8 COMMENT='功能资源表';

-- ----------------------------
-- Records of sys_resource_b
-- ----------------------------
INSERT INTO `sys_resource_b` VALUES ('101', 'sys/sys_function.html', 'HTML', '功能管理', '功能管理', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('102', 'sys/sys_prompt.html', 'HTML', '描述维护', '描述维护', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('103', 'sys/sys_code.html', 'HTML', '代码维护', '代码维护', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('104', 'sys/sys_lov.html', 'HTML', 'LOV维护', 'LOV维护', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('105', 'sys/sys_profile.html', 'HTML', '配置维护', '配置维护', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('121', 'sys/sys_resource.html', 'HTML', '资源注册', '资源注册', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('122', 'sys/sys_role_function.html', 'HTML', '功能分配', '功能分配', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('123', 'sys/sys_user.html', 'HTML', '用户管理', '用户管理', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('125', 'sys/sys_role.html', 'HTML', '角色管理', '角色管理', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('126', 'sys/sys_user_role.html', 'HTML', '角色分配', '角色分配', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('127', 'job/job_detail.html', 'HTML', '任务明细', '任务明细', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('128', 'job/job_running_info.html', 'HTML', '执行记录', '执行记录', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('142', 'sys/sys_language.html', 'HTML', '语言维护', '语言维护', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('143', 'mail/sys_message_email_config.html', 'HTML', '邮件账户', '邮件账户', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('144', 'mail/sys_message_template.html', 'HTML', '邮件模板', '邮件模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('145', 'mail/sys_message_test.html', 'HTML', '邮件测试', '邮件测试', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('146', 'attach/sys_attach_category_manage.html', 'HTML', '目录管理', '目录管理', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('147', 'attach/sys_attach_category_edit.html', 'HTML', '目录编辑', '目录编辑', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('148', 'attach/sys_file_manage.html', 'HTML', '文件管理', '文件管理', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('149', 'attach/sys_attachment_create.html', 'HTML', '上传测试', '上传测试', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('150', '403.html', 'HTML', '403', '403', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('151', '404.html', 'HTML', '404', '404', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('152', '500.html', 'HTML', '500', '500', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('153', 'login.html', 'HTML', '登录', '登录', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('154', 'index.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('155', 'role.html', 'HTML', '角色选择', '角色选择', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('156', 'timeout.html', 'HTML', '超时', '超时', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('157', 'sys/sys_code_edit.html', 'HTML', '编辑快码', '编辑快码', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('158', 'sys/sys_function_addresource.html', 'HTML', '添加资源', '添加资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('159', 'sys_function_resource.html', 'HTML', '功能资源', '功能资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('160', 'sys/sys_lov_edit.html', 'HTML', '编辑 LOV', '编辑 LOV', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('161', 'sys/sys_lov_preview.html', 'HTML', 'LOV 预览', 'LOV 预览', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('162', 'sys/sys_multilanguage_editor.html', 'HTML', '多语言编辑器', '多语言编辑器', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('163', 'sys/sys_profile_edit.html', 'HTML', '编辑配置文件', '编辑配置文件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('164', 'sys/sys_resource_item.html', 'HTML', '资源组件', '资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('165', 'sys/sys_role_resource_item.html', 'HTML', '分配资源组件', '分配资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('166', 'sys/sys_user_chooserole.html', 'HTML', '选择角色', '选择角色', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('167', 'sys/um/sys_login_success.html', 'HTML', '登录成功', '登录成功', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('168', 'sys/um/sys_update_password.html', 'HTML', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('169', 'sys/um/sys_user_info.html', 'HTML', '用户信息', '用户信息', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('170', 'sys_icon.html', 'HTML', '图标选择', '图标选择', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('171', 'sys/role/queryRoleNotUserRole', 'SERVICE', '选择非当前角色', '选择非当前角色', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('172', 'sys/role/query', 'SERVICE', '角色查询', '角色查询', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('173', 'sys/role/submit', 'SERVICE', '角色更新', '角色更新', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('174', 'sys/role/delete', 'SERVICE', '角色删除', '角色删除', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('175', 'sys/user/query', 'SERVICE', '用户查询', '用户查询', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('176', 'sys/user/submit', 'SERVICE', '更新用户', '更新用户', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('177', 'sys/user/remove', 'SERVICE', '删除用户', '删除用户', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('178', 'sys/um/updateUserInfo', 'SERVICE', '更新个人信息', '更新个人信息', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('179', 'sys/um/isExistsUser', 'SERVICE', '用户是否存在', '用户是否存在', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('180', 'sys/um/isExistsPhone', 'SERVICE', '电话号码检查', '电话号码检查', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('181', 'sys/um/isExistsEmail', 'SERVICE', '用户邮件检查', '用户邮件检查', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('182', 'sys/um/query', 'SERVICE', '用户信息查询', '用户信息查询', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('183', 'sys/um/getSingleUser', 'SERVICE', '单条用户信息', '单条用户信息', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('184', 'sys/um/updatePassword', 'SERVICE', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('185', 'sys/userrole/queryUserRoles', 'SERVICE', '查询用户角色', '查询用户角色', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('186', 'sys/userrole/submit', 'SERVICE', '保存用户角色', '保存用户角色', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('187', 'sys/function/fetchResource', 'SERVICE', '获取已分配资源', '获取已分配资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('188', 'sys/function/fetchNotResource', 'SERVICE', '获取未分配资源', '获取未分配资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('189', 'sys/function/menus', 'SERVICE', '获取菜单', '获取菜单', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('190', 'sys/function/query', 'SERVICE', '查询功能', '查询功能', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('191', 'sys/function/remove', 'SERVICE', '删除功能', '删除功能', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('192', 'sys/function/submit', 'SERVICE', '更新功能', '更新功能', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('193', 'sys/function/updateFunctionResource', 'SERVICE', '更新功能资源', '更新功能资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('194', 'sys/resource/query', 'SERVICE', '查询资源', '查询资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('195', 'sys/resource/submit', 'SERVICE', '更新资源', '更新资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('196', 'sys/resource/remove', 'SERVICE', '删除资源', '删除资源', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('197', 'sys/resourceItem/query', 'SERVICE', '查询资源组件', '查询资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('198', 'sys/resourceItem/submit', 'SERVICE', '更新资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('199', 'sys/resourceItem/remove', 'SERVICE', '删除资源组件', '删除资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('200', 'sys/rolefunction/query', 'SERVICE', '查询角色功能', '查询角色功能', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('201', 'sys/rolefunction/submit', 'SERVICE', '更新角色功能', '更新角色功能', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('202', 'sys/rolefunction/queryResourceItems', 'SERVICE', '查询功能资源组件', '查询功能资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('203', 'sys/rolefunction/submitResourceItems', 'SERVICE', '更新功能资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('204', 'verifiCode', 'SERVICE', '验证码服务', '验证码服务', 'N', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('205', 'sys/code/query', 'SERVICE', '查询快码', '查询快码', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('206', 'sys/code/submit', 'SERVICE', '更新快码', '更新快码', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('207', 'sys/code/remove', 'SERVICE', '删除快码', '删除快码', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('208', 'sys/codevalue/query', 'SERVICE', '查询快码值', '查询快码值', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('209', 'sys/codevalue/remove', 'SERVICE', '删除快码值', '删除快码值', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('210', 'sys/language/query', 'SERVICE', '查询语言', '查询语言', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('211', 'sys/language/submit', 'SERVICE', '更新语言', '更新语言', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('212', 'sys/language/delete', 'SERVICE', '删除语言', '删除语言', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('213', 'sys/lov/query', 'SERVICE', '查询 LOV', '查询 LOV', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('214', 'sys/lov/submit', 'SERVICE', '更新 LOV', '更新 LOV', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('215', 'sys/lov/remove', 'SERVICE', '删除 LOV', '删除 LOV', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('216', 'sys/lov/load', 'SERVICE', '加载 LOV', '加载 LOV', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('217', 'sys/lovitem/query', 'SERVICE', '查询 LOV 列', '查询 LOV 列', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('218', 'sys/lovitem/remove', 'SERVICE', '删除 LOV 列', '删除 LOV 列', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('219', 'sys/prompt/query', 'SERVICE', '查询描述', '查询描述', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('220', 'sys/prompt/submit', 'SERVICE', '更改描述', '更改描述', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('221', 'sys/prompt/remove', 'SERVICE', '删除描述', '删除描述', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('222', 'sys/profile/query', 'SERVICE', '查询配置', '查询配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('223', 'sys/profile/submit', 'SERVICE', '更新配置', '更新配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('224', 'sys/profile/remove', 'SERVICE', '删除配置', '删除配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('225', 'sys/profilevalue/query', 'SERVICE', '查询配置值', '查询配置值', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('226', 'sys/profilevalue/remove', 'SERVICE', '删除配置值', '删除配置值', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('227', 'sys/profilevalue/querylevelvalues', 'SERVICE', '查询指定级别的配置值', '查询指定级别的配置值', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('228', 'sys/preferences/savePreferences', 'SERVICE', '保存首选项', '保存首选项', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('229', 'sys/preferences/queryPreferences', 'SERVICE', '查询首选项', '查询首选项', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('230', 'job/create', 'SERVICE', '新建任务', '新建任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('231', 'job/query', 'SERVICE', '查询任务', '查询任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('232', 'job/pausejob', 'SERVICE', '暂停任务', '暂停任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('233', 'job/resumejob', 'SERVICE', '恢复任务', '恢复任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('234', 'job/deletejob', 'SERVICE', '删除任务', '删除任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('235', 'job/queryInfo', 'SERVICE', '查询任务列表', '查询任务列表', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('236', 'job/scheduler/info', 'SERVICE', '调度器信息', '调度器信息', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('237', 'job/scheduler/query', 'SERVICE', '查询调度器', '查询调度器', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('238', 'job/scheduler/start', 'SERVICE', '启动调度器', '启动调度器', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('239', 'job/scheduler/standby', 'SERVICE', '暂停调度器', '暂停调度器', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('240', 'job/scheduler/pauseall', 'SERVICE', '暂停所有任务', '暂停所有任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('241', 'job/scheduler/resumeall', 'SERVICE', '恢复所有任务', '恢复所有任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('242', 'job/jobinfo/query', 'SERVICE', '查询任务日志', '查询任务日志', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('243', 'sys/messageEmailConfig/query', 'SERVICE', '查询邮件配置', '查询邮件配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('244', 'sys/messageEmailConfig/submit', 'SERVICE', '更新邮件配置', '更新邮件配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('245', 'sys/messageEmailConfig/remove', 'SERVICE', '删除邮件配置', '删除邮件配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('246', 'sys/messageEmailConfig/load', 'SERVICE', '加载邮件配置', '加载邮件配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('247', 'sys/messageEmailConfig/queryMsgConfigQuanties', 'SERVICE', '查询邮件配置数量', '查询配置数量', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('248', 'sys/messageEmailAccount/query', 'SERVICE', '查询邮件账户', '查询邮件账户', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('249', 'sys/messageEmailAccount/remove', 'SERVICE', '删除邮件账户', '删除邮件账户', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('250', 'sys/messageEmailWhiteList/query', 'SERVICE', '查询邮件白名单', '查询邮件白名单', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('251', 'sys/messageEmailWhiteList/remove', 'SERVICE', '删除邮件白名单', '删除邮件白名单', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('252', 'sys/messageTemplate/query', 'SERVICE', '查询模板', '查询模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('253', 'sys/messageTemplate/add', 'SERVICE', '新建模板', '新建模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('254', 'sys/messageTemplate/update', 'SERVICE', '更新模板', '更新模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('255', 'sys/messageTemplate/remove', 'SERVICE', '删除模板', '删除模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('256', 'sys/attachcategory/query', 'SERVICE', '查询目录', '查询目录', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('257', 'sys/attachcategory/submit', 'SERVICE', '更新目录', '更新目录', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('258', 'sys/attachcategory/remove', 'SERVICE', '删除目录', '删除目录', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('259', 'sys/attachcategory/tree', 'SERVICE', '查询目录树', '查询目录树', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('260', 'sys/attach/manage', 'SERVICE', '附件列表', '附件列表', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('261', 'sys/attach/upload', 'SERVICE', '附件上传', '附件上传', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('262', 'sys/attach/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('263', 'sys/attach/file/detail', 'SERVICE', '查看附件内容', '查看附件内容', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('264', 'sys/attach/file/view', 'SERVICE', '查看附件', '查看附件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('265', 'sys/attach/file/query', 'SERVICE', '查询目录文件', '查询目录文件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('266', 'sys/attach/file/queryFiles', 'SERVICE', '查询文件', '查询目录', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('267', 'sys/attach/file/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('269', 'mail/sys_message_email_config_edit.html', 'HTML', '编辑邮件配置', '编辑邮件配置', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('271', 'mail/sys_message_template_edit.html', 'HTML', '编辑模板', '编辑模板', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('272', 'sys/message/sendTest', 'SERVICE', '邮件发送测试', '邮件发送测试', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('273', 'job/job_cron_add.html', 'HTML', '新建 CRON 任务', '新建CRON 任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('274', 'job/job_simple_add.html', 'HTML', '新建简单任务', '新建简单任务', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('275', 'job/scheduler.html', 'HTML', '调度器', '调度器', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('276', 'job/job_infodetail.html', 'HTML', '任务详细', '任务详细', 'Y', 'Y', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('277', 'home.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10001', 'report/datasource.html', 'HTML', '数据源', '数据源', 'N', 'N', '2', '-1', '-1', '2016-09-29 19:28:29', '3', '3', '2016-09-29 19:55:00', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10002', 'report/list.html', 'HTML', '报表信息', '报表信息', 'N', 'N', '1', '-1', '-1', '2016-09-29 19:55:00', '3', '3', '2016-09-29 19:55:00', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10003', 'lov/lov.html', 'HTML', 'LOV', 'LOV', 'N', 'N', '1', '-1', '-1', '2016-09-29 19:55:32', '3', '3', '2016-09-29 19:55:32', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_item_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_b`;
CREATE TABLE `sys_resource_item_b` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `OWNER_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能资源ID',
  `TARGET_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '目标资源ID',
  `ITEM_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ITEM_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ITEM_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部请求id',
  `PROGRAM_ID` bigint(20) DEFAULT '-1' COMMENT '对Record最后一次操作的系统内部程序id',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`),
  UNIQUE KEY `SYS_RESOURCE_ITEM_B_U1` (`ITEM_ID`,`OWNER_RESOURCE_ID`),
  KEY `SYS_RESOURCE_ITEM_B_N1` (`OWNER_RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能控件表';

-- ----------------------------
-- Records of sys_resource_item_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_item_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_tl`;
CREATE TABLE `sys_resource_item_tl` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '表ID，主键，供其他表做外键',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ITEM_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能控件表(多语言)';

-- ----------------------------
-- Records of sys_resource_item_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_tl`;
CREATE TABLE `sys_resource_tl` (
  `RESOURCE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '表ID，主键，供其他表做外键',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能资源表(多语言)';

-- ----------------------------
-- Records of sys_resource_tl
-- ----------------------------
INSERT INTO `sys_resource_tl` VALUES ('101', 'en_GB', 'Function', 'Function', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('101', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('102', 'en_GB', 'Prompt', 'Prompt', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('102', 'zh_CN', '描述维护', '描述维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('103', 'en_GB', 'Code', 'Code', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('103', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('104', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('104', 'zh_CN', 'LOV维护', 'LOV维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('105', 'en_GB', 'Profile', 'Profile', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('105', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('121', 'en_GB', 'Resource', 'Resource', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('121', 'zh_CN', '资源注册', '资源注册', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('122', 'en_GB', 'Function Assign', 'Function Assign', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('122', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('123', 'en_GB', 'User', 'User', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('123', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('125', 'en_GB', 'Role', 'Role', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('125', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('126', 'en_GB', 'Role Assign', 'Role Assign', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('126', 'zh_CN', '角色分配', '角色分配', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('127', 'en_GB', 'Job Details', 'Job Details', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('127', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('128', 'en_GB', 'Execution Summary', 'Execution Summary', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('128', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('142', 'en_GB', 'Language', 'Language', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('142', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('143', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('143', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('144', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('144', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('145', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('145', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('146', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('146', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('147', 'en_GB', 'Category Edit', 'Category Edit', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('147', 'zh_CN', '目录编辑', '目录编辑', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('148', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('148', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('149', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('149', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('150', 'en_GB', '403', '403', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('150', 'zh_CN', '403', '403', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('151', 'en_GB', '404', '404', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('151', 'zh_CN', '404', '404', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('152', 'en_GB', '500', '500', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('152', 'zh_CN', '500', '500', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('153', 'en_GB', 'Login', 'Login', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('153', 'zh_CN', '登录', '登录', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('154', 'en_GB', 'Index', 'Index', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('154', 'zh_CN', '首页', '首页', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('155', 'en_GB', 'Role Select', 'Role Select', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('155', 'zh_CN', '角色选择', '角色选择', '1', '-1', '-1', '2016-09-29 15:59:20', '-1', '-1', '2016-09-29 15:59:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('156', 'en_GB', 'Timeout', 'Timeout', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('156', 'zh_CN', '超时', '超时', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('157', 'en_GB', 'Edit Code', 'Edit Code', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('157', 'zh_CN', '编辑快码', '编辑快码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('158', 'en_GB', 'Add Resource', 'Add Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('158', 'zh_CN', '添加资源', '添加资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('159', 'en_GB', 'Function Resource', 'Function Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('159', 'zh_CN', '功能资源', '功能资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('160', 'en_GB', 'Edit Lov', 'Edit Lov', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('160', 'zh_CN', '编辑 LOV', '编辑 LOV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('161', 'en_GB', 'Lov Preview', 'Lov Preview', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('161', 'zh_CN', 'LOV 预览', 'LOV 预览', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('162', 'en_GB', 'MultiLanguage Editor', 'MultiLangauge Editor', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('162', 'zh_CN', '多语言编辑器', '多语言编辑器', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('163', 'en_GB', 'Edit Profile', 'Edit Profile', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('163', 'zh_CN', '编辑配置文件', '编辑配置文件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('164', 'en_GB', 'Resource Item', 'Resource Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('164', 'zh_CN', '资源组件', '资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('165', 'en_GB', 'Role Resource Item', 'Role Resource Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('165', 'zh_CN', '分配资源组件', '分配资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('166', 'en_GB', 'Select Role', 'Role Select', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('166', 'zh_CN', '选择角色', '选择角色', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('167', 'en_GB', 'Login Success', 'Login Success', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('167', 'zh_CN', '登录成功', '登录成功', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('168', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('168', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('169', 'en_GB', 'User Info', 'User Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('169', 'zh_CN', '用户信息', '用户信息', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('170', 'en_GB', 'Icon Select', 'Icon Select', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('170', 'zh_CN', '图标选择', '图标选择', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('171', 'en_GB', 'Select Role', 'Select role not present', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('171', 'zh_CN', '选择非当前角色', '选择非当前角色', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('172', 'en_GB', 'Query Role', 'Query Role', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('172', 'zh_CN', '角色查询', '角色查询', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('173', 'en_GB', 'Update Role', 'Update Role', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('173', 'zh_CN', '角色更新', '角色更新', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('174', 'en_GB', 'Delete Role', 'Delete Role', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('174', 'zh_CN', '角色删除', '角色删除', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('175', 'en_GB', 'Query User', 'Query User', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('175', 'zh_CN', '用户查询', '用户查询', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('176', 'en_GB', 'Update User', 'Update User', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('176', 'zh_CN', '更新用户', '更新用户', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('177', 'en_GB', 'Delete User', 'Delete User', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('177', 'zh_CN', '删除用户', '删除用户', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('178', 'en_GB', 'Update User Info', 'Update User Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('178', 'zh_CN', '更新个人信息', '更新个人信息', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('179', 'en_GB', 'User Exists check', 'User Exists check', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('179', 'zh_CN', '用户是否存在', '用户是否存在', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('180', 'en_GB', 'User Phone Check', 'User Phone Check', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('180', 'zh_CN', '电话号码检查', '电话号码检查', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('181', 'en_GB', 'User email Check', 'User Email Check', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('181', 'zh_CN', '用户邮件检查', '用户邮件检查', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('182', 'en_GB', 'Query User Info', 'Query User Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('182', 'zh_CN', '用户信息查询', '用户信息查询', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('183', 'en_GB', 'Single User Info', 'Single User Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('183', 'zh_CN', '单条用户信息', '单条用户信息', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('184', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('184', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('185', 'en_GB', 'Query User Role', 'Query User Role', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('185', 'zh_CN', '查询用户角色', '查询用户角色', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('186', 'en_GB', 'Update User Role', 'Update User Role', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('186', 'zh_CN', '保存用户角色', '保存用户角色', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('187', 'en_GB', 'Fetch Assigned Resource', 'Fetch Assigned Resouce', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('187', 'zh_CN', '获取已分配资源', '获取已分配资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('188', 'en_GB', 'Fetch Unassigned Resource', 'Fetch Unassigned Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('188', 'zh_CN', '获取未分配资源', '获取未分配资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('189', 'en_GB', 'Menus', 'Get Menus', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('189', 'zh_CN', '获取菜单', '获取菜单', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('190', 'en_GB', 'Query Funcitons', 'Query Functions', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('190', 'zh_CN', '查询功能', '查询功能', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('191', 'en_GB', 'Delete Function', 'Delete Functions', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('191', 'zh_CN', '删除功能', '删除功能', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('192', 'en_GB', 'Update Fuction', 'Update Function', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('192', 'zh_CN', '更新功能', '更新功能', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('193', 'en_GB', 'Update Function Resource', 'Update Function Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('193', 'zh_CN', '更新功能资源', '更新功能资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('194', 'en_GB', 'Query Resource', 'Query Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('194', 'zh_CN', '查询资源', '查询资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('195', 'en_GB', 'Update Resource', 'Update Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('195', 'zh_CN', '更新资源', '更新资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('196', 'en_GB', 'Delete Resource', 'Delete Resource', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('196', 'zh_CN', '删除资源', '删除资源', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('197', 'en_GB', 'Query Resource Item', 'Query Resource Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('197', 'zh_CN', '查询资源组件', '查询资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('198', 'en_GB', 'Update Resoruce Item', 'Update Resource Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('198', 'zh_CN', '更新资源组件', '更新资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('199', 'en_GB', 'Delete Resource Item', 'Delete Resource Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('199', 'zh_CN', '删除资源组件', '删除资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('200', 'en_GB', 'Query Role Function', 'Query Role Function', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('200', 'zh_CN', '查询角色功能', '查询角色功能', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('201', 'en_GB', 'Update Role Function', 'Update Role Function', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('201', 'zh_CN', '更新角色功能', '更新角色功能', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('202', 'en_GB', 'Query Function Resource Item', 'Query Function Resource Items', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('202', 'zh_CN', '查询功能资源组件', '查询功能资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('203', 'en_GB', 'Update Function Resource Items', 'Update Function Resource Items', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('203', 'zh_CN', '更新功能资源组件', '更新资源组件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('204', 'en_GB', 'Captcha Service', 'Captcha Service', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('204', 'zh_CN', '验证码服务', '验证码服务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('205', 'en_GB', 'Query Code', 'Query Code', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('205', 'zh_CN', '查询快码', '查询快码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('206', 'en_GB', 'Update Code', 'Update Code', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('206', 'zh_CN', '更新快码', '更新快码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('207', 'en_GB', 'Delete Code', 'Delete Code', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('207', 'zh_CN', '删除快码', '删除快码', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('208', 'en_GB', 'Query Code Value', 'Query Code Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('208', 'zh_CN', '查询快码值', '查询快码值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('209', 'en_GB', 'Delete Code Value', 'Query Code Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('209', 'zh_CN', '删除快码值', '删除快码值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('210', 'en_GB', 'Query Language', 'Query Language', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('210', 'zh_CN', '查询语言', '查询语言', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('211', 'en_GB', 'Update Language', 'Update Language', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('211', 'zh_CN', '更新语言', '更新语言', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('212', 'en_GB', 'Delete Language', 'Delete Language', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('212', 'zh_CN', '删除语言', '删除语言', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('213', 'en_GB', 'Query Lov', 'Query Lov', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('213', 'zh_CN', '查询 LOV', '查询 LOV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('214', 'en_GB', 'Update Lov', 'Update Lov', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('214', 'zh_CN', '更新 LOV', '更新 LOV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('215', 'en_GB', 'Delete Lov', 'Delete Lov', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('215', 'zh_CN', '删除 LOV', '删除 LOV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('216', 'en_GB', 'Load Lov', 'Load Lov', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('216', 'zh_CN', '加载 LOV', '加载 LOV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('217', 'en_GB', 'Query Lov Item', 'Query Lov Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('217', 'zh_CN', '查询 LOV 列', '查询 LOV 列', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('218', 'en_GB', 'Delete Lov Item', 'Delete Lov Item', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('218', 'zh_CN', '删除 LOV 列', '删除 LOV 列', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('219', 'en_GB', 'Query Prompt', 'Query Prompt', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('219', 'zh_CN', '查询描述', '查询描述', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('220', 'en_GB', 'Update Prompt', 'Update Prompt', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('220', 'zh_CN', '更改描述', '更改描述', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('221', 'en_GB', 'Delete Prompt', 'Delete Prompt', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('221', 'zh_CN', '删除描述', '删除描述', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('222', 'en_GB', 'Query Profile', 'Query Profile', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('222', 'zh_CN', '查询配置', '查询配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('223', 'en_GB', 'Update Profile', 'Update Profile', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('223', 'zh_CN', '更新配置', '更新配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('224', 'en_GB', 'Delete Profile', 'Delete Profile', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('224', 'zh_CN', '删除配置', '删除配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('225', 'en_GB', 'Query Profile Value', 'Query Profile Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('225', 'zh_CN', '查询配置值', '查询配置值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('226', 'en_GB', 'Delete Profile Value', 'Delete Profile Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('226', 'zh_CN', '删除配置值', '删除配置值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('227', 'en_GB', 'Query Profile Level Value', 'Query Profile Level Value', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('227', 'zh_CN', '查询指定级别的配置值', '查询指定级别的配置值', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('228', 'en_GB', 'Save Preference', 'Save Preference', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('228', 'zh_CN', '保存首选项', '保存首选项', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('229', 'en_GB', 'Query Preference', 'Query Preference', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('229', 'zh_CN', '查询首选项', '查询首选项', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('230', 'en_GB', 'Create Job', 'Create Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('230', 'zh_CN', '新建任务', '新建任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('231', 'en_GB', 'Query Job', 'Query Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('231', 'zh_CN', '查询任务', '查询任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('232', 'en_GB', 'Pause Job', 'Pause Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('232', 'zh_CN', '暂停任务', '暂停任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('233', 'en_GB', 'Resume Job', 'Resume Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('233', 'zh_CN', '恢复任务', '恢复任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('234', 'en_GB', 'Delete Job', 'Delete Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('234', 'zh_CN', '删除任务', '删除任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('235', 'en_GB', 'Query Job Info', 'Query Job Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('235', 'zh_CN', '查询任务列表', '查询任务列表', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('236', 'en_GB', 'Scheduler Info', 'Scheduler Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('236', 'zh_CN', '调度器信息', '调度器信息', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('237', 'en_GB', 'Query Scheduler', 'Query Schedulers', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('237', 'zh_CN', '查询调度器', '查询调度器', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('238', 'en_GB', 'Start Scheduler', 'Start Scheduler', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('238', 'zh_CN', '启动调度器', '启动调度器', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('239', 'en_GB', 'Standby Scheduler', 'Standby Scheduler', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('239', 'zh_CN', '暂停调度器', '暂停调度器', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('240', 'en_GB', 'Pause All Jobs', 'Pause All Jobs', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('240', 'zh_CN', '暂停所有任务', '暂停所有任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('241', 'en_GB', 'Resume All Jobs', 'Resume All Jobs', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('241', 'zh_CN', '恢复所有任务', '恢复所有任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('242', 'en_GB', 'Query Job Log', 'Query Job Log', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('242', 'zh_CN', '查询任务日志', '查询任务日志', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('243', 'en_GB', 'Query Email Config', 'Query Email Config', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('243', 'zh_CN', '查询邮件配置', '查询邮件配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('244', 'en_GB', 'Update Email Config', 'Update Email Config', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('244', 'zh_CN', '更新邮件配置', '更新邮件配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('245', 'en_GB', 'Delete Email Config', 'Delete Email Config', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('245', 'zh_CN', '删除邮件配置', '删除邮件配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('246', 'en_GB', 'Load Email Config', 'Load Email Config', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('246', 'zh_CN', '加载邮件配置', '加载邮件配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('247', 'en_GB', 'Query Config Count', 'Query Config Count', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('247', 'zh_CN', '查询邮件配置数量', '查询配置数量', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('248', 'en_GB', 'Query Email Account', 'Query Email Acount', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('248', 'zh_CN', '查询邮件账户', '查询邮件账户', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('249', 'en_GB', 'Delete Email Account', 'Delete Email Account', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('249', 'zh_CN', '删除邮件账户', '删除邮件账户', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('250', 'en_GB', 'Query White List', 'Query Email White List', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('250', 'zh_CN', '查询邮件白名单', '查询邮件白名单', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('251', 'en_GB', 'Delete White List', 'Delete White List', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('251', 'zh_CN', '删除邮件白名单', '删除邮件白名单', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('252', 'en_GB', 'Query Template', 'Query Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('252', 'zh_CN', '查询模板', '查询模板', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('253', 'en_GB', 'Add Template', 'Add Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('253', 'zh_CN', '新建模板', '新建模板', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('254', 'en_GB', 'Update Tempate', 'Update Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('254', 'zh_CN', '更新模板', '更新模板', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('255', 'en_GB', 'Delete Template', 'Delete Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('255', 'zh_CN', '删除模板', '删除模板', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('256', 'en_GB', 'Query Category', 'Query Category', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('256', 'zh_CN', '查询目录', '查询目录', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('257', 'en_GB', 'Update Category', 'Update Category', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('257', 'zh_CN', '更新目录', '更新目录', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('258', 'en_GB', 'Delete Category', 'Delete Category', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('258', 'zh_CN', '删除目录', '删除目录', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('259', 'en_GB', 'Query Category Tree', 'Query Category Tree', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('259', 'zh_CN', '查询目录树', '查询目录树', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('260', 'en_GB', 'Attachment List', 'Attachment List', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('260', 'zh_CN', '附件列表', '附件列表', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('261', 'en_GB', 'Attachment Upload', 'Attachment Upload', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('261', 'zh_CN', '附件上传', '附件上传', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('262', 'en_GB', 'Delete Attachment', 'Delete Attachment', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('262', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('263', 'en_GB', 'Attachment Detail', 'Attachment Detail', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('263', 'zh_CN', '查看附件内容', '查看附件内容', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('264', 'en_GB', 'View Attachment', 'View Attachment', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('264', 'zh_CN', '查看附件', '查看附件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('265', 'en_GB', 'Query Category Files', 'Query Category Files', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('265', 'zh_CN', '查询目录文件', '查询目录文件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('266', 'en_GB', 'Query Files', 'Query Files', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('266', 'zh_CN', '查询文件', '查询目录', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('267', 'en_GB', 'Delete File', 'Delete Files', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('267', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('269', 'en_GB', 'Edit Email Config', 'Edit Email Config', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('269', 'zh_CN', '编辑邮件配置', '编辑邮件配置', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('271', 'en_GB', 'Edit Template', 'Edit Template', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('271', 'zh_CN', '编辑模板', '编辑模板', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('272', 'en_GB', 'Email Send Test', 'Email Send Test', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('272', 'zh_CN', '邮件发送测试', '邮件发送测试', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('273', 'en_GB', 'Add Cron Job', 'Add Cron Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('273', 'zh_CN', '新建 CRON 任务', '新建CRON 任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('274', 'en_GB', 'Add Simple Job', 'Add Simple Job', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('274', 'zh_CN', '新建简单任务', '新建简单任务', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('275', 'en_GB', 'Scheduler', 'Scheduler', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('275', 'zh_CN', '调度器', '调度器', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('276', 'en_GB', 'Job Detail Info', 'Job Detail Info', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('276', 'zh_CN', '任务详细', '任务详细', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('277', 'en_GB', 'Home', 'Home', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('277', 'zh_CN', '首页', '首页', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:28:28', '3', '3', '2016-09-29 19:28:28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:28:28', '3', '3', '2016-09-29 19:28:28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', 'en_GB', 'datasource', 'datasource', '1', '-1', '-1', '2016-09-29 19:28:28', '3', '3', '2016-09-29 19:28:28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', 'zh_CN', '数据源', '数据源', '1', '-1', '-1', '2016-09-29 19:28:28', '3', '3', '2016-09-29 19:55:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:55:00', '3', '3', '2016-09-29 19:55:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:55:00', '3', '3', '2016-09-29 19:55:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'en_GB', 'report information', 'report information', '1', '-1', '-1', '2016-09-29 19:55:00', '3', '3', '2016-09-29 19:55:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'zh_CN', '报表信息', '报表信息', '1', '-1', '-1', '2016-09-29 19:55:00', '3', '3', '2016-09-29 19:55:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', '111', '111', '111', '1', '-1', '-1', '2016-09-29 19:55:31', '3', '3', '2016-09-29 19:55:31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', '222', '222', '222', '1', '-1', '-1', '2016-09-29 19:55:31', '3', '3', '2016-09-29 19:55:31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '2016-09-29 19:55:31', '3', '3', '2016-09-29 19:55:31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'zh_CN', 'LOV', 'LOV', '1', '-1', '-1', '2016-09-29 19:55:31', '3', '3', '2016-09-29 19:55:31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_b`;
CREATE TABLE `sys_role_b` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `ROLE_CODE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROLE_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROLE_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `START_ACTIVE_DATE` datetime DEFAULT NULL,
  `END_ACTIVE_DATE` datetime DEFAULT NULL,
  `ENABLE_FLAG` varchar(2) DEFAULT 'Y',
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SYS_ROLE_B_U1` (`ROLE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role_b
-- ----------------------------
INSERT INTO `sys_role_b` VALUES ('3', 'ADMIN', '管理员', '系统管理员', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y');

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `SRF_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SRF_ID`),
  UNIQUE KEY `SYS_ROLE_FUNCTION_U1` (`ROLE_ID`,`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10162 DEFAULT CHARSET=utf8 COMMENT='角色功能表';

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('10138', '3', '10002', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10139', '3', '10003', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10140', '3', '10005', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10141', '3', '10001', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10142', '3', '10006', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10143', '3', '10004', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10144', '3', '167', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10145', '3', '168', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10146', '3', '169', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10147', '3', '142', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10148', '3', '149', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10149', '3', '121', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10150', '3', '143', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10151', '3', '144', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10152', '3', '146', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10153', '3', '147', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10154', '3', '108', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10155', '3', '109', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10156', '3', '110', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10157', '3', '161', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10158', '3', '111', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10159', '3', '163', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10160', '3', '164', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10161', '3', '165', '1', '-1', '-1', '2016-09-29 20:05:43', '3', '3', '2016-09-29 20:05:43', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_resource_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_item`;
CREATE TABLE `sys_role_resource_item` (
  `RSI_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ITEM_ID` bigint(20) DEFAULT NULL COMMENT '功能控件ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RSI_ID`),
  UNIQUE KEY `SYS_ROLE_RESOURCE_ITEM_U1` (`ROLE_ID`,`RESOURCE_ITEM_ID`),
  KEY `SYS_ROLE_RESOURCE_ITEM_N1` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能控件表，用于对控件控制';

-- ----------------------------
-- Records of sys_role_resource_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_tl`;
CREATE TABLE `sys_role_tl` (
  `ROLE_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `LANG` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ROLE_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROLE_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表(多语言)';

-- ----------------------------
-- Records of sys_role_tl
-- ----------------------------
INSERT INTO `sys_role_tl` VALUES ('3', 'en_GB', 'Admin', 'Administrator', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('3', 'zh_CN', '管理员', '系统管理员', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表ID，主键，供其他表做外键',
  `USER_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_ENCRYPTED` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PHONE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期从',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期至',
  `STATUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', null, 'ADMIN', '59baed859597b69548f28654af4125736915ea870252f8db664e3187dcfc298ead2b761e2acb576a', 'hap_dev@126.com', '13763784776', '2016-01-01 00:00:00', null, 'ACTV', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`USER_ID`,`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('3', '3', '3', '1', '-1', '-1', '2016-09-29 15:59:21', '-1', '-1', '2016-09-29 15:59:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
