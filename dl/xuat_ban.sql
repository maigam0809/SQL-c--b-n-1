/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : quan_ly_thu_vien

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 06/05/2020 10:16:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xuat_ban
-- ----------------------------
DROP TABLE IF EXISTS `xuat_ban`;
CREATE TABLE `xuat_ban`  (
  `ma_xuat_ban` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nha_xuat_ban` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_xuat_ban`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xuat_ban
-- ----------------------------
INSERT INTO `xuat_ban` VALUES (1, 'Kim đồng');
INSERT INTO `xuat_ban` VALUES (2, 'FPT');
INSERT INTO `xuat_ban` VALUES (3, 'Giáo dục');
INSERT INTO `xuat_ban` VALUES (4, 'Nhà văn ');
INSERT INTO `xuat_ban` VALUES (5, 'Tư pháp');
INSERT INTO `xuat_ban` VALUES (6, 'Lao động');
INSERT INTO `xuat_ban` VALUES (7, 'Vận tải');
INSERT INTO `xuat_ban` VALUES (8, 'Truyền thông');

SET FOREIGN_KEY_CHECKS = 1;
