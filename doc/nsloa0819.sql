/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.20-log : Database - nsloa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nsloa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nsloa`;

/*Table structure for table `nsl_cars` */

DROP TABLE IF EXISTS `nsl_cars`;

CREATE TABLE `nsl_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(11) DEFAULT NULL COMMENT '车牌号',
  `name` varchar(11) DEFAULT NULL COMMENT '驾驶员',
  `pic` varchar(255) DEFAULT NULL COMMENT '照片',
  `version` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_cars` */

insert  into `nsl_cars`(`id`,`num`,`name`,`pic`,`version`,`remarks`,`status`) values 
(1,'川W 56288','李守刚','309',0,'无',3),
(3,'川W 78033','李强','310',0,NULL,2);

/*Table structure for table `nsl_carslog` */

DROP TABLE IF EXISTS `nsl_carslog`;

CREATE TABLE `nsl_carslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '派车',
  `start` datetime DEFAULT NULL COMMENT '起始时间',
  `over` datetime DEFAULT NULL COMMENT '结束时间',
  `p_id` int(11) DEFAULT NULL COMMENT '派车人',
  `uname` varchar(511) DEFAULT NULL COMMENT '乘客名字',
  `cause` varchar(511) DEFAULT NULL COMMENT '派车原因',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_carslog` */

insert  into `nsl_carslog`(`id`,`c_id`,`start`,`over`,`p_id`,`uname`,`cause`,`version`) values 
(1,3,'2018-08-06 00:00:00','2018-08-16 09:00:00',10001,'李兴盛','松林脱贫事宜',NULL),
(2,3,'2018-08-17 00:00:00','2018-08-17 20:00:00',10001,'林平','查看收烘情况',NULL),
(3,1,'2018-08-17 00:00:00','2018-08-17 00:00:00',10001,'张传卫','金阳收茧',NULL),
(4,1,'2018-08-17 00:00:00','2018-08-18 00:00:00',10001,'张传卫','金阳回公司',NULL),
(14,3,'2018-08-19 12:11:22','2018-08-19 12:11:22',10001,NULL,'哈哈哈',NULL),
(15,3,'2018-08-19 12:12:00','2018-08-19 12:12:00',10001,NULL,'呵呵呵',NULL),
(16,3,'2018-08-19 12:12:55','2018-08-19 12:12:55',10001,NULL,'哈哈哈',NULL),
(17,3,'2018-08-19 12:13:48','2018-08-19 12:13:48',10001,NULL,'哈哈哈',NULL);

/*Table structure for table `nsl_casher` */

DROP TABLE IF EXISTS `nsl_casher`;

CREATE TABLE `nsl_casher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '经办人',
  `d_id` int(11) DEFAULT NULL COMMENT '部门',
  `type` varchar(31) DEFAULT NULL COMMENT '报销类别',
  `title` varchar(63) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `cause` varchar(255) DEFAULT NULL COMMENT '事由',
  `num` int(11) DEFAULT NULL COMMENT '票据张数',
  `opinion` varchar(1023) DEFAULT NULL COMMENT '审批意见',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `start` datetime DEFAULT NULL COMMENT '开始时间',
  `over` datetime DEFAULT NULL COMMENT '结束时间',
  `version` int(11) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL COMMENT '可见人',
  `imgs` varchar(1023) DEFAULT NULL COMMENT '票据图片',
  `selectname` varchar(511) DEFAULT NULL COMMENT '可见名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_casher` */

insert  into `nsl_casher`(`id`,`u_id`,`d_id`,`type`,`title`,`date`,`cause`,`num`,`opinion`,`status`,`start`,`over`,`version`,`visible`,`imgs`,`selectname`) values 
(1,10026,15,'1','差旅','2018-07-23 16:07:43','西昌开经信委的会',5,'无',1,'2018-07-23 15:16:20','2018-07-28 00:00:00',NULL,'10025',NULL,NULL),
(2,10026,1,'1','西昌出差','2018-07-23 15:24:16','西昌开经信委的会',3,NULL,1,'2018-07-09 00:00:00','2018-07-19 00:00:00',NULL,'10025,10036','534617659926325831.jpg,5346176599263258311.jpg,12.png','  戚华'),
(3,10028,15,'2','三差共育室管理费用报销','2018-07-24 09:45:36','买器材',1,NULL,1,'2018-07-24 09:45:33','2018-07-24 09:45:34',NULL,'10001 10024 10025,10029','三差共育室管理1.xls','系统管理员 林总(测试)  吴灼阳'),
(4,10026,15,'2','费用报销','2018-07-24 11:29:47','参加比赛',3,NULL,4,'2018-07-24 00:00:00','2018-07-24 00:00:00',NULL,'10001 10024 10025 10027,10037,10036','lct1.png','系统管理员 林总(测试), 李兴盛 戚华  系统管理员'),
(5,10027,7,'1','111','2018-07-25 11:49:54','11',1,NULL,1,'2018-07-17 00:00:00','2018-07-27 00:00:00',NULL,'','p1.png',NULL),
(6,10001,1,'2','佘龙宇的接待浙江客户费用','2018-07-25 14:39:41','详细说明',3,NULL,1,'2018-07-25 00:00:00','2018-07-25 00:00:00',NULL,'','浙江省凯喜雅国际股份有限公司考察宁南县蚕桑产业3.doc',NULL),
(7,10027,7,'1','杨碧德的报销','2018-07-25 14:40:52','差旅',2,NULL,1,'2018-07-25 00:00:00','2018-07-25 00:00:00',NULL,'','p2.png',NULL),
(8,10026,15,'1','test0725','2018-07-25 15:45:26','test',1,NULL,1,'2018-07-25 00:00:00','2018-07-25 00:00:00',NULL,',10025','查看大蚕饲养情况.jpg',NULL),
(9,10025,15,'2','部门领导报销测试','2018-07-25 15:48:09','下乡',1,NULL,8,'2018-07-25 00:00:00','2018-07-25 00:00:00',NULL,',10025 10024','1.jpg','邓远会 林总(测试)'),
(10,10026,15,'1','松新茧站运煤费用','2018-07-29 21:30:39','运煤开支',1,NULL,1,'2018-07-29 00:00:00','2018-07-29 00:00:00',NULL,',10025,10036','14.jpg','  戚华');

/*Table structure for table `nsl_casher_detail` */

DROP TABLE IF EXISTS `nsl_casher_detail`;

CREATE TABLE `nsl_casher_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '报销单号',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `detail` varchar(511) DEFAULT NULL COMMENT '说明',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nsl_casher_detail` */

/*Table structure for table `nsl_casher_log` */

DROP TABLE IF EXISTS `nsl_casher_log`;

CREATE TABLE `nsl_casher_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '报销单',
  `u_id` int(11) DEFAULT NULL COMMENT '审批人',
  `date` datetime DEFAULT NULL COMMENT '审批时间',
  `ispass` int(11) DEFAULT NULL COMMENT '是否通过',
  `opinion` varchar(511) DEFAULT NULL COMMENT '审批意见',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_casher_log` */

insert  into `nsl_casher_log`(`id`,`c_id`,`u_id`,`date`,`ispass`,`opinion`,`version`) values 
(1,3,NULL,'2018-07-24 11:05:18',NULL,'同意报销1',NULL),
(2,4,NULL,'2018-07-25 10:56:12',3,'凭证真实有效,请上级复审',NULL),
(3,4,10025,'2018-07-25 11:06:47',3,'部门已审核',NULL),
(4,4,10025,'2018-07-25 11:09:31',3,'审核通过',NULL),
(5,4,10027,'2018-07-25 14:42:05',3,'审核通过,请财务部给予报销',NULL),
(6,4,10027,'2018-07-25 14:50:07',3,'杨总审核通过',NULL),
(7,4,10027,'2018-07-25 14:52:43',3,'杨',NULL),
(8,4,10027,'2018-07-25 14:56:17',3,'11',NULL),
(9,4,10027,'2018-07-25 15:11:35',3,'通过通过',NULL),
(10,4,10027,'2018-07-25 15:12:51',3,'审批意见',NULL),
(11,9,10027,'2018-07-25 16:54:24',3,'123121',NULL),
(12,9,10027,'2018-07-25 16:57:34',3,'123123123',NULL),
(13,4,NULL,'2018-07-30 00:02:11',3,'123',NULL),
(14,4,10001,'2018-07-30 00:03:26',3,'同意',NULL),
(15,4,10001,'2018-07-30 00:04:03',2,'123',NULL),
(16,4,10001,'2018-07-30 00:45:54',3,NULL,NULL),
(17,4,10001,'2018-07-30 00:48:42',3,'同意',NULL),
(18,4,10001,'2018-07-30 00:48:46',3,NULL,NULL),
(19,4,10001,'2018-07-30 00:49:13',3,'测试测试测试',NULL),
(20,4,10001,'2018-07-30 00:49:16',3,NULL,NULL),
(21,4,10001,'2018-07-30 00:53:57',3,NULL,NULL),
(22,4,10001,'2018-07-30 00:54:22',3,NULL,NULL),
(23,4,10001,'2018-07-30 00:55:32',3,NULL,NULL),
(24,4,10001,'2018-07-30 00:56:22',3,'opinion',NULL),
(25,4,10001,'2018-07-30 00:56:30',2,'fsdfafda',NULL),
(26,10,10025,'2018-07-30 00:59:54',3,'情况 属实',NULL),
(27,9,10025,'2018-07-30 01:01:12',2,'不通过',NULL),
(28,2,10025,'2018-07-30 01:14:16',3,'20104002',NULL),
(29,3,10001,'2018-08-17 16:46:07',3,'',NULL),
(30,3,10001,'2018-08-17 16:46:28',2,'请上传图片',NULL);

/*Table structure for table `nsl_files` */

DROP TABLE IF EXISTS `nsl_files`;

CREATE TABLE `nsl_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '公文类型',
  `num` varchar(63) DEFAULT NULL COMMENT '公文文号',
  `d_id` int(11) DEFAULT NULL COMMENT '起草部门',
  `u_id` int(11) DEFAULT NULL COMMENT '经办人',
  `title_o` varchar(63) DEFAULT NULL COMMENT '文件名',
  `title_new` varchar(63) DEFAULT NULL COMMENT '文件名_系统',
  `visiable` varchar(255) DEFAULT NULL COMMENT '主送',
  `copy` varchar(255) DEFAULT NULL COMMENT '抄送',
  `discript` varchar(1023) DEFAULT NULL COMMENT '公文描述',
  `d_opinion` varchar(2047) DEFAULT NULL COMMENT '部门领导批示',
  `l_opinion` varchar(2047) DEFAULT NULL COMMENT '领导班子批示',
  `h_opinion` varchar(2047) DEFAULT NULL COMMENT '总经理批示',
  `version` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '进度',
  `issubmit` int(11) DEFAULT NULL COMMENT '是否提交',
  `selectname` varchar(511) DEFAULT NULL COMMENT '主送姓名',
  `copyman` varchar(511) DEFAULT NULL COMMENT '抄送姓名',
  `round` int(11) DEFAULT NULL COMMENT '是否传阅',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_files` */

insert  into `nsl_files`(`id`,`type`,`num`,`d_id`,`u_id`,`title_o`,`title_new`,`visiable`,`copy`,`discript`,`d_opinion`,`l_opinion`,`h_opinion`,`version`,`date`,`status`,`issubmit`,`selectname`,`copyman`,`round`) values 
(27,1,'12',15,10026,'智慧后勤.doc',NULL,'10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032,10031,10035,10027,10029,10033',NULL,NULL,NULL,NULL,NULL,NULL,'2018-07-29 16:17:30',99,0,'系统管理员          ',NULL,0),
(28,NULL,NULL,1,10001,'moban (2)1.docx',NULL,'10026,10034,10029',NULL,'请落实执行',NULL,NULL,NULL,NULL,'2018-07-29 16:31:23',99,0,'佘龙宇 ',NULL,0),
(29,NULL,NULL,15,10026,'12.jpg',NULL,'10001,10024,10037,10030,10036,10030,10035,10026,10028,10024,10030,10026',NULL,NULL,NULL,NULL,NULL,NULL,'2018-07-29 16:42:01',99,0,'系统管理员   林平  李兴盛  李轩  戚华   李轩  龙宗筱   佘龙宇  沈志明   林平  李轩  佘龙宇',NULL,0),
(30,1,'text',15,10025,'小程序.txt',NULL,'10001',NULL,'test',NULL,NULL,NULL,NULL,'2018-08-19 18:19:13',99,0,'系统管理员',NULL,0);

/*Table structure for table `nsl_files_log` */

DROP TABLE IF EXISTS `nsl_files_log`;

CREATE TABLE `nsl_files_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) DEFAULT NULL COMMENT '文件名',
  `u_id` int(11) DEFAULT NULL COMMENT '审批人',
  `date` datetime DEFAULT NULL COMMENT '审批时间',
  `ispass` int(11) DEFAULT NULL COMMENT '状态/1:查看 2:提交意见',
  `opinion` varchar(2047) DEFAULT NULL COMMENT '审核意见',
  `version` int(11) DEFAULT NULL,
  `review` varchar(2047) DEFAULT NULL COMMENT '回复',
  `fudate` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_files_log` */

insert  into `nsl_files_log`(`id`,`f_id`,`u_id`,`date`,`ispass`,`opinion`,`version`,`review`,`fudate`) values 
(65,27,10001,NULL,1,NULL,2,NULL,NULL),
(66,27,10001,'2018-07-29 16:21:10',2,'同意',2,'daKL','2018-07-29 21:27:37'),
(67,27,10001,NULL,1,NULL,2,NULL,NULL),
(68,27,10026,NULL,1,NULL,2,NULL,NULL),
(69,27,10026,NULL,1,NULL,2,NULL,NULL),
(70,27,10026,NULL,1,NULL,2,NULL,NULL),
(71,27,10026,NULL,1,NULL,2,NULL,NULL),
(72,27,10026,NULL,1,NULL,2,NULL,NULL),
(73,29,10001,NULL,1,NULL,2,NULL,NULL),
(74,29,10001,NULL,1,NULL,2,NULL,NULL),
(75,29,10001,NULL,1,NULL,2,NULL,NULL),
(76,29,10001,NULL,1,NULL,2,NULL,NULL),
(77,27,10026,NULL,1,NULL,2,NULL,NULL),
(78,27,10026,NULL,1,NULL,2,NULL,NULL),
(79,27,10026,NULL,1,NULL,2,NULL,NULL),
(80,27,10026,NULL,1,NULL,2,NULL,NULL),
(81,27,10001,NULL,1,NULL,2,NULL,NULL),
(82,29,10001,NULL,1,NULL,2,NULL,NULL),
(83,27,10026,NULL,1,NULL,NULL,NULL,NULL),
(84,29,10001,NULL,1,NULL,2,NULL,NULL),
(85,29,1,NULL,1,NULL,2,NULL,NULL),
(86,29,1,NULL,1,NULL,2,NULL,NULL),
(87,29,1,NULL,1,NULL,NULL,NULL,NULL),
(88,29,10001,NULL,1,NULL,2,NULL,NULL),
(89,29,10001,NULL,1,NULL,2,NULL,NULL),
(90,29,10001,NULL,1,NULL,2,NULL,NULL),
(91,29,10001,NULL,1,NULL,2,NULL,NULL),
(92,29,10001,NULL,1,NULL,2,NULL,NULL),
(93,29,10001,NULL,1,NULL,2,NULL,NULL),
(94,29,10001,NULL,1,NULL,2,NULL,NULL),
(95,29,10001,NULL,1,NULL,2,NULL,NULL),
(96,29,10001,NULL,1,NULL,2,NULL,NULL),
(97,29,10001,NULL,1,NULL,2,NULL,NULL),
(98,29,10001,NULL,1,NULL,2,NULL,NULL),
(99,29,10001,NULL,1,NULL,2,NULL,NULL),
(100,29,10001,NULL,1,NULL,2,NULL,NULL),
(101,29,10001,'2018-08-19 15:13:28',2,'同意',2,NULL,NULL),
(102,29,10001,NULL,1,NULL,2,NULL,NULL),
(103,29,10001,NULL,1,NULL,2,NULL,NULL),
(104,29,10001,NULL,1,NULL,2,NULL,NULL),
(105,29,10001,NULL,1,NULL,2,NULL,NULL),
(106,29,10001,NULL,1,NULL,2,NULL,NULL),
(107,29,10001,NULL,1,NULL,2,NULL,NULL),
(108,27,10001,NULL,1,NULL,2,NULL,NULL),
(109,27,10001,NULL,1,NULL,2,NULL,NULL),
(110,27,10001,NULL,1,NULL,2,NULL,NULL),
(111,28,10001,NULL,1,NULL,2,NULL,NULL),
(112,28,10001,NULL,1,NULL,2,NULL,NULL),
(113,28,10001,NULL,1,NULL,2,NULL,NULL),
(114,28,10001,NULL,1,NULL,2,NULL,NULL),
(115,28,10001,NULL,1,NULL,2,NULL,NULL),
(116,28,10001,NULL,1,NULL,2,NULL,NULL),
(117,28,10001,NULL,1,NULL,2,NULL,NULL),
(118,28,10001,NULL,1,NULL,2,NULL,NULL),
(119,28,10001,NULL,1,NULL,2,NULL,NULL),
(120,28,10001,NULL,1,NULL,2,NULL,NULL),
(121,28,10001,NULL,1,NULL,2,NULL,NULL),
(122,28,10001,NULL,1,NULL,2,NULL,NULL),
(123,28,10001,NULL,1,NULL,2,NULL,NULL),
(124,28,10001,NULL,1,NULL,2,NULL,NULL),
(125,28,10001,NULL,1,NULL,2,NULL,NULL),
(126,28,10001,NULL,1,NULL,2,NULL,NULL),
(127,28,10001,NULL,1,NULL,2,NULL,NULL),
(128,28,10001,NULL,1,NULL,2,NULL,NULL),
(129,28,10001,NULL,1,NULL,2,NULL,NULL),
(130,28,10001,NULL,1,NULL,2,NULL,NULL),
(131,28,10001,NULL,1,NULL,2,NULL,NULL),
(132,28,10001,NULL,1,NULL,2,NULL,NULL),
(133,28,10001,NULL,1,NULL,2,NULL,NULL),
(134,28,10001,NULL,1,NULL,2,NULL,NULL),
(135,28,10001,NULL,1,NULL,2,NULL,NULL),
(136,28,10001,NULL,1,NULL,2,NULL,NULL),
(137,28,10001,NULL,1,NULL,2,NULL,NULL),
(138,28,10001,NULL,1,NULL,2,NULL,NULL),
(139,29,10001,NULL,1,NULL,2,NULL,NULL),
(140,28,10001,NULL,1,NULL,2,NULL,NULL),
(141,28,10001,NULL,1,NULL,NULL,NULL,NULL),
(142,29,10001,NULL,1,NULL,2,NULL,NULL),
(143,29,10001,NULL,1,NULL,2,NULL,NULL),
(144,29,10001,NULL,1,NULL,NULL,NULL,NULL),
(145,27,10001,NULL,1,NULL,2,NULL,NULL),
(146,27,10001,NULL,1,NULL,2,NULL,NULL),
(147,27,10001,NULL,1,NULL,2,NULL,NULL),
(148,27,10001,NULL,1,NULL,NULL,NULL,NULL),
(149,27,10025,NULL,1,NULL,2,NULL,NULL),
(150,27,10025,NULL,1,NULL,2,NULL,NULL),
(151,27,10025,NULL,1,NULL,2,NULL,NULL),
(152,27,10025,NULL,1,NULL,2,NULL,NULL),
(153,27,10025,NULL,1,NULL,2,NULL,NULL),
(154,27,10025,NULL,1,NULL,2,NULL,NULL),
(155,27,10025,NULL,1,NULL,2,NULL,NULL),
(156,27,10025,NULL,1,NULL,2,NULL,NULL),
(157,27,10025,NULL,1,NULL,2,NULL,NULL),
(158,27,10025,NULL,1,NULL,NULL,NULL,NULL),
(159,27,10035,NULL,1,NULL,2,NULL,NULL),
(160,27,10035,NULL,1,NULL,NULL,NULL,NULL);

/*Table structure for table `nsl_files_vislog` */

DROP TABLE IF EXISTS `nsl_files_vislog`;

CREATE TABLE `nsl_files_vislog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) DEFAULT NULL COMMENT '文件',
  `visible` varchar(511) DEFAULT NULL COMMENT '增加可见人',
  `u_id` int(11) DEFAULT NULL COMMENT '操作人',
  `befor` varchar(511) DEFAULT NULL COMMENT '操作前',
  `after` varchar(511) DEFAULT NULL COMMENT '操作后',
  `date` datetime DEFAULT NULL COMMENT '操作时间',
  `beforid` varchar(511) DEFAULT NULL COMMENT '操作前(id)',
  `afterid` varchar(511) DEFAULT NULL COMMENT '操作后(id)',
  `p_id` int(11) DEFAULT NULL COMMENT '上级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_files_vislog` */

insert  into `nsl_files_vislog`(`id`,`f_id`,`visible`,`u_id`,`befor`,`after`,`date`,`beforid`,`afterid`,`p_id`) values 
(11,27,NULL,10026,'','系统管理员','2018-07-29 16:17:30','','10001',0),
(12,28,NULL,10001,'','佘龙宇','2018-07-29 16:31:23','','10026',0),
(13,29,NULL,10026,'','系统管理员','2018-07-29 16:42:01','','10001',0),
(18,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华','  李轩  龙宗筱','2018-08-16 15:47:46','10001,10024,10037,10030,10036','10030',0),
(19,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华','  李轩  龙宗筱','2018-08-16 15:47:46','10001,10024,10037,10030,10036','10035',0),
(21,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华   李轩  龙宗筱','  佘龙宇  沈志明','2018-08-16 16:22:51','10001,10024,10037,10030,10036,10030,10035','10028',0),
(22,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华   李轩  龙宗筱   佘龙宇  沈志明','  林平  李轩  佘龙宇','2018-08-17 16:19:58','10001,10024,10037,10030,10036,10030,10035,10026,10028','10024',0),
(23,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华   李轩  龙宗筱   佘龙宇  沈志明','  林平  李轩  佘龙宇','2018-08-17 16:19:58','10001,10024,10037,10030,10036,10030,10035,10026,10028','10030',0),
(24,29,NULL,10001,'系统管理员   林平  李兴盛  李轩  戚华   李轩  龙宗筱   佘龙宇  沈志明','  林平  李轩  佘龙宇','2018-08-17 16:19:58','10001,10024,10037,10030,10036,10030,10035,10026,10028','10026',0),
(25,28,NULL,10001,'佘龙宇','','2018-08-19 17:12:53','10026','10034',0),
(26,28,NULL,10001,'佘龙宇','','2018-08-19 17:12:53','10026','10029',0),
(33,27,NULL,10001,'系统管理员  ','','2018-08-19 17:50:09','10001,10025,10024,10037,10025,10024,10037','10025',11),
(34,27,NULL,10001,'系统管理员  ','','2018-08-19 17:50:09','10001,10025,10024,10037,10025,10024,10037','10024',11),
(35,27,NULL,10001,'系统管理员  ','','2018-08-19 17:50:09','10001,10025,10024,10037,10025,10024,10037','10037',11),
(36,27,NULL,10025,'系统管理员   ','','2018-08-19 17:56:25','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037','10035',35),
(37,27,NULL,10025,'系统管理员   ','','2018-08-19 17:56:25','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037','10036',35),
(38,27,NULL,10025,'系统管理员    ','','2018-08-19 17:57:38','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036','10001',37),
(39,27,NULL,10025,'系统管理员     ','','2018-08-19 18:02:32','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001','10030',38),
(40,27,NULL,10025,'系统管理员      ','','2018-08-19 18:03:18','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030','10032',39),
(41,27,NULL,10025,'系统管理员       ','','2018-08-19 18:11:38','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032','10031',33),
(42,27,NULL,10025,'系统管理员        ','','2018-08-19 18:11:56','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032,10031','10035',33),
(43,27,NULL,10025,'系统管理员        ','','2018-08-19 18:11:56','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032,10031','10027',33),
(44,27,NULL,10035,'系统管理员         ','','2018-08-19 18:12:36','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032,10031,10035,10027','10029',42),
(45,27,NULL,10035,'系统管理员         ','','2018-08-19 18:12:36','10001,10025,10024,10037,10025,10024,10037,10025,10024,10037,10035,10036,10001,,10030,10032,10031,10035,10027','10033',42),
(46,30,NULL,10025,'','系统管理员','2018-08-19 18:19:13','','10001',NULL);

/*Table structure for table `nsl_goods` */

DROP TABLE IF EXISTS `nsl_goods`;

CREATE TABLE `nsl_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `num` int(11) DEFAULT NULL COMMENT '库存',
  `code` varchar(31) DEFAULT NULL COMMENT '条码',
  `guige` varchar(31) DEFAULT NULL COMMENT '规格',
  `price` int(11) DEFAULT NULL COMMENT '单价',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nsl_goods` */

/*Table structure for table `nsl_goods_log` */

DROP TABLE IF EXISTS `nsl_goods_log`;

CREATE TABLE `nsl_goods_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '领取人',
  `g_id` int(11) DEFAULT NULL COMMENT '办公用品',
  `date` int(11) DEFAULT NULL COMMENT '申请时间',
  `num` int(11) DEFAULT NULL COMMENT '申请数量',
  `sp_id` int(11) DEFAULT NULL COMMENT '审批人',
  `sp_opinion` varchar(511) DEFAULT NULL COMMENT '审批意见',
  `sp_ispass` int(11) DEFAULT NULL COMMENT '是否通过',
  `visible1` int(11) DEFAULT NULL COMMENT '可见人',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nsl_goods_log` */

/*Table structure for table `nsl_goods_splog` */

DROP TABLE IF EXISTS `nsl_goods_splog`;

CREATE TABLE `nsl_goods_splog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_id` int(11) DEFAULT NULL COMMENT '申请号',
  `sp_id` int(11) DEFAULT NULL COMMENT '审批人',
  `sp_opinion` varchar(511) DEFAULT NULL COMMENT '审批意见',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nsl_goods_splog` */

/*Table structure for table `nsl_unforgot` */

DROP TABLE IF EXISTS `nsl_unforgot`;

CREATE TABLE `nsl_unforgot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL COMMENT '日期',
  `content` varchar(1023) DEFAULT NULL COMMENT '内容',
  `status` int(11) DEFAULT NULL COMMENT '级别',
  `u_id` int(11) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `nsl_unforgot` */

insert  into `nsl_unforgot`(`id`,`date`,`content`,`status`,`u_id`) values 
(1,'2018-08-15','党建会议通知',1,10001),
(2,'2018-08-16','通知林总签字',1,10026),
(3,'2018-08-16','通知张总开会',1,10001),
(4,'2018-08-17','去工商局取发票',NULL,10001),
(6,'2018-08-17','三三三三三',NULL,10001),
(8,'2018-08-19','需要哈哈',NULL,10001);

/*Table structure for table `tb_tfw_blog` */

DROP TABLE IF EXISTS `tb_tfw_blog`;

CREATE TABLE `tb_tfw_blog` (
  `f_it_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `f_it_del` int(11) DEFAULT '0' COMMENT '状态',
  `f_it_seq` int(11) DEFAULT '0' COMMENT '排序',
  `f_it_content` text COMMENT '内容',
  `f_it_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `f_it_createtime` date DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`f_it_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_tfw_blog` */

insert  into `tb_tfw_blog`(`f_it_id`,`f_it_del`,`f_it_seq`,`f_it_content`,`f_it_title`,`f_it_createtime`,`version`) values 
(1,1,1,'jfinalblade go','jfinalblade','2016-10-08',2),
(3,1,2,'<p style=\"text-align: center;\">112</p>','测试','2016-10-10',1),
(4,1,3,'<p><img src=\"/upload/image/20161010/1476091111051005215.jpg\" style=\"\" title=\"1476091111051005215.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111054037337.jpg\" style=\"\" title=\"1476091111054037337.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111051097841.jpg\" style=\"\" title=\"1476091111051097841.jpg\"/></p><p><br/></p>','测试1','2016-10-10',0),
(5,1,4,'<p><img src=\"http://ikkong.qiniudn.com/upload/image/20161011/1476170956158098341.jpg\" title=\"1476170956158098341\" alt=\"3 (12).jpg\"/></p>','测试qiniu','2016-10-11',0);

/*Table structure for table `tb_tfw_tzgg` */

DROP TABLE IF EXISTS `tb_tfw_tzgg`;

CREATE TABLE `tb_tfw_tzgg` (
  `F_IT_XL` int(11) NOT NULL AUTO_INCREMENT,
  `F_VC_BT` varchar(255) DEFAULT NULL,
  `F_IT_LX` int(11) DEFAULT NULL,
  `F_TX_NR` text,
  `F_DT_FBSJ` datetime DEFAULT NULL,
  `F_DT_CJSJ` datetime DEFAULT NULL,
  `F_IT_CJR` int(11) DEFAULT NULL,
  `F_IT_TP` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`F_IT_XL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_tfw_tzgg` */

insert  into `tb_tfw_tzgg`(`F_IT_XL`,`F_VC_BT`,`F_IT_LX`,`F_TX_NR`,`F_DT_FBSJ`,`F_DT_CJSJ`,`F_IT_CJR`,`F_IT_TP`,`VERSION`) values 
(2,'南丝路党支部8月月会通知',10,'<p>\r\n	啊啊啊\r\n</p>\r\n<p>\r\n	<img src=\"/kindeditor/renderFile/303\" title=\"303\" alt=\"303\" />\r\n</p>','2016-09-30 00:00:00',NULL,NULL,NULL,1),
(3,'请茧站做好卫生工作,迎接正夏季收茧工作',1,'<img src=\"/kindeditor/renderFile/304\" title=\"304\" alt=\"304\" /><img src=\"/kindeditor/renderFile/305\" title=\"305\" alt=\"305\" /><img src=\"/kindeditor/renderFile/306\" title=\"306\" alt=\"306\" />','2016-09-30 00:00:00',NULL,NULL,NULL,1);

/*Table structure for table `tfw_attach` */

DROP TABLE IF EXISTS `tfw_attach`;

CREATE TABLE `tfw_attach` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text,
  `STATUS` int(11) DEFAULT NULL,
  `CREATER` int(11) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_attach` */

insert  into `tfw_attach`(`ID`,`CODE`,`NAME`,`URL`,`STATUS`,`CREATER`,`CREATETIME`) values 
(303,NULL,'2 (14).jpg','/upload\\20160930\\1475222724826.jpg',1,1,'2016-09-30 16:05:25'),
(304,NULL,'2.jpg','/upload\\20160930\\1475222803894.jpg',1,1,'2016-09-30 16:06:44'),
(305,NULL,'3 (11).jpg','/upload\\20160930\\1475222803929.jpg',1,1,'2016-09-30 16:06:44'),
(306,NULL,'3 (12).jpg','/upload\\20160930\\1475222804029.jpg',1,1,'2016-09-30 16:06:44'),
(307,NULL,'3 (13).jpg','/upload\\20161011\\1476171059172.jpg',1,1,'2016-10-11 15:30:59'),
(308,NULL,'2.jpg','/upload\\20180817\\1534469052918.jpg',1,10001,'2018-08-17 09:24:13'),
(309,NULL,'thumb.jpg','/upload\\20180817\\1534469121686.jpg',1,10001,'2018-08-17 09:25:22'),
(310,NULL,'2cdd705ba4e6905578dafa68be0016310ed47a57.jpeg','/upload\\20180817\\1534473651397.jpeg',1,10001,'2018-08-17 10:40:51');

/*Table structure for table `tfw_dept` */

DROP TABLE IF EXISTS `tfw_dept`;

CREATE TABLE `tfw_dept` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `SIMPLENAME` varchar(45) DEFAULT NULL,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_dept` */

insert  into `tfw_dept`(`ID`,`NUM`,`PID`,`SIMPLENAME`,`FULLNAME`,`TIPS`,`VERSION`) values 
(1,0,0,'南丝路集团公司','南丝路集团公司',NULL,4),
(7,2,1,'领导班子','领导班子',NULL,8),
(14,3,1,'财务部','财务部',NULL,0),
(15,4,1,'行政综合部','行政综合部',NULL,0),
(16,1,1,'总经理','总经理',NULL,0);

/*Table structure for table `tfw_dict` */

DROP TABLE IF EXISTS `tfw_dict`;

CREATE TABLE `tfw_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_dict` */

insert  into `tfw_dict`(`ID`,`CODE`,`NUM`,`PID`,`NAME`,`TIPS`,`VERSION`) values 
(1,'101',0,0,'性别',NULL,0),
(2,'101',1,1,'男',NULL,1),
(3,'101',2,1,'女',NULL,0),
(5,'901',0,0,'账号状态',NULL,0),
(6,'901',1,5,'启用',NULL,0),
(7,'901',2,5,'冻结',NULL,0),
(8,'901',3,5,'待审核',NULL,0),
(9,'901',4,5,'审核拒绝',NULL,0),
(10,'901',5,5,'已删除',NULL,0),
(11,'902',0,0,'状态',NULL,0),
(12,'902',1,11,'启用',NULL,0),
(13,'902',2,11,'禁用',NULL,0),
(14,'102',0,0,'公告类型',NULL,0),
(15,'102',10,14,'通知公告',NULL,0),
(16,'102',9,14,'发布计划',NULL,0),
(17,'903',0,0,'审核状态',NULL,0),
(18,'903',1,17,'待审核',NULL,0),
(19,'903',2,17,'审核拒绝',NULL,0),
(20,'903',3,17,'审核通过',NULL,0),
(41,'102',6,16,'测试',NULL,0),
(44,'102',1,14,'发布测试',NULL,0),
(45,'102',2,16,'测试222',NULL,1),
(46,'103',0,0,'文件类型',NULL,0),
(47,'103',1,46,'呈批文',NULL,0),
(48,'103',2,46,'下发文',NULL,0),
(49,'104',0,0,'审阅进度',NULL,0),
(50,'104',1,17,'待审核',NULL,2),
(51,'104',2,49,'部门领导已审批',NULL,0),
(52,'104',3,49,'领导班子已审批',NULL,0),
(53,'104',4,49,'总经理已审批',NULL,0),
(54,'104',99,49,'未提交',NULL,0),
(55,'104',5,49,'部门领导驳回',NULL,0),
(56,'104',6,49,'领导班子驳回',NULL,0),
(57,'104',7,49,'总经理驳回',NULL,0),
(58,'105',0,0,'报销类型',NULL,0),
(59,'105',1,58,'差旅报销',NULL,0),
(60,'105',2,58,'费用报销',NULL,0),
(61,'106',0,0,'报销流程',NULL,0),
(62,'106',1,61,'已填表',NULL,0),
(63,'106',2,61,'部门领导已审批',NULL,0),
(64,'106',3,61,'财务已初审',NULL,0),
(65,'106',4,61,'领导班子已审批',NULL,0),
(66,'106',5,61,'总经理已审批',NULL,0),
(67,'106',6,61,'财务已复审',NULL,0),
(68,'106',7,61,'已打款',NULL,0),
(69,'106',8,61,'部门领导驳回',NULL,0),
(70,'106',9,61,'财务初审不通过',NULL,0),
(71,'106',10,61,'领导班子驳回',NULL,0),
(72,'106',11,61,'总经理驳回',NULL,0),
(73,'106',12,61,'财务复核不通过',NULL,0),
(74,'106',13,61,'放款失败',NULL,0),
(75,'104',8,49,'已选择执行人',NULL,0),
(77,'104',9,49,'执行人已接收',NULL,0),
(78,'104',10,49,'已完成',NULL,0),
(79,'107',0,0,'车辆状态','车辆状态',0),
(80,'107',1,79,'空闲',NULL,0),
(81,'107',2,79,'已出车',NULL,0),
(82,'107',3,79,'维修',NULL,4),
(83,'107',4,79,'其它',NULL,0);

/*Table structure for table `tfw_generate` */

DROP TABLE IF EXISTS `tfw_generate`;

CREATE TABLE `tfw_generate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `REALPATH` varchar(255) DEFAULT NULL,
  `PACKAGENAME` varchar(255) DEFAULT NULL,
  `MODELNAME` varchar(255) DEFAULT NULL,
  `TABLENAME` varchar(255) DEFAULT NULL,
  `PKNAME` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_generate` */

insert  into `tfw_generate`(`ID`,`NAME`,`REALPATH`,`PACKAGENAME`,`MODELNAME`,`TABLENAME`,`PKNAME`,`TIPS`) values 
(2,'blog','E:\\gen','com.ikkong.platform','Blog','tb_tfw_blog','f_it_id',NULL),
(3,'files','F:\\ikkong-JfinalBlade-master\\JfinalBlade','com.ikkong.files','Files','nsl_files','id',NULL),
(4,'fileslog','F:\\ikkong-JfinalBlade-master\\JfinalBlade','com.ikkong.files','Fileslog','nsl_files_log','id',NULL),
(5,'casher','F:\\nsloa','com.ikkong.casher','Casher','nsl_casher','id',NULL),
(6,'casherdetail','F:\\nsloa','com.ikkong.casher','casherdetail','nsl_casher_detail','id',NULL),
(7,'casherlog','F:\\nsloa','com.ikkong.casher','Casherlog','nsl_casher_log','id',NULL),
(8,'goods','F:\\nsloa','com.ikkong.goods','Goods','nsl_goods','id',NULL),
(9,'goods','F:\\nsloa','com.ikkong.goods','Goodslog','nsl_goods_log','id',NULL),
(10,'goods','F:\\nsloa','com.ikkong.goods','Goodssplog','nsl_goods_splog','id',NULL),
(11,'filesvislog','F:\\nsloa','com.ikkong.files','Filesvislog','nsl_files_vislog','id',NULL),
(12,'unforgot','E:\\GitProjects\\nsloa','com.ikkong.unforgot','Unforgot','nsl_unforgot','id',NULL),
(13,'cars','F:\\nsloa','com.ikkong.cars','Cars','nsl_cars','id',NULL),
(14,'carslog','F:\\nsloa','com.ikkong.cars','Carslog','nsl_carslog','id',NULL);

/*Table structure for table `tfw_login_log` */

DROP TABLE IF EXISTS `tfw_login_log`;

CREATE TABLE `tfw_login_log` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `LOGNAME` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `CLASSNAME` varchar(255) DEFAULT NULL,
  `METHOD` text,
  `CREATETIME` datetime DEFAULT NULL,
  `SUCCEED` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_login_log` */

insert  into `tfw_login_log`(`ID`,`LOGNAME`,`USERID`,`CLASSNAME`,`METHOD`,`CREATETIME`,`SUCCEED`,`MESSAGE`) values 
(69,'12','2',NULL,'12','2016-02-01 00:00:00','0','12'),
(70,'登录','1',NULL,'[sessionID]: ci6ww7e3bmsx7hibkvfgeol3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 10:18:38','1',NULL),
(71,'登录','1',NULL,'[sessionID]: xtkaw8f6kqarvg8j2trpk48q [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 11:05:17','1',NULL),
(72,'登录','1',NULL,'[sessionID]: 1314dfrltipbd1l62vt9jjhepl [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 11:10:29','1',NULL),
(73,'登录','1',NULL,'[sessionID]: 97sixu4mubk9xfeykmsvr899 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 11:25:29','1',NULL),
(74,'登录','1',NULL,'[sessionID]: 7f1obhumq9o7r40ee8x9bzue [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 11:32:52','1',NULL),
(75,'登录','1',NULL,'[sessionID]: 1u59ybo0da3881lb4anxa2eley [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 13:26:45','1',NULL),
(76,'登录','1',NULL,'[sessionID]: 7967t66pd1tcl7j8755ktokz [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 13:49:15','1',NULL),
(77,'登录','1',NULL,'[sessionID]: tqik4h5jshis10afc10s7feq5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 13:58:45','1',NULL),
(78,'登录','1',NULL,'[sessionID]: 1oh89iui1mget1ey6a48wcu9gi [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 14:02:23','1',NULL),
(79,'登录','1',NULL,'[sessionID]: gmzgug1wa6za13e6p5pr22kqd [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 16:13:41','1',NULL),
(80,'登录','1',NULL,'[sessionID]: roobkbkfa8c6q765ghb0vem8 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 16:31:17','1',NULL),
(81,'登录','1',NULL,'[sessionID]: 1n80pzkdlvo7qg756vgbowbw5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 17:06:17','1',NULL),
(82,'登录','1',NULL,'[sessionID]: sfd5cuocbwoe1dqit52tmdcad [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-23 17:23:06','1',NULL),
(83,'登录','1',NULL,'[sessionID]: yvf4h16zp00t1n1pe0zmlj8sw [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-27 08:40:10','1',NULL),
(84,'登录','1',NULL,'[sessionID]: z6pm1tslakbat7y3nq2b5hrh [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-27 08:44:44','1',NULL),
(85,'登录','1',NULL,'[sessionID]: e5gli35jxfwwaf2me02fh4yy [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-27 08:50:57','1',NULL),
(86,'登录','1',NULL,'[sessionID]: 1drnwjvg008xjp5n8vmaeocx3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-28 16:57:38','1',NULL),
(87,'登录','1',NULL,'[sessionID]: wrbrzmxbrrvl8vytok697ygr [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-28 17:01:00','1',NULL),
(88,'登录','1',NULL,'[sessionID]: 1esel2896m8k1gohohwexvfel [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-28 17:05:06','1',NULL),
(89,'登录','1',NULL,'[sessionID]: 1e62ele5wc4sv57vf8t4jopjt [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-28 17:37:58','1',NULL),
(90,'登录','1',NULL,'[sessionID]: mp5bj4n2zzxm1kgjd9y86xkva [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 08:52:52','1',NULL),
(91,'登录','1',NULL,'[sessionID]: pbyjb5bfidruwwjlfkit39t3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 09:24:42','1',NULL),
(92,'登录','1',NULL,'[sessionID]: zliag84emt7hxzckymgba657 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 09:39:30','1',NULL),
(93,'登录','1',NULL,'[sessionID]: 1dnu4fw2hj97b1f706bytxtoac [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 10:41:42','1',NULL),
(94,'登录','1',NULL,'[sessionID]: ketaeot20pb3m8umwdckb3s [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 13:46:22','1',NULL),
(95,'登录','1',NULL,'[sessionID]: dxa2zge7ad5l18jozf8aamesm [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 14:27:12','1',NULL),
(96,'登录','1',NULL,'[sessionID]: 1o1xosz8z33k1elcraeicv19x [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 14:51:46','1',NULL),
(97,'登录','1',NULL,'[sessionID]: 1gjh1m3o7nvzi1f0j3e4czduoz [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 15:06:09','1',NULL),
(98,'登录','1',NULL,'[sessionID]: ptdfpj7uf67k1ezqk4epw9x8o [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 15:11:52','1',NULL),
(99,'登录','1',NULL,'[sessionID]: w01jfuhrnedx1j0otbu0zd0un [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 15:15:02','1',NULL),
(100,'登录','1',NULL,'[sessionID]: 19nkb5dwpgyo012wddci45xh5d [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-29 16:43:54','1',NULL),
(101,'登录','1',NULL,'[sessionID]: ufyqfu3uwx201d4mneohmpv3b [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 10:20:46','1',NULL),
(102,'登录','1',NULL,'[sessionID]: unn36ul6nrc51ql83p1zihyow [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 10:33:34','1',NULL),
(103,'登录','1',NULL,'[sessionID]: 1u0c1hllfgqzpnosvhfw4u0ng [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 10:51:07','1',NULL),
(104,'登录','1',NULL,'[sessionID]: jcz41hjqdi5mzuo7rnjerfev [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 11:12:34','1',NULL),
(105,'登录','1',NULL,'[sessionID]: vb3jzam9vef1155uluv4tjc8u [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 14:05:38','1',NULL),
(106,'登录','1',NULL,'[sessionID]: 1v4swciovr3gi1ffi7m916hhx8 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-09-30 14:22:36','1',NULL),
(107,'登录','1',NULL,'[sessionID]: 1kypmsa14geji8qt0d4jiuo2a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 14:15:02','1',NULL),
(108,'登录','1',NULL,'[sessionID]: 1tp1y6k3te3ok5dt5b4y5hxm1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 15:38:38','1',NULL),
(109,'登录','1',NULL,'[sessionID]: 1fimweejpdztd140lf1ybuxus2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 15:53:55','1',NULL),
(110,'登录','1',NULL,'[sessionID]: 52sj7rlfvtku1092uwymm78u2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 15:57:24','1',NULL),
(111,'登录','1',NULL,'[sessionID]: fo1lisgx2h3x1b8evktry3mxv [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 16:34:19','1',NULL),
(112,'登录','1',NULL,'[sessionID]: 1g0vsfudl038s16vy2k5amlhb7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-08 16:47:45','1',NULL),
(113,'登录','1',NULL,'[sessionID]: 1h4x3ofj6vi3d1ihdpdcd3jq5r [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 09:02:27','1',NULL),
(114,'登录','1',NULL,'[sessionID]: 14w46cddtz9gx11xhtio0cd4o9 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 10:09:28','1',NULL),
(115,'登录','1',NULL,'[sessionID]: oj0oc3m9tm9k1h5ca8oobcowl [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 14:18:44','1',NULL),
(116,'登录','1',NULL,'[sessionID]: 4ffgp6n1f3ay1o91tyn3eqfx5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 14:21:09','1',NULL),
(117,'登录','1',NULL,'[sessionID]: w36zwzquzjz310hwn1ggb2g2z [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 14:56:36','1',NULL),
(118,'登录','1',NULL,'[sessionID]: dttzvn7vi8yu155hnfcv2sk93 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 15:30:27','1',NULL),
(119,'登录','1',NULL,'[sessionID]: 1ox58z07o0bfya967s0apfjza [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 16:04:45','1',NULL),
(120,'登录','1',NULL,'[sessionID]: qx9sorff45bm18jbflap12b9g [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-09 16:16:41','1',NULL),
(121,'登录','1',NULL,'[sessionID]: 1f2wd12bby4m6nd1nwnxkgn97 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-10 15:29:55','1',NULL),
(122,'登录','1',NULL,'[sessionID]: l01ztk5lzin6xmpi4y0em45e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-10 17:17:49','1',NULL),
(123,'登录','1',NULL,'[sessionID]: 117sou17w07bj1mswchbwhg5gu [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-10-11 15:27:43','1',NULL),
(124,'登录','1',NULL,'[sessionID]: 1m1qay1rz6yie32yj3w6rplv2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-11-17 09:05:39','1',NULL),
(125,'登录','1',NULL,'[sessionID]: 1vt1mcq3uibc9csnrv3o449em [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 1800000','2016-11-17 09:14:34','1',NULL),
(126,'登录','1',NULL,'[sessionID]: 635ac908-35ef-4f00-8c20-1a02aec3252a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 09:49:09','1',NULL),
(127,'登出','1',NULL,'[sessionID]: 635ac908-35ef-4f00-8c20-1a02aec3252a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 09:51:13','1',NULL),
(128,'登录','1',NULL,'[sessionID]: b5aca2c9-8ce1-429e-8030-e3f9323679b1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 09:51:20','1',NULL),
(129,'登出','1',NULL,'[sessionID]: b5aca2c9-8ce1-429e-8030-e3f9323679b1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 09:51:29','1',NULL),
(130,'登录','1',NULL,'[sessionID]: 9079c1b4-1f45-4851-acb3-31f307a129f0 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 09:51:38','1',NULL),
(131,'登录','1',NULL,'[sessionID]: 3de201ce-e0c4-4f4f-940d-825ef4ed595a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 10:56:31','1',NULL),
(132,'登录','1',NULL,'[sessionID]: cd6994c4-848e-4582-9b89-bdffeac3da3d [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 16:27:24','1',NULL),
(133,'登出','1',NULL,'[sessionID]: f897918f-e28c-462c-8bf4-98596db32e0a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 17:26:04','1',NULL),
(134,'登录','10001',NULL,'[sessionID]: aeba31bc-f2e7-4a86-86b8-3620785f2edf [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-16 17:26:13','1',NULL),
(135,'登录','10001',NULL,'[sessionID]: 48408f4d-9d0b-40f8-a7cf-0c85542021bc [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 11:08:40','1',NULL),
(136,'登出','10001',NULL,'[sessionID]: 48408f4d-9d0b-40f8-a7cf-0c85542021bc [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 11:08:51','1',NULL),
(137,'登录','10026',NULL,'[sessionID]: 4da4f452-68d4-4703-a898-0321bca47e39 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 11:11:11','1',NULL),
(138,'登出','10001',NULL,'[sessionID]: db5fb11b-fcb7-4be6-ab07-73f5c3445b96 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 15:31:53','1',NULL),
(139,'登录','10025',NULL,'[sessionID]: 1b861c17-a702-4592-ae5c-4bb9df9d312a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 15:32:02','1',NULL),
(140,'登出','10025',NULL,'[sessionID]: fa8165c7-5068-4d92-aa02-9adaef9e583e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 15:55:29','1',NULL),
(141,'登录','10025',NULL,'[sessionID]: 307f7641-aa4d-4af0-931c-036018d46420 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 15:55:35','1',NULL),
(142,'登出','10025',NULL,'[sessionID]: 6cf653ad-11d3-4431-a801-8b815b4c0460 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:20:18','1',NULL),
(143,'登录','10001',NULL,'[sessionID]: e89c3ee7-53f9-4c2b-bece-6f5d47996cef [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:20:26','1',NULL),
(144,'登出','10001',NULL,'[sessionID]: e7f1032c-493b-412c-9361-4a6cd7eda5d7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:23:44','1',NULL),
(145,'登录','10001',NULL,'[sessionID]: 0f26ea4c-7f7d-476c-9607-200557751971 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:23:51','1',NULL),
(146,'登出','10001',NULL,'[sessionID]: 0f26ea4c-7f7d-476c-9607-200557751971 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:24:00','1',NULL),
(147,'登录','10025',NULL,'[sessionID]: acf8fbf3-b769-4ed6-9cf4-9700cdfe6559 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-17 17:24:08','1',NULL),
(148,'登录','10001',NULL,'[sessionID]: 52e4245b-be60-45ba-a8a2-87bc83ef1a79 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-18 09:30:39','1',NULL),
(149,'登出','10025',NULL,'[sessionID]: 081b0dfe-2981-4142-ace0-25c8d3f80908 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-18 17:04:21','1',NULL),
(150,'登录','10001',NULL,'[sessionID]: 20af0db8-29f5-47dc-8d90-e9db002333ec [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-18 17:04:29','1',NULL),
(151,'登录','10001',NULL,'[sessionID]: 5ab8626b-372f-48bd-9953-313054bf56c6 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-18 17:07:50','1',NULL),
(152,'登录','10001',NULL,'[sessionID]: ee2fc4f2-2b85-455a-958c-18d3b9ede859 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-18 17:08:19','1',NULL),
(153,'登录','10001',NULL,'[sessionID]: c413ce7b-9a28-4646-8862-c06907a78f05 [sessionHost]: 192.168.1.115 [sessionHost]: 360000','2018-07-19 11:23:13','1',NULL),
(154,'登录','10001',NULL,'[sessionID]: 681333df-e0a7-42f2-aaf2-f9e736a39767 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-19 11:31:14','1',NULL),
(155,'登出','10001',NULL,'[sessionID]: 7f0e0b6f-56ce-4692-ba70-d95a04d20797 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 08:58:15','1',NULL),
(156,'登录','10026',NULL,'[sessionID]: 7cddff44-0cb0-4f86-b2ea-e09325f9a58e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 08:58:26','1',NULL),
(157,'登出','10001',NULL,'[sessionID]: 6201e902-2795-4aca-b9cf-7ed1882a6500 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 15:08:45','1',NULL),
(158,'登录','10001',NULL,'[sessionID]: 4d4e2a24-af6f-4ac9-9eae-bf7e733dd058 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 15:08:51','1',NULL),
(159,'登出','10001',NULL,'[sessionID]: ed371833-9efe-4450-8e72-2303683202de [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 15:58:34','1',NULL),
(160,'登录','10025',NULL,'[sessionID]: f7bcd321-f096-446c-a014-243bed056dd7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 15:58:52','1',NULL),
(161,'登出','10025',NULL,'[sessionID]: f7bcd321-f096-446c-a014-243bed056dd7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 16:00:41','1',NULL),
(162,'登录','10001',NULL,'[sessionID]: 0a8396d1-47e9-4d54-9f48-b152878c95b5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 16:00:49','1',NULL),
(163,'登出','10001',NULL,'[sessionID]: bb5c1e8f-24be-4c3e-9094-92bd5b76be58 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 16:02:13','1',NULL),
(164,'登录','10025',NULL,'[sessionID]: f68a49ba-74c7-476e-9fa8-427de57943fa [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 16:02:23','1',NULL),
(165,'登录','10001',NULL,'[sessionID]: 51eefadd-75b4-4c39-926f-a811aedca277 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-23 16:11:17','1',NULL),
(166,'登出','1',NULL,'[sessionID]: 13421c70-d345-4057-a0f3-324e2575e356 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 08:58:42','1',NULL),
(167,'登录','10001',NULL,'[sessionID]: 9db3948e-9b4f-4f0f-ba20-9210d17bcaff [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 08:58:49','1',NULL),
(168,'登出','10025',NULL,'[sessionID]: 21ebe827-5c7a-4d53-b9a6-86feb709c07c [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 09:30:31','1',NULL),
(169,'登录','10028',NULL,'[sessionID]: 57bb4b5a-78c5-4bec-bc8d-241253c2f6bf [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 09:30:41','1',NULL),
(170,'登出','10001',NULL,'[sessionID]: bc2c25b6-1509-4292-9e8a-e2875317d58a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 09:40:27','1',NULL),
(171,'登录','10026',NULL,'[sessionID]: b9f09077-b1d1-4cd4-836a-1c6736910b79 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 09:40:53','1',NULL),
(172,'登出','10028',NULL,'[sessionID]: 5a988d61-7c29-4988-bcc5-aecbc66320a4 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 10:05:54','1',NULL),
(173,'登录','10025',NULL,'[sessionID]: c18353c3-362a-4080-a17c-b5f55d709944 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-24 10:06:01','1',NULL),
(174,'登出','10026',NULL,'[sessionID]: a6c6a8f4-f299-42a3-bd67-ea932820bafa [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 10:20:51','1',NULL),
(175,'登录','10026',NULL,'[sessionID]: 89578a58-8b9b-4b29-bd1a-af26a763fd52 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 10:21:02','1',NULL),
(176,'登录','10025',NULL,'[sessionID]: 04c5364e-2a31-4617-a2ab-5b11080fbe99 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 10:55:15','1',NULL),
(177,'登出','10026',NULL,'[sessionID]: 69db5241-4024-4489-8d13-f4b371debef0 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 11:46:33','1',NULL),
(178,'登录','10027',NULL,'[sessionID]: d320e1f3-2a62-42f8-8074-2374ffa9f791 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 11:46:52','1',NULL),
(179,'登出','10001',NULL,'[sessionID]: 4e933722-2779-4799-af1a-c5f06384f4d4 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 14:43:27','1',NULL),
(180,'登录','10026',NULL,'[sessionID]: 9bbed027-a011-45de-b463-4763382052a2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 14:43:35','1',NULL),
(181,'登出','10025',NULL,'[sessionID]: dced3ddb-5019-438e-8ea3-0aff511ec130 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 14:46:06','1',NULL),
(182,'登录','10001',NULL,'[sessionID]: a9730b30-7667-41e0-98d7-51628a788165 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 14:46:11','1',NULL),
(183,'登出','10001',NULL,'[sessionID]: 1d33b819-aa2f-45be-a4d5-d77bd28440d4 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:45:36','1',NULL),
(184,'登录','10025',NULL,'[sessionID]: 1583861e-a385-4f2e-b0d9-1081f4cd977c [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:45:58','1',NULL),
(185,'登出','10026',NULL,'[sessionID]: d4e96539-ed7b-40e4-a889-a4e5b7060d99 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:55:31','1',NULL),
(186,'登录','10001',NULL,'[sessionID]: c291a66c-a4ed-4949-a345-4190574ae0b7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:55:37','1',NULL),
(187,'登出','10025',NULL,'[sessionID]: 6d99591b-b7f3-4598-ac5e-220d675938e1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:58:08','1',NULL),
(188,'登录','10026',NULL,'[sessionID]: 96355a95-aa91-4ac5-ad92-278b0082aeb9 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-25 15:58:34','1',NULL),
(189,'登出','10026',NULL,'[sessionID]: 6821c0c2-a5a8-49ba-8645-54d990f80fe3 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:10:41','1',NULL),
(190,'登录','10025',NULL,'[sessionID]: b79419f6-fac9-428d-aa54-a0e444653174 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:10:51','1',NULL),
(191,'登出','10025',NULL,'[sessionID]: dabbcec0-c6d1-4fd5-a7f0-bae4bf7147f5 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:25:25','1',NULL),
(192,'登录','10025',NULL,'[sessionID]: abf4a10f-7986-4365-a303-897367a91ff6 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:25:39','1',NULL),
(193,'登出','10025',NULL,'[sessionID]: 77b6fc2b-e27d-45ec-a3fb-92e9bb1db0de [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:30:52','1',NULL),
(194,'登录','10030',NULL,'[sessionID]: e21285de-6b6c-44ec-bf5e-0fc038090c8e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:31:00','1',NULL),
(195,'登录','10031',NULL,'[sessionID]: 6cfdca02-56a1-464f-93d4-a7da830c555a [sessionHost]: 192.168.1.111 [sessionHost]: 360000','2018-07-26 11:35:24','1',NULL),
(196,'登出','10030',NULL,'[sessionID]: e7ea654a-b3e1-4bc8-a56e-ffa322f62b29 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:36:54','1',NULL),
(197,'登录','10025',NULL,'[sessionID]: 961490b3-fb65-46f5-b079-4cb6fe104c55 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:37:02','1',NULL),
(198,'登出','10025',NULL,'[sessionID]: 961490b3-fb65-46f5-b079-4cb6fe104c55 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:38:18','1',NULL),
(199,'登录','10024',NULL,'[sessionID]: 04194f90-5090-4ae6-bcbf-7e0dc288b45e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 11:38:26','1',NULL),
(200,'登录','10031',NULL,'[sessionID]: 13742cb9-c9aa-445a-8aca-1fdbd269c608 [sessionHost]: 192.168.1.111 [sessionHost]: 360000','2018-07-26 11:43:32','1',NULL),
(201,'登录','10031',NULL,'[sessionID]: 13742cb9-c9aa-445a-8aca-1fdbd269c608 [sessionHost]: 192.168.1.111 [sessionHost]: 360000','2018-07-26 11:45:00','1',NULL),
(202,'登出','10027',NULL,'[sessionID]: 83f8f7f4-b7e9-49d3-b46e-d4220e9aa493 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 16:38:21','1',NULL),
(203,'登录','10026',NULL,'[sessionID]: 483f5e26-9f91-4d15-a7c2-c4ac838bc28a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-26 16:38:49','1',NULL),
(204,'登出','10026',NULL,'[sessionID]: 39e34445-d810-4323-8375-b18011075e44 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 10:24:43','1',NULL),
(205,'登录','10031',NULL,'[sessionID]: 96a9f96c-c7a3-45c6-a564-f3813cce5aed [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 10:24:52','1',NULL),
(206,'登出','10031',NULL,'[sessionID]: 96a9f96c-c7a3-45c6-a564-f3813cce5aed [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 10:25:10','1',NULL),
(207,'登录','10031',NULL,'[sessionID]: a67f304c-ec1c-473a-9d1a-f913417b8e68 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 10:25:19','1',NULL),
(208,'登出','10031',NULL,'[sessionID]: e01c172f-52cb-4cb5-a12d-6f28c1ddd9a9 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 15:20:32','1',NULL),
(209,'登录','10025',NULL,'[sessionID]: f2208877-4e57-4b72-a4e0-e1648bce63c1 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 15:20:53','1',NULL),
(210,'登录','10025',NULL,'[sessionID]: 83c91e36-e820-419d-afa9-a3e442c12f73 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 15:33:29','1',NULL),
(211,'登出','10025',NULL,'[sessionID]: 50cf0b20-5f94-4aff-a6de-d0d345167769 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 15:48:59','1',NULL),
(212,'登录','10026',NULL,'[sessionID]: 5a0576f9-1547-47d3-b2ba-0a1416aef192 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 15:49:10','1',NULL),
(213,'登录','10001',NULL,'[sessionID]: 47aef016-f728-46e0-b7ff-409e1349cd86 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-27 16:23:19','1',NULL),
(214,'登出','1',NULL,'[sessionID]: a6f75fca-266d-437b-9b7f-db1582e1345d [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 10:41:34','1',NULL),
(215,'登录','10001',NULL,'[sessionID]: 8ee3a59a-9a80-4197-9eb5-ba7942a9a841 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 10:41:46','1',NULL),
(216,'登出','24',NULL,'[sessionID]: a72b1ccd-c863-4bd4-800e-789a8655892f [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 11:55:24','1',NULL),
(217,'登录','10026',NULL,'[sessionID]: 7c487f47-168f-4156-8430-d9b5927606d6 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 11:55:32','1',NULL),
(218,'登录','10001',NULL,'[sessionID]: c272d45d-c9d4-4abf-8080-d70b2b9e4f0d [sessionHost]: 192.168.0.109 [sessionHost]: 360000','2018-07-29 16:39:42','1',NULL),
(219,'登出','10026',NULL,'[sessionID]: c8e421fc-f961-4711-8c21-d6347ea3d071 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 21:31:02','1',NULL),
(220,'登录','10025',NULL,'[sessionID]: f3c5216f-9f01-441b-900c-e154705a8ade [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-29 21:31:11','1',NULL),
(221,'登出','10001',NULL,'[sessionID]: 4cd0f893-62f5-45bc-aa26-86929ffdf644 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-30 01:14:31','1',NULL),
(222,'登录','10036',NULL,'[sessionID]: ab9e9376-37b7-475f-a1a9-363aa143ad28 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-07-30 01:14:40','1',NULL),
(223,'登录','10001',NULL,'[sessionID]: 4b44b45c-fbae-4944-b78c-6b4d72e1d778 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-16 15:35:52','1',NULL),
(224,'登出','1',NULL,'[sessionID]: 4afc72ca-54e9-4ca0-8b83-d13fbe217e64 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-16 15:49:53','1',NULL),
(225,'登录','10001',NULL,'[sessionID]: 6bbe2ffe-33af-47fe-953a-b29f3493a90a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-16 15:49:59','1',NULL),
(226,'登录','10001',NULL,'[sessionID]: f84efb92-3bb8-4478-8d75-a2f74bfdabf7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-17 09:06:37','1',NULL),
(227,'登录','10001',NULL,'[sessionID]: 25be8cbc-4b1c-4b7e-bdcd-8a7b87d5d250 [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 15:12:48','1',NULL),
(228,'登录','10001',NULL,'[sessionID]: 5cb2e235-f5f4-44ac-84ea-2e80c7830ff2 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-17 15:29:23','1',NULL),
(229,'登录','10001',NULL,'[sessionID]: d0723c98-112c-456a-a3df-0d72962215b2 [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 16:04:06','1',NULL),
(230,'登录','10001',NULL,'[sessionID]: 80da2b71-70cc-47ad-85cb-c20cbd30af2f [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 16:19:21','1',NULL),
(231,'登录','10001',NULL,'[sessionID]: 9d3f8c96-d6e0-4692-a914-b29cfd7a992b [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 16:29:41','1',NULL),
(232,'登录','10001',NULL,'[sessionID]: 793aad83-d4c0-402e-a68f-25936ed4549d [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 16:40:27','1',NULL),
(233,'登录','10001',NULL,'[sessionID]: 4b20b059-61f7-4b25-b2c7-0f3c0847362b [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 16:45:28','1',NULL),
(234,'登录','10001',NULL,'[sessionID]: 1c33013e-8281-4f64-9afe-ecacf103d5f5 [sessionHost]: 192.168.1.101 [sessionHost]: 360000','2018-08-17 17:19:55','1',NULL),
(235,'登录','10001',NULL,'[sessionID]: 0db3f4bd-8466-40ee-b1da-134b0ae09cf4 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-18 11:01:20','1',NULL),
(236,'登录','10001',NULL,'[sessionID]: 2e0ca250-2fbb-41ef-aec9-825e25555ac4 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-18 22:43:34','1',NULL),
(237,'登录','10001',NULL,'[sessionID]: d2483295-b4c4-4748-9480-4b15aaef138d [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 09:41:33','1',NULL),
(238,'登录','10001',NULL,'[sessionID]: 923d1658-a134-4438-81e3-2e85c46df0d7 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 09:42:03','1',NULL),
(239,'登录','10001',NULL,'[sessionID]: c74ac825-2052-496b-b270-761d0a2059c8 [sessionHost]: 192.168.1.93 [sessionHost]: 360000','2018-08-19 11:18:10','1',NULL),
(240,'登录','10001',NULL,'[sessionID]: c74ac825-2052-496b-b270-761d0a2059c8 [sessionHost]: 192.168.1.93 [sessionHost]: 360000','2018-08-19 11:21:44','1',NULL),
(241,'登录','10001',NULL,'[sessionID]: c74ac825-2052-496b-b270-761d0a2059c8 [sessionHost]: 192.168.1.93 [sessionHost]: 360000','2018-08-19 11:21:46','1',NULL),
(242,'登录','10001',NULL,'[sessionID]: 467a2f71-ebcc-4799-b561-588aa136b82b [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 16:58:39','1',NULL),
(243,'登出','10001',NULL,'[sessionID]: 35379cca-44d0-46bf-996f-c0719449b074 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 17:56:05','1',NULL),
(244,'登录','10025',NULL,'[sessionID]: 8b10d6e1-ae18-4f5b-b2e4-6caf5c0cc0aa [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 17:56:10','1',NULL),
(245,'登出','10025',NULL,'[sessionID]: 3a99ae27-dd51-46dc-a4a7-a3e97eb6f23b [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:03:02','1',NULL),
(246,'登录','10025',NULL,'[sessionID]: ee570fa8-f24f-4208-afb6-f89c4ca8d5be [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:03:07','1',NULL),
(247,'登出','10001',NULL,'[sessionID]: 235fe8fb-e14e-4346-baaa-94c7f822d4c9 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:12:14','1',NULL),
(248,'登录','10035',NULL,'[sessionID]: 330a44f6-ab3a-4330-99ee-c4e21dc871dd [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:12:21','1',NULL),
(249,'登出','10035',NULL,'[sessionID]: 9c7c0ae8-0513-49eb-8e5f-ad5f1d68845e [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:19:55','1',NULL),
(250,'登录','10001',NULL,'[sessionID]: cf13d18a-0b57-4394-8be0-672fd94d9420 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 18:19:59','1',NULL),
(251,'登录','10001',NULL,'[sessionID]: be8c2fcd-91ef-4a6e-972e-aaa26384b51f [sessionHost]: 192.168.1.93 [sessionHost]: 360000','2018-08-19 18:49:29','1',NULL),
(252,'登出','10025',NULL,'[sessionID]: 948d8879-f1d9-4a39-930c-ac1c3ada102a [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 19:37:29','1',NULL),
(253,'登录','10001',NULL,'[sessionID]: 7071d78c-de8b-4cb0-aeda-f3f700dceb66 [sessionHost]: 0:0:0:0:0:0:0:1 [sessionHost]: 360000','2018-08-19 19:37:34','1',NULL);

/*Table structure for table `tfw_menu` */

DROP TABLE IF EXISTS `tfw_menu`;

CREATE TABLE `tfw_menu` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `PCODE` varchar(255) DEFAULT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NUM` int(65) DEFAULT NULL,
  `LEVELS` int(65) DEFAULT NULL,
  `SOURCE` text,
  `PATH` varchar(255) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `STATUS` int(65) DEFAULT NULL,
  `ISOPEN` varchar(255) DEFAULT NULL,
  `ISTEMPLATE` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_menu` */

insert  into `tfw_menu`(`ID`,`CODE`,`PCODE`,`ALIAS`,`NAME`,`ICON`,`URL`,`NUM`,`LEVELS`,`SOURCE`,`PATH`,`TIPS`,`STATUS`,`ISOPEN`,`ISTEMPLATE`,`VERSION`) values 
(1,'system','0',NULL,'系统管理','fa-cog',NULL,9,1,NULL,NULL,NULL,1,'1','0',3),
(2,'role','system',NULL,'角色管理','fa-key','/role/',2,2,NULL,NULL,NULL,1,'0',NULL,1),
(3,'role_add','role','addex','角色新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/role/add',1,3,NULL,'role_add.html','800*340',1,'0',NULL,2),
(4,'role_edit','role','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/role/edit',2,3,NULL,'role_edit.html','800*340',1,'0','0',1),
(5,'role_remove','role','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/role/remove',3,3,NULL,NULL,NULL,1,'0',NULL,1),
(6,'role_view','role','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/role/view',4,3,NULL,'role_view.html','800*340',1,NULL,NULL,1),
(7,'role_authority','role','authority','权限配置','btn btn-xs btn-white | fa fa-wrench  bigger-120','/role/authority',5,3,NULL,'role_authority.html','350*500',1,'0',NULL,2),
(8,'user','system',NULL,'用户管理','fa-user','/user/',1,2,NULL,NULL,NULL,1,NULL,NULL,0),
(9,'user_add','user','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/user/add',1,3,NULL,'user_add.html','800*430',1,NULL,NULL,0),
(10,'user_edit','user','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/user/edit',2,3,NULL,'user_edit.html','800*430',1,NULL,NULL,0),
(11,'user_del','user','remove','删除','btn btn-xs btn-white | fa fa fa-times bigger-120','/user/del',3,3,NULL,NULL,NULL,1,NULL,NULL,0),
(12,'user_view','user','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/user/view',4,3,NULL,'user_view.html','800*390',1,NULL,NULL,0),
(13,'user_audit','user','audit','审核','btn btn-xs btn-white | fa fa-user  bigger-120','{\"status\":\"3\"}',5,3,NULL,NULL,NULL,1,NULL,NULL,0),
(14,'user_audit_ok','user_audit','ok','通过','btn btn-xs btn-white | fa fa-check  bigger-120','/user/auditOk',1,4,NULL,NULL,NULL,1,NULL,NULL,0),
(15,'user_audit_refuse','user_audit','refuse','拒绝','btn btn-xs btn-white | fa fa-times  bigger-120','/user/auditRefuse',2,4,NULL,NULL,NULL,1,NULL,NULL,0),
(16,'user_audit_back','user_audit','back','返回','btn btn-xs btn-white | fa fa-undo  bigger-120',NULL,3,4,NULL,NULL,NULL,1,NULL,NULL,0),
(17,'user_reset','user','reset','重置密码','btn btn-xs btn-white | fa fa-key  bigger-120','/user/reset',6,3,NULL,NULL,NULL,1,NULL,NULL,0),
(18,'user_ban','user','frozen','冻结','btn btn-xs btn-white | fa fa-ban  bigger-120','/user/ban',7,3,NULL,NULL,NULL,1,NULL,NULL,0),
(19,'user_recycle','user','recycle','回收站','btn btn-xs btn-white | fa fa-recycle  bigger-120','{\"status\":\"5\"}',8,3,NULL,NULL,NULL,1,NULL,NULL,0),
(20,'user_recycle_restore','user_recycle','restore','还原','btn btn-xs btn-white | fa fa-refresh  bigger-120','/user/restore',1,4,NULL,NULL,NULL,1,NULL,NULL,0),
(21,'user_recycle_remove','user_recycle','remove','彻底删除','btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120','/user/remove',2,4,NULL,NULL,NULL,1,NULL,NULL,0),
(22,'user_recycle_back','user_recycle','back','返回','btn btn-xs btn-white | fa fa-undo  bigger-120',NULL,3,4,NULL,NULL,NULL,1,NULL,NULL,0),
(23,'user_roleAssign','user','assign','角色分配','btn btn-xs btn-white | fa fa-users bigger-120','/user/roleAssign',9,3,NULL,'user_roleAssign.html','350*500',1,NULL,NULL,0),
(24,'user_extrole','user','agent','权限代理','btn btn-xs btn-white | fa fa-wrench  bigger-120','/user/extrole',10,3,NULL,'user_extrole.html',NULL,1,NULL,NULL,0),
(25,'menu','system',NULL,'菜单管理','fa-tasks','/menu/',3,2,NULL,NULL,NULL,1,NULL,NULL,0),
(26,'menu_add','menu','addex','菜单新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/menu/add',1,3,NULL,'menu_add.html','800*430',1,'0','0',1),
(27,'menu_edit','menu','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/menu/edit',2,3,NULL,'menu_edit.html','800*430',1,'0','0',1),
(28,'menu_del','menu','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/menu/del',3,3,NULL,NULL,NULL,1,'0',NULL,1),
(29,'menu_view','menu','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/menu/view',4,3,NULL,'menu_view.html','800*430',1,'0','0',1),
(30,'menu_recycle','menu','recycle','回收站','btn btn-xs btn-white | fa fa-recycle  bigger-120','{\"status\":\"2\"}',5,3,NULL,NULL,NULL,1,NULL,NULL,0),
(31,'menu_recycle_restore','menu_recycle','restore','还原','btn btn-xs btn-white | fa fa-refresh  bigger-120','/menu/restore',1,4,NULL,NULL,NULL,1,NULL,NULL,0),
(32,'menu_recycle_remove','menu_recycle','remove','彻底删除','btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120','/menu/remove',2,4,NULL,NULL,NULL,1,'0',NULL,1),
(33,'menu_recycle_back','menu_recycle','back','返回','btn btn-xs btn-white | fa fa-undo  bigger-120',NULL,3,4,NULL,NULL,NULL,1,NULL,NULL,0),
(34,'dict','system',NULL,'字典管理','fa fa-book','/dict/',4,2,NULL,NULL,NULL,1,NULL,NULL,0),
(35,'dict_add','dict','addex','字典新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/dict/add',1,3,NULL,'dict_add.html','800*390',1,NULL,NULL,0),
(36,'dict_edit','dict','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/dict/edit',2,3,NULL,'dict_edit.html','800*390',1,NULL,NULL,0),
(37,'dict_remove','dict','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/dict/remove',3,3,NULL,NULL,NULL,1,NULL,NULL,0),
(38,'dict_view','dict','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/dict/view',4,3,NULL,'dict_view.html','800*390',1,NULL,NULL,0),
(39,'dept','system',NULL,'部门管理','fa fa-users','/dept/',5,2,NULL,NULL,NULL,1,NULL,NULL,0),
(40,'dept_add','dept','addex','部门新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/dept/add',1,3,NULL,'dept_add.html','800*340',1,NULL,NULL,0),
(41,'dept_edit','dept','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/dept/edit',2,3,NULL,'dept_edit.html','800*340',1,NULL,NULL,0),
(42,'dept_remove','dept','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/dept/remove',3,3,NULL,NULL,NULL,1,NULL,NULL,0),
(43,'dept_view','dept','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/dept/view',4,3,NULL,'dept_view.html','800*340',1,'0','0',0),
(44,'attach','system',NULL,'附件管理','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/attach/',6,2,NULL,'attach.html',NULL,1,'0','0',2),
(45,'attach_add','attach','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/attach/add',1,3,NULL,'attach_add.html','800*450',1,'0','0',0),
(46,'attach_edit','attach','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/attach/edit',2,3,NULL,'attach_edit.html','800*290',1,'0',NULL,0),
(47,'attach_remove','attach','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/attach/remove',3,3,NULL,NULL,NULL,1,NULL,NULL,0),
(48,'attach_view','attach','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/attach/view',4,3,NULL,'attach_view.html','800*450',1,'0','0',1),
(49,'attach_download','attach','download','下载','btn btn-xs btn-white | fa fa-paperclip bigger-120','/attach/download',5,3,NULL,NULL,NULL,1,NULL,NULL,0),
(56,'parameter','system',NULL,'参数化管理','fa-tags','/parameter/',9,2,NULL,'parameter.html',NULL,1,'0','1',0),
(57,'parameter_add','parameter','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/parameter/add',1,3,NULL,'parameter_add.html',NULL,1,'0','0',0),
(58,'parameter_edit','parameter','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/parameter/edit',2,3,NULL,'parameter_edit.html',NULL,1,'0','0',0),
(59,'parameter_del','parameter','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/parameter/del',3,3,NULL,NULL,NULL,1,'0','0',1),
(60,'parameter_view','parameter','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/parameter/view',4,3,NULL,'parameter_view.html',NULL,1,'0','0',0),
(61,'parameter_recycle','parameter','recycle','回收站','btn btn-xs btn-white | fa fa-recycle  bigger-120','{\"status\":\"5\"}',5,3,NULL,'parameter_recycle.html',NULL,1,'0','0',0),
(62,'parameter_recycle_restore','parameter_recycle','restore','还原','btn btn-xs btn-white | fa fa-refresh  bigger-120','/parameter/restore',1,4,NULL,NULL,NULL,1,'0','0',0),
(63,'parameter_recycle_remove','parameter_recycle','remove','彻底删除','btn btn-xs btn-white  btn-danger | fa fa fa-times bigger-120','/parameter/remove',2,4,NULL,NULL,NULL,1,'0','0',1),
(64,'parameter_recycle_back','parameter_recycle','back','返回','btn btn-xs btn-white | fa fa-undo  bigger-120',NULL,3,4,NULL,NULL,NULL,1,'0','0',0),
(65,'druid','system',NULL,'连接池监视','fa-arrows-v','/druid',10,2,NULL,NULL,NULL,1,'0',NULL,1),
(81,'log','system',NULL,'日志管理','fa-tasks',NULL,11,2,NULL,NULL,NULL,1,'0','0',1),
(82,'olog','log',NULL,'操作日志','fa-database','/olog/',1,3,NULL,'olog.html',NULL,1,'0','0',0),
(83,'llog','log',NULL,'登录日志','fa-sign-in','/llog/',2,3,NULL,'llog.html',NULL,1,'0','1',0),
(84,'olog_add','olog','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/olog/add',1,4,NULL,'olog_add.html',NULL,1,'0','0',0),
(85,'olog_edit','olog','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/olog/edit',2,4,NULL,'olog_edit.html',NULL,1,'0','0',0),
(86,'olog_remove','olog','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/olog/remove',3,4,NULL,NULL,NULL,1,'0','0',0),
(87,'olog_view','olog','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/olog/view',4,4,NULL,'olog_view.html',NULL,1,'0','0',0),
(88,'llog_add','llog','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/llog/add',1,4,NULL,'llog_add.html',NULL,1,'0','0',0),
(89,'llog_edit','llog','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/llog/edit',2,4,NULL,'llog_edit.html',NULL,1,'0','0',0),
(90,'llog_remove','llog','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/llog/remove',3,4,NULL,NULL,NULL,1,'0','0',0),
(91,'llog_view','llog','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/llog/view',4,4,NULL,'llog_view.html',NULL,1,'0','0',0),
(92,'office','0',NULL,'工作台','fa fa-desktop',NULL,1,1,NULL,NULL,NULL,1,'0','0',0),
(93,'notice','office',NULL,'通知公告','fa fa-bell','/notice/',1,2,NULL,NULL,NULL,1,'0','0',0),
(94,'notice_add','notice','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/notice/add',1,3,NULL,NULL,'800*500',1,'0','0',1),
(95,'notice_edit','notice','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/notice/edit',2,3,NULL,NULL,'800*500',1,'0','0',0),
(96,'notice_remove','notice','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/notice/remove',3,3,NULL,NULL,NULL,1,'0','0',0),
(97,'notice_view','notice','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/notice/view',4,3,NULL,NULL,'800*500',1,'0','0',0),
(98,'online','system','','在线开发','fa-rocket',NULL,12,2,NULL,NULL,'800*520',1,'0',NULL,1),
(99,'generate','online',NULL,'代码生成','fa-gavel','/generate/',1,3,NULL,NULL,'800*520',1,'0',NULL,1),
(100,'generate_add','generate','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/generate/add',1,4,NULL,NULL,'800*420',1,'0',NULL,3),
(101,'generate_edit','generate','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/generate/edit',2,4,NULL,NULL,'800*420',1,'0',NULL,3),
(102,'generate_remove','generate','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/generate/remove',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(103,'generate_view','generate','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/generate/view',4,4,NULL,NULL,'800*420',1,'0',NULL,3),
(104,'generate_gencode','generate','gencode','代码生成','btn btn-xs btn-white | fa fa-gavel bigger-120','/generate/gencode',5,4,NULL,NULL,'800*520',1,'0',NULL,1),
(105,'blog','office','','博客文章','	btn btn-xs btn-white | fa fa-eye bigger-120','/blog/',2,2,NULL,NULL,'800*520',1,'1',NULL,1),
(106,'blog_add','blog','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/blog/add',1,3,NULL,NULL,'800*520',1,'0',NULL,0),
(107,'blog_edit','blog','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/blog/edit',2,3,NULL,NULL,'800*520',1,'0',NULL,0),
(108,'blog_remove','blog','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/blog/remove',3,3,NULL,NULL,'800*520',1,'0',NULL,0),
(109,'blog_view','blog','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/blog/view',4,3,NULL,NULL,'800*520',1,'0',NULL,0),
(115,'filesmanager','office',NULL,'文件管理','fa-cog',NULL,3,2,NULL,NULL,'800*520',1,'0',NULL,0),
(116,'files','filesmanager',NULL,'我的文件','fa-cog','/files/',1,3,NULL,NULL,'800*520',1,'0',NULL,3),
(117,'files_add','files','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/add',1,4,NULL,NULL,'800*520',1,'0',NULL,2),
(118,'files_edit','files','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/files/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,0),
(119,'files_view','files','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/files/view',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(120,'files_remove','files','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/files/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,0),
(121,'fileslog','filesmanager',NULL,'文件审批','fa-cog','/files/sp',2,3,NULL,NULL,'800*520',1,'0',NULL,1),
(123,'fileshistory','jiekou',NULL,'文件审批记录','fa-cog','/fileslog/',1,4,NULL,NULL,'800*520',1,'0',NULL,3),
(124,'upload','attach',NULL,'文件上传','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/upload',6,3,NULL,NULL,'800*520',1,'0',NULL,0),
(125,'submm','attach',NULL,'文件提交','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/submm',7,3,NULL,NULL,'800*520',1,'0',NULL,0),
(126,'userchoose','jiekou',NULL,'选择可见人','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/user/userchoose',11,3,NULL,NULL,'800*520',1,'0',NULL,1),
(127,'jiekou','system',NULL,'系统接口','btn btn-xs btn-white | fa fa-floppy-o bigger-120',NULL,13,2,NULL,NULL,'800*520',1,'0',NULL,0),
(128,'opinion','jiekou',NULL,'审批意见','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/opinion',1,3,NULL,NULL,'800*520',1,'0',NULL,0),
(129,'subopinion','jiekou',NULL,'审批意见提交','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/subopinion',2,3,NULL,NULL,'800*520',1,'0',NULL,0),
(130,'fileslog','jiekou',NULL,'审批进度','btn btn-xs btn-white|fa fa-floppy-o bigger-120','/files/splog',12,3,NULL,NULL,'800*520',1,'0',NULL,0),
(131,'filesround','office',NULL,'文件传阅','fa-cog','/files/round',4,2,NULL,NULL,'800*520',1,'0',NULL,0),
(132,'casher','bxxt',NULL,'我的报销','fa-cog','/casher/',5,3,NULL,NULL,'800*520',1,'0',NULL,3),
(133,'casher_add','casher','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/casher/add',1,4,NULL,NULL,'800*520',1,'0',NULL,1),
(134,'casher_edit','casher','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/casher/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,1),
(135,'casher_view','casher','view','查看票据','btn btn-xs btn-white | fa fa-eye bigger-120','/casher/view',3,4,NULL,NULL,'800*520',1,'0',NULL,2),
(136,'casher_remove','casher','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/casher/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,1),
(137,'casherdetail','jiekou',NULL,'票据说明','btn btn-xs btn-white | fa fa-eye bigger-120','/casherdetail/',13,3,NULL,NULL,'800*520',1,'0',NULL,0),
(138,'bxxt','office',NULL,'报销系统','fa-cog',NULL,6,2,NULL,NULL,'800*520',1,'0',NULL,0),
(139,'casher_sp','bxxt',NULL,'报销审批','fa-cog','/casher/sp',6,3,NULL,NULL,'800*520',1,'0',NULL,0),
(146,'casher_casherlog','jiekou',NULL,'报销审批记录','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/casher/casherlog',14,3,NULL,NULL,'800*520',1,'0',NULL,0),
(147,'casherlog','jiekou',NULL,'报销审批记录','fa-cog','/casherlog/',15,3,NULL,NULL,'800*520',1,'0',NULL,0),
(148,'casherlog_add','casherlog','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/casherlog/add',1,4,NULL,NULL,'800*520',1,'0',NULL,0),
(149,'casherlog_edit','casherlog','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/casherlog/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,0),
(150,'casherlog_view','casherlog','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/casherlog/view',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(151,'casherlog_remove','casherlog','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/casherlog/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,0),
(152,'roundlog','jiekou',NULL,'文件传阅历史','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/roundlog',16,3,NULL,NULL,'800*520',1,'0',NULL,0),
(153,'roundopinion','jiekou',NULL,'传阅意见','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/roundopinion',17,3,NULL,NULL,'800*520',1,'0',NULL,0),
(154,'reviewround','jiekou',NULL,'提交传阅意见','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/files/reviewround',18,3,NULL,NULL,'800*520',1,'0',NULL,0),
(155,'files_zhixing','filesmanager',NULL,'文件执行','fa-cog','/files/zhixing',3,3,NULL,NULL,'800*520',2,'0',NULL,0),
(156,'files_review','jiekou',NULL,'回复页面','fa-cog','/files/review',19,3,NULL,NULL,'800*520',1,'0',NULL,0),
(157,'fileshistory_add','fileshistory','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/fileslog/add',1,5,NULL,NULL,'800*520',1,'0',NULL,1),
(158,'fileshistory_edit','fileshistory','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/fileslog/edit',2,5,NULL,NULL,'800*520',1,'0',NULL,1),
(159,'fileshistory_view','fileshistory','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/fileslog/view',3,5,NULL,NULL,'800*520',1,'0',NULL,1),
(160,'fileshistory_remove','fileshistory','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/fileslog/remove',4,5,NULL,NULL,'800*520',1,'0',NULL,1),
(161,'unforgot','jiekou',NULL,'备忘录','fa-cog','/unforgot/',20,3,NULL,NULL,'800*520',1,'0',NULL,0),
(162,'unforgot_add','unforgot','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/unforgot/add',1,4,NULL,NULL,'800*520',1,'0',NULL,0),
(163,'unforgot_edit','unforgot','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/unforgot/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,0),
(164,'unforgot_view','unforgot','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/unforgot/view',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(165,'unforgot_remove','unforgot','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/unforgot/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,0),
(166,'carsmanager','office',NULL,'车辆管理','fa-cog',NULL,7,2,NULL,NULL,'800*520',1,'0',NULL,0),
(167,'cars','carsmanager',NULL,'车辆信息','fa-cog','/cars/',1,3,NULL,NULL,'800*520',1,'0',NULL,0),
(168,'carslog','carsmanager',NULL,'派车管理','fa-cog','/carslog/',2,3,NULL,NULL,'800*520',1,'0',NULL,1),
(169,'cars_add','cars','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/cars/add',1,4,NULL,NULL,'800*520',1,'0',NULL,0),
(170,'cars_edit','cars','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/cars/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,0),
(171,'cars_view','cars','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/cars/view',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(172,'cars_remove','cars','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/cars/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,0),
(173,'carslog_add','carslog','add','新增','btn btn-xs btn-white | fa fa-floppy-o bigger-120','/carslog/add',1,4,NULL,NULL,'800*520',1,'0',NULL,0),
(174,'carslog_edit','carslog','edit','修改','btn btn-xs btn-white | fa fa-pencil  bigger-120','/carslog/edit',2,4,NULL,NULL,'800*520',1,'0',NULL,0),
(175,'carslog_view','carslog','view','查看','btn btn-xs btn-white | fa fa-eye bigger-120','/carslog/view',3,4,NULL,NULL,'800*520',1,'0',NULL,0),
(176,'carslog_remove','carslog','remove','删除','btn btn-xs btn-white | fa fa-times  bigger-120','/carslog/remove',4,4,NULL,NULL,'800*520',1,'0',NULL,0);

/*Table structure for table `tfw_operation_log` */

DROP TABLE IF EXISTS `tfw_operation_log`;

CREATE TABLE `tfw_operation_log` (
  `ID` int(65) NOT NULL AUTO_INCREMENT,
  `LOGNAME` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `CLASSNAME` varchar(255) DEFAULT NULL,
  `METHOD` text,
  `CREATETIME` datetime DEFAULT NULL,
  `SUCCEED` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_operation_log` */

insert  into `tfw_operation_log`(`ID`,`LOGNAME`,`USERID`,`CLASSNAME`,`METHOD`,`CREATETIME`,`SUCCEED`,`MESSAGE`) values 
(216,'异常日志','1',NULL,'com.sun.proxy.$Proxy27 cannot be cast to org.springframework.web.multipart.MultipartHttpServletRequest','2016-02-17 16:26:13','0',NULL),
(217,'异常日志','1',NULL,'write javaBean error','2016-02-17 16:43:12','0',NULL),
(218,'异常日志','1',NULL,'-1','2016-02-17 16:57:21','0',NULL),
(219,'异常日志','1',NULL,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_tfw_tzgg (f_dt_fbsj,f_vc_bt,f_it_xl) values (?,?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n\n; SQL []; ORA-01722: 无效数字\n; nested exception is java.sql.SQLSyntaxErrorException: ORA-01722: 无效数字\n','2016-02-18 10:51:46','0',NULL),
(220,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'f_it_xl\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #3 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111','2016-02-18 10:58:01','0',NULL),
(221,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from TMSP_ATTACH where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00942: 表或视图不存在\n','2016-02-18 15:10:05','0',NULL),
(231,'异常日志','1',NULL,'文件不存在!','2016-02-19 08:48:49','0',NULL),
(232,'异常日志','1',NULL,'文件不存在!','2016-02-19 08:49:02','0',NULL),
(233,'异常日志','1',NULL,'文件不存在!','2016-02-19 08:49:39','0',NULL),
(234,'异常日志','1',NULL,'文件不存在!','2016-02-19 08:50:22','0',NULL),
(235,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-19 13:29:00','0',NULL),
(236,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-19 13:29:52','0',NULL),
(237,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'code\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-19 13:33:12','0',NULL),
(238,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n','2016-02-19 13:35:17','0',NULL),
(239,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111','2016-02-19 13:36:31','0',NULL),
(240,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111','2016-02-19 13:37:11','0',NULL),
(241,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'name\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列类型: 1111','2016-02-19 13:40:07','0',NULL),
(242,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n','2016-02-19 13:42:08','0',NULL),
(243,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE \'%新增%\') AND (code LIKE \'%user%\')\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n','2016-02-19 13:48:24','0',NULL),
(244,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT m.*, d.name AS DIC_STATUS FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\')) AND (code LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))) blade_statement\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n','2016-02-19 13:50:40','0',NULL),
(245,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT m.*, d.name AS DIC_STATUS FROM tfw_menu m LEFT JOIN (SELECT num, name FROM tfw_dict WHERE code = 902) d ON m.status = d.num WHERE 1 = 1 AND (name LIKE CONCAT(CONCAT(\'%\', ?), \'%\'))) blade_statement\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00918: 未明确定义列\n','2016-02-19 13:54:35','0',NULL),
(246,'异常日志','1',NULL,'Index: 0, Size: 0','2016-02-19 14:00:39','0',NULL),
(247,'异常日志','1',NULL,'Index: 0, Size: 0','2016-02-19 14:00:41','0',NULL),
(248,'异常日志','1',NULL,'Index: 0, Size: 0','2016-02-19 14:01:13','0',NULL),
(249,'异常日志','1',NULL,'Index: 0, Size: 0','2016-02-19 14:04:21','0',NULL),
(250,'异常日志','1',NULL,'Index: 0, Size: 0','2016-02-19 14:04:58','0',NULL),
(251,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from ( select tmp_page.*, rownum row_id from ( SELECT * FROM (SELECT r.*, d.simpleName DEPTNAME, (SELECT name FROM tfw_role WHERE id = r.pId) PNAME FROM tfw_role r LEFT JOIN tfw_dept d ON r.deptId = d.id) blade_statement WHERE 1 = 1 order by r.id asc ) tmp_page where rownum <= ? ) where row_id > ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"R\".\"ID\": 标识符无效\n','2016-02-19 14:08:19','0',NULL),
(252,'异常日志','21',NULL,'java.sql.SQLIntegrityConstraintViolationException: ORA-00001: 违反唯一约束条件 (TFRAMEWORK.SYS_C0041927)\n','2016-02-19 14:10:58','0',NULL),
(253,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1  where 1=1 and bg.f_it_cjr = ?) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n','2016-02-19 14:14:47','0',NULL),
(254,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1  where 1=1 and bg.f_it_cjr = ?) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n','2016-02-19 14:15:23','0',NULL),
(255,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select            bg.*,          nr.F_TX_BGNR,          u1.name DIC_F_IT_CJR,          u2.name DIC_F_IT_XGR                from           tb_tfw_gzbg bg           left join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl           left join tfw_user u1 on bg.f_it_cjr=u1.id           left join tfw_user u2 on bg.f_it_xgr=u2.id) blade_statement where 1=1 and bg.f_it_cjr = ? where 1=1 ) tmp_count\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n','2016-02-19 14:17:19','0',NULL),
(256,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(*) FROM (SELECT bg.*, nr.F_TX_BGNR, u1.name DIC_F_IT_CJR, u2.name DIC_F_IT_XGR FROM tb_tfw_gzbg bg LEFT JOIN tb_tfw_gzbgnr nr ON bg.f_it_xl = nr.f_it_bgxl LEFT JOIN tfw_user u1 ON bg.f_it_cjr = u1.id LEFT JOIN tfw_user u2 ON bg.f_it_xgr = u2.id) blade_statement WHERE 1 = 1 AND bg.f_it_cjr = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_CJR\": 标识符无效\n','2016-02-19 14:18:34','0',NULL),
(257,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from ( select tmp_page.*, rownum row_id from ( SELECT * FROM (SELECT bg.*, nr.F_TX_BGNR, u1.name DIC_F_IT_CJR, u2.name DIC_F_IT_XGR FROM tb_tfw_gzbg bg LEFT JOIN tb_tfw_gzbgnr nr ON bg.f_it_xl = nr.f_it_bgxl LEFT JOIN tfw_user u1 ON bg.f_it_cjr = u1.id LEFT JOIN tfw_user u2 ON bg.f_it_xgr = u2.id) blade_statement WHERE 1 = 1 AND f_it_cjr = ? order by bg.F_IT_XL desc ) tmp_page where rownum <= ? ) where row_id > ?\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"BG\".\"F_IT_XL\": 标识符无效\n','2016-02-19 14:20:09','0',NULL),
(258,'异常日志','1',NULL,'java.sql.SQLSyntaxErrorException: ORA-00911: 无效字符\n','2016-02-20 14:03:39','0',NULL),
(261,'异常日志','1',NULL,'Required String parameter \'type\' is not present','2016-02-23 14:27:19','0',NULL),
(262,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-02-23 14:27:42','0',NULL),
(263,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-02-23 14:28:13','0',NULL),
(264,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-02-23 14:28:33','0',NULL),
(265,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\r\n### The error may involve SELECT.0\r\n### The error occurred while executing a query\r\n### SQL: \r\n### Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\n; uncategorized SQLException for SQL []; SQL state [99999]; error code [17104]; 要执行的 SQL 语句不得为空白或空值; nested exception is java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值','2016-02-23 14:30:08','0',NULL),
(266,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\r\n### The error may involve SELECT.0\r\n### The error occurred while executing a query\r\n### SQL: \r\n### Cause: java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值\n; uncategorized SQLException for SQL []; SQL state [99999]; error code [17104]; 要执行的 SQL 语句不得为空白或空值; nested exception is java.sql.SQLException: 要执行的 SQL 语句不得为空白或空值','2016-02-23 14:30:35','0',NULL),
(267,'异常日志','1',NULL,'Mapped Statements collection does not contain value for ','2016-02-23 15:27:09','0',NULL),
(268,'异常日志','1',NULL,'Mapped Statements collection does not contain value for ','2016-02-23 15:27:25','0',NULL),
(269,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n','2016-02-23 16:10:49','0',NULL),
(270,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n','2016-02-23 16:10:50','0',NULL),
(271,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n','2016-02-23 16:13:59','0',NULL),
(272,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n','2016-02-23 16:14:03','0',NULL),
(273,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY\": 标识符无效\n','2016-02-23 16:14:06','0',NULL),
(274,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:19:43','0',NULL),
(275,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:19:44','0',NULL),
(276,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:21:50','0',NULL),
(277,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:21:52','0',NULL),
(278,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:23:14','0',NULL),
(279,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:23:33','0',NULL),
(280,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=diy_notice\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"DIY_NOTICE\": 标识符无效\n','2016-02-23 16:24:34','0',NULL),
(281,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:47:44','0',NULL),
(282,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:48:25','0',NULL),
(283,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:49:58','0',NULL),
(284,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equ\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:52:15','0',NULL),
(285,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_equal\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:55:44','0',NULL),
(286,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:57:31','0',NULL),
(287,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:59:17','0',NULL),
(288,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 16:59:38','0',NULL),
(289,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:00:02','0',NULL),
(290,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:00:20','0',NULL),
(291,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:02:13','0',NULL),
(292,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:03:19','0',NULL),
(293,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:03:56','0',NULL),
(294,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:06:42','0',NULL),
(295,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:07:36','0',NULL),
(296,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_VC_BT_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:07:50','0',NULL),
(297,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting null for parameter #1 with JdbcType OTHER . Try setting a different JdbcType for this parameter or a different jdbcTypeForNull configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:11:19','0',NULL),
(298,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:15:33','0',NULL),
(299,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-23 17:15:35','0',NULL),
(300,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:38:32','0',NULL),
(301,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:38:40','0',NULL),
(302,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:38:43','0',NULL),
(303,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:41:40','0',NULL),
(304,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX_2nd\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:41:48','0',NULL),
(305,'异常日志','1',NULL,'Expected one result (or null) to be returned by selectOne(), but found: 2','2016-02-24 08:41:55','0',NULL),
(306,'异常日志','1',NULL,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'F_IT_LX\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: 无效的列索引','2016-02-24 08:43:14','0',NULL),
(307,'异常日志','1',NULL,'Expected one result (or null) to be returned by selectOne(), but found: 2','2016-02-24 08:45:51','0',NULL),
(308,'异常日志','1',NULL,'Expected one result (or null) to be returned by selectOne(), but found: 2','2016-02-24 08:47:36','0',NULL),
(309,'异常日志','1',NULL,'Expected one result (or null) to be returned by selectOne(), but found: 2','2016-02-24 08:53:09','0',NULL),
(310,'异常日志','1',NULL,'Expected one result (or null) to be returned by selectOne(), but found: 2','2016-02-24 08:53:52','0',NULL),
(311,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from tfw_user where userid = 1\r\n### Cause: java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: ORA-00904: \"USERID\": 标识符无效\n','2016-02-24 09:57:54','0',NULL),
(312,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'tframework.tfw_user\' doesn\'t exist','2016-02-24 14:08:54','0',NULL),
(313,'异常日志','1',NULL,'java.lang.IllegalAccessException: Class org.beetl.sql.core.mapping.BeanProcessor can not access a member of class com.tonbusoft.core.toolbox.Maps with modifiers \"private\"','2016-02-24 16:43:38','0',NULL),
(314,'异常日志','1',NULL,'SQL Script Error:>>04:43:48:变量未定义(VAR_NOT_DEFINED):jds 位于1行 资源:auto._gen_select * from tfw_me','2016-02-24 16:43:48','0',NULL),
(315,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\',\'2\',\'3\',\'4\',\'5\',\'6\',\'7\',\'8\',\'9\',\'10\' \nlimit 0 , 5\' at line 1','2016-02-24 16:44:46','0',NULL),
(316,'异常日志','1',NULL,'java.sql.SQLSyntaxErrorException: ORA-00907: 缺失右括号\n','2016-02-24 16:55:09','0',NULL),
(317,'异常日志','1',NULL,'java.lang.InstantiationException','2016-02-25 13:16:46','0',NULL),
(318,'异常日志','1',NULL,'java.lang.InstantiationException','2016-02-25 13:17:33','0',NULL),
(319,'异常日志','1',NULL,'java.lang.InstantiationException','2016-02-25 13:18:37','0',NULL),
(320,'异常日志','1',NULL,'java.lang.IllegalAccessException: Class org.beetl.sql.core.mapping.BeanProcessor can not access a member of class com.tonbusoft.core.toolbox.Maps with modifiers \"private\"','2016-02-25 13:30:23','0',NULL),
(321,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.list]相关的SQL','2016-03-19 11:17:04','0',NULL),
(322,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.list]相关的SQL','2016-03-19 11:23:52','0',NULL),
(324,'异常日志','1',NULL,'在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL','2016-03-19 14:43:28','0',NULL),
(325,'异常日志','1',NULL,'在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL','2016-03-19 15:23:03','0',NULL),
(326,'异常日志','1',NULL,'在 /beetlsql/mysql/reportMapper.sql 和 /beetlsql/mysql/reportMapper.md 和 /beetlsql/reportMapper.sql 和 /beetlsql/reportMapper.md 和  未找到[id=reportMapper.list]相关的SQL','2016-03-21 09:11:45','0',NULL),
(327,'异常日志','1',NULL,'在 /beetlsql/mysql/reportMapper.sql 和 /beetlsql/mysql/reportMapper.md 和 /beetlsql/reportMapper.sql 和 /beetlsql/reportMapper.md 和  未找到[id=reportMapper.list]相关的SQL','2016-03-21 09:16:29','0',NULL),
(328,'异常日志','1',NULL,'SQL Script Error:>>09:17:12:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:17:12','0',NULL),
(329,'异常日志','1',NULL,'SQL Script Error:>>09:18:49:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:18:49','0',NULL),
(330,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3','2016-03-21 09:19:11','0',NULL),
(331,'异常日志','1',NULL,'SQL Script Error:>>09:19:54:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:19:54','0',NULL),
(332,'异常日志','1',NULL,'SQL Script Error:>>09:20:01:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:20:01','0',NULL),
(333,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3','2016-03-21 09:20:49','0',NULL),
(334,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from\r\ntb_tfw_gzbg bg\r\nleft join tb_tfw_gzbgnr nr on bg.f_it_xl=nr.f_it_bgxl\r\nlef\' at line 3','2016-03-21 09:21:40','0',NULL),
(335,'异常日志','1',NULL,'SQL Script Error:>>09:22:12:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:22:12','0',NULL),
(336,'异常日志','1',NULL,'SQL Script Error:>>09:22:21:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:22:21','0',NULL),
(337,'异常日志','1',NULL,'SQL Script Error:>>09:23:25:调用方法抛出了异常(NATIVE_CALL_EXCEPTION):use 位于2行 资源:auto._gen_select * from (selec','2016-03-21 09:23:25','0',NULL),
(338,'异常日志','1',NULL,'java.util.ArrayList cannot be cast to java.util.Map','2016-03-21 09:24:49','0',NULL),
(339,'异常日志','1',NULL,'在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL','2016-03-21 09:30:26','0',NULL),
(340,'异常日志','1',NULL,'在 /beetlsql/mysql/newsMapper.sql 和 /beetlsql/mysql/newsMapper.md 和 /beetlsql/newsMapper.sql 和 /beetlsql/newsMapper.md 和  未找到[id=newsMapper.data]相关的SQL','2016-03-21 09:35:03','0',NULL),
(341,'异常日志','1',NULL,'在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL','2016-03-21 10:57:21','0',NULL),
(342,'异常日志','1',NULL,'在 /beetlsql/mysql/noticeMapper.sql 和 /beetlsql/mysql/noticeMapper.md 和 /beetlsql/noticeMapper.sql 和 /beetlsql/noticeMapper.md 和  未找到[id=noticeMapper.list]相关的SQL','2016-03-21 10:57:45','0',NULL),
(343,'异常日志','1',NULL,'在 /beetlsql/mysql/notice.sql 和 /beetlsql/mysql/notice.md 和 /beetlsql/notice.sql 和 /beetlsql/notice.md 和  未找到[id=notice.list]相关的SQL','2016-03-21 10:58:14','0',NULL),
(344,'异常日志','1',NULL,'删除失败！','2016-03-30 13:35:12','0',NULL),
(345,'异常日志','1',NULL,'删除失败！','2016-03-30 13:35:58','0',NULL),
(346,'异常日志','1',NULL,'未取到ID的值,无法修改!','2016-03-31 08:56:32','0',NULL),
(347,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-01 11:23:21','0',NULL),
(348,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-01 11:30:07','0',NULL),
(349,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-01 12:06:47','0',NULL),
(350,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-01 12:08:32','0',NULL),
(351,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-01 12:19:34','0',NULL),
(352,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-05 08:40:25','0',NULL),
(353,'异常日志','1',NULL,'数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作','2016-04-05 08:40:33','0',NULL),
(354,'异常日志','1',NULL,'com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'F_CR_FBZT\' at row 1','2016-04-07 14:08:08','0',NULL),
(355,'异常日志','1',NULL,'Inject [height] error!','2016-04-07 16:27:32','0',NULL),
(356,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'','2016-04-09 10:07:35','0',NULL),
(357,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-04-09 10:08:46','0',NULL),
(358,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-04-09 10:09:22','0',NULL),
(359,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'','2016-04-09 10:11:16','0',NULL),
(360,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'','2016-04-09 10:11:28','0',NULL),
(361,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select NUM as \"num\",ID as \"id\",PID as \"pId\",NAME as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_DICT where code=dept\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'dept\' in \'where clause\'','2016-04-09 10:11:58','0',NULL),
(362,'异常日志','1',NULL,'Mapped Statements collection does not contain value for 0','2016-04-09 10:12:36','0',NULL),
(363,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 10:37:24','0',NULL),
(364,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 10:37:27','0',NULL),
(365,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-09 10:37:53','0',NULL),
(366,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 10:37:59','0',NULL),
(367,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 10:38:04','0',NULL),
(368,'异常日志','1',NULL,'数据库中此数据不存在，可能数据已经被删除，请刷新数据后在操作','2016-04-09 10:38:18','0',NULL),
(369,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 11:00:13','0',NULL),
(370,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 11:30:54','0',NULL),
(371,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 11:31:16','0',NULL),
(372,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 11:31:34','0',NULL),
(373,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 11:31:46','0',NULL),
(374,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 13:42:14','0',NULL),
(375,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 13:43:06','0',NULL),
(376,'异常日志','1',NULL,'Required String parameter \'where\' is not present','2016-04-09 13:43:20','0',NULL),
(377,'异常日志','1',NULL,'syntax error, expect {, actual int','2016-04-09 13:46:01','0',NULL),
(378,'异常日志','1',NULL,'syntax error, expect {, actual int','2016-04-09 13:46:15','0',NULL),
(379,'异常日志','1',NULL,'syntax error, expect {, actual int','2016-04-09 13:46:25','0',NULL),
(380,'异常日志','1',NULL,'syntax error, expect {, actual EOF','2016-04-09 13:48:11','0',NULL),
(381,'异常日志','1',NULL,'syntax error, expect {, actual EOF','2016-04-09 13:48:26','0',NULL),
(382,'异常日志','1',NULL,'删除失败！','2016-04-11 10:11:36','0',NULL),
(383,'异常日志','1',NULL,'删除失败！','2016-04-11 10:11:48','0',NULL),
(384,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:24:15','0',NULL),
(385,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:24:20','0',NULL),
(386,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:24:59','0',NULL),
(387,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:25:05','0',NULL),
(388,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:27:57','0',NULL),
(389,'异常日志','1',NULL,'Required String parameter \'inter\' is not present','2016-04-12 09:28:12','0',NULL),
(390,'异常日志','1',NULL,'Required String parameter \'intercept\' is not present','2016-04-12 09:30:47','0',NULL),
(391,'异常日志','1',NULL,'Instance class [10] error!','2016-04-12 09:32:45','0',NULL),
(392,'异常日志','1',NULL,'Instance class [] error!','2016-04-12 09:34:03','0',NULL),
(393,'异常日志','1',NULL,'Instance class [] error!','2016-04-12 09:34:36','0',NULL),
(394,'异常日志','1',NULL,'Instance class [] error!','2016-04-12 09:35:52','0',NULL),
(395,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:43:40','0',NULL),
(396,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:44:01','0',NULL),
(397,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:44:11','0',NULL),
(398,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:45:01','0',NULL),
(399,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:49:38','0',NULL),
(400,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-04-12 16:50:08','0',NULL),
(401,'异常日志','1',NULL,'已经有XXXX......','2016-05-07 15:31:01','0',NULL),
(402,'异常日志','1',NULL,'Could not find acceptable representation','2016-05-10 09:35:31','0',NULL),
(403,'异常日志','1',NULL,'Could not find acceptable representation','2016-05-10 09:37:13','0',NULL),
(404,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\'\' at line 1','2016-05-16 14:24:36','0',NULL),
(405,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select r.*,d.simpleName DEPTNAME,(select name from tfw_role where id=r.pId) PNAME from tfw_role r left join tfw_dept d on r.deptId=d.id) blade_statement where 1=1 where id in (1,2,3)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id in (1,2,3)) tmp_count\' at line 1','2016-06-03 08:45:03','0',NULL),
(406,'异常日志','1',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select r.*,d.simpleName DEPTNAME,(select name from tfw_role where id=r.pId) PNAME from tfw_role r left join tfw_dept d on r.deptId=d.id) blade_statement where 1=1 where r.id in (1,2,3)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where r.id in (1,2,3)) tmp_count\' at line 1','2016-06-03 08:46:18','0',NULL),
(407,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1','2016-06-03 09:00:55','0',NULL),
(408,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1','2016-06-03 09:01:16','0',NULL),
(409,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1','2016-06-03 09:01:23','0',NULL),
(410,'异常日志','21',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) from (select * from (select d.*,(select simpleName from tfw_dept  where id=d.pId) PNAME from tfw_dept d) blade_statement where 1=1 and id in (11,)) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')) tmp_count\' at line 1','2016-06-03 09:02:00','0',NULL),
(411,'异常日志','22',NULL,'当前用户无权操作!','2016-06-03 09:34:11','0',NULL),
(412,'异常日志','22',NULL,'\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id \"id\",pId \"pId\",name as \"name\",(case when (pId=0 or pId is null) then \'true\' else \'false\' end) \"open\" from  TFW_ROLE order by pId,num asc and id in (5)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and id in (5)\' at line 1','2016-06-03 09:48:07','0',NULL),
(413,'异常日志','1',NULL,'For input string: \"administrator\"','2016-06-03 15:04:25','0',NULL),
(414,'异常日志','1',NULL,'For input string: \"administrator\"','2016-06-03 15:05:02','0',NULL),
(415,'异常日志','1',NULL,'For input string: \"administrator\"','2016-06-03 15:05:45','0',NULL),
(416,'异常日志','1',NULL,'For input string: \"administrator\"','2016-06-03 15:07:23','0',NULL),
(417,'异常日志','1',NULL,'table \"tb_yw_blog\" not exist','2016-06-12 16:54:39','0',NULL),
(418,'异常日志','1',NULL,'table \"tb_yw_tzgg\" not exist','2016-06-12 16:55:12','0',NULL),
(419,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'id\' in \'where clause\'','2016-06-18 09:54:45','0',NULL),
(420,'异常日志','1',NULL,'Inject [num] error!','2016-09-29 14:27:28','0',NULL),
(421,'异常日志','1',NULL,'Inject [num] error!','2016-09-29 14:29:48','0',NULL),
(422,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-29 15:07:56','0',NULL),
(423,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-29 15:08:02','0',NULL),
(424,'异常日志','1',NULL,'java.lang.reflect.InvocationTargetException','2016-09-30 10:37:54','0',NULL),
(425,'异常日志','1',NULL,'文件不存在!','2016-09-30 10:51:19','0',NULL),
(426,'异常日志','1',NULL,'文件不存在!','2016-09-30 10:53:15','0',NULL),
(427,'异常日志','1',NULL,'java.lang.reflect.InvocationTargetException','2016-09-30 10:56:37','0',NULL),
(428,'异常日志','1',NULL,'java.lang.reflect.InvocationTargetException','2016-09-30 10:59:43','0',NULL),
(429,'异常日志','1',NULL,'java.lang.reflect.InvocationTargetException','2016-09-30 11:00:13','0',NULL),
(430,'异常日志','1',NULL,'java.lang.reflect.InvocationTargetException','2016-09-30 11:00:58','0',NULL),
(431,'异常日志','1',NULL,'文件不存在!','2016-09-30 11:15:43','0',NULL),
(432,'异常日志','1',NULL,'Inject [createtime] error!','2016-09-30 11:27:22','0',NULL),
(433,'异常日志','1',NULL,'Inject [createtime] error!','2016-09-30 11:27:27','0',NULL),
(434,'异常日志','1',NULL,'文件不存在!','2016-09-30 11:29:37','0',NULL),
(435,'异常日志','1',NULL,'文件不存在!','2016-09-30 11:29:44','0',NULL),
(436,'异常日志','1',NULL,'文件不存在!','2016-09-30 14:08:10','0',NULL),
(437,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 14:17:04','0',NULL),
(438,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 14:22:48','0',NULL),
(439,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 14:24:58','0',NULL),
(440,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 14:37:59','0',NULL),
(441,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 14:47:35','0',NULL),
(442,'异常日志','1',NULL,'表单数据版本号和数据库数据版本号不一致，可能数据已经被其他人修改，请重新编辑','2016-09-30 15:45:41','0',NULL),
(445,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:TFW_USER.EMAIL=&TFW_USER.PASSWORD=ab857cd259f2c40b551f448fdf553719&VERSION=4&TFW_USER.BIRTHDAY=2016-09-29 09:27:30.0&TFW_USER.NAME=阿斯顿飞过&jstime=1475907985426&password=ab857cd259f2c40b551f448fdf553719&TFW_USER.SEX=2&token_TFW_USER.DEPTID=&TFW_USER.ID=23&TFW_USER.PHONE=1','2016-10-08 14:26:25','1',NULL),
(446,'删除','1',NULL,'[类名]:com.ikkong.system.controller.OlogController  [方法]:remove  [参数]:ids=444','2016-10-08 14:27:06','1',NULL),
(447,'新增','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:TFW_USER.EMAIL=&TFW_USER.PASSWORD=&TFW_USER.BIRTHDAY=&TFW_USER.ACCOUNT=1&token_TFW_USER.SEX=&TFW_USER.NAME=&jstime=1475908214145&password=&token_TFW_USER.DEPTID=&TFW_USER.PHONE=','2016-10-08 14:30:14','1',NULL),
(448,'删除','1',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:remove  [参数]:ids=1','2016-10-08 15:38:55','1',NULL),
(449,'新增','1',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.pkname=f_it_id&tfw_generate.realpath=E:\\gen&tfw_generate.tablename=tb_tfw_blog&jstime=1475912962932&tfw_generate.name=blog&tfw_generate.modelname=Blog&tfw_generate.packagename=com.ikkong.platform','2016-10-08 15:49:23','1',NULL),
(450,'异常日志','1',NULL,'table \"tb_tfw_blog\" not exist','2016-10-08 15:49:31','0',NULL),
(451,'异常日志','1',NULL,'table \"tb_tfw_blog\" not exist','2016-10-08 15:49:45','0',NULL),
(452,'异常日志','1',NULL,'table \"tb_tfw_blog\" not exist','2016-10-08 15:51:16','0',NULL),
(453,'异常日志','1',NULL,'table \"tb_tfw_blog\" not exist','2016-10-08 15:53:22','0',NULL),
(454,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-bell&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475915788520&tfw_menu.tips=&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:36:29','1',NULL),
(455,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475915951225&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:39:11','1',NULL),
(456,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916429415&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:47:09','1',NULL),
(457,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916488704&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:48:09','1',NULL),
(458,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916548600&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:49:09','1',NULL),
(459,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475916709319&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 16:51:49','1',NULL),
(460,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917286506&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 17:01:27','1',NULL),
(461,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917302779&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 17:01:43','1',NULL),
(462,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa fa-coffee&tfw_menu.url=/blog/&tfw_menu.name=博客文章&tfw_menu.isopen=1&jstime=1475917340295&tfw_menu.tips=800*520&tfw_menu.alias=&tfw_menu.code=blog&tfw_menu.pcode=office&tfw_menu.levels=2&tfw_menu.num=2','2016-10-08 17:02:20','1',NULL),
(463,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.url=/blog/add&tfw_menu.name=新增&tfw_menu.isopen=0&jstime=1475917386491&tfw_menu.tips=800*520&tfw_menu.alias=add&tfw_menu.code=blog_add&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=1','2016-10-08 17:03:06','1',NULL),
(464,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.url=/blog/edit&tfw_menu.name=修改&tfw_menu.isopen=0&jstime=1475917409828&tfw_menu.tips=800*520&tfw_menu.alias=edit&tfw_menu.code=blog_edit&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=2','2016-10-08 17:03:30','1',NULL),
(465,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.url=/blog/remove&tfw_menu.name=删除&tfw_menu.isopen=0&jstime=1475917420518&tfw_menu.tips=800*520&tfw_menu.alias=remove&tfw_menu.code=blog_remove&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=3','2016-10-08 17:03:41','1',NULL),
(466,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.url=/blog/view&tfw_menu.name=查看&tfw_menu.isopen=0&jstime=1475917431191&tfw_menu.tips=800*520&tfw_menu.alias=view&tfw_menu.code=blog_view&tfw_menu.pcode=blog&tfw_menu.levels=3&tfw_menu.num=4','2016-10-08 17:03:51','1',NULL),
(467,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:ids=92,93,94,95,96,97,105,106,107,108,109,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104&roleId=1','2016-10-08 17:04:05','1',NULL),
(468,'新增','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=1&tb_tfw_blog.f_it_content=jfinalblade go&tb_tfw_blog.f_it_title=jfinalblade&jstime=1475918201047&tb_tfw_blog.f_it_createtime=2016-10-08 17:15:45&tb_tfw_blog.f_it_del=1','2016-10-08 17:16:41','1',NULL),
(469,'修改','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475979016098&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1','2016-10-09 10:10:16','1',NULL),
(470,'异常日志','1',NULL,'Inject [VERSION] error!','2016-10-09 10:10:16','0',NULL),
(471,'修改','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475979144831&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1','2016-10-09 10:12:25','1',NULL),
(472,'异常日志','1',NULL,'Inject [VERSION] error!','2016-10-09 10:12:25','0',NULL),
(473,'修改','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=0&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475980484071&tb_tfw_blog.f_it_del=2&tb_tfw_blog.f_it_id=1','2016-10-09 10:34:44','1',NULL),
(474,'修改','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:tb_tfw_blog.version=1&tb_tfw_blog.f_it_seq=1&token_tb_tfw_blog.f_it_createtime=2016-10-08 00:00:00&tb_tfw_blog.f_it_title=jfinalblade&token_tb_tfw_blog.f_it_content=jfinalblade go&jstime=1475980516068&tb_tfw_blog.f_it_del=1&tb_tfw_blog.f_it_id=1','2016-10-09 10:35:16','1',NULL),
(475,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL','2016-10-09 14:18:52','0',NULL),
(476,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL','2016-10-09 14:21:19','0',NULL),
(477,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL','2016-10-09 14:21:43','0',NULL),
(478,'异常日志','1',NULL,'在 /beetlsql/mysql/userMapper.sql 和 /beetlsql/mysql/userMapper.md 和 /beetlsql/userMapper.sql 和 /beetlsql/userMapper.md 和  未找到[id=userMapper.mysqllist]相关的SQL','2016-10-09 14:24:01','0',NULL),
(479,'异常日志','1',NULL,'com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'jblade.tmsp_role\' doesn\'t exist','2016-10-09 14:26:35','0',NULL),
(480,'异常日志','1',NULL,'[Ljava.lang.Object; cannot be cast to [Ljava.lang.String;','2016-10-09 14:32:03','0',NULL),
(481,'异常日志','1',NULL,'[Ljava.lang.Object; cannot be cast to [Ljava.lang.String;','2016-10-09 14:36:01','0',NULL),
(482,'新增','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_title=测试&token_tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">111<br/></p>&jstime=1476086019286&tb_tfw_blog.f_it_createtime=2016-10-10 15:52:52&tb_tfw_blog.f_it_del=1','2016-10-10 15:53:39','1',NULL),
(483,'删除','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:remove  [参数]:ids=2','2016-10-10 15:57:53','1',NULL),
(484,'新增','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">111</p>&tb_tfw_blog.f_it_title=测试&jstime=1476087564124&tb_tfw_blog.f_it_createtime=2016-10-10 16:18:25&tb_tfw_blog.f_it_del=1','2016-10-10 16:19:24','1',NULL),
(485,'修改','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:update  [参数]:token_tb_tfw_blog.f_it_del=1&tb_tfw_blog.version=0&tb_tfw_blog.f_it_seq=2&tb_tfw_blog.f_it_content=<p style=\"text-align: center;\">112</p>&token_tb_tfw_blog.f_it_createtime=2016-10-10 00:00:00&tb_tfw_blog.f_it_title=测试&jstime=1476089895959&tb_tfw_blog.f_it_id=3','2016-10-10 16:58:16','1',NULL),
(486,'新增','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=3&tb_tfw_blog.f_it_content=<p><img src=\"/upload/image/20161010/1476091111051005215.jpg\" style=\"\" title=\"1476091111051005215.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111054037337.jpg\" style=\"\" title=\"1476091111054037337.jpg\"/></p><p><img src=\"/upload/image/20161010/1476091111051097841.jpg\" style=\"\" title=\"1476091111051097841.jpg\"/></p><p><br/></p>&tb_tfw_blog.f_it_title=测试1&jstime=1476091128165&tb_tfw_blog.f_it_createtime=2016-10-10 17:08:41&tb_tfw_blog.f_it_del=1','2016-10-10 17:18:48','1',NULL),
(487,'新增','1',NULL,'[类名]:com.ikkong.platform.controller.BlogController  [方法]:save  [参数]:tb_tfw_blog.f_it_seq=4&tb_tfw_blog.f_it_content=<p><img src=\"http://ikkong.qiniudn.com/upload/image/20161011/1476170956158098341.jpg\" title=\"1476170956158098341\" alt=\"3 (12).jpg\"/></p>&tb_tfw_blog.f_it_title=测试qiniu&jstime=1476170998189&tb_tfw_blog.f_it_createtime=2016-10-11 15:27:53&tb_tfw_blog.f_it_del=1','2016-10-11 15:29:58','1',NULL),
(488,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=4779e4a9903dfb08f9f877791c516a73&TFW_USER.ID=1&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=Tue Sep 08 00:00:00 CST 2015&TFW_USER.PHONE=111111&VERSION=25&TFW_USER.NAME=管理员&jstime=1531705947592&TFW_USER.PASSWORD=4779e4a9903dfb08f9f877791c516a73&TFW_USER.DEPTID=1&TFW_USER.EMAIL=admin@tonbusoft.com.cn','2018-07-16 09:52:28','1',NULL),
(489,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=4779e4a9903dfb08f9f877791c516a73&TFW_USER.ID=1&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-16 09:52:30&TFW_USER.PHONE=111111&VERSION=25&TFW_USER.NAME=管理员&jstime=1531705951839&TFW_USER.PASSWORD=4779e4a9903dfb08f9f877791c516a73&TFW_USER.DEPTID=1&TFW_USER.EMAIL=admin@tonbusoft.com.cn','2018-07-16 09:52:32','1',NULL),
(490,'删除','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:del  [参数]:ids=23','2018-07-16 09:52:49','1',NULL),
(491,'删除','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:remove  [参数]:ids=23','2018-07-16 09:52:53','1',NULL),
(492,'删除','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:del  [参数]:ids=22','2018-07-16 09:53:03','1',NULL),
(493,'删除','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:remove  [参数]:ids=22','2018-07-16 09:53:08','1',NULL),
(494,'删除','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:remove  [参数]:ids=2,3,4,5,6','2018-07-16 09:53:24','1',NULL),
(495,'修改','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=1&tfw_dept.version=2&tfw_dept.fullname=南线路集团公司&tfw_dept.tips=&jstime=1531706029772&tfw_dept.num=0&tfw_dept.simplename=南丝路集团公司','2018-07-16 09:53:50','1',NULL),
(496,'修改','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=7&tfw_dept.version=4&token_tfw_dept.pid=1&tfw_dept.fullname=行政综合部&tfw_dept.tips=&jstime=1531706044085&tfw_dept.num=2&tfw_dept.simplename=行政综合部','2018-07-16 09:54:04','1',NULL),
(497,'修改','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=7&tfw_dept.version=5&tfw_dept.fullname=行政综合部&tfw_dept.tips=&tfw_dept.pid=1&jstime=1531706054997&tfw_dept.num=2&tfw_dept.simplename=行政综合部','2018-07-16 09:54:15','1',NULL),
(498,'删除','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:remove  [参数]:ids=8,9,10,11,12,13','2018-07-16 09:54:21','1',NULL),
(499,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:save  [参数]:tfw_dept.fullname=财务部&tfw_dept.tips=&tfw_dept.pid=1&jstime=1531706071820&tfw_dept.num=3&tfw_dept.simplename=财务部','2018-07-16 09:54:32','1',NULL),
(500,'修改','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=7&tfw_dept.version=6&token_tfw_dept.pid=1&tfw_dept.fullname=领导班子&tfw_dept.tips=&jstime=1531706089253&tfw_dept.num=2&tfw_dept.simplename=领导班子','2018-07-16 09:54:49','1',NULL),
(501,'修改','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=7&tfw_dept.version=7&tfw_dept.fullname=领导班子&tfw_dept.tips=&tfw_dept.pid=1&jstime=1531706094916&tfw_dept.num=2&tfw_dept.simplename=领导班子','2018-07-16 09:54:55','1',NULL),
(502,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:save  [参数]:tfw_dept.fullname=行政综合部&tfw_dept.tips=&tfw_dept.pid=1&jstime=1531706106126&tfw_dept.num=4&tfw_dept.simplename=行政综合部','2018-07-16 09:55:06','1',NULL),
(503,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:save  [参数]:tfw_dept.fullname=总经理&tfw_dept.tips=&tfw_dept.pid=1&jstime=1531707274579&tfw_dept.num=1&tfw_dept.simplename=总经理','2018-07-16 10:14:35','1',NULL),
(504,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=4779e4a9903dfb08f9f877791c516a73&TFW_USER.ID=1&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=Mon Jul 16 09:52:30 CST 2018&TFW_USER.PHONE=111111&VERSION=26&TFW_USER.NAME=系统管理员&jstime=1531707309803&TFW_USER.PASSWORD=4779e4a9903dfb08f9f877791c516a73&TFW_USER.DEPTID=1&TFW_USER.EMAIL=admin@tonbusoft.com.cn','2018-07-16 10:15:10','1',NULL),
(505,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=4779e4a9903dfb08f9f877791c516a73&TFW_USER.ID=1&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-16 10:15:12&TFW_USER.PHONE=111111&VERSION=26&TFW_USER.NAME=系统管理员&jstime=1531707314046&TFW_USER.PASSWORD=4779e4a9903dfb08f9f877791c516a73&TFW_USER.DEPTID=1&TFW_USER.EMAIL=admin@tonbusoft.com.cn','2018-07-16 10:15:14','1',NULL),
(506,'新增','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2011-07-16 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=林总(测)&jstime=1531707364433&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=16&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=linping','2018-07-16 10:16:04','1',NULL),
(507,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.ID=24&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=Sat Jul 16 00:00:00 CST 2011&TFW_USER.PHONE=&VERSION=&TFW_USER.NAME=林总(测试)&jstime=1531707371406&TFW_USER.PASSWORD=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.DEPTID=16&TFW_USER.EMAIL=','2018-07-16 10:16:11','1',NULL),
(508,'修改','1',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.ID=24&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-16 10:16:13&TFW_USER.PHONE=&VERSION=&TFW_USER.NAME=林总(测试)&jstime=1531707373873&TFW_USER.PASSWORD=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.DEPTID=16&TFW_USER.EMAIL=','2018-07-16 10:16:14','1',NULL),
(509,'删除','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:remove  [参数]:ids=5,7','2018-07-16 10:16:38','1',NULL),
(510,'删除','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:remove  [参数]:ids=4','2018-07-16 10:16:43','1',NULL),
(511,'删除','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:remove  [参数]:ids=3','2018-07-16 10:16:48','1',NULL),
(512,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=总经理&tfw_role.deptid=16&tfw_role.num=2&jstime=1531707437446&tfw_role.pid=1&tfw_role.tips=总经理','2018-07-16 10:17:17','1',NULL),
(513,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=领导班子&tfw_role.deptid=7&tfw_role.num=3&jstime=1531707453171&tfw_role.pid=1&tfw_role.tips=领导班子','2018-07-16 10:17:33','1',NULL),
(514,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=员工&tfw_role.deptid=15&tfw_role.num=4&jstime=1531707515604&tfw_role.pid=1&tfw_role.tips=员工','2018-07-16 10:18:36','1',NULL),
(515,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=财务初审&tfw_role.deptid=14&tfw_role.num=4&jstime=1531707547014&tfw_role.pid=1&tfw_role.tips=财务初审','2018-07-16 10:19:07','1',NULL),
(516,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=财务终审&tfw_role.deptid=14&tfw_role.num=5&jstime=1531707569200&tfw_role.pid=1&tfw_role.tips=财务终审','2018-07-16 10:19:29','1',NULL),
(517,'新增','1',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_files&tfw_generate.pkname=id&tfw_generate.realpath=F:\\ikkong-JfinalBlade-master\\JfinalBlade&tfw_generate.name=files&tfw_generate.modelname=Files&jstime=1531707789827&tfw_generate.packagename=com.ikkong.files','2018-07-16 10:23:10','1',NULL),
(518,'新增','1',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_files_log&tfw_generate.pkname=id&tfw_generate.realpath=F:\\ikkong-JfinalBlade-master\\JfinalBlade&tfw_generate.name=fileslog&tfw_generate.modelname=Fileslog&jstime=1531707836443&tfw_generate.packagename=com.ikkong.files','2018-07-16 10:23:56','1',NULL),
(519,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件管理&tfw_menu.url=/files/&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531707934248&tfw_menu.code=files&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-16 10:25:34','1',NULL),
(520,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/files/add&tfw_menu.pcode=files&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1531707941840&tfw_menu.code=files_add&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:25:42','1',NULL),
(521,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/files/edit&tfw_menu.pcode=files&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1531707947166&tfw_menu.code=files_edit&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:25:47','1',NULL),
(522,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/files/edit&tfw_menu.pcode=files&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531707953986&tfw_menu.code=files_edit&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:25:54','1',NULL),
(523,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=查看&tfw_menu.url=/files/edit&tfw_menu.pcode=files&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531707960557&tfw_menu.code=files_edit&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:26:01','1',NULL),
(524,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/files/view&tfw_menu.pcode=files&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531707966033&tfw_menu.code=files_view&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:26:06','1',NULL),
(525,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/files/remove&tfw_menu.pcode=files&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1531707970192&tfw_menu.code=files_remove&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:26:10','1',NULL),
(526,'删除','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:del  [参数]:ids=110,111,112,113,114','2018-07-16 10:27:07','1',NULL),
(527,'删除','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:remove  [参数]:ids=110,111,112,113,114','2018-07-16 10:27:12','1',NULL),
(528,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件管理&tfw_menu.url=&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531708053316&tfw_menu.code=filesmanager&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-16 10:27:33','1',NULL),
(529,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=所有文件&tfw_menu.url=/files/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1531708096755&tfw_menu.code=files&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:28:17','1',NULL),
(530,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/files/add&tfw_menu.pcode=files&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1531708107834&tfw_menu.code=files_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:28:28','1',NULL),
(531,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/files/edit&tfw_menu.pcode=files&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1531708111687&tfw_menu.code=files_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:28:32','1',NULL),
(532,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/files/view&tfw_menu.pcode=files&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1531708119255&tfw_menu.code=files_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:28:39','1',NULL),
(533,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/files/remove&tfw_menu.pcode=files&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1531708125447&tfw_menu.code=files_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:28:45','1',NULL),
(534,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批&tfw_menu.url=/fileslog/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1531708237127&tfw_menu.code=fileslog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 10:30:37','1',NULL),
(535,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批记录&tfw_menu.url=/fileslog/history&tfw_menu.pcode=files&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=5&jstime=1531708308069&tfw_menu.code=fileshistory&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:31:48','1',NULL),
(536,'删除','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:del  [参数]:ids=122','2018-07-16 10:32:01','1',NULL),
(537,'删除','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:remove  [参数]:ids=122','2018-07-16 10:32:06','1',NULL),
(538,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批记录&tfw_menu.url=/fileslog/history&tfw_menu.pcode=fileslog&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1531708347234&tfw_menu.code=fileshistory&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:32:27','1',NULL),
(539,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批记录&tfw_menu.url=/fileslog/history&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=123&tfw_menu.num=1&jstime=1531708420750&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:33:41','1',NULL),
(540,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104','2018-07-16 10:34:26','1',NULL),
(541,'修改','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:update  [参数]:tfw_role.name=领导班子&tfw_role.version=3&token_tfw_role.deptid=7&tfw_role.num=1&jstime=1531708654083&token_tfw_role.pid=1&tfw_role.id=2&tfw_role.tips=admin','2018-07-16 10:37:34','1',NULL),
(542,'修改','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:update  [参数]:tfw_role.name=领导班子&tfw_role.version=3&token_tfw_role.deptid=7&tfw_role.num=1&jstime=1531708656834&token_tfw_role.pid=1&tfw_role.id=2&tfw_role.tips=admin','2018-07-16 10:37:37','1',NULL),
(543,'修改','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:update  [参数]:tfw_role.name=管理员&tfw_role.version=3&token_tfw_role.deptid=7&tfw_role.num=1&jstime=1531708880949&token_tfw_role.pid=1&tfw_role.id=2&tfw_role.tips=admin','2018-07-16 10:41:21','1',NULL),
(544,'修改','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:update  [参数]:tfw_role.name=管理员&tfw_role.version=3&tfw_role.deptid=1&tfw_role.num=1&jstime=1531709030325&token_tfw_role.pid=1&tfw_role.id=2&tfw_role.tips=admin','2018-07-16 10:43:50','1',NULL),
(545,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=起草文件&tfw_menu.url=/files/add&tfw_menu.pcode=files&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=117&tfw_menu.num=1&jstime=1531709817374&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:56:57','1',NULL),
(546,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/files/add&tfw_menu.pcode=files&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=117&tfw_menu.num=1&jstime=1531709830262&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 10:57:10','1',NULL),
(547,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=文件上传&tfw_menu.url=/files/upload&tfw_menu.pcode=attach&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=6&jstime=1531710327601&tfw_menu.code=upload&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 11:05:28','1',NULL),
(548,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104','2018-07-16 11:05:41','1',NULL),
(549,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=103&token_tfw_dict.pid=&jstime=1531710473947&tfw_dict.num=0&tfw_dict.name=文件类型','2018-07-16 11:07:54','1',NULL),
(550,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=103&jstime=1531710574054&tfw_dict.num=1&tfw_dict.name=呈批文&tfw_dict.pid=46','2018-07-16 11:09:34','1',NULL),
(551,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=103&jstime=1531710582312&tfw_dict.num=2&tfw_dict.name=下发文&tfw_dict.pid=46','2018-07-16 11:09:42','1',NULL),
(552,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=公文 描述&nsl_files.copy=杨&nsl_files.visiable=林&nsl_files.type=1&jstime=1531712334978&nsl_files.title_o=“阳光凉山 清廉彝州”党纪法规知识竞答3.docx&nsl_files.num=宁组通[112号]','2018-07-16 11:38:55','1',NULL),
(553,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=	btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=附件管理&tfw_menu.url=/attach/&tfw_menu.pcode=system&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=44&tfw_menu.num=6&jstime=1531712998046&tfw_menu.levels=2&tfw_menu.tips=','2018-07-16 11:49:58','1',NULL),
(554,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=文件提交&tfw_menu.url=/files/submm&tfw_menu.pcode=attach&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=7&jstime=1531713034149&tfw_menu.code=submm&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 11:50:34','1',NULL),
(555,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=附件管理&tfw_menu.url=/attach/&tfw_menu.pcode=system&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=44&tfw_menu.num=6&jstime=1531713038767&tfw_menu.levels=2&tfw_menu.tips=','2018-07-16 11:50:39','1',NULL),
(556,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104','2018-07-16 11:54:49','1',NULL),
(557,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=选择可见人&tfw_menu.url=/user/userchoose&tfw_menu.pcode=user&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=11&jstime=1531727803543&tfw_menu.code=userchoose&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 15:56:44','1',NULL),
(558,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,126,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104','2018-07-16 15:58:44','1',NULL),
(559,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=公文描述&nsl_files.copy=1&nsl_files.visiable=1&nsl_files.type=1&nsl_files.copyman=系统管理员&jstime=1531730777230&nsl_files.title_o=关于南丝路集团无纸化办公OA系统开发的请示.docx&nsl_files.num=宁组通&nsl_files.selectid=系统管理员','2018-07-16 16:46:17','1',NULL),
(560,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=开展规模化集约化蚕桑&nsl_files.copy=1&nsl_files.selectname=林总(测试)&nsl_files.visiable=24&nsl_files.type=1&nsl_files.copyman=系统管理员&jstime=1531731290672&nsl_files.title_o=开展规模化集约化蚕桑_1.docx&nsl_files.num=宁蚕通【2017】3号','2018-07-16 16:54:51','1',NULL),
(561,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&token_tfw_dict.pid=&jstime=1531731481168&tfw_dict.num=0&tfw_dict.name=审阅进度','2018-07-16 16:58:01','1',NULL),
(562,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531731509211&tfw_dict.num=1&tfw_dict.name=文件已提交&tfw_dict.pid=49','2018-07-16 16:58:29','1',NULL),
(563,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531731521240&tfw_dict.num=2&tfw_dict.name=部门领导已审批&tfw_dict.pid=49','2018-07-16 16:58:41','1',NULL),
(564,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531731544792&tfw_dict.num=3&tfw_dict.name=领导班子已审批&tfw_dict.pid=49','2018-07-16 16:59:05','1',NULL),
(565,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531731558821&tfw_dict.num=4&tfw_dict.name=总经理已审批&tfw_dict.pid=49','2018-07-16 16:59:19','1',NULL),
(566,'新增','1',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531731802181&tfw_dict.num=99&tfw_dict.name=未提交&tfw_dict.pid=49','2018-07-16 17:03:22','1',NULL),
(567,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批&tfw_menu.url=/files/sp&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=121&tfw_menu.num=2&jstime=1531732312934&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-16 17:11:53','1',NULL),
(568,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批记录&tfw_menu.url=/fileslog/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=123&tfw_menu.num=1&jstime=1531732321783&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-16 17:12:02','1',NULL),
(569,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=描述&nsl_files.copy=10024&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&nsl_files.type=2&nsl_files.copyman=林总(测试)&jstime=1531733289507&nsl_files.title_o=开展规模化集约化蚕桑_11.docx&nsl_files.num=宁蚕通【2017】3号','2018-07-16 17:28:10','1',NULL),
(570,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=1','2018-07-16 17:30:08','1',NULL),
(571,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=必须要回复&nsl_files.copy=10001&nsl_files.selectname=林总(测试)&nsl_files.visiable=10024&nsl_files.type=1&nsl_files.copyman=系统管理员&jstime=1531787789562&nsl_files.title_o=&nsl_files.num=宁府通【2018】06号','2018-07-17 08:36:30','1',NULL),
(572,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-17 08:47:27&TFW_USER.PHONE=&TFW_USER.NAME=邓远会&jstime=1531788456000&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=dyh','2018-07-17 08:47:36','1',NULL),
(573,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-17 08:47:27&TFW_USER.PHONE=&TFW_USER.NAME=邓远会&jstime=1531788462587&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=dyhui','2018-07-17 08:47:43','1',NULL),
(574,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=系统接口&tfw_menu.url=&tfw_menu.pcode=system&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=13&jstime=1531789198360&tfw_menu.code=jiekou&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-17 08:59:58','1',NULL),
(575,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=审批意见&tfw_menu.url=/files/opinion&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1531789228340&tfw_menu.code=opinion&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-17 09:00:28','1',NULL),
(576,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=审批意见提交&tfw_menu.url=/files/subopinion&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1531789258206&tfw_menu.code=subopinion&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-17 09:00:58','1',NULL),
(577,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,126,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129','2018-07-17 09:01:14','1',NULL),
(578,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531792615429&tfw_dict.num=5&tfw_dict.name=部门领导驳回&tfw_dict.pid=49','2018-07-17 09:56:55','1',NULL),
(579,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531792630298&tfw_dict.num=6&tfw_dict.name=领导班子驳回&tfw_dict.pid=49','2018-07-17 09:57:10','1',NULL),
(580,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1531792641900&tfw_dict.num=7&tfw_dict.name=总经理驳回&tfw_dict.pid=49','2018-07-17 09:57:22','1',NULL),
(581,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=部门领导&tfw_role.deptid=1&tfw_role.num=&jstime=1531792757566&tfw_role.pid=1&tfw_role.tips=部门领导','2018-07-17 09:59:18','1',NULL),
(582,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=部门领导&tfw_role.deptid=1&tfw_role.num=8&jstime=1531792762558&tfw_role.pid=1&tfw_role.tips=部门领导','2018-07-17 09:59:23','1',NULL),
(583,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-17 11:07:36&TFW_USER.PHONE=&TFW_USER.NAME=佘龙宇&jstime=1531796862199&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=shelongyu','2018-07-17 11:07:42','1',NULL),
(584,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10026','2018-07-17 11:10:06','1',NULL),
(585,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=8&id=10024','2018-07-17 11:10:13','1',NULL),
(586,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=13&id=10025','2018-07-17 11:10:20','1',NULL),
(587,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-17 11:10:38&TFW_USER.PHONE=&TFW_USER.NAME=杨碧德&jstime=1531797044347&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=7&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=yangbide','2018-07-17 11:10:44','1',NULL),
(588,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=9&id=10027','2018-07-17 11:10:58','1',NULL),
(589,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,121,123,1,127,128,129','2018-07-17 11:11:33','1',NULL),
(590,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,1,127,128,129','2018-07-17 11:11:59','1',NULL),
(591,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,1,127,128,129','2018-07-17 11:12:43','1',NULL),
(592,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123','2018-07-17 11:13:40','1',NULL),
(593,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123','2018-07-17 11:13:48','1',NULL),
(594,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=选择可见人&tfw_menu.url=/user/userchoose&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=126&tfw_menu.num=11&jstime=1531797854675&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-17 11:24:15','1',NULL),
(595,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,1,127,128,129,126','2018-07-17 11:24:37','1',NULL),
(596,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=调研报告&nsl_files.copy=10026&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=1&nsl_files.copyman=佘龙宇&jstime=1531798118525&nsl_files.title_o=&nsl_files.num=无','2018-07-17 11:28:39','1',NULL),
(597,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=权限测试2&nsl_files.copy=10024&nsl_files.selectname=佘龙宇&nsl_files.visiable=10026&nsl_files.type=1&nsl_files.copyman=林总(测试)&jstime=1531809387520&nsl_files.title_o=&nsl_files.num=权限测试2','2018-07-17 14:36:28','1',NULL),
(598,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=蚕业局11号&nsl_files.copy=10027&nsl_files.selectname=林总(测试)&nsl_files.visiable=10024&nsl_files.type=2&nsl_files.copyman=杨碧德&jstime=1531809502456&nsl_files.title_o=&nsl_files.num=蚕业局【2018】11号','2018-07-17 14:38:22','1',NULL),
(599,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=公文描述&nsl_files.copy=10027&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=2&nsl_files.copyman=杨碧德&jstime=1531809772137&nsl_files.title_o=jfinaloa.sql&nsl_files.num=蚕业局【2018】112号','2018-07-17 14:42:52','1',NULL),
(600,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=7,8','2018-07-17 15:18:00','1',NULL),
(601,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=7','2018-07-17 15:18:23','1',NULL),
(602,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=7','2018-07-17 15:20:10','1',NULL),
(603,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=7','2018-07-17 15:20:16','1',NULL),
(604,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=7','2018-07-17 15:20:32','1',NULL),
(605,'删除','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=5,6,7','2018-07-17 15:20:44','1',NULL),
(606,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=请过目&nsl_files.copy=&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=1&nsl_files.copyman=&jstime=1531812225572&nsl_files.title_o=“阳光凉山 清廉彝州”党纪法规知识竞答4.docx&nsl_files.num=无','2018-07-17 15:23:46','1',NULL),
(607,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=描述&nsl_files.copy=&nsl_files.selectname=林总(测试)&nsl_files.visiable=10024&nsl_files.type=1&nsl_files.copyman=&jstime=1531814360269&nsl_files.title_o=开展规模化集约化蚕桑_12.docx&nsl_files.num=蚕业局【2018】112号','2018-07-17 15:59:20','1',NULL),
(608,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=描述&nsl_files.copy=10025&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=2&nsl_files.copyman=邓远会&jstime=1531814419068&nsl_files.title_o=&nsl_files.num=宁府【2018】9号','2018-07-17 16:00:19','1',NULL),
(609,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=104&tfw_dict.version=0&token_tfw_dict.pid=49&jstime=1531819304227&tfw_dict.num=1&tfw_dict.name=待审核&tfw_dict.id=50','2018-07-17 17:21:44','1',NULL),
(610,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=104&tfw_dict.version=1&jstime=1531819313168&tfw_dict.num=1&tfw_dict.name=待审核&tfw_dict.id=50&tfw_dict.pid=17','2018-07-17 17:21:53','1',NULL),
(611,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white|fa fa-floppy-o bigger-120&tfw_menu.name=审批进度&tfw_menu.url=/files/log&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=12&jstime=1531877505618&tfw_menu.code=/fileslog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-18 09:31:46','1',NULL),
(612,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130','2018-07-18 09:45:52','1',NULL),
(613,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,1,127,128,129,126,130','2018-07-18 09:45:57','1',NULL),
(614,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,1,127,128,129,126,130','2018-07-18 09:46:05','1',NULL),
(615,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,1,127,128,129,126,130','2018-07-18 09:46:10','1',NULL),
(616,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,1,127,128,129,126,130','2018-07-18 09:46:13','1',NULL),
(617,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=1,127,128,129,126,130','2018-07-18 09:46:17','1',NULL),
(618,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=1,127,128,129,126,130','2018-07-18 09:46:20','1',NULL),
(619,'新增','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=公文描述&nsl_files.copy=10027&nsl_files.id=9&nsl_files.selectname=邓远会&nsl_files.visiable=10025,10001,10026&token_nsl_files.type=2&nsl_files.copyman=杨碧德&jstime=1531883694974&nsl_files.title_o=IMG_20180716_175823.jpg&nsl_files.version=&nsl_files.num=蚕业局【2018】112号','2018-07-18 11:14:55','1',NULL),
(620,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=公文描述&nsl_files.copy=10027&nsl_files.id=9&nsl_files.selectname=邓远会&nsl_files.visiable=10025,10001,10026&token_nsl_files.type=2&nsl_files.copyman=杨碧德&jstime=1531883833705&nsl_files.title_o=IMG_20180717_115549.jpg&nsl_files.version=&nsl_files.num=蚕业局【2018】112号','2018-07-18 11:17:14','1',NULL),
(621,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=公文描述&nsl_files.copy=10027&nsl_files.id=9&nsl_files.selectname=邓远会&nsl_files.visiable=10025,10001,10026&nsl_files.type=1&nsl_files.copyman=杨碧德&jstime=1531883850127&nsl_files.title_o=IMG_20180717_115549.jpg&nsl_files.version=&nsl_files.num=蚕业局【2018】112号','2018-07-18 11:17:30','1',NULL),
(622,'删除','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:remove  [参数]:ids=13','2018-07-18 11:17:37','1',NULL),
(623,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=描述&nsl_files.copy=10025&nsl_files.id=12&nsl_files.selectname=杨碧德 杨碧德 佘龙宇 杨碧德&nsl_files.visiable=10027,10027,10026,10027&token_nsl_files.type=2&nsl_files.copyman=邓远会&jstime=1531884187227&nsl_files.title_o=IMG_20180716_1758232.jpg&nsl_files.version=&nsl_files.num=宁府【2018】9号','2018-07-18 11:23:07','1',NULL),
(624,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=描述&nsl_files.copy=10025&nsl_files.id=12&nsl_files.selectname=邓远会&nsl_files.visiable=10025&token_nsl_files.type=2&nsl_files.copyman=邓远会&jstime=1531884200230&nsl_files.title_o=IMG_20180716_1758232.jpg&nsl_files.version=&nsl_files.num=宁府【2018】9号','2018-07-18 11:23:20','1',NULL),
(625,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=尽快审阅&nsl_files.copy=10027&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=1&nsl_files.copyman=杨碧德&jstime=1531969785347&nsl_files.title_o=打造行业高地 复兴南丝绸之路(2)1.doc&nsl_files.num=蚕业局【2018】112号','2018-07-19 11:09:45','1',NULL),
(626,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件传阅&tfw_menu.url=/files/round&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1532307181033&tfw_menu.code=filesround&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-23 08:53:01','1',NULL),
(627,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_casher&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=casher&tfw_generate.modelname=Casher&jstime=1532328766263&tfw_generate.packagename=com.ikkong.casher','2018-07-23 14:52:46','1',NULL),
(628,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_casher_detail&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=casherdetail&tfw_generate.modelname=casherdetail&jstime=1532329055769&tfw_generate.packagename=com.ikkong.casher','2018-07-23 14:57:36','1',NULL),
(629,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销系统&tfw_menu.url=/casher/&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=5&jstime=1532329193250&tfw_menu.code=casher&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-23 14:59:53','1',NULL),
(630,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/casher/add&tfw_menu.pcode=casher&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1532329203486&tfw_menu.code=casher_add&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:00:04','1',NULL),
(631,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/casher/edit&tfw_menu.pcode=casher&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1532329207171&tfw_menu.code=casher_edit&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:00:07','1',NULL),
(632,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/casher/view&tfw_menu.pcode=casher&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1532329214155&tfw_menu.code=casher_view&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:00:14','1',NULL),
(633,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/casher/remove&tfw_menu.pcode=casher&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1532329218311&tfw_menu.code=casher_remove&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:00:18','1',NULL),
(634,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=票据说明&tfw_menu.url=/casherdetail/&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=13&jstime=1532329263999&tfw_menu.code=casherdetail&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:01:04','1',NULL),
(635,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137','2018-07-23 15:01:25','1',NULL),
(636,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:01:39','1',NULL),
(637,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:01:49','1',NULL),
(638,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:02:04','1',NULL),
(639,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:02:17','1',NULL),
(640,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:02:29','1',NULL),
(641,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:02:30','1',NULL),
(642,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:02:35','1',NULL),
(643,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销系统&tfw_menu.url=&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=6&jstime=1532329578032&tfw_menu.code=bxxt&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-23 15:06:18','1',NULL),
(644,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销系统&tfw_menu.url=/casher/&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=132&tfw_menu.num=5&jstime=1532329585256&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-23 15:06:25','1',NULL),
(645,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/casher/add&tfw_menu.pcode=casher&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=133&tfw_menu.num=1&jstime=1532329599271&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-23 15:06:39','1',NULL),
(646,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/casher/edit&tfw_menu.pcode=casher&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=134&tfw_menu.num=2&jstime=1532329602773&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-23 15:06:43','1',NULL),
(647,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/casher/view&tfw_menu.pcode=casher&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=135&tfw_menu.num=3&jstime=1532329606535&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-23 15:06:47','1',NULL),
(648,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/casher/remove&tfw_menu.pcode=casher&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=136&tfw_menu.num=4&jstime=1532329610590&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-23 15:06:51','1',NULL),
(649,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137','2018-07-23 15:07:41','1',NULL),
(650,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=2&ids=92,93,94,95,96,97,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102','2018-07-23 15:07:50','1',NULL),
(651,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:07:54','1',NULL),
(652,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:07:58','1',NULL),
(653,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:08:04','1',NULL),
(654,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:08:08','1',NULL),
(655,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:08:12','1',NULL),
(656,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137','2018-07-23 15:08:15','1',NULL),
(657,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销系统&tfw_menu.url=/casher/&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=132&tfw_menu.num=5&jstime=1532329743682&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:09:04','1',NULL),
(658,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=我的报销&tfw_menu.url=/casher/&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=2&tfw_menu.id=132&tfw_menu.num=5&jstime=1532329768838&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:09:29','1',NULL),
(659,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=105&token_tfw_dict.pid=&jstime=1532329977628&tfw_dict.num=0&tfw_dict.name=报销类型','2018-07-23 15:12:58','1',NULL),
(660,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=105&jstime=1532329985838&tfw_dict.num=1&tfw_dict.name=差旅报销&tfw_dict.pid=58','2018-07-23 15:13:06','1',NULL),
(661,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=105&jstime=1532330031765&tfw_dict.num=2&tfw_dict.name=费用报销&tfw_dict.pid=58','2018-07-23 15:13:52','1',NULL),
(662,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=西昌开经信委的会&nsl_casher.num=5&nsl_casher.type=1&nsl_casher.title=西昌出差&nsl_casher.start=2018-07-23 15:16:20&nsl_casher.over=2018-07-28 00:00:00&jstime=1532330203874','2018-07-23 15:16:44','1',NULL),
(663,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=西昌开经信委的会&nsl_casher.num=3&nsl_casher.imgs=534617659926325831.jpg,5346176599263258311.jpg,12.png&nsl_casher.type=1&nsl_casher.title=西昌出差&nsl_casher.start=2018-07-09 00:00:00&nsl_casher.over=2018-07-19 00:00:00&jstime=1532330656138','2018-07-23 15:24:16','1',NULL),
(664,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DeptController  [方法]:update  [参数]:tfw_dept.id=1&tfw_dept.version=3&tfw_dept.fullname=南丝路集团公司&tfw_dept.tips=&jstime=1532332046290&tfw_dept.num=0&tfw_dept.simplename=南丝路集团公司','2018-07-23 15:47:26','1',NULL),
(665,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&token_tfw_dict.pid=&jstime=1532332091951&tfw_dict.num=0&tfw_dict.name=报销流程','2018-07-23 15:48:12','1',NULL),
(666,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332112284&tfw_dict.num=1&tfw_dict.name=已填表&tfw_dict.pid=61','2018-07-23 15:48:32','1',NULL),
(667,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332125328&tfw_dict.num=2&tfw_dict.name=部门领导已审批&tfw_dict.pid=61','2018-07-23 15:48:45','1',NULL),
(668,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332132081&tfw_dict.num=3&tfw_dict.name=财务已初审&tfw_dict.pid=61','2018-07-23 15:48:52','1',NULL),
(669,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332140649&tfw_dict.num=4&tfw_dict.name=领导班子已审批&tfw_dict.pid=61','2018-07-23 15:49:01','1',NULL),
(670,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332147734&tfw_dict.num=5&tfw_dict.name=总经理已审批&tfw_dict.pid=61','2018-07-23 15:49:08','1',NULL),
(671,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332160659&tfw_dict.num=6&tfw_dict.name=财务已复审&tfw_dict.pid=61','2018-07-23 15:49:21','1',NULL),
(672,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532332167935&tfw_dict.num=7&tfw_dict.name=已打款&tfw_dict.pid=61','2018-07-23 15:49:28','1',NULL),
(673,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销审批&tfw_menu.url=/casher/sp&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=6&jstime=1532332380142&tfw_menu.code=casher_sp&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-23 15:53:00','1',NULL),
(674,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137','2018-07-23 16:01:04','1',NULL),
(675,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:11','1',NULL),
(676,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:15','1',NULL),
(677,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:24','1',NULL),
(678,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:24','1',NULL),
(679,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:29','1',NULL),
(680,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137','2018-07-23 16:01:33','1',NULL),
(681,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_casher_log&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=casherlog&tfw_generate.modelname=Casherlog&jstime=1532334448716&tfw_generate.packagename=com.ikkong.casher','2018-07-23 16:27:29','1',NULL),
(682,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-24 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=沈志明&jstime=1532394199336&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=szming','2018-07-24 09:03:19','1',NULL),
(683,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10028','2018-07-24 09:03:43','1',NULL),
(684,'新增','10028',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=买器材&nsl_casher.num=1&nsl_casher.imgs=三差共育室管理1.xls&nsl_casher.type=2&nsl_casher.title=三差共育室管理费用报销&nsl_casher.start=2018-07-24 09:45:33&nsl_casher.over=2018-07-24 09:45:34&jstime=1532396735712','2018-07-24 09:45:36','1',NULL),
(685,'修改','10026',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:nsl_casher.version=&nsl_casher.cause=西昌开经信委的会&nsl_casher.num=5&nsl_casher.id=1&nsl_casher.title=差旅&token_nsl_casher.over=2018-07-28 00:00:00&nsl_casher.opinion=无&token_nsl_casher.start=2018-07-23 15:16:20&jstime=1532397404348&token_nsl_casher.type=1','2018-07-24 09:56:44','1',NULL),
(686,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看票据&tfw_menu.url=/casher/view&tfw_menu.pcode=casher&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=135&tfw_menu.num=3&jstime=1532399272767&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-24 10:27:53','1',NULL),
(687,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,135,136,1,127,128,129,126,130,137','2018-07-24 11:08:28','1',NULL),
(688,'新增','10026',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=参加比赛&nsl_casher.num=3&nsl_casher.imgs=lct1.png&nsl_casher.type=2&nsl_casher.title=费用报销&nsl_casher.start=2018-07-24 00:00:00&nsl_casher.over=2018-07-24 00:00:00&jstime=1532402986238','2018-07-24 11:29:46','1',NULL),
(689,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_goods&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=goods&tfw_generate.modelname=Goods&jstime=1532482050416&tfw_generate.packagename=com.ikkong.goods','2018-07-25 09:27:30','1',NULL),
(690,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_goods_log&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=goods&tfw_generate.modelname=Goodslog&jstime=1532482076188&tfw_generate.packagename=com.ikkong.goods','2018-07-25 09:27:56','1',NULL),
(691,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_goods_splog&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=goods&tfw_generate.modelname=Goodssplog&jstime=1532482110092&tfw_generate.packagename=com.ikkong.goods','2018-07-25 09:28:30','1',NULL),
(692,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483176436&tfw_dict.num=8&tfw_dict.name=部门领导驳回&tfw_dict.pid=61','2018-07-25 09:46:16','1',NULL),
(693,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483191087&tfw_dict.num=9&tfw_dict.name=财务初审不通过&tfw_dict.pid=61','2018-07-25 09:46:31','1',NULL),
(694,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483202645&tfw_dict.num=10&tfw_dict.name=领导班子驳回&tfw_dict.pid=61','2018-07-25 09:46:43','1',NULL),
(695,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483216376&tfw_dict.num=11&tfw_dict.name=总经理驳回&tfw_dict.pid=61','2018-07-25 09:46:56','1',NULL),
(696,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483239875&tfw_dict.num=12&tfw_dict.name=财务复核不通过&tfw_dict.pid=61','2018-07-25 09:47:20','1',NULL),
(697,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=106&jstime=1532483252260&tfw_dict.num=13&tfw_dict.name=放款失败&tfw_dict.pid=61','2018-07-25 09:47:32','1',NULL),
(698,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=报销审批记录&tfw_menu.url=/casher/casherlog&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=14&jstime=1532484834627&tfw_menu.code=casherlog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 10:13:55','1',NULL),
(699,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,140','2018-07-25 10:14:23','1',NULL),
(700,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,135,136,1,127,128,129,126,130,137,140','2018-07-25 10:14:31','1',NULL),
(701,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,140','2018-07-25 10:14:40','1',NULL),
(702,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,140','2018-07-25 10:14:44','1',NULL),
(703,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,140','2018-07-25 10:14:47','1',NULL),
(704,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,140','2018-07-25 10:14:51','1',NULL),
(705,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,140','2018-07-25 10:14:54','1',NULL),
(706,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销审批记录&tfw_menu.url=/casherlog/&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=7&jstime=1532485012684&tfw_menu.code=casherlogs&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 10:16:53','1',NULL),
(707,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/casherlogs/add&tfw_menu.pcode=casherlogs&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1532485021684&tfw_menu.code=casherlogs_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:17:02','1',NULL),
(708,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/casherlogs/edit&tfw_menu.pcode=casherlogs&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1532485026738&tfw_menu.code=casherlogs_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:17:07','1',NULL),
(709,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/casherlogs/view&tfw_menu.pcode=casherlogs&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1532485031099&tfw_menu.code=casherlogs_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:17:11','1',NULL),
(710,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/casherlogs/remove&tfw_menu.pcode=casherlogs&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1532485036092&tfw_menu.code=casherlogs_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:17:16','1',NULL),
(711,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,141,142,143,144,145,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,140','2018-07-25 10:17:24','1',NULL),
(712,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:17:34','1',NULL),
(713,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=报销审批记录&tfw_menu.url=/casherlog/&tfw_menu.pcode=bxxt&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=141&tfw_menu.num=7&jstime=1532485073937&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 10:17:54','1',NULL),
(714,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:18:04','1',NULL),
(715,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:18:08','1',NULL),
(716,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:18:12','1',NULL),
(717,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:18:17','1',NULL),
(718,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,134,135,136,139,141,142,143,144,145,1,127,128,129,126,130,137,140','2018-07-25 10:26:20','1',NULL),
(719,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130','2018-07-25 10:32:32','1',NULL),
(720,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137','2018-07-25 10:32:35','1',NULL),
(721,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=报销审批记录&tfw_menu.url=/casher/casherlog&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=14&jstime=1532486006446&tfw_menu.code=casher_casherlog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 10:33:26','1',NULL),
(722,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=报销审批记录&tfw_menu.url=/casherlog/&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=15&jstime=1532486073198&tfw_menu.code=casherlog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 10:34:33','1',NULL),
(723,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/casherlog/add&tfw_menu.pcode=casherlog&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1532486086498&tfw_menu.code=casherlog_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:34:47','1',NULL),
(724,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/casherlog/edit&tfw_menu.pcode=casherlog&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1532486091862&tfw_menu.code=casherlog_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:34:52','1',NULL),
(725,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/casherlog/view&tfw_menu.pcode=casherlog&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1532486095784&tfw_menu.code=casherlog_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:34:56','1',NULL),
(726,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/casherlog/remove&tfw_menu.pcode=casherlog&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1532486101379&tfw_menu.code=casherlog_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-25 10:35:01','1',NULL),
(727,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:08','1',NULL),
(728,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=2&ids=92,93,94,95,96,97,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:15','1',NULL),
(729,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:18','1',NULL),
(730,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:25','1',NULL),
(731,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:29','1',NULL),
(732,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:34','1',NULL),
(733,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:39','1',NULL),
(734,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 10:35:43','1',NULL),
(735,'新增','10027',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=11&nsl_casher.num=1&nsl_casher.imgs=p1.png&nsl_casher.type=1&nsl_casher.title=111&nsl_casher.start=2018-07-17&nsl_casher.over=2018-07-27&jstime=1532490593755','2018-07-25 11:49:54','1',NULL),
(736,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=详细说明&nsl_casher.num=3&nsl_casher.imgs=浙江省凯喜雅国际股份有限公司考察宁南县蚕桑产业3.doc&nsl_casher.type=2&nsl_casher.title=佘龙宇的接待浙江客户费用&nsl_casher.start=2018-07-25&nsl_casher.over=2018-07-25&jstime=1532500780920','2018-07-25 14:39:41','1',NULL),
(737,'新增','10027',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=差旅&nsl_casher.num=2&nsl_casher.imgs=p2.png&nsl_casher.type=1&nsl_casher.title=杨碧德的报销&nsl_casher.start=2018-07-25&nsl_casher.over=2018-07-25&jstime=1532500852179','2018-07-25 14:40:52','1',NULL),
(738,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 14:46:24','1',NULL),
(739,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-25 14:58:18&TFW_USER.PHONE=&TFW_USER.NAME=吴灼阳&jstime=1532501914066&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=14&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=wuzhuoyang','2018-07-25 14:58:34','1',NULL),
(740,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=11&id=10029','2018-07-25 14:58:43','1',NULL),
(741,'新增','10026',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=test&nsl_casher.num=1&nsl_casher.imgs=查看大蚕饲养情况.jpg&nsl_casher.type=1&nsl_casher.title=test0725&nsl_casher.start=2018-07-25&nsl_casher.over=2018-07-25&jstime=1532504725827','2018-07-25 15:45:26','1',NULL),
(742,'新增','10025',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=下乡&nsl_casher.num=1&nsl_casher.imgs=1.jpg&nsl_casher.type=2&nsl_casher.title=部门领导报销测试&nsl_casher.start=2018-07-25&nsl_casher.over=2018-07-25&jstime=1532504888599','2018-07-25 15:48:09','1',NULL),
(743,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,94,95,96,97,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:56:06','1',NULL),
(744,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:56:14','1',NULL),
(745,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:56:47','1',NULL),
(746,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,94,95,96,97,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:56:59','1',NULL),
(747,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:57:09','1',NULL),
(748,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:57:16','1',NULL),
(749,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:57:20','1',NULL),
(750,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151','2018-07-25 15:57:28','1',NULL),
(751,'修改','10027',NULL,'[类名]:com.ikkong.platform.controller.NoticeController  [方法]:update  [参数]:TB_TFW_TZGG.VERSION=0&token_TB_TFW_TZGG.F_DT_FBSJ=2016-09-30 00:00:00&TB_TFW_TZGG.F_IT_XL=3&jstime=1532506960816&TB_TFW_TZGG.F_VC_BT=请茧站做好卫生工作,迎接正夏季收茧工作&token_TB_TFW_TZGG.F_TX_NR=<img src=\"/kindeditor/renderFile/304\" title=\"304\" alt=\"304\" /><img src=\"/kindeditor/renderFile/305\" title=\"305\" alt=\"305\" /><img src=\"/kindeditor/renderFile/306\" title=\"306\" alt=\"306\" />&token_TB_TFW_TZGG.F_IT_LX=1','2018-07-25 16:22:41','1',NULL),
(752,'修改','10027',NULL,'[类名]:com.ikkong.platform.controller.NoticeController  [方法]:update  [参数]:TB_TFW_TZGG.VERSION=0&token_TB_TFW_TZGG.F_DT_FBSJ=2016-09-30 00:00:00&TB_TFW_TZGG.F_IT_XL=2&jstime=1532506984765&TB_TFW_TZGG.F_VC_BT=南丝路党支部8月月会通知&token_TB_TFW_TZGG.F_TX_NR=<p>\r\n	啊啊啊\r\n</p>\r\n<p>\r\n	<img src=\"/kindeditor/renderFile/303\" title=\"303\" alt=\"303\" /> \r\n</p>&token_TB_TFW_TZGG.F_IT_LX=10','2018-07-25 16:23:05','1',NULL),
(753,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=文件传阅历史&tfw_menu.url=/files/roundlog&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=16&jstime=1532510345181&tfw_menu.code=roundlog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-25 17:19:05','1',NULL),
(754,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:20','1',NULL),
(755,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=2&ids=92,93,94,95,96,97,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:23','1',NULL),
(756,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:27','1',NULL),
(757,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:32','1',NULL),
(758,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:35','1',NULL),
(759,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:39','1',NULL),
(760,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:42','1',NULL),
(761,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152','2018-07-25 17:19:47','1',NULL),
(762,'新增','10027',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=文件文件文件&nsl_files.copy=10001,10025,10024,10026,10028,10029,10027&nsl_files.selectname=系统管理员 邓远会 林总(测试) 佘龙宇 沈志明 吴灼阳 杨碧德&nsl_files.visiable=10001,10025,10024,10026,10028,10029,10027&nsl_files.type=1&nsl_files.copyman=系统管理员 邓远会 林总(测试) 佘龙宇 沈志明 吴灼阳 杨碧德&nsl_files.round=1&jstime=1532510963360&nsl_files.title_o=p3.png&nsl_files.num=121312','2018-07-25 17:29:23','1',NULL),
(763,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=合同管理文件,请留下建设性意见&nsl_files.copy=&nsl_files.selectname=林总(测试) 邓远会 沈志明 杨碧德 吴灼阳&nsl_files.visiable=10024,10025,10028,10027,10029&nsl_files.type=2&nsl_files.copyman=&nsl_files.round=1&jstime=1532566329917&nsl_files.title_o=291422944585069082.jpg&nsl_files.num=合同管理文件','2018-07-26 08:52:10','1',NULL),
(764,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=传阅意见&tfw_menu.url=/files/roundopinion&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=17&jstime=1532566926964&tfw_menu.code=roundopinion&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-26 09:02:07','1',NULL),
(765,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=提交传阅意见&tfw_menu.url=/files/reviewround&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=18&jstime=1532566967006&tfw_menu.code=reviewround&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-26 09:02:47','1',NULL),
(766,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:02:54','1',NULL),
(767,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=2&ids=92,93,94,95,96,97,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:02:59','1',NULL),
(768,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:03','1',NULL),
(769,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:07','1',NULL),
(770,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:11','1',NULL),
(771,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:15','1',NULL),
(772,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:19','1',NULL),
(773,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 09:03:23','1',NULL),
(774,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=审批文件&tfw_menu.url=/files/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=116&tfw_menu.num=1&jstime=1532568348320&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-26 09:25:48','1',NULL),
(775,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=8月1日前交&nsl_files.copy=&nsl_files.selectname=邓远会 林总(测试) 佘龙宇 沈志明 吴灼阳 杨碧德&nsl_files.visiable=10025,10024,10026,10028,10029,10027&nsl_files.type=1&nsl_files.copyman=&nsl_files.round=1&jstime=1532571519616&nsl_files.title_o=827478929104920348.jpg&nsl_files.num=123123','2018-07-26 10:18:40','1',NULL),
(776,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件报审&tfw_menu.url=/files/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=1&tfw_menu.id=116&tfw_menu.num=1&jstime=1532572774052&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-26 10:39:34','1',NULL),
(778,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-26 11:18:58&TFW_USER.PHONE=&TFW_USER.NAME=李轩&jstime=1532575145018&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=lixuan','2018-07-26 11:19:05','1',NULL),
(779,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-26 11:19:28&TFW_USER.PHONE=&TFW_USER.NAME=邹明月&jstime=1532575175074&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=zoumingyue','2018-07-26 11:19:35','1',NULL),
(780,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-28 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=杨红&jstime=1532575196494&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=yanghong','2018-07-26 11:19:57','1',NULL),
(781,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=2&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=吴宁艳&jstime=1532575231026&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=wuningyan','2018-07-26 11:20:31','1',NULL),
(782,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=徐泽宾&jstime=1532575268348&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=xuzebin','2018-07-26 11:21:08','1',NULL),
(783,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=龙宗筱&jstime=1532575299829&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=longzongxiao','2018-07-26 11:21:40','1',NULL),
(784,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=龙宗筱&jstime=1532575311543&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=longzongxiao','2018-07-26 11:21:52','1',NULL),
(785,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=龙宗筱&jstime=1532575319412&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=longzongxiao','2018-07-26 11:21:59','1',NULL),
(786,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.ID=10024&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=Mon Jul 16 10:16:13 CST 2018&TFW_USER.PHONE=&VERSION=1&TFW_USER.NAME=林平&jstime=1532575344728&TFW_USER.PASSWORD=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.DEPTID=16&TFW_USER.EMAIL=','2018-07-26 11:22:25','1',NULL),
(787,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:update  [参数]:password=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.ID=10024&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=1900-10-16 13:00:00&TFW_USER.PHONE=&VERSION=1&TFW_USER.NAME=林平&jstime=1532575347845&TFW_USER.PASSWORD=60b12a1574e7962d23e75ab75fa4dee9&TFW_USER.DEPTID=16&TFW_USER.EMAIL=','2018-07-26 11:22:28','1',NULL),
(788,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=龙宗筱&jstime=1532575420801&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=15&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=longzongxiao','2018-07-26 11:23:41','1',NULL),
(789,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10030','2018-07-26 11:24:11','1',NULL),
(790,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10035','2018-07-26 11:24:15','1',NULL),
(791,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10033','2018-07-26 11:24:22','1',NULL),
(792,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10034','2018-07-26 11:24:27','1',NULL),
(793,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10032','2018-07-26 11:24:34','1',NULL),
(794,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=10&id=10031','2018-07-26 11:24:42','1',NULL),
(795,'新增','10031',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=党会记录&nsl_files.copy=10026&nsl_files.selectname=邓远会&nsl_files.visiable=10025&nsl_files.type=1&nsl_files.copyman=佘龙宇&nsl_files.round=0&jstime=1532576148278&nsl_files.title_o=工作简报.docx&nsl_files.num=123456','2018-07-26 11:36:22','1',NULL),
(802,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10024&nsl_files.id=11&nsl_files.copyman= 林平','2018-07-26 16:11:49','1',NULL),
(803,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10035&nsl_files.id=14&nsl_files.copyman= 龙宗筱','2018-07-26 16:12:49','1',NULL),
(804,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10025&nsl_files.id=17&nsl_files.copyman= 邓远会','2018-07-26 16:14:26','1',NULL),
(805,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10025&nsl_files.id=13&nsl_files.copyman= 邓远会','2018-07-26 16:15:13','1',NULL),
(806,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10025&nsl_files.id=13&nsl_files.copyman= 邓远会','2018-07-26 16:15:53','1',NULL),
(807,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10026&nsl_files.id=14&nsl_files.copyman= 佘龙宇','2018-07-26 16:16:04','1',NULL),
(808,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10025&nsl_files.id=3&nsl_files.copyman= 邓远会','2018-07-26 16:17:33','1',NULL),
(809,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件执行&tfw_menu.url=/files/zhixing&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1532593750136&tfw_menu.code=files_zhixing&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-26 16:29:10','1',NULL),
(810,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 16:36:20','1',NULL),
(811,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,155,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 16:36:27','1',NULL),
(812,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 16:36:31','1',NULL),
(813,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154','2018-07-26 16:36:44','1',NULL),
(814,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10026&nsl_files.id=14&nsl_files.copyman= 佘龙宇','2018-07-26 16:37:30','1',NULL),
(815,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1532594583678&tfw_dict.num=8&tfw_dict.name=已选择执行人&tfw_dict.pid=49','2018-07-26 16:43:04','1',NULL),
(816,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1532594599117&tfw_dict.num=9&tfw_dict.name=已完成&tfw_dict.pid=49','2018-07-26 16:43:19','1',NULL),
(817,'删除','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:remove  [参数]:ids=76','2018-07-26 16:44:21','1',NULL),
(818,'删除','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:remove  [参数]:ids=76','2018-07-26 16:44:22','1',NULL),
(819,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1532594699744&tfw_dict.num=9&tfw_dict.name=执行人已接收&tfw_dict.pid=49','2018-07-26 16:45:00','1',NULL),
(820,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=104&jstime=1532594709705&tfw_dict.num=10&tfw_dict.name=已完成&tfw_dict.pid=49','2018-07-26 16:45:10','1',NULL),
(821,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.copy=10026&nsl_files.id=14&nsl_files.status=8&nsl_files.copyman= 佘龙宇','2018-07-26 16:52:55','1',NULL),
(822,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=戚华&jstime=1532596022769&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=7&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=qihua','2018-07-26 17:07:03','1',NULL),
(823,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:save  [参数]:password=111111&TFW_USER.SEX=1&TFW_USER.BIRTHDAY=2018-07-26 00:00:00&TFW_USER.PHONE=&TFW_USER.NAME=李兴盛&jstime=1532596049551&TFW_USER.PASSWORD=111111&TFW_USER.DEPTID=7&TFW_USER.EMAIL=&TFW_USER.ACCOUNT=lixingsheng','2018-07-26 17:07:30','1',NULL),
(824,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=9&id=10036','2018-07-26 17:08:00','1',NULL),
(825,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.UserController  [方法]:saveRole  [参数]:roleIds=9&id=10037','2018-07-26 17:08:13','1',NULL),
(826,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=请各单位反馈&nsl_files.copy=&nsl_files.selectname=系统管理员 李兴盛 戚华 杨碧德 吴灼阳 邓远会 李轩 龙宗筱 佘龙宇 沈志明 吴宁艳 徐泽宾 杨红 邹明月 林平&nsl_files.visiable=10001,10037,10036,10027,10029,10025,10030,10035,10026,10028,10033,10034,10032,10031,10024&nsl_files.type=2&nsl_files.copyman=&nsl_files.round=1&jstime=1532596859074&nsl_files.title_o=浙江省凯喜雅国际股份有限公司考察宁南县蚕桑产业4.doc&nsl_files.num=宁蚕办[2018]11号','2018-07-26 17:20:59','1',NULL),
(827,'新增','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=李轩&nsl_files.visiable=10030&token_nsl_files.type=&nsl_files.round=0&jstime=1532677238735&nsl_files.title_o=java时间处理(全)2.doc&nsl_files.num=','2018-07-27 15:40:39','1',NULL),
(828,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:mode=addman&nsl_files.copy=10026&nsl_files.id=4&nsl_files.copyman= 佘龙宇','2018-07-27 16:25:12','1',NULL),
(829,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_files_vislog&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=filesvislog&tfw_generate.modelname=Filesvislog&jstime=1532680570563&tfw_generate.packagename=com.ikkong.files','2018-07-27 16:36:11','1',NULL),
(831,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=4&mode=addman&addids=10026&addname= 佘龙宇','2018-07-27 16:44:13','1',NULL),
(833,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=戚华 杨碧德 吴灼阳&nsl_files.visiable=10036,10027,10029&token_nsl_files.type=&nsl_files.round=0&jstime=1532683063289&nsl_files.title_o=&nsl_files.num=','2018-07-27 17:17:43','1',NULL),
(834,'新增','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=21312&nsl_files.selectname=戚华&nsl_files.visiable=10036&nsl_files.type=1&nsl_files.round=0&jstime=1532683449552&nsl_files.title_o=浙江省凯喜雅国际股份有限公司考察宁南县蚕桑产业5.doc&nsl_files.num=123','2018-07-27 17:24:10','1',NULL),
(835,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=22&mode=addman&addids=10027,10036,10037&addname= 杨碧德 戚华 李兴盛','2018-07-27 17:27:18','1',NULL),
(836,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=回复页面&tfw_menu.url=/files/review&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=19&jstime=1532788941955&tfw_menu.code=files_review&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-28 22:42:22','1',NULL),
(837,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:42:44','1',NULL),
(838,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,155,123,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:43:06','1',NULL),
(839,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,155,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:43:41','1',NULL),
(840,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:43:59','1',NULL),
(841,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:44:08','1',NULL),
(842,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,155,123,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156','2018-07-28 22:44:14','1',NULL),
(844,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=审批意见记录&tfw_menu.url=/fileslog/&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=20&jstime=1532789350819&tfw_menu.code=fileslog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-28 22:49:11','1',NULL),
(845,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=文件审批记录&tfw_menu.url=/fileslog/&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=2&tfw_menu.id=123&tfw_menu.num=1&jstime=1532789390463&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-07-28 22:49:50','1',NULL),
(846,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/fileshistory/add&tfw_menu.pcode=fileshistory&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1532789404087&tfw_menu.code=fileshistory_add&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:50:04','1',NULL),
(847,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/fileshistory/edit&tfw_menu.pcode=fileshistory&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1532789408012&tfw_menu.code=fileshistory_edit&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:50:08','1',NULL),
(848,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/fileshistory/view&tfw_menu.pcode=fileshistory&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1532789412189&tfw_menu.code=fileshistory_view&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:50:12','1',NULL),
(849,'新增','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/fileshistory/remove&tfw_menu.pcode=fileshistory&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1532789416720&tfw_menu.code=fileshistory_remove&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:50:17','1',NULL),
(850,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,123,157,158,159,160','2018-07-28 22:50:24','1',NULL),
(851,'新增','1',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,115,116,117,118,119,120,155,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,123,157,158,159,160','2018-07-28 22:50:31','1',NULL),
(854,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/fileslog/add&tfw_menu.pcode=fileshistory&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=157&tfw_menu.num=1&jstime=1532789509928&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:51:50','1',NULL),
(855,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/fileslog/edit&tfw_menu.pcode=fileshistory&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=158&tfw_menu.num=2&jstime=1532789516879&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:51:57','1',NULL),
(856,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/fileslog/view&tfw_menu.pcode=fileshistory&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=159&tfw_menu.num=3&jstime=1532789522867&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:52:03','1',NULL),
(857,'修改','1',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/fileslog/remove&tfw_menu.pcode=fileshistory&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=160&tfw_menu.num=4&jstime=1532789530842&tfw_menu.levels=5&tfw_menu.tips=800*520','2018-07-28 22:52:11','1',NULL),
(858,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.opinion=kl;&nsl_files_log.id=24&jstime=1532789555886&nsl_files_log.version=','2018-07-28 22:52:36','1',NULL),
(861,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=123121&nsl_files_log.id=24&jstime=1532789787132&nsl_files_log.version=','2018-07-28 22:56:27','1',NULL),
(862,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=请转交张总审阅&nsl_files_log.id=25&jstime=1532790890665&nsl_files_log.version=','2018-07-28 23:14:51','1',NULL),
(863,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=测试时间&review=1&nsl_files_log.id=27&jstime=1532791055572&nsl_files_log.version=','2018-07-28 23:17:36','1',NULL),
(864,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=同意&review=1&nsl_files_log.id=28&jstime=1532791235447&nsl_files_log.version=','2018-07-28 23:20:35','1',NULL),
(865,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=16&mode=addman&addids=10036&addname= 戚华','2018-07-29 10:16:12','1',NULL),
(866,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:','2018-07-29 10:24:57','1',NULL),
(867,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=16','2018-07-29 10:26:19','1',NULL),
(868,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=16&nsl_files_log.opinion=','2018-07-29 10:27:24','1',NULL),
(869,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=16&nsl_files_log.opinion=31213121','2018-07-29 10:29:23','1',NULL),
(872,'新增','1',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=16&nsl_files_log.date=2018-07-29 10:36:53&nsl_files_log.opinion=有&nsl_files_log.u_id=1','2018-07-29 10:36:54','1',NULL),
(873,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=15&nsl_files_log.date=2018-07-29 10:42:18&nsl_files_log.opinion=请仔细阅读文件&nsl_files_log.u_id=10001','2018-07-29 10:42:18','1',NULL),
(874,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=15&nsl_files_log.date=2018-07-29 10:48:57&nsl_files_log.opinion=我第二次提意见&nsl_files_log.u_id=10001','2018-07-29 10:48:58','1',NULL),
(875,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=15&nsl_files_log.date=2018-07-29 10:49:05&nsl_files_log.opinion=我还要提一次意见\n&nsl_files_log.u_id=10001','2018-07-29 10:49:06','1',NULL),
(876,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=231312&nsl_files.selectname=戚华&nsl_files.visiable=10036&nsl_files.type=1&nsl_files.round=0&jstime=1532833423742&nsl_files.title_o=moban (2).docx,book.xlsx&nsl_files.num=121','2018-07-29 11:03:44','1',NULL),
(877,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=腠&nsl_files.selectname=李兴盛&nsl_files.visiable=10037&nsl_files.type=2&nsl_files.round=0&jstime=1532833463762&nsl_files.title_o=nzjxc.exe,SQLyog1.exe&nsl_files.num=','2018-07-29 11:04:24','1',NULL),
(878,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=16&nsl_files_log.date=2018-07-29 11:16:05&nsl_files_log.opinion=审批意见审批意见&nsl_files_log.u_id=10001','2018-07-29 11:16:05','1',NULL),
(879,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&token_nsl_files.type=&nsl_files.round=0&jstime=1532834912169&nsl_files.title_o=(反馈遗漏)727.doc&nsl_files.num=','2018-07-29 11:28:32','1',NULL),
(880,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=aaaa&nsl_files.id=25','2018-07-29 11:35:42','1',NULL),
(884,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=这是一条神奇的天路&nsl_files.id=9','2018-07-29 11:58:54','1',NULL),
(885,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=9&mode=addman&addids=10001&addname= 系统管理员','2018-07-29 11:59:04','1',NULL),
(886,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=9&nsl_files_log.date=2018-07-29 11:59:20&nsl_files_log.opinion=请领导审批&nsl_files_log.ispass=2&nsl_files_log.u_id=10026','2018-07-29 11:59:21','1',NULL),
(887,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=尽快审阅&nsl_files.id=13','2018-07-29 12:38:27','1',NULL),
(888,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=13&nsl_files_log.date=2018-07-29 12:38:33&nsl_files_log.opinion=审阅意见&nsl_files_log.ispass=2&nsl_files_log.u_id=10026','2018-07-29 12:38:34','1',NULL),
(889,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=13&nsl_files_log.date=2018-07-29 12:38:37&nsl_files_log.opinion=&nsl_files_log.ispass=2&nsl_files_log.u_id=10026','2018-07-29 12:38:38','1',NULL),
(890,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=13&nsl_files_log.date=2018-07-29 12:38:43&nsl_files_log.opinion=&nsl_files_log.ispass=2&nsl_files_log.u_id=10026','2018-07-29 12:38:44','1',NULL),
(891,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=尽快审阅&nsl_files.id=13','2018-07-29 12:39:20','1',NULL),
(892,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=尽快审阅&nsl_files.id=13','2018-07-29 12:39:30','1',NULL),
(893,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=尽快审阅&nsl_files.id=13','2018-07-29 12:39:45','1',NULL),
(894,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=尽快审阅哈哈&nsl_files.id=13','2018-07-29 12:39:50','1',NULL),
(895,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&nsl_files.type=1&nsl_files.round=0&jstime=1532851253260&nsl_files.title_o=5.jpg&nsl_files.num=000','2018-07-29 16:00:53','1',NULL),
(896,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:nsl_files.discript=啦啦啦咬掉&nsl_files.id=26','2018-07-29 16:01:40','1',NULL),
(897,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&nsl_files.type=1&nsl_files.round=0&jstime=1532852249562&nsl_files.title_o=智慧后勤.doc&nsl_files.num=12','2018-07-29 16:17:30','1',NULL),
(898,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=27&nsl_files_log.date=2018-07-29 16:21:10&nsl_files_log.opinion=同意&nsl_files_log.ispass=2&nsl_files_log.u_id=10001','2018-07-29 16:21:10','1',NULL),
(899,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=我的文件&tfw_menu.url=/files/&tfw_menu.pcode=filesmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=2&tfw_menu.id=116&tfw_menu.num=1&jstime=1532852742663&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-07-29 16:25:43','1',NULL),
(900,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=	btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=博客文章&tfw_menu.url=/blog/&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=1&tfw_menu.version=0&tfw_menu.id=105&tfw_menu.num=2&jstime=1532852843377&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-07-29 16:27:23','1',NULL),
(901,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=请落实执行&nsl_files.selectname=佘龙宇&nsl_files.visiable=10026&token_nsl_files.type=&nsl_files.round=0&jstime=1532853082805&nsl_files.title_o=moban (2)1.docx&nsl_files.num=','2018-07-29 16:31:23','1',NULL),
(902,'新增','10026',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&token_nsl_files.type=&nsl_files.round=0&jstime=1532853720618&nsl_files.title_o=12.jpg&nsl_files.num=','2018-07-29 16:42:01','1',NULL),
(903,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=那我开始执行了&review=1&nsl_files_log.id=66&jstime=1532854453944&nsl_files_log.version=','2018-07-29 16:54:14','1',NULL),
(904,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=那就开始了&review=1&nsl_files_log.id=66&jstime=1532854554095&nsl_files_log.version=','2018-07-29 16:55:54','1',NULL),
(905,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=好的&review=1&nsl_files_log.id=66&jstime=1532854743157&nsl_files_log.version=','2018-07-29 16:59:03','1',NULL),
(908,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=命运之南&review=1&nsl_files_log.id=66&jstime=1532870177106&nsl_files_log.version=','2018-07-29 21:16:17','1',NULL),
(909,'修改','10026',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:update  [参数]:nsl_files_log.review=daKL&review=1&nsl_files_log.id=66&jstime=1532870856721&nsl_files_log.version=','2018-07-29 21:27:37','1',NULL),
(910,'新增','10026',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:save  [参数]:nsl_casher.cause=运煤开支&nsl_casher.num=1&nsl_casher.imgs=14.jpg&nsl_casher.type=1&nsl_casher.title=松新茧站运煤费用&nsl_casher.start=2018-07-29&nsl_casher.over=2018-07-29&jstime=1532871038763','2018-07-29 21:30:39','1',NULL),
(912,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:nsl_casher_log.opinion=123&nsl_casher_log.date=2018-07-30 00:02:11&nsl_casher_log.c_id=4&nsl_casher_log.ispass=3','2018-07-30 00:02:12','1',NULL),
(913,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:nsl_casher_log.opinion=同意&nsl_casher_log.date=2018-07-30 00:03:26&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=4&nsl_casher_log.ispass=3','2018-07-30 00:03:26','1',NULL),
(914,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:nsl_casher_log.opinion=123&nsl_casher_log.date=2018-07-30 00:04:03&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=4&nsl_casher_log.ispass=2','2018-07-30 00:04:03','1',NULL),
(917,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10037,10036&addname= 李兴盛 戚华&cid=4','2018-07-30 00:19:18','1',NULL),
(918,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10037&addname= 李兴盛&cid=4','2018-07-30 00:45:54','1',NULL),
(919,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:nsl_casher_log.opinion=同意&nsl_casher_log.date=2018-07-30 00:48:42&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=4&nsl_casher_log.ispass=3','2018-07-30 00:48:43','1',NULL),
(920,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10037&addname= 李兴盛&cid=4','2018-07-30 00:48:46','1',NULL),
(921,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:nsl_casher_log.opinion=测试测试测试&nsl_casher_log.date=2018-07-30 00:49:13&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=4&nsl_casher_log.ispass=3','2018-07-30 00:49:13','1',NULL),
(922,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10037&addname= 李兴盛&cid=4','2018-07-30 00:49:16','1',NULL),
(923,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10001&addname= 系统管理员&cid=4&opinion=她','2018-07-30 00:53:57','1',NULL),
(924,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10001&addname= 系统管理员&cid=4&opinion=1111111111111111111111','2018-07-30 00:54:22','1',NULL),
(925,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10001&addname= 系统管理员&cid=4&opinion=123123','2018-07-30 00:55:32','1',NULL),
(926,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10001&addname= 系统管理员&cid=4&opinion=opinion','2018-07-30 00:56:21','1',NULL),
(927,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:mode=back&nsl_casher_log.opinion=fsdfafda&nsl_casher_log.date=2018-07-30 00:56:30&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=4&nsl_casher_log.ispass=2','2018-07-30 00:56:30','1',NULL),
(929,'修改','10025',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10036&addname= 戚华&cid=10&opinion=情况 属实','2018-07-30 00:59:54','1',NULL),
(930,'新增','10025',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:mode=back&nsl_casher_log.opinion=不通过&nsl_casher_log.date=2018-07-30 01:01:12&nsl_casher_log.u_id=10025&nsl_casher_log.c_id=9&nsl_casher_log.ispass=2','2018-07-30 01:01:12','1',NULL),
(931,'修改','10025',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10036&addname= 戚华&cid=2&opinion=20104002','2018-07-30 01:14:16','1',NULL),
(932,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=29&mode=addman&addids=10024,10037,10030,10036&addname=  林平  李兴盛  李轩  戚华','2018-08-16 15:44:23','1',NULL),
(933,'修改','1',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=29&mode=addman&addids=10030,10035&addname=  李轩  龙宗筱','2018-08-16 15:47:46','1',NULL),
(934,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=29&mode=addman&addids=10026,10028&addname=  佘龙宇  沈志明','2018-08-16 16:22:51','1',NULL),
(935,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_unforgot&tfw_generate.pkname=id&tfw_generate.realpath=E:\\GitProjects\\nsloa&tfw_generate.name=unforgot&tfw_generate.modelname=Unforgot&jstime=1534428834785&tfw_generate.packagename=com.ikkong.unforgot','2018-08-16 22:13:55','1',NULL),
(936,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=备忘录&tfw_menu.url=/unforgot/&tfw_menu.pcode=jiekou&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=20&jstime=1534428901257&tfw_menu.code=unforgot&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-08-16 22:15:01','1',NULL),
(937,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/unforgot/add&tfw_menu.pcode=unforgot&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1534428911639&tfw_menu.code=unforgot_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-16 22:15:12','1',NULL),
(938,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/unforgot/edit&tfw_menu.pcode=unforgot&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1534428916570&tfw_menu.code=unforgot_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-16 22:15:17','1',NULL),
(939,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/unforgot/view&tfw_menu.pcode=unforgot&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1534428920624&tfw_menu.code=unforgot_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-16 22:15:21','1',NULL),
(940,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/unforgot/remove&tfw_menu.pcode=unforgot&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1534428924503&tfw_menu.code=unforgot_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-16 22:15:25','1',NULL),
(941,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,131,138,132,133,134,135,136,139,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:15:44','1',NULL),
(942,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=2&ids=92,93,94,95,96,97,138,132,133,134,135,136,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:15:52','1',NULL),
(943,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=8&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:02','1',NULL),
(944,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=9&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:09','1',NULL),
(945,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=10&ids=92,93,97,105,106,107,108,109,115,116,117,118,119,120,155,131,138,132,133,134,135,136,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:17','1',NULL),
(946,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=13&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,155,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:27','1',NULL),
(947,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=11&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:32','1',NULL),
(948,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=12&ids=92,93,94,95,96,97,115,116,117,118,119,120,121,131,138,132,133,134,135,136,139,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-16 22:16:37','1',NULL),
(949,'新增','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:save  [参数]:nsl_unforgot.date=2018-08-17 00:00:00&jstime=1534432580964&nsl_unforgot.content=去工商局取发票','2018-08-16 23:16:21','1',NULL),
(950,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_cars&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=cars&tfw_generate.modelname=Cars&jstime=1534468046859&tfw_generate.packagename=com.ikkong.cars','2018-08-17 09:07:27','1',NULL),
(951,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.GenerateController  [方法]:save  [参数]:tfw_generate.tablename=nsl_carslog&tfw_generate.pkname=id&tfw_generate.realpath=F:\\nsloa&tfw_generate.name=carslog&tfw_generate.modelname=Carslog&jstime=1534468073849&tfw_generate.packagename=com.ikkong.cars','2018-08-17 09:07:54','1',NULL),
(952,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=车辆管理&tfw_menu.url=&tfw_menu.pcode=office&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=7&jstime=1534468344411&tfw_menu.code=carsmanager&tfw_menu.levels=2&tfw_menu.tips=800*520','2018-08-17 09:12:24','1',NULL),
(953,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=车辆信息&tfw_menu.url=/cars/&tfw_menu.pcode=carsmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1534468377242&tfw_menu.code=cars&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-08-17 09:12:57','1',NULL),
(954,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=fa-co&tfw_menu.name=派车管理&tfw_menu.url=/carslog/&tfw_menu.pcode=carsmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1534468414976&tfw_menu.code=carslog&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-08-17 09:13:35','1',NULL),
(955,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:update  [参数]:tfw_menu.icon=fa-cog&tfw_menu.name=派车管理&tfw_menu.url=/carslog/&tfw_menu.pcode=carsmanager&tfw_menu.alias=&tfw_menu.isopen=0&tfw_menu.version=0&tfw_menu.id=168&tfw_menu.num=2&jstime=1534468422542&tfw_menu.levels=3&tfw_menu.tips=800*520','2018-08-17 09:13:43','1',NULL),
(956,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/cars/add&tfw_menu.pcode=cars&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1534468438572&tfw_menu.code=cars_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:13:59','1',NULL),
(957,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/cars/edit&tfw_menu.pcode=cars&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1534468446253&tfw_menu.code=cars_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:06','1',NULL),
(958,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/cars/view&tfw_menu.pcode=cars&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1534468450809&tfw_menu.code=cars_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:11','1',NULL),
(959,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/cars/remove&tfw_menu.pcode=cars&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1534468454821&tfw_menu.code=cars_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:15','1',NULL),
(960,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-floppy-o bigger-120&tfw_menu.name=新增&tfw_menu.url=/carslog/add&tfw_menu.pcode=carslog&tfw_menu.alias=add&tfw_menu.isopen=0&tfw_menu.num=1&jstime=1534468459302&tfw_menu.code=carslog_add&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:19','1',NULL),
(961,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-pencil  bigger-120&tfw_menu.name=修改&tfw_menu.url=/carslog/edit&tfw_menu.pcode=carslog&tfw_menu.alias=edit&tfw_menu.isopen=0&tfw_menu.num=2&jstime=1534468465182&tfw_menu.code=carslog_edit&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:25','1',NULL),
(962,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-eye bigger-120&tfw_menu.name=查看&tfw_menu.url=/carslog/view&tfw_menu.pcode=carslog&tfw_menu.alias=view&tfw_menu.isopen=0&tfw_menu.num=3&jstime=1534468469249&tfw_menu.code=carslog_view&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:29','1',NULL),
(963,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:save  [参数]:tfw_menu.icon=btn btn-xs btn-white | fa fa-times  bigger-120&tfw_menu.name=删除&tfw_menu.url=/carslog/remove&tfw_menu.pcode=carslog&tfw_menu.alias=remove&tfw_menu.isopen=0&tfw_menu.num=4&jstime=1534468474324&tfw_menu.code=carslog_remove&tfw_menu.levels=4&tfw_menu.tips=800*520','2018-08-17 09:14:34','1',NULL),
(964,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=1&ids=92,93,94,95,96,97,105,106,107,108,109,115,116,117,118,119,120,121,155,131,138,132,133,134,135,136,139,166,167,169,170,171,172,168,173,174,175,176,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2,3,4,5,6,7,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,124,125,56,57,58,59,60,61,62,63,64,65,81,82,84,85,86,87,83,88,89,90,91,98,99,100,101,102,103,104,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-17 09:14:47','1',NULL),
(965,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:save  [参数]:tfw_role.name=车辆管理员&tfw_role.deptid=15&tfw_role.num=9&jstime=1534468515652&tfw_role.pid=1&tfw_role.tips=车辆管理员','2018-08-17 09:15:16','1',NULL),
(966,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:saveAuthority  [参数]:roleId=14&ids=92,93,94,95,96,97,166,167,169,170,171,172,168,173,174,175,176,1,127,128,129,126,130,137,146,147,148,149,150,151,152,153,154,156,161,162,163,164,165,123,157,158,159,160','2018-08-17 09:17:00','1',NULL),
(967,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarsController  [方法]:save  [参数]:pic_editor=&nsl_cars.remarks=备注&nsl_cars.pic=309&nsl_cars.num=川W 56288&jstime=1534469165739&nsl_cars.name=李守刚','2018-08-17 09:26:06','1',NULL),
(968,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=车辆状态&tfw_dict.code=107&token_tfw_dict.pid=&jstime=1534469440003&tfw_dict.num=0&tfw_dict.name=车辆状态','2018-08-17 09:30:40','1',NULL),
(969,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=107&jstime=1534469447331&tfw_dict.num=1&tfw_dict.name=可以派车&tfw_dict.pid=79','2018-08-17 09:30:47','1',NULL),
(970,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=107&jstime=1534469457768&tfw_dict.num=2&tfw_dict.name=已出车&tfw_dict.pid=79','2018-08-17 09:30:58','1',NULL),
(971,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=107&jstime=1534469467298&tfw_dict.num=3&tfw_dict.name=修车&tfw_dict.pid=79','2018-08-17 09:31:07','1',NULL),
(972,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=107&tfw_dict.version=0&token_tfw_dict.pid=79&jstime=1534469480224&tfw_dict.num=3&tfw_dict.name=正在维修&tfw_dict.id=82','2018-08-17 09:31:20','1',NULL),
(973,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=107&tfw_dict.version=1&jstime=1534469487827&tfw_dict.num=3&tfw_dict.name=正在维修&tfw_dict.id=82&tfw_dict.pid=79','2018-08-17 09:31:28','1',NULL),
(974,'新增','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:save  [参数]:tfw_dict.tips=&tfw_dict.code=107&jstime=1534469501665&tfw_dict.num=4&tfw_dict.name=其它&tfw_dict.pid=79','2018-08-17 09:31:42','1',NULL),
(975,'修改','10001',NULL,'[类名]:com.ikkong.cars.controller.CarsController  [方法]:update  [参数]:pic_editor=&nsl_cars.remarks=备注&token_nsl_cars.pic=309&nsl_cars.version=&nsl_cars.id=1&nsl_cars.num=川W 56288&jstime=1534470952920&nsl_cars.name=李守刚','2018-08-17 09:55:53','1',NULL),
(976,'修改','10001',NULL,'[类名]:com.ikkong.cars.controller.CarsController  [方法]:update  [参数]:pic_editor=&nsl_cars.remarks=&token_nsl_cars.pic=309&nsl_cars.version=&nsl_cars.id=1&nsl_cars.num=川W 56288&jstime=1534470958180&nsl_cars.name=李守刚','2018-08-17 09:55:58','1',NULL),
(977,'修改','10001',NULL,'[类名]:com.ikkong.cars.controller.CarsController  [方法]:update  [参数]:pic_editor=&nsl_cars.remarks=无&token_nsl_cars.pic=309&nsl_cars.version=&nsl_cars.id=1&nsl_cars.num=川W 56288&jstime=1534470967808&nsl_cars.name=李守刚','2018-08-17 09:56:08','1',NULL),
(978,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarsController  [方法]:save  [参数]:pic_editor=&nsl_cars.remarks=&nsl_cars.pic=310&nsl_cars.num=川W 78033&jstime=1534473655768&nsl_cars.name=李强','2018-08-17 10:40:56','1',NULL),
(979,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.start=2018-08-06 00:00:00&nsl_carslog.cname=川W 78033&nsl_carslog.uname=李兴盛&nsl_carslog.over=2018-08-16 09:00:00&jstime=1534474461285&nsl_carslog.cause=松林脱贫事宜&nsl_carslog.c_id=3','2018-08-17 10:54:21','1',NULL),
(980,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.start=2018-08-17 00:00:00&nsl_carslog.cname=川W 78033&nsl_carslog.uname=林平&nsl_carslog.over=2018-08-17 20:00:00&jstime=1534477502343&nsl_carslog.cause=查看收烘情况&nsl_carslog.c_id=3','2018-08-17 11:45:02','1',NULL),
(981,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.start=2018-08-17 00:00:00&nsl_carslog.cname=川W 56288&nsl_carslog.uname=张传卫&nsl_carslog.over=2018-08-17 00:00:00&jstime=1534477553026&nsl_carslog.cause=金阳收茧&nsl_carslog.c_id=1','2018-08-17 11:45:53','1',NULL),
(982,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.start=2018-08-17 00:00:00&nsl_carslog.cname=川W 56288&nsl_carslog.uname=张传卫&nsl_carslog.over=2018-08-18 00:00:00&jstime=1534477704518&nsl_carslog.cause=金阳回公司&nsl_carslog.c_id=1','2018-08-17 11:48:25','1',NULL),
(983,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=107&tfw_dict.version=2&token_tfw_dict.pid=79&jstime=1534489450943&tfw_dict.num=3&tfw_dict.name=维修&tfw_dict.id=82','2018-08-17 15:04:11','1',NULL),
(984,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.DictController  [方法]:update  [参数]:tfw_dict.tips=&tfw_dict.code=107&tfw_dict.version=3&jstime=1534489457504&tfw_dict.num=3&tfw_dict.name=维修&tfw_dict.id=82&tfw_dict.pid=79','2018-08-17 15:04:18','1',NULL),
(985,'修改','10001',NULL,'[类名]:com.ikkong.system.controller.RoleController  [方法]:update  [参数]:tfw_role.name=车辆管理员&tfw_role.version=0&token_tfw_role.deptid=15&tfw_role.num=9&jstime=1534490446127&token_tfw_role.pid=1&tfw_role.id=14&tfw_role.tips=carman','2018-08-17 15:20:46','1',NULL),
(986,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=29&mode=addman&addids=10024,10030,10026&addname=  林平  李轩  佘龙宇','2018-08-17 16:19:58','1',NULL),
(987,'修改','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherController  [方法]:update  [参数]:mode=addman&addids=10029&addname= 吴灼阳&cid=3&opinion=','2018-08-17 16:46:07','1',NULL),
(988,'新增','10001',NULL,'[类名]:com.ikkong.casher.controller.CasherlogController  [方法]:save  [参数]:mode=back&nsl_casher_log.opinion=请上传图片&nsl_casher_log.date=2018-08-17 16:46:28&nsl_casher_log.u_id=10001&nsl_casher_log.c_id=3&nsl_casher_log.ispass=2','2018-08-17 16:46:30','1',NULL),
(989,'新增','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:save  [参数]:nsl_unforgot.date=2018-08-17 00:00:00&jstime=1534643227812&nsl_unforgot.content=哈哈只','2018-08-19 09:47:08','1',NULL),
(990,'新增','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:save  [参数]:nsl_unforgot.date=2018-08-17 00:00:00&jstime=1534643308635&nsl_unforgot.content=三三三三三','2018-08-19 09:48:29','1',NULL),
(991,'删除','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:remove  [参数]:ids=5','2018-08-19 10:03:42','1',NULL),
(992,'新增','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:save  [参数]:nsl_unforgot.date=2018-08-19 00:00:00&jstime=1534644280685&nsl_unforgot.content=+++++','2018-08-19 10:04:41','1',NULL),
(993,'删除','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:remove  [参数]:ids=7','2018-08-19 10:04:47','1',NULL),
(994,'新增','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:save  [参数]:nsl_unforgot.date=2018-08-19 00:00:00&jstime=1534644310230&nsl_unforgot.content=需要','2018-08-19 10:05:10','1',NULL),
(995,'修改','10001',NULL,'[类名]:com.ikkong.unforgot.controller.UnforgotController  [方法]:update  [参数]:nsl_unforgot.version=&nsl_unforgot.id=8&jstime=1534645784003&nsl_unforgot.content=需要哈哈','2018-08-19 10:29:44','1',NULL),
(998,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=&nsl_carslog.c_id=3','2018-08-19 11:50:24','1',NULL),
(999,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=金阳&nsl_carslog.c_id=3','2018-08-19 11:54:01','1',NULL),
(1001,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=昆明&nsl_carslog.c_id=3','2018-08-19 12:00:20','1',NULL),
(1002,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=昆明&nsl_carslog.c_id=3','2018-08-19 12:01:45','1',NULL),
(1003,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=12&nsl_carslog.c_id=3','2018-08-19 12:05:00','1',NULL),
(1004,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=12&nsl_carslog.c_id=3','2018-08-19 12:05:06','1',NULL),
(1005,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=12&nsl_carslog.c_id=3','2018-08-19 12:05:06','1',NULL),
(1006,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=12&nsl_carslog.c_id=3','2018-08-19 12:05:07','1',NULL),
(1007,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=犬瘟热&nsl_carslog.c_id=3','2018-08-19 12:05:34','1',NULL),
(1008,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=哈哈哈&nsl_carslog.c_id=3','2018-08-19 12:11:22','1',NULL),
(1009,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=呵呵呵&nsl_carslog.c_id=3','2018-08-19 12:12:00','1',NULL),
(1010,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=哈哈哈&nsl_carslog.c_id=3','2018-08-19 12:12:55','1',NULL),
(1011,'新增','10001',NULL,'[类名]:com.ikkong.cars.controller.CarslogController  [方法]:save  [参数]:nsl_carslog.cause=哈哈哈&nsl_carslog.c_id=3','2018-08-19 12:13:48','1',NULL),
(1012,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=29&nsl_files_log.date=2018-08-19 15:13:28&nsl_files_log.opinion=同意&nsl_files_log.ispass=2&nsl_files_log.u_id=10001','2018-08-19 15:13:29','1',NULL),
(1013,'删除','10001',NULL,'[类名]:com.ikkong.system.controller.MenuController  [方法]:del  [参数]:ids=155','2018-08-19 16:58:56','1',NULL),
(1014,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=28&mode=addman&addids=10034,10029&addname=','2018-08-19 17:12:53','1',NULL),
(1015,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10025,10024,10037&addname=','2018-08-19 17:27:30','1',NULL),
(1018,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10025,10024,10037&addname=','2018-08-19 17:48:16','1',NULL),
(1019,'修改','10001',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10025,10024,10037&addname=','2018-08-19 17:50:08','1',NULL),
(1020,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10035,10036&addname=','2018-08-19 17:56:25','1',NULL),
(1021,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10001&addname=','2018-08-19 17:57:37','1',NULL),
(1022,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=,10030&addname=','2018-08-19 18:02:32','1',NULL),
(1023,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10032&addname=','2018-08-19 18:03:18','1',NULL),
(1025,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10031&addname=','2018-08-19 18:11:38','1',NULL),
(1026,'修改','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10035,10027&addname=','2018-08-19 18:11:56','1',NULL),
(1027,'修改','10035',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:update  [参数]:fid=27&mode=addman&addids=10029,10033&addname=','2018-08-19 18:12:36','1',NULL),
(1028,'新增','10025',NULL,'[类名]:com.ikkong.files.controller.FilesController  [方法]:save  [参数]:nsl_files.discript=test&nsl_files.selectname=系统管理员&nsl_files.visiable=10001&nsl_files.type=1&nsl_files.round=0&jstime=1534673952858&nsl_files.title_o=小程序.txt&nsl_files.num=text','2018-08-19 18:19:13','1',NULL),
(1029,'新增','10001',NULL,'[类名]:com.ikkong.files.controller.FileslogController  [方法]:save  [参数]:nsl_files_log.f_id=30&nsl_files_log.date=2018-08-19 18:20:34&nsl_files_log.opinion=dfs&nsl_files_log.ispass=2&nsl_files_log.u_id=10001','2018-08-19 18:20:34','1',NULL);

/*Table structure for table `tfw_parameter` */

DROP TABLE IF EXISTS `tfw_parameter`;

CREATE TABLE `tfw_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `NUM` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARA` text,
  `TIPS` varchar(255) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_parameter` */

insert  into `tfw_parameter`(`ID`,`CODE`,`NUM`,`NAME`,`PARA`,`TIPS`,`STATUS`,`VERSION`) values 
(1,'101',100,'是否开启记录日志','1','1:是  2:否',1,9);

/*Table structure for table `tfw_relation` */

DROP TABLE IF EXISTS `tfw_relation`;

CREATE TABLE `tfw_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENUID` int(11) DEFAULT NULL,
  `ROLEID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9147 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_relation` */

insert  into `tfw_relation`(`ID`,`MENUID`,`ROLEID`) values 
(1244,1,3),
(1245,62,3),
(1246,64,3),
(1247,72,3),
(1248,73,3),
(1249,74,3),
(1250,75,3),
(1251,76,3),
(1252,77,3),
(1253,78,3),
(1254,79,3),
(1255,80,3),
(1384,72,6),
(1385,73,6),
(1386,74,6),
(1387,75,6),
(1388,76,6),
(1389,77,6),
(1390,78,6),
(1391,79,6),
(1392,80,6),
(1393,81,6),
(1394,82,6),
(1395,84,6),
(1396,85,6),
(1397,86,6),
(1398,87,6),
(1399,83,6),
(1400,88,6),
(1401,89,6),
(1402,90,6),
(1403,91,6),
(1524,1,25),
(1525,62,25),
(1526,64,25),
(1527,72,25),
(1528,73,25),
(1529,74,25),
(1530,75,25),
(1531,76,25),
(1532,77,25),
(1533,78,25),
(1534,79,25),
(1535,80,25),
(1668,81,5),
(1669,82,5),
(1670,84,5),
(1671,85,5),
(1672,86,5),
(1673,87,5),
(1980,1,4),
(1981,2,4),
(1982,3,4),
(1983,4,4),
(1984,5,4),
(1985,6,4),
(1986,7,4),
(1987,81,4),
(1988,82,4),
(1989,84,4),
(1990,85,4),
(1991,86,4),
(1992,87,4),
(1993,83,4),
(1994,88,4),
(1995,89,4),
(1996,90,4),
(1997,91,4),
(8343,92,2),
(8344,93,2),
(8345,94,2),
(8346,95,2),
(8347,96,2),
(8348,97,2),
(8349,138,2),
(8350,132,2),
(8351,133,2),
(8352,134,2),
(8353,135,2),
(8354,136,2),
(8355,1,2),
(8356,8,2),
(8357,9,2),
(8358,10,2),
(8359,11,2),
(8360,12,2),
(8361,13,2),
(8362,14,2),
(8363,15,2),
(8364,16,2),
(8365,17,2),
(8366,18,2),
(8367,19,2),
(8368,20,2),
(8369,21,2),
(8370,22,2),
(8371,23,2),
(8372,24,2),
(8373,2,2),
(8374,3,2),
(8375,4,2),
(8376,5,2),
(8377,6,2),
(8378,7,2),
(8379,34,2),
(8380,35,2),
(8381,36,2),
(8382,37,2),
(8383,38,2),
(8384,39,2),
(8385,40,2),
(8386,41,2),
(8387,42,2),
(8388,43,2),
(8389,44,2),
(8390,45,2),
(8391,46,2),
(8392,47,2),
(8393,48,2),
(8394,49,2),
(8395,81,2),
(8396,82,2),
(8397,84,2),
(8398,85,2),
(8399,86,2),
(8400,87,2),
(8401,83,2),
(8402,88,2),
(8403,89,2),
(8404,90,2),
(8405,91,2),
(8406,98,2),
(8407,99,2),
(8408,100,2),
(8409,101,2),
(8410,102,2),
(8411,127,2),
(8412,128,2),
(8413,129,2),
(8414,126,2),
(8415,130,2),
(8416,137,2),
(8417,146,2),
(8418,147,2),
(8419,148,2),
(8420,149,2),
(8421,150,2),
(8422,151,2),
(8423,152,2),
(8424,153,2),
(8425,154,2),
(8426,156,2),
(8427,161,2),
(8428,162,2),
(8429,163,2),
(8430,164,2),
(8431,165,2),
(8432,123,2),
(8433,157,2),
(8434,158,2),
(8435,159,2),
(8436,160,2),
(8470,92,8),
(8471,93,8),
(8472,94,8),
(8473,95,8),
(8474,96,8),
(8475,97,8),
(8476,105,8),
(8477,106,8),
(8478,107,8),
(8479,108,8),
(8480,109,8),
(8481,115,8),
(8482,116,8),
(8483,117,8),
(8484,118,8),
(8485,119,8),
(8486,120,8),
(8487,121,8),
(8488,155,8),
(8489,131,8),
(8490,138,8),
(8491,132,8),
(8492,133,8),
(8493,134,8),
(8494,135,8),
(8495,136,8),
(8496,139,8),
(8497,1,8),
(8498,127,8),
(8499,128,8),
(8500,129,8),
(8501,126,8),
(8502,130,8),
(8503,137,8),
(8504,146,8),
(8505,147,8),
(8506,148,8),
(8507,149,8),
(8508,150,8),
(8509,151,8),
(8510,152,8),
(8511,153,8),
(8512,154,8),
(8513,156,8),
(8514,161,8),
(8515,162,8),
(8516,163,8),
(8517,164,8),
(8518,165,8),
(8519,123,8),
(8520,157,8),
(8521,158,8),
(8522,159,8),
(8523,160,8),
(8533,92,9),
(8534,93,9),
(8535,94,9),
(8536,95,9),
(8537,96,9),
(8538,97,9),
(8539,105,9),
(8540,106,9),
(8541,107,9),
(8542,108,9),
(8543,109,9),
(8544,115,9),
(8545,116,9),
(8546,117,9),
(8547,118,9),
(8548,119,9),
(8549,120,9),
(8550,121,9),
(8551,131,9),
(8552,138,9),
(8553,132,9),
(8554,133,9),
(8555,134,9),
(8556,135,9),
(8557,136,9),
(8558,139,9),
(8559,1,9),
(8560,127,9),
(8561,128,9),
(8562,129,9),
(8563,126,9),
(8564,130,9),
(8565,137,9),
(8566,146,9),
(8567,147,9),
(8568,148,9),
(8569,149,9),
(8570,150,9),
(8571,151,9),
(8572,152,9),
(8573,153,9),
(8574,154,9),
(8575,156,9),
(8576,161,9),
(8577,162,9),
(8578,163,9),
(8579,164,9),
(8580,165,9),
(8581,123,9),
(8582,157,9),
(8583,158,9),
(8584,159,9),
(8585,160,9),
(8596,92,10),
(8597,93,10),
(8598,97,10),
(8599,105,10),
(8600,106,10),
(8601,107,10),
(8602,108,10),
(8603,109,10),
(8604,115,10),
(8605,116,10),
(8606,117,10),
(8607,118,10),
(8608,119,10),
(8609,120,10),
(8610,155,10),
(8611,131,10),
(8612,138,10),
(8613,132,10),
(8614,133,10),
(8615,134,10),
(8616,135,10),
(8617,136,10),
(8618,1,10),
(8619,127,10),
(8620,128,10),
(8621,129,10),
(8622,126,10),
(8623,130,10),
(8624,137,10),
(8625,146,10),
(8626,147,10),
(8627,148,10),
(8628,149,10),
(8629,150,10),
(8630,151,10),
(8631,152,10),
(8632,153,10),
(8633,154,10),
(8634,156,10),
(8635,161,10),
(8636,162,10),
(8637,163,10),
(8638,164,10),
(8639,165,10),
(8640,123,10),
(8641,157,10),
(8642,158,10),
(8643,159,10),
(8644,160,10),
(8659,92,13),
(8660,93,13),
(8661,94,13),
(8662,95,13),
(8663,96,13),
(8664,97,13),
(8665,115,13),
(8666,116,13),
(8667,117,13),
(8668,118,13),
(8669,119,13),
(8670,120,13),
(8671,121,13),
(8672,155,13),
(8673,131,13),
(8674,138,13),
(8675,132,13),
(8676,133,13),
(8677,134,13),
(8678,135,13),
(8679,136,13),
(8680,139,13),
(8681,1,13),
(8682,127,13),
(8683,128,13),
(8684,129,13),
(8685,126,13),
(8686,130,13),
(8687,137,13),
(8688,146,13),
(8689,147,13),
(8690,148,13),
(8691,149,13),
(8692,150,13),
(8693,151,13),
(8694,152,13),
(8695,153,13),
(8696,154,13),
(8697,156,13),
(8698,161,13),
(8699,162,13),
(8700,163,13),
(8701,164,13),
(8702,165,13),
(8703,123,13),
(8704,157,13),
(8705,158,13),
(8706,159,13),
(8707,160,13),
(8722,92,11),
(8723,93,11),
(8724,94,11),
(8725,95,11),
(8726,96,11),
(8727,97,11),
(8728,115,11),
(8729,116,11),
(8730,117,11),
(8731,118,11),
(8732,119,11),
(8733,120,11),
(8734,121,11),
(8735,131,11),
(8736,138,11),
(8737,132,11),
(8738,133,11),
(8739,134,11),
(8740,135,11),
(8741,136,11),
(8742,139,11),
(8743,1,11),
(8744,127,11),
(8745,128,11),
(8746,129,11),
(8747,126,11),
(8748,130,11),
(8749,137,11),
(8750,146,11),
(8751,147,11),
(8752,148,11),
(8753,149,11),
(8754,150,11),
(8755,151,11),
(8756,152,11),
(8757,153,11),
(8758,154,11),
(8759,156,11),
(8760,161,11),
(8761,162,11),
(8762,163,11),
(8763,164,11),
(8764,165,11),
(8765,123,11),
(8766,157,11),
(8767,158,11),
(8768,159,11),
(8769,160,11),
(8785,92,12),
(8786,93,12),
(8787,94,12),
(8788,95,12),
(8789,96,12),
(8790,97,12),
(8791,115,12),
(8792,116,12),
(8793,117,12),
(8794,118,12),
(8795,119,12),
(8796,120,12),
(8797,121,12),
(8798,131,12),
(8799,138,12),
(8800,132,12),
(8801,133,12),
(8802,134,12),
(8803,135,12),
(8804,136,12),
(8805,139,12),
(8806,1,12),
(8807,127,12),
(8808,128,12),
(8809,129,12),
(8810,126,12),
(8811,130,12),
(8812,137,12),
(8813,146,12),
(8814,147,12),
(8815,148,12),
(8816,149,12),
(8817,150,12),
(8818,151,12),
(8819,152,12),
(8820,153,12),
(8821,154,12),
(8822,156,12),
(8823,161,12),
(8824,162,12),
(8825,163,12),
(8826,164,12),
(8827,165,12),
(8828,123,12),
(8829,157,12),
(8830,158,12),
(8831,159,12),
(8832,160,12),
(8848,92,1),
(8849,93,1),
(8850,94,1),
(8851,95,1),
(8852,96,1),
(8853,97,1),
(8854,105,1),
(8855,106,1),
(8856,107,1),
(8857,108,1),
(8858,109,1),
(8859,115,1),
(8860,116,1),
(8861,117,1),
(8862,118,1),
(8863,119,1),
(8864,120,1),
(8865,121,1),
(8866,155,1),
(8867,131,1),
(8868,138,1),
(8869,132,1),
(8870,133,1),
(8871,134,1),
(8872,135,1),
(8873,136,1),
(8874,139,1),
(8875,166,1),
(8876,167,1),
(8877,169,1),
(8878,170,1),
(8879,171,1),
(8880,172,1),
(8881,168,1),
(8882,173,1),
(8883,174,1),
(8884,175,1),
(8885,176,1),
(8886,1,1),
(8887,8,1),
(8888,9,1),
(8889,10,1),
(8890,11,1),
(8891,12,1),
(8892,13,1),
(8893,14,1),
(8894,15,1),
(8895,16,1),
(8896,17,1),
(8897,18,1),
(8898,19,1),
(8899,20,1),
(8900,21,1),
(8901,22,1),
(8902,23,1),
(8903,24,1),
(8904,2,1),
(8905,3,1),
(8906,4,1),
(8907,5,1),
(8908,6,1),
(8909,7,1),
(8910,25,1),
(8911,26,1),
(8912,27,1),
(8913,28,1),
(8914,29,1),
(8915,30,1),
(8916,31,1),
(8917,32,1),
(8918,33,1),
(8919,34,1),
(8920,35,1),
(8921,36,1),
(8922,37,1),
(8923,38,1),
(8924,39,1),
(8925,40,1),
(8926,41,1),
(8927,42,1),
(8928,43,1),
(8929,44,1),
(8930,45,1),
(8931,46,1),
(8932,47,1),
(8933,48,1),
(8934,49,1),
(8935,124,1),
(8936,125,1),
(8937,56,1),
(8938,57,1),
(8939,58,1),
(8940,59,1),
(8941,60,1),
(8942,61,1),
(8943,62,1),
(8944,63,1),
(8945,64,1),
(8946,65,1),
(8947,81,1),
(8948,82,1),
(8949,84,1),
(8950,85,1),
(8951,86,1),
(8952,87,1),
(8953,83,1),
(8954,88,1),
(8955,89,1),
(8956,90,1),
(8957,91,1),
(8958,98,1),
(8959,99,1),
(8960,100,1),
(8961,101,1),
(8962,102,1),
(8963,103,1),
(8964,104,1),
(8965,127,1),
(8966,128,1),
(8967,129,1),
(8968,126,1),
(8969,130,1),
(8970,137,1),
(8971,146,1),
(8972,147,1),
(8973,148,1),
(8974,149,1),
(8975,150,1),
(8976,151,1),
(8977,152,1),
(8978,153,1),
(8979,154,1),
(8980,156,1),
(8981,161,1),
(8982,162,1),
(8983,163,1),
(8984,164,1),
(8985,165,1),
(8986,123,1),
(8987,157,1),
(8988,158,1),
(8989,159,1),
(8990,160,1),
(9103,92,14),
(9104,93,14),
(9105,94,14),
(9106,95,14),
(9107,96,14),
(9108,97,14),
(9109,166,14),
(9110,167,14),
(9111,169,14),
(9112,170,14),
(9113,171,14),
(9114,172,14),
(9115,168,14),
(9116,173,14),
(9117,174,14),
(9118,175,14),
(9119,176,14),
(9120,1,14),
(9121,127,14),
(9122,128,14),
(9123,129,14),
(9124,126,14),
(9125,130,14),
(9126,137,14),
(9127,146,14),
(9128,147,14),
(9129,148,14),
(9130,149,14),
(9131,150,14),
(9132,151,14),
(9133,152,14),
(9134,153,14),
(9135,154,14),
(9136,156,14),
(9137,161,14),
(9138,162,14),
(9139,163,14),
(9140,164,14),
(9141,165,14),
(9142,123,14),
(9143,157,14),
(9144,158,14),
(9145,159,14),
(9146,160,14);

/*Table structure for table `tfw_role` */

DROP TABLE IF EXISTS `tfw_role`;

CREATE TABLE `tfw_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DEPTID` int(11) DEFAULT NULL,
  `TIPS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_role` */

insert  into `tfw_role`(`ID`,`NUM`,`PID`,`NAME`,`DEPTID`,`TIPS`,`VERSION`) values 
(1,1,NULL,'超级管理员',1,'administrator',0),
(2,1,1,'管理员',1,'admin',4),
(8,2,1,'总经理',16,'总经理',0),
(9,3,1,'领导班子',7,'领导班子',0),
(10,4,1,'员工',15,'员工',0),
(11,4,1,'财务初审',14,'财务初审',0),
(12,5,1,'财务终审',14,'财务终审',0),
(13,8,1,'部门领导',1,'部门领导',0),
(14,9,1,'车辆管理员',15,'carman',1);

/*Table structure for table `tfw_role_ext` */

DROP TABLE IF EXISTS `tfw_role_ext`;

CREATE TABLE `tfw_role_ext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(255) DEFAULT NULL,
  `ROLEIN` text,
  `ROLEOUT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_role_ext` */

insert  into `tfw_role_ext`(`ID`,`USERID`,`ROLEIN`,`ROLEOUT`) values 
(27,'66','1,44,49','45'),
(47,'2','0','8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24'),
(48,'63','0','0'),
(49,'72','0','0'),
(50,'74','0','0'),
(67,'1','0','0'),
(87,'168','92,103,104,105,106,107','109,110,111,112,113,114,115,116,117,118,119,120,121,122'),
(107,'189','108,109,110,111,112,113,114,115,116,117,118,119,120,121,122','0'),
(127,'21','92,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,39,40,41,42,43,98,99,100,101,102,103,104','0');

/*Table structure for table `tfw_user` */

DROP TABLE IF EXISTS `tfw_user`;

CREATE TABLE `tfw_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `SALT` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `SEX` int(11) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `ROLEID` varchar(255) DEFAULT NULL,
  `DEPTID` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10038 DEFAULT CHARSET=utf8;

/*Data for the table `tfw_user` */

insert  into `tfw_user`(`ID`,`ACCOUNT`,`PASSWORD`,`SALT`,`NAME`,`BIRTHDAY`,`SEX`,`EMAIL`,`PHONE`,`ROLEID`,`DEPTID`,`STATUS`,`CREATETIME`,`VERSION`) values 
(10001,'admin','4779e4a9903dfb08f9f877791c516a73','admin','系统管理员','2018-07-16 10:15:12',1,'admin@tonbusoft.com.cn','111111','1',1,1,'2016-01-29 08:49:53',27),
(10024,'linping','60b12a1574e7962d23e75ab75fa4dee9','pk9am','林平','1900-10-16 13:00:00',1,NULL,NULL,'8',16,1,'2018-07-16 10:16:05',2),
(10025,'dengyuanhui','d936ac3bd56a381d7924562270c10abc','96gqx','邓远会','2018-07-17 08:47:27',2,NULL,NULL,'13',15,1,'2018-07-17 08:47:43',NULL),
(10026,'shelongyu','ef4d53cf7b65a57a228c333f8551c222','s7uln','佘龙宇','2018-07-17 11:07:36',1,NULL,NULL,'10',15,1,'2018-07-17 11:07:42',NULL),
(10027,'yangbide','e4941adcddcc03c382f6b6d1318aaba5','pq31l','杨碧德','2018-07-17 11:10:38',1,NULL,NULL,'9',7,1,'2018-07-17 11:10:44',NULL),
(10028,'shenzhiming','c9717b995afee5d53032b581aa95dcf8','53zd6','沈志明','2018-07-24 00:00:00',2,NULL,NULL,'10',15,1,'2018-07-24 09:03:20',NULL),
(10029,'wuzhuoyang','f17120108afaf6f4dbdca7cca420f5ed','uwizg','吴灼阳','2018-07-25 14:58:18',1,NULL,NULL,'11',14,1,'2018-07-25 14:58:34',NULL),
(10030,'lixuan','33d4ef30378afd6fd18cc09412461df6','aruu9','李轩','2018-07-26 11:18:58',2,NULL,NULL,'10',15,1,'2018-07-26 11:19:05',NULL),
(10031,'zoumingyue','ec067f4f77963eec3c1ca04bf5740268','do3n7','邹明月','2018-07-26 11:19:28',2,NULL,NULL,'10',15,1,'2018-07-26 11:19:35',NULL),
(10032,'yanghong','af1f78841010df1bb58623e40c93942d','2bssi','杨红','2018-07-28 00:00:00',2,NULL,NULL,'10',15,1,'2018-07-26 11:19:57',NULL),
(10033,'wuningyan','9e2d4b5fa019e8d61acd8d704d001e21','syvhu','吴宁艳','2018-07-26 00:00:00',2,NULL,NULL,'10',15,1,'2018-07-26 11:20:31',NULL),
(10034,'xuzebin','9548c3de4fdbe289d6384bde01b71a1a','75g01','徐泽宾','2018-07-26 00:00:00',1,NULL,NULL,'10',15,1,'2018-07-26 11:21:08',NULL),
(10035,'longzongxiao','2dcce462ab4b51d528c52c4c3643df44','ank1a','龙宗筱','2018-07-26 00:00:00',1,NULL,NULL,'10',15,1,'2018-07-26 11:23:41',NULL),
(10036,'qihua','2852a46b26a3d325d030c2bd02c2f587','9xsip','戚华','2018-07-26 00:00:00',1,NULL,NULL,'9',7,1,'2018-07-26 17:07:03',NULL),
(10037,'lixingsheng','e7613a18df40fefd2811ac001ab6a42c','rfdoc','李兴盛','2018-07-26 00:00:00',1,NULL,NULL,'9',7,1,'2018-07-26 17:07:30',NULL);

/* Function  structure for function  `queryChildren` */

/*!50003 DROP FUNCTION IF EXISTS `queryChildren` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildren`(rootid VARCHAR(500),tabname VARCHAR(500)) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);
DECLARE icount INTEGER;
DECLARE tname VARCHAR(500);
SET sTemp = '$';
SET sTempChd = rootid;
set tname=tabname;
if INSTR(tname,'tfw_dept')>0 then
select count(1) into icount from tfw_dept where id=sTempChd;
if icount>0 then
WHILE sTempChd is not NULL DO
if sTempChd <> rootid then 
SET sTemp = CONCAT(sTemp,',',sTempChd);
end if;
SELECT group_concat(id) INTO sTempChd FROM tfw_dept where FIND_IN_SET(pid,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
ELSE
RETURN null;
end if;
end if;
if INSTR(tname,'tfw_role')>0 then
select count(1) into icount from tfw_role where id=sTempChd;
if icount>0 then
WHILE sTempChd is not NULL DO
if sTempChd <> rootid then 
SET sTemp = CONCAT(sTemp,',',sTempChd);
end if;
SELECT group_concat(id) INTO sTempChd FROM tfw_role where FIND_IN_SET(pid,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
ELSE
RETURN null;
end if;
end if;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
