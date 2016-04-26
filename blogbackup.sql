-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ot_action`
--

DROP TABLE IF EXISTS `ot_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_action`
--

LOCK TABLES `ot_action` WRITE;
/*!40000 ALTER TABLE `ot_action` DISABLE KEYS */;
INSERT INTO `ot_action` VALUES (1,'user_login','用户登录','积分+10，每天一次','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]在[time|time_format]登录了后台',1,1,1387181220),(2,'add_article','发布文章','积分+5，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180),(3,'review','评论','评论积分+1，无限制','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646),(4,'add_document','发表文档','积分+10，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。',2,0,1386139726),(5,'add_document_topic','发表讨论','积分+5，每天上限10次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551),(6,'update_config','更新配置','新增或修改或删除配置','','',1,1,1383294988),(7,'update_model','更新模型','新增或修改模型','','',1,1,1383295057),(8,'update_attribute','更新属性','新增或更新或删除属性','','',1,1,1383295963),(9,'update_channel','更新导航','新增或修改或删除导航','','',1,1,1383296301),(10,'update_menu','更新菜单','新增或修改或删除菜单','','',1,1,1383296392),(11,'update_category','更新分类','新增或修改或删除分类','','',1,1,1383296765);
/*!40000 ALTER TABLE `ot_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_action_log`
--

DROP TABLE IF EXISTS `ot_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_action_log`
--

LOCK TABLES `ot_action_log` WRITE;
/*!40000 ALTER TABLE `ot_action_log` DISABLE KEYS */;
INSERT INTO `ot_action_log` VALUES (1,1,1,2130706433,'member',1,'admin在2015-12-20 18:45登录了后台',1,1450608336),(2,11,1,2130706433,'category',39,'操作url：http://www.phpbst.com/index.php?s=/admin/category/add.html',1,1450608476),(3,11,1,2130706433,'category',40,'操作url：http://www.phpbst.com/index.php?s=/admin/category/add.html',1,1450608518),(4,1,1,2130706433,'member',1,'admin在2015-12-25 00:51登录了后台',1,1450975861),(5,1,1,2130706433,'member',1,'admin在2015-12-26 13:06登录了后台',1,1451106369),(6,9,1,2130706433,'channel',3,'操作url：http://www.phpbst.com/index.php?s=/admin/channel/edit.html',1,1451108734),(7,11,1,2130706433,'category',41,'操作url：http://www.phpbst.com/index.php?s=/admin/category/add.html',1,1451108871),(8,9,1,2130706433,'channel',5,'操作url：http://www.phpbst.com/index.php?s=/admin/channel/edit.html',1,1451108917),(9,1,1,2130706433,'member',1,'admin在2016-01-10 01:23登录了后台',1,1452360183),(10,11,1,2130706433,'category',42,'操作url：http://www.phpbst.com/index.php?s=/admin/category/add.html',1,1452369925),(11,1,1,2130706433,'member',1,'admin在2016-01-10 14:41登录了后台',1,1452408085),(12,11,1,2130706433,'category',39,'操作url：http://www.phpbst.com/index.php?s=/admin/category/edit.html',1,1452410126),(13,11,1,2130706433,'category',40,'操作url：http://www.phpbst.com/index.php?s=/admin/category/edit.html',1,1452412128),(14,1,1,2130706433,'member',1,'admin在2016-01-31 16:18登录了后台',1,1454228328),(15,1,1,3395820372,'member',1,'admin在2016-04-17 13:27登录了后台',1,1460870824),(16,1,1,3395820372,'member',1,'admin在2016-04-17 13:27登录了后台',1,1460870866),(17,1,1,3395820372,'member',1,'admin在2016-04-17 13:29登录了后台',1,1460870974),(18,1,2,3395820372,'member',2,'feng在2016-04-17 13:40登录了后台',1,1460871653),(19,1,1,3395820372,'member',1,'admin在2016-04-17 13:43登录了后台',1,1460871812),(20,1,1,3395820372,'member',1,'admin在2016-04-17 15:22登录了后台',1,1460877743),(21,11,1,3395820372,'category',43,'操作url：/index.php?s=/Admin/Category/add.html',1,1460877967),(22,11,1,3395820372,'category',43,'操作url：/index.php?s=/Admin/Category/remove/id/43.html',1,1460877996),(23,11,1,3395820372,'category',44,'操作url：/index.php?s=/Admin/Category/add.html',1,1460881487),(24,11,1,3395820372,'category',45,'操作url：/index.php?s=/Admin/Category/add.html',1,1460881600),(25,11,1,3395820372,'category',46,'操作url：/index.php?s=/Admin/Category/add.html',1,1460883234),(26,11,1,3395820372,'category',47,'操作url：/index.php?s=/Admin/Category/add.html',1,1460883474),(27,1,1,3395820372,'member',1,'admin在2016-04-17 19:30登录了后台',1,1460892623),(28,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/add.html',1,1460892674),(29,11,1,3395820372,'category',49,'操作url：/index.php?s=/Admin/Category/add.html',1,1460892717),(30,1,1,3395820372,'member',1,'admin在2016-04-17 20:53登录了后台',1,1460897582),(31,1,1,3395820372,'member',1,'admin在2016-04-17 21:04登录了后台',1,1460898267),(32,1,1,3395820372,'member',1,'admin在2016-04-17 21:07登录了后台',1,1460898446),(33,1,1,3395820372,'member',1,'admin在2016-04-17 21:07登录了后台',1,1460898467),(34,1,1,3395820372,'member',1,'admin在2016-04-17 21:08登录了后台',1,1460898520),(35,1,1,3395820372,'member',1,'admin在2016-04-17 21:09登录了后台',1,1460898599),(36,1,1,3395820372,'member',1,'admin在2016-04-17 21:21登录了后台',1,1460899288),(37,11,1,3395820372,'category',47,'操作url：/index.php?s=/Admin/Category/remove/id/47.html',1,1460903064),(38,11,1,3395820372,'category',50,'操作url：/index.php?s=/Admin/Category/add.html',1,1460903092),(39,1,1,3395820372,'member',1,'Wayne在2016-04-18 14:23登录了后台',1,1460960597),(40,11,1,3395820372,'category',51,'操作url：/index.php?s=/Admin/Category/add.html',1,1460961086),(41,1,1,3395820372,'member',1,'Wayne在2016-04-20 16:33登录了后台',1,1461141238),(42,11,1,3395820372,'category',52,'操作url：/index.php?s=/Admin/Category/add.html',1,1461141356),(43,11,1,3395820372,'category',52,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461141410),(44,1,1,3395820372,'member',1,'Wayne在2016-04-23 22:30登录了后台',1,1461421831),(45,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/add.html',1,1461421953),(46,11,1,3395820372,'category',42,'操作url：/index.php?s=/Admin/Category/remove/id/42.html',1,1461421964),(47,11,1,3395820372,'category',40,'操作url：/index.php?s=/Admin/Category/remove/id/40.html',1,1461421977),(48,11,1,3395820372,'category',39,'操作url：/index.php?s=/Admin/Category/remove/id/39.html',1,1461421983),(49,11,1,3395820372,'category',41,'操作url：/index.php?s=/Admin/Category/remove/id/41.html',1,1461421988),(50,11,1,3395820372,'category',54,'操作url：/index.php?s=/Admin/Category/add.html',1,1461422022),(51,1,1,3395820372,'member',1,'Wayne在2016-04-24 10:41登录了后台',1,1461465660),(52,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461465943),(53,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466040),(54,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466175),(55,11,1,3395820372,'category',44,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466205),(56,11,1,3395820372,'category',44,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466220),(57,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466242),(58,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466251),(59,11,1,3395820372,'category',1,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466348),(60,11,1,3395820372,'category',55,'操作url：/index.php?s=/Admin/Category/add.html',1,1461466398),(61,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466420),(62,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466425),(63,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466466),(64,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466477),(65,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466496),(66,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466505),(67,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466525),(68,11,1,3395820372,'category',46,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466530),(69,11,1,3395820372,'category',44,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466534),(70,11,1,3395820372,'category',55,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466538),(71,11,1,3395820372,'category',53,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466540),(72,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466565),(73,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461466598),(74,11,1,3395820372,'category',48,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461467726),(75,1,1,3395820372,'member',1,'Wayne在2016-04-24 14:41登录了后台',1,1461480079),(76,11,1,3395820372,'category',56,'操作url：/index.php?s=/Admin/Category/add.html',1,1461480834),(77,1,1,3395820372,'member',1,'Wayne在2016-04-24 16:28登录了后台',1,1461486480),(78,1,1,3395820372,'member',1,'Wayne在2016-04-24 18:53登录了后台',1,1461495229),(79,1,1,3395820372,'member',1,'Wayne在2016-04-24 19:56登录了后台',1,1461498974),(80,1,1,3395820373,'member',1,'Wayne在2016-04-24 22:34登录了后台',1,1461508467),(81,1,1,3395820373,'member',1,'Wayne在2016-04-24 23:10登录了后台',1,1461510621),(82,11,1,3395820373,'category',45,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461510876),(83,11,1,3395820373,'category',1,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461511382),(84,1,1,3395820372,'member',1,'Wayne在2016-04-25 13:55登录了后台',1,1461563731),(85,11,1,3395820372,'category',44,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461563782),(86,11,1,3395820372,'category',45,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461564079),(87,11,1,3395820372,'category',57,'操作url：/index.php?s=/Admin/Category/add.html',1,1461567945),(88,1,1,3395820372,'member',1,'Wayne在2016-04-25 19:09登录了后台',1,1461582569),(89,11,1,3395820372,'category',58,'操作url：/index.php?s=/Admin/Category/add.html',1,1461585130),(90,11,1,3395820372,'category',58,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461585191),(91,11,1,3395820372,'category',58,'操作url：/index.php?s=/Admin/Category/edit.html',1,1461585229),(92,1,1,3395820371,'member',1,'Wayne在2016-04-26 00:27登录了后台',1,1461601665),(93,1,1,3395820372,'member',1,'Wayne在2016-04-26 09:48登录了后台',1,1461635338);
/*!40000 ALTER TABLE `ot_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_addons`
--

DROP TABLE IF EXISTS `ot_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_addons`
--

LOCK TABLES `ot_addons` WRITE;
/*!40000 ALTER TABLE `ot_addons` DISABLE KEYS */;
INSERT INTO `ot_addons` VALUES (15,'EditorForAdmin','后台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1383126253,0),(2,'SiteStat','站点统计信息','统计站点的基础信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}','thinkphp','0.1',1379512015,0),(3,'DevTeam','开发团队信息','开发团队成员信息',1,'{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512022,0),(4,'SystemInfo','系统环境信息','用于显示一些服务器的信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512036,0),(5,'Editor','前台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1379830910,0),(6,'Attachment','附件','用于文档模型上传附件',1,'null','thinkphp','0.1',1379842319,1),(9,'SocialComment','通用社交化评论','集成了各种社交化评论插件，轻松集成到系统中。',1,'{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}','thinkphp','0.1',1380273962,0);
/*!40000 ALTER TABLE `ot_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_attachment`
--

DROP TABLE IF EXISTS `ot_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_attachment`
--

LOCK TABLES `ot_attachment` WRITE;
/*!40000 ALTER TABLE `ot_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_attribute`
--

DROP TABLE IF EXISTS `ot_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_attribute`
--

LOCK TABLES `ot_attribute` WRITE;
/*!40000 ALTER TABLE `ot_attribute` DISABLE KEYS */;
INSERT INTO `ot_attribute` VALUES (1,'uid','用户ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,''),(2,'name','标识','char(40) NOT NULL ','string','','同一根节点下标识不重复',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,''),(3,'title','标题','char(80) NOT NULL ','string','','文档标题',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,''),(4,'category_id','所属分类','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,''),(5,'description','描述','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,''),(6,'root','根节点','int(10) unsigned NOT NULL ','num','0','该文档的顶级文档编号',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,''),(7,'pid','所属ID','int(10) unsigned NOT NULL ','num','0','父文档编号',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,''),(8,'model_id','内容模型ID','tinyint(3) unsigned NOT NULL ','num','0','该文档所对应的模型',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,''),(9,'type','内容类型','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:目录\r\n2:主题\r\n3:段落',1,0,1,1384511157,1383891233,'',0,'','','',0,''),(10,'position','推荐位','smallint(5) unsigned NOT NULL ','checkbox','0','多个推荐则将其推荐值相加',1,'1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐',1,0,1,1383895640,1383891233,'',0,'','','',0,''),(11,'link_id','外链','int(10) unsigned NOT NULL ','num','0','0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,''),(12,'cover_id','封面','int(10) unsigned NOT NULL ','picture','0','0-无封面，大于0-封面图片ID，需要函数处理',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,''),(13,'display','可见性','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:不可见\r\n1:所有人可见',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function'),(14,'deadline','截至时间','int(10) unsigned NOT NULL ','datetime','0','0-永久有效',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function'),(15,'attach','附件数量','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function'),(16,'view','浏览量','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,''),(17,'comment','评论数','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,''),(18,'extend','扩展统计字段','int(10) unsigned NOT NULL ','num','0','根据需求自行使用',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,''),(19,'level','优先级','int(10) unsigned NOT NULL ','num','0','越高排序越靠前',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,''),(20,'create_time','创建时间','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,''),(21,'update_time','更新时间','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,''),(22,'status','数据状态','tinyint(4) NOT NULL ','radio','0','',0,'-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿',1,0,1,1384508496,1383891233,'',0,'','','',0,''),(23,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,''),(24,'content','文章内容','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,''),(25,'template','详情页显示模板','varchar(100) NOT NULL ','string','','参照display方法参数的定义',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,''),(26,'bookmark','收藏数','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,''),(27,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function'),(28,'content','下载详细描述','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,''),(29,'template','详情页显示模板','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,''),(30,'file_id','文件ID','int(10) unsigned NOT NULL ','file','0','需要函数处理',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,''),(31,'download','下载次数','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,''),(32,'size','文件大小','bigint(20) unsigned NOT NULL ','num','0','单位bit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,'');
/*!40000 ALTER TABLE `ot_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_auth_extend`
--

DROP TABLE IF EXISTS `ot_auth_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_auth_extend`
--

LOCK TABLES `ot_auth_extend` WRITE;
/*!40000 ALTER TABLE `ot_auth_extend` DISABLE KEYS */;
INSERT INTO `ot_auth_extend` VALUES (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);
/*!40000 ALTER TABLE `ot_auth_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_auth_group`
--

DROP TABLE IF EXISTS `ot_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_auth_group`
--

LOCK TABLES `ot_auth_group` WRITE;
/*!40000 ALTER TABLE `ot_auth_group` DISABLE KEYS */;
INSERT INTO `ot_auth_group` VALUES (1,'admin',1,'默认用户组','',1,'1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),(2,'admin',1,'测试用户','测试用户',1,'1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
/*!40000 ALTER TABLE `ot_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_auth_group_access`
--

DROP TABLE IF EXISTS `ot_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_auth_group_access`
--

LOCK TABLES `ot_auth_group_access` WRITE;
/*!40000 ALTER TABLE `ot_auth_group_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_auth_rule`
--

DROP TABLE IF EXISTS `ot_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_auth_rule`
--

LOCK TABLES `ot_auth_rule` WRITE;
/*!40000 ALTER TABLE `ot_auth_rule` DISABLE KEYS */;
INSERT INTO `ot_auth_rule` VALUES (1,'admin',2,'Admin/Index/index','首页',1,''),(2,'admin',2,'Admin/Article/mydocument','内容',1,''),(3,'admin',2,'Admin/User/index','用户',1,''),(4,'admin',2,'Admin/Addons/index','扩展',1,''),(5,'admin',2,'Admin/Config/group','系统',1,''),(7,'admin',1,'Admin/article/add','新增',1,''),(8,'admin',1,'Admin/article/edit','编辑',1,''),(9,'admin',1,'Admin/article/setStatus','改变状态',1,''),(10,'admin',1,'Admin/article/update','保存',1,''),(11,'admin',1,'Admin/article/autoSave','保存草稿',1,''),(12,'admin',1,'Admin/article/move','移动',1,''),(13,'admin',1,'Admin/article/copy','复制',1,''),(14,'admin',1,'Admin/article/paste','粘贴',1,''),(15,'admin',1,'Admin/article/permit','还原',1,''),(16,'admin',1,'Admin/article/clear','清空',1,''),(17,'admin',1,'Admin/article/index','文档列表',1,''),(18,'admin',1,'Admin/article/recycle','回收站',1,''),(19,'admin',1,'Admin/User/addaction','新增用户行为',1,''),(20,'admin',1,'Admin/User/editaction','编辑用户行为',1,''),(21,'admin',1,'Admin/User/saveAction','保存用户行为',1,''),(22,'admin',1,'Admin/User/setStatus','变更行为状态',1,''),(23,'admin',1,'Admin/User/changeStatus?method=forbidUser','禁用会员',1,''),(24,'admin',1,'Admin/User/changeStatus?method=resumeUser','启用会员',1,''),(25,'admin',1,'Admin/User/changeStatus?method=deleteUser','删除会员',1,''),(26,'admin',1,'Admin/User/index','用户信息',1,''),(27,'admin',1,'Admin/User/action','用户行为',1,''),(28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',1,''),(29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',1,''),(30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',1,''),(31,'admin',1,'Admin/AuthManager/createGroup','新增',1,''),(32,'admin',1,'Admin/AuthManager/editGroup','编辑',1,''),(33,'admin',1,'Admin/AuthManager/writeGroup','保存用户组',1,''),(34,'admin',1,'Admin/AuthManager/group','授权',1,''),(35,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(36,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(37,'admin',1,'Admin/AuthManager/removeFromGroup','解除授权',1,''),(38,'admin',1,'Admin/AuthManager/addToGroup','保存成员授权',1,''),(39,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(40,'admin',1,'Admin/AuthManager/addToCategory','保存分类授权',1,''),(41,'admin',1,'Admin/AuthManager/index','权限管理',1,''),(42,'admin',1,'Admin/Addons/create','创建',1,''),(43,'admin',1,'Admin/Addons/checkForm','检测创建',1,''),(44,'admin',1,'Admin/Addons/preview','预览',1,''),(45,'admin',1,'Admin/Addons/build','快速生成插件',1,''),(46,'admin',1,'Admin/Addons/config','设置',1,''),(47,'admin',1,'Admin/Addons/disable','禁用',1,''),(48,'admin',1,'Admin/Addons/enable','启用',1,''),(49,'admin',1,'Admin/Addons/install','安装',1,''),(50,'admin',1,'Admin/Addons/uninstall','卸载',1,''),(51,'admin',1,'Admin/Addons/saveconfig','更新配置',1,''),(52,'admin',1,'Admin/Addons/adminList','插件后台列表',1,''),(53,'admin',1,'Admin/Addons/execute','URL方式访问插件',1,''),(54,'admin',1,'Admin/Addons/index','插件管理',1,''),(55,'admin',1,'Admin/Addons/hooks','钩子管理',1,''),(56,'admin',1,'Admin/model/add','新增',1,''),(57,'admin',1,'Admin/model/edit','编辑',1,''),(58,'admin',1,'Admin/model/setStatus','改变状态',1,''),(59,'admin',1,'Admin/model/update','保存数据',1,''),(60,'admin',1,'Admin/Model/index','模型管理',1,''),(61,'admin',1,'Admin/Config/edit','编辑',1,''),(62,'admin',1,'Admin/Config/del','删除',1,''),(63,'admin',1,'Admin/Config/add','新增',1,''),(64,'admin',1,'Admin/Config/save','保存',1,''),(65,'admin',1,'Admin/Config/group','网站设置',1,''),(66,'admin',1,'Admin/Config/index','配置管理',1,''),(67,'admin',1,'Admin/Channel/add','新增',1,''),(68,'admin',1,'Admin/Channel/edit','编辑',1,''),(69,'admin',1,'Admin/Channel/del','删除',1,''),(70,'admin',1,'Admin/Channel/index','导航管理',1,''),(71,'admin',1,'Admin/Category/edit','编辑',1,''),(72,'admin',1,'Admin/Category/add','新增',1,''),(73,'admin',1,'Admin/Category/remove','删除',1,''),(74,'admin',1,'Admin/Category/index','分类管理',1,''),(75,'admin',1,'Admin/file/upload','上传控件',-1,''),(76,'admin',1,'Admin/file/uploadPicture','上传图片',-1,''),(77,'admin',1,'Admin/file/download','下载',-1,''),(94,'admin',1,'Admin/AuthManager/modelauth','模型授权',1,''),(79,'admin',1,'Admin/article/batchOperate','导入',1,''),(80,'admin',1,'Admin/Database/index?type=export','备份数据库',1,''),(81,'admin',1,'Admin/Database/index?type=import','还原数据库',1,''),(82,'admin',1,'Admin/Database/export','备份',1,''),(83,'admin',1,'Admin/Database/optimize','优化表',1,''),(84,'admin',1,'Admin/Database/repair','修复表',1,''),(86,'admin',1,'Admin/Database/import','恢复',1,''),(87,'admin',1,'Admin/Database/del','删除',1,''),(88,'admin',1,'Admin/User/add','新增用户',1,''),(89,'admin',1,'Admin/Attribute/index','属性管理',1,''),(90,'admin',1,'Admin/Attribute/add','新增',1,''),(91,'admin',1,'Admin/Attribute/edit','编辑',1,''),(92,'admin',1,'Admin/Attribute/setStatus','改变状态',1,''),(93,'admin',1,'Admin/Attribute/update','保存数据',1,''),(95,'admin',1,'Admin/AuthManager/addToModel','保存模型授权',1,''),(96,'admin',1,'Admin/Category/move','移动',-1,''),(97,'admin',1,'Admin/Category/merge','合并',-1,''),(98,'admin',1,'Admin/Config/menu','后台菜单管理',-1,''),(99,'admin',1,'Admin/Article/mydocument','内容',-1,''),(100,'admin',1,'Admin/Menu/index','菜单管理',1,''),(101,'admin',1,'Admin/other','其他',-1,''),(102,'admin',1,'Admin/Menu/add','新增',1,''),(103,'admin',1,'Admin/Menu/edit','编辑',1,''),(104,'admin',1,'Admin/Think/lists?model=article','文章管理',-1,''),(105,'admin',1,'Admin/Think/lists?model=download','下载管理',1,''),(106,'admin',1,'Admin/Think/lists?model=config','配置管理',1,''),(107,'admin',1,'Admin/Action/actionlog','行为日志',1,''),(108,'admin',1,'Admin/User/updatePassword','修改密码',1,''),(109,'admin',1,'Admin/User/updateNickname','修改昵称',1,''),(110,'admin',1,'Admin/action/edit','查看行为日志',1,''),(205,'admin',1,'Admin/think/add','新增数据',1,''),(111,'admin',2,'Admin/article/index','文档列表',-1,''),(112,'admin',2,'Admin/article/add','新增',-1,''),(113,'admin',2,'Admin/article/edit','编辑',-1,''),(114,'admin',2,'Admin/article/setStatus','改变状态',-1,''),(115,'admin',2,'Admin/article/update','保存',-1,''),(116,'admin',2,'Admin/article/autoSave','保存草稿',-1,''),(117,'admin',2,'Admin/article/move','移动',-1,''),(118,'admin',2,'Admin/article/copy','复制',-1,''),(119,'admin',2,'Admin/article/paste','粘贴',-1,''),(120,'admin',2,'Admin/article/batchOperate','导入',-1,''),(121,'admin',2,'Admin/article/recycle','回收站',-1,''),(122,'admin',2,'Admin/article/permit','还原',-1,''),(123,'admin',2,'Admin/article/clear','清空',-1,''),(124,'admin',2,'Admin/User/add','新增用户',-1,''),(125,'admin',2,'Admin/User/action','用户行为',-1,''),(126,'admin',2,'Admin/User/addAction','新增用户行为',-1,''),(127,'admin',2,'Admin/User/editAction','编辑用户行为',-1,''),(128,'admin',2,'Admin/User/saveAction','保存用户行为',-1,''),(129,'admin',2,'Admin/User/setStatus','变更行为状态',-1,''),(130,'admin',2,'Admin/User/changeStatus?method=forbidUser','禁用会员',-1,''),(131,'admin',2,'Admin/User/changeStatus?method=resumeUser','启用会员',-1,''),(132,'admin',2,'Admin/User/changeStatus?method=deleteUser','删除会员',-1,''),(133,'admin',2,'Admin/AuthManager/index','权限管理',-1,''),(134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',-1,''),(135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',-1,''),(136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',-1,''),(137,'admin',2,'Admin/AuthManager/createGroup','新增',-1,''),(138,'admin',2,'Admin/AuthManager/editGroup','编辑',-1,''),(139,'admin',2,'Admin/AuthManager/writeGroup','保存用户组',-1,''),(140,'admin',2,'Admin/AuthManager/group','授权',-1,''),(141,'admin',2,'Admin/AuthManager/access','访问授权',-1,''),(142,'admin',2,'Admin/AuthManager/user','成员授权',-1,''),(143,'admin',2,'Admin/AuthManager/removeFromGroup','解除授权',-1,''),(144,'admin',2,'Admin/AuthManager/addToGroup','保存成员授权',-1,''),(145,'admin',2,'Admin/AuthManager/category','分类授权',-1,''),(146,'admin',2,'Admin/AuthManager/addToCategory','保存分类授权',-1,''),(147,'admin',2,'Admin/AuthManager/modelauth','模型授权',-1,''),(148,'admin',2,'Admin/AuthManager/addToModel','保存模型授权',-1,''),(149,'admin',2,'Admin/Addons/create','创建',-1,''),(150,'admin',2,'Admin/Addons/checkForm','检测创建',-1,''),(151,'admin',2,'Admin/Addons/preview','预览',-1,''),(152,'admin',2,'Admin/Addons/build','快速生成插件',-1,''),(153,'admin',2,'Admin/Addons/config','设置',-1,''),(154,'admin',2,'Admin/Addons/disable','禁用',-1,''),(155,'admin',2,'Admin/Addons/enable','启用',-1,''),(156,'admin',2,'Admin/Addons/install','安装',-1,''),(157,'admin',2,'Admin/Addons/uninstall','卸载',-1,''),(158,'admin',2,'Admin/Addons/saveconfig','更新配置',-1,''),(159,'admin',2,'Admin/Addons/adminList','插件后台列表',-1,''),(160,'admin',2,'Admin/Addons/execute','URL方式访问插件',-1,''),(161,'admin',2,'Admin/Addons/hooks','钩子管理',-1,''),(162,'admin',2,'Admin/Model/index','模型管理',-1,''),(163,'admin',2,'Admin/model/add','新增',-1,''),(164,'admin',2,'Admin/model/edit','编辑',-1,''),(165,'admin',2,'Admin/model/setStatus','改变状态',-1,''),(166,'admin',2,'Admin/model/update','保存数据',-1,''),(167,'admin',2,'Admin/Attribute/index','属性管理',-1,''),(168,'admin',2,'Admin/Attribute/add','新增',-1,''),(169,'admin',2,'Admin/Attribute/edit','编辑',-1,''),(170,'admin',2,'Admin/Attribute/setStatus','改变状态',-1,''),(171,'admin',2,'Admin/Attribute/update','保存数据',-1,''),(172,'admin',2,'Admin/Config/index','配置管理',-1,''),(173,'admin',2,'Admin/Config/edit','编辑',-1,''),(174,'admin',2,'Admin/Config/del','删除',-1,''),(175,'admin',2,'Admin/Config/add','新增',-1,''),(176,'admin',2,'Admin/Config/save','保存',-1,''),(177,'admin',2,'Admin/Menu/index','菜单管理',-1,''),(178,'admin',2,'Admin/Channel/index','导航管理',-1,''),(179,'admin',2,'Admin/Channel/add','新增',-1,''),(180,'admin',2,'Admin/Channel/edit','编辑',-1,''),(181,'admin',2,'Admin/Channel/del','删除',-1,''),(182,'admin',2,'Admin/Category/index','分类管理',-1,''),(183,'admin',2,'Admin/Category/edit','编辑',-1,''),(184,'admin',2,'Admin/Category/add','新增',-1,''),(185,'admin',2,'Admin/Category/remove','删除',-1,''),(186,'admin',2,'Admin/Category/move','移动',-1,''),(187,'admin',2,'Admin/Category/merge','合并',-1,''),(188,'admin',2,'Admin/Database/index?type=export','备份数据库',-1,''),(189,'admin',2,'Admin/Database/export','备份',-1,''),(190,'admin',2,'Admin/Database/optimize','优化表',-1,''),(191,'admin',2,'Admin/Database/repair','修复表',-1,''),(192,'admin',2,'Admin/Database/index?type=import','还原数据库',-1,''),(193,'admin',2,'Admin/Database/import','恢复',-1,''),(194,'admin',2,'Admin/Database/del','删除',-1,''),(195,'admin',2,'Admin/other','其他',1,''),(196,'admin',2,'Admin/Menu/add','新增',-1,''),(197,'admin',2,'Admin/Menu/edit','编辑',-1,''),(198,'admin',2,'Admin/Think/lists?model=article','应用',-1,''),(199,'admin',2,'Admin/Think/lists?model=download','下载管理',-1,''),(200,'admin',2,'Admin/Think/lists?model=config','应用',-1,''),(201,'admin',2,'Admin/Action/actionlog','行为日志',-1,''),(202,'admin',2,'Admin/User/updatePassword','修改密码',-1,''),(203,'admin',2,'Admin/User/updateNickname','修改昵称',-1,''),(204,'admin',2,'Admin/action/edit','查看行为日志',-1,''),(206,'admin',1,'Admin/think/edit','编辑数据',1,''),(207,'admin',1,'Admin/Menu/import','导入',1,''),(208,'admin',1,'Admin/Model/generate','生成',1,''),(209,'admin',1,'Admin/Addons/addHook','新增钩子',1,''),(210,'admin',1,'Admin/Addons/edithook','编辑钩子',1,''),(211,'admin',1,'Admin/Article/sort','文档排序',1,''),(212,'admin',1,'Admin/Config/sort','排序',1,''),(213,'admin',1,'Admin/Menu/sort','排序',1,''),(214,'admin',1,'Admin/Channel/sort','排序',1,''),(215,'admin',1,'Admin/Category/operate/type/move','移动',1,''),(216,'admin',1,'Admin/Category/operate/type/merge','合并',1,'');
/*!40000 ALTER TABLE `ot_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_category`
--

DROP TABLE IF EXISTS `ot_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_category`
--

LOCK TABLES `ot_category` WRITE;
/*!40000 ALTER TABLE `ot_category` DISABLE KEYS */;
INSERT INTO `ot_category` VALUES (1,'blog','博客',0,0,10,'','','','','','','','2','2,1',0,1,1,0,0,'1','',1379474947,1461511382,1,0),(2,'default_blog','默认分类',1,1,10,'','','','','','','','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,31),(55,'cmu','CMU课程',0,3,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461466398,1461466538,1,0),(56,'hadoop','Hadoop',46,0,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461480834,1461480834,1,0),(54,'java','Java',53,0,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461422022,1461422022,1,0),(44,'afterClass','休闲',0,5,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1460881487,1461563782,1,0),(45,'poem','唐诗宋词元曲',44,0,10,'','','','','','','','2,3','2,1,3',0,2,1,1,0,'','',1460881600,1461564079,1,0),(46,'algorithmBigData','算法大数据',0,2,10,'','','','','','','','','',0,1,1,1,0,'','',1460883234,1461466530,1,0),(50,'RL','RL Learning',46,0,10,'','','','','','','','2','2,1,3',0,1,1,1,0,'','',1460903092,1460903092,1,0),(48,'system','系统',0,1,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1460892674,1461467726,1,0),(49,'mysql','Mysql',48,0,10,'','','','','','','','2','2,1,3',0,1,1,1,0,'','',1460892717,1460892717,1,0),(51,'linux','Linux',48,0,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1460961086,1460961086,1,0),(52,'ML','Machine Learning',46,0,10,'','','','','','','','2','2,1,3',0,1,1,1,0,'','',1461141356,1461141410,1,0),(53,'program','编程项目',0,4,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461421953,1461466540,1,0),(57,'git','Git',53,0,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461567945,1461567945,1,0),(58,'thinkphp','ThinkPHP',48,0,10,'','','','','','','','2,3','2,1,3',0,1,1,1,0,'','',1461585130,1461585229,1,0);
/*!40000 ALTER TABLE `ot_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_channel`
--

DROP TABLE IF EXISTS `ot_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_channel`
--

LOCK TABLES `ot_channel` WRITE;
/*!40000 ALTER TABLE `ot_channel` DISABLE KEYS */;
INSERT INTO `ot_channel` VALUES (1,0,'首页','Index/index',1,1379475111,1379923177,1,0),(2,0,'博客','Article/index?category=blog',2,1379475131,1379483713,1,0),(3,0,'官网','http://www.onethink.cn',4,1379475154,1451108734,1,0),(4,0,'前端','Article/index?category=front',3,1450608559,1450608559,1,0),(5,0,'php','Article/index?category=php',5,1451108911,1451108917,1,0);
/*!40000 ALTER TABLE `ot_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_config`
--

DROP TABLE IF EXISTS `ot_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_config`
--

LOCK TABLES `ot_config` WRITE;
/*!40000 ALTER TABLE `ot_config` DISABLE KEYS */;
INSERT INTO `ot_config` VALUES (1,'WEB_SITE_TITLE',1,'网站标题',1,'','网站标题前台显示标题',1378898976,1379235274,1,'My heart is on work',0),(2,'WEB_SITE_DESCRIPTION',2,'网站描述',1,'','网站搜索引擎描述',1378898976,1379235841,1,'积跬步，至千里',1),(3,'WEB_SITE_KEYWORD',2,'网站关键字',1,'','网站搜索引擎关键字',1378898976,1381390100,1,'ThinkPHP,OneThink，CMU , Hadoop',8),(4,'WEB_SITE_CLOSE',4,'关闭站点',1,'0:关闭,1:开启','站点关闭后其他用户不能访问，管理员可以正常访问',1378898976,1379235296,1,'1',1),(9,'CONFIG_TYPE_LIST',3,'配置类型列表',4,'','主要用于数据解析和页面表单的生成',1378898976,1379235348,1,'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',2),(10,'WEB_SITE_ICP',1,'网站备案号',1,'','设置在网站底部显示的备案号，如“沪ICP备12007941号-2',1378900335,1379235859,1,'暂时没有备案号',9),(11,'DOCUMENT_POSITION',3,'文档推荐位',2,'','文档推荐位，推荐到多个位置KEY值相加即可',1379053380,1379235329,1,'1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐',3),(12,'DOCUMENT_DISPLAY',3,'文档可见性',2,'','文章可见性仅影响前台显示，后台不收影响',1379056370,1379235322,1,'0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见',4),(13,'COLOR_STYLE',4,'后台色系',1,'default_color:默认\r\nblue_color:紫罗兰','后台颜色风格',1379122533,1379235904,1,'blue_color',10),(20,'CONFIG_GROUP_LIST',3,'配置分组',4,'','配置分组',1379228036,1384418383,1,'1:基本\r\n2:内容\r\n3:用户\r\n4:系统',4),(21,'HOOKS_TYPE',3,'钩子的类型',4,'','类型 1-用于扩展显示内容，2-用于扩展业务处理',1379313397,1379313407,1,'1:视图\r\n2:控制器',6),(22,'AUTH_CONFIG',3,'Auth配置',4,'','自定义Auth.class.php类配置',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8),(23,'OPEN_DRAFTBOX',4,'是否开启草稿功能',2,'0:关闭草稿功能\r\n1:开启草稿功能\r\n','新增文章时的草稿功能配置',1379484332,1379484591,1,'1',1),(24,'DRAFT_AOTOSAVE_INTERVAL',0,'自动保存草稿时间',2,'','自动保存草稿的时间间隔，单位：秒',1379484574,1386143323,1,'60',2),(25,'LIST_ROWS',0,'后台每页记录数',2,'','后台数据每页显示记录数',1379503896,1380427745,1,'10',10),(26,'USER_ALLOW_REGISTER',4,'是否允许用户注册',3,'0:关闭注册\r\n1:允许注册','是否开放用户注册',1379504487,1379504580,1,'1',3),(27,'CODEMIRROR_THEME',4,'预览插件的CodeMirror主题',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','详情见CodeMirror官网',1379814385,1384740813,1,'ambiance',3),(28,'DATA_BACKUP_PATH',1,'数据库备份根路径',4,'','路径必须以 / 结尾',1381482411,1381482411,1,'./Data/',5),(29,'DATA_BACKUP_PART_SIZE',0,'数据库备份卷大小',4,'','该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',1381482488,1381729564,1,'20971520',7),(30,'DATA_BACKUP_COMPRESS',4,'数据库备份文件是否启用压缩',4,'0:不压缩\r\n1:启用压缩','压缩备份文件需要PHP环境支持gzopen,gzwrite函数',1381713345,1381729544,1,'1',9),(31,'DATA_BACKUP_COMPRESS_LEVEL',4,'数据库备份文件压缩级别',4,'1:普通\r\n4:一般\r\n9:最高','数据库备份文件的压缩级别，该配置在开启压缩时生效',1381713408,1381713408,1,'9',10),(32,'DEVELOP_MODE',4,'开启开发者模式',4,'0:关闭\r\n1:开启','是否开启开发者模式',1383105995,1383291877,1,'1',11),(33,'ALLOW_VISIT',3,'不受限控制器方法',0,'','',1386644047,1386644741,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0),(34,'DENY_VISIT',3,'超管专限控制器方法',0,'','仅超级管理员可访问的控制器方法',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0),(35,'REPLY_LIST_ROWS',0,'回复列表每页条数',2,'','',1386645376,1387178083,1,'10',0),(36,'ADMIN_ALLOW_IP',2,'后台允许访问IP',4,'','多个用逗号分隔，如果不配置表示不限制IP访问',1387165454,1387165553,1,'',12),(37,'SHOW_PAGE_TRACE',4,'是否显示页面Trace',4,'0:关闭\r\n1:开启','是否显示页面Trace信息',1387165685,1387165685,1,'0',1);
/*!40000 ALTER TABLE `ot_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_document`
--

DROP TABLE IF EXISTS `ot_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_document`
--

LOCK TABLES `ot_document` WRITE;
/*!40000 ALTER TABLE `ot_document` DISABLE KEYS */;
INSERT INTO `ot_document` VALUES (1,1,'','OneThink1.0正式版发布',2,'大家期待的OneThink正式版发布',0,0,2,2,0,0,0,1,0,0,18,0,0,0,1387260660,1460961376,-1),(31,1,'hadoop_PCA','hadoop PCA',56,'hadoopPCA',0,0,2,2,0,0,0,1,0,0,0,0,0,0,1461586800,1461636875,1),(30,1,'oneThink','oneThink 使用的各种问题',58,'oneThink 使用问题',0,0,2,2,0,0,0,1,0,0,0,0,0,0,1461585300,1461640213,1),(29,1,'gitBasic','Git 将本地代码push到 github',57,'Git 的基本操作',0,0,2,2,0,0,0,1,0,0,4,0,0,0,1461568620,1461585031,1),(28,1,'','x',45,'',0,0,3,2,0,0,0,1,0,0,0,0,0,0,1461567828,1461567828,3),(27,1,'','xiaoyan',45,'',0,0,3,2,0,0,0,1,0,0,0,0,0,0,1461564752,1461564752,3),(26,1,'autoremove','危险的 autoremove',51,'autoremove',0,0,2,2,0,0,0,1,0,0,2,0,0,0,1461486748,1461486748,1),(25,1,'hadoopWeiFenbushi','Hadoop 伪分布模式',56,'hadoop 伪分布模式',0,0,2,2,0,0,0,1,0,0,5,0,0,0,1461482340,1461586855,1),(24,1,'javaIO','Java IO流',54,'Java IO流',0,0,2,2,0,0,0,1,0,0,2,0,0,0,1461468300,1461640100,1),(23,1,'vimAdvance','vim 进阶篇',51,'vim 高级用法',0,0,2,2,0,0,0,1,0,0,3,0,0,0,1461468107,1461468107,1),(22,1,'','Java 文件操作',54,'',0,0,2,2,0,0,0,1,0,0,0,0,0,0,1461425622,1461468359,-1),(21,1,'PythonML','Linux Python 机器学习环境',52,'linux python machine learning',0,0,2,2,0,0,0,1,0,0,2,0,0,0,1461141935,1461141935,1),(14,1,'firstDay','第一篇博客',2,'第一篇博客',0,0,2,2,0,0,0,1,0,0,3,0,0,0,1460878320,1460897749,1),(15,1,'yueye','月夜',45,'月夜 赏析 杜甫',0,0,2,2,0,0,0,1,0,0,5,0,0,0,1460881620,1461510658,1),(20,1,'sublime2License','sublime2 激活码',51,'sublime2激活码',0,0,2,2,0,0,0,1,0,0,1,0,0,0,1460961166,1460961166,1),(17,1,'mysqlBackup','Mysql 备份数据',49,'mysql简单备份',0,0,2,2,0,0,0,1,0,0,6,0,0,0,1460893534,1460893534,1),(19,1,'RLGlue','RL',50,'sad',0,0,2,2,0,0,0,1,0,0,12,0,0,0,1460903141,1460903141,1);
/*!40000 ALTER TABLE `ot_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_document_article`
--

DROP TABLE IF EXISTS `ot_document_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_document_article`
--

LOCK TABLES `ot_document_article` WRITE;
/*!40000 ALTER TABLE `ot_document_article` DISABLE KEYS */;
INSERT INTO `ot_document_article` VALUES (1,0,'<h1>\r\no<img src=\"/Uploads/Editor/2015-12-20/5676cc20bfa68.png\" alt=\"\" /><br />\r\n</h1>\r\n<h1>\r\no<br />\r\n</h1>\r\n<h1>\r\noOneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\no<br />\r\n</p>\r\n<p>\r\no<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\no主要特性：\r\n</h2>\r\n<p>\r\no1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\no2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\no3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\no4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\no5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\no6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\no7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\no8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\no9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\no<br />\r\n</p>\r\n<p>\r\no<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\no<br />\r\n</p>\r\n<h2>\r\no后台主要功能：\r\n</h2>\r\n<p>\r\no1. 用户Passport系统\r\n</p>\r\n<p>\r\no2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\no3. 权限控制系统\r\n</p>\r\n<p>\r\no4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\no5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\no6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\no7. 钩子和插件系统\r\n</p>\r\n<p>\r\no8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\no9. 数据备份和还原\r\n</p>\r\n<p>\r\no<br />\r\n</p>\r\n<p>\r\no&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\no<br />\r\n</p>\r\n<p>\r\no<strong>OneThink开发团队 2013</strong> \r\n</p>','',0),(21,0,'<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">一、概述</span><br />\r\n<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">Python 里 numpy，scipy,matplotlib,scikit-learn 是常用的三个库。</span><br />\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">numpy : &nbsp; &nbsp; &nbsp; &nbsp;运算矩阵。通过数组形式将Python循环放入C语言中，加快循环速度。</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">scipy： &nbsp; &nbsp; &nbsp; &nbsp; 信号处理及数值计算的一些工具。</span>\r\n</p>\r\n<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><span>scikit-learn：</span><span>机器学习相关的算法（如聚类算法，SVM等）。</span><br />\r\n<br />\r\n<span>matplotlib：一个画图工具。<br />\r\n<br />\r\n二、安装</span><br />\r\n<br />\r\n</span>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">Ubuntu 下的安装</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">\r\n	<ol class=\"dp-css none_number\">\r\n		<li>\r\n			sudo apt-get install python-numpy\r\n		</li>\r\n		<li>\r\n			sudo apt-get install python-scipy<br />\r\n		</li>\r\n		<li>\r\n			sudo apt-get install python-matplotlib\r\n		</li>\r\n		<li>\r\n			sudo apt-get install python-sklearn\r\n		</li>\r\n	</ol>\r\n<br />\r\n</span>\r\n</p>\r\n<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">使用pip</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;pip install sklearn<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#666666;font-family:宋体, Arial;font-size:16px;line-height:26px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>','',0),(22,0,'','',0),(23,0,'<p>\r\n	<span style=\"font-size:18px;\">一. 快速移动篇</span>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:18px;\">按行号移动</span><br />\r\n</strong><span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">nG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 移动到第n行，注意此处G是大写。即输入n，在小写模式下输入shift+g，大写模式下直接按下g键</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （如100G则能快速定位到源程序中第100行代码位置处，想必是很有用的。）</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">Ctrl + g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 显示当前行（并不是移动命令）</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 移动到文件的尾部，在小写模式下输入shift+g，大写模式下直接按下g键</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">按字符移动</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">fx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //往右移动到 x 字符上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">Fx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //往左移动到 x 字符上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">tx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //往右移动到 x 字符前&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">Tx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //往左移动到 x 字符后 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>\r\n</p>\r\n<p>\r\n	<p style=\"color:#333333;font-family:Arial;font-size:14px;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:18px;\">;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //分号，配合 f 和 t 使用，重复一次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //逗号，配合 f 和 t 使用，反方向重复一次&nbsp;&nbsp;</span>\r\n	</p>\r\n	<div>\r\n		<br />\r\n	</div>\r\n	<p style=\"color:#333333;font-family:Arial;font-size:14px;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:18px;\"></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">二.搜索</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 向前搜索模式，pattern代指要搜索的内容</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">?pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 向后搜索模式</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 重复上次搜索（向行号大的方向）</span><br />\r\n<span style=\"color:#333333;font-family:Arial;font-size:18px;line-height:26px;background-color:#FFFFFF;\">N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 反方向重复上次搜索</span>\r\n</p>','',0),(24,0,'<p><span style=\"font-size:16px;\">选自 《java 核心技术 》 高级 第九版</span> </p><p><span style=\"font-size:16px;\">第一章 流和文件</span> </p><p><span style=\"font-size:16px;\">输入流：读一串字节（a sequence of bytes） </span> </p><p><span style=\"font-size:16px;\">输出流：写一串字节</span> </p><p><span style=\"font-size:16px;\">这种字节串 一般是文件，但也可能是 网络链接甚至是一块内存。</span> </p><p><span style=\"font-size:16px;\">InputStream 和 OutputStream 类 继承于 input/output（I/O）类。</span> </p><p><span style=\"font-size:16px;\">这种流在处理Unicode编码时并不高效，因为Unicode 是一个字符有多个字节（multiple bytes&nbsp;per character），所以可以用Reader 和 Writer类来处理，这是基于两字节Unicode编码的。 &nbsp;</span> </p><p><span style=\"font-size:16px;\">什么是流？ </span> </p><p><span style=\"font-size:16px;\"><br/></span> </p><p><span style=\"font-size:16px;\"><br/></span> </p><p><span style=\"font-size:16px;\">ps: java io 体系所有子类的名称的后缀名一般都是父类的名称。<br/>&nbsp;<br/>InputStream 是所有字节输入流的超类，它是个抽象类。并且所有过滤流的构造函数接收的类型也是它。&nbsp;<br/>其中的方法也是所有输入流类都有的方法：<br/>available() 返回当前未读的字节数，<br/>close() 关闭流资源，<br/>mark(int readlimit) 标记当前输入流所在的位置，也就是当前输入流读取到的位置，readlimit 表示最大缓存多少个字节，也就是记忆多少个字节。当调用reset()方法的时候会重新定位到mark方法定位时的位置。InputStream 里没有实现这两个方法，只会抛出IOException。<br/>markSupported() 测试此输入流是否支持 mark 和 reset 方法。<br/>read()方法，读取单个字节，以int类型返回，是个抽象方法。<br/>read(byte[]) 从输入流中读取一定数量的字节，并将其存放到字符数组中。<br/>read(byte[] b,int startIndex,int len) 从输入流中的startIndex位置读取len个字节放到字符数组中,<br/>reset()方法，将此流重新定位到最后一次对此输入流调用 mark 方法时的位置。<br/>skip(long n)方法， 跳过和丢弃此输入流中数据的 n 个字节。<br/><br/></span> </p><p><span style=\"font-size:16px;\">OutputStream:</span> </p><p><span style=\"font-size:16px;\">java.io.OutputStream 1.0<br/>• abstract void write(int n)<br/>writes a byte of data.<br/>• void write(byte[] b)<br/>• void write(byte[] b, int off, int len)<br/>writes all bytes or a range of bytes in the array b.<br/>• void close()<br/>flushes and closes the output stream.<br/>• void flush()<br/>flushes the output stream—that is, sends any buffered data to its destination.</span> </p><p><span style=\"font-size:16px;\"><br/></span> </p><p><span style=\"font-size:16px;\">java IO 是个很大家族。可以根据自己不同的输入输出需要选择不同的流。</span> </p><p><span style=\"font-size:16px;\"><br/></span> </p><p><span style=\"font-size:16px;\">很多情况下，文件是以二进制存放的，因为效率更高。</span> </p><p><span style=\"font-size:16px;\">但我们打开二进制文件时，却常常显示16进制，因为如果以二进制表示篇幅太大，也不利于阅读，同时十六进制可以方便的转成二进制。</span> </p><p><span style=\"font-size:16px;\">不同的编码体系转成二进制文件也不同。例如string “1234”</span> </p><p><span style=\"font-size:16px;\">UTF-16 :&nbsp;00 31 00 32 00 33 00 34&nbsp;</span> </p><p><span style=\"font-size:16px;\">ISO 8859-1&nbsp;:&nbsp;31&nbsp;32 33 34 (没有0字节)</span> </p><p><span style=\"font-size:16px;\"><br/></span> </p><p><span style=\"font-size:16px;\">Java IO 是典型的装饰者模式，通过在原来的流上加装饰，功能不断增强。</span> </p><p><br/></p><p><span style=\"font-size:16px;\">• To write data in binary format, you use a DataOutputStream.</span><br/><span style=\"font-size:16px;\">• To write in text format, you use a PrintWriter.</span></p><p><span style=\"font-size:16px;line-height:24px;\">只介绍两个典型的用法</span> </p><p><span style=\"font-size:16px;line-height:24px;\">1.读取写入txt文件</span> </p><p><span style=\"font-size:16px;line-height:24px;\">读取：</span> </p><p><span style=\"font-size:16px;line-height:24px;\">Scanner&nbsp;</span></p><p><span style=\"font-size:16px;line-height:24px;\">写入：</span> </p><p><span style=\"font-size:16px;line-height:24px;\">这两句是等效的</span> </p><p><span style=\"font-size:16px;line-height:24px;\">PrintWriter out = new PrintWriter(&quot;employee.txt&quot;);<br/>PrintWriter out = new PrintWriter(new FileWriter(&quot;employee.txt&quot;));</span> </p><p><span style=\"font-size:16px;line-height:24px;\">当定义了out对象，就可一System.out里最常见的print, println, 和 printf 方法去写文件了！</span> </p><p><span style=\"font-size:16px;line-height:24px;\">void writeFile(){</span> </p><p><span style=\"font-size:16px;line-height:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;PrintWrite out = new&nbsp;<span style=\"font-size:16px;line-height:24px;\">PrintWriter(&quot;employee.txt&quot;);</span></span> </p><p><span style=\"font-size:16px;line-height:24px;\"><span style=\"font-size:16px;line-height:24px;\">&nbsp;&nbsp;&nbsp;&nbsp;String name = &quot;Harry Hacker&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;double salary = 75000;<br/>&nbsp;&nbsp;&nbsp;&nbsp;out.print(name);<br/>&nbsp;&nbsp;&nbsp;&nbsp;out.print(&#39; &#39;);<br/>&nbsp;&nbsp;&nbsp;&nbsp;out.println(salary);<br/></span></span> </p><p><span style=\"font-size:16px;line-height:24px;\">}</span> </p><p><span style=\"font-size:16px;line-height:24px;\"><br/></span> </p><p><span style=\"font-size:16px;line-height:24px;\">2.标准输入输出流</span> </p><p><span style=\"font-size:16px;line-height:24px;\"><br/></span> </p>','',0),(25,0,'<p>\r\n	<span style=\"font-size:14px;\"> </span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">环境 ：ubuntu 16.04 &nbsp; ，&nbsp;<span style=\"font-size:16px;\">Hadoop 2.4.0 java-8-openjdk-amd64</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\">一.hadoop三种安装模式</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#333333;font-family:Arial;line-height:26px;background-color:#FFFFFF;\">1，单机模式：Hadoop的默认模式。当首次解压Hadoop的源码包时，Hadoop无法了解硬件安装环境，便保守地选择了最小配置。在这种默认模式下所有3个XML文件均为空。当配置文件为空时，Hadoop会完全运行在本地。因为不需要与其他节点交互，单机模式就不使用HDFS，也不加载任何Hadoop的守护进程。该模式主要用于开发调试MapReduce程序的应用逻辑， 而不会与守护进程交互，避免引起额外的复杂性。（选自 hadoop in action）</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\">2.伪分布模式：</span><span style=\"font-size:14px;line-height:21px;\">在“单节点集群”上运行hadoop，</span><span style=\"font-size:14px;line-height:21px;color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">所有守护进程运行于同一台主机上，但此时Hadoop将使用分布式文件系统，而且各jobs也是由JobTracker服务管理的独立进程。同时，由于伪分布式的Hadoop集群只有一个节点，因此HDFS的块复制将限制为单个副本，其secondary-master和slave也都将运行于本地主机。此种模式除了并非真正意义的分布式之外，其程序执行逻辑完全类似于完全分布式，该模式在单机模式之上增加了代码调试功能，允许你检查内存使用情况，HDFS输入输出，以及其他的守护进程交互，因此，常用于开发人员测试程序执行。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">3.全分布模式：真正的分布式集群。</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">二.现采用伪分布模式：</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">1,下载hadoop 2.0.4</span> \r\n</p>\r\n<p>\r\n	2,配置环境变量：\r\n</p>\r\n<p>\r\n	vim ./.bashrc<span id=\"__kindeditor_bookmark_start_98__\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:1.5;background-color:#FFFFFF;\">export HADOOP_HOME=/home/wanye/softWare/hadoop-2.4.0</span> \r\n</p>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	export PATH=$PATH:$HADOOP_HOME/bin<br />\r\nexport JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64<br />\r\nexport CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH<br />\r\nexport PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH<br />\r\n</div>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n</div>\r\n<p>\r\n	source ./.bashrc\r\n</p>\r\n<p>\r\n	3.配置hadoop&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	进入hadoop2.4.0文件夹，配置etc/hadoop中的文件。\r\n</div>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	hadoop-env.sh\r\n</div>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64\r\n</div>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	另外可选的添加上：\r\n</div>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native\r\n</div>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	export HADOOP_OPTS=\"-Djava.library.path=$HADOOP_HOME/lib\"\r\n</p>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	core-site.xml，做如下配置：\r\n</div>\r\n<span></span><br />\r\n<br />\r\n<span>&nbsp;</span><br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;fs.default.name&nbsp;</span><br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;hdfs://127.0.0.1:9000&nbsp;</span><br />\r\n<span>&nbsp; &nbsp;&nbsp;</span><br />\r\n<br />\r\n<span>&nbsp; &nbsp;</span><br />\r\n<span>dfs.namenode.name.dir</span><br />\r\n<span>file:/homewanye/softWare/hadoop-2.4.0/dfs/name</span><br />\r\n<span></span><br />\r\n<br />\r\n<span></span><br />\r\n<span>dfs.datanode.data.dir</span><br />\r\n<span>&nbsp; &nbsp;file:/home/wanye/softWare/hadoop-2.4.0/dfs/data</span><br />\r\n<span>&nbsp; &nbsp;</span><br />\r\n<span></span><br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n</div>\r\n<br />\r\n<br />\r\n<br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	hdfs-site.xml，做如下配置（系统默认文件保存3份，因伪分布模式，故改为1份）：\r\n</div>\r\n<br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n&nbsp;<br />\r\ndfs.replication<br />\r\n1<br />\r\n<br />\r\n<br />\r\ndfs.namenode.name.dir<br />\r\n/home/wanye/softWare/hadoop-2.4.0/dfs/name<br />\r\n<br />\r\n<br />\r\ndfs.datanode.data.dir<br />\r\n/home/wanye/softWare/hadoop-2.4.0/dfs/data<br />\r\n<br />\r\n<br />\r\n</div>\r\n<br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	/*mapred-site.xml,做如下配置：\r\n</div>\r\n<br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;　　mapreduce.jobtracker.address&nbsp;<br />\r\n&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;　　 localhost:9001&nbsp;<br />\r\n&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 　　\r\n</div>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	这里2.4.0中没有这个文件，可以新建一个\r\n</p>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	*/\r\n</p>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n	或者直接修改mapred-site.xml.template\r\n</p>\r\n<span></span><br />\r\n<span></span><br />\r\n<span>mapreduce.framework.name</span><br />\r\n<span>&nbsp; &nbsp;yarn</span><br />\r\n<span></span><br />\r\n<span></span><br />\r\n<div align=\"left\" style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;background-color:#FFFFFF;\">\r\n</div>\r\n<br />\r\n<span style=\"background-color:#FFFFFF;\">yarn-site.xml</span><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:21px;background-color:#FFFFFF;\">，如下配置：</span><br />\r\n<span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:21px;background-color:#FFFFFF;\"><br />\r\nmapreduce.framework.name<br />\r\nyarn<br />\r\n<br />\r\n<br />\r\nyarn.nodemanager.aux-services<br />\r\nmapreduce_shuffle<br />\r\n<br />\r\n</span><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:21px;background-color:#FFFFFF;\"></span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">三.ssh免密码 登陆 ( 并没有设置)</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">四.</span></span><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:21px;background-color:#FFFFFF;\">开始测试</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">$HADOOP_HOME/bin/hadoop namenode –format格式化结点信息<br />\r\n最后一句出现shutting down什么玩意，中间没有warn或者fatal error应该就对了。<br />\r\n第二步：然后，开始$HADOOP_HOME/sbin/start-all.sh.</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\"><br />\r\nhttp://localhost:50070/<br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;background-color:#FFFFFF;\">出现页面即为成功。</span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#2B2B2B;font-family:Lato, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	(1)执行命令jps会有5个进程，分别是NameNode、\r\n</p>\r\n<p style=\"color:#2B2B2B;font-family:Lato, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	DataNode、SecondaryNameNode、JobTracker,\r\n</p>\r\n<p style=\"color:#2B2B2B;font-family:Lato, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	TaskTracker\r\n</p>\r\n但我只看到两个进程，查看log文件\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	报错和解决方案\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2016-04-24 19:02:33,942 WARN org.apache.hadoop.util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable\r\n</p>\r\n<p>\r\n	datanode.log:\r\n</p>\r\n<p>\r\n	java.lang.VerifyError: class org.apache.hadoop.hdfs.protocol.proto.ClientDatanodeProtocolProtos$RefreshNamenodesResponseProto overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;<br />\r\nat java.lang.ClassLoader.defineClass1(Native Method)<br />\r\nat java.lang.ClassLoader.defineClass(ClassLoader.java:763)<br />\r\nat java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)<br />\r\nat java.net.URLClassLoader.defineClass(URLClassLoader.java:467)<br />\r\nat java.net.URLClassLoader.access$100(URLClassLoader.java:73)<br />\r\nat java.net.URLClassLoader$1.run(URLClassLoader.java:368)<br />\r\nat java.net.URLClassLoader$1.run(URLClassLoader.java:362)<br />\r\nat java.security.AccessController.doPrivileged(Native Method)<br />\r\nat java.net.URLClassLoader.findClass(URLClassLoader.java:361)<br />\r\nat java.lang.ClassLoader.loadClass(ClassLoader.java:424)<br />\r\nat sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:331)<br />\r\nat java.lang.ClassLoader.loadClass(ClassLoader.java:357)<br />\r\nat org.apache.hadoop.hdfs.protocolPB.ClientDatanodeProtocolServerSideTranslatorPB.(ClientDatanodeProtocolServerSideTranslatorPB.java:63)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.initIpcServer(DataNode.java:411)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.startDataNode(DataNode.java:743)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.(DataNode.java:281)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.makeInstance(DataNode.java:1878)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.instantiateDataNode(DataNode.java:1772)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.createDataNode(DataNode.java:1812)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.secureMain(DataNode.java:1988)<br />\r\nat org.apache.hadoop.hdfs.server.datanode.DataNode.main(DataNode.java:2012)\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><span style=\"color:#444444;font-family:Tahoma, \'Microsoft Yahei\', Simsun;font-size:14px;line-height:21px;background-color:#FFFFFF;\">然而并没解决！</span></span> \r\n</p>','',0),(26,0,'<p>\r\n	<span style=\"font-size:14px;\">今天一时手贱 运行了 apt-get autoremove.</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\">然后系统把能删的安装包全删了。。欲哭无泪啊。</span>\r\n</p>','',0),(29,0,'<p>\r\n	<span style=\"font-size:16px;\">step 1&nbsp;</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">在github 上创建一个空的仓库 点击 new repository。起名 Test（随便起个就好），选public。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">复制仓库链接&nbsp;例如：<a href=\"https://github.com/Beyond1993/AWSweb.git\" target=\"_blank\">https://github.com/Beyond1993/AWSweb.git</a></span><img src=\"/Uploads/Editor/2016-04-25/571e047171678.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">step2&nbsp;</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">进入 要上传文件的目录</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">git init</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">git remote add origin&nbsp;<a href=\"https://github.com/Beyond1993/AWSweb.git\" target=\"_blank\">https://github.com/Beyond1993/AWSweb.git</a></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">git push origin master.</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\"><br />\r\n</span> \r\n</p>','',0),(30,0,'<p><span style=\"color:#323232;font-family:&#39;Century Gothic&#39;, &#39;Microsoft yahei&#39;;font-size:16px;line-height:25.6px;background-color:#FFFFFF;\"><span style=\"color:#323232;font-family:&#39;Century Gothic&#39;, &#39;Microsoft yahei&#39;;font-size:16px;line-height:28.8px;background-color:#FFFFFF;\">提示 “上传根目录不存在！请尝试手动创建:./Uploads/Editor</span></span> </p><p><span style=\"color:#323232;font-family:&#39;Century Gothic&#39;, &#39;Microsoft yahei&#39;;font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">确实是文件夹权限的问题，给他一个EveryOne权限获取其他的操作权限，</span></p><p><span style=\"color:#323232;font-family:&#39;Century Gothic&#39;, &#39;Microsoft yahei&#39;;font-size:16px;line-height:25.6px;background-color:#FFFFFF;\"><br/></span></p><p><span style=\"font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">不能插入代码：使用Ueditor（百度编辑器)&nbsp;</span></p>','',0),(31,0,'<p>\r\n	<span style=\"font-size:16px;\">之前用hadoop 搭建伪分布模式，一直起不来5个进程，报错。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">今天用hadoop 跑 涛哥的PCA，又报错！相同的错，怒了，没办法，只有少侠重新来过了。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">下载，解压：</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">$ cd ~/softWare/<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">$ wget https://archive.apache.org/dist/hadoop/core/hadoop-2.4.0/hadoop-2.4.0.tar.gz</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">$ tar xzvf hadoop­2.4.0.tar.gz<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">直接下载特别慢，但是可以用aws作为文件中转 共133M</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\">导入环境变量（要设好jdk)：</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;line-height:24px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">export HADOOP_HOME=/home/wanye/softWare/hadoop-2.4.0</span><br />\r\n<span style=\"font-size:16px;\">export PATH=$PATH:$HADOOP_HOME/bin</span><br />\r\n<span style=\"font-size:16px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">最后别忘了 source ~/.bashrc 使配置生效<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">\r\n<pre class=\"prettyprint lang-cpp\">\r\n</pre>\r\n最后我把/jre/lib/ext 里关于 mahout 的包全部拿出来了，就好了！ 所以在配置java 项目时，不要图方便把需要的包放入系统里，可能会有冲突。要单独配置，加环境变量</span>\r\n</p>','',0),(14,0,'自己用onethink 框架搭建了一个博客，自己的网站，自己掌握着代码。希望可以坚持下去吧！','',0),(15,0,'<p>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"font-size:16px;\">&nbsp;</span><span style=\"font-size:16px;\">月夜</span><br class=\"Apple-interchange-newline\" />\r\n<span style=\"font-size:16px;\">今夜鄜州月⑴，闺中只独看⑵。</span>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:16px;\">遥怜小儿女⑶，未解忆长安⑷。</span>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:16px;\">香雾云鬟湿⑸，清辉玉臂寒⑹。</span>\r\n	</div>\r\n	<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:16px;\">何时倚虚幌⑺，双照泪痕干⑻。</span>\r\n	</div>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;\">每次提到杜子美，杜工部，要么就是一副很忙的样子，要么就是忧国忧民的老头。可是这首《月夜》 让我们又认识到了，杜甫的另一面。</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;\"><br />\r\n</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;\">写诗，写情诗，从诗经，到徐志摩，爱情，永远是诗歌的主题。见过那么多情诗，但这首诗，是那么的质朴，那么的纯真又令人感动，一语天然万古新，豪华落尽见真淳。</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;line-height:1.5;\">王步高先生曾说，这是天下第一等情诗。</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;line-height:24px;\">难得之处在于写的 既忧思难忘，又心怀感动，幸福甜蜜。</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;\"><br />\r\n</span>\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:16px;\">第一句：<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">今夜鄜(<span style=\"font-size:14px;\">fū</span>)州月，闺中只独看。</span> 明明我思恋着我的妻子，确写成了妻子在思恋着我。</span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','',0),(17,0,'<p>\r\n	我想把aws上的数据 备份，以便之后快速恢复网站，用最简单的方法备份mysql数据：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		<strong>使用mysqldump备份一个数据库</strong>\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		　　mysqldump 语法\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		　　mysqldump -u username -p dbname table1 table2 ...-&gt; BackupName.sql\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		<span style=\"line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		<span style=\"line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbname参数表示数据库的名称；</span>\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		<span style=\"line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;table1和table2参数表示需要备份的表的名称，为空则整个数据库备份；</span>\r\n	</p>\r\n	<p style=\"font-family:verdana, sans-serif;font-size:13px;background-color:#FFFFFF;\">\r\n		<span style=\"line-height:1.5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BackupName.sql参数表设计备份文件的名称，文件名前面可以加上一个绝对路径。通常将数据库被分成一个后缀名为sql的文件；</span>\r\n	</p>\r\n<pre>mysqldump -u root -p blog &gt; ./blogbackup.sql</pre>\r\n</p>','',0),(19,0,'sdfas','',0),(20,0,'<span style=\"color:#333333;font-family:arial;font-size:13px;line-height:20.02px;background-color:#FFFFFF;\">01<br />\r\n—– BEGIN LICENSE —–<br />\r\nAndrew Weber<br />\r\nSingle User License<br />\r\nEA7E-855605<br />\r\n813A03DD 5E4AD9E6 6C0EEB94 BC99798F<br />\r\n942194A6 02396E98 E62C9979 4BB979FE<br />\r\n91424C9D A45400BF F6747D88 2FB88078<br />\r\n90F5CC94 1CDC92DC 8457107A F151657B<br />\r\n1D22E383 A997F016 42397640 33F41CFC<br />\r\nE1D0AE85 A0BBD039 0E9C8D55 E1B89D5D<br />\r\n5CDB7036 E56DE1C0 EFCC0840 650CD3A6<br />\r\nB98FC99C 8FAC73EE D2B95564 DF450523<br />\r\n—— END LICENSE ——<br />\r\n<br />\r\n02<br />\r\n—– BEGIN LICENSE —–<br />\r\nK-20<br />\r\nSingle User License<br />\r\nEA7E-940129<br />\r\n3A099EC1 C0B5C7C5 33EBF0CF BE82FE3B<br />\r\nEAC2164A 4F8EC954 4E87F1E5 7E4E85D6<br />\r\nC5605DE6 DAB003B4 D60CA4D0 77CB1533<br />\r\n3C47F579 FB3E8476 EB3AA9A7 68C43CD9<br />\r\n8C60B563 80FE367D 8CAD14B3 54FB7A9F<br />\r\n4123FFC4 D63312BA 141AF702 F6BBA254<br />\r\nB094B9C0 FAA4B04C 06CC9AFC FD412671<br />\r\n82E3AEE0 0F0FAAA7 8FA773C9 383A9E18<br />\r\n—— END LICENSE ——<br />\r\n<br />\r\n03<br />\r\n—– BEGIN LICENSE —–<br />\r\nJ2TeaM<br />\r\n2 User License<br />\r\nEA7E-940282<br />\r\n45CB0D8F 09100037 7D1056EB A1DDC1A2<br />\r\n39C102C5 DF8D0BF0 FC3B1A94 4F2892B4<br />\r\n0AEE61BA 65758D3B 2EED551F A3E3478C<br />\r\nC1C0E04E CA4E4541 1FC1A2C1 3F5FB6DB<br />\r\nCFDA1551 51B05B5D 2D3C8CFE FA8B4285<br />\r\n051750E3 22D1422A 7AE3A8A1 3B4188AC<br />\r\n346372DA 37AA8ABA 6EB30E41 781BC81F<br />\r\nB5CA66E3 A09DBD3A 3FE85BBD 69893DBD<br />\r\n—— END LICENSE ——<br />\r\n</span>','',0);
/*!40000 ALTER TABLE `ot_document_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_document_download`
--

DROP TABLE IF EXISTS `ot_document_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_document_download`
--

LOCK TABLES `ot_document_download` WRITE;
/*!40000 ALTER TABLE `ot_document_download` DISABLE KEYS */;
INSERT INTO `ot_document_download` VALUES (27,0,'','',0,0,0),(28,0,'','',0,0,0);
/*!40000 ALTER TABLE `ot_document_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_file`
--

DROP TABLE IF EXISTS `ot_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_file`
--

LOCK TABLES `ot_file` WRITE;
/*!40000 ALTER TABLE `ot_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_hooks`
--

DROP TABLE IF EXISTS `ot_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_hooks`
--

LOCK TABLES `ot_hooks` WRITE;
/*!40000 ALTER TABLE `ot_hooks` DISABLE KEYS */;
INSERT INTO `ot_hooks` VALUES (1,'pageHeader','页面header钩子，一般用于加载插件CSS文件和代码',1,0,''),(2,'pageFooter','页面footer钩子，一般用于加载插件JS文件和JS代码',1,0,'ReturnTop'),(3,'documentEditForm','添加编辑表单的 扩展内容钩子',1,0,'Attachment'),(4,'documentDetailAfter','文档末尾显示',1,0,'Attachment,SocialComment'),(5,'documentDetailBefore','页面内容前显示用钩子',1,0,''),(6,'documentSaveComplete','保存文档数据后的扩展钩子',2,0,'Attachment'),(7,'documentEditFormContent','添加编辑表单的内容显示钩子',1,0,'Editor'),(8,'adminArticleEdit','后台内容编辑页编辑器',1,1378982734,'EditorForAdmin'),(13,'AdminIndex','首页小格子个性化显示',1,1382596073,'SiteStat,SystemInfo,DevTeam'),(14,'topicComment','评论提交方式扩展钩子。',1,1380163518,'Editor'),(16,'app_begin','应用开始',2,1384481614,'');
/*!40000 ALTER TABLE `ot_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_member`
--

DROP TABLE IF EXISTS `ot_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_member`
--

LOCK TABLES `ot_member` WRITE;
/*!40000 ALTER TABLE `ot_member` DISABLE KEYS */;
INSERT INTO `ot_member` VALUES (1,'Wayne',0,'0000-00-00','',80,34,0,1450608302,3395820372,1461635338,1);
/*!40000 ALTER TABLE `ot_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_menu`
--

DROP TABLE IF EXISTS `ot_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_menu`
--

LOCK TABLES `ot_menu` WRITE;
/*!40000 ALTER TABLE `ot_menu` DISABLE KEYS */;
INSERT INTO `ot_menu` VALUES (1,'首页',0,1,'Index/index',0,'','',0),(2,'内容',0,2,'Article/mydocument',0,'','',0),(3,'文档列表',2,0,'article/index',1,'','内容',0),(4,'新增',3,0,'article/add',0,'','',0),(5,'编辑',3,0,'article/edit',0,'','',0),(6,'改变状态',3,0,'article/setStatus',0,'','',0),(7,'保存',3,0,'article/update',0,'','',0),(8,'保存草稿',3,0,'article/autoSave',0,'','',0),(9,'移动',3,0,'article/move',0,'','',0),(10,'复制',3,0,'article/copy',0,'','',0),(11,'粘贴',3,0,'article/paste',0,'','',0),(12,'导入',3,0,'article/batchOperate',0,'','',0),(13,'回收站',2,0,'article/recycle',1,'','内容',0),(14,'还原',13,0,'article/permit',0,'','',0),(15,'清空',13,0,'article/clear',0,'','',0),(16,'用户',0,3,'User/index',0,'','',0),(17,'用户信息',16,0,'User/index',0,'','用户管理',0),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0),(19,'用户行为',16,0,'User/action',0,'','行为管理',0),(20,'新增用户行为',19,0,'User/addaction',0,'','',0),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0),(43,'扩展',0,7,'Addons/index',0,'','',0),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0),(52,'安装',44,0,'Addons/install',0,'安装插件','',0),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0),(59,'新增',58,0,'model/add',0,'','',0),(60,'编辑',58,0,'model/edit',0,'','',0),(61,'改变状态',58,0,'model/setStatus',0,'','',0),(62,'保存数据',58,0,'model/update',0,'','',0),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0),(64,'新增',63,0,'Attribute/add',0,'','',0),(65,'编辑',63,0,'Attribute/edit',0,'','',0),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0),(67,'保存数据',63,0,'Attribute/update',0,'','',0),(68,'系统',0,4,'Config/group',0,'','',0),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0),(72,'删除',70,0,'Config/del',0,'删除配置','',0),(73,'新增',70,0,'Config/add',0,'新增配置','',0),(74,'保存',70,0,'Config/save',0,'保存配置','',0),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0),(77,'新增',76,0,'Channel/add',0,'','',0),(78,'编辑',76,0,'Channel/edit',0,'','',0),(79,'删除',76,0,'Channel/del',0,'','',0),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0),(87,'备份',86,0,'Database/export',0,'备份数据库','',0),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0),(93,'其他',0,5,'other',1,'','',0),(96,'新增',75,0,'Menu/add',0,'','系统设置',0),(98,'编辑',75,0,'Menu/edit',0,'','',0),(104,'下载管理',102,0,'Think/lists?model=download',0,'','',0),(105,'配置管理',102,0,'Think/lists?model=config',0,'','',0),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0),(108,'修改密码',16,0,'User/updatePassword',1,'','',0),(109,'修改昵称',16,0,'User/updateNickname',1,'','',0),(110,'查看行为日志',106,0,'action/edit',1,'','',0),(112,'新增数据',58,0,'think/add',1,'','',0),(113,'编辑数据',58,0,'think/edit',1,'','',0),(114,'导入',75,0,'Menu/import',0,'','',0),(115,'生成',58,0,'Model/generate',0,'','',0),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0),(118,'文档排序',3,0,'Article/sort',1,'','',0),(119,'排序',70,0,'Config/sort',1,'','',0),(120,'排序',75,0,'Menu/sort',1,'','',0),(121,'排序',76,0,'Channel/sort',1,'','',0);
/*!40000 ALTER TABLE `ot_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_model`
--

DROP TABLE IF EXISTS `ot_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_model`
--

LOCK TABLES `ot_model` WRITE;
/*!40000 ALTER TABLE `ot_model` DISABLE KEYS */;
INSERT INTO `ot_model` VALUES (1,'document','基础文档',0,'',1,'{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}','1:基础','','','','','id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除',0,'','',1383891233,1384507827,1,'MyISAM'),(2,'article','文章',1,'',1,'{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}','1:基础,2:扩展','','','','','id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容',0,'','',1383891243,1387260622,1,'MyISAM'),(3,'download','下载',1,'',1,'{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}','1:基础,2:扩展','','','','','id:编号\r\ntitle:标题',0,'','',1383891252,1387260449,1,'MyISAM');
/*!40000 ALTER TABLE `ot_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_picture`
--

DROP TABLE IF EXISTS `ot_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_picture`
--

LOCK TABLES `ot_picture` WRITE;
/*!40000 ALTER TABLE `ot_picture` DISABLE KEYS */;
INSERT INTO `ot_picture` VALUES (1,'/Uploads/Picture/2016-01-10/56920cddefccf.jpg','','59d62ce72cd2dc7f71c75360a601aa2c','43cd438170b13f8a0f573bd471ecf81254e7a5ab',1,1452412125);
/*!40000 ALTER TABLE `ot_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_ucenter_admin`
--

DROP TABLE IF EXISTS `ot_ucenter_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_ucenter_admin`
--

LOCK TABLES `ot_ucenter_admin` WRITE;
/*!40000 ALTER TABLE `ot_ucenter_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_ucenter_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_ucenter_app`
--

DROP TABLE IF EXISTS `ot_ucenter_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_ucenter_app`
--

LOCK TABLES `ot_ucenter_app` WRITE;
/*!40000 ALTER TABLE `ot_ucenter_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_ucenter_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_ucenter_member`
--

DROP TABLE IF EXISTS `ot_ucenter_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_ucenter_member`
--

LOCK TABLES `ot_ucenter_member` WRITE;
/*!40000 ALTER TABLE `ot_ucenter_member` DISABLE KEYS */;
INSERT INTO `ot_ucenter_member` VALUES (1,'Wayne','7de47d5222f09768a9ae7036bdf9226c','xiaowenzinihaoya@163.com','',1460898659,3395820372,1461635338,3395820372,1460898659,1);
/*!40000 ALTER TABLE `ot_ucenter_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_ucenter_setting`
--

DROP TABLE IF EXISTS `ot_ucenter_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_ucenter_setting`
--

LOCK TABLES `ot_ucenter_setting` WRITE;
/*!40000 ALTER TABLE `ot_ucenter_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_ucenter_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_url`
--

DROP TABLE IF EXISTS `ot_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_url`
--

LOCK TABLES `ot_url` WRITE;
/*!40000 ALTER TABLE `ot_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot_userdata`
--

DROP TABLE IF EXISTS `ot_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot_userdata`
--

LOCK TABLES `ot_userdata` WRITE;
/*!40000 ALTER TABLE `ot_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot_userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-26  3:21:14
