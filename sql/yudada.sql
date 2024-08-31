/*
 Navicat Premium Dump SQL

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 80401 (8.4.1)
 Source Host           : 127.0.0.1:3306
 Source Schema         : yudada

 Target Server Type    : MySQL
 Target Server Version : 80401 (8.4.1)
 File Encoding         : 65001

 Date: 31/08/2024 14:47:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `appName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `appDesc` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用描述',
  `appIcon` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `reviewStatus` int NOT NULL DEFAULT 0 COMMENT '审核状态：0-待审核, 1-通过, 2-拒绝',
  `reviewMessage` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核信息',
  `reviewerId` bigint NULL DEFAULT NULL COMMENT '审核人 id',
  `reviewTime` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appName`(`appName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1821867588423516162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES (1, '自定义MBTI性格测试', '测试性格', '11', 1, 0, 1, '', 1821399233866559489, '2024-08-09 19:15:38', 1, '2024-04-24 15:58:05', '2024-08-09 19:15:37', 0);
INSERT INTO `app` VALUES (2, '自定义得分测试', '测试得分', '22', 0, 0, 1, NULL, NULL, NULL, 1, '2024-04-25 11:39:30', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (3, 'AI MBTI 性格测试', '快来测测你的 MBTI', '11', 1, 1, 1, NULL, NULL, NULL, 1, '2024-04-26 16:38:12', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (4, 'AI 得分测试', '看看你熟悉多少首都', '22', 0, 1, 1, NULL, NULL, NULL, 1, '2024-04-26 16:38:56', '2024-05-09 15:09:53', 0);
INSERT INTO `app` VALUES (1821399564579041281, 'a', 'a', 'a', 0, 0, 1, '', 1, '2024-08-09 12:20:53', 1821399233866559489, '2024-08-08 12:14:30', '2024-08-09 16:19:34', 1);
INSERT INTO `app` VALUES (1821762730953617410, 'a', 'a', 'https://k.sinaimg.cn/n/sinakd20110/560/w1080h1080/20230930/915d-f3d7b580c33632b191e19afa0a858d31.jpg/w700d1q75cms.jpg', 0, 0, 1, '', 1, '2024-08-09 12:20:53', 1821399233866559489, '2024-08-09 12:17:36', '2024-08-09 16:19:37', 1);
INSERT INTO `app` VALUES (1821762987540164610, 'b', 'b', 'https://k.sinaimg.cn/n/sinakd20110/560/w1080h1080/20230930/915d-f3d7b580c33632b191e19afa0a858d31.jpg/w700d1q75cms.jpg', 0, 0, 1, '', 1, '2024-08-09 12:20:54', 1821399233866559489, '2024-08-09 12:18:37', '2024-08-09 16:19:37', 1);
INSERT INTO `app` VALUES (1821764416241741826, 'a', 'a', 'a', 1, 1, 0, NULL, NULL, NULL, 1, '2024-08-09 12:24:18', '2024-08-09 16:19:40', 1);
INSERT INTO `app` VALUES (1821764618784681986, '1', 'q', 'q', 0, 0, 0, NULL, NULL, NULL, 1, '2024-08-09 12:25:06', '2024-08-09 16:19:41', 1);
INSERT INTO `app` VALUES (1821764838788509698, '1', '1', '1', 1, 0, 0, NULL, NULL, NULL, 1, '2024-08-09 12:25:58', '2024-08-09 16:19:41', 1);
INSERT INTO `app` VALUES (1821765655373361153, '4', 'e', 'e', 1, 0, 0, NULL, NULL, NULL, 1, '2024-08-09 12:29:13', '2024-08-09 16:19:42', 1);
INSERT INTO `app` VALUES (1821823547501793281, 'test', 'test', '', 1, 0, 0, NULL, NULL, NULL, 1821399233866559489, '2024-08-09 16:19:16', '2024-08-09 16:19:42', 1);
INSERT INTO `app` VALUES (1821824753657794562, '性格测试', '性格测试', '', 0, 1, 1, '', 1821399233866559489, '2024-08-09 16:25:27', 1821399233866559489, '2024-08-09 16:24:03', '2024-08-09 16:25:26', 0);
INSERT INTO `app` VALUES (1821867588423516161, '智能ai测试', 'ai测试', '', 1, 1, 1, '', 1821399233866559489, '2024-08-09 19:15:39', 1821399233866559489, '2024-08-09 19:14:16', '2024-08-09 19:15:39', 0);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `questionContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容（json格式）',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1821868407810162691 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]', 1, 1, '2024-04-24 16:41:53', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (2, '[{\"options\":[{\"score\":0,\"value\":\"利马\",\"key\":\"A\"},{\"score\":0,\"value\":\"圣多明各\",\"key\":\"B\"},{\"score\":0,\"value\":\"圣萨尔瓦多\",\"key\":\"C\"},{\"score\":1,\"value\":\"波哥大\",\"key\":\"D\"}],\"title\":\"哥伦比亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"蒙特利尔\",\"key\":\"A\"},{\"score\":0,\"value\":\"多伦多\",\"key\":\"B\"},{\"score\":1,\"value\":\"渥太华\",\"key\":\"C\"},{\"score\":0,\"value\":\"温哥华\",\"key\":\"D\"}],\"title\":\"加拿大的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"大阪\",\"key\":\"A\"},{\"score\":1,\"value\":\"东京\",\"key\":\"B\"},{\"score\":0,\"value\":\"京都\",\"key\":\"C\"},{\"score\":0,\"value\":\"名古屋\",\"key\":\"D\"}],\"title\":\"日本的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"墨尔本\",\"key\":\"A\"},{\"score\":0,\"value\":\"悉尼\",\"key\":\"B\"},{\"score\":0,\"value\":\"布里斯班\",\"key\":\"C\"},{\"score\":1,\"value\":\"堪培拉\",\"key\":\"D\"}],\"title\":\"澳大利亚的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"雅加达\",\"key\":\"A\"},{\"score\":0,\"value\":\"曼谷\",\"key\":\"B\"},{\"score\":0,\"value\":\"胡志明市\",\"key\":\"C\"},{\"score\":0,\"value\":\"吉隆坡\",\"key\":\"D\"}],\"title\":\"印度尼西亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"上海\",\"key\":\"A\"},{\"score\":0,\"value\":\"杭州\",\"key\":\"B\"},{\"score\":1,\"value\":\"北京\",\"key\":\"C\"},{\"score\":0,\"value\":\"广州\",\"key\":\"D\"}],\"title\":\"中国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"汉堡\",\"key\":\"A\"},{\"score\":0,\"value\":\"慕尼黑\",\"key\":\"B\"},{\"score\":1,\"value\":\"柏林\",\"key\":\"C\"},{\"score\":0,\"value\":\"科隆\",\"key\":\"D\"}],\"title\":\"德国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"釜山\",\"key\":\"A\"},{\"score\":1,\"value\":\"首尔\",\"key\":\"B\"},{\"score\":0,\"value\":\"大田\",\"key\":\"C\"},{\"score\":0,\"value\":\"仁川\",\"key\":\"D\"}],\"title\":\"韩国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"瓜达拉哈拉\",\"key\":\"A\"},{\"score\":0,\"value\":\"蒙特雷\",\"key\":\"B\"},{\"score\":1,\"value\":\"墨西哥城\",\"key\":\"C\"},{\"score\":0,\"value\":\"坎昆\",\"key\":\"D\"}],\"title\":\"墨西哥的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"开罗\",\"key\":\"A\"},{\"score\":0,\"value\":\"亚历山大\",\"key\":\"B\"},{\"score\":0,\"value\":\"卢克索\",\"key\":\"C\"},{\"score\":0,\"value\":\"卡利乌比亚\",\"key\":\"D\"}],\"title\":\"埃及的首都是?\"}]', 2, 1, '2024-04-25 15:03:07', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (3, '[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]', 3, 1, '2024-04-26 16:39:29', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (4, '[{\"options\":[{\"score\":0,\"value\":\"利马\",\"key\":\"A\"},{\"score\":0,\"value\":\"圣多明各\",\"key\":\"B\"},{\"score\":0,\"value\":\"圣萨尔瓦多\",\"key\":\"C\"},{\"score\":1,\"value\":\"波哥大\",\"key\":\"D\"}],\"title\":\"哥伦比亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"蒙特利尔\",\"key\":\"A\"},{\"score\":0,\"value\":\"多伦多\",\"key\":\"B\"},{\"score\":1,\"value\":\"渥太华\",\"key\":\"C\"},{\"score\":0,\"value\":\"温哥华\",\"key\":\"D\"}],\"title\":\"加拿大的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"大阪\",\"key\":\"A\"},{\"score\":1,\"value\":\"东京\",\"key\":\"B\"},{\"score\":0,\"value\":\"京都\",\"key\":\"C\"},{\"score\":0,\"value\":\"名古屋\",\"key\":\"D\"}],\"title\":\"日本的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"墨尔本\",\"key\":\"A\"},{\"score\":0,\"value\":\"悉尼\",\"key\":\"B\"},{\"score\":0,\"value\":\"布里斯班\",\"key\":\"C\"},{\"score\":1,\"value\":\"堪培拉\",\"key\":\"D\"}],\"title\":\"澳大利亚的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"雅加达\",\"key\":\"A\"},{\"score\":0,\"value\":\"曼谷\",\"key\":\"B\"},{\"score\":0,\"value\":\"胡志明市\",\"key\":\"C\"},{\"score\":0,\"value\":\"吉隆坡\",\"key\":\"D\"}],\"title\":\"印度尼西亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"上海\",\"key\":\"A\"},{\"score\":0,\"value\":\"杭州\",\"key\":\"B\"},{\"score\":1,\"value\":\"北京\",\"key\":\"C\"},{\"score\":0,\"value\":\"广州\",\"key\":\"D\"}],\"title\":\"中国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"汉堡\",\"key\":\"A\"},{\"score\":0,\"value\":\"慕尼黑\",\"key\":\"B\"},{\"score\":1,\"value\":\"柏林\",\"key\":\"C\"},{\"score\":0,\"value\":\"科隆\",\"key\":\"D\"}],\"title\":\"德国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"釜山\",\"key\":\"A\"},{\"score\":1,\"value\":\"首尔\",\"key\":\"B\"},{\"score\":0,\"value\":\"大田\",\"key\":\"C\"},{\"score\":0,\"value\":\"仁川\",\"key\":\"D\"}],\"title\":\"韩国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"瓜达拉哈拉\",\"key\":\"A\"},{\"score\":0,\"value\":\"蒙特雷\",\"key\":\"B\"},{\"score\":1,\"value\":\"墨西哥城\",\"key\":\"C\"},{\"score\":0,\"value\":\"坎昆\",\"key\":\"D\"}],\"title\":\"墨西哥的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"开罗\",\"key\":\"A\"},{\"score\":0,\"value\":\"亚历山大\",\"key\":\"B\"},{\"score\":0,\"value\":\"卢克索\",\"key\":\"C\"},{\"score\":0,\"value\":\"卡利乌比亚\",\"key\":\"D\"}],\"title\":\"埃及的首都是?\"}]', 4, 1, '2024-04-26 16:39:29', '2024-05-09 12:28:58', 0);
INSERT INTO `question` VALUES (1821399945035968513, '[{\"title\":\"\",\"options\":[{\"result\":\"\",\"score\":0,\"value\":\"\",\"key\":\"\"}]}]', 1821399564579041281, 1821399233866559489, '2024-08-08 12:16:01', '2024-08-09 16:19:48', 1);
INSERT INTO `question` VALUES (1821825047867248642, '[{\"title\":\"性格测试应用的主要目的是什么？\",\"options\":[{\"score\":0,\"value\":\"准确描述个人特质\",\"key\":\"A\"},{\"score\":0,\"value\":\"评估团队合作能力\",\"key\":\"B\"}]},{\"title\":\"性格测试应用通常基于哪个学科的理论？\",\"options\":[{\"score\":0,\"value\":\"心理学\",\"key\":\"A\"},{\"score\":0,\"value\":\"统计学\",\"key\":\"B\"}]},{\"title\":\"哪种性格测试在职场中更为常见？\",\"options\":[{\"score\":0,\"value\":\"MBTI\",\"key\":\"A\"},{\"score\":0,\"value\":\"IQ\",\"key\":\"B\"}]},{\"title\":\"性格测试中，哪种特质通常被视为两种基本性格之一？\",\"options\":[{\"score\":0,\"value\":\"内向\",\"key\":\"A\"},{\"score\":0,\"value\":\"外向\",\"key\":\"B\"}]},{\"title\":\"性格测试主要评估的是用户的什么？\",\"options\":[{\"score\":0,\"value\":\"行为倾向\",\"key\":\"A\"},{\"score\":0,\"value\":\"情感反应\",\"key\":\"B\"}]},{\"title\":\"性格测试的题目通常是怎样的？\",\"options\":[{\"score\":0,\"value\":\"固定题库\",\"key\":\"A\"},{\"score\":0,\"value\":\"动态题目\",\"key\":\"B\"}]},{\"title\":\"进行性格测试的个人收益是什么？\",\"options\":[{\"score\":0,\"value\":\"提高自我认知\",\"key\":\"A\"},{\"score\":0,\"value\":\"预测未来成就\",\"key\":\"B\"}]},{\"title\":\"性格测试最好是怎样进行？\",\"options\":[{\"score\":0,\"value\":\"小组讨论\",\"key\":\"A\"},{\"score\":0,\"value\":\"独立完成\",\"key\":\"B\"}]},{\"title\":\"性格测试更应注重哪一方面？\",\"options\":[{\"score\":0,\"value\":\"科学性\",\"key\":\"A\"},{\"score\":0,\"value\":\"趣味性\",\"key\":\"B\"}]},{\"title\":\"性格测试结果最好提供哪种类型的分析？\",\"options\":[{\"score\":0,\"value\":\"个性化反馈\",\"key\":\"A\"},{\"score\":0,\"value\":\"统一解释\",\"key\":\"B\"}]}]', 1821824753657794562, 1821399233866559489, '2024-08-09 16:25:13', '2024-08-09 16:25:13', 0);
INSERT INTO `question` VALUES (1821868407810162690, '[{\"title\":\"以下哪项描述正确？\",\"options\":[{\"score\":0,\"value\":\"应用名称为智能ai测试\",\"key\":\"A\"},{\"score\":0,\"value\":\"应用类别为游戏类\",\"key\":\"B\"}]},{\"title\":\"【【【应用描述】】】可能是什么？\",\"options\":[{\"score\":0,\"value\":\"该应用用于评估智力水平\",\"key\":\"A\"},{\"score\":0,\"value\":\"该应用是一个购物平台\",\"key\":\"B\"}]},{\"title\":\"关于题目数的描述哪个是正确的？\",\"options\":[{\"score\":0,\"value\":\"该应用有10个题目\",\"key\":\"A\"},{\"score\":0,\"value\":\"该应用只有5个题目\",\"key\":\"B\"}]},{\"title\":\"每个题目的选项数是多少？\",\"options\":[{\"score\":0,\"value\":\"每个题目有2个选项\",\"key\":\"A\"},{\"score\":0,\"value\":\"每个题目有4个选项\",\"key\":\"B\"}]},{\"title\":\"关于应用名称的说法哪个是正确的？\",\"options\":[{\"score\":0,\"value\":\"应用名称包含序号\",\"key\":\"A\"},{\"score\":0,\"value\":\"应用名称不含序号\",\"key\":\"B\"}]},{\"title\":\"该应用属于以下哪个类别？\",\"options\":[{\"score\":0,\"value\":\"应用类别为教育类\",\"key\":\"A\"},{\"score\":0,\"value\":\"应用类别为测评类\",\"key\":\"B\"}]},{\"title\":\"在出题时，序号应该如何处理？\",\"options\":[{\"score\":0,\"value\":\"出题专家需提供序号\",\"key\":\"A\"},{\"score\":0,\"value\":\"出题专家不需提供序号\",\"key\":\"B\"}]},{\"title\":\"题目内容应该如何编写？\",\"options\":[{\"score\":0,\"value\":\"题目内容需要长且详细\",\"key\":\"A\"},{\"score\":0,\"value\":\"题目内容需要短且简洁\",\"key\":\"B\"}]},{\"title\":\"在出题时，选项内容是否可以重复？\",\"options\":[{\"score\":0,\"value\":\"选项内容可以重复\",\"key\":\"A\"},{\"score\":0,\"value\":\"选项内容不能重复\",\"key\":\"B\"}]},{\"title\":\"题目列表的返回格式应该是什么？\",\"options\":[{\"score\":0,\"value\":\"输出格式为JSON对象\",\"key\":\"A\"},{\"score\":0,\"value\":\"输出格式为JSON数组\",\"key\":\"B\"}]}]', 1821867588423516161, 1821399233866559489, '2024-08-09 19:17:31', '2024-08-09 19:17:31', 0);

-- ----------------------------
-- Table structure for scoring_result
-- ----------------------------
DROP TABLE IF EXISTS `scoring_result`;
CREATE TABLE `scoring_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图片',
  `resultProp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果属性集合 JSON，如 [I,S,T,J]',
  `resultScoreRange` int NULL DEFAULT NULL COMMENT '结果得分范围，如 80，表示 80及以上的分数命中此结果',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1821867810188951555 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评分结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scoring_result
-- ----------------------------
INSERT INTO `scoring_result` VALUES (1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', '[\"I\",\"S\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (2, 'ISFJ（守护者）', '善良贴心，以同情心和责任为特点。', 'icon_url_isfj', '[\"I\",\"S\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (3, 'INFJ（占有者）', '理想主义者，有着深刻的洞察力，善于理解他人。', 'icon_url_infj', '[\"I\",\"N\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (4, 'INTJ（设计师）', '独立思考者，善于规划和实现目标，理性而果断。', 'icon_url_intj', '[\"I\",\"N\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (5, 'ISTP（运动员）', '冷静自持，善于解决问题，擅长实践技能。', 'icon_url_istp', '[\"I\",\"S\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (6, 'ISFP（艺术家）', '具有艺术感和敏感性，珍视个人空间和自由。', 'icon_url_isfp', '[\"I\",\"S\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', '[\"I\",\"N\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (8, 'INTP（学者）', '思维清晰，探索精神，独立思考且理性。', 'icon_url_intp', '[\"I\",\"N\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (9, 'ESTP（拓荒者）', '敢于冒险，乐于冒险，思维敏捷，行动果断。', 'icon_url_estp', '[\"E\",\"S\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (10, 'ESFP（表演者）', '热情开朗，善于社交，热爱生活，乐于助人。', 'icon_url_esfp', '[\"E\",\"S\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (11, 'ENFP（倡导者）', '富有想象力，充满热情，善于激发他人的活力和潜力。', 'icon_url_enfp', '[\"E\",\"N\",\"F\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (12, 'ENTP（发明家）', '充满创造力，善于辩论，挑战传统，喜欢探索新领域。', 'icon_url_entp', '[\"E\",\"N\",\"T\",\"P\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (13, 'ESTJ（主管）', '务实果断，善于组织和管理，重视效率和目标。', 'icon_url_estj', '[\"E\",\"S\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (14, 'ESFJ（尽责者）', '友善热心，以协调、耐心和关怀为特点，善于团队合作。', 'icon_url_esfj', '[\"E\",\"S\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (15, 'ENFJ（教导着）', '热情关爱，善于帮助他人，具有领导力和社交能力。', 'icon_url_enfj', '[\"E\",\"N\",\"F\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (16, 'ENTJ（统帅）', '果断自信，具有领导才能，善于规划和执行目标。', 'icon_url_entj', '[\"E\",\"N\",\"T\",\"J\"]', NULL, 1, 1, '2024-04-24 16:57:02', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, NULL, 9, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (18, '地理小能手！', '你对于世界各国的首都了解得相当不错，但还有一些小地方需要加强哦！', NULL, NULL, 7, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (19, '继续加油！', '还需努力哦', NULL, NULL, 0, 2, 1, '2024-04-25 15:05:44', '2024-05-09 12:28:21', 0);
INSERT INTO `scoring_result` VALUES (1821867810188951554, '评分测试', '测试', '', '[\"a\",\"b\",\"c\"]', 80, 1821867588423516161, 1821399233866559489, '2024-08-09 19:15:09', '2024-08-09 19:15:09', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_account` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `user_password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `union_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mp_openId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `user_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_profile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `user_role` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`union_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1827295824339025922 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test1', 'b0dd3697a192885d7c055db46155b26a', '1710247412', NULL, NULL, '鱼皮', 'https://k.sinaimg.cn/n/sinakd20110/560/w1080h1080/20230930/915d-f3d7b580c33632b191e19afa0a858d31.jpg/w700d1q75cms.jpg', '欢迎来编程导航学习', 'user', '2024-08-09 19:33:54', '2024-08-24 18:39:56', 0);
INSERT INTO `user` VALUES (1821399233866559489, 'test2', 'b0dd3697a192885d7c055db46155b26a', '1710247412', NULL, NULL, NULL, NULL, NULL, 'user', '2024-08-09 19:33:54', '2024-08-24 18:39:58', 0);
INSERT INTO `user` VALUES (1821872528223109121, 'test', 'b0dd3697a192885d7c055db46155b26a', '171000247412', NULL, NULL, NULL, NULL, NULL, 'user', '2024-08-09 19:33:54', '2024-08-09 19:33:54', 0);
INSERT INTO `user` VALUES (1827295824339025921, 'admin', '123456', NULL, NULL, NULL, NULL, NULL, NULL, 'user', '2024-08-24 18:44:08', '2024-08-24 18:44:08', 0);

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1822127888926314497 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_answer
-- ----------------------------
INSERT INTO `user_answer` VALUES (1, 1, 1, 0, '[\"A\",\"A\",\"A\",\"B\",\"A\",\"A\",\"A\",\"B\",\"B\",\"A\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1, '2024-05-09 15:08:22', '2024-05-09 15:10:13', 0);
INSERT INTO `user_answer` VALUES (2, 2, 0, 0, '[\"D\",\"C\",\"B\",\"D\",\"A\",\"C\",\"C\",\"B\",\"C\",\"A\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 10, 1, '2024-05-09 15:08:36', '2024-05-09 15:10:13', 0);
INSERT INTO `user_answer` VALUES (1821787276591050753, 2, 0, 0, '[\"B\",\"C\",\"D\",\"D\",\"C\",\"C\",\"B\",\"D\",\"D\",\"C\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 28, 1821399233866559489, '2024-08-09 13:55:08', '2024-08-09 13:55:08', 0);
INSERT INTO `user_answer` VALUES (1821825213710028802, 1821824753657794562, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"A\",\"B\",\"B\",\"A\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-09 16:25:53', '2024-08-09 19:33:02', 1);
INSERT INTO `user_answer` VALUES (1821825217812058113, 1821824753657794562, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"A\",\"B\",\"B\",\"A\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-09 16:25:54', '2024-08-09 19:33:04', 1);
INSERT INTO `user_answer` VALUES (1821825523681677313, 1821824753657794562, 0, 0, '[\"A\",\"B\",\"B\",\"A\",\"A\",\"B\",\"B\",\"A\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-09 16:27:07', '2024-08-09 19:33:05', 1);
INSERT INTO `user_answer` VALUES (1821867401546301442, 1821824753657794562, 0, 0, '[\"A\",\"B\",\"A\",\"A\",\"B\",\"A\",\"A\",\"B\",\"A\",\"B\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-09 19:13:31', '2024-08-09 19:33:05', 1);
INSERT INTO `user_answer` VALUES (1821868203795021826, 2, 0, 0, '[\"B\",\"C\",\"C\",\"A\",\"A\",\"B\",\"C\",\"B\",\"C\",\"C\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 30, 1, '2024-08-09 19:16:43', '2024-08-09 19:16:43', 0);
INSERT INTO `user_answer` VALUES (1821868492786761730, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关问题的测试中表现卓越，可以被称为【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:17:52', '2024-08-09 19:17:57', 0);
INSERT INTO `user_answer` VALUES (1821868632960401409, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被称为【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:18:25', '2024-08-09 19:18:30', 0);
INSERT INTO `user_answer` VALUES (1821869186537226242, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而准确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被称为【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:20:37', '2024-08-09 19:20:42', 0);
INSERT INTO `user_answer` VALUES (1821870560603799554, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被认为是【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:26:05', '2024-08-09 19:26:10', 0);
INSERT INTO `user_answer` VALUES (1821870695299678209, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被认为是【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:26:37', '2024-08-09 19:26:37', 0);
INSERT INTO `user_answer` VALUES (1821871154550800386, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被称为【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:28:26', '2024-08-09 19:28:31', 0);
INSERT INTO `user_answer` VALUES (1821871307286380545, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【答题能手】', '经过对用户回答的仔细评估，我们发现该用户在所有题目中均给出了正确的答案，显示出对应用名称、描述以及题目和答案列表格式的深刻理解和准确把握。用户的回答不仅体现出对题目的仔细阅读，也显示出其在处理和解析信息方面的优秀能力。在此次测试中，用户能够准确识别题目中的关键信息，并作出快速而正确的判断，这种表现值得称赞。总的来说，该用户在此次应用相关的知识测试中表现卓越，可以被称为【答题能手】。', NULL, NULL, 1821399233866559489, '2024-08-09 19:29:03', '2024-08-09 19:29:03', 0);
INSERT INTO `user_answer` VALUES (1821871569719787522, 3, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '【模范执行者】', '根据用户的回答，显示出典型的MBTI类型为ISTJ，即内向、感觉、思考和判断。你似乎是一个认真、负责、严谨的人，对规则和结构有很高的尊重，喜欢有序和计划性强的环境。在社交场合中可能比较保守，但一旦承诺了某件事情，你会全力以赴，保证任务的完成。你重视时间和效率，对于细节的关注程度令人钦佩。面对新的挑战时，你可能会先进行周密的考虑和规划，而不是急于行动。总的来说，你是一个可靠、有条理、高度负责的模范执行者。', NULL, NULL, 1821399233866559489, '2024-08-09 19:30:05', '2024-08-09 19:30:11', 0);
INSERT INTO `user_answer` VALUES (1822119608501927936, 3, 1, 1, '[\"A\",\"A\",\"A\",\"A\",\"A\",\"B\",\"B\",\"B\",\"B\",\"A\"]', NULL, '内向直觉型思考者（INTJ）', '根据你的回答，你被评估为内向直觉型思考者（INTJ）。这是一个非常独立和具有战略思考能力的性格类型。你倾向于深入思考，喜欢理论性的探讨，并且在解决问题时往往采取一个非常系统和逻辑的方法。你通常更喜欢独自工作，在社交场合中可能比较保守，但一旦熟悉了环境，你也能展现出出色的沟通能力。你对规则持有自己的看法，认为它们应该是合理和有效的。在面对新的挑战时，你表现出强烈的求知欲和解决问题的决心。在日常生活中，你可能更注重效率和结果，而不是人际交往。在做决定时，你倾向于依赖逻辑和客观分析，而不是情感或他人的意见。总体上，你是一个目标导向、理性且高度自我驱动的人。', NULL, NULL, 1821399233866559489, '2024-08-10 11:55:53', '2024-08-10 11:56:00', 0);
INSERT INTO `user_answer` VALUES (1822119955148578816, 3, 1, 1, '[\"A\",\"A\",\"B\",\"B\",\"A\",\"A\",\"A\",\"B\",\"A\",\"B\"]', NULL, '积极进取的实践者', '根据你的回答，你展现出了积极进取的实践者特质。你倾向于选择实际行动而非仅仅停留在理论思考，这体现在你对活动的安排和面对新挑战时的态度上。你倾向于迅速作出决定，并在问题出现时采取主动行动，这显示了你的决断力和问题解决能力。同时，你对规则的看法和社交场合的态度表明，你尊重传统但同时也能适应变化，这使你能够在不同环境中灵活应对。虽然你有一定的日常规划意识，但你也意识到适时调整的重要性。总体来说，你是一个愿意尝试、适应力强，并且能够有效利用时间的人。', NULL, NULL, 1821399233866559489, '2024-08-10 11:57:14', '2024-08-10 11:57:21', 0);
INSERT INTO `user_answer` VALUES (1822120450198110208, 3, 1, 1, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"A\"]', NULL, '内向思考型（INTJ）', '根据你的回答，你被评估为内向思考型（INTJ）。这是一个非常独立和具有战略思考能力的性格类型。你倾向于选择深入分析和逻辑推理（A选项），而不是依赖感觉和情感（B选项）。你对规则持有尊重但灵活的态度，你相信它们应该是合理且有助于效率的。在社交场合中，你虽然可能不是最外向的人，但你擅长在需要时进行有效的社交互动。面对新的挑战时，你通常倾向于先进行深思熟虑，而不是冲动行事。在做决定时，你依靠逻辑和客观分析，而不是情感或他人的意见。你对待时间的方式表明你重视效率和计划，喜欢有条不紊地进行日常安排。总的来说，你是一个理性、有组织、目标导向的人，适合从事需要分析和策略的职业。', NULL, NULL, 1821399233866559489, '2024-08-10 11:59:14', '2024-08-10 11:59:23', 0);
INSERT INTO `user_answer` VALUES (1822120835352752128, 3, 1, 1, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\"]', NULL, '内向思考型（INTJ）', '根据你的回答，你被评估为内向思考型（INTJ）。这是一个分析型、逻辑性强、善于规划的个性类型。你倾向于选择更为理性和逻辑的选项，无论是在社交、规划活动还是面对挑战时。你更喜欢独自工作，按照自己的规则和计划行事，而不是跟随大众或既定规则。在面对问题时，你倾向于深入思考，寻找根本的解决方案。你的决策过程通常是深思熟虑的，你重视效率和时间管理。总的来说，你是一个有远见、独立和善于策略的思考者，适合从事需要分析和策划的职业。', NULL, NULL, 1821399233866559489, '2024-08-10 12:00:44', '2024-08-10 12:00:49', 0);
INSERT INTO `user_answer` VALUES (1822122372439228416, 3, 1, 1, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"B\",\"B\"]', NULL, '内向思考型（INTJ）', '根据你的回答，你被评估为内向思考型（INTJ）。这是一个非常独立和具有战略思考能力的性格类型。你倾向于选择深入分析和逻辑推理（A选项），而不是依赖情感和直观感受（B选项）。你对规则持有尊重但灵活的态度，你更可能在社交场合中保持谨慎和有计划，而不是随意和即兴。面对新的挑战时，你倾向于深思熟虑，而不是冲动行事。在日常生活中，你更喜欢有组织和计划性，而不是随性和灵活。做决定时，你依靠逻辑和客观分析，而不是情感和他人意见。总的来说，你是一个目标导向、分析能力强且高度自主的个体。', NULL, NULL, 1821399233866559489, '2024-08-10 12:06:52', '2024-08-10 12:06:58', 0);
INSERT INTO `user_answer` VALUES (1822123207231635456, 1821867588423516161, 1, 1, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"B\",\"A\",\"B\",\"B\"]', NULL, '表现评价', '经过对用户回答的仔细分析，整体表现良好。在关于题目和选项的描述、应用类别的判断以及题目内容的编写方面，用户的回答显示出较高的理解力和判断力。特别是在处理题目序号和选项内容的问题上，用户能够正确地选择合适的策略。然而，在理解应用描述和题目数的问题上，用户的回答存在一定的偏差，这可能表明在这些方面还需要进一步的学习和实践。具体来说，用户在题目如「以下哪项描述正确？」和「关于应用名称的说法哪个是正确的？」等题目上回答正确，显示了基本概念的掌握。但在「【【【应用描述】】】可能是什么？」这类需要深入理解的问题上，回答不够准确。总体来说，用户在本次测试中展现了较强的逻辑思维和判断能力，对于一些细节问题还需加强理解和记忆。', NULL, NULL, 1821399233866559489, '2024-08-10 12:10:12', '2024-08-10 12:10:21', 0);
INSERT INTO `user_answer` VALUES (1822123731100205056, 1821824753657794562, 0, 0, '[\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"A\",\"B\",\"B\",\"A\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-10 12:12:17', '2024-08-10 12:12:17', 0);
INSERT INTO `user_answer` VALUES (1822124379661201408, 1821824753657794562, 0, 0, '[\"B\",\"A\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-10 12:14:52', '2024-08-10 12:14:52', 0);
INSERT INTO `user_answer` VALUES (1822124445121703936, 1, 1, 0, '[\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\",\"B\"]', 7, 'INFP（治愈者）', '理想主义者，富有创造力，以同情心和理解他人著称。', 'icon_url_infp', NULL, 1821399233866559489, '2024-08-10 12:15:06', '2024-08-10 12:15:06', 0);
INSERT INTO `user_answer` VALUES (1822124586893373440, 1, 1, 0, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\"]', 1, 'ISTJ（物流师）', '忠诚可靠，被公认为务实，注重细节。', 'icon_url_istj', NULL, 1821399233866559489, '2024-08-10 12:15:40', '2024-08-10 12:15:40', 0);
INSERT INTO `user_answer` VALUES (1822125482624790528, 1821824753657794562, 0, 0, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\",\"A\",\"B\"]', NULL, NULL, NULL, NULL, NULL, 1821399233866559489, '2024-08-10 12:19:15', '2024-08-10 12:19:15', 0);
INSERT INTO `user_answer` VALUES (1822127888926314496, 1821867588423516161, 1, 1, '[\"A\",\"A\",\"B\",\"A\",\"B\",\"B\",\"A\",\"B\",\"B\",\"A\"]', NULL, '表现评价', '经过对用户回答的仔细分析，整体表现良好。在关于题目和选项的理解上，用户大多数回答正确，特别是在应用描述、题目数目的正确理解以及题目内容的编写上展现出较好的掌握。然而，在应用名称的正确理解和选项内容的重复性方面，用户回答存在一些偏差。具体来说，用户在题目如「以下哪项描述正确？」、「关于题目数的描述哪个是正确的？」、「每个题目的选项数是多少？」和「题目列表的返回格式应该是什么？」等题目上回答正确，显示出对基础概念的理解。但在「关于应用名称的说法哪个是正确的？」和「该应用属于以下哪个类别？」等题目上的回答不够准确，可能需要进一步学习和理解。另外，对于「在出题时，选项内容是否可以重复？」这一问题的回答也反映出用户对某些细节的误解。建议用户在未来的学习中，重点关注这些方面的内容，以提升整体的掌握程度。', NULL, NULL, 1821399233866559489, '2024-08-10 12:28:47', '2024-08-10 12:28:55', 0);

-- ----------------------------
-- Table structure for user_answer_0
-- ----------------------------
DROP TABLE IF EXISTS `user_answer_0`;
CREATE TABLE `user_answer_0`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1822145671370113025 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录分表 0' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_answer_0
-- ----------------------------
INSERT INTO `user_answer_0` VALUES (1822145671370113024, 2, 0, 0, '[\"B\",\"D\",\"D\",\"C\",\"D\",\"C\",\"B\",\"C\",\"D\",\"C\"]', 17, '首都知识大师', '你真棒棒哦，首都知识非常出色！', NULL, 28, 1821399233866559489, '2024-08-10 13:39:25', '2024-08-10 13:39:25', 0);

-- ----------------------------
-- Table structure for user_answer_1
-- ----------------------------
DROP TABLE IF EXISTS `user_answer_1`;
CREATE TABLE `user_answer_1`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1822145961209102337 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录分表 1' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_answer_1
-- ----------------------------
INSERT INTO `user_answer_1` VALUES (1822145961209102336, 1821867588423516161, 1, 1, '[\"A\",\"B\",\"A\",\"B\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]', NULL, '表现评价', '经过对用户回答的仔细分析，整体表现良好。在关于题目描述、应用理解、题目选项处理等方面，用户均能给出正确答案。特别是在理解应用描述、题目数和选项数的认知上，用户展现了深入的理解。然而，在题目内容编写和选项内容重复的问题上，用户的回答仍有提升空间。具体来说，用户在题目编写方面可能需要进一步了解如何清晰、准确地表达题目意图；在选项内容重复的问题上，用户可能需要认识到每个题目的选项应当具有唯一性，以避免混淆。总体而言，用户在本次测试中展现了较高的理解和应用能力，但仍有细节可以进一步完善。', NULL, NULL, 1821399233866559489, '2024-08-10 13:40:35', '2024-08-10 13:40:43', 0);

SET FOREIGN_KEY_CHECKS = 1;
