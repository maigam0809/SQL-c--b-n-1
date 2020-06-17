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

 Date: 06/05/2020 10:15:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sach
-- ----------------------------
DROP TABLE IF EXISTS `sach`;
CREATE TABLE `sach`  (
  `ma_sach` int(11) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ma_tac_gia` int(11) NOT NULL,
  `ma_xuat_ban` int(11) NOT NULL,
  `so_trang` int(11) NOT NULL,
  `so_luong_ban_sao` int(11) NULL DEFAULT NULL,
  `gia_tien` int(11) NULL DEFAULT NULL,
  `ngay_nhap_kho` date NULL DEFAULT NULL,
  `vi_tri_dat_sach` int(11) NULL DEFAULT NULL,
  `ma_loai_sach` int(11) NOT NULL,
  PRIMARY KEY (`ma_sach`) USING BTREE,
  INDEX `ma_tac_gia`(`ma_tac_gia`) USING BTREE,
  INDEX `ma_xuat_ban`(`ma_xuat_ban`) USING BTREE,
  INDEX `ma_loai_sach`(`ma_loai_sach`) USING BTREE,
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`ma_tac_gia`) REFERENCES `tac_gia` (`ma_tac_gia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`ma_xuat_ban`) REFERENCES `xuat_ban` (`ma_xuat_ban`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sach_ibfk_3` FOREIGN KEY (`ma_loai_sach`) REFERENCES `loai_sach` (`ma_loai_sach`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sach
-- ----------------------------
INSERT INTO `sach` VALUES (1, 'SQL cơ bản', 1, 1, 23, 7, 1, '2019-02-02', 1, 1);
INSERT INTO `sach` VALUES (2, 'SQL nâng cao', 2, 2, 45, 9, 2, '2017-02-02', 3, 1);
INSERT INTO `sach` VALUES (3, 'HTML ', 3, 2, 34, 10, 3, '2018-09-08', 4, 1);

SET FOREIGN_KEY_CHECKS = 1;
