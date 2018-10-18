/*
Navicat MySQL Data Transfer

Source Server         : 119.23.106.146
Source Server Version : 50723
Source Host           : 119.23.106.146:3306
Source Database       : answer

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-10-17 17:27:23
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS answer default charset utf8 COLLATE utf8_general_ci;

USE answer;

-- ----------------------------
-- Table structure for `smw_user`
-- ----------------------------
DROP TABLE IF EXISTS `smw_user`;
CREATE TABLE `smw_user` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(55) DEFAULT NULL,
  `sex` tinyint(3) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smw_user
-- ----------------------------
INSERT INTO `smw_user` VALUES ('1', 'answer', '1', '123456', 'answer_ljm@163.com', 'sz', '2018-10-16 11:10:47', '2018-10-16 11:10:50');
INSERT INTO `smw_user` VALUES ('2', 'admin', '1', '123456', 'admin@qq.com', 'sz', '2018-10-16 11:10:47', '2018-10-16 11:10:50');
