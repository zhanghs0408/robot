/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.68.129
 Source Server Type    : PostgreSQL
 Source Server Version : 140009
 Source Host           : 192.168.68.129:5432
 Source Catalog        : my_db
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140009
 File Encoding         : 65001

 Date: 28/08/2023 01:35:52
*/


-- ----------------------------
-- Sequence structure for x_menu_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."x_menu_menu_id_seq";
CREATE SEQUENCE "public"."x_menu_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for x_role_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."x_role_menu_id_seq";
CREATE SEQUENCE "public"."x_role_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for x_role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."x_role_role_id_seq";
CREATE SEQUENCE "public"."x_role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for x_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."x_user_id_seq";
CREATE SEQUENCE "public"."x_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for x_user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."x_user_role_id_seq";
CREATE SEQUENCE "public"."x_user_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for x_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."x_menu";
CREATE TABLE "public"."x_menu" (
  "menu_id" int4 NOT NULL DEFAULT nextval('x_menu_menu_id_seq'::regclass),
  "component" varchar(100) COLLATE "pg_catalog"."default",
  "path" varchar(100) COLLATE "pg_catalog"."default",
  "redirect" varchar(100) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" int4,
  "is_leaf" varchar(1) COLLATE "pg_catalog"."default",
  "hidden" bool
)
;

-- ----------------------------
-- Records of x_menu
-- ----------------------------
INSERT INTO "public"."x_menu" VALUES (1, 'Layout', '/sys', '/sys/user', 'sysManage', '系统管理', 'userManage', 0, 'N', 'f');
INSERT INTO "public"."x_menu" VALUES (2, 'sys/user', 'user', NULL, 'userList', '用户列表', 'user', 1, 'Y', 'f');
INSERT INTO "public"."x_menu" VALUES (3, 'sys/role', 'role', NULL, 'roleList', '角色列表', 'roleManage', 1, 'Y', 'f');
INSERT INTO "public"."x_menu" VALUES (4, 'Layout', '/test', '/test/test1', 'test', '功能测试', 'form', 0, 'N', 'f');
INSERT INTO "public"."x_menu" VALUES (5, 'test/test1', 'test1', '', 'test1', '测试点一', 'form', 4, 'Y', 'f');
INSERT INTO "public"."x_menu" VALUES (6, 'test/test2', 'test2', '', 'test2', '测试点二', 'form', 4, 'Y', 'f');
INSERT INTO "public"."x_menu" VALUES (7, 'test/test3', 'test3', '', 'test3', '测试点三', 'form', 4, 'Y', 'f');

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."x_role";
CREATE TABLE "public"."x_role" (
  "role_id" int4 NOT NULL DEFAULT nextval('x_role_role_id_seq'::regclass),
  "role_name" varchar(50) COLLATE "pg_catalog"."default",
  "role_desc" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO "public"."x_role" VALUES (1, 'admin', '超级管理员');
INSERT INTO "public"."x_role" VALUES (2, 'hr', '人事管理员');
INSERT INTO "public"."x_role" VALUES (3, 'normal', '普通员工');

-- ----------------------------
-- Table structure for x_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."x_role_menu";
CREATE TABLE "public"."x_role_menu" (
  "id" int4 NOT NULL DEFAULT nextval('x_role_menu_id_seq'::regclass),
  "role_id" int4,
  "menu_id" int4
)
;

-- ----------------------------
-- Records of x_role_menu
-- ----------------------------
INSERT INTO "public"."x_role_menu" VALUES (1, 1, 1);
INSERT INTO "public"."x_role_menu" VALUES (2, 1, 2);
INSERT INTO "public"."x_role_menu" VALUES (3, 1, 3);
INSERT INTO "public"."x_role_menu" VALUES (4, 1, 4);
INSERT INTO "public"."x_role_menu" VALUES (5, 1, 5);
INSERT INTO "public"."x_role_menu" VALUES (6, 1, 6);
INSERT INTO "public"."x_role_menu" VALUES (7, 1, 7);
INSERT INTO "public"."x_role_menu" VALUES (8, 3, 4);
INSERT INTO "public"."x_role_menu" VALUES (9, 3, 5);
INSERT INTO "public"."x_role_menu" VALUES (10, 3, 6);
INSERT INTO "public"."x_role_menu" VALUES (11, 3, 7);

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."x_user";
CREATE TABLE "public"."x_user" (
  "id" int4 NOT NULL DEFAULT nextval('x_user_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "status" int4,
  "avatar" varchar(200) COLLATE "pg_catalog"."default",
  "deleted" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO "public"."x_user" VALUES (1, 'admin', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'super@aliyun.com', '18677778888', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO "public"."x_user" VALUES (2, 'zhangsan', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'zhangsan@gmail.com', '13966667777', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO "public"."x_user" VALUES (3, 'lisi', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'lisi@gmail.com', '13966667778', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO "public"."x_user" VALUES (4, 'wangwu', '$2a$10$3ZDHAfyo/P7tSOabB8X.DuVM1DN92YWgSd46ecVY.5WUAQNef7iUC', 'wangwu@gmail.com', '13966667772', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);

-- ----------------------------
-- Table structure for x_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."x_user_role";
CREATE TABLE "public"."x_user_role" (
  "id" int4 NOT NULL DEFAULT nextval('x_user_role_id_seq'::regclass),
  "user_id" int4,
  "role_id" int4
)
;

-- ----------------------------
-- Records of x_user_role
-- ----------------------------
INSERT INTO "public"."x_user_role" VALUES (1, 1, 1);
INSERT INTO "public"."x_user_role" VALUES (2, 1, 3);
INSERT INTO "public"."x_user_role" VALUES (6, 3, 2);
INSERT INTO "public"."x_user_role" VALUES (7, 4, 2);
INSERT INTO "public"."x_user_role" VALUES (8, 4, 3);
INSERT INTO "public"."x_user_role" VALUES (11, 2, 3);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."x_menu_menu_id_seq"
OWNED BY "public"."x_menu"."menu_id";
SELECT setval('"public"."x_menu_menu_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."x_role_menu_id_seq"
OWNED BY "public"."x_role_menu"."id";
SELECT setval('"public"."x_role_menu_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."x_role_role_id_seq"
OWNED BY "public"."x_role"."role_id";
SELECT setval('"public"."x_role_role_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."x_user_id_seq"
OWNED BY "public"."x_user"."id";
SELECT setval('"public"."x_user_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."x_user_role_id_seq"
OWNED BY "public"."x_user_role"."id";
SELECT setval('"public"."x_user_role_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table x_menu
-- ----------------------------
ALTER TABLE "public"."x_menu" ADD CONSTRAINT "x_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table x_role
-- ----------------------------
ALTER TABLE "public"."x_role" ADD CONSTRAINT "x_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table x_role_menu
-- ----------------------------
ALTER TABLE "public"."x_role_menu" ADD CONSTRAINT "x_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table x_user
-- ----------------------------
ALTER TABLE "public"."x_user" ADD CONSTRAINT "x_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table x_user_role
-- ----------------------------
ALTER TABLE "public"."x_user_role" ADD CONSTRAINT "x_user_role_pkey" PRIMARY KEY ("id");
