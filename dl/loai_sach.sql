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

 Date: 06/05/2020 10:14:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for loai_sach
-- ----------------------------
DROP TABLE IF EXISTS `loai_sach`;
CREATE TABLE `loai_sach`  (
  `ma_loai_sach` int(11) NOT NULL AUTO_INCREMENT,
  `ten_loai_sach` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_loai_sach`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loai_sach
-- ----------------------------
INSERT INTO `loai_sach` VALUES (1, 'IT');
INSERT INTO `loai_sach` VALUES (2, 'Du lịch');
INSERT INTO `loai_sach` VALUES (3, 'Khách sạn');
INSERT INTO `loai_sach` VALUES (4, 'Đồ họa');
INSERT INTO `loai_sach` VALUES (5, 'Làm đẹp');
INSERT INTO `loai_sach` VALUES (6, 'PR');
INSERT INTO `loai_sach` VALUES (7, 'Sự kiện');

SET FOREIGN_KEY_CHECKS = 1;
