/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : stugl

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 02/10/2021 23:33:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `cname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(0) NOT NULL,
  `remake` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(0) NOT NULL,
  `weekday` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lesson` int(0) NOT NULL,
  `status` tinyint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `easyuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (25, 'MySql数据库', 0, '', 2, '星期一', 'J060 402', '08:10-09:50', 1, 1);
INSERT INTO `course` VALUES (28, 'PHP基础', 0, '', 2, '星期一', 'J060 506', '14:10-15:50', 1, 1);
INSERT INTO `course` VALUES (29, '网页设计', 0, '', 3, '星期一', 'J060 406', '08:10-09:50', 0, 1);
INSERT INTO `course` VALUES (30, 'JS进阶', 0, '', 3, '星期一', 'J060 504', '10:30-12:10', 0, 1);
INSERT INTO `course` VALUES (31, '计算机', 23, '', 2, '星期二', 'J060 504', '08:10-09:50', 24, 0);
INSERT INTO `course` VALUES (32, 'C语言', 3, '', 3, '星期三', 'J060 612', '16:30-18:10', 20, 0);
INSERT INTO `course` VALUES (33, 'C程序设计', 1, '', 3, '星期二', 'J060 402', '08:10-09:50', 28, 1);
INSERT INTO `course` VALUES (34, 'C程序设计1', 1, '', 3, '星期二', 'J060 705', '10:30-12:10', 28, 1);
INSERT INTO `course` VALUES (35, '大数据', 21, '', 1, '星期四', 'J060 705', '10:30-12:10', 21, 1);
INSERT INTO `course` VALUES (36, 'c程序', 1, '', 1, '星期六', 'J060 707', '14:10-15:50', 2, 1);
INSERT INTO `course` VALUES (37, 'php', 22, '', 1, '星期四', 'J060 406', '14:10-15:50', 12, 1);

-- ----------------------------
-- Table structure for easyuser
-- ----------------------------
DROP TABLE IF EXISTS `easyuser`;
CREATE TABLE `easyuser`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(0) NOT NULL,
  `state` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easyuser
-- ----------------------------
INSERT INTO `easyuser` VALUES (1, 'admin', '123456', '3280723@qq.com', 1, 1);
INSERT INTO `easyuser` VALUES (2, 'system', '123456', '228172785@qq.com', 1, 1);
INSERT INTO `easyuser` VALUES (3, 'teacher1', '123456', '3280723@qq.com', 2, 1);
INSERT INTO `easyuser` VALUES (4, 'teacher2', '123456', '3280723@qq.com', 2, 1);
INSERT INTO `easyuser` VALUES (10, 'student1', '123456', '123@qq.com', 3, 1);
INSERT INTO `easyuser` VALUES (11, 'student2', '123456', '123@qq.com', 3, 1);
INSERT INTO `easyuser` VALUES (12, 'student3', '123456', '3280723@qq.com', 3, 1);
INSERT INTO `easyuser` VALUES (13, 'student4', '123456', '123@qq.com', 3, 1);
INSERT INTO `easyuser` VALUES (14, 'student5', '123456', '123@qq.com', 3, 1);

-- ----------------------------
-- Table structure for loginrecord
-- ----------------------------
DROP TABLE IF EXISTS `loginrecord`;
CREATE TABLE `loginrecord`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE,
  CONSTRAINT `name` FOREIGN KEY (`username`) REFERENCES `easyuser` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loginrecord
-- ----------------------------
INSERT INTO `loginrecord` VALUES ('system', 38, '2020-10-28', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 39, '2020-10-29', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test1', 40, '2020-10-29', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 41, '2020-10-29', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 43, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 44, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test1', 45, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test1', 46, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test1', 47, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test3', 48, '2020-10-30', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 50, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 52, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 54, '2020-10-31', '127.0.0.1');
INSERT INTO `loginrecord` VALUES ('teacher2', 55, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 57, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 59, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 60, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher2', 61, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 62, '2020-10-31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher2', 63, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher3', 65, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher3', 67, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 68, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 69, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher4', 70, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 72, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 74, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 75, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 77, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher3', 78, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 79, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher2', 80, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher7', 81, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher7', 82, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher7', 83, '2020-11-05', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 86, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 87, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 88, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 89, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 90, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 91, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 92, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 93, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher5', 94, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 96, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 97, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('student1', 99, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 100, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 101, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 102, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 104, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 105, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 106, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 107, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 108, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 109, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 110, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 111, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 112, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 113, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 114, '2020-11-06', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 115, '2020-11-09', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 116, '2020-11-11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 117, '2020-11-11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 121, '2020-11-11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher2', 122, '2020-11-11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('teacher1', 125, '2020-11-11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('test37', 130, '2020-11-13', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 136, '2020-11-14  10:32:40', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 138, '2020-11-14  11:45:43', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('system', 140, '2020-11-14 11:55:11', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 141, '2020-11-14 17:47:50', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 142, '2020-11-17 09:33:52', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 143, '2020-11-17 21:09:59', '192.168.137.22');
INSERT INTO `loginrecord` VALUES ('admin', 144, '2020-11-21 11:16:45', '192.168.43.144');
INSERT INTO `loginrecord` VALUES ('system', 145, '2020-11-21 11:18:00', '192.168.43.144');
INSERT INTO `loginrecord` VALUES ('admin', 146, '2020-11-21 11:19:06', '192.168.43.144');
INSERT INTO `loginrecord` VALUES ('admin', 147, '2020-11-21 11:24:14', '192.168.43.144');
INSERT INTO `loginrecord` VALUES ('admin', 148, '2020-11-27 09:52:17', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('admin', 149, '2020-11-27 09:54:32', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('admin', 150, '2020-11-27 09:54:51', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('system', 151, '2020-11-27 09:55:33', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('system', 152, '2020-11-27 10:06:51', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('teacher1', 153, '2020-11-27 10:12:17', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('admin', 155, '2020-11-27 11:10:08', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('test80', 156, '2020-11-27 11:15:25', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('test80', 157, '2020-11-27 11:19:26', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('admin', 158, '2020-11-27 11:20:08', '192.168.43.245');
INSERT INTO `loginrecord` VALUES ('admin', 159, '2020-11-27 15:58:17', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 160, '2020-11-27 15:58:39', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 161, '2020-11-27 16:01:08', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 162, '2020-11-27 19:48:41', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 163, '2020-11-27 19:53:04', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('teacher1', 164, '2020-11-27 19:53:39', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 165, '2020-11-27 19:55:35', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 166, '2020-11-28 12:27:56', '127.0.0.1');
INSERT INTO `loginrecord` VALUES ('admin', 167, '2020-11-28 12:51:29', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 168, '2020-11-28 14:25:19', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 169, '2020-11-28 15:42:01', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 170, '2020-11-28 16:13:09', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 171, '2020-11-28 16:15:32', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 172, '2020-11-28 16:49:40', '192.168.43.24');
INSERT INTO `loginrecord` VALUES ('admin', 173, '2020-12-05 21:34:53', '192.168.43.187');
INSERT INTO `loginrecord` VALUES ('admin', 174, '2020-12-05 21:37:46', '192.168.43.187');
INSERT INTO `loginrecord` VALUES ('admin', 175, '2020-12-12 15:29:25', '192.168.43.140');
INSERT INTO `loginrecord` VALUES ('admin', 176, '2020-12-12 15:29:40', '192.168.43.140');
INSERT INTO `loginrecord` VALUES ('admin', 177, '2020-12-12 15:30:01', '192.168.43.140');
INSERT INTO `loginrecord` VALUES ('admin', 178, '2020-12-12 15:30:20', '192.168.43.140');
INSERT INTO `loginrecord` VALUES ('admin', 179, '2020-12-13 18:06:32', '192.168.137.213');
INSERT INTO `loginrecord` VALUES ('admin', 180, '2020-12-13 23:19:34', '192.168.137.213');
INSERT INTO `loginrecord` VALUES ('admin', 181, '2020-12-17 16:28:44', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 182, '2020-12-17 16:28:44', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 183, '2020-12-17 16:29:16', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 184, '2020-12-17 16:32:16', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 185, '2020-12-17 16:36:00', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('test90', 186, '2020-12-17 16:38:34', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 187, '2020-12-17 16:41:17', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 188, '2020-12-17 16:45:47', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 189, '2020-12-17 16:49:21', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 190, '2020-12-17 16:51:03', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 191, '2020-12-17 16:52:12', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 192, '2020-12-17 16:52:28', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 193, '2020-12-17 16:54:05', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 194, '2020-12-17 16:54:14', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 195, '2020-12-17 16:57:12', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 196, '2020-12-17 16:57:29', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 197, '2020-12-17 16:59:22', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('test91', 198, '2020-12-17 17:05:46', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('test91', 199, '2020-12-17 17:05:59', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('test91', 200, '2020-12-17 17:09:42', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 201, '2020-12-17 17:10:10', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 202, '2020-12-17 17:10:24', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 203, '2020-12-17 17:13:21', '192.168.137.236');
INSERT INTO `loginrecord` VALUES ('admin', 204, '2020-12-19 10:13:06', '192.168.43.192');
INSERT INTO `loginrecord` VALUES ('admin', 205, '2020-12-19 10:21:25', '192.168.43.192');
INSERT INTO `loginrecord` VALUES ('admin', 206, '2020-12-19 10:38:52', '192.168.43.192');
INSERT INTO `loginrecord` VALUES ('admin', 207, '2020-12-19 10:43:01', '192.168.43.192');
INSERT INTO `loginrecord` VALUES ('admin', 208, '2020-12-30 18:57:06', '172.20.10.10');
INSERT INTO `loginrecord` VALUES ('admin', 209, '2020-12-30 18:58:02', '172.20.10.10');
INSERT INTO `loginrecord` VALUES ('admin', 210, '2021-01-13 11:56:31', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 211, '2021-01-13 11:56:43', '192.168.43.17');
INSERT INTO `loginrecord` VALUES ('admin', 212, '2021-09-26 01:08:56', '192.168.81.1');
INSERT INTO `loginrecord` VALUES ('student1', 213, '2021-09-26 01:10:36', '192.168.81.1');
INSERT INTO `loginrecord` VALUES ('admin', 214, '2021-10-02 21:34:02', '192.168.81.1');

-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES (50, '个人中心', '/self');
INSERT INTO `mainmenu` VALUES (100, '权限管理', '/admin');
INSERT INTO `mainmenu` VALUES (200, '学生管理', '/use');
INSERT INTO `mainmenu` VALUES (300, '学生中心', '/stu');
INSERT INTO `mainmenu` VALUES (400, '访问记录', '/log');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(0) NOT NULL,
  `roleName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT NULL,
  `ps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 1, 1, '负责添加用户，角色修改、权限、课程审核等');
INSERT INTO `role` VALUES (2, '教师', 2, 1, '添加课程、课表');
INSERT INTO `role` VALUES (3, '学生', 3, 1, '选课、退课、查课表');
INSERT INTO `role` VALUES (4, '游客', 4, 1, '通过注册页面注册的角色');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `roleId` int(0) NULL DEFAULT NULL,
  `menuid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `menuid`(`menuid`) USING BTREE,
  CONSTRAINT `rolemenu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rolemenu_ibfk_2` FOREIGN KEY (`menuid`) REFERENCES `submenu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 265 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (210, 2, 103);
INSERT INTO `rolemenu` VALUES (211, 2, 202);
INSERT INTO `rolemenu` VALUES (212, 2, 203);
INSERT INTO `rolemenu` VALUES (213, 3, 103);
INSERT INTO `rolemenu` VALUES (214, 3, 301);
INSERT INTO `rolemenu` VALUES (215, 3, 302);
INSERT INTO `rolemenu` VALUES (216, 3, 303);
INSERT INTO `rolemenu` VALUES (217, 3, 304);
INSERT INTO `rolemenu` VALUES (218, 4, 103);
INSERT INTO `rolemenu` VALUES (253, 1, 103);
INSERT INTO `rolemenu` VALUES (254, 1, 101);
INSERT INTO `rolemenu` VALUES (255, 1, 102);
INSERT INTO `rolemenu` VALUES (256, 1, 201);
INSERT INTO `rolemenu` VALUES (257, 1, 202);
INSERT INTO `rolemenu` VALUES (258, 1, 203);
INSERT INTO `rolemenu` VALUES (259, 1, 301);
INSERT INTO `rolemenu` VALUES (260, 1, 302);
INSERT INTO `rolemenu` VALUES (261, 1, 303);
INSERT INTO `rolemenu` VALUES (262, 1, 304);
INSERT INTO `rolemenu` VALUES (263, 1, 401);
INSERT INTO `rolemenu` VALUES (264, 1, 402);

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source`  (
  `sid` int(0) NOT NULL AUTO_INCREMENT,
  `cid` int(0) NOT NULL,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `easyuser` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES (4, 33, 'admin');
INSERT INTO `source` VALUES (5, 34, 'admin');
INSERT INTO `source` VALUES (6, 35, 'admin');
INSERT INTO `source` VALUES (7, 25, 'admin');
INSERT INTO `source` VALUES (8, 36, 'admin');
INSERT INTO `source` VALUES (10, 37, 'admin');
INSERT INTO `source` VALUES (11, 28, 'student1');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `submenu_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `mainmenu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES (101, '用户权限', '/user', 100);
INSERT INTO `submenu` VALUES (102, '角色权限', '/rights', 100);
INSERT INTO `submenu` VALUES (103, '个人信息', '/info', 50);
INSERT INTO `submenu` VALUES (201, '课程审核', '/verify', 200);
INSERT INTO `submenu` VALUES (202, '课程管理', '/course', 200);
INSERT INTO `submenu` VALUES (203, '成绩管理', '/cjgl', 200);
INSERT INTO `submenu` VALUES (301, '课程选择', '/source', 300);
INSERT INTO `submenu` VALUES (302, '我的选课', '/mycourse', 300);
INSERT INTO `submenu` VALUES (303, '课表查看', '/mysource', 300);
INSERT INTO `submenu` VALUES (304, '成绩查询', '/cjcx', 300);
INSERT INTO `submenu` VALUES (401, '访问次数', '/visit', 400);
INSERT INTO `submenu` VALUES (402, '访问列表', '/visitor', 400);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `trueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uname`(`username`) USING BTREE,
  CONSTRAINT `uname` FOREIGN KEY (`username`) REFERENCES `easyuser` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (4, '王老师', 'teacher1', '男', '1985-10-10T16:00:00.000Z', '重庆江北', '17784575743', '511234198510111112');
INSERT INTO `user_info` VALUES (5, '管理员', 'admin', '男', '1996-09-11T16:00:00.000Z', '重庆渝北', '1239340', '323546558769');

SET FOREIGN_KEY_CHECKS = 1;
