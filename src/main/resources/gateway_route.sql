/*
Navicat MySQL Data Transfer

Source Server         : ismy
Source Server Version : 50725
Source Host           : youxiu326.xin:3306
Source Database       : super_man

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-03-02 14:55:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `gateway_route`;
CREATE TABLE `gateway_route` (
  `id` bigint(28) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(64) DEFAULT NULL,
  `uri` varchar(100) DEFAULT NULL COMMENT '转发地址',
  `predicates` varchar(200) DEFAULT NULL COMMENT '访问路径',
  `filters` varchar(100) DEFAULT NULL COMMENT '过滤',
  `order_` varchar(2) DEFAULT '0' COMMENT '顺序',
  `creator_id` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_id` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gateway_route
-- ----------------------------
INSERT INTO `gateway_route` VALUES ('1', 'serviceNode1', 'http://baidu.com', '/api-baidu/**', '1', '0', '', '2020-03-02 00:05:59', '', '2020-03-02 00:50:27', null, '0');
INSERT INTO `gateway_route` VALUES ('2', 'serviceNode2', 'https://www.taobao.com/', '/api-taobao/**', '1', '0', '', '2020-03-02 00:51:30', null, null, null, '0');
