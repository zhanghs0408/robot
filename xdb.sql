/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : xdb

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 17/09/2023 22:56:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_log
-- ----------------------------
DROP TABLE IF EXISTS `chat_log`;
CREATE TABLE `chat_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `robot_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `reply_time` datetime(0) NULL DEFAULT NULL,
  `resolved` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_log
-- ----------------------------
INSERT INTO `chat_log` VALUES (1, 1, 'JohnDoe', 'Hello', 'Hi there!', '2023-08-20 10:00:00', b'1');
INSERT INTO `chat_log` VALUES (2, 2, 'JaneSmith', 'How are you?', 'I\'m fine, thank you!', '2023-08-21 14:30:00', b'1');
INSERT INTO `chat_log` VALUES (3, 3, 'JamesBrown', 'Can you help me?', 'Sure, what do you need help with?', '2023-08-22 09:45:00', b'0');
INSERT INTO `chat_log` VALUES (4, 4, 'JessicaJohnson', 'Goodbye', 'Goodbye!', '2023-08-23 16:20:00', b'1');
INSERT INTO `chat_log` VALUES (5, 1, 'JohnDoe', 'Hello', 'Hi there!', '2023-08-20 10:00:00', b'1');
INSERT INTO `chat_log` VALUES (6, 2, 'JaneSmith', 'How are you?', 'I\'m fine, thank you!', '2023-08-21 14:30:00', b'1');
INSERT INTO `chat_log` VALUES (7, 3, 'JamesBrown', 'Can you help me?', 'Sure, what do you need help with?', '2023-08-22 09:45:00', b'0');
INSERT INTO `chat_log` VALUES (8, 4, 'JessicaJohnson', 'Goodbye', 'Goodbye!', '2023-08-23 16:20:00', b'1');
INSERT INTO `chat_log` VALUES (9, 1, 'JohnDoe', 'Hello', 'Hi there!', '2023-08-20 10:00:00', b'1');
INSERT INTO `chat_log` VALUES (10, 2, 'JaneSmith', 'How are you?', 'I\'m fine, thank you!', '2023-08-21 14:30:00', b'1');
INSERT INTO `chat_log` VALUES (11, 3, 'JamesBrown', 'Can you help me?', 'Sure, what do you need help with?', '2023-08-22 09:45:00', b'0');
INSERT INTO `chat_log` VALUES (12, 4, 'JessicaJohnson', 'Goodbye', 'Goodbye!', '2023-08-23 16:20:00', b'1');
INSERT INTO `chat_log` VALUES (13, 5, '张三', '你好', '你好！有什么可以帮助你的吗？', '2023-08-20 10:00:00', b'1');
INSERT INTO `chat_log` VALUES (14, 6, '李四', '请问这个产品的价格是多少？', '这个产品的价格是100元。', '2023-08-21 14:30:00', b'1');
INSERT INTO `chat_log` VALUES (15, 7, '王五', '能否提供更多的信息？', '当然可以，请告诉我您想了解的具体内容。', '2023-08-22 09:45:00', b'0');
INSERT INTO `chat_log` VALUES (16, 8, '赵六', '谢谢！', '不客气！有任何其他问题，随时告诉我。', '2023-08-23 16:20:00', b'1');
INSERT INTO `chat_log` VALUES (17, 9, '刘七', '我想取消订单', '非常抱歉，取消订单需要联系客服进行处理。', '2023-08-24 11:15:00', b'0');
INSERT INTO `chat_log` VALUES (18, 5, '张三', '你好', '你好！有什么可以帮助你的吗？', '2023-08-20 10:00:00', b'1');
INSERT INTO `chat_log` VALUES (19, 6, '李四', '请问这个产品的价格是多少？', '这个产品的价格是100元。', '2023-08-21 14:30:00', b'1');
INSERT INTO `chat_log` VALUES (20, 7, '王五', '能否提供更多的信息？', '当然可以，请告诉我您想了解的具体内容。', '2023-08-22 09:45:00', b'0');
INSERT INTO `chat_log` VALUES (21, 8, '赵六', '谢谢！', '不客气！有任何其他问题，随时告诉我。', '2023-08-23 16:20:00', b'1');
INSERT INTO `chat_log` VALUES (22, 9, '刘七', '我想取消订单', '非常抱歉，取消订单需要联系客服进行处理。', '2023-08-24 11:15:00', b'0');
INSERT INTO `chat_log` VALUES (23, 10, '小明', '你好，我想问一下关于产品的规格参数', '当然，请告诉我您感兴趣的产品，我会提供详细的规格参数给您。', '2023-08-25 09:30:00', b'1');
INSERT INTO `chat_log` VALUES (24, 11, '小红', '我想咨询一下配送费用', '配送费用根据您所在的地区和订单的重量进行计算，请提供详细的配送地址和商品信息，我会为您查询。', '2023-08-26 14:45:00', b'0');
INSERT INTO `chat_log` VALUES (25, 12, '小李', '你们支持退换货吗？', '是的，我们支持退换货服务。请提供订单号和退换货原因，我会为您发起退换货申请。', '2023-08-27 11:20:00', b'1');
INSERT INTO `chat_log` VALUES (26, 13, '小张', '能否告诉我你们的联系方式？', '当然，您可以通过以下方式联系我们：电话：123-456789，邮箱：support@example.com。', '2023-08-28 16:30:00', b'1');
INSERT INTO `chat_log` VALUES (27, 14, '小王', '这个产品有保修吗？', '是的，我们提供产品保修服务。请提供产品型号和购买日期，我会为您查询保修期限。', '2023-08-29 10:15:00', b'1');
INSERT INTO `chat_log` VALUES (28, 15, '小刘', '请问你们有优惠活动吗？', '是的，我们定期举办优惠活动。请关注我们的官方网站和社交媒体页面，获取最新的优惠信息。', '2023-08-30 15:00:00', b'1');
INSERT INTO `chat_log` VALUES (29, 16, '小陈', '能否提供产品的安装指南？', '当然，请告诉我您感兴趣的产品型号，我会为您提供详细的安装指南。', '2023-08-31 09:45:00', b'1');
INSERT INTO `chat_log` VALUES (30, 17, '小林', '请问你们接受哪种支付方式？', '我们接受信用卡、借记卡和支付宝等多种支付方式。请在下单时选择您方便的支付方式。', '2023-09-01 14:20:00', b'1');
INSERT INTO `chat_log` VALUES (31, 18, '小黄', '你们有实体店吗？', '是的，我们有实体店。请告诉我您所在的城市，我会为您提供最近的实体店地址。', '2023-09-02 11:30:00', b'1');
INSERT INTO `chat_log` VALUES (32, 19, '小赵', '产品有质量问题怎么办？', '如果您收到的产品有质量问题，请立即联系我们的客服团队，我们会为您处理并提供解决方案。', '2023-09-03 16:45:00', b'0');
INSERT INTO `chat_log` VALUES (33, 10, '小明', '你好，我想问一下关于产品的规格参数', '当然，请告诉我您感兴趣的产品，我会提供详细的规格参数给您。', '2023-08-25 09:30:00', b'1');
INSERT INTO `chat_log` VALUES (34, 11, '小红', '我想咨询一下配送费用', '配送费用根据您所在的地区和订单的重量进行计算，请提供详细的配送地址和商品信息，我会为您查询。', '2023-08-26 14:45:00', b'0');
INSERT INTO `chat_log` VALUES (35, 12, '小李', '你们支持退换货吗？', '是的，我们支持退换货服务。请提供订单号和退换货原因，我会为您发起退换货申请。', '2023-08-27 11:20:00', b'1');
INSERT INTO `chat_log` VALUES (36, 13, '小张', '能否告诉我你们的联系方式？', '当然，您可以通过以下方式联系我们：电话：123-456789，邮箱：support@example.com。', '2023-08-28 16:30:00', b'1');
INSERT INTO `chat_log` VALUES (37, 14, '小王', '这个产品有保修吗？', '是的，我们提供产品保修服务。请提供产品型号和购买日期，我会为您查询保修期限。', '2023-08-29 10:15:00', b'1');
INSERT INTO `chat_log` VALUES (38, 15, '小刘', '请问你们有优惠活动吗？', '是的，我们定期举办优惠活动。请关注我们的官方网站和社交媒体页面，获取最新的优惠信息。', '2023-08-30 15:00:00', b'1');
INSERT INTO `chat_log` VALUES (39, 16, '小陈', '能否提供产品的安装指南？', '当然，请告诉我您感兴趣的产品型号，我会为您提供详细的安装指南。', '2023-08-31 09:45:00', b'1');
INSERT INTO `chat_log` VALUES (40, 17, '小林', '请问你们接受哪种支付方式？', '我们接受信用卡、借记卡和支付宝等多种支付方式。请在下单时选择您方便的支付方式。', '2023-09-01 14:20:00', b'1');
INSERT INTO `chat_log` VALUES (41, 18, '小黄', '你们有实体店吗？', '是的，我们有实体店。请告诉我您所在的城市，我会为您提供最近的实体店地址。', '2023-09-02 11:30:00', b'1');
INSERT INTO `chat_log` VALUES (42, 19, '小赵', '产品有质量问题怎么办？', '如果您收到的产品有质量问题，请立即联系我们的客服团队，我们会为您处理并提供解决方案。', '2023-09-03 16:45:00', b'0');
INSERT INTO `chat_log` VALUES (43, 10, '小明', '你好，我想问一下关于产品的规格参数', '当然，请告诉我您感兴趣的产品，我会提供详细的规格参数给您。', '2023-08-25 09:30:00', b'1');
INSERT INTO `chat_log` VALUES (44, 11, '小红', '我想咨询一下配送费用', '配送费用根据您所在的地区和订单的重量进行计算，请提供详细的配送地址和商品信息，我会为您查询。', '2023-08-26 14:45:00', b'0');
INSERT INTO `chat_log` VALUES (45, 12, '小李', '你们支持退换货吗？', '是的，我们支持退换货服务。请提供订单号和退换货原因，我会为您发起退换货申请。', '2023-08-27 11:20:00', b'1');
INSERT INTO `chat_log` VALUES (46, 13, '小张', '能否告诉我你们的联系方式？', '当然，您可以通过以下方式联系我们：电话：123-456789，邮箱：support@example.com。', '2023-08-28 16:30:00', b'1');
INSERT INTO `chat_log` VALUES (47, 14, '小王', '这个产品有保修吗？', '是的，我们提供产品保修服务。请提供产品型号和购买日期，我会为您查询保修期限。', '2023-08-29 10:15:00', b'1');
INSERT INTO `chat_log` VALUES (48, 15, '小刘', '请问你们有优惠活动吗？', '是的，我们定期举办优惠活动。请关注我们的官方网站和社交媒体页面，获取最新的优惠信息。', '2023-08-30 15:00:00', b'1');
INSERT INTO `chat_log` VALUES (49, 16, '小陈', '能否提供产品的安装指南？', '当然，请告诉我您感兴趣的产品型号，我会为您提供详细的安装指南。', '2023-08-31 09:45:00', b'1');
INSERT INTO `chat_log` VALUES (50, 17, '小林', '请问你们接受哪种支付方式？', '我们接受信用卡、借记卡和支付宝等多种支付方式。请在下单时选择您方便的支付方式。', '2023-09-01 14:20:00', b'1');
INSERT INTO `chat_log` VALUES (51, 18, '小黄', '你们有实体店吗？', '是的，我们有实体店。请告诉我您所在的城市，我会为您提供最近的实体店地址。', '2023-09-02 11:30:00', b'1');
INSERT INTO `chat_log` VALUES (52, 19, '小赵', '产品有质量问题怎么办？', '如果您收到的产品有质量问题，请立即联系我们的客服团队，我们会为您处理并提供解决方案。', '2023-09-03 16:45:00', b'0');
INSERT INTO `chat_log` VALUES (53, 10, '小明', '你好，我想问一下关于产品的规格参数', '当然，请告诉我您感兴趣的产品，我会提供详细的规格参数给您。', '2023-08-25 09:30:00', b'1');
INSERT INTO `chat_log` VALUES (54, 11, '小红', '我想咨询一下配送费用', '配送费用根据您所在的地区和订单的重量进行计算，请提供详细的配送地址和商品信息，我会为您查询。', '2023-08-26 14:45:00', b'0');
INSERT INTO `chat_log` VALUES (55, 12, '小李', '你们支持退换货吗？', '是的，我们支持退换货服务。请提供订单号和退换货原因，我会为您发起退换货申请。', '2023-08-27 11:20:00', b'1');
INSERT INTO `chat_log` VALUES (56, 13, '小张', '能否告诉我你们的联系方式？', '当然，您可以通过以下方式联系我们：电话：123-456789，邮箱：support@example.com。', '2023-08-28 16:30:00', b'1');
INSERT INTO `chat_log` VALUES (57, 14, '小王', '这个产品有保修吗？', '是的，我们提供产品保修服务。请提供产品型号和购买日期，我会为您查询保修期限。', '2023-08-29 10:15:00', b'1');
INSERT INTO `chat_log` VALUES (58, 15, '小刘', '请问你们有优惠活动吗？', '是的，我们定期举办优惠活动。请关注我们的官方网站和社交媒体页面，获取最新的优惠信息。', '2023-08-30 15:00:00', b'1');
INSERT INTO `chat_log` VALUES (59, 16, '小陈', '能否提供产品的安装指南？', '当然，请告诉我您感兴趣的产品型号，我会为您提供详细的安装指南。', '2023-08-31 09:45:00', b'1');
INSERT INTO `chat_log` VALUES (60, 17, '小林', '请问你们接受哪种支付方式？', '我们接受信用卡、借记卡和支付宝等多种支付方式。请在下单时选择您方便的支付方式。', '2023-09-01 14:20:00', b'1');
INSERT INTO `chat_log` VALUES (61, 18, '小黄', '你们有实体店吗？', '是的，我们有实体店。请告诉我您所在的城市，我会为您提供最近的实体店地址。', '2023-09-02 11:30:00', b'1');
INSERT INTO `chat_log` VALUES (62, 19, '小赵', '产品有质量问题怎么办？', '如果您收到的产品有质量问题，请立即联系我们的客服团队，我们会为您处理并提供解决方案。', '2023-09-03 16:45:00', b'0');
INSERT INTO `chat_log` VALUES (63, 13, '小张', '能否告诉我你们的联系方式？', '当然，您可以通过以下方式联系我们：电话：123-456789，邮箱：support@example.com。', '2023-08-28 16:30:00', b'1');
INSERT INTO `chat_log` VALUES (64, 14, '小王', '这个产品有保修吗？', '是的，我们提供产品保修服务。请提供产品型号和购买日期，我会为您查询保修期限。', '2023-08-29 10:15:00', b'1');
INSERT INTO `chat_log` VALUES (65, 15, '小刘', '请问你们有优惠活动吗？', '是的，我们定期举办优惠活动。请关注我们的官方网站和社交媒体页面，获取最新的优惠信息。', '2023-08-30 15:00:00', b'1');
INSERT INTO `chat_log` VALUES (66, 16, '小陈', '能否提供产品的安装指南？', '当然，请告诉我您感兴趣的产品型号，我会为您提供详细的安装指南。', '2023-08-31 09:45:00', b'1');
INSERT INTO `chat_log` VALUES (67, 17, '小林', '请问你们接受哪种支付方式？', '我们接受信用卡、借记卡和支付宝等多种支付方式。请在下单时选择您方便的支付方式。', '2023-09-01 14:20:00', b'1');
INSERT INTO `chat_log` VALUES (68, 18, '小黄', '你们有实体店吗？', '是的，我们有实体店。请告诉我您所在的城市，我会为您提供最近的实体店地址。', '2023-09-02 11:30:00', b'1');
INSERT INTO `chat_log` VALUES (69, 19, '小赵', '产品有质量问题怎么办？', '如果您收到的产品有质量问题，请立即联系我们的客服团队，我们会为您处理并提供解决方案。', '2023-09-03 16:45:00', b'0');

-- ----------------------------
-- Table structure for error_user
-- ----------------------------
DROP TABLE IF EXISTS `error_user`;
CREATE TABLE `error_user`  (
  `id` int(11) NOT NULL,
  `pdu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `descript` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `solution` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `wiki` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of error_user
-- ----------------------------
INSERT INTO `error_user` VALUES (1, '中文pdu1', '关键词1', '描述1', '解决方案1', '维基1', '类型1', '作者1', '状态1');
INSERT INTO `error_user` VALUES (2, '中文pdu2', '关键词2', '描述2', '解决方案2', '维基2', '类型2', '作者2', '状态2');
INSERT INTO `error_user` VALUES (3, '中文pdu3', '关键词3', '描述3', '解决方案3', '维基3', '类型3', '作者3', '状态3');
INSERT INTO `error_user` VALUES (4, '中文pdu4', '关键词4', '描述4', '解决方案4', '维基4', '类型4', '作者4', '状态4');
INSERT INTO `error_user` VALUES (5, '中文pdu5', '关键词5', '描述5', '解决方案5', '维基5', '类型5', '作者5', '状态5');
INSERT INTO `error_user` VALUES (6, '中文pdu6', '关键词6', '描述6', '解决方案6', '维基6', '类型6', '作者6', '状态6');
INSERT INTO `error_user` VALUES (7, '中文pdu7', '关键词7', '描述7', '解决方案7', '维基7', '类型7', '作者7', '状态7');
INSERT INTO `error_user` VALUES (8, '中文pdu8', '关键词8', '描述8', '解决方案8', '维基8', '类型8', '作者8', '状态8');
INSERT INTO `error_user` VALUES (9, '中文pdu9', '关键词9', '描述9', '解决方案9', '维基9', '类型9', '作者9', '状态9');
INSERT INTO `error_user` VALUES (10, '中文pdu10', '关键词10', '描述10', '解决方案10', '维基10', '类型10', '作者10', '状态10');
INSERT INTO `error_user` VALUES (11, '中文pdu11', '关键词11', '描述11', '解决方案11', '维基11', '类型11', '作者11', '状态11');
INSERT INTO `error_user` VALUES (12, '中文pdu12', '关键词12', '描述12', '解决方案12', '维基12', '类型12', '作者12', '状态12');
INSERT INTO `error_user` VALUES (13, '中文pdu13', '关键词13', '描述13', '解决方案13', '维基13', '类型13', '作者13', '状态13');
INSERT INTO `error_user` VALUES (14, '中文pdu14', '关键词14', '描述14', '解决方案14', '维基14', '类型14', '作者14', '状态14');
INSERT INTO `error_user` VALUES (15, '中文pdu15', '关键词15', '描述15', '解决方案15', '维基15', '类型15', '作者15', '状态15');

-- ----------------------------
-- Table structure for x_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_menu`;
CREATE TABLE `x_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_menu
-- ----------------------------
INSERT INTO `x_menu` VALUES (1, 'Layout', '/sys', '/sys/user', 'sysManage', '系统管理', 'userManage', 0, 'N', 0);
INSERT INTO `x_menu` VALUES (2, 'sys/user', 'user', NULL, 'userList', '用户列表', 'user', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (3, 'sys/role', 'role', NULL, 'roleList', '角色列表', 'roleManage', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (4, 'Layout', '/test', '/test/test1', 'test', '功能测试', 'form', 0, 'N', 0);
INSERT INTO `x_menu` VALUES (5, 'test/test1', 'test1', '', 'test1', '测试点一', 'form', 4, 'Y', 0);
INSERT INTO `x_menu` VALUES (6, 'test/test2', 'test2', '', 'test2', '测试点二', 'form', 4, 'Y', 0);
INSERT INTO `x_menu` VALUES (7, 'test/test3', 'test3', '', 'test3', '测试点三', 'form', 4, 'Y', 0);

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `x_role` VALUES (2, 'hr', '人事管理员');
INSERT INTO `x_role` VALUES (3, 'normal', '普通员工');

-- ----------------------------
-- Table structure for x_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_role_menu`;
CREATE TABLE `x_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role_menu
-- ----------------------------
INSERT INTO `x_role_menu` VALUES (11, 1, 1);
INSERT INTO `x_role_menu` VALUES (12, 1, 2);
INSERT INTO `x_role_menu` VALUES (13, 1, 3);
INSERT INTO `x_role_menu` VALUES (14, 1, 4);
INSERT INTO `x_role_menu` VALUES (15, 1, 5);
INSERT INTO `x_role_menu` VALUES (16, 1, 6);
INSERT INTO `x_role_menu` VALUES (17, 1, 7);
INSERT INTO `x_role_menu` VALUES (22, 2, 5);
INSERT INTO `x_role_menu` VALUES (23, 2, 6);
INSERT INTO `x_role_menu` VALUES (24, 2, 4);
INSERT INTO `x_role_menu` VALUES (25, 3, 7);
INSERT INTO `x_role_menu` VALUES (26, 3, 4);

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES (1, 'admin', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'super@aliyun.com', '18677778888', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (2, 'zhangsan', '$2a$10$DzqJjRXQlF0d3XGKb8vQ7OX8Fb7WZfwSsbC0X6L6t0nDHiyYjXs82', 'zhangsan@gmail.com', '13966667777', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (3, 'lisi', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'lisi@gmail.com', '13966667778', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (4, 'wangwu', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'wangwu@gmail.com', '13966667772', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (5, 'zhaoer', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'zhaoer@gmail.com', '13966667776', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (6, 'songliu', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'songliu@gmail.com', '13966667771', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (7, 'aaa', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'aaa@aliyun.com', '18899998888', 1, NULL, 1);
INSERT INTO `x_user` VALUES (8, 'bbb', '666666', 'bbb@qq.com', '188888889999', 1, NULL, 1);
INSERT INTO `x_user` VALUES (9, 'ccc', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', '1111@ali.com', '11111111', 1, NULL, 0);
INSERT INTO `x_user` VALUES (10, 'xxx222', '$2a$10$dQ1n957Q3qP2D0lHBSqdEeRHym9kAauXgxnIqAv9KDhnsJOC0Kooi', '1122@qq.com', '111111122', 0, NULL, 1);
INSERT INTO `x_user` VALUES (11, 'yyy', '$2a$10$hX03AhH9Yt//V.crSdqGP.nhj3EQi.cMwIEglT9Eqd.5KDkIGaCQC', '1111111@ali.com', '1111111', 1, NULL, 0);
INSERT INTO `x_user` VALUES (12, 'xxx6', '$2a$10$LTtlLYIPtDelUtP01FhcSe9JZkNuJmeXf66YMJyZee.04Q1yzNoj.', 'xxx6@aliyun.com', '18677778886', 1, NULL, 1);
INSERT INTO `x_user` VALUES (13, 'test', '$2a$10$jWewP9UNr.6AhrP2ofza1OaTDBq7nBL23C9zHnwBXh8Q/9Vd2zNSC', 'test@ali.com', '11111111111', 1, NULL, 0);
INSERT INTO `x_user` VALUES (14, 'xxx', '$2a$10$QpmItVrXHa5YWTfH25yCEuTu69VFjJbcxBxMYQTWb8qVNBSp0laxq', 'xxx@ali.com', '1111111111111', 1, NULL, 1);

-- ----------------------------
-- Table structure for x_user_role
-- ----------------------------
DROP TABLE IF EXISTS `x_user_role`;
CREATE TABLE `x_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_role
-- ----------------------------
INSERT INTO `x_user_role` VALUES (1, 1, 1);
INSERT INTO `x_user_role` VALUES (2, 1, 3);
INSERT INTO `x_user_role` VALUES (7, 4, 2);
INSERT INTO `x_user_role` VALUES (8, 4, 3);
INSERT INTO `x_user_role` VALUES (12, 3, 3);
INSERT INTO `x_user_role` VALUES (13, 2, 2);
INSERT INTO `x_user_role` VALUES (14, 2, 3);

SET FOREIGN_KEY_CHECKS = 1;
