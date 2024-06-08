/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : ruoyi_vue

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 08/06/2024 15:37:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identity` enum('教师','评委') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scope` enum('思政课程组','公共基础课程组','专业技能课程一组','专业技能课程二组') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456',
  `head_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, '李勇俊', '安徽工业大学', '教师', '公共基础课程组', 'lyj031', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'lyj');
INSERT INTO `accounts` VALUES (2, '张三', '安徽建筑大学', '教师', '专业技能课程二组', 'zs2936', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'zs');
INSERT INTO `accounts` VALUES (3, '李四', '安徽工业大学', '评委', '思政课程组', 'ls29543', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'ls');
INSERT INTO `accounts` VALUES (4, '王五', '安徽农业大学', '评委', '专业技能课程一组', 'ww9513', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'ww');

-- ----------------------------
-- Table structure for evaluations
-- ----------------------------
DROP TABLE IF EXISTS `evaluations`;
CREATE TABLE `evaluations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_id` int NOT NULL,
  `account_id` int NOT NULL,
  `reviewer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `implement_score` double NULL DEFAULT NULL,
  `planning_score` double NULL DEFAULT NULL,
  `video_score` double NULL DEFAULT NULL,
  `training_score` double NULL DEFAULT NULL,
  `standards_score` double NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `textbook_score` double NULL DEFAULT NULL,
  `suggest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluations
-- ----------------------------
INSERT INTO `evaluations` VALUES (1, 1, 1, '王评委', 2, 5, 1, 2, 25, NULL, 5, '还不错');
INSERT INTO `evaluations` VALUES (2, 2, 2, '李评委', 5, 3, 4, 7, 7, NULL, 3, '挺好的');
INSERT INTO `evaluations` VALUES (3, 3, 3, '赵评委', 6, 5, 4, 1, 58, NULL, 6, '棒');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'accounts', '账户信息', NULL, NULL, 'Accounts', 'crud', 'element-ui', 'com.ruoyi.Admit', 'Account', 'account', '账号管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18', NULL);
INSERT INTO `gen_table` VALUES (2, 'works', '作品信息', '', '', 'Works', 'crud', 'element-ui', 'com.ruoyi.Admit', 'Works', 'works', '作品管理', 'lyj', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17', NULL);
INSERT INTO `gen_table` VALUES (3, 'evaluations', '评价信息管理', NULL, NULL, 'Evaluations', 'crud', 'element-ui', 'com.ruoyi.Admit', 'Evaluations', 'evaluations', '评价管理', 'lyj', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37', NULL);
INSERT INTO `gen_table` VALUES (4, 'identitytable', '', NULL, NULL, 'Identitytable', 'crud', '', 'com.ruoyi.system', 'system', 'identitytable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-06-06 13:40:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'scopetable', '', NULL, NULL, 'Scopetable', 'crud', '', 'com.ruoyi.system', 'system', 'scopetable', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-06-06 13:40:51', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '用户ID', 'int', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (3, 1, 'school', '学校', 'varchar(255)', 'String', 'school', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (4, 1, 'identity', '身份', 'enum(\'教师\',\'评委\')', 'String', 'identity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'identity_name', 4, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (5, 1, 'scope', '报名组别', 'enum(\'思政课程组\',\'公共基础课程组\',\'专业技能课程一组\',\'专业技能课程二组\')', 'String', 'scope', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'scope_name', 5, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (7, 1, 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 7, 'admin', '2024-06-05 21:14:47', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (8, 2, 'id', '作品ID', 'int', 'Long', 'id', '1', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (9, 2, 'title', '作品名称', 'varchar(255)', 'String', 'title', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (10, 2, 'author', '参赛姓名', 'varchar(255)', 'String', 'author', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (11, 2, 'account_id', '账户ID', 'int', 'Long', 'accountId', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (12, 2, 'teachers', '参赛老师', 'varchar(255)', 'String', 'teachers', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (13, 2, 'course', '所属课程', 'varchar(255)', 'String', 'course', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (14, 2, 'link', '链接', 'varchar(255)', 'String', 'link', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (15, 2, 'contact', '联系方式', 'varchar(255)', 'String', 'contact', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'input', '', 8, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (16, 2, 'class_record', '课堂实录', 'varchar(255)', 'String', 'classRecord', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (17, 2, 'lesson_planning', '教案', 'varchar(255)', 'String', 'lessonPlanning', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 10, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (18, 2, 'lesson_report', '教学报告', 'varchar(255)', 'String', 'lessonReport', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (20, 2, 'standards', '课程标准', 'varchar(255)', 'String', 'standards', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (21, 2, 'other', '其他附件', 'varchar(255)', 'String', 'other', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 14, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (22, 2, 'submission_time', '提交时间', 'datetime', 'Date', 'submissionTime', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 15, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (23, 2, 'views', '视频资料', 'varchar(255)', 'String', 'views', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 16, 'admin', '2024-06-06 00:38:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (24, 2, 'score', '得分', 'double', 'Long', 'score', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 17, '', '2024-06-06 00:53:41', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (25, 3, 'id', '评价ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (26, 3, 'work_id', '作品ID', 'int', 'Long', 'workId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (27, 3, 'account_id', '账户ID', 'int', 'Long', 'accountId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (28, 3, 'reviewer_name', '评委姓名', 'varchar(255)', 'String', 'reviewerName', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (29, 3, 'implement_score', '教学实施', 'double', 'Long', 'implementScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (30, 3, 'planning_score', '教案', 'double', 'Long', 'planningScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (31, 3, 'video_score', '视频资料', 'double', 'Long', 'videoScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (32, 3, 'training_score', '专业人才培养方案', 'double', 'Long', 'trainingScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (33, 3, 'standards_score', '课程标准', 'double', 'Long', 'standardsScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (34, 3, 'score', '得分', 'double', 'Long', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (35, 3, 'link', '链接', 'varchar(255)', 'String', 'link', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-06-06 01:43:56', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (36, 3, 'textbook_score', '教材选用', 'double', 'Long', 'textbookScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2024-06-06 01:49:35', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (38, 2, 'training_report', '专业人才培养方案', 'varchar(255)', 'String', 'trainingReport', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 12, '', '2024-06-06 12:21:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (39, 2, 'entry_form', '参赛报名表', 'varchar(255)', 'String', 'entryForm', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 18, '', '2024-06-06 12:21:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (40, 2, 'message_book', '信息公示件', 'varchar(255)', 'String', 'messageBook', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 19, '', '2024-06-06 12:21:19', '', '2024-06-06 16:16:17');
INSERT INTO `gen_table_column` VALUES (41, 3, 'suggest', '评价建议', 'varchar(255)', 'String', 'suggest', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-06-06 12:21:22', '', '2024-06-06 17:45:37');
INSERT INTO `gen_table_column` VALUES (42, 1, 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', '1', '1', '1', '0', '0', 'LIKE', 'input', '', 6, '', '2024-06-06 12:32:23', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (43, 1, 'head_image', '头像', 'varchar(255)', 'String', 'headImage', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'imageUpload', '', 8, '', '2024-06-06 12:32:23', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (44, 1, 'account_name', '账户名', 'varchar(255)', 'String', 'accountName', '0', '0', '0', '0', '0', '1', '0', 'LIKE', 'input', '', 9, '', '2024-06-06 12:32:23', '', '2024-06-06 12:37:18');
INSERT INTO `gen_table_column` VALUES (45, 4, 'id', NULL, 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-06 13:40:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 4, 'identity', NULL, 'varchar(255)', 'String', 'identity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-06 13:40:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 5, 'scope', NULL, 'varchar(255)', 'String', 'scope', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-06-06 13:40:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 5, 'id', NULL, 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2024-06-06 13:40:51', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-06-05 20:46:47', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '思政课程组', '0', 'scope_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:24:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '公共基础课程组', '1', 'scope_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:24:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '专业技能课程一组', '2', 'scope_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:24:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '专业技能课程二组', '3', 'scope_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:24:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '教师', '0', 'identity_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:25:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '评委', '1', 'identity_name', NULL, 'default', 'N', '0', 'admin', '2024-06-05 23:26:03', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '报名组别', 'scope_name', '0', 'admin', '2024-06-05 21:25:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '身份', 'identity_name', '0', 'admin', '2024-06-05 23:25:39', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-06-05 20:46:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-05 20:59:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2024-06-05 20:59:41');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-05 20:59:59');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-05 23:15:17');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-06-05 23:36:02');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-05 23:36:06');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-06 00:38:10');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-06-06 01:22:40');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-06 01:22:44');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-06 11:15:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-06-06 12:02:24');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 13:23:12');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-06-06 13:57:01');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 13:57:06');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码错误', '2024-06-06 14:50:50');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 14:50:58');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-06-06 14:57:17');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 14:57:22');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-06-06 15:11:35');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 15:11:45');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2024-06-06 15:29:10');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 15:29:15');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 17:12:03');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-06 18:12:29');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-07 10:46:39');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-07 13:39:52');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-07 16:13:32');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码错误', '2024-06-07 20:18:02');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-07 20:18:09');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2024-06-07 23:13:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2037 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-06-05 20:46:47', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-06-05 20:46:47', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-06-05 20:46:47', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-06-05 20:46:47', 'admin', '2024-06-06 00:03:31', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-06-05 20:46:47', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-06-05 20:46:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-06-05 20:46:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-06-05 20:46:47', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-06-05 20:46:47', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-06-05 20:46:47', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-06-05 20:46:47', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-06-05 20:46:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-06-05 20:46:47', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-06-05 20:46:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-06-05 20:46:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-06-05 20:46:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-06-05 20:46:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-06-05 20:46:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-05 20:46:47', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-06-05 20:46:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-06-05 20:46:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-06-05 20:46:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-06-05 20:46:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-05 20:46:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '活动', 0, 0, 'account', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'guide', 'admin', '2024-06-05 21:11:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '账号管理', 2000, 1, 'account', 'Account/account/index', NULL, 1, 0, 'C', '0', '0', 'Account:account:list', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '账号管理菜单');
INSERT INTO `sys_menu` VALUES (2020, '账号管理查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'Account:account:query', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '账号管理新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'Account:account:add', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '账号管理修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'Account:account:edit', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '账号管理删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'Account:account:remove', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '账号管理导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'Account:account:export', '#', 'admin', '2024-06-06 15:32:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '作品管理', 2000, 1, 'works', 'Works/works/index', NULL, 1, 0, 'C', '0', '0', 'Works:works:list', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '作品管理菜单');
INSERT INTO `sys_menu` VALUES (2026, '作品管理查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'Works:works:query', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '作品管理新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'Works:works:add', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '作品管理修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'Works:works:edit', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '作品管理删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'Works:works:remove', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '作品管理导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'Works:works:export', '#', 'admin', '2024-06-06 16:17:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '评价管理', 2000, 1, 'evaluations', 'Evaluations/evaluations/index', NULL, 1, 0, 'C', '0', '0', 'Evaluations:evaluations:list', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '评价管理菜单');
INSERT INTO `sys_menu` VALUES (2032, '评价管理查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'Evaluations:evaluations:query', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '评价管理新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'Evaluations:evaluations:add', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '评价管理修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'Evaluations:evaluations:edit', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '评价管理删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'Evaluations:evaluations:remove', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '评价管理导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'Evaluations:evaluations:export', '#', 'admin', '2024-06-06 17:46:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-06-05 20:46:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-06-05 20:46:48', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"account\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 21:11:13', 15);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"accounts\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 21:14:47', 47);
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"学校\",\"dictType\":\"school_name\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 21:25:05', 8);
INSERT INTO `sys_oper_log` VALUES (103, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"报名组别\",\"dictType\":\"scope_name\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 21:25:41', 11);
INSERT INTO `sys_oper_log` VALUES (104, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:19:12', 12);
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"思政课程组\",\"dictSort\":0,\"dictType\":\"scope_name\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:24:00', 8);
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"公共基础课程组\",\"dictSort\":0,\"dictType\":\"scope_name\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:24:21', 8);
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"专业技能课程一组\",\"dictSort\":0,\"dictType\":\"scope_name\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:24:32', 7);
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"专业技能课程二组\",\"dictSort\":0,\"dictType\":\"scope_name\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:24:48', 8);
INSERT INTO `sys_oper_log` VALUES (109, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"身份\",\"dictType\":\"identity_name\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:25:39', 7);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"教师\",\"dictSort\":0,\"dictType\":\"identity_name\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:25:55', 8);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"评委\",\"dictSort\":0,\"dictType\":\"identity_name\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:26:03', 8);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"account\",\"className\":\"Accounts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"账户Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"School\",\"columnComment\":\"学校\",\"columnId\":3,\"columnName\":\"school\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"school\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Identity\",\"columnComment\":\"身份\",\"columnId\":4,\"columnName\":\"identity\",\"columnType\":\"enum(\'教师\',\'评委\')\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"identity_name\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"identity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:30:21', 32);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"accounts\"}', NULL, 0, NULL, '2024-06-05 23:30:28', 121);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"accounts\"}', NULL, 0, NULL, '2024-06-05 23:43:59', 125);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"account\",\"className\":\"Accounts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"账户Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:30:21\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:30:21\",\"usableColumn\":false},{\"capJavaField\":\"School\",\"columnComment\":\"学校\",\"columnId\":3,\"columnName\":\"school\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"school\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:30:21\",\"usableColumn\":false},{\"capJavaField\":\"Identity\",\"columnComment\":\"身份\",\"columnId\":4,\"columnName\":\"identity\",\"columnType\":\"enum(\'教师\',\'评委\')\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"identity_name\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:44:42', 39);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"account\",\"className\":\"Accounts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"账户Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:44:42\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:44:42\",\"usableColumn\":false},{\"capJavaField\":\"School\",\"columnComment\":\"学校\",\"columnId\":3,\"columnName\":\"school\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"school\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-05 23:44:42\",\"usableColumn\":false},{\"capJavaField\":\"Identity\",\"columnComment\":\"身份\",\"columnId\":4,\"columnName\":\"identity\",\"columnType\":\"enum(\'教师\',\'评委\')\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"identity_name\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:55:27', 23);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"accounts\"}', NULL, 0, NULL, '2024-06-05 23:55:30', 26);
INSERT INTO `sys_oper_log` VALUES (118, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":1,\"identity\":\"1\",\"name\":\"lyj\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"2\",\"username\":\"lyj0301\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-05 23:58:16', 8);
INSERT INTO `sys_oper_log` VALUES (119, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-05 23:59:20', 484);
INSERT INTO `sys_oper_log` VALUES (120, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-06 00:03:01', 24);
INSERT INTO `sys_oper_log` VALUES (121, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-06 00:03:05', 23);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-06-05 20:46:47\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:03:31', 10);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"works\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:38:19', 47);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"accountId\",\"javaType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:43:20', 23);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:20\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:20\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:20\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:43:38', 28);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:38\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:38\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:43:38\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:53:16', 41);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/works', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:53:41', 33);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/works', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:54:12', 24);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:54:12\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:54:12\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:54:12\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 00:57:19', 22);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:57:19\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:57:19\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 00:57:19\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:03:36', 24);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:03:36\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:03:36\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:03:36\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:08:41', 21);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"works\"}', NULL, 0, NULL, '2024-06-06 01:08:44', 33);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"evaluations\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:43:56', 72);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"reviewerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIK', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:45:29', 33);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评价信息ID\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:45:29\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品ID\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:45:29\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:45:29\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"评委姓名\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:49:32', 23);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/evaluations', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 01:49:35', 33);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:08:41\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:08:41\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:08:41\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户Id\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 11:19:12', 93);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评分ID\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:49:35\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品ID\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:49:35\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 01:49:35\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"评委姓名\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 11:21:56', 45);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评分ID\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 11:21:56\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品ID\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 11:21:56\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 11:21:56\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"评委姓名\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 11:24:28', 33);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/accounts', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:21:18', 58);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/works', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:21:19', 69);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/evaluations', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:21:22', 37);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/accounts', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:32:23', 31);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"account\",\"className\":\"Accounts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:32:23\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:32:23\",\"usableColumn\":false},{\"capJavaField\":\"School\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"school\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"school\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:32:23\",\"usableColumn\":false},{\"capJavaField\":\"Identity\",\"columnComment\":\"\",\"columnId\":4,\"columnName\":\"identity\",\"columnType\":\"enum(\'教师\',\'评委\')\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"identity_name\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:35:47', 28);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"account\",\"className\":\"Accounts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"用户ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:35:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:35:47\",\"usableColumn\":false},{\"capJavaField\":\"School\",\"columnComment\":\"学校\",\"columnId\":3,\"columnName\":\"school\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"school\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:35:47\",\"usableColumn\":false},{\"capJavaField\":\"Identity\",\"columnComment\":\"身份\",\"columnId\":4,\"columnName\":\"identity\",\"columnType\":\"enum(\'教师\',\'评委\')\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 21:14:47\",\"dictType\":\"identity_name\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:37:18', 19);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"accounts\"}', NULL, 0, NULL, '2024-06-06 12:37:22', 121);
INSERT INTO `sys_oper_log` VALUES (147, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:43:36', 9);
INSERT INTO `sys_oper_log` VALUES (148, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":2,\"identity\":\"0\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"2\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:46:37', 9);
INSERT INTO `sys_oper_log` VALUES (149, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":2,\"identity\":\"0\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"公共基础课程组\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 12:47:16', 5);
INSERT INTO `sys_oper_log` VALUES (150, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"accountName\":\"\",\"createBy\":\"\",\"headImage\":\"\",\"id\":0,\"identity\":\"\",\"name\":\"\",\"params\":{},\"remark\":\"\",\"school\":\"\",\"scope\":\"\",\"updateBy\":\"\",\"userName\":\"\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Java17\\实习项目\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Account\\AccountsMapper.xml]\r\n### The error may involve com.ruoyi.Admit.mapper.AccountsMapper.insertAccounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into accounts          ( head_image,             account_name )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2024-06-06 13:24:53', 44);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"scopetable,identitytable\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 13:40:51', 66);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"identitytable\"}', NULL, 0, NULL, '2024-06-06 13:41:21', 103);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"identitytable,scopetable\"}', NULL, 0, NULL, '2024-06-06 13:41:25', 52);
INSERT INTO `sys_oper_log` VALUES (154, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"identity\":\"2\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"3\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 13:57:41', 11);
INSERT INTO `sys_oper_log` VALUES (155, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 14:56:07', 14);
INSERT INTO `sys_oper_log` VALUES (156, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 14:57:38', 3);
INSERT INTO `sys_oper_log` VALUES (157, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:01', 2);
INSERT INTO `sys_oper_log` VALUES (158, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:02', 3);
INSERT INTO `sys_oper_log` VALUES (159, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:02', 3);
INSERT INTO `sys_oper_log` VALUES (160, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:31', 2);
INSERT INTO `sys_oper_log` VALUES (161, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:31', 3);
INSERT INTO `sys_oper_log` VALUES (162, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:32', 3);
INSERT INTO `sys_oper_log` VALUES (163, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:00:32', 2);
INSERT INTO `sys_oper_log` VALUES (164, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\Java17\\实习项目\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Account\\AccountsMapper.xml]\r\n### The error may involve com.ruoyi.Admit.mapper.AccountsMapper.insertAccounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into accounts\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-06-06 15:00:43', 33);
INSERT INTO `sys_oper_log` VALUES (165, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:01:24', 3);
INSERT INTO `sys_oper_log` VALUES (166, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:01:25', 3);
INSERT INTO `sys_oper_log` VALUES (167, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:02:37', 3);
INSERT INTO `sys_oper_log` VALUES (168, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:02:38', 2);
INSERT INTO `sys_oper_log` VALUES (169, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:02:44', 3);
INSERT INTO `sys_oper_log` VALUES (170, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:02:50', 3);
INSERT INTO `sys_oper_log` VALUES (171, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:08:11', 3);
INSERT INTO `sys_oper_log` VALUES (172, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:08:14', 3);
INSERT INTO `sys_oper_log` VALUES (173, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"identity\":\"0\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"专业技能课程一组\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:08:44', 5);
INSERT INTO `sys_oper_log` VALUES (174, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"identity\":\"1\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"0\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:08:59', 4);
INSERT INTO `sys_oper_log` VALUES (175, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:10:13', 4);
INSERT INTO `sys_oper_log` VALUES (176, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:11:02', 3);
INSERT INTO `sys_oper_log` VALUES (177, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:11:03', 2);
INSERT INTO `sys_oper_log` VALUES (178, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:33', 2);
INSERT INTO `sys_oper_log` VALUES (179, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:33', 2);
INSERT INTO `sys_oper_log` VALUES (180, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:34', 3);
INSERT INTO `sys_oper_log` VALUES (181, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:34', 2);
INSERT INTO `sys_oper_log` VALUES (182, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:34', 3);
INSERT INTO `sys_oper_log` VALUES (183, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:34', 3);
INSERT INTO `sys_oper_log` VALUES (184, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:34', 3);
INSERT INTO `sys_oper_log` VALUES (185, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:35', 3);
INSERT INTO `sys_oper_log` VALUES (186, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:12:37', 2);
INSERT INTO `sys_oper_log` VALUES (187, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\r\n### The error may exist in file [D:\\Java17\\实习项目\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Account\\AccountsMapper.xml]\r\n### The error may involve com.ruoyi.Admit.mapper.AccountsMapper.updateAccounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update accounts                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3', '2024-06-06 15:14:59', 5);
INSERT INTO `sys_oper_log` VALUES (188, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\r\n### The error may exist in file [D:\\Java17\\实习项目\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Account\\AccountsMapper.xml]\r\n### The error may involve com.ruoyi.Admit.mapper.AccountsMapper.updateAccounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update accounts                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3', '2024-06-06 15:15:02', 2);
INSERT INTO `sys_oper_log` VALUES (189, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\r\n### The error may exist in file [D:\\Java17\\实习项目\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Account\\AccountsMapper.xml]\r\n### The error may involve com.ruoyi.Admit.mapper.AccountsMapper.updateAccounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update accounts                    where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = null\' at line 3', '2024-06-06 15:15:10', 3);
INSERT INTO `sys_oper_log` VALUES (190, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"2\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"3\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:15:23', 2);
INSERT INTO `sys_oper_log` VALUES (191, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇俊\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:15:43', 2);
INSERT INTO `sys_oper_log` VALUES (192, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇俊\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:15:44', 1);
INSERT INTO `sys_oper_log` VALUES (193, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:15:49', 1);
INSERT INTO `sys_oper_log` VALUES (194, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:15:49', 4);
INSERT INTO `sys_oper_log` VALUES (195, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:23:15', 3);
INSERT INTO `sys_oper_log` VALUES (196, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:23:15', 2);
INSERT INTO `sys_oper_log` VALUES (197, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:23:15', 2);
INSERT INTO `sys_oper_log` VALUES (198, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"ll\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:23:31', 2);
INSERT INTO `sys_oper_log` VALUES (199, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:29:35', 11);
INSERT INTO `sys_oper_log` VALUES (200, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:29:55', 3);
INSERT INTO `sys_oper_log` VALUES (201, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:32:50', 9);
INSERT INTO `sys_oper_log` VALUES (202, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:32:51', 2);
INSERT INTO `sys_oper_log` VALUES (203, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:32:51', 4);
INSERT INTO `sys_oper_log` VALUES (204, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:32:53', 3);
INSERT INTO `sys_oper_log` VALUES (205, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:32:54', 2);
INSERT INTO `sys_oper_log` VALUES (206, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:34:41', 22133);
INSERT INTO `sys_oper_log` VALUES (207, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:37:03', 15);
INSERT INTO `sys_oper_log` VALUES (208, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:37:33', 14);
INSERT INTO `sys_oper_log` VALUES (209, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"identity\":\"评委\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:40:17', 14);
INSERT INTO `sys_oper_log` VALUES (210, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"luj\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:41:30', 7);
INSERT INTO `sys_oper_log` VALUES (211, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:41:57', 3);
INSERT INTO `sys_oper_log` VALUES (212, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:42:16', 3);
INSERT INTO `sys_oper_log` VALUES (213, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:42:16', 2);
INSERT INTO `sys_oper_log` VALUES (214, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"identity\":\"1\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"公共基础课程组\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:42:43', 3);
INSERT INTO `sys_oper_log` VALUES (215, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"identity\":\"1\",\"name\":\"李勇俊\",\"params\":{},\"school\":\"安徽工业大学\",\"scope\":\"公共基础课程组\",\"userName\":\"lyj031\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:43:07', 3);
INSERT INTO `sys_oper_log` VALUES (216, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:46:05', 24330);
INSERT INTO `sys_oper_log` VALUES (217, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:47:20', 50561);
INSERT INTO `sys_oper_log` VALUES (218, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:49:29', 14);
INSERT INTO `sys_oper_log` VALUES (219, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:49:30', 2);
INSERT INTO `sys_oper_log` VALUES (220, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:49:31', 2);
INSERT INTO `sys_oper_log` VALUES (221, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:49:32', 3);
INSERT INTO `sys_oper_log` VALUES (222, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:49:47', 4);
INSERT INTO `sys_oper_log` VALUES (223, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":4,\"identity\":\"1\",\"name\":\"mky\",\"params\":{},\"school\":\"安徽大学\",\"scope\":\"2\",\"userName\":\"mky225\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:51:15', 15);
INSERT INTO `sys_oper_log` VALUES (224, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":0,\"name\":\"lujdd\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:51:27', 3);
INSERT INTO `sys_oper_log` VALUES (225, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:51:45', 4);
INSERT INTO `sys_oper_log` VALUES (226, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-06 15:57:32', 7);
INSERT INTO `sys_oper_log` VALUES (227, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 15:57:47', 4);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品ID\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:19\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:19\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:19\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 16:12:11', 58);
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"works\",\"className\":\"Works\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"作品ID\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 16:12:11\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"作品名称\",\"columnId\":9,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 16:12:11\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"参赛姓名\",\"columnId\":10,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 16:12:11\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":11,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 00:38:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 16:16:17', 33);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"works\"}', NULL, 0, NULL, '2024-06-06 16:16:22', 132);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评价ID\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:22\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品ID\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:22\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 12:21:22\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"评委姓名\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 17:45:06', 56);
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"evaluations\",\"className\":\"Evaluations\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评价ID\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 17:45:06\",\"usableColumn\":false},{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品ID\",\"columnId\":26,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 17:45:06\",\"usableColumn\":false},{\"capJavaField\":\"AccountId\",\"columnComment\":\"账户ID\",\"columnId\":27,\"columnName\":\"account_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"accountId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-06-06 17:45:06\",\"usableColumn\":false},{\"capJavaField\":\"ReviewerName\",\"columnComment\":\"评委姓名\",\"columnId\":28,\"columnName\":\"reviewer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 01:43:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 17:45:37', 38);
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"evaluations\"}', NULL, 0, NULL, '2024-06-06 17:45:40', 120);
INSERT INTO `sys_oper_log` VALUES (234, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2024-06-07 10:47:26', 379);
INSERT INTO `sys_oper_log` VALUES (235, '作品管理', 5, 'com.ruoyi.Admit.controller.WorksController.export()', 'POST', 1, 'admin', '研发部门', '/Works/works/export', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2024-06-07 10:54:54', 27);
INSERT INTO `sys_oper_log` VALUES (236, '评价管理', 5, 'com.ruoyi.Admit.controller.EvaluationsController.export()', 'POST', 1, 'admin', '研发部门', '/Evaluations/evaluations/export', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2024-06-07 11:18:49', 407);
INSERT INTO `sys_oper_log` VALUES (237, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-06-07 11:22:46', 23);
INSERT INTO `sys_oper_log` VALUES (238, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"name\":\"李勇\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 13:40:12', 9);
INSERT INTO `sys_oper_log` VALUES (239, '账号管理', 1, 'com.ruoyi.Admit.controller.AccountsController.add()', 'POST', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":5,\"identity\":\"1\",\"name\":\"mky\",\"params\":{},\"school\":\"安徽大学\",\"scope\":\"2\",\"userName\":\"mky225\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 13:40:28', 7);
INSERT INTO `sys_oper_log` VALUES (240, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-07 13:40:41', 5);
INSERT INTO `sys_oper_log` VALUES (241, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/4', '127.0.0.1', '内网IP', '{\"4\":\"\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-07 13:40:49', 3);
INSERT INTO `sys_oper_log` VALUES (242, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/4', '127.0.0.1', '内网IP', '{\"5\":\"\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-07 13:41:06', 2);
INSERT INTO `sys_oper_log` VALUES (243, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/4', '127.0.0.1', '内网IP', '{\"5\":\"\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-06-07 13:41:07', 3);
INSERT INTO `sys_oper_log` VALUES (244, '账号管理', 3, 'com.ruoyi.Admit.controller.AccountsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Account/account/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 13:41:16', 3);
INSERT INTO `sys_oper_log` VALUES (245, '账号管理', 5, 'com.ruoyi.Admit.controller.AccountsController.export()', 'POST', 1, 'admin', '研发部门', '/Account/account/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2024-06-07 13:41:40', 360);
INSERT INTO `sys_oper_log` VALUES (246, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 16:17:52', 11);
INSERT INTO `sys_oper_log` VALUES (247, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 16:24:22', 19);
INSERT INTO `sys_oper_log` VALUES (248, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 23:34:21', 18);
INSERT INTO `sys_oper_log` VALUES (249, '账号管理', 2, 'com.ruoyi.Admit.controller.AccountsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Account/account', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-07 23:50:20', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-06-05 20:46:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-06-05 20:46:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-06-05 20:46:47', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-07 23:13:49', 'admin', '2024-06-05 20:46:47', '', '2024-06-07 23:13:48', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-05 20:46:47', 'admin', '2024-06-05 20:46:47', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `account_id` int NOT NULL,
  `teachers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class_record` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lesson_planning` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lesson_report` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `training_report` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `standards` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `submission_time` datetime NULL DEFAULT NULL,
  `views` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` double NULL DEFAULT NULL,
  `entry_form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message_book` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of works
-- ----------------------------
INSERT INTO `works` VALUES (1, '互联网', 'lyj', 1, '某某', '软件工程', '#####', '15178380838', '#', '#', '#', '#', '#', '#', '2024-06-06 01:21:18', '#', NULL, '#', '#');
INSERT INTO `works` VALUES (2, '数学建模', 'zs', 2, '某某', '数学', '#####', '1856147892', '#', '#', '#', '#', '#', '#', '2024-06-08 15:26:57', '#', NULL, '#', '#');
INSERT INTO `works` VALUES (3, '蓝桥杯', 'ls', 3, '某某', '计算机', '#####', '19825647853', '#', '#', '#', '#', '#', '#', '2024-05-29 15:28:06', '#', NULL, '#', '#');

SET FOREIGN_KEY_CHECKS = 1;
