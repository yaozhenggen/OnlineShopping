/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : userdb

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2017-11-14 09:58:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookname` varchar(255) NOT NULL,
  `author` varchar(20) NOT NULL,
  `pression` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('JSP设计与开发', '陈磊', '北京理工大学出版社', '52');
INSERT INTO `book` VALUES ('ASP.NET程序开发', '徐受蓉', '人民邮电出版社', '54');
INSERT INTO `book` VALUES ('Android程序开发', '高成珍', '人民邮电出版社', '64');
INSERT INTO `book` VALUES ('XML程序开发', '传智播客', '人民邮电出版社', '50');
INSERT INTO `book` VALUES ('HTML+CSS', '传智播客', '中国铁道出版社', '45');
INSERT INTO `book` VALUES ('Java基础入门', '传智播客', '中国铁道出版社', '55');
INSERT INTO `book` VALUES ('java Web程序开发', '传智播客', '中国铁道出版社', '66');
INSERT INTO `book` VALUES ('C#程序设计', '传智播客', '中国铁道出版社', '77');
INSERT INTO `book` VALUES ('C语音程序设计', '传智播客', '中国铁道出版社', '88');
INSERT INTO `book` VALUES ('SSH框架整合实战教程', '传智播客', '中国铁道出版社', '99');
INSERT INTO `book` VALUES ('MySQL数据库入门', '传智播客', '中国铁道出版社', '110');
INSERT INTO `book` VALUES ('ISO开发项目化经典教程', '传智播客', '中国铁道出版社', '120');
INSERT INTO `book` VALUES ('PHP网站开发实例教程', '传智播客', '中国铁道出版社', '130');
INSERT INTO `book` VALUES ('Java EE核心框架实战', '高洪岩', '人民邮电出版社', '86');
INSERT INTO `book` VALUES ('Struts 2+Hibernate+Spring整合开发技术详解', '许勇', '清华大学出版社', '96');
INSERT INTO `book` VALUES ('JSP设计', '鲍格斯坦', '科学出版社', '76');
