/*
Navicat MySQL Data Transfer

Source Server         : Medical-examination-system
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-06-16 11:28:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrators`
-- ----------------------------
DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators` (
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

-- ----------------------------
-- Records of administrators
-- ----------------------------
INSERT INTO `administrators` VALUES ('zly', '123456');

-- ----------------------------
-- Table structure for `chest_radiology`
-- ----------------------------
DROP TABLE IF EXISTS `chest_radiology`;
CREATE TABLE `chest_radiology` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `chest_radiography` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='胸部放射检查';

-- ----------------------------
-- Records of chest_radiology
-- ----------------------------
INSERT INTO `chest_radiology` VALUES ('620111200001010001', '2021-06-04', '胸部未见活动性结核病灶，心、肺未见重要发现', '正常', '611111198008080008', '通过', '通过', '2021-06-04 11:34:02');
INSERT INTO `chest_radiology` VALUES ('620111200001010002', '2021-06-04', '胸部有局部性病灶', '深入检查', '611111198008080008', '通过', '驳回', '2021-06-04 11:35:12');

-- ----------------------------
-- Table structure for `dental_department`
-- ----------------------------
DROP TABLE IF EXISTS `dental_department`;
CREATE TABLE `dental_department` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `dental_caries` varchar(255) DEFAULT NULL,
  `missing_teeth` varchar(255) DEFAULT NULL,
  `alveolar` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='牙科';

-- ----------------------------
-- Records of dental_department
-- ----------------------------
INSERT INTO `dental_department` VALUES ('620111200001010001', '2021-06-04', '无', '无', '正常', '无', '正常', '611111198008080003', '通过', '通过', '2021-06-04 20:13:58');
INSERT INTO `dental_department` VALUES ('620111200001010002', '2021-06-04', '有', '有', '正常', '牙齿发黄', '保护牙齿', '611111198008080003', '通过', '驳回', '2021-06-04 20:14:54');

-- ----------------------------
-- Table structure for `department_of_blood_pressure_and_pulse`
-- ----------------------------
DROP TABLE IF EXISTS `department_of_blood_pressure_and_pulse`;
CREATE TABLE `department_of_blood_pressure_and_pulse` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `blood_pressure_high` double(10,2) DEFAULT NULL,
  `blood_pressure_low` double(10,2) DEFAULT NULL,
  `pulse` int(11) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='血压脉搏科';

-- ----------------------------
-- Records of department_of_blood_pressure_and_pulse
-- ----------------------------
INSERT INTO `department_of_blood_pressure_and_pulse` VALUES ('620111200001010001', '2021-06-04', '130.00', '80.00', '60', '正常', '611111198008080005', '通过', '通过', '2021-06-04 11:16:29');
INSERT INTO `department_of_blood_pressure_and_pulse` VALUES ('620111200001010002', '2021-06-04', '200.00', '20.00', '100', '心脉不好', '611111198008080005', '驳回', '驳回', '2021-06-04 11:17:32');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `ID` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_sign_in` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='医生';

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('611111198008080001', '眼科', '张三', '080001', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080002', '耳鼻喉科', '李四', '080002', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080003', '口腔科', '王五', '080003', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080004', '外科', '赵六', '080004', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080005', '血压脉搏科', '钱七', '080005', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080006', '内科', '孙八', '080006', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080007', '化验科', '周九', '080007', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080008', '胸部放射科', '吴十', '080008', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080009', '其他科', '郑十一', '080009', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080010', '体检负责医师', '曾十二', '080010', '123456', '1');
INSERT INTO `doctor` VALUES ('611111198008080011', '医院领导', '陈十三', '080011', '123456', '1');

-- ----------------------------
-- Table structure for `ent_department`
-- ----------------------------
DROP TABLE IF EXISTS `ent_department`;
CREATE TABLE `ent_department` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `hearing_left` int(11) DEFAULT NULL,
  `hearing_right` int(11) DEFAULT NULL,
  `ear_illness` varchar(255) DEFAULT NULL,
  `smell_sense` varchar(255) DEFAULT NULL,
  `nose_illness` varchar(255) DEFAULT NULL,
  `throat` varchar(255) DEFAULT NULL,
  `stutter` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='耳鼻喉科';

-- ----------------------------
-- Records of ent_department
-- ----------------------------
INSERT INTO `ent_department` VALUES ('620111200001010001', '2021-06-04', '5', '5', '无', '正常', '无', '正常', '无', '正常', '611111198008080002', '通过', '通过', '2021-06-04 19:59:22');
INSERT INTO `ent_department` VALUES ('620111200001010002', '2021-06-04', '1', '3', '左耳失聪', '不正常', '鼻炎', '发炎', '有', '建议保护耳朵', '611111198008080002', '通过', '驳回', '2021-06-04 19:59:59');

-- ----------------------------
-- Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('7', 'ophthalmic', '眼科', null, null, 'Ophthalmic', 'crud', 'com.ruoyi.eye', 'eye', 'ophthalmic', '眼科', 'qpg', '0', '/', '{\"parentMenuId\":\"2025\"}', 'admin', '2021-06-10 15:50:14', '', '2021-06-10 17:10:19', null);
INSERT INTO `gen_table` VALUES ('8', 'physical_examination_form', '体检总表', null, null, 'PhysicalExaminationForm', 'crud', 'com.ruoyi.system', 'system', 'form', '体检总', 'ruoyi', '0', '/', null, 'admin', '2021-06-10 17:19:27', '', null, null);

-- ----------------------------
-- Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('73', '7', 'student_ID', '学号', 'varchar(255)', 'String', 'studentId', '1', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '1', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('74', '7', 'diagnosis_time', '体检时间', 'date', 'Date', 'diagnosisTime', '1', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '2', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('75', '7', 'sight_left_noglasses', '左视力', 'double(10,1)', 'BigDecimal', 'sightLeftNoglasses', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '3', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('76', '7', 'sight_right_noglasses', '右视力', 'double(10,1)', 'BigDecimal', 'sightRightNoglasses', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('77', '7', 'sight_left_withglasses', '左矫正视力', 'double(10,1)', 'BigDecimal', 'sightLeftWithglasses', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('78', '7', 'sight_right_withglasses', '右矫正视力', 'double(10,1)', 'BigDecimal', 'sightRightWithglasses', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '6', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('79', '7', 'eye_illness', '其他眼病', 'varchar(255)', 'String', 'eyeIllness', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '7', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('80', '7', 'color_vision_red', '红色色觉', 'tinyint(4)', 'Integer', 'colorVisionRed', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '8', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('81', '7', 'color_vision_green', '绿色色觉', 'tinyint(4)', 'Integer', 'colorVisionGreen', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '9', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('82', '7', 'color_vision_purple', '紫色色觉', 'tinyint(4)', 'Integer', 'colorVisionPurple', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '10', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('83', '7', 'color_vision_blue', '蓝色色觉', 'tinyint(4)', 'Integer', 'colorVisionBlue', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('84', '7', 'color_vision_yellow', '黄色色觉', 'tinyint(4)', 'Integer', 'colorVisionYellow', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '12', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('85', '7', 'doctor_opinion', '医生意见', 'varchar(255)', 'String', 'doctorOpinion', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '13', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('86', '7', 'doctor_ID', '医生编号', 'varchar(255)', 'String', 'doctorId', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '14', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('87', '7', 'doctor_audit', '负责医生审查', 'varchar(255)', 'String', 'doctorAudit', '0', '0', null, '1', null, '1', '1', 'EQ', 'input', '', '15', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('88', '7', 'leader_audit', '院长审查', 'varchar(255)', 'String', 'leaderAudit', '0', '0', null, '1', null, '1', '1', 'EQ', 'input', '', '16', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('89', '7', 'submit_time', '提交时间', 'datetime', 'Date', 'submitTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2021-06-10 15:50:15', '', '2021-06-10 17:10:19');
INSERT INTO `gen_table_column` VALUES ('90', '8', 'student_ID', null, 'bigint(20) unsigned zerofill', 'Long', 'studentId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('91', '8', 'inspector_time', null, 'date', 'Date', 'inspectorTime', '1', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '2', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('92', '8', 'conclusions', null, 'varchar(255)', 'String', 'conclusions', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('93', '8', 'doctor_audit', null, 'varchar(255)', 'String', 'doctorAudit', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('94', '8', 'doctor_ID', null, 'varchar(255)', 'String', 'doctorId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('95', '8', 'submit_time_doctor', null, 'datetime', 'Date', 'submitTimeDoctor', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('96', '8', 'hospital_opinion', null, 'varchar(255)', 'String', 'hospitalOpinion', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('97', '8', 'leader_audit', null, 'varchar(255)', 'String', 'leaderAudit', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('98', '8', 'leader_ID', null, 'varchar(255)', 'String', 'leaderId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2021-06-10 17:19:27', '', null);
INSERT INTO `gen_table_column` VALUES ('99', '8', 'submit_time_leader', null, 'datetime', 'Date', 'submitTimeLeader', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2021-06-10 17:19:27', '', null);

-- ----------------------------
-- Table structure for `internal_medicine`
-- ----------------------------
DROP TABLE IF EXISTS `internal_medicine`;
CREATE TABLE `internal_medicine` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `developmental_nutrition` varchar(255) DEFAULT NULL,
  `nerves_and_spirits` varchar(255) DEFAULT NULL,
  `lung_and_respiratory_tract` varchar(255) DEFAULT NULL,
  `heart_and_blood_vessels` varchar(255) DEFAULT NULL,
  `liver` varchar(255) DEFAULT NULL,
  `spleen` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内科';

-- ----------------------------
-- Records of internal_medicine
-- ----------------------------
INSERT INTO `internal_medicine` VALUES ('620111200001010001', '2021-06-04', '正常', '正常', '正常', '正常', '正常', '正常', '无特殊', '正常', '611111198008080006', '通过', '通过', '2021-06-04 11:20:58');
INSERT INTO `internal_medicine` VALUES ('620111200001010002', '2021-06-04', '营养不良', '神经衰弱', '呼吸不畅', '心脏病', '肝硬化', '脾大', '内分泌失调', '注意饮食', '611111198008080006', '通过', '驳回', '2021-06-04 11:21:01');

-- ----------------------------
-- Table structure for `laboratory`
-- ----------------------------
DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `laboratory_examination` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='化验科';

-- ----------------------------
-- Records of laboratory
-- ----------------------------
INSERT INTO `laboratory` VALUES ('620111200001010001', '2021-06-04', '肝功（ALT，AKP，TB，DB）、血常规主要指标检测值在正常范围', '正常', '611111198008080007', '通过', '通过', '2021-06-04 11:27:32');
INSERT INTO `laboratory` VALUES ('620111200001010002', '2021-06-04', 'ALT不正常，血红蛋白较高', '清淡饮食', '611111198008080007', '通过', '驳回', '2021-06-04 11:29:35');

-- ----------------------------
-- Table structure for `ophthalmic`
-- ----------------------------
DROP TABLE IF EXISTS `ophthalmic`;
CREATE TABLE `ophthalmic` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `sight_left_noglasses` double(10,1) DEFAULT NULL,
  `sight_right_noglasses` double(10,1) DEFAULT NULL,
  `sight_left_withglasses` double(10,1) DEFAULT NULL,
  `sight_right_withglasses` double(10,1) DEFAULT NULL,
  `eye_illness` varchar(255) DEFAULT NULL,
  `color_vision_red` tinyint(4) DEFAULT NULL,
  `color_vision_green` tinyint(4) DEFAULT NULL,
  `color_vision_purple` tinyint(4) DEFAULT NULL,
  `color_vision_blue` tinyint(4) DEFAULT NULL,
  `color_vision_yellow` tinyint(4) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='眼科';

-- ----------------------------
-- Records of ophthalmic
-- ----------------------------
INSERT INTO `ophthalmic` VALUES ('620111200001010001', '2021-06-04', '5.0', '5.0', '5.0', '5.0', '无', '1', '1', '1', '1', '1', '正常', '611111198008080001', '通过', '通过', '2021-06-04 17:36:34');
INSERT INTO `ophthalmic` VALUES ('620111200001010002', '2021-06-04', '6.6', '4.7', '5.0', '5.0', '青光眼', '0', '0', '0', '0', '0', '保护眼睛', '611111198008080001', '驳回', '驳回', '2021-06-04 17:39:10');

-- ----------------------------
-- Table structure for `other`
-- ----------------------------
DROP TABLE IF EXISTS `other`;
CREATE TABLE `other` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `other_examination` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='其他科';

-- ----------------------------
-- Records of other
-- ----------------------------
INSERT INTO `other` VALUES ('620111200001010001', '2021-06-04', '无', '无', '611111198008080009', '通过', '通过', '2021-06-04 11:38:03');
INSERT INTO `other` VALUES ('620111200001010002', '2021-06-04', '无', '无', '611111198008080009', '通过', '驳回', '2021-06-04 11:39:03');

-- ----------------------------
-- Table structure for `physical_examination_form`
-- ----------------------------
DROP TABLE IF EXISTS `physical_examination_form`;
CREATE TABLE `physical_examination_form` (
  `student_ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `inspector_time` date NOT NULL,
  `conclusions` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `submit_time_doctor` datetime DEFAULT NULL,
  `hospital_opinion` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `leader_ID` varchar(255) DEFAULT NULL,
  `submit_time_leader` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`inspector_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=620111200001010003 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='体检总表';

-- ----------------------------
-- Records of physical_examination_form
-- ----------------------------
INSERT INTO `physical_examination_form` VALUES ('00620111200001010001', '2021-06-04', '体检所检项目未见重大异常', '通过', '61111100002', '2021-06-04 15:28:55', '体检结果符合相关健康要求', '通过', '61111100001', '2021-06-04 15:28:44');
INSERT INTO `physical_examination_form` VALUES ('00620111200001010002', '2021-06-04', '体检所检项目异常较多', '驳回', '61111100002', '2021-06-04 15:28:57', '体检结果极其不健康', '驳回', '61111100001', '2021-06-04 15:28:47');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `calendar_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `cron_expression` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `entry_id` varchar(95) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_name` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `job_group` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `job_class_name` varchar(250) COLLATE utf8_unicode_520_ci NOT NULL,
  `is_durable` varchar(1) COLLATE utf8_unicode_520_ci NOT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_520_ci NOT NULL,
  `is_update_data` varchar(1) COLLATE utf8_unicode_520_ci NOT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179EEB27F5078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179EEB27F5078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179EEB27F5078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `lock_name` varchar(40) COLLATE utf8_unicode_520_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-LA68USS01623805788679', '1623814071596', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `str_prop_1` varchar(512) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `str_prop_2` varchar(512) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `str_prop_3` varchar(512) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_name` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `job_group` varchar(200) COLLATE utf8_unicode_520_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) COLLATE utf8_unicode_520_ci NOT NULL,
  `trigger_type` varchar(8) COLLATE utf8_unicode_520_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1623805790000', '-1', '5', 'PAUSED', 'CRON', '1623805788000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1623805800000', '-1', '5', 'PAUSED', 'CRON', '1623805788000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1623805800000', '-1', '5', 'PAUSED', 'CRON', '1623805788000', '0', null, '2', '');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `college` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `classroom` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `degree_of_education` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `native_place` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `draduation_school_or_work_unit` varchar(255) DEFAULT NULL,
  `past_medical_history` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=620111200002020003 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='学生';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('00620111200001010001', '软件学院', '软件工程', '行政一班', '208111321', '小姐姐', '0', '2000-01-01', '21', '大学', '汉族', '学生', '四川成都', '川大路二段', '四川大学', '无');
INSERT INTO `student` VALUES ('00620111200002020002', '互联网学院', '信息工程', '行政二班', '245654652', '小哥哥', '1', '2000-02-02', '21', '大学', '汉族', '学生', '重庆渝北', '渝北区', '重庆大学', '无');

-- ----------------------------
-- Table structure for `surgery`
-- ----------------------------
DROP TABLE IF EXISTS `surgery`;
CREATE TABLE `surgery` (
  `student_ID` varchar(255) NOT NULL,
  `diagnosis_time` date NOT NULL,
  `height` double(10,2) DEFAULT NULL,
  `waist` double(10,2) DEFAULT NULL,
  `weight` double(10,2) DEFAULT NULL,
  `skin` varchar(255) DEFAULT NULL,
  `lymph` varchar(255) DEFAULT NULL,
  `thyroid` varchar(255) DEFAULT NULL,
  `spine` varchar(255) DEFAULT NULL,
  `limb` varchar(255) DEFAULT NULL,
  `joint` varchar(255) DEFAULT NULL,
  `flat_feet` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `doctor_opinion` varchar(255) DEFAULT NULL,
  `doctor_ID` varchar(255) DEFAULT NULL,
  `doctor_audit` varchar(255) DEFAULT NULL,
  `leader_audit` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`diagnosis_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='外科';

-- ----------------------------
-- Records of surgery
-- ----------------------------
INSERT INTO `surgery` VALUES ('620111200001010001', '2021-06-04', '175.70', '50.50', '130.00', '正常', '未触及', '正常', '正常', '正常', '正常', '无', '无', '正常', '611111198008080004', '通过', '通过', '2021-06-04 09:30:27');
INSERT INTO `surgery` VALUES ('620111200001010002', '2021-06-04', '168.00', '50.00', '100.00', '皮肤炎', '发炎', '发炎', '发炎', '短小', '损伤', '有', '身体不协调', '锻炼身体', '611111198008080004', '通过', '驳回', '2021-06-04 09:34:40');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_unicode_520_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-06-09 10:55:46', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-06-09 10:55:46', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-06-09 10:55:46', '', null, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '重庆交通大学体检中心', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:11:53');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '眼科', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:24');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '化验科', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:12');
INSERT INTO `sys_dept` VALUES ('103', '100', '0,100', '耳鼻喉', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:20');
INSERT INTO `sys_dept` VALUES ('104', '100', '0,100', '外科', '6', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:09');
INSERT INTO `sys_dept` VALUES ('105', '100', '0,100', '口腔科', '8', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:02');
INSERT INTO `sys_dept` VALUES ('106', '100', '0,100', '内科', '9', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:11:59');
INSERT INTO `sys_dept` VALUES ('107', '100', '0,100', '血压脉搏科', '10', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:11:56');
INSERT INTO `sys_dept` VALUES ('108', '100', '0,100', '胸部放射科', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:16');
INSERT INTO `sys_dept` VALUES ('109', '100', '0,100', '其他科', '7', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:12:05');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_unicode_520_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-06-09 10:55:46', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-06-09 10:55:46', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('29', '0', '通过', '1', 'sys_pass', null, null, 'N', '0', 'admin', '2021-06-10 16:12:21', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '1', '驳回', '0', 'sys_pass', null, null, 'N', '0', 'admin', '2021-06-10 16:12:31', '', null, null);

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2021-06-09 10:55:46', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2021-06-09 10:55:46', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2021-06-09 10:55:46', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2021-06-09 10:55:46', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2021-06-09 10:55:46', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2021-06-09 10:55:46', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2021-06-09 10:55:46', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2021-06-09 10:55:46', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2021-06-09 10:55:46', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2021-06-09 10:55:46', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '驳回状态', 'sys_pass', '0', 'admin', '2021-06-10 16:11:36', '', null, null);

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_unicode_520_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_520_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_unicode_520_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_unicode_520_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-06-09 10:55:46', '', null, '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-09 11:08:19');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-09 11:10:08');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 11:10:12');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-09 11:10:21');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 11:11:37');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 14:28:21');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 15:27:32');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-09 15:37:57');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 15:38:01');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-09 17:29:13');
INSERT INTO `sys_logininfor` VALUES ('110', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 17:29:20');
INSERT INTO `sys_logininfor` VALUES ('111', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-09 17:29:28');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-09 17:29:34');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 09:14:08');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 14:40:21');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:36:56');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:37:04');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:37:07');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:38:55');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:39:07');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:40:52');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:40:58');
INSERT INTO `sys_logininfor` VALUES ('122', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-10 16:41:07');
INSERT INTO `sys_logininfor` VALUES ('123', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:41:10');
INSERT INTO `sys_logininfor` VALUES ('124', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:41:16');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:41:39');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:42:47');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-10 16:42:51');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-06-10 16:42:54');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:42:57');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:47:50');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:47:53');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:49:06');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:49:09');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:58:53');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-10 16:59:51');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 16:59:54');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:13:35');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 17:15:19');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-10 19:50:11');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 09:32:24');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-06-11 11:29:57');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 11:30:00');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 14:06:08');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 14:39:38');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-06-11 16:55:18');
INSERT INTO `sys_logininfor` VALUES ('146', 'zly', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-06-15 09:47:08');
INSERT INTO `sys_logininfor` VALUES ('147', 'zly', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-06-15 09:47:13');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 09:51:17');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-15 09:58:42');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-06-15 10:38:17');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 10:38:21');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-15 10:42:06');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-06-15 10:42:47');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 10:42:52');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-15 10:45:54');
INSERT INTO `sys_logininfor` VALUES ('156', '曾琳渊', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 10:46:13');
INSERT INTO `sys_logininfor` VALUES ('157', '曾琳渊', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-15 10:54:24');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 10:54:38');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-06-15 14:08:51');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 14:08:55');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 16:08:48');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 17:06:25');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-15 19:44:47');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-16 09:10:07');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-16 09:15:19');
INSERT INTO `sys_logininfor` VALUES ('166', '曾琳渊', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-06-16 09:15:30');
INSERT INTO `sys_logininfor` VALUES ('167', '曾琳渊', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-16 09:15:36');
INSERT INTO `sys_logininfor` VALUES ('168', '曾琳渊', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-16 09:16:11');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-16 09:16:22');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-16 10:54:05');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '医院管理', '0', '1', 'system', null, '1', '0', 'M', '0', '0', '', 'system', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 15:06:10', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2021-06-09 10:55:46', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '医生管理', '1', '1', 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 11:46:46', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-06-09 10:55:46', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-06-09 10:55:46', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-06-09 10:55:46', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-06-10 09:30:17', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-06-09 10:55:46', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-06-09 10:55:46', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2021-06-09 10:55:46', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-06-09 10:55:46', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-06-09 10:55:46', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-06-09 10:55:46', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-06-09 10:55:46', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-06-09 10:55:46', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-06-09 10:55:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '学生信息管理', '0', '2', 'student', null, '1', '0', 'M', '0', '0', '', 'people', 'admin', '2021-06-09 16:03:25', 'admin', '2021-06-10 15:43:55', '');
INSERT INTO `sys_menu` VALUES ('2017', '学生', '2016', '1', 'student', 'student/student/index', '1', '0', 'C', '0', '0', 'student:student:list', '#', 'admin', '2021-06-09 16:06:00', '', null, '学生菜单');
INSERT INTO `sys_menu` VALUES ('2018', '学生查询', '2017', '1', '#', '', '1', '0', 'F', '0', '0', 'student:student:query', '#', 'admin', '2021-06-09 16:06:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '学生新增', '2017', '2', '#', '', '1', '0', 'F', '0', '0', 'student:student:add', '#', 'admin', '2021-06-09 16:06:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '学生修改', '2017', '3', '#', '', '1', '0', 'F', '0', '0', 'student:student:edit', '#', 'admin', '2021-06-09 16:06:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '学生删除', '2017', '4', '#', '', '1', '0', 'F', '0', '0', 'student:student:remove', '#', 'admin', '2021-06-09 16:06:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '学生导出', '2017', '5', '#', '', '1', '0', 'F', '0', '0', 'student:student:export', '#', 'admin', '2021-06-09 16:06:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '眼科体检', '0', '4', 'eye', null, '1', '0', 'M', '0', '0', '', 'eye-open', 'admin', '2021-06-10 09:42:44', 'admin', '2021-06-10 16:31:20', '');
INSERT INTO `sys_menu` VALUES ('2027', '体检信息确认-院长', '0', '10', 'leader', null, '1', '0', 'M', '0', '0', '', 'form', 'admin', '2021-06-10 10:11:11', 'admin', '2021-06-10 19:59:43', '');
INSERT INTO `sys_menu` VALUES ('2028', '体检表管理', '0', '3', 'health', null, '1', '0', 'M', '0', '0', '', 'table', 'admin', '2021-06-10 11:49:57', 'admin', '2021-06-10 15:44:01', '');
INSERT INTO `sys_menu` VALUES ('2035', '体检信息', '2028', '1', 'form', 'health/form/index', '1', '0', 'C', '0', '0', 'health:form:list', '#', 'admin', '2021-06-10 14:45:12', 'admin', '2021-06-10 15:14:22', '体检总菜单');
INSERT INTO `sys_menu` VALUES ('2036', '体检总查询', '2035', '1', '#', '', '1', '0', 'F', '0', '0', 'health:form:query', '#', 'admin', '2021-06-10 14:45:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2037', '体检总新增', '2035', '2', '#', '', '1', '0', 'F', '0', '0', 'health:form:add', '#', 'admin', '2021-06-10 14:45:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2038', '体检总修改', '2035', '3', '#', '', '1', '0', 'F', '0', '0', 'health:form:edit', '#', 'admin', '2021-06-10 14:45:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2039', '体检总删除', '2035', '4', '#', '', '1', '0', 'F', '0', '0', 'health:form:remove', '#', 'admin', '2021-06-10 14:45:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2040', '体检总导出', '2035', '5', '#', '', '1', '0', 'F', '0', '0', 'health:form:export', '#', 'admin', '2021-06-10 14:45:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '外科体检', '0', '5', 'surgery', null, '1', '0', 'M', '0', '0', '', 'user', 'admin', '2021-06-10 15:43:35', 'admin', '2021-06-10 15:44:08', '');
INSERT INTO `sys_menu` VALUES ('2073', '驳回处理', '2025', '2', 'ophthalmic_reject', 'department/eye/ophthalmic/reject', '1', '0', 'C', '0', '0', 'eye:ophthalmic_reject:list', 'log', 'admin', '2021-06-10 17:11:12', 'admin', '2021-06-15 17:40:04', '眼科菜单');
INSERT INTO `sys_menu` VALUES ('2074', '眼科查询', '2073', '1', '#', '', '1', '0', 'F', '0', '0', 'eye:ophthalmic:query', '#', 'admin', '2021-06-10 17:11:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2075', '眼科新增', '2073', '2', '#', '', '1', '0', 'F', '0', '0', 'eye:ophthalmic:add', '#', 'admin', '2021-06-10 17:11:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2076', '眼科修改', '2073', '3', '#', '', '1', '0', 'F', '0', '0', 'eye:ophthalmic:edit', '#', 'admin', '2021-06-10 17:11:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2077', '眼科删除', '2073', '4', '#', '', '1', '0', 'F', '0', '0', 'eye:ophthalmic:remove', '#', 'admin', '2021-06-10 17:11:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2078', '眼科导出', '2073', '5', '#', '', '1', '0', 'F', '0', '0', 'eye:ophthalmic:export', '#', 'admin', '2021-06-10 17:11:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2080', '审查', '2027', '1', 'leader', 'leader/leader/index', '1', '0', 'C', '0', '0', 'leader:leader:list', 'button', 'admin', '2021-06-10 20:00:40', '', null, '');
INSERT INTO `sys_menu` VALUES ('2081', '眼科信息录入', '2025', '1', 'ophthalmic_input', 'department/input', '1', '0', 'C', '0', '0', 'eye:ophthalmic_input:list', 'log', 'admin', '2021-06-15 12:02:30', 'admin', '2021-06-15 17:40:57', '');
INSERT INTO `sys_menu` VALUES ('2082', '提交', '2081', '1', '', null, '1', '0', 'F', '0', '0', 'ophthalmic:student', '#', 'admin', '2021-06-15 14:28:37', 'admin', '2021-06-15 14:28:50', '');
INSERT INTO `sys_menu` VALUES ('2083', '信息录入', '2082', '1', 'ophthalmic/exam_input', 'eye/ophthalmic/exam_input', '1', '0', 'C', '0', '0', 'ophthalmic:exam_input', 'build', 'admin', '2021-06-15 15:23:37', 'admin', '2021-06-15 15:26:11', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-06-09 10:55:46', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-06-09 10:55:46', '', null, '管理员');

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'doctor', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 10:59:23');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-09 10:59:25');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"医生信息管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"doctor\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 11:02:37');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 11:02:55');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"医生信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"doctor\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 11:03:17');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"信息管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"doctor\",\"component\":\"doctor/doctor/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"doctor:doctor:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 11:03:58');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-06-09 11:27:58');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-06-09 14:45:55');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/113', '127.0.0.1', '内网IP', '{menuId=113}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-06-09 14:46:04');
INSERT INTO `sys_oper_log` VALUES ('109', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"menuIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-09 14:50:18');
INSERT INTO `sys_oper_log` VALUES ('110', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 14:50:26');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 14:50:44');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:27:47');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623207563000,\"tableId\":1,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"Department\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"department\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623207563000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"department\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623207563000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"UserAccount\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userAccount\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623207563000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"user_account\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:29:06');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"0\",\"menuName\":\"医生信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"doctor\",\"children\":[],\"createTime\":1623207797000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:30:19');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1623223746000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623207563000,\"tableId\":1,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"Department\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"department\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623223746000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623207563000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"department\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623223746000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623207563000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"UserAccount\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userAccount\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623223746000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:31:24');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-09 15:31:53');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-06-09 15:53:18');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:24');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:26');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:28');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:30');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:33');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:53:34');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'student', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:55:31');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"学生信息管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"student\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 15:56:02');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"学生信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"student\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:03:25');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:03:55');
INSERT INTO `sys_oper_log` VALUES ('128', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":7,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623225331000,\"tableId\":2,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"College\",\"usableColumn\":false,\"columnId\":8,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"college\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"college\"},{\"capJavaField\":\"Major\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"major\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"major\"},{\"capJavaField\":\"Class\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"class\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"class\"},{\"capJavaField\":\"StudentI', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:04:54');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-09 16:04:57');
INSERT INTO `sys_oper_log` VALUES ('130', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":7,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1623225894000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623225331000,\"tableId\":2,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"College\",\"usableColumn\":false,\"columnId\":8,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"college\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623225894000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"college\"},{\"capJavaField\":\"Major\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"major\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623225894000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"major\"},{\"capJavaField\":\"Class\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"class\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623225894000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:16:07');
INSERT INTO `sys_oper_log` VALUES ('131', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":7,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1623226567000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623225331000,\"tableId\":2,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"College\",\"usableColumn\":false,\"columnId\":8,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"college\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623226567000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"college\"},{\"capJavaField\":\"Major\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"major\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623226567000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623225331000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"major\"},{\"capJavaField\":\"Class\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"class\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623226567000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:18:01');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-09 16:18:04');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:22:15');
INSERT INTO `sys_oper_log` VALUES ('134', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'student', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:22:52');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623226972000,\"tableId\":3,\"pk\":true,\"columnName\":\"ID\"},{\"capJavaField\":\"College\",\"usableColumn\":false,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"college\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623226972000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"college\"},{\"capJavaField\":\"Major\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"major\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623226972000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"major\"},{\"capJavaField\":\"Classroom\",\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"classroom\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623226972000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"classroom\"},{\"capJavaF', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:23:20');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-09 16:23:21');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:16');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:19');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:21');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:24');
INSERT INTO `sys_oper_log` VALUES ('141', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:26');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:49:29');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/113', '127.0.0.1', '内网IP', '{menuId=113}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:00');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/112', '127.0.0.1', '内网IP', '{menuId=112}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:02');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:22');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-06-09 16:50:24');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2040', '127.0.0.1', '内网IP', '{menuId=2040}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:39');
INSERT INTO `sys_oper_log` VALUES ('148', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2038', '127.0.0.1', '内网IP', '{menuId=2038}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:41');
INSERT INTO `sys_oper_log` VALUES ('149', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-06-09 16:50:44');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:46');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:48');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:53');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:50:55');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:01');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:03');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:05');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:07');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:09');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:51:11');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'doctor', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 16:59:46');
INSERT INTO `sys_oper_log` VALUES ('161', '部门管理', '3', 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', '0', null, '2021-06-09 17:05:02');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2015', '127.0.0.1', '内网IP', '{menuId=2015}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:06:51');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/107', '127.0.0.1', '内网IP', '{menuId=107}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-06-09 17:06:55');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1036', '127.0.0.1', '内网IP', '{menuId=1036}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:07:00');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1037', '127.0.0.1', '内网IP', '{menuId=1037}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:07:02');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1038', '127.0.0.1', '内网IP', '{menuId=1038}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:07:04');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1039', '127.0.0.1', '内网IP', '{menuId=1039}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:07:06');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/107', '127.0.0.1', '内网IP', '{menuId=107}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:07:50');
INSERT INTO `sys_oper_log` VALUES ('169', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"重庆交通大学附属医院\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:08:46');
INSERT INTO `sys_oper_log` VALUES ('170', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"体检中心\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:09:00');
INSERT INTO `sys_oper_log` VALUES ('171', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:09:16');
INSERT INTO `sys_oper_log` VALUES ('172', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"眼科\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:09:29');
INSERT INTO `sys_oper_log` VALUES ('173', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:15:40');
INSERT INTO `sys_oper_log` VALUES ('174', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:15:52');
INSERT INTO `sys_oper_log` VALUES ('175', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"外科\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:16:11');
INSERT INTO `sys_oper_log` VALUES ('176', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"内科\",\"leader\":\"若依\",\"deptId\":106,\"orderNum\":\"4\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:16:23');
INSERT INTO `sys_oper_log` VALUES ('177', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"血压脉搏科\",\"leader\":\"若依\",\"deptId\":107,\"orderNum\":\"5\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:16:46');
INSERT INTO `sys_oper_log` VALUES ('178', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"内科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'内科\'失败，部门名称已存在\",\"code\":500}', '0', null, '2021-06-09 17:17:00');
INSERT INTO `sys_oper_log` VALUES ('179', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:17:16');
INSERT INTO `sys_oper_log` VALUES ('180', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"胸部放射科\",\"leader\":\"若依\",\"deptId\":108,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:17:35');
INSERT INTO `sys_oper_log` VALUES ('181', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"其他科\",\"leader\":\"若依\",\"deptId\":109,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:18:05');
INSERT INTO `sys_oper_log` VALUES ('182', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[100,101],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:20:21');
INSERT INTO `sys_oper_log` VALUES ('183', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1021', '127.0.0.1', '内网IP', '{menuId=1021}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:28');
INSERT INTO `sys_oper_log` VALUES ('184', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1023', '127.0.0.1', '内网IP', '{menuId=1023}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:31');
INSERT INTO `sys_oper_log` VALUES ('185', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1025', '127.0.0.1', '内网IP', '{menuId=1025}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:33');
INSERT INTO `sys_oper_log` VALUES ('186', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1022', '127.0.0.1', '内网IP', '{menuId=1022}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:35');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1024', '127.0.0.1', '内网IP', '{menuId=1024}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:39');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/104', '127.0.0.1', '内网IP', '{menuId=104}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:22:42');
INSERT INTO `sys_oper_log` VALUES ('189', '字典类型', '3', 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/system/dict/type/8', '127.0.0.1', '内网IP', '{dictIds=8}', 'null', '1', '通知状态已分配,不能删除', '2021-06-09 17:23:06');
INSERT INTO `sys_oper_log` VALUES ('190', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-09 17:23:23');
INSERT INTO `sys_oper_log` VALUES ('191', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-09 17:23:25');
INSERT INTO `sys_oper_log` VALUES ('192', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2007,2009,2010,2011,2012,2013,2014],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:24:22');
INSERT INTO `sys_oper_log` VALUES ('193', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[100,101,102],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:27:54');
INSERT INTO `sys_oper_log` VALUES ('194', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[100,101],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-09 17:35:54');
INSERT INTO `sys_oper_log` VALUES ('195', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$BxiAK8v16IbJSJMXvSN6quVPkrI9cRWfIhYGh9es1fx3iATbex6k2\",\"postIds\":[],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:20');
INSERT INTO `sys_oper_log` VALUES ('196', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$GZsgiWXzMcwFQOtOCSdtjeNOZGDctmWe7WHbO9FebGIfUxFYcRGg2\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:25');
INSERT INTO `sys_oper_log` VALUES ('197', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$JrUr9EMKwpszQ6lH6.GBfOGhKIqlTBDB.4pqIBILiYHO7wV1iD.Se\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:25');
INSERT INTO `sys_oper_log` VALUES ('198', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$XnnBaiXzkgoFjDLJ0rkXJO8oynm3Bu3XlaA2jqDhBlt4du6iYpdk2\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:26');
INSERT INTO `sys_oper_log` VALUES ('199', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$oT4aU3P0.puKCu0WwgZ1HOSQo//0o21VPwYF6uPC52aibJjVTAeyy\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:27');
INSERT INTO `sys_oper_log` VALUES ('200', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$WwQ81O6AOoXKZjefkHAl7OKoVRebrvqNXYNnAc0w56Gl/Kw6ibmey\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:27');
INSERT INTO `sys_oper_log` VALUES ('201', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"13076015828\",\"admin\":false,\"password\":\"$2a$10$BOLbleX.K4Q2mNhJ/0QGru7U/fqdGGTdULYmN/IY40XVKX.t0EJkm\",\"postIds\":[2],\"email\":\"20702337@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"阿萨德\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-09 17:50:27');
INSERT INTO `sys_oper_log` VALUES ('202', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623230975000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1623207346000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-06-09 18:05:44');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"component\",\"orderNum\":\"3\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":100,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:16:51');
INSERT INTO `sys_oper_log` VALUES ('204', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$77REcJxUhnnXBsrS.Eqk8O1H.0lHYIQudaxkB4dOUajJidNIHtkrC\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-10 09:18:41');
INSERT INTO `sys_oper_log` VALUES ('205', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$.IPFqwUUUhI4S/9EPQbgCOSlMqpImmd4YbtEu2LnacpeJpvdo7F2u\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-10 09:18:44');
INSERT INTO `sys_oper_log` VALUES ('206', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$XW/YKToH3iPiCmz4b9OZyejjo0nej5Q9HXGu47hKT61FKjbjha9Ki\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-10 09:18:48');
INSERT INTO `sys_oper_log` VALUES ('207', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$ygFi/dOfUwwvJo7uUk3Y4eOlI10r8CuFPAoLOzFFtFj8gmHGUQiEe\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-10 09:18:52');
INSERT INTO `sys_oper_log` VALUES ('208', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$4cz.ptbYIqifj2uIRbFt8uainFbJOXIHDxNXJBe7dU87J3AmwaPQW\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2021-06-10 09:18:56');
INSERT INTO `sys_oper_log` VALUES ('209', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15915864563\",\"admin\":false,\"password\":\"$2a$10$GZFAHvLdKEh9VmDxmbSN6u6VWJbBnWJMT.e3Bl8Qh0DBBmUBpHU3W\",\"postIds\":[2],\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"zhangsan\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:19:36');
INSERT INTO `sys_oper_log` VALUES ('210', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:20:28');
INSERT INTO `sys_oper_log` VALUES ('211', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":102,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:21:30');
INSERT INTO `sys_oper_log` VALUES ('212', '医生', '1', 'com.ruoyi.exam.controller.DoctorController.add()', 'POST', '1', 'admin', null, '/exam/doctor', '127.0.0.1', '内网IP', '{\"params\":{},\"password\":\"sadsad\",\"userAccount\":\"sad\",\"name\":\"sad\",\"department\":\"wqsda\",\"firstSignIn\":1}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\exam\\DoctorMapper.xml]\r\n### The error may involve com.ruoyi.exam.mapper.DoctorMapper.insertDoctor-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into doctor          ( department,             name,             user_account,             password,             first_sign_in )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2021-06-10 09:23:46');
INSERT INTO `sys_oper_log` VALUES ('213', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1623207346000,\"updateBy\":\"admin\",\"postName\":\"院长\",\"postCode\":\"dean\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:35:35');
INSERT INTO `sys_oper_log` VALUES ('214', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"\",\"postId\":2,\"params\":{},\"createBy\":\"admin\",\"createTime\":1623207346000,\"updateBy\":\"admin\",\"postName\":\"体检负责医生\",\"postCode\":\"Physician\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:39:10');
INSERT INTO `sys_oper_log` VALUES ('215', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"3\",\"flag\":false,\"remark\":\"\",\"postId\":3,\"params\":{},\"createBy\":\"admin\",\"createTime\":1623207346000,\"updateBy\":\"admin\",\"postName\":\"科长\",\"postCode\":\"section chief\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:39:29');
INSERT INTO `sys_oper_log` VALUES ('216', '岗位管理', '2', 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', '1', 'admin', null, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"4\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1623207346000,\"updateBy\":\"admin\",\"postName\":\"医生\",\"postCode\":\"doctor\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:39:46');
INSERT INTO `sys_oper_log` VALUES ('217', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"体检信息录入\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"medical\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 09:42:44');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"0\",\"menuName\":\"驳回体检表查询\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"eye\",\"component\":\"medical/eye/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"medical:eye:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:08:23');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"3\",\"menuName\":\"眼科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"eyes\",\"children\":[],\"createTime\":1623289364000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:08:57');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"0\",\"menuName\":\"驳回体检表查询\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"eye\",\"component\":\"eye/eye/index\",\"children\":[],\"createTime\":1623290903000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"eye:eye:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:09:19');
INSERT INTO `sys_oper_log` VALUES ('221', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"3\",\"menuName\":\"眼科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"eye\",\"children\":[],\"createTime\":1623289364000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:09:23');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"4\",\"menuName\":\"体检信息确认-院长\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dean\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:11:11');
INSERT INTO `sys_oper_log` VALUES ('223', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"otolaryngology\",\"roleName\":\"耳鼻喉\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:33:30');
INSERT INTO `sys_oper_log` VALUES ('224', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"menuIds\":[2025,2026],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:33:45');
INSERT INTO `sys_oper_log` VALUES ('225', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1623292410000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"otolaryngology\",\"roleName\":\"耳鼻喉\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:33:55');
INSERT INTO `sys_oper_log` VALUES ('226', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Chest radiology department\",\"roleName\":\"胸部放射科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:34:24');
INSERT INTO `sys_oper_log` VALUES ('227', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"dean\",\"roleName\":\"院长\",\"menuIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-10 10:34:45');
INSERT INTO `sys_oper_log` VALUES ('228', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":5,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Test section\",\"roleName\":\"化验科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:43:59');
INSERT INTO `sys_oper_log` VALUES ('229', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":6,\"admin\":false,\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"surgery\",\"roleName\":\"外科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:45:09');
INSERT INTO `sys_oper_log` VALUES ('230', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":7,\"admin\":false,\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"other\",\"roleName\":\"其他科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:57:17');
INSERT INTO `sys_oper_log` VALUES ('231', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":7,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"7\",\"deptCheckStrictly\":true,\"createTime\":1623293837000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"other\",\"roleName\":\"其他科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:57:27');
INSERT INTO `sys_oper_log` VALUES ('232', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":8,\"admin\":false,\"params\":{},\"roleSort\":\"8\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"oral\",\"roleName\":\"口腔科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:57:54');
INSERT INTO `sys_oper_log` VALUES ('233', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":9,\"admin\":false,\"params\":{},\"roleSort\":\"8\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Internal medicine\",\"roleName\":\"内科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:58:48');
INSERT INTO `sys_oper_log` VALUES ('234', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":10,\"admin\":false,\"params\":{},\"roleSort\":\"9\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Blood pressure pulse\",\"roleName\":\"血压脉搏科\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:59:11');
INSERT INTO `sys_oper_log` VALUES ('235', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":9,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"9\",\"deptCheckStrictly\":true,\"createTime\":1623293928000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Internal medicine\",\"roleName\":\"内科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:59:23');
INSERT INTO `sys_oper_log` VALUES ('236', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":10,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"10\",\"deptCheckStrictly\":true,\"createTime\":1623293951000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"Blood pressure pulse\",\"roleName\":\"血压脉搏科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 10:59:29');
INSERT INTO `sys_oper_log` VALUES ('237', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"3\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1623292410000,\"menuCheckStrictly\":true,\"roleKey\":\"otolaryngology\",\"roleName\":\"耳鼻喉\",\"deptIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:08');
INSERT INTO `sys_oper_log` VALUES ('238', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"deptIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:17');
INSERT INTO `sys_oper_log` VALUES ('239', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1623292464000,\"menuCheckStrictly\":true,\"roleKey\":\"Chest radiology department\",\"roleName\":\"胸部放射科\",\"deptIds\":[100,108],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:25');
INSERT INTO `sys_oper_log` VALUES ('240', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1623292410000,\"menuCheckStrictly\":true,\"roleKey\":\"otolaryngology\",\"roleName\":\"耳鼻喉\",\"deptIds\":[100,103],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:35');
INSERT INTO `sys_oper_log` VALUES ('241', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"deptIds\":[100,101],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:40');
INSERT INTO `sys_oper_log` VALUES ('242', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":5,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createTime\":1623293039000,\"menuCheckStrictly\":true,\"roleKey\":\"Test section\",\"roleName\":\"化验科\",\"deptIds\":[100,102],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:51');
INSERT INTO `sys_oper_log` VALUES ('243', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":6,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createTime\":1623293109000,\"menuCheckStrictly\":true,\"roleKey\":\"surgery\",\"roleName\":\"外科\",\"deptIds\":[100,104],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:00:56');
INSERT INTO `sys_oper_log` VALUES ('244', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":7,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"7\",\"deptCheckStrictly\":true,\"createTime\":1623293837000,\"menuCheckStrictly\":true,\"roleKey\":\"other\",\"roleName\":\"其他科\",\"deptIds\":[100,109],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:01:02');
INSERT INTO `sys_oper_log` VALUES ('245', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":8,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"8\",\"deptCheckStrictly\":true,\"createTime\":1623293874000,\"menuCheckStrictly\":true,\"roleKey\":\"oral\",\"roleName\":\"口腔科\",\"deptIds\":[100,105],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:01:08');
INSERT INTO `sys_oper_log` VALUES ('246', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":9,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"9\",\"deptCheckStrictly\":true,\"createTime\":1623293928000,\"menuCheckStrictly\":true,\"roleKey\":\"Internal medicine\",\"roleName\":\"内科\",\"deptIds\":[100,106],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:01:14');
INSERT INTO `sys_oper_log` VALUES ('247', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":10,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"10\",\"deptCheckStrictly\":true,\"createTime\":1623293951000,\"menuCheckStrictly\":true,\"roleKey\":\"Blood pressure pulse\",\"roleName\":\"血压脉搏科\",\"deptIds\":[100,107],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:01:19');
INSERT INTO `sys_oper_log` VALUES ('248', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:02:15');
INSERT INTO `sys_oper_log` VALUES ('249', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"status\":\"0\"}],\"phonenumber\":\"15915864563\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[3],\"loginIp\":\"\",\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"avatar\":\"\",\"dept\":{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623287976000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:02:43');
INSERT INTO `sys_oper_log` VALUES ('250', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"status\":\"0\"}],\"phonenumber\":\"15915864563\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[3],\"loginIp\":\"\",\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"avatar\":\"\",\"dept\":{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[5],\"createTime\":1623287976000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:03:01');
INSERT INTO `sys_oper_log` VALUES ('251', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"menuIds\":[2025,2026],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:08:32');
INSERT INTO `sys_oper_log` VALUES ('252', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:08:48');
INSERT INTO `sys_oper_log` VALUES ('253', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"胸部放射科\",\"leader\":\"若依\",\"deptId\":108,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:08:54');
INSERT INTO `sys_oper_log` VALUES ('254', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:09:08');
INSERT INTO `sys_oper_log` VALUES ('255', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"4\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:09:48');
INSERT INTO `sys_oper_log` VALUES ('256', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"外科\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"5\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:10:00');
INSERT INTO `sys_oper_log` VALUES ('257', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"其他科\",\"leader\":\"若依\",\"deptId\":109,\"orderNum\":\"6\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:10:09');
INSERT INTO `sys_oper_log` VALUES ('258', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"7\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:10:49');
INSERT INTO `sys_oper_log` VALUES ('259', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"内科\",\"leader\":\"若依\",\"deptId\":106,\"orderNum\":\"8\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:11:01');
INSERT INTO `sys_oper_log` VALUES ('260', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"血压脉搏科\",\"leader\":\"若依\",\"deptId\":107,\"orderNum\":\"9\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:11:07');
INSERT INTO `sys_oper_log` VALUES ('261', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"menuIds\":[],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-10 11:11:40');
INSERT INTO `sys_oper_log` VALUES ('262', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:11:53');
INSERT INTO `sys_oper_log` VALUES ('263', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"血压脉搏科\",\"leader\":\"若依\",\"deptId\":107,\"orderNum\":\"10\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:11:56');
INSERT INTO `sys_oper_log` VALUES ('264', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"内科\",\"leader\":\"若依\",\"deptId\":106,\"orderNum\":\"9\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:11:59');
INSERT INTO `sys_oper_log` VALUES ('265', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"8\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:02');
INSERT INTO `sys_oper_log` VALUES ('266', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"其他科\",\"leader\":\"若依\",\"deptId\":109,\"orderNum\":\"7\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:05');
INSERT INTO `sys_oper_log` VALUES ('267', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"外科\",\"leader\":\"若依\",\"deptId\":104,\"orderNum\":\"6\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:09');
INSERT INTO `sys_oper_log` VALUES ('268', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"5\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:12');
INSERT INTO `sys_oper_log` VALUES ('269', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"胸部放射科\",\"leader\":\"若依\",\"deptId\":108,\"orderNum\":\"4\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:16');
INSERT INTO `sys_oper_log` VALUES ('270', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:20');
INSERT INTO `sys_oper_log` VALUES ('271', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"眼科\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623207346000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:12:24');
INSERT INTO `sys_oper_log` VALUES ('272', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"8\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:28:56');
INSERT INTO `sys_oper_log` VALUES ('273', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"医生管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1623207346000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:46:46');
INSERT INTO `sys_oper_log` VALUES ('274', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"3\",\"menuName\":\"体检表管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"health\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:49:57');
INSERT INTO `sys_oper_log` VALUES ('275', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/3,4', '127.0.0.1', '内网IP', '{tableIds=3,4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:50:09');
INSERT INTO `sys_oper_log` VALUES ('276', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'physical_examination_form', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:50:35');
INSERT INTO `sys_oper_log` VALUES ('277', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"InspectorTime\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"inspectorTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"inspector_time\"},{\"capJavaField\":\"Conclusions\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"conclusions\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623297035000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"conclusions\"},{\"capJavaField\":\"DoctorAudit\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"doctorAudit\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623297035000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"doctor_audit\"},{\"capJavaField\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 11:55:26');
INSERT INTO `sys_oper_log` VALUES ('278', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 11:55:28');
INSERT INTO `sys_oper_log` VALUES ('279', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1623297326000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"InspectorTime\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"inspectorTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623297326000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"inspector_time\"},{\"capJavaField\":\"Conclusions\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"conclusions\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623297326000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623297035000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"conclusions\"},{\"capJavaField\":\"DoctorAudit\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"doctorAudit\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623297326000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:40:35');
INSERT INTO `sys_oper_log` VALUES ('280', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 14:40:37');
INSERT INTO `sys_oper_log` VALUES ('281', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1623307235000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"InspectorTime\",\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"inspectorTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623307235000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623297035000,\"tableId\":5,\"pk\":true,\"columnName\":\"inspector_time\"},{\"capJavaField\":\"Conclusions\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"conclusions\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623307235000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623297035000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"conclusions\"},{\"capJavaField\":\"DoctorAudit\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"doctorAudit\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623307235000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:43:55');
INSERT INTO `sys_oper_log` VALUES ('282', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 14:43:58');
INSERT INTO `sys_oper_log` VALUES ('283', '学生', '1', 'com.ruoyi.student.controller.StudentController.add()', 'POST', '1', 'admin', null, '/student/student', '127.0.0.1', '内网IP', '{\"college\":\"计算机学院\",\"address\":\"发几个\",\"occupation\":\"过节费\",\"gender\":\"0\",\"nation\":\"好个\",\"classroom\":\"大\",\"degreeOfEducation\":\"极可能\",\"params\":{},\"birthDate\":1624291200000,\"studentId\":456465456,\"draduationSchoolOrWorkUnit\":\"加工费\",\"major\":\"sad\",\"name\":\"大赛\",\"nativePlace\":\" 很关键\",\"pastMedicalHistory\":\"就很烦\",\"age\":50}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\student\\StudentMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StudentMapper.insertStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student          ( college,             major,             classroom,             student_id,             name,             gender,             birth_date,             age,             degree_of_education,             nation,             occupation,             native_place,             address,             draduation_school_or_work_unit,             past_medical_history )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'ID\' doesn\'t have a default value\n; Field \'ID\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ID\' doesn\'t have a default value', '2021-06-10 14:49:47');
INSERT INTO `sys_oper_log` VALUES ('284', '学生', '1', 'com.ruoyi.student.controller.StudentController.add()', 'POST', '1', 'admin', null, '/student/student', '127.0.0.1', '内网IP', '{\"college\":\"的话\",\"address\":\"好贵发\",\"occupation\":\"对方是\",\"gender\":\"0\",\"nation\":\"发多少\",\"classroom\":\"还搞得\",\"degreeOfEducation\":\"第三方\",\"params\":{},\"birthDate\":1623686400000,\"studentId\":45656,\"draduationSchoolOrWorkUnit\":\" 发的\",\"major\":\"还搞得发\",\"name\":\"超凡大师\",\"nativePlace\":\"更好\",\"pastMedicalHistory\":\" 使得\",\"age\":23}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:52:13');
INSERT INTO `sys_oper_log` VALUES ('285', '学生', '3', 'com.ruoyi.student.controller.StudentController.remove()', 'DELETE', '1', 'admin', null, '/student/student/620111200002020003', '127.0.0.1', '内网IP', '{ids=620111200002020003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:52:23');
INSERT INTO `sys_oper_log` VALUES ('286', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"8\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":69540000002,\"createBy\":\"admin\",\"roleIds\":[8],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:57:41');
INSERT INTO `sys_oper_log` VALUES ('287', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15888888888\",\"admin\":false,\"loginDate\":1623307222000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":69540000001,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 14:57:48');
INSERT INTO `sys_oper_log` VALUES ('288', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:41');
INSERT INTO `sys_oper_log` VALUES ('289', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:44');
INSERT INTO `sys_oper_log` VALUES ('290', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:46');
INSERT INTO `sys_oper_log` VALUES ('291', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:48');
INSERT INTO `sys_oper_log` VALUES ('292', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:50');
INSERT INTO `sys_oper_log` VALUES ('293', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:52');
INSERT INTO `sys_oper_log` VALUES ('294', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:05:53');
INSERT INTO `sys_oper_log` VALUES ('295', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"医院管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623207346000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:10');
INSERT INTO `sys_oper_log` VALUES ('296', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1048', '127.0.0.1', '内网IP', '{menuId=1048}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:40');
INSERT INTO `sys_oper_log` VALUES ('297', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1047', '127.0.0.1', '内网IP', '{menuId=1047}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:42');
INSERT INTO `sys_oper_log` VALUES ('298', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1046', '127.0.0.1', '内网IP', '{menuId=1046}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:44');
INSERT INTO `sys_oper_log` VALUES ('299', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/109', '127.0.0.1', '内网IP', '{menuId=109}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:46');
INSERT INTO `sys_oper_log` VALUES ('300', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:48');
INSERT INTO `sys_oper_log` VALUES ('301', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1050', '127.0.0.1', '内网IP', '{menuId=1050}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:50');
INSERT INTO `sys_oper_log` VALUES ('302', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1052', '127.0.0.1', '内网IP', '{menuId=1052}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:52');
INSERT INTO `sys_oper_log` VALUES ('303', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1051', '127.0.0.1', '内网IP', '{menuId=1051}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:54');
INSERT INTO `sys_oper_log` VALUES ('304', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1053', '127.0.0.1', '内网IP', '{menuId=1053}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:56');
INSERT INTO `sys_oper_log` VALUES ('305', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:06:58');
INSERT INTO `sys_oper_log` VALUES ('306', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:07:00');
INSERT INTO `sys_oper_log` VALUES ('307', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2', '127.0.0.1', '内网IP', '{menuId=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:07:02');
INSERT INTO `sys_oper_log` VALUES ('308', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:13:49');
INSERT INTO `sys_oper_log` VALUES ('309', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:13:51');
INSERT INTO `sys_oper_log` VALUES ('310', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:13:54');
INSERT INTO `sys_oper_log` VALUES ('311', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:13:56');
INSERT INTO `sys_oper_log` VALUES ('312', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:13:58');
INSERT INTO `sys_oper_log` VALUES ('313', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:14:00');
INSERT INTO `sys_oper_log` VALUES ('314', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"体检信息\",\"params\":{},\"parentId\":2028,\"isCache\":\"0\",\"path\":\"form\",\"component\":\"health/form/index\",\"children\":[],\"createTime\":1623307512000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2035,\"menuType\":\"C\",\"perms\":\"health:form:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:14:22');
INSERT INTO `sys_oper_log` VALUES ('315', '学生', '2', 'com.ruoyi.student.controller.StudentController.edit()', 'PUT', '1', 'admin', null, '/student/student', '127.0.0.1', '内网IP', '{\"college\":\"软件学院\",\"address\":\"川大路二段\",\"occupation\":\"学生\",\"gender\":\"0\",\"nation\":\"汉族\",\"classroom\":\"行政一班\",\"degreeOfEducation\":\"大学\",\"params\":{},\"birthDate\":946656000000,\"studentId\":208111321,\"draduationSchoolOrWorkUnit\":\"四川大学\",\"major\":\"软件工程\",\"name\":\"小姐姐\",\"nativePlace\":\"四川成都\",\"id\":\"620111200001010001\",\"pastMedicalHistory\":\"无\",\"age\":21}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:33:43');
INSERT INTO `sys_oper_log` VALUES ('316', '学生', '2', 'com.ruoyi.student.controller.StudentController.edit()', 'PUT', '1', 'admin', null, '/student/student', '127.0.0.1', '内网IP', '{\"college\":\"互联网学院\",\"address\":\"渝北区\",\"occupation\":\"学生\",\"gender\":\"1\",\"nation\":\"汉族\",\"classroom\":\"行政二班\",\"degreeOfEducation\":\"大学\",\"params\":{},\"birthDate\":949420800000,\"studentId\":245654652,\"draduationSchoolOrWorkUnit\":\"重庆大学\",\"major\":\"信息工程\",\"name\":\"小哥哥\",\"nativePlace\":\"重庆渝北\",\"id\":\"620111200002020002\",\"pastMedicalHistory\":\"无\",\"age\":21}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:33:52');
INSERT INTO `sys_oper_log` VALUES ('317', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'surgery', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:42:42');
INSERT INTO `sys_oper_log` VALUES ('318', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"4\",\"menuName\":\"外科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"surgery\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:43:35');
INSERT INTO `sys_oper_log` VALUES ('319', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"2\",\"menuName\":\"学生信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"student\",\"children\":[],\"createTime\":1623225805000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:43:54');
INSERT INTO `sys_oper_log` VALUES ('320', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"2\",\"menuName\":\"学生信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"student\",\"children\":[],\"createTime\":1623225805000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2016,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:43:55');
INSERT INTO `sys_oper_log` VALUES ('321', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"3\",\"menuName\":\"体检表管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"health\",\"children\":[],\"createTime\":1623296997000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2028,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:44:01');
INSERT INTO `sys_oper_log` VALUES ('322', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"4\",\"menuName\":\"眼科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"eye\",\"children\":[],\"createTime\":1623289364000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:44:05');
INSERT INTO `sys_oper_log` VALUES ('323', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"5\",\"menuName\":\"外科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"surgery\",\"children\":[],\"createTime\":1623311015000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2041,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:44:08');
INSERT INTO `sys_oper_log` VALUES ('324', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"10\",\"menuName\":\"体检信息确认-院长\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"dean\",\"children\":[],\"createTime\":1623291071000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:44:12');
INSERT INTO `sys_oper_log` VALUES ('325', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"1\",\"menuName\":\"驳回体检表查询\",\"params\":{},\"parentId\":2041,\"isCache\":\"0\",\"path\":\"surgery\",\"component\":\"surgery/surgery/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"surgery:surgery:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:45:04');
INSERT INTO `sys_oper_log` VALUES ('326', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:49:26');
INSERT INTO `sys_oper_log` VALUES ('327', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:49:59');
INSERT INTO `sys_oper_log` VALUES ('328', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ophthalmic', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:50:15');
INSERT INTO `sys_oper_log` VALUES ('329', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 15:55:48');
INSERT INTO `sys_oper_log` VALUES ('330', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 15:55:58');
INSERT INTO `sys_oper_log` VALUES ('331', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"驳回状态\",\"params\":{},\"dictType\":\"sys_pass\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:11:36');
INSERT INTO `sys_oper_log` VALUES ('332', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_pass\",\"dictLabel\":\"通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:12:21');
INSERT INTO `sys_oper_log` VALUES ('333', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"params\":{},\"dictType\":\"sys_pass\",\"dictLabel\":\"驳回\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:12:31');
INSERT INTO `sys_oper_log` VALUES ('334', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623311748000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623311748000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623311748000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623311748000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:12:56');
INSERT INTO `sys_oper_log` VALUES ('335', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623312776000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623312776000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623312776000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623312776000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:13:10');
INSERT INTO `sys_oper_log` VALUES ('336', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 16:13:15');
INSERT INTO `sys_oper_log` VALUES ('337', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2050', '127.0.0.1', '内网IP', '{menuId=2050}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:14');
INSERT INTO `sys_oper_log` VALUES ('338', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2021-06-10 16:16:15');
INSERT INTO `sys_oper_log` VALUES ('339', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2051', '127.0.0.1', '内网IP', '{menuId=2051}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:17');
INSERT INTO `sys_oper_log` VALUES ('340', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2052', '127.0.0.1', '内网IP', '{menuId=2052}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:20');
INSERT INTO `sys_oper_log` VALUES ('341', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2053', '127.0.0.1', '内网IP', '{menuId=2053}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:22');
INSERT INTO `sys_oper_log` VALUES ('342', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2054', '127.0.0.1', '内网IP', '{menuId=2054}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:25');
INSERT INTO `sys_oper_log` VALUES ('343', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2044', '127.0.0.1', '内网IP', '{menuId=2044}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:29');
INSERT INTO `sys_oper_log` VALUES ('344', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2045', '127.0.0.1', '内网IP', '{menuId=2045}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:34');
INSERT INTO `sys_oper_log` VALUES ('345', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2046', '127.0.0.1', '内网IP', '{menuId=2046}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:36');
INSERT INTO `sys_oper_log` VALUES ('346', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2047', '127.0.0.1', '内网IP', '{menuId=2047}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:38');
INSERT INTO `sys_oper_log` VALUES ('347', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2048', '127.0.0.1', '内网IP', '{menuId=2048}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:40');
INSERT INTO `sys_oper_log` VALUES ('348', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2043', '127.0.0.1', '内网IP', '{menuId=2043}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:43');
INSERT INTO `sys_oper_log` VALUES ('349', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:16:52');
INSERT INTO `sys_oper_log` VALUES ('350', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"0\",\"menuName\":\"驳回体检表查询\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"eye\",\"component\":\"eye/ophthalmic/index\",\"children\":[],\"createTime\":1623290903000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:17:01');
INSERT INTO `sys_oper_log` VALUES ('351', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623312790000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623312790000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623312790000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623312790000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:18:14');
INSERT INTO `sys_oper_log` VALUES ('352', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623313094000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623313094000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313094000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313094000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:19:26');
INSERT INTO `sys_oper_log` VALUES ('353', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 16:19:28');
INSERT INTO `sys_oper_log` VALUES ('354', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"deptIds\":[100,101],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:01');
INSERT INTO `sys_oper_log` VALUES ('355', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"menuIds\":[2025,2026],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:09');
INSERT INTO `sys_oper_log` VALUES ('356', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":6,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createTime\":1623293109000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"surgery\",\"roleName\":\"外科\",\"menuIds\":[2041,2042],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:23');
INSERT INTO `sys_oper_log` VALUES ('357', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"口腔科\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"8\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":61111100002,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:35');
INSERT INTO `sys_oper_log` VALUES ('358', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"眼科\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":61111100002,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:46');
INSERT INTO `sys_oper_log` VALUES ('359', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623230961000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"眼科\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":61111100002,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:53');
INSERT INTO `sys_oper_log` VALUES ('360', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15888888888\",\"admin\":false,\"loginDate\":1623307222000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"耳鼻喉\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":61111100001,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:22:59');
INSERT INTO `sys_oper_log` VALUES ('361', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-06-10 16:26:44');
INSERT INTO `sys_oper_log` VALUES ('362', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2042', '127.0.0.1', '内网IP', '{menuId=2042}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2021-06-10 16:26:48');
INSERT INTO `sys_oper_log` VALUES ('363', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"eye\",\"roleName\":\"眼科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:27:06');
INSERT INTO `sys_oper_log` VALUES ('364', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":6,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createTime\":1623293109000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"surgery\",\"roleName\":\"外科\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:27:13');
INSERT INTO `sys_oper_log` VALUES ('365', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:27:17');
INSERT INTO `sys_oper_log` VALUES ('366', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"4\",\"menuName\":\"眼科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"ophthalmic\",\"children\":[],\"createTime\":1623289364000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:27:55');
INSERT INTO `sys_oper_log` VALUES ('367', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"眼科\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"eye\",\"component\":\"eye/eye/index\",\"children\":[],\"createTime\":1623313214000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2055,\"menuType\":\"C\",\"perms\":\"eye:eye:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:14');
INSERT INTO `sys_oper_log` VALUES ('368', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye-open\",\"orderNum\":\"4\",\"menuName\":\"眼科体检\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"eye\",\"children\":[],\"createTime\":1623289364000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2025,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:20');
INSERT INTO `sys_oper_log` VALUES ('369', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2056', '127.0.0.1', '内网IP', '{menuId=2056}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:30');
INSERT INTO `sys_oper_log` VALUES ('370', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2057', '127.0.0.1', '内网IP', '{menuId=2057}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:33');
INSERT INTO `sys_oper_log` VALUES ('371', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2058', '127.0.0.1', '内网IP', '{menuId=2058}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:35');
INSERT INTO `sys_oper_log` VALUES ('372', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2059', '127.0.0.1', '内网IP', '{menuId=2059}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:36');
INSERT INTO `sys_oper_log` VALUES ('373', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2060', '127.0.0.1', '内网IP', '{menuId=2060}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:39');
INSERT INTO `sys_oper_log` VALUES ('374', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2055', '127.0.0.1', '内网IP', '{menuId=2055}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:31:42');
INSERT INTO `sys_oper_log` VALUES ('375', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623313166000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623313166000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313166000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313166000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:32:18');
INSERT INTO `sys_oper_log` VALUES ('376', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 16:32:21');
INSERT INTO `sys_oper_log` VALUES ('377', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623314873000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1623207346000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-06-10 16:48:24');
INSERT INTO `sys_oper_log` VALUES ('378', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623314873000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1623207346000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-06-10 16:48:26');
INSERT INTO `sys_oper_log` VALUES ('379', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15915864563\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[3],\"loginIp\":\"\",\"email\":\"48453215@qq.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":102,\"avatar\":\"\",\"dept\":{\"deptName\":\"化验科\",\"leader\":\"若依\",\"deptId\":102,\"orderNum\":\"5\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":61111100003,\"createBy\":\"admin\",\"roleIds\":[5],\"createTime\":1623287976000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:48:38');
INSERT INTO `sys_oper_log` VALUES ('380', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1623207346000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,108,500,1040,1041,1042,501,1043,1044,1045,2016,2017,2018,2019,2020,2021,2022,3,114,115,1055,1056,1058,1057,1059,1060,116,2028,2035,2036,2037,2038,2039,2040,2025,2061,2062,2063,2064,2065,2066,2041,2042,2027],\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员角色', '2021-06-10 16:48:59');
INSERT INTO `sys_oper_log` VALUES ('381', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623314950000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1623207346000,\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2021-06-10 16:49:24');
INSERT INTO `sys_oper_log` VALUES ('382', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623313938000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623313938000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313938000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623313938000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:54:48');
INSERT INTO `sys_oper_log` VALUES ('383', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 16:54:51');
INSERT INTO `sys_oper_log` VALUES ('384', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2062', '127.0.0.1', '内网IP', '{menuId=2062}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:29');
INSERT INTO `sys_oper_log` VALUES ('385', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2066', '127.0.0.1', '内网IP', '{menuId=2066}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:36');
INSERT INTO `sys_oper_log` VALUES ('386', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2065', '127.0.0.1', '内网IP', '{menuId=2065}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:38');
INSERT INTO `sys_oper_log` VALUES ('387', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2063', '127.0.0.1', '内网IP', '{menuId=2063}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:39');
INSERT INTO `sys_oper_log` VALUES ('388', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2064', '127.0.0.1', '内网IP', '{menuId=2064}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:41');
INSERT INTO `sys_oper_log` VALUES ('389', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2061', '127.0.0.1', '内网IP', '{menuId=2061}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 16:57:44');
INSERT INTO `sys_oper_log` VALUES ('390', '眼科', '2', 'com.ruoyi.eye.controller.OphthalmicController.edit()', 'PUT', '1', 'admin', null, '/eye/ophthalmic', '127.0.0.1', '内网IP', '{\"colorVisionRed\":1,\"colorVisionYellow\":1,\"diagnosisTime\":1622736000000,\"colorVisionGreen\":1,\"sightRightNoglasses\":5,\"doctorOpinion\":\"正常\",\"sightLeftNoglasses\":5,\"sightLeftWithglasses\":5,\"params\":{},\"colorVisionPurple\":1,\"doctorAudit\":\"通过\",\"eyeIllness\":\"无\",\"studentId\":\"620111200001010001\",\"colorVisionBlue\":1,\"leaderAudit\":\"通过\",\"submitTime\":1622799394000,\"doctorId\":\"611111198008080001\",\"sightRightWithglasses\":5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:03:04');
INSERT INTO `sys_oper_log` VALUES ('391', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1623315288000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"updateTime\":1623315288000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623315288000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"updateTime\":1623315288000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Bi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:04:38');
INSERT INTO `sys_oper_log` VALUES ('392', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:07:55');
INSERT INTO `sys_oper_log` VALUES ('393', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:07:59');
INSERT INTO `sys_oper_log` VALUES ('394', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2072', '127.0.0.1', '内网IP', '{menuId=2072}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:08:02');
INSERT INTO `sys_oper_log` VALUES ('395', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2071', '127.0.0.1', '内网IP', '{menuId=2071}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:08:04');
INSERT INTO `sys_oper_log` VALUES ('396', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2069', '127.0.0.1', '内网IP', '{menuId=2069}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:08:05');
INSERT INTO `sys_oper_log` VALUES ('397', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2067', '127.0.0.1', '内网IP', '{menuId=2067}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:08:07');
INSERT INTO `sys_oper_log` VALUES ('398', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"qpg\",\"columns\":[{\"capJavaField\":\"StudentId\",\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"studentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"学号\",\"isQuery\":\"1\",\"updateTime\":1623315878000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":true,\"columnName\":\"student_ID\"},{\"capJavaField\":\"DiagnosisTime\",\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"diagnosisTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":false,\"columnComment\":\"体检时间\",\"updateTime\":1623315878000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"date\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1623311415000,\"tableId\":7,\"pk\":true,\"columnName\":\"diagnosis_time\"},{\"capJavaField\":\"SightLeftNoglasses\",\"usableColumn\":false,\"columnId\":75,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightLeftNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"左视力\",\"updateTime\":1623315878000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"BigDecimal\",\"queryType\":\"EQ\",\"columnType\":\"double(10,1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1623311415000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"sight_left_noglasses\"},{\"capJavaField\":\"SightRightNoglasses\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sightRightNoglasses\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnC', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:10:19');
INSERT INTO `sys_oper_log` VALUES ('399', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2021-06-10 17:10:21');
INSERT INTO `sys_oper_log` VALUES ('400', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/06/10/b85a402b-1f0f-4978-b68f-e754b0a61bc4.jpeg\",\"code\":200}', '0', null, '2021-06-10 17:17:55');
INSERT INTO `sys_oper_log` VALUES ('401', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2042', '127.0.0.1', '内网IP', '{menuId=2042}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:19:06');
INSERT INTO `sys_oper_log` VALUES ('402', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'physical_examination_form', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 17:19:27');
INSERT INTO `sys_oper_log` VALUES ('403', '眼科', '1', 'com.ruoyi.eye.controller.OphthalmicController.add()', 'POST', '1', 'admin', null, '/eye/ophthalmic', '127.0.0.1', '内网IP', '{\"params\":{}}', 'null', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\eye\\OphthalmicMapper.xml]\r\n### The error may involve com.ruoyi.eye.mapper.OphthalmicMapper.insertOphthalmic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ophthalmic\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2021-06-10 17:23:30');
INSERT INTO `sys_oper_log` VALUES ('404', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"10\",\"menuName\":\"体检信息确认-院长\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"leader\",\"children\":[],\"createTime\":1623291071000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:50:29');
INSERT INTO `sys_oper_log` VALUES ('405', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"1\",\"menuName\":\"审查\",\"params\":{},\"parentId\":2027,\"isCache\":\"0\",\"path\":\"leader\",\"component\":\"leader/leader/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"leader:leader:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:56:36');
INSERT INTO `sys_oper_log` VALUES ('406', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"1\",\"menuName\":\"审查\",\"params\":{},\"parentId\":2027,\"isCache\":\"0\",\"path\":\"leader\",\"component\":\"leader/leader/index\",\"children\":[],\"createTime\":1623326196000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2079,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:57:20');
INSERT INTO `sys_oper_log` VALUES ('407', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2079', '127.0.0.1', '内网IP', '{menuId=2079}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:58:39');
INSERT INTO `sys_oper_log` VALUES ('408', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"10\",\"menuName\":\"体检信息确认-院长\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"leader/leader/index\",\"children\":[],\"createTime\":1623291071000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:59:26');
INSERT INTO `sys_oper_log` VALUES ('409', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"10\",\"menuName\":\"体检信息确认-院长\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"leader\",\"children\":[],\"createTime\":1623291071000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2027,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 19:59:43');
INSERT INTO `sys_oper_log` VALUES ('410', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"1\",\"menuName\":\"审查\",\"params\":{},\"parentId\":2027,\"isCache\":\"0\",\"path\":\"leader\",\"component\":\"leader/leader/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"leader:leader:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-10 20:00:40');
INSERT INTO `sys_oper_log` VALUES ('411', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15284098612\",\"admin\":false,\"password\":\"$2a$10$HZpuNZu0JrWRPGBP8odDkuGEconWcwsiJPBJ5lSfzTelx/7QSC4Dm\",\"postIds\":[4],\"email\":\"1982383627@qq.com\",\"nickName\":\"zly\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"曾琳渊\",\"userId\":61111100004,\"createBy\":\"admin\",\"roleIds\":[3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 10:45:09');
INSERT INTO `sys_oper_log` VALUES ('412', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1623292410000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"otolaryngology\",\"roleName\":\"耳鼻喉\",\"menuIds\":[3,114,115,1055,1056,1058,1057,1059,1060,116,2028,2035,2036,2037,2038,2039,2040],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 10:45:49');
INSERT INTO `sys_oper_log` VALUES ('413', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic\",\"component\":\"eye/ophthalmic/index\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 11:55:27');
INSERT INTO `sys_oper_log` VALUES ('414', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_reject\",\"component\":\"eye/ophthalmic/index\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 11:59:13');
INSERT INTO `sys_oper_log` VALUES ('415', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_input\",\"component\":\"eye\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 12:02:30');
INSERT INTO `sys_oper_log` VALUES ('416', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic/reject\",\"component\":\"eye/ophthalmic/index\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:12:26');
INSERT INTO `sys_oper_log` VALUES ('417', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic/input\",\"component\":\"eye\",\"children\":[],\"createTime\":1623729750000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:13:09');
INSERT INTO `sys_oper_log` VALUES ('418', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic/reject\",\"component\":\"eye/ophthalmic/index\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:18:28');
INSERT INTO `sys_oper_log` VALUES ('419', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic/reject\",\"component\":\"eye/ophthalmic/reject\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:19:39');
INSERT INTO `sys_oper_log` VALUES ('420', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic/input\",\"component\":\"eye/ophthalmic/input\",\"children\":[],\"createTime\":1623729750000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:19:52');
INSERT INTO `sys_oper_log` VALUES ('421', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_reject\",\"component\":\"eye/ophthalmic/reject\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:23:35');
INSERT INTO `sys_oper_log` VALUES ('422', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"2\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_reject\",\"component\":\"eye/ophthalmic/reject\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:24:06');
INSERT INTO `sys_oper_log` VALUES ('423', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_input\",\"component\":\"eye/ophthalmic/input\",\"children\":[],\"createTime\":1623729750000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:24:24');
INSERT INTO `sys_oper_log` VALUES ('424', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"提交\",\"params\":{},\"parentId\":2081,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"ophthalmic:student\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:28:37');
INSERT INTO `sys_oper_log` VALUES ('425', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"提交\",\"params\":{},\"parentId\":2081,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1623738517000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2082,\"menuType\":\"F\",\"perms\":\"ophthalmic:student\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 14:28:50');
INSERT INTO `sys_oper_log` VALUES ('426', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', '1', 'admin', null, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623737335854,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"/profile/avatar/2021/06/10/b85a402b-1f0f-4978-b68f-e754b0a61bc4.jpeg\",\"dept\":{\"deptName\":\"重庆交通大学体检中心\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1623207346000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:04:50');
INSERT INTO `sys_oper_log` VALUES ('427', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"信息录入\",\"params\":{},\"parentId\":2082,\"isCache\":\"0\",\"path\":\"eye/ophthalmic/exam_input\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:23:37');
INSERT INTO `sys_oper_log` VALUES ('428', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"信息录入\",\"params\":{},\"parentId\":2082,\"isCache\":\"0\",\"path\":\"eye/ophthalmic/exam_input\",\"children\":[],\"createTime\":1623741817000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:23:53');
INSERT INTO `sys_oper_log` VALUES ('429', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"信息录入\",\"params\":{},\"parentId\":2082,\"isCache\":\"0\",\"path\":\"ophthalmic/exam_input\",\"children\":[],\"createTime\":1623741817000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:24:24');
INSERT INTO `sys_oper_log` VALUES ('430', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"信息录入\",\"params\":{},\"parentId\":2082,\"isCache\":\"0\",\"path\":\"ophthalmic/exam_input\",\"component\":\"/eye/ophthalmic/exam_input\",\"children\":[],\"createTime\":1623741817000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"C\",\"perms\":\"ophthalmic:exam_input\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:25:24');
INSERT INTO `sys_oper_log` VALUES ('431', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"信息录入\",\"params\":{},\"parentId\":2082,\"isCache\":\"0\",\"path\":\"ophthalmic/exam_input\",\"component\":\"eye/ophthalmic/exam_input\",\"children\":[],\"createTime\":1623741817000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2083,\"menuType\":\"C\",\"perms\":\"ophthalmic:exam_input\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 15:26:11');
INSERT INTO `sys_oper_log` VALUES ('432', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_input\",\"component\":\"department/eye/ophthalmic/input\",\"children\":[],\"createTime\":1623729750000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 17:39:48');
INSERT INTO `sys_oper_log` VALUES ('433', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"2\",\"menuName\":\"驳回处理\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_reject\",\"component\":\"department/eye/ophthalmic/reject\",\"children\":[],\"createTime\":1623316272000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2073,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_reject:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 17:40:04');
INSERT INTO `sys_oper_log` VALUES ('434', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"log\",\"orderNum\":\"1\",\"menuName\":\"眼科信息录入\",\"params\":{},\"parentId\":2025,\"isCache\":\"0\",\"path\":\"ophthalmic_input\",\"component\":\"department/input\",\"children\":[],\"createTime\":1623729750000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2081,\"menuType\":\"C\",\"perms\":\"eye:ophthalmic_input:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2021-06-15 17:40:57');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'dean', '院长', '1', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 09:35:35', '');
INSERT INTO `sys_post` VALUES ('2', 'Physician', '体检负责医生', '2', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 09:39:10', '');
INSERT INTO `sys_post` VALUES ('3', 'section chief', '科长', '3', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 09:39:29', '');
INSERT INTO `sys_post` VALUES ('4', 'doctor', '医生', '4', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 09:39:46', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_unicode_520_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2021-06-09 10:55:46', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '眼科', 'eye', '2', '2', '1', '1', '0', '0', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 16:27:05', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '耳鼻喉', 'otolaryngology', '3', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:33:30', 'admin', '2021-06-15 10:45:49', null);
INSERT INTO `sys_role` VALUES ('4', '胸部放射科', 'Chest radiology department', '4', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:34:24', '', '2021-06-10 11:00:25', null);
INSERT INTO `sys_role` VALUES ('5', '化验科', 'Test section', '5', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:43:59', '', '2021-06-10 11:00:51', null);
INSERT INTO `sys_role` VALUES ('6', '外科', 'surgery', '6', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:45:09', 'admin', '2021-06-10 16:27:13', null);
INSERT INTO `sys_role` VALUES ('7', '其他科', 'other', '7', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:57:17', 'admin', '2021-06-10 11:01:02', null);
INSERT INTO `sys_role` VALUES ('8', '口腔科', 'oral', '8', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:57:54', '', '2021-06-10 11:01:08', null);
INSERT INTO `sys_role` VALUES ('9', '内科', 'Internal medicine', '9', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:58:48', 'admin', '2021-06-10 11:01:14', null);
INSERT INTO `sys_role` VALUES ('10', '血压脉搏科', 'Blood pressure pulse', '10', '2', '1', '1', '0', '0', 'admin', '2021-06-10 10:59:11', 'admin', '2021-06-10 11:01:19', null);

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('1', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('3', '102');
INSERT INTO `sys_role_dept` VALUES ('4', '103');
INSERT INTO `sys_role_dept` VALUES ('5', '104');
INSERT INTO `sys_role_dept` VALUES ('6', '105');
INSERT INTO `sys_role_dept` VALUES ('7', '106');
INSERT INTO `sys_role_dept` VALUES ('8', '107');
INSERT INTO `sys_role_dept` VALUES ('9', '108');
INSERT INTO `sys_role_dept` VALUES ('10', '109');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '114');
INSERT INTO `sys_role_menu` VALUES ('3', '115');
INSERT INTO `sys_role_menu` VALUES ('3', '116');
INSERT INTO `sys_role_menu` VALUES ('3', '1055');
INSERT INTO `sys_role_menu` VALUES ('3', '1056');
INSERT INTO `sys_role_menu` VALUES ('3', '1057');
INSERT INTO `sys_role_menu` VALUES ('3', '1058');
INSERT INTO `sys_role_menu` VALUES ('3', '1059');
INSERT INTO `sys_role_menu` VALUES ('3', '1060');
INSERT INTO `sys_role_menu` VALUES ('3', '2028');
INSERT INTO `sys_role_menu` VALUES ('3', '2035');
INSERT INTO `sys_role_menu` VALUES ('3', '2036');
INSERT INTO `sys_role_menu` VALUES ('3', '2037');
INSERT INTO `sys_role_menu` VALUES ('3', '2038');
INSERT INTO `sys_role_menu` VALUES ('3', '2039');
INSERT INTO `sys_role_menu` VALUES ('3', '2040');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8_unicode_520_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_unicode_520_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_520_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_520_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_520_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61111100005 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2021/06/10/b85a402b-1f0f-4978-b68f-e754b0a61bc4.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-06-16 10:54:06', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-16 10:54:05', '管理员');
INSERT INTO `sys_user` VALUES ('61111100002', '101', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-06-10 16:41:11', 'admin', '2021-06-09 10:55:46', 'admin', '2021-06-10 16:41:10', '测试员');
INSERT INTO `sys_user` VALUES ('61111100003', '102', 'zhangsan', '张三', '00', '48453215@qq.com', '15915864563', '0', '', '$2a$10$GZFAHvLdKEh9VmDxmbSN6u6VWJbBnWJMT.e3Bl8Qh0DBBmUBpHU3W', '0', '0', '', null, 'admin', '2021-06-10 09:19:36', 'admin', '2021-06-10 16:48:38', null);
INSERT INTO `sys_user` VALUES ('61111100004', '100', '曾琳渊', 'zly', '00', '1982383627@qq.com', '15284098612', '0', '', '$2a$10$HZpuNZu0JrWRPGBP8odDkuGEconWcwsiJPBJ5lSfzTelx/7QSC4Dm', '0', '0', '127.0.0.1', '2021-06-16 09:15:36', 'admin', '2021-06-15 10:45:09', '', '2021-06-16 09:15:36', null);

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '3');
INSERT INTO `sys_user_post` VALUES ('61111100001', '1');
INSERT INTO `sys_user_post` VALUES ('61111100002', '2');
INSERT INTO `sys_user_post` VALUES ('61111100003', '3');
INSERT INTO `sys_user_post` VALUES ('61111100004', '4');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('61111100002', '2');
INSERT INTO `sys_user_role` VALUES ('61111100003', '5');
INSERT INTO `sys_user_role` VALUES ('61111100004', '3');
