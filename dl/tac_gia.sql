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

 Date: 06/05/2020 10:15:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tac_gia
-- ----------------------------
DROP TABLE IF EXISTS `tac_gia`;
CREATE TABLE `tac_gia`  (
  `ma_tac_gia` int(11) NOT NULL AUTO_INCREMENT,
  `ten_tac_gia` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_tac_gia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tac_gia
-- ----------------------------
INSERT INTO `tac_gia` VALUES (1, 'Lương Viết tú');
INSERT INTO `tac_gia` VALUES (2, 'Tiến thiều');
INSERT INTO `tac_gia` VALUES (3, 'Tiến đạt');
INSERT INTO `tac_gia` VALUES (4, 'Mai đạo');
INSERT INTO `tac_gia` VALUES (5, 'Trần ánh');
INSERT INTO `tac_gia` VALUES (6, 'Nguyến mai');

SET FOREIGN_KEY_CHECKS = 1;
