/*
 Navicat MySQL Data Transfer

 Source Server         : 阿里云服务器
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : youxiu326.xin:3306
 Source Schema         : super_man

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 23/03/2020 14:47:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gateway_route
-- ----------------------------
BEGIN;
INSERT INTO `gateway_route` VALUES (1, 'serviceNode1', 'https://baidu.com/', '/api-baidu/**', '1', '0', '', '2020-03-02 00:05:59', '', '2020-03-02 00:50:27', NULL, '0');
INSERT INTO `gateway_route` VALUES (2, 'serviceNode2', 'https://www.taobao.com/', '/api-taobao/**', '1', '0', '', '2020-03-02 00:51:30', NULL, NULL, NULL, '0');
INSERT INTO `gateway_route` VALUES (8, 'serviceNode3', 'https://youxiu326.xin/', '/youxiu326/**', '1', '1', '', '2020-03-23 01:41:45', NULL, NULL, NULL, '0');
INSERT INTO `gateway_route` VALUES (10, 'serviceNode4', 'https://suggest.taobao.com/', '/search/**', '1', '1', '', '2020-03-23 01:45:59', NULL, NULL, NULL, '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
