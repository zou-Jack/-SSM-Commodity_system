/*
Navicat MySQL Data Transfer

Source Server         : zou
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : luoyuluoyu

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-04-15 13:22:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL COMMENT '商品名称',
  `price` float(10,1) NOT NULL COMMENT '商品定价',
  `detail` text COMMENT '商品描述',
  `pic` varchar(64) default NULL COMMENT '商品图片',
  `createtime` datetime NOT NULL COMMENT '生产日期',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('4', '美女', '1000.0', '很漂亮', 'e896c1e2-bc4d-45e6-9d45-7d08ed8e4845.jpg', '2018-03-22 00:00:00');
INSERT INTO `items` VALUES ('5', '图片测试', '12.0', '上传图片测试', '0a6b16fa-e533-4d38-b345-96087ad100eb.png', '2018-03-31 00:00:00');
INSERT INTO `items` VALUES ('6', '测试', '10.0', '图片上传测试', '127abc49-2672-4103-b435-f0abdfe9af64.png', '2018-03-31 00:00:00');
INSERT INTO `items` VALUES ('7', '测试', '12.0', '测试', '9ad09b30-190b-4421-b32e-ff6e9441661a.png', '2018-02-28 00:00:00');
INSERT INTO `items` VALUES ('8', '测试', '10.0', '测试', 'cb6d513e-d19a-4f3d-8604-dc45cd0068ab.png', '2018-04-01 00:00:00');
INSERT INTO `items` VALUES ('9', '打', '321.0', '阿达', '4520a466-281b-4874-b1cb-c133c9be349b.png', '2018-04-01 00:00:00');
INSERT INTO `items` VALUES ('10', '测试', '12.0', '大四的', 'd043aac9-1eeb-49dd-b8cb-4d0b0b669f91.png', '2018-04-01 00:00:00');
INSERT INTO `items` VALUES ('12', '测试', '13.0', '测试', 'f3ec35bc-b0f5-4f77-9001-b440584cb4dd.png', '2018-04-01 00:00:00');
INSERT INTO `items` VALUES ('13', '阿达的', '55.0', '打', 'b76f6b8b-bccd-42ce-ba5a-11b6ff36760d.jpg', '2018-04-01 00:00:00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(32) NOT NULL COMMENT '用户名称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `birthday` date default NULL COMMENT '注册日期',
  `sex` char(1) default NULL COMMENT '性别,"男"“女”',
  `address` varchar(256) default NULL COMMENT '地址',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '2018-03-31', '1', '贵州贵阳');
INSERT INTO `user` VALUES ('2', 'zoutao', '123456', '2018-04-01', '1', '美国纽约市');
