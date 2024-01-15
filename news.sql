/*
 Navicat Premium Data Transfer

 Source Server         : yy
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : javaweb

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 15/01/2024 15:19:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `NewsID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PublishTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`NewsID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '第一条新闻标题', '这是第一条', '2023-12-29 09:29:03');
INSERT INTO `news` VALUES (2, '第二条', '2222', '2023-12-29 09:53:46');
INSERT INTO `news` VALUES (3, '第三个新闻', '第三个新闻的内容', '2023-12-31 10:29:02');
INSERT INTO `news` VALUES (4, '第4个新闻', '第4个新闻的内容', '2023-12-31 10:30:03');
INSERT INTO `news` VALUES (5, '第5个新闻', '第5个新闻的内容', '2023-12-31 10:30:07');
INSERT INTO `news` VALUES (6, '第6个新闻', '第6个新闻的内容', '2023-12-31 10:30:11');
INSERT INTO `news` VALUES (7, '新闻标题20240114', '11111111111111111111111111111', '2024-01-14 17:59:33');
INSERT INTO `news` VALUES (11, '数字三角形（SDUToj-1730）', '爱神的箭是', '2024-01-14 18:48:06');
INSERT INTO `news` VALUES (17, '222222', '1144554', '2024-01-14 20:43:22');
INSERT INTO `news` VALUES (16, '汉字', '啊啊啊啊', '2024-01-14 19:51:08');
INSERT INTO `news` VALUES (15, '新闻标题20240114', '11', '2024-01-14 18:22:22');

SET FOREIGN_KEY_CHECKS = 1;
