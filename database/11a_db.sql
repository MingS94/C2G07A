/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : 11a_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-04-29 23:26:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_administrator`
-- ----------------------------
DROP TABLE IF EXISTS `t_administrator`;
CREATE TABLE `t_administrator` (
  `AdminId` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(255) DEFAULT '',
  `AdminAccount` varchar(255) DEFAULT '',
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_administrator
-- ----------------------------
INSERT INTO `t_administrator` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `registerButton` bit(1) NOT NULL,
  `loginButton` bit(1) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('', '', '1');

-- ----------------------------
-- Table structure for `t_download_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_download_config`;
CREATE TABLE `t_download_config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DataCategory` varchar(255) DEFAULT NULL,
  `Field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_download_config
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exam`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `ExamId` int(11) NOT NULL AUTO_INCREMENT,
  `Time` datetime DEFAULT NULL,
  `RoomId` varchar(255) DEFAULT '',
  `Subject` varchar(255) DEFAULT '',
  `Category` varchar(255) DEFAULT '',
  PRIMARY KEY (`ExamId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES ('1', '2015-04-10 09:00:00', '2', '绘画', '美术学');
INSERT INTO `t_exam` VALUES ('2', '2015-04-03 09:00:00', '3', '播音学', '播音与主持艺术');
INSERT INTO `t_exam` VALUES ('3', '2015-04-10 09:00:00', '3', '音乐', '音乐学');
INSERT INTO `t_exam` VALUES ('4', '2015-04-03 09:00:00', '2', '音乐', '音乐学');
INSERT INTO `t_exam` VALUES ('5', '2015-04-03 09:00:00', '5', '英语', '插班生');
INSERT INTO `t_exam` VALUES ('6', '2015-04-04 09:00:00', '2', '数学', '推荐生');
INSERT INTO `t_exam` VALUES ('7', '2015-04-04 09:00:00', '3', '绘画', '艺术特长生');

-- ----------------------------
-- Table structure for `t_expert`
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert` (
  `ExpertId` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertName` varchar(255) DEFAULT '',
  `CertificateId` varchar(11) DEFAULT '',
  `MajorIn` varchar(255) DEFAULT '',
  `MobilePhone` varchar(255) DEFAULT '',
  `Email` varchar(255) DEFAULT '',
  `Address` varchar(255) DEFAULT '',
  `UserName` varchar(255) DEFAULT '',
  `Password` varchar(255) DEFAULT '',
  PRIMARY KEY (`ExpertId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES ('1', '方舟几', '1000', '科学', '10001000', '101010@qq.com', 'None', 'fangzhouji', '123');
INSERT INTO `t_expert` VALUES ('2', '李炎', '1001', '英语', '10001001', '101011@qq.com', 'None', 'liyan', '120');
INSERT INTO `t_expert` VALUES ('3', '王芬', '1002', '音乐', '10001002', '101012@qq.com', 'None', 'wangfen', '100');
INSERT INTO `t_expert` VALUES ('4', '张全荡', '1003', '体育', '10001003', '101013@qq.com', 'None', 'zhangquandang', '102');
INSERT INTO `t_expert` VALUES ('5', '赵贴祝', '1004', '数学', '10001004', '101014@qq.com', 'None', 'zhaotiezhu', '111');
INSERT INTO `t_expert` VALUES ('6', '唐波福', '1005', '绘画', '10001005', '101015@qq.com', 'None', 'tangbofu', '122');

-- ----------------------------
-- Table structure for `t_expert_exam`
-- ----------------------------
DROP TABLE IF EXISTS `t_expert_exam`;
CREATE TABLE `t_expert_exam` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExamId` int(11) DEFAULT NULL,
  `ExpertId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expert_exam
-- ----------------------------

-- ----------------------------
-- Table structure for `t_portable_server`
-- ----------------------------
DROP TABLE IF EXISTS `t_portable_server`;
CREATE TABLE `t_portable_server` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ServerName` varchar(255) DEFAULT NULL,
  `ExamPlaceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_portable_server
-- ----------------------------

-- ----------------------------
-- Table structure for `t_room_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_room_info`;
CREATE TABLE `t_room_info` (
  `RoomId` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(255) DEFAULT '',
  `RoomPermitNum` int(11) DEFAULT NULL,
  `RoomName` varchar(255) DEFAULT '',
  PRIMARY KEY (`RoomId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_info
-- ----------------------------
INSERT INTO `t_room_info` VALUES ('2', '上海考点', '30', '华东师范大学中山北路校区文史楼315');
INSERT INTO `t_room_info` VALUES ('3', '浙江考点', '30', '浙江大学育才楼101');
INSERT INTO `t_room_info` VALUES ('4', '安徽考点', '30', '中国科学技术大学图书馆103');
INSERT INTO `t_room_info` VALUES ('5', '山东考点', '30', '山东大学计算机楼200');
INSERT INTO `t_room_info` VALUES ('6', '福建考点', '30', '厦门大学文科楼300');

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `ScoreId` int(11) NOT NULL AUTO_INCREMENT,
  `ExamId` int(11) DEFAULT NULL,
  `StudentId` int(255) DEFAULT NULL,
  `TempId` int(11) DEFAULT NULL,
  `FirstPoint` double DEFAULT NULL,
  `FinalPoint` double DEFAULT NULL,
  `Subject` varchar(255) DEFAULT '',
  `ExpertId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ScoreId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('1', '4', '37', '1', null, null, '音乐', '3');
INSERT INTO `t_score` VALUES ('2', '5', '32', '1', null, null, '英语', '2');
INSERT INTO `t_score` VALUES ('3', '3', '33', '1', null, null, '音乐', '3');
INSERT INTO `t_score` VALUES ('4', '6', '30', '1', null, null, '数学', '5');
INSERT INTO `t_score` VALUES ('5', '7', '36', '1', null, null, '绘画', '6');

-- ----------------------------
-- Table structure for `t_server_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_server_user`;
CREATE TABLE `t_server_user` (
  `ServerUserId` int(11) NOT NULL AUTO_INCREMENT,
  `ServerUserName` varchar(255) DEFAULT NULL,
  `CertificateId` int(11) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `MobilePhone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ServerUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_server_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_server_user_allocate`
-- ----------------------------
DROP TABLE IF EXISTS `t_server_user_allocate`;
CREATE TABLE `t_server_user_allocate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ServerUserId` int(11) DEFAULT NULL,
  `ExamPlaceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_server_user_allocate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_student_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_student_info`;
CREATE TABLE `t_student_info` (
  `StudentId` int(255) NOT NULL AUTO_INCREMENT,
  `IdCard` varchar(255) DEFAULT '',
  `StudentName` varchar(255) DEFAULT '',
  `PhoneNum` varchar(11) DEFAULT '',
  `Category` varchar(255) DEFAULT '',
  `Gender` varchar(255) DEFAULT '',
  `Age` int(11) DEFAULT NULL,
  `ExamPermitNumber` varchar(255) DEFAULT '',
  `RegistrationNumber` varchar(255) DEFAULT '',
  `Password` varchar(255) DEFAULT '',
  `State` bit(1) DEFAULT NULL,
  `Email` varchar(255) DEFAULT '',
  `Address` varchar(255) DEFAULT '',
  `Province` varchar(255) DEFAULT '',
  `Region` varchar(255) DEFAULT '',
  `GraduateSchool` varchar(255) DEFAULT '',
  `Location` varchar(255) DEFAULT '',
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student_info
-- ----------------------------
INSERT INTO `t_student_info` VALUES ('30', '331010199301010000', '张星星', '15510000000', '推荐生', '男', '19', '10112510251000', 'A834966010000', '010000', '', '10111000@qq.com', '天华社区2号', '上海', '浦东', '实验中学', '上海考点');
INSERT INTO `t_student_info` VALUES ('31', '331010199301010001', '王达双', '15510000001', '推荐生', '男', '20', '10112510251001', 'B349547010001', '010001', '', '10111001@qq.com', '中央城1号', '山东', '济南', '济南一中', '山东考点');
INSERT INTO `t_student_info` VALUES ('32', '331010199301010002', '吴不腾', '15510000002', '插班生', '男', '20', '10112510251002', 'C889320010002', '010002', '', '10111002@qq.com', '灯塔录30号', '海南', '三亚', '三亚三中', '山东考点');
INSERT INTO `t_student_info` VALUES ('33', '331010199301010003', '王小双', '15510000003', '音乐学', '女', '18', '10112510251003', 'E839719010003', '010003', '', '10111003@qq.com', '下沙解放路45号', '浙江', '杭州', '杭州十四中', '浙江考点');
INSERT INTO `t_student_info` VALUES ('34', '331010199301010004', '张三', '15510000004', '播音与主持艺术', '男', '18', '10112510251004', 'G914158010004', '010004', '', '10111004@qq.com', '中山北路36号', '上海', '普陀', '华师大附中', '上海考点');
INSERT INTO `t_student_info` VALUES ('35', '331010199301010005', '李辣', '15510000005', '推荐生', '女', '20', '10112510251005', 'A740179010005', '010005', '', '10111005@qq.com', '紫荆路9号', '山东', '青岛', '青岛一中', '山东考点');
INSERT INTO `t_student_info` VALUES ('36', '331010199301010006', '邓特', '15510000006', '艺术特长生', '男', '17', '10112510251006', 'B905848010006', '010006', '', '10111006@qq.com', '环城西路333号', '浙江', '湖州', '湖州一中', '浙江考点');
INSERT INTO `t_student_info` VALUES ('37', '331010199301010007', '张学伟', '15510000007', '音乐学', '男', '19', '10112510251007', 'E295001010007', '010007', '', '10111007@qq.com', '顾村社区2号', '上海', '宝山', '宝山中学', '上海考点');
INSERT INTO `t_student_info` VALUES ('38', '331010199301010008', '李四', '15510000008', '高水平运动员', '男', '18', '10112510251008', 'C753557010008', '010008', '', '10111008@qq.com', '和平路1号', '上海', '徐汇', '徐汇中学', '上海考点');
INSERT INTO `t_student_info` VALUES ('39', '331010199301010009', '刘五', '15510000009', '播音与主持艺术', '男', '18', '10112510251009', 'G163422010009', '010009', '', '10111009@qq.com', '普陀区新华路10号', '浙江', '舟山', '舟山一中', '浙江考点');

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `SubjectId` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(255) DEFAULT '',
  `TimePeriod` int(11) DEFAULT NULL,
  `SubjectDescription` varchar(255) DEFAULT '',
  PRIMARY KEY (`SubjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
