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

 Date: 06/05/2020 10:19:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sinh_vien
-- ----------------------------
DROP TABLE IF EXISTS `sinh_vien`;
CREATE TABLE `sinh_vien`  (
  `ma_sinh_vien` int(11) NOT NULL AUTO_INCREMENT,
  `ten_sinh_vien` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngay_het_han_the` date NOT NULL,
  `ma_chuyen_nganh` int(11) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sdt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ma_sinh_vien`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `ma_chuyen_nganh`(`ma_chuyen_nganh`) USING BTREE,
  CONSTRAINT `sinh_vien_ibfk_1` FOREIGN KEY (`ma_chuyen_nganh`) REFERENCES `chuyen_nganh` (`ma_chuyen_nganh`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sinh_vien
-- ----------------------------
INSERT INTO `sinh_vien` VALUES (1, 'Mai Thị Gấm', '2022-08-01', 1, 'gammtph10005@fpt.edu.vn', '0344358618');
INSERT INTO `sinh_vien` VALUES (2, 'Đặng Đình Phương', '2022-09-05', 1, 'phuongddph10045@fpt.efu.vn', '0383438794');
INSERT INTO `sinh_vien` VALUES (3, 'Nguyễn văn Du', '2022-07-03', 1, 'dunvph10007@fpt.edu.vn', '0345476786');
INSERT INTO `sinh_vien` VALUES (4, 'Vũ Diệu Linh', '2022-10-01', 1, 'linhvdph09988@fpt.edu.vn', '0348792197');
INSERT INTO `sinh_vien` VALUES (5, 'Lương Tú', '2024-01-01', 2, 'tuluong@gmaiul.com', '0376264926');

SET FOREIGN_KEY_CHECKS = 1;
