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

 Date: 15/01/2024 15:19:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IsAdmin` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zy', '1@qq.com', '123456a', 1);
INSERT INTO `users` VALUES (3, 'asd', '2@qq.com', '123aaa', 0);
INSERT INTO `users` VALUES (4, 'zy2', '3@qq.com', '1sssddd', 0);
INSERT INTO `users` VALUES (5, 'zy222', '4@qq.com', '234sas', 0);
INSERT INTO `users` VALUES (6, 'zy123', '5@qq.com', '123456a', 0);
INSERT INTO `users` VALUES (7, 'zy1234', '13@qq.com', '11sads', 0);
INSERT INTO `users` VALUES (8, '1as', '1433861364@qq.com', '1sdasd', 0);
INSERT INTO `users` VALUES (9, '1111d', '111@qq.com', '123qaz', 0);
INSERT INTO `users` VALUES (10, 'wszy', '23567@qq.com', 'dandan1', 0);
INSERT INTO `users` VALUES (11, 'asdfa', '14338613sad64@qq.com', 'asdfghjk', 1);
INSERT INTO `users` VALUES (12, 'zyaaa', '14338613sad64ss@qq.com', 'asdfghjk1', 1);

SET FOREIGN_KEY_CHECKS = 1;
