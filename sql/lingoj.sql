/*
 Navicat Premium Dump SQL

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 80401 (8.4.1)
 Source Host           : 127.0.0.1:3306
 Source Schema         : lingoj

 Target Server Type    : MySQL
 Target Server Version : 80401 (8.4.1)
 File Encoding         : 65001

 Date: 31/08/2024 14:47:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子收藏' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目答案',
  `submitNum` int NOT NULL DEFAULT 0 COMMENT '题目提交数',
  `acceptedNum` int NOT NULL DEFAULT 0 COMMENT '题目通过数',
  `judgeCase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题用例（json 数组）',
  `judgeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题配置（json 对象）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1824831089449975810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, NULL, NULL, 0, 0, 1824823635001597953, '2024-08-17 23:01:47', '2024-08-17 23:01:47', 0);
INSERT INTO `question` VALUES (2, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, NULL, NULL, 0, 0, 1824823635001597953, '2024-08-17 23:02:34', '2024-08-17 23:07:32', 1);
INSERT INTO `question` VALUES (1824824189161431042, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, NULL, NULL, 0, 0, 1824823635001597953, '2024-08-17 23:02:44', '2024-08-17 23:02:44', 0);
INSERT INTO `question` VALUES (1824825140022730753, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, NULL, NULL, 0, 0, 1824823635001597953, '2024-08-17 23:06:31', '2024-08-17 23:06:31', 0);
INSERT INTO `question` VALUES (1824827213288169474, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:14:45', '2024-08-17 23:14:45', 0);
INSERT INTO `question` VALUES (1824827304996626433, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:15:07', '2024-08-17 23:15:07', 0);
INSERT INTO `question` VALUES (1824827871605153793, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:17:22', '2024-08-17 23:17:22', 0);
INSERT INTO `question` VALUES (1824828126073577473, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:18:23', '2024-08-17 23:18:23', 0);
INSERT INTO `question` VALUES (1824828379455676418, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:19:23', '2024-08-17 23:19:23', 0);
INSERT INTO `question` VALUES (1824829173647097857, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:22:33', '2024-08-17 23:22:33', 0);
INSERT INTO `question` VALUES (1824829646143832066, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:24:25', '2024-08-17 23:24:25', 0);
INSERT INTO `question` VALUES (1824830364015738881, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, NULL, NULL, 0, 0, 1824823635001597953, '2024-08-17 23:27:17', '2024-08-17 23:27:17', 0);
INSERT INTO `question` VALUES (1824830449906696194, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', NULL, 0, 0, 1824823635001597953, '2024-08-17 23:27:37', '2024-08-17 23:27:37', 0);
INSERT INTO `question` VALUES (1824831089449975809, 'A + B', '题目内容', '[\"栈\",\"简单\"]', '暴力破解', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3 4\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1824823635001597953, '2024-08-17 23:30:10', '2024-08-17 23:30:10', 0);

-- ----------------------------
-- Table structure for question_submit
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编程语言',
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户代码',
  `judgeInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '判题信息（json 对象）',
  `status` int NOT NULL DEFAULT 0 COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint NOT NULL COMMENT '题目 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionId`(`questionId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1824834474504962051 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目提交' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES (1, 'java', '10', '{}', 0, 1, 1824823635001597953, '2024-08-17 23:43:07', '2024-08-17 23:43:07', 0);
INSERT INTO `question_submit` VALUES (1824834474504962050, 'java', '10', '{}', 0, 1, 1824823635001597954, '2024-08-17 23:43:37', '2024-08-18 16:19:53', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1824823635001597954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1824823635001597953, 'ling', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, NULL, NULL, NULL, 'user', '2024-08-17 23:00:32', '2024-08-18 16:20:37', 0);

SET FOREIGN_KEY_CHECKS = 1;
