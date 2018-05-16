/*
Navicat MySQL Data Transfer

Source Server         : 47.90.64.158
Source Server Version : 50715
Source Host           : 47.90.64.158:3306
Source Database       : jianshen

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-04-18 20:50:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `nickname` char(16) DEFAULT NULL COMMENT '昵称',
  `status` tinyint(1) DEFAULT '0' COMMENT '0:未启用  1:启用',
  `gid` tinyint(2) DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '0c909a141f1f2c0a1cb602b0b2d7d050', '帅的被人砍', '0', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父id (第一级默认为0)',
  `title` varchar(150) DEFAULT NULL,
  `etitle` varchar(20) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modelid` int(11) NOT NULL COMMENT '模型id',
  `status` tinyint(1) DEFAULT '0' COMMENT '0:不显示 1:导航显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '关于我们', 'aboutus', '关于我们', '关于我们', '3', '1');
INSERT INTO `category` VALUES ('2', '0', '专业课程', 'lesson', '专业课程', '专业课程', '1', '1');
INSERT INTO `category` VALUES ('3', '0', '培训团队', 'teacher', '培训团队', '培训团队', '2', '1');
INSERT INTO `category` VALUES ('4', '0', '就业明星', 'student', '就业明星', '就业明星', '1', '1');
INSERT INTO `category` VALUES ('5', '0', '健身问答', 'question', '健身问答', '健身问答', '1', '1');
INSERT INTO `category` VALUES ('6', '0', '证书查询', 'certificate', '证书查询', '证书查询', '3', '1');
INSERT INTO `category` VALUES ('7', '0', '联系我们', 'callus', '联系我们', '联系我们', '3', '1');
INSERT INTO `category` VALUES ('8', '0', '学院动态', 'news', '学院动态', '学院动态', '1', '0');
INSERT INTO `category` VALUES ('9', '0', '硬件设施', 'yingjian', '硬件设施', '硬件设施', '1', '0');
INSERT INTO `category` VALUES ('10', '0', '学员风采', 'fengcai', '学员风采', '学员风采', '1', '0');
INSERT INTO `category` VALUES ('11', '0', '权威证书', 'qwzs', '权威证书', '权威证书', '1', '0');
INSERT INTO `category` VALUES ('12', '0', '最新动态', 'anews', '最新动态', '最新动态', '1', '0');
INSERT INTO `category` VALUES ('13', '0', '合作单位', 'hzdw', '合作单位', '合作单位', '1', '0');
INSERT INTO `category` VALUES ('16', '0', '中力公告', 'gonggao', '中力公告', '中力公告', '3', '0');

-- ----------------------------
-- Table structure for certificate
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `zscode` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of certificate
-- ----------------------------
INSERT INTO `certificate` VALUES ('1', null, null, null, null, null);
INSERT INTO `certificate` VALUES ('2', '123', '123', '123', null, '123');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `shortnote` varchar(255) DEFAULT NULL COMMENT '概要(导读)',
  `ctime` int(11) DEFAULT NULL COMMENT '添加时间',
  `etime` int(11) DEFAULT NULL COMMENT '最后一次修改时间',
  `catid` int(11) DEFAULT NULL COMMENT '栏目id',
  `modelid` int(11) DEFAULT NULL COMMENT '模型id',
  `status` tinyint(1) DEFAULT '1' COMMENT '0:禁用  1:启用',
  `picurl` varchar(255) DEFAULT NULL COMMENT '封面图地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('2', '中力健身学院学费上调通知', '中力健身学院', '中力健身学院2018年学费正式上调，请学习同学抓紧时间联系课程咨询部门，预约最新课程', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，国家健身教练职业资格证培训基地,中力健身学院2018年学费正式上调，请学习同学抓紧时间联系课程咨询部门，预约最新课程', '1522639431', null, '8', '1', '1', '/uploadfile/20180402/b439fcbd6a9145df6a13dc188581da5b.jpg');
INSERT INTO `content` VALUES ('5', '器械训练区', '中力健身学院器械训练区', '零基础健身教练培训基地，退伍军人培训基地', '中力健身学院-零基础健身教练培训基地', '1522676871', null, '9', '1', '1', '/uploadfile/20180402/50c2ded7ef0836282967392424768eca.jpg');
INSERT INTO `content` VALUES ('6', '器械训练区', '中力健身学院器械训练区', '中力健身学院-零基础健身教练培训基地', '中力健身学院-零基础健身教练培训基地', '1522677413', null, '9', '1', '1', '/uploadfile/20180402/44cad67f878e22002f2ed8bc7cc39343.jpg');
INSERT INTO `content` VALUES ('7', '器械训练区', '中力健身学院', '中力健身学院-零基础健身教练培训基地', '中力健身学院-零基础健身教练培训基地', '1522677509', null, '9', '1', '1', '/uploadfile/20180402/0f524e70e1316c2422321ce8ccda5984.jpg');
INSERT INTO `content` VALUES ('8', '理论教室', '中力健身学院理论教室', '中力健身学院-零基础健身教练培训基地', '中力健身学院-零基础健身教练培训基地', '1522677838', null, '9', '1', '1', '/uploadfile/20180402/06784816d13c6771c781a957c0d6cb44.jpg');
INSERT INTO `content` VALUES ('10', '2018年3月1号开班', '全能私人教练培训班', '中力健身学院2018年开班了', '中力健身学院2018年开班了，3月1号全能私人健身教练培训班开课了', '1522722495', null, '10', '1', '1', '/uploadfile/20180403/dc8aae9410c8ba7df476cb9d016b8513.jpg');
INSERT INTO `content` VALUES ('11', '中力健身学院三月最美学习季', '全能私人教练培训班', '中力健身学院-零基础健身教练培训基地，2018年全能私人教练培训班', '中力健身学院-零基础健身教练培训基地，2018年全能私人教练培训班', '1522724868', null, '10', '1', '1', '/uploadfile/20180403/4c0a85d8642d204e04da40566feb2c5d.jpg');
INSERT INTO `content` VALUES ('12', '错过三个月的你，还会在错过四月吗？开班了！', '全能私人教练培训班', '中力健身学院-零基础健身教练培训基地，国家健身教练职业资格证培训基地，退伍军人培训基地', '中力健身学院-零基础健身教练培训基地，国家健身教练职业资格证培训基地，退伍军人培训基地', '1522725989', null, '10', '1', '1', '/uploadfile/20180403/44fc4a2de7d3cd564a2b93c9e7914004.png');
INSERT INTO `content` VALUES ('13', '最美学习季，选择中力健身学院逆袭人生', '全能私教培训班', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522726615', null, '10', '1', '1', '/uploadfile/20180403/207d86c5e5c4b983dc60366676500205.png');
INSERT INTO `content` VALUES ('14', '国家证书课程', '健身教练证书', '中力健身学院-国家健身教练证书培训基地', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522738602', null, '2', '1', '1', '/uploadfile/20180404/a5f952cec3f3820ce1d12242e3394ca0.jpg');
INSERT INTO `content` VALUES ('16', '普拉提孕产', '普拉提课程，孕产训练师课程', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，国家健身教练职业资格证培训基地', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522808593', null, '2', '1', '1', '/uploadfile/20180404/c8e6a789d67b7f2a7a1c05b7f2028456.jpg');
INSERT INTO `content` VALUES ('21', '张鹏', '健身教练培训导师', '中力健身学院基础实践课培训导师', '天津体育学院体育教育本科毕业\r\n中力健身学院基础实践课培训导师\r\n中力健身学院培训导师认证\r\n中力健身学院基础实践导师\r\n国家职业资格认证\r\n优秀私人健身教练培训师\r\n中国红十字会CPR急救员认证', '1522823353', null, '3', '1', '1', '/uploadfile/20180404/d5aac157a90ff2cd42525ea45766aae8.jpg');
INSERT INTO `content` VALUES ('22', '高坤', '健身教练培训，私教培训导师，健身导师', '中力健身学院-零基础健身教练培训基地', '中力健身学院资深培训导师\r\n中力健身学院基础理论导师\r\n社会体育指导员认证\r\n国家职业健身教练认证\r\n运动营养师认证\r\n从事健身行业5年\r\n3年健身房管理工作', '1522829268', null, '3', '1', '1', '/uploadfile/20180404/0c2cb2aad06395aef3d308683aa1b457.jpg');
INSERT INTO `content` VALUES ('23', '体能训练师课程', '功能性课程，私教小器械', '中力健身学院-体能训练师课程', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522829869', null, '2', '1', '1', '/uploadfile/20180404/34e7eb09d7d755e2cb5ce523bd6b5970.jpg');
INSERT INTO `content` VALUES ('24', '运动康复课程', '运动康复', '中力健身学院-零基础健身教练培训基地', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练\r\n', '1522830002', null, '2', '1', '1', '/uploadfile/20180404/8c7a926d8c72da6acdbfbf7220fcf808.jpg');
INSERT INTO `content` VALUES ('25', '高级私教课程', '高级私人教练，私教课程', '中力健身学院-零基础健身教练培训基地', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522830344', null, '2', '1', '1', '/uploadfile/20180404/23119c098572128b76e569523697aa4e.jpg');
INSERT INTO `content` VALUES ('26', '全能私教课程', '私教课程，私人健身教练课程', '零基础健身教练陪培训', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，培养综合能力更加出色的私人健身教练', '1522830754', null, '2', '1', '1', '/uploadfile/20180404/8bd98a6869290e0cdb7ff75ad36060e1.jpg');
INSERT INTO `content` VALUES ('28', '张倩倩', '普拉提导师', '中力健身学院普拉提导师', '中力健身学院普拉提培训师\r\n中力健身学院培训师资格认证\r\n毕业于山西省体育学院\r\n国家一级运动员\r\n高级社会体育指导员\r\n李欣普拉提认证', '1523063970', null, '3', '1', '1', '/uploadfile/20180407/c8e8d1dea464ce1d98f461b2147b6cf3.jpg');
INSERT INTO `content` VALUES ('29', '王新德', '康复导师', '中力健身学院-康复导师', '中力健身学院培训导师资质认证\r\n中力健身学院运动康复师培训认证\r\n国际运动康复师证书\r\n美国国家运动医学会认证私人教练\r\n动态神经肌肉稳定技术认证\r\n南京体育学院运动系毕业\r\n国家二级运动员', '1523064038', null, '3', '1', '1', '/uploadfile/20180407/79b1ad2a5bc7941508330c86123a13ea.jpg');
INSERT INTO `content` VALUES ('30', '王铮', '培训团队', '中力健身学院-康复导师', '中力健身学院康复导师\r\n中力健身学院培训导师认证\r\n物理治疗师认证\r\n诺亚第拉伸疗法认证\r\nFMS功能性动作筛查认证\r\nSFMA选择性功能动作评估认证\r\nATSI解剖列车认证', '1523064117', null, '3', '1', '1', '/uploadfile/20180407/333c65360800a4b2e46b3fbcb31c90d5.jpg');
INSERT INTO `content` VALUES ('31', '张玉全', '基础实践导师', '中力健身学院基础实践导师', '国家一级健身指导员\r\n健美运动健将。高级培训导师。\r\n2005年~2017年济南市健美锦标赛75公斤， 冠军全场总冠军。 \r\n2007年，2008年，2009年，2010年，2011年，2013年山东省健美锦标赛80公斤级亚军.\r\n2012年至2016年山东省健美锦标赛75公斤级冠军.\r\n2017年山东省健美精英赛75公斤级冠军。\r\n2015年全国健美锦标赛75公斤级第6名，\r\n2015年全国冠军总决赛75公斤级第5名，男子古典健美第5名，\r\n2015一2016年潍坊市健美比赛75公斤级冠军。全场冠军。', '1523064201', null, '3', '1', '1', '/uploadfile/20180407/2c526a339d989fbf15ad7b58e759af65.jpg');
INSERT INTO `content` VALUES ('33', '帝豪斯健身', '中力健身学院合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523064923', null, '13', '1', '1', '/uploadfile/20180407/ec3a8770ae97d1009da7e0b74b91f923.jpg');
INSERT INTO `content` VALUES ('34', '浩沙健身', '中力健身学院合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523064966', null, '13', '1', '1', '/uploadfile/20180407/4551e9e09811b26a177b953c56a43752.jpg');
INSERT INTO `content` VALUES ('35', '金仕堡健身', '中力健身学院合作单位', '中力健身学院合作单位中力健身学院合作单位', '中力健身学院合作单位', '1523065013', null, '13', '1', '1', '/uploadfile/20180407/6ceafbf74eed1e5b51a14d75b9aa24fd.jpg');
INSERT INTO `content` VALUES ('36', '星之健健身', '合作单位', '中力健身学院合作单位', '中力健身学院零基础健身教练培训基地', '1523151310', null, '13', '1', '1', '/uploadfile/20180408/535a6b107f68c9c7a27e562d353909e5.jpg');
INSERT INTO `content` VALUES ('37', '奇迹健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151388', null, '13', '1', '1', '/uploadfile/20180408/75fa936f78862ce2d2d174c1449bab69.jpg');
INSERT INTO `content` VALUES ('38', '黑骏马健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151425', null, '13', '1', '1', '/uploadfile/20180408/3b34a74890dc4bf9c5dd51ea04fe6c2e.jpg');
INSERT INTO `content` VALUES ('39', '锐利100健身', '中力健身学院合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151454', null, '13', '1', '1', '/uploadfile/20180408/1ead1e7ad0a781747162cf9cfb2ab67b.jpg');
INSERT INTO `content` VALUES ('40', '中体倍力', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151584', null, '13', '1', '1', '/uploadfile/20180408/d4ac5ae87f118f70846f6430edc38bd8.jpg');
INSERT INTO `content` VALUES ('41', '古德菲力', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151632', null, '13', '1', '1', '/uploadfile/20180408/8bd7329d0a3be9152002ca213e0cf179.jpg');
INSERT INTO `content` VALUES ('42', '美格菲健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151682', null, '13', '1', '1', '/uploadfile/20180408/15fba1e2d84c5894db665881150e6737.jpg');
INSERT INTO `content` VALUES ('44', '亚历山大', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151791', null, '13', '1', '1', '/uploadfile/20180408/9bb42c13a57dd71deec6ae1f5533147b.jpg');
INSERT INTO `content` VALUES ('45', '英派斯健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151823', null, '13', '1', '1', '/uploadfile/20180408/c94f3244a429cf887fb63e128c3669b3.jpg');
INSERT INTO `content` VALUES ('46', '舒适堡健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151847', null, '13', '1', '1', '/uploadfile/20180408/9944082d0f3a2818c4054c3f38b2e8bd.jpg');
INSERT INTO `content` VALUES ('47', '青鸟健身', '合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523151969', null, '13', '1', '1', '/uploadfile/20180408/0cffa615d98849905a134c7ffe53a1bb.jpg');
INSERT INTO `content` VALUES ('48', '威尔士健身', '合作单位', '合作单位', '中力健身学院合作单位', '1523152169', null, '13', '1', '1', '/uploadfile/20180408/e9f9de333642f1d4ed6c886a5ec510f6.jpg');
INSERT INTO `content` VALUES ('49', '宝力豪', '中力健身学院合作单位', '中力健身学院合作单位', '中力健身学院合作单位', '1523152208', null, '13', '1', '1', '/uploadfile/20180408/851f28474f962e563dacb9e323f52b51.jpg');
INSERT INTO `content` VALUES ('50', '张继帅-舒适堡', '就业明星', '中力健身学院就业明星', '16000', '1523153129', null, '4', '1', '1', '/uploadfile/20180408/b62d59702427e958f4382aa3eb6fa0ef.png');
INSERT INTO `content` VALUES ('52', '张国徽-中航健身', '就业明星', '中力健身学院就业明星', '13000', '1523256959', null, '4', '1', '1', '/uploadfile/20180409/718786fd18353ae079f88d253504195c.jpg');
INSERT INTO `content` VALUES ('53', '张浩-中航健身', '就业明星', '中力健身学院-就业明星', '16000', '1523257431', null, '4', '1', '1', '/uploadfile/20180409/574612a8d1b7928644b8f93d74097e8e.jpg');
INSERT INTO `content` VALUES ('54', '邱东亮-中航健身', '就业明星', '中力健身学院就业明星', '18000', '1523257482', null, '4', '1', '1', '/uploadfile/20180409/06fe2cb6cd17a1b1b2333d85b083ad95.jpg');
INSERT INTO `content` VALUES ('55', '格斗证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523272973', null, '11', '1', '1', '/uploadfile/20180409/82e5e6b55b449702851b0509ccd119b8.jpg');
INSERT INTO `content` VALUES ('56', '单车教练证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273020', null, '11', '1', '1', '/uploadfile/20180409/4fc97d49b3918844086d874aa4d051e9.jpg');
INSERT INTO `content` VALUES ('57', '运动康复理疗师证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273086', null, '11', '1', '1', '/uploadfile/20180409/d979949238bb103d3cd4508918b3ab52.jpg');
INSERT INTO `content` VALUES ('58', '普拉提孕产训练师证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273120', null, '11', '1', '1', '/uploadfile/20180409/5968839168c2e65e202f3995bba3b822.jpg');
INSERT INTO `content` VALUES ('59', '体能训练师证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273260', null, '11', '1', '1', '/uploadfile/20180409/c8b719246936182fa69a9b888c762271.jpg');
INSERT INTO `content` VALUES ('60', '高级私教证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273314', null, '11', '1', '1', '/uploadfile/20180409/561af9827b801f532e6165f554faa240.jpg');
INSERT INTO `content` VALUES ('62', '运动营养师证书', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273569', null, '11', '1', '1', '/uploadfile/20180409/dc8e55891d200901fd0e59844c859b8e.jpg');
INSERT INTO `content` VALUES ('63', '国家健身教练职业资格证', '权威证书', '中力健身学院权威证书', '中力健身学院权威证书', '1523273613', null, '11', '1', '1', '/uploadfile/20180411/060cd530c4bfeab87887708153e66543.jpg');
INSERT INTO `content` VALUES ('64', '健身教练证书你必须了解的真相！', '健身教练证书', '健身教练证书', '健身教练证书有哪些', '1523358483', null, '12', '1', '1', '');
INSERT INTO `content` VALUES ('65', '2018年健身教练最新发展分析：专业是核心', '健身教练发展', '健身教练发展如何', '2018年健身教练最新发展分析', '1523358940', null, '12', '1', '1', '');
INSERT INTO `content` VALUES ('66', '中力健身学院课程预定流程', '课程预定', '中力健身学院课程预定流程', '中力健身学院课程需要提前预定，提前安排学员住宿，提交国家健身教练职业资格证报考资料，请各位想要学习的同学抓紧时间预定', '1523360643', null, '8', '1', '1', '/uploadfile/20180410/9afc42622c1ab7267d766e1d2f1c709c.jpg');
INSERT INTO `content` VALUES ('67', '健身教练发展方向分析', '健身教练发展', '健身教练发展如何', '健身教练发展怎么样，有发展前景吗', '1523361459', null, '12', '1', '1', '');
INSERT INTO `content` VALUES ('68', '中力健身学院课程预定金问题', '预定健身教练课程', '预定健身教练课程', '中力健身学院课程需要提前预定，提前申请学习，学费优惠2000元，插班生将按照原价收取学习费用，预定后学习快递相关学习教材和物品', '1523362815', null, '8', '1', '1', '/uploadfile/20180410/6a80bbffe0ef481d5788aae7d07af918.jpg');
INSERT INTO `content` VALUES ('69', '2018年学费已经上调至16800元，将学习的学员抓紧预定课程，提前预订享受学费优惠', '2018年学费已经上调至16800元，将学习的学员抓紧预定课程，提前预订享受学费优惠', '2018年学费已经上调至16800元，将学习的学员抓紧预定课程，提前预订享受学费优惠', '2018年学费已经上调至16800元，将学习的学员抓紧预定课程，提前预订享受学费优惠', null, null, '16', '3', '1', null);
INSERT INTO `content` VALUES ('72', '关于我们', '关于我们', '关于我们', '关于我们', '1523522019', null, '1', '3', '1', null);
INSERT INTO `content` VALUES ('73', '中力健身学院课程需要提前预定吗', '课程预定', '', '中力健身学院课程需要提前预定，课程预定金300元，计算在学费内，学校将提前为学员申报国家健身教练职业资格证书培训考试名额', '1524050025', null, '5', '1', '1', '');
INSERT INTO `content` VALUES ('74', '中力健身学院就业安置是什么样的', '健身教练就业', '中力健身学院就业安置是什么样的', '中力健身学院上万家合作单位，学员入学签订就业协议，毕业前两周安排就业意向调查，学员填写就业意向调查表，根据学员意向城市安排工作，同时学校承诺终身就业负责！~', '1524050940', null, '5', '1', '1', '');
INSERT INTO `content` VALUES ('75', '中力健身学院能帮我安排回老家工作吗', '', '', '中力健身学院能帮我安排回老家工作吗', '1524054750', null, '5', '1', '1', '');

-- ----------------------------
-- Table structure for flink
-- ----------------------------
DROP TABLE IF EXISTS `flink`;
CREATE TABLE `flink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `flink` varchar(150) DEFAULT NULL COMMENT '友情链接',
  `type` varchar(255) DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flink
-- ----------------------------

-- ----------------------------
-- Table structure for focuspic
-- ----------------------------
DROP TABLE IF EXISTS `focuspic`;
CREATE TABLE `focuspic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picurl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `type` tinyint(1) DEFAULT '0' COMMENT '预留',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `note` varchar(255) DEFAULT NULL COMMENT '内容',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focuspic
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `idcard` varchar(150) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for news_data
-- ----------------------------
DROP TABLE IF EXISTS `news_data`;
CREATE TABLE `news_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT 'content表id',
  `note` text,
  `note_pc` varchar(255) DEFAULT NULL,
  `note_m` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_data
-- ----------------------------
INSERT INTO `news_data` VALUES ('1', '2', '<p>中力健身学院-中国零基础健身教练培训基地，国家健身教练职业资格证培训基地，以实战为核心，就业为导向，培养综合能力更加出色的私人健身教练</p><p><strong>2018年学费上涨通知</strong><br/></p><p>2017年学费14800元，提前预定课程免费参加国家健身教练职业资格证培训。截至日期2017年11月20号<br/></p><p>2017年11月20号后学费上涨到16800元，参加国家健身教练职业资格证考试，需额外缴费<br/></p><p>学习时间：三个月<br/></p><p>上课时间：每周周日休息，上午9：00-11：30，下午14：00-16：30<br/></p><p>住宿费用：住宿每月500元，4-6人间<br/></p><p><img src=\"/ueditor/php/upload/image/20180402/1522639425277499.jpg\" title=\"1522639425277499.jpg\" alt=\"15129597172591.jpg\" width=\"601\" height=\"289\" style=\"width: 601px; height: 289px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('2', '3', '<p>中力健身学院-中国零基础健身教练培训基地，国家健身教练职业资格证培训基地，以实战为核心，就业为导向，培养综合能力更加出色的私人健身教练</p><p><strong>2018年学费上涨通知</strong><br/></p><p>2017年学费14800元，提前预定课程免费参加国家健身教练职业资格证培训。截至日期2017年11月20号<br/></p><p>2017年11月20号后学费上涨到16800元，参加国家健身教练职业资格证考试，需额外缴费<br/></p><p>学习时间：三个月<br/></p><p>上课时间：每周周日休息，上午9：00-11：30，下午14：00-16：30<br/></p><p>住宿费用：住宿每月500元，4-6人间<br/></p><p><img src=\"/ueditor/php/upload/image/20180402/1522639425277499.jpg\" title=\"1522639425277499.jpg\" alt=\"15129597172591.jpg\" width=\"601\" height=\"289\" style=\"width: 601px; height: 289px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('3', '4', '<p>器械训练区</p><p><img src=\"/ueditor/php/upload/image/20180402/1522676833906180.jpg\" title=\"1522676833906180.jpg\" alt=\"微信图片_20180303165945_副本.jpg\" width=\"557\" height=\"425\" style=\"width: 557px; height: 425px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180402/1522676860420173.jpg\" title=\"1522676860420173.jpg\" alt=\"营养照片 (4).jpg\" width=\"559\" height=\"342\" style=\"width: 559px; height: 342px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('4', '5', '<p>器械训练区</p><p><img src=\"/ueditor/php/upload/image/20180402/1522676833906180.jpg\" title=\"1522676833906180.jpg\" alt=\"微信图片_20180303165945_副本.jpg\" width=\"557\" height=\"425\" style=\"width: 557px; height: 425px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180402/1522676860420173.jpg\" title=\"1522676860420173.jpg\" alt=\"营养照片 (4).jpg\" width=\"559\" height=\"342\" style=\"width: 559px; height: 342px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('8', '9', '<p>2018年第一期全能私人健身教练培训班开课了<br/></p>', null, null);
INSERT INTO `news_data` VALUES ('9', '10', '<p>2018年第一期全能私人健身教练培训班开课了<br/></p>', null, null);
INSERT INTO `news_data` VALUES ('10', '11', '<p>全能私人教练培训班正式开课，错过三月的你，还会错过四月吗</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180403/1522724822107388.jpg\" title=\"1522724822107388.jpg\" alt=\"3月1号开班 (6).jpg\" width=\"447\" height=\"282\" style=\"width: 447px; height: 282px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180403/1522724794632714.jpg\" title=\"1522724794632714.jpg\" alt=\"3月1号开班 (4).jpg\" width=\"449\" height=\"319\" style=\"width: 449px; height: 319px;\"/></p><p><br/></p><p><br/></p>', null, null);
INSERT INTO `news_data` VALUES ('11', '12', '<p>错过三个月的你，还会在错过四月吗？开班了！<br/></p><p>中力健身学院-零基础健身教练培训基地，国家健身教练职业资格证培训基地，退伍军人培训基地</p><p><img src=\"/ueditor/php/upload/image/20180403/1522725901321333.jpg\" title=\"1522725901321333.jpg\" alt=\"3月1号开班 (2).jpg\" width=\"674\" height=\"457\" style=\"width: 674px; height: 457px;\"/></p><p><br/></p><p><br/></p><div id=\"edui1_bottombar\" class=\"edui-editor-bottomContainer edui-default\" style=\"word-wrap: break-word; width: auto; height: auto; overflow: hidden;\"><table class=\"edui-default\" style=\"word-wrap: break-word; width: 1210px; empty-cells: show; border-spacing: 0px; height: 0px; overflow: hidden;\"><tbody class=\"edui-default\" style=\"word-wrap: break-word;\"><tr class=\"edui-default firstRow\" style=\"word-wrap: break-word;\"><td id=\"edui1_elementpath\" class=\"edui-editor-bottombar edui-default\" style=\"word-wrap: break-word; margin: 0px; padding: 0px; font-family: Arial, Helvetica, Tahoma, Verdana, sans-serif; font-size: 12px; color: rgb(51, 51, 51); -webkit-font-smoothing: antialiased; white-space: nowrap; border-top-color: rgb(204, 204, 204); line-height: 20px;\"><div class=\"edui-editor-breadcrumb\" style=\"word-wrap: break-word; width: auto; height: auto; margin: 2px 0px 0px 3px;\">元素路径:&nbsp;<span unselectable=\"on\" style=\"word-wrap: break-word; cursor: pointer; text-decoration-line: underline; color: blue;\">body</span>&nbsp;&gt;&nbsp;<span unselectable=\"on\" style=\"word-wrap: break-word; cursor: pointer; text-decoration-line: underline; color: blue;\">p</span>&nbsp;&gt;&nbsp;<span unselectable=\"on\" style=\"word-wrap: break-word; cursor: pointer; text-decoration-line: underline; color: blue;\">img</span></div></td><td id=\"edui1_wordcount\" class=\"edui-editor-wordcount edui-default\" style=\"word-wrap: break-word; margin: 0px 5px 0px 0px; padding: 0px; font-family: Arial, Helvetica, Tahoma, Verdana, sans-serif; font-size: 12px; color: rgb(170, 170, 170); -webkit-font-smoothing: antialiased; text-align: right; white-space: nowrap; border-top-color: rgb(204, 204, 204); line-height: 20px;\">当前已输入66个字符, 您还可以输入9934个字符。</td></tr></tbody></table></div><div id=\"edui1_scalelayer\" class=\"edui-default\" style=\"word-wrap: break-word; width: auto; height: auto;\"></div><div id=\"edui1_imagescale_cover\" style=\"word-wrap: break-word; width: 1211px; height: 605px; position: absolute; z-index: 999; opacity: 0; background: rgb(204, 204, 204); top: 85px; left: 0px;\"></div><div id=\"edui1_imagescale\" class=\"edui-editor-imagescale\" style=\"word-wrap: break-word; position: absolute; border: 1px solid rgb(59, 119, 255); box-sizing: content-box; width: 626px; height: 808px; z-index: 999; left: 7px; top: 636px;\"><span class=\"edui-editor-imagescale-hand0\" style=\"word-wrap: break-word; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: nw-resize; top: 0px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体;\"></span><span class=\"edui-editor-imagescale-hand1\" style=\"word-wrap: break-word; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: n-resize; top: 0px; margin-top: -4px; left: 313px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体;\"></span></div>', null, null);
INSERT INTO `news_data` VALUES ('12', '13', '<p>最美学习季节，2018年3月15<img src=\"http://jianshen.pc0.cc/h/lib/ueditor/1.4.3/themes/default/images/spacer.gif\" word_img=\"file:///C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\SGPicFaceTpBq\\5032\\008BE480.png\" style=\"background:url(http://jianshen.pc0.cc/h/lib/ueditor/1.4.3/lang/zh-cn/images/localimage.png) no-repeat center center;border:1px solid #ddd\"/>课程已经开启，请各位抓紧时间预定四月份课程，名额有限！</p><p><img src=\"/ueditor/php/upload/image/20180403/1522726552777413.jpg\" title=\"1522726552777413.jpg\" alt=\"1.jpg\" width=\"615\" height=\"405\" style=\"width: 615px; height: 405px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180403/1522726571422883.jpg\" title=\"1522726571422883.jpg\" alt=\"2.jpg\" width=\"616\" height=\"356\" style=\"width: 616px; height: 356px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('13', '14', '<p><strong>国家健身教练职业资格证培训课程</strong></p><p>费用：3600元</p><p>培训考试时间：有体育总局指定时间</p><p><strong>培训内容</strong></p><p>1：健身教练职业介绍</p><p>2：人体运动基础</p><p>3：健康与运动的合理营养</p><p>4：健康体适能概论</p><p>5：运动技术</p><p>6：运动计划</p><p>7：运动损伤的预防与处理</p><p>8：体重控制</p><p>9：特殊人群的健身运动</p><p>10：课程销售于客户服务<br/></p><p><img src=\"/ueditor/php/upload/image/20180404/1522806653135911.jpg\" title=\"1522806653135911.jpg\" alt=\"微信图片_20180404095010.jpg\" width=\"655\" height=\"444\" style=\"width: 655px; height: 444px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180404/1522806669829848.jpg\" title=\"1522806669829848.jpg\" alt=\"微信图片_20180404095015.jpg\" width=\"1\" height=\"1\" style=\"width: 1px; height: 1px;\"/><img src=\"/ueditor/php/upload/image/20180404/1522806689629689.jpg\" title=\"1522806689629689.jpg\" alt=\"微信图片_20180404095015.jpg\" width=\"656\" height=\"497\" style=\"width: 656px; height: 497px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('14', '15', '<p><strong>国家健身教练职业资格证培训课程</strong></p><p>费用：3600元</p><p>培训考试时间：有体育总局指定时间</p><p><strong>培训内容</strong></p><p>1：健身教练职业介绍</p><p>2：人体运动基础</p><p>3：健康与运动的合理营养</p><p>4：健康体适能概论</p><p>5：运动技术</p><p>6：运动计划</p><p>7：运动损伤的预防与处理</p><p>8：体重控制</p><p>9：特殊人群的健身运动</p><p>10：课程销售于客户服务<br/></p><p><img src=\"/ueditor/php/upload/image/20180404/1522806653135911.jpg\" title=\"1522806653135911.jpg\" alt=\"微信图片_20180404095010.jpg\" width=\"655\" height=\"444\" style=\"width: 655px; height: 444px;\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20180404/1522806669829848.jpg\" title=\"1522806669829848.jpg\" alt=\"微信图片_20180404095015.jpg\" width=\"1\" height=\"1\" style=\"width: 1px; height: 1px;\"/><img src=\"/ueditor/php/upload/image/20180404/1522806689629689.jpg\" title=\"1522806689629689.jpg\" alt=\"微信图片_20180404095015.jpg\" width=\"656\" height=\"497\" style=\"width: 656px; height: 497px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('15', '16', '<p><strong>普拉提训练课程（60课时）重点，难点</strong></p><p>普拉提主要是锻炼人体深层的小肌肉，维持和改善外观正常活动姿势、达到身体平衡、创展躯干和肢体的活动范围和活动能力、强调对核心肌群的控制、加强人脑对肢体及骨骼肌肉组织的神经感应及支配，再配合正确的呼吸方法所进行的一项全身协调运动。</p><p>1、普拉提历史背景、发展、原则及概念</p><p>2、普拉提之呼吸</p><p>2、1评估与激活</p><p>2、2呼吸的机巧与应用</p><p>3、普拉提之健康的骨骼排列</p><p>3、1体态评估</p><p>3、2普拉提之有关脊柱的训练：针对椎体不稳、颈后大包、脊柱侧弯、平背、驼背等常见问题</p><p>3、3普拉提之有关骨盆的训练：针对骨盆倾斜、回旋等常见问题</p><p>3、4普拉提之有关肩胛的训练：针对翼状肩胛、耸肩、圆肩、手臂活动受限等常见问题</p><p>4、普拉提之稳定的深层核心</p><p>4、1横膈膜的训练及应用</p><p>4、2腹横机的训练及应用</p><p>4、3多裂肌的训练及应用</p><p>4、4骨盆底肌的训练及应用</p><p><strong>5、普拉提之塑形主题课程</strong></p><p>5、1腰腹塑形</p><p>5、2即时美臀</p><p>5、3美背训练</p><p>5、4告别X、O型腿</p><p><strong>6、普拉提之孕前产后</strong></p><p>6、1孕前训练</p><p>6、2产后骨盆底肌、腹直肌分离的恢复训练</p><p>6、3产后关节稳定训练</p><p>6、4产后如何快速恢身材</p><p><strong>7、普拉提之中高级训练</strong></p><p><strong>8、普拉提之小器械的应用</strong></p><p><strong>9、普拉提之课程编排、训练计划的制定</strong></p><p><strong>10、普拉提之开单技巧&nbsp;</strong></p>', null, null);
INSERT INTO `news_data` VALUES ('16', '17', '<p><span style=\"font-size: 18px;\"><strong>高级私教课程大纲</strong></span></p><p><span style=\"color: rgb(255, 0, 0);\"><strong>私人健身教练基础理论（90课时）基础、重点</strong></span></p><p>中力健身学院针对零基础学院开展全能私人教练培训，新人需要从基础的理论知识开始学习，逐步掌握私人教练高级核心技能，基础知识中运动解剖学是必须掌握的专业理论知识，肌肉机构、功能对于后期掌握高级课程有重要的作用，只有掌握理论知识，才能从原理上掌握私人教练各项技能，以及在实施健身计划时，如何针对不同人群，例如老人、孕妇、甚至是儿童，制定针对性训练</p><p>一、运动解剖学</p><p>1.运动系统：骨骼系统和肌肉系统。骨骼，骨骼肌，训练动作的解剖学分析</p><p>2.呼吸系统：呼吸道，肺部，健身运动对呼吸系统的影响</p><p>3.心血管系统：心、血管，健身运动对心血管系统的影响</p><p>4.神经系统：神经系统概述，健身运动和神经系统，本体感受器</p><p>5.人体的生长发育：人体生长发育的规律，影响生长发育的因素，</p><p>二：运动营养学</p><p>1.运动营养基础：宏量营养素，微量营养素，运动与水，运动与能量</p><p>2.健康膳食指导：运动、营养与健康、抗氧化、免疫、膳食平衡</p><p>3.营养与健身运动：健身运动与能量平衡，健身运动的合理膳食营养，不同健身人群营养需求</p><p>4.常见的运动营养补剂：增加肌肉合成代谢与肌力补剂，促进能量代谢的营养补剂，疲劳消除与体能恢复的补剂，减轻与控制体重的运动补剂，运动补剂补充的误区</p><p><br/></p><p>三、运动生理学</p><p>1.运动的能量代谢：运动状态下的能量代谢</p><p>2.肌肉活动：肌肉收缩与缩张原理，肌纤维类型与运动能力</p><p>3.血液循环：心脏生理，血管生理，心血管活动的调节，运动训练对心血管功能的影响</p><p>4.肌肉力量：肌肉力量的训练</p><p>5.有氧工作能力：有氧耐力训练</p><p>6.速度和无氧耐力：平衡、灵敏与柔韧、运动过长中人体机能状态的变化</p><p>7.健身运动与生理学：肥胖与体重控制，体适能与运动处方，慢性疾病患者与运动</p><p>四：运动生物力学</p><p>1.人体动作结构的生理学基础：人体动作结构的基本形式，人体动作机构的动作系统，人体运动系统的技能特征，骨骼、关节、肌肉的特征。</p><p>2.人体运动的平衡与稳定</p><p>3.人体平衡的力学条件</p><p>4.肌肉力量训练的基础原理与应用</p><p>五：健康体适能</p><p>1.肌力与肌肉耐力</p><p>2.心肺功能</p><p>3.人体组合百分比</p><p>4.柔韧性测试</p><p>六：训练原则和训练计划的制定</p><p>1.健身计划制定：针对不同人群需要制定相对应的健身计划</p><p>2.饮食计划制定：针对不同人群饮食需求制定针对性的饮食计划</p><p>七：健身行业介绍</p><p>1.健身教练的概念</p><p>2.健身教练的职责</p><p>3.健身教练的职业发展</p><p>4.健身教练必备素质</p><p><br/></p><p><span style=\"color: rgb(255, 0, 0);\"><strong>私人教练基础实践（90课时）重点</strong></span></p><p>私教课程实战技术及指导方法、针对身体肌肉的训练方式，包括表层肌肉，深层肌肉，固定器械使用，自由器械使用，以及肌肉拉伸，放松。私人健身教练不仅要掌握专业的力量训练，还要掌握常见的有氧训练方法，以及如何针对不同人群制定健身计划，实施健身计划，本课程有山西健美冠军刘云老师亲自授课</p><p>1、抗阻力训练：相关术语，抗阻力训练的原则，各肌肉抗阻力训练手段，器械使用（固定器械使用，自由器械使用）</p><p>2、伸展运动：静态拉伸和PNF拉伸，浅层肌肉（胸部、背部、腿部、肩部、手臂，臀部）拉伸方法</p><p>3、有氧运动：跑步技术，踏板技术，多功能仪，跳绳技术，有氧运动注意事项</p><p>4、形体训练</p><p>5、模拟教学</p><p>6、私教一对一教学、私教小团队教学演练</p><p><br/></p><p><span style=\"color: rgb(255, 0, 0);\"><strong>普拉提训练课程（60课时）重点，难点</strong></span></p><p>普拉提主要是锻炼人体深层的小肌肉，维持和改善外观正常活动姿势、达到身体平衡、创展躯干和肢体的活动范围和活动能力、强调对核心肌群的控制、加强人脑对肢体及骨骼肌肉组织的神经感应及支配，再配合正确的呼吸方法所进行的一项全身协调运动。</p><p>1、普拉提历史背景、发展、原则及概念</p><p>2、普拉提之呼吸</p><p>2、1评估与激活</p><p>2、2呼吸的机巧与应用</p><p>3、普拉提之健康的骨骼排列</p><p>3、1体态评估</p><p>3、2普拉提之有关脊柱的训练：针对椎体不稳、颈后大包、脊柱侧弯、平背、驼背等常见问题</p><p>3、3普拉提之有关骨盆的训练：针对骨盆倾斜、回旋等常见问题</p><p>3、4普拉提之有关肩胛的训练：针对翼状肩胛、耸肩、圆肩、手臂活动受限等常见问题</p><p>4、普拉提之稳定的深层核心</p><p>4、1横膈膜的训练及应用</p><p>4、2腹横机的训练及应用</p><p>4、3多裂肌的训练及应用</p><p>4、4骨盆底肌的训练及应用</p><p>5、普拉提之塑形主题课程</p><p>5、1腰腹塑形</p><p>5、2即时美臀</p><p>5、3美背训练</p><p>5、4告别X、O型腿</p><p>6、普拉提之孕前产后</p><p>6、1孕前训练</p><p>6、2产后骨盆底肌、腹直肌分离的恢复训练</p><p>6、3产后关节稳定训练</p><p>6、4产后如何快速恢身材</p><p>7、普拉提之中高级训练</p><p>8、普拉提之小器械的应用</p><p>9、普拉提之课程编排、训练计划的制定</p><p>10、普拉提之开单技巧&nbsp;</p><p><br/></p><p><strong><span style=\"color: rgb(255, 0, 0);\">功能性训练课程（90课时）&nbsp; 重点</span></strong></p><p>功能性训练起源于损伤康复。物理治疗师在治疗运动员的损伤时通常得出这样的结论：损伤由于稳定肌功能欠佳，作用力转移至另一肌肉造成。一般来说，功能欠佳的肌肉为髋关节，脊柱或者肩胛-胸关节的稳定肌。这里就出现了一个明显的趋势：似乎总是相同的肌肉发生损伤。物理治疗师指出，薄弱环节常常存在于深层腹肌（腹横肌和腹内斜肌），髋关节稳定肌群（臀中肌，内收肌，腰方肌和髋关节外旋肌群）和肩胛骨后缩肌群（下斜方肌和菱形肌）之中。于是人们便开始重视物理治疗师所说的功能持续性欠佳的肌肉，以保证运动员以最正确最安全的技术完成基本的动作</p><p>1：健身球训练</p><p>2：悬挂训练</p><p>3：BOSO球训练</p><p>4：徒手锻炼</p><p>5：弹力带锻炼</p><p>6：敏捷梯训练</p><p>7：药球训练</p><p>8：泡沫轴训练，泡沫轴在运动康复中的应用</p><p>9：翻滚大轮胎的技术要领</p><p>10：功能性地胶训练</p><p>11：青少年体适能训练</p><p>12：特殊人群体适能训练</p>', null, null);
INSERT INTO `news_data` VALUES ('18', '19', '<p><span style=\"font-size: 20px; color: rgb(255, 0, 0);\"><strong>全能私教课程1</strong></span></p><p><strong>开课时间：每月1号、十五号，春节期间不开课</strong></p><p><strong>私人健身教练基础理论（90课时）基础、重点</strong></p><p>中力健身学院针对零基础学院开展全能私人教练培训，新人需要从基础的理论知识开始学习，逐步掌握私人教练高级核心技能，基础知识中运动解剖学是必须掌握的专业理论知识，肌肉机构、功能对于后期掌握高级课程有重要的作用，只有掌握理论知识，才能从原理上掌握私人教练各项技能，以及在实施健身计划时，如何针对不同人群，例如老人、孕妇、甚至是儿童，制定针对性训练</p><p>一、运动解剖学</p><p>1.运动系统：骨骼系统和肌肉系统。骨骼，骨骼肌，训练动作的解剖学分析</p><p>2.呼吸系统：呼吸道，肺部，健身运动对呼吸系统的影响</p><p>3.心血管系统：心、血管，健身运动对心血管系统的影响</p><p>4.神经系统：神经系统概述，健身运动和神经系统，本体感受器</p><p>5.人体的生长发育：人体生长发育的规律，影响生长发育的因素，</p><p>二：运动营养学</p><p>1.运动营养基础：宏量营养素，微量营养素，运动与水，运动与能量</p><p>2.健康膳食指导：运动、营养与健康、抗氧化、免疫、膳食平衡</p><p>3.营养与健身运动：健身运动与能量平衡，健身运动的合理膳食营养，不同健身人群营养需求</p><p>4.常见的运动营养补剂：增加肌肉合成代谢与肌力补剂，促进能量代谢的营养补剂，疲劳消除与体能恢复的补剂，减轻与控制体重的运动补剂，运动补剂补充的误区</p><p>三、运动生理学</p><p>1.运动的能量代谢：运动状态下的能量代谢</p><p>2.肌肉活动：肌肉收缩与缩张原理，肌纤维类型与运动能力</p><p>3.血液循环：心脏生理，血管生理，心血管活动的调节，运动训练对心血管功能的影响</p><p>4.肌肉力量：肌肉力量的训练</p><p>5.有氧工作能力：有氧耐力训练</p><p>6.速度和无氧耐力：平衡、灵敏与柔韧、运动过长中人体机能状态的变化</p><p>7.健身运动与生理学：肥胖与体重控制，体适能与运动处方，慢性疾病患者与运动</p><p><br/></p><p>四：运动生物力学</p><p>1.人体动作结构的生理学基础：人体动作结构的基本形式，人体动作机构的动作系统，人体运动系统的技能特征，骨骼、关节、肌肉的特征。</p><p>2.人体运动的平衡与稳定</p><p>3.人体平衡的力学条件</p><p>4.肌肉力量训练的基础原理与应用</p><p>五：健康体适能</p><p>1.肌力与肌肉耐力</p><p>2.心肺功能</p><p>3.人体组合百分比</p><p>4.柔韧性测试</p><p>六：训练原则和训练计划的制定</p><p>1.健身计划制定：针对不同人群需要制定相对应的健身计划</p><p>2.饮食计划制定：针对不同人群饮食需求制定针对性的饮食计划</p><p>七：健身行业介绍</p><p>1.健身教练的概念</p><p>2.健身教练的职责</p><p>3.健身教练的职业发展</p><p>4.健身教练必备素质</p><p><br/></p><p><strong>私人教练基础实践（90课时）重点</strong></p><p>私教课程实战技术及指导方法、针对身体肌肉的训练方式，包括表层肌肉，深层肌肉，固定器械使用，自由器械使用，以及肌肉拉伸，放松。私人健身教练不仅要掌握专业的力量训练，还要掌握常见的有氧训练方法，以及如何针对不同人群制定健身计划，实施健身计划，本课程有山西健美冠军刘云老师亲自授课</p><p>1、抗阻力训练：相关术语，抗阻力训练的原则，各肌肉抗阻力训练手段，器械使用（固定器械使用，自由器械使用）</p><p>2、伸展运动：静态拉伸和PNF拉伸，浅层肌肉（胸部、背部、腿部、肩部、手臂，臀部）拉伸方法</p><p>3、有氧运动：跑步技术，踏板技术，多功能仪，跳绳技术，有氧运动注意事项</p><p>4、形体训练</p><p>5、模拟教学</p><p>6、私教一对一教学、私教小团队教学演练</p><p><br/></p><p><strong>健身健美高级课程</strong></p><p>国家级健美运动员授课，针对后期想要从事健美事业的健身爱好者，如何针对弱项肌肉进行刺激，健美比赛的评分规则，动作标准等知识，其中针对局部训练，提升肌肉分离度等对于健身房增肌和减脂爱好，也有特殊效果</p><p>1.运动机能学</p><p>2.健身健美专业以及训练法则及实践</p><p>3.训练原则和方案设计</p><p>4.赛前脱脂、脱水、充碳</p><p>5.提升肌肉分离度、清晰度</p><p>6.健美造型</p><p>7.局部针对性训练</p><p>8：高级健身计划制定</p><p><br/></p><p><strong>普拉提训练课程（60课时）重点，难点</strong></p><p>普拉提主要是锻炼人体深层的小肌肉，维持和改善外观正常活动姿势、达到身体平衡、创展躯干和肢体的活动范围和活动能力、强调对核心肌群的控制、加强人脑对肢体及骨骼肌肉组织的神经感应及支配，再配合正确的呼吸方法所进行的一项全身协调运动。</p><p>1、普拉提历史背景、发展、原则及概念</p><p>2、普拉提之呼吸</p><p>2、1评估与激活</p><p>2、2呼吸的机巧与应用</p><p>3、普拉提之健康的骨骼排列</p><p>3、1体态评估</p><p>3、2普拉提之有关脊柱的训练：针对椎体不稳、颈后大包、脊柱侧弯、平背、驼背等常见问题</p><p>3、3普拉提之有关骨盆的训练：针对骨盆倾斜、回旋等常见问题</p><p>3、4普拉提之有关肩胛的训练：针对翼状肩胛、耸肩、圆肩、手臂活动受限等常见问题</p><p>4、普拉提之稳定的深层核心</p><p>4、1横膈膜的训练及应用</p><p>4、2腹横机的训练及应用</p><p>4、3多裂肌的训练及应用</p><p>4、4骨盆底肌的训练及应用</p><p>5、普拉提之塑形主题课程</p><p>5、1腰腹塑形</p><p>5、2即时美臀</p><p>5、3美背训练</p><p>5、4告别X、O型腿</p><p>6、普拉提之孕前产后</p><p>6、1孕前训练</p><p>6、2产后骨盆底肌、腹直肌分离的恢复训练</p><p>6、3产后关节稳定训练</p><p>6、4产后如何快速恢身材</p><p>7、普拉提之中高级训练</p><p>8、普拉提之小器械的应用</p><p>9、普拉提之课程编排、训练计划的制定</p><p>10、普拉提之开单技巧&nbsp;</p><p><br/></p><p><strong>功能性训练课程（90课时）&nbsp; 重点</strong></p><p>功能性训练起源于损伤康复。物理治疗师在治疗运动员的损伤时通常得出这样的结论：损伤由于稳定肌功能欠佳，作用力转移至另一肌肉造成。一般来说，功能欠佳的肌肉为髋关节，脊柱或者肩胛-胸关节的稳定肌。这里就出现了一个明显的趋势：似乎总是相同的肌肉发生损伤。物理治疗师指出，薄弱环节常常存在于深层腹肌（腹横肌和腹内斜肌），髋关节稳定肌群（臀中肌，内收肌，腰方肌和髋关节外旋肌群）和肩胛骨后缩肌群（下斜方肌和菱形肌）之中。于是人们便开始重视物理治疗师所说的功能持续性欠佳的肌肉，以保证运动员以最正确最安全的技术完成基本的动作</p><p>1：健身球训练</p><p>2：悬挂训练</p><p>3：BOSO球训练</p><p>4：徒手锻炼</p><p>5：弹力带锻炼</p><p>6：敏捷梯训练</p><p>7：药球训练</p><p>8：泡沫轴训练，泡沫轴在运动康复中的应用</p><p>9：翻滚大轮胎的技术要领</p><p>10：功能性地胶训练</p><p>11：青少年体适能训练</p><p>12：特殊人群体适能训练</p><p><br/></p><p><strong>关节功能康复及体态纠正课程（运动康复课程）（90课时）&nbsp; 重点，难点</strong></p><p>现代康复医学包括物理疗法、言语、矫正、心理、职业疗法、康复工作以及体育疗法。体育疗法是主动疗法、全身疗法、自然疗法，运动康复是新兴的体育、健康和医学交叉结合的前沿学科。采用适量的、定向或者有针对性的机体运动来帮助身体恢复到正常状态，运动康复是私人健身教练后期成为专业人才必须掌握的专业技能</p><p>一、脊柱关节康复</p><p>1．颈椎病症护理课程&nbsp;</p><p>2．改善高低肩课程</p><p>3.脊柱侧弯</p><p>二、腰骶康复</p><p>1．下背痛康复课程&nbsp; &nbsp;&nbsp;</p><p>2．腰肌劳损康复课程</p><p>3．腰椎间盘突出康复课程&nbsp;</p><p>4．腰骶关节康复课程</p><p>三、自由关节康复</p><p>1肩袖损伤康复课程&nbsp;</p><p>2肩周炎康复课程</p><p>3网球肘康复课程&nbsp; &nbsp;&nbsp;</p><p>4高尔夫球肘康复课程</p><p>5髋关节损伤康复&nbsp; &nbsp;</p><p>6腕关节损伤康复</p><p>7膝关节康复课程</p><p>四、体态纠正</p><p>1.上交叉综合症</p><p>2.下交叉综合症</p><p>3.探头</p><p>4.骨盆移位</p><p>5.不良腿型（O型腿、X型腿、XO型腿）</p><p>6.足部缺陷（高足弓、扁平足、拇指外翻等等）</p><p>五：小器械在运动康复中的应用</p><p>六：实战课程：运动康复在私教工作中的应用</p><p><br/></p><p><strong>健身房运营管理课程（30课时）创业课程</strong></p><p>如何在私人教练行业有更好的发展，现在健身产业的发展状况和发展方向，如何运营健身房和私教工作室。本课程对于后期创业的学生十分重要</p><p>1.健身房投资评估</p><p>2.如何开健身房、工作室</p><p>3.健身房、工作室运营管理</p><p>4.俱乐部客服体系</p><p>5.健身房运营体系 （会员流失、教练流失分析）</p><p><br/></p><p><strong>私教职业发展课程（20课时）实战课程</strong></p><p>如何在私人教练行业有更好的发展，现在健身产业的发展状况和发展方向，如何运营健身房和私教工作室。本课程对于后期创业的学生十分重要</p><p>1.健身行业发展</p><p>2.私人教练发展方向</p><p>3.私人教练发展技巧</p><p>4.私人教练创业</p><p>5.私人教练销售（俱乐部销售、网络销售）</p><p>6.私教管理</p><p><br/></p><p><strong>综合格斗课程</strong></p><p><strong>动感单车课程</strong></p><p><br/></p>', null, null);
INSERT INTO `news_data` VALUES ('21', '22', '', null, null);
INSERT INTO `news_data` VALUES ('22', '23', '<p style=\"text-align: center;\"><span style=\"font-size: 18px;\"><strong>功能性训练课程（90课时）&nbsp; 重点</strong></span></p><p>功能性训练起源于损伤康复。物理治疗师在治疗运动员的损伤时通常得出这样的结论：损伤由于稳定肌功能欠佳，作用力转移至另一肌肉造成。一般来说，功能欠佳的肌肉为髋关节，脊柱或者肩胛-胸关节的稳定肌。这里就出现了一个明显的趋势：似乎总是相同的肌肉发生损伤。物理治疗师指出，薄弱环节常常存在于深层腹肌（腹横肌和腹内斜肌），髋关节稳定肌群（臀中肌，内收肌，腰方肌和髋关节外旋肌群）和肩胛骨后缩肌群（下斜方肌和菱形肌）之中。于是人们便开始重视物理治疗师所说的功能持续性欠佳的肌肉，以保证运动员以最正确最安全的技术完成基本的动作</p><p>1：健身球训练</p><p>2：悬挂训练</p><p>3：BOSO球训练</p><p>4：徒手锻炼</p><p>5：弹力带锻炼</p><p>6：敏捷梯训练</p><p>7：药球训练</p><p>8：泡沫轴训练，泡沫轴在运动康复中的应用</p><p>9：翻滚大轮胎的技术要领</p><p>10：功能性地胶训练</p><p>11：青少年体适能训练</p><p>12：特殊人群体适能训练工作</p><p><img src=\"/ueditor/php/upload/image/20180404/1522829782545166.jpeg\" title=\"1522829782545166.jpeg\" alt=\"14886156283053.jpeg\" width=\"672\" height=\"1161\" style=\"width: 672px; height: 1161px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('23', '24', '<p style=\"text-align: center;\"><span style=\"font-size: 18px;\"><strong>关节功能康复体态纠正课程（运动康复课程）（90课时）&nbsp; 重点，难点</strong></span></p><p>现代康复医学包括物理疗法、言语、矫正、心理、职业疗法、康复工作以及体育疗法。体育疗法是主动疗法、全身疗法、自然疗法，运动康复是新兴的体育、健康和医学交叉结合的前沿学科。采用适量的、定向或者有针对性的机体运动来帮助身体恢复到正常状态，运动康复是私人健身教练后期成为专业人才必须掌握的专业技能</p><p>一、脊柱关节康复</p><p>1．颈椎病症护理课程&nbsp;</p><p>2．改善高低肩课程</p><p>3.脊柱侧弯</p><p>二、腰骶康复</p><p>1．下背痛康复课程&nbsp; &nbsp;&nbsp;</p><p>2．腰肌劳损康复课程</p><p>3．腰椎间盘突出康复课程&nbsp;</p><p>4．腰骶关节康复课程</p><p>三、自由关节康复</p><p>1肩袖损伤康复课程&nbsp;</p><p>2肩周炎康复课程</p><p>3网球肘康复课程&nbsp; &nbsp;&nbsp;</p><p>4高尔夫球肘康复课程</p><p>5髋关节损伤康复&nbsp; &nbsp;</p><p>6腕关节损伤康复</p><p>7膝关节康复课程</p><p>四、体态纠正</p><p>1.上交叉综合症</p><p>2.下交叉综合症</p><p>3.探头</p><p>4.骨盆移位</p><p>5.不良腿型（O型腿、X型腿、XO型腿）</p><p>6.足部缺陷（高足弓、扁平足、拇指外翻等等）</p><p>五：小器械在运动康复中的应用</p><p>六：实战课程：运动康复在私教工作中的应用</p><p><img src=\"/ueditor/php/upload/image/20180404/1522829991635384.png\" title=\"1522829991635384.png\" alt=\"运动康复.png\" width=\"606\" height=\"802\" style=\"width: 606px; height: 802px;\"/></p>', null, null);
INSERT INTO `news_data` VALUES ('24', '25', '<p style=\"text-align: center;\"><span style=\"font-size: 20px; color: rgb(255, 0, 0);\"><strong>高级私教课程</strong></span></p><p>私人健身教练基础理论（90课时）基础、重点</p><p>中力健身学院针对零基础学院开展全能私人教练培训，新人需要从基础的理论知识开始学习，逐步掌握私人教练高级核心技能，基础知识中运动解剖学是必须掌握的专业理论知识，肌肉机构、功能对于后期掌握高级课程有重要的作用，只有掌握理论知识，才能从原理上掌握私人教练各项技能，以及在实施健身计划时，如何针对不同人群，例如老人、孕妇、甚至是儿童，制定针对性训练</p><p>一、运动解剖学</p><p>1.运动系统：骨骼系统和肌肉系统。骨骼，骨骼肌，训练动作的解剖学分析</p><p>2.呼吸系统：呼吸道，肺部，健身运动对呼吸系统的影响</p><p>3.心血管系统：心、血管，健身运动对心血管系统的影响</p><p>4.神经系统：神经系统概述，健身运动和神经系统，本体感受器</p><p>5.人体的生长发育：人体生长发育的规律，影响生长发育的因素，</p><p>二：运动营养学</p><p>1.运动营养基础：宏量营养素，微量营养素，运动与水，运动与能量</p><p>2.健康膳食指导：运动、营养与健康、抗氧化、免疫、膳食平衡</p><p>3.营养与健身运动：健身运动与能量平衡，健身运动的合理膳食营养，不同健身人群营养需求</p><p>4.常见的运动营养补剂：增加肌肉合成代谢与肌力补剂，促进能量代谢的营养补剂，疲劳消除与体能恢复的补剂，减轻与控制体重的运动补剂，运动补剂补充的误区</p><p><br/></p><p>三、运动生理学</p><p>1.运动的能量代谢：运动状态下的能量代谢</p><p>2.肌肉活动：肌肉收缩与缩张原理，肌纤维类型与运动能力</p><p>3.血液循环：心脏生理，血管生理，心血管活动的调节，运动训练对心血管功能的影响</p><p>4.肌肉力量：肌肉力量的训练</p><p>5.有氧工作能力：有氧耐力训练</p><p>6.速度和无氧耐力：平衡、灵敏与柔韧、运动过长中人体机能状态的变化</p><p>7.健身运动与生理学：肥胖与体重控制，体适能与运动处方，慢性疾病患者与运动</p><p>四：运动生物力学</p><p>1.人体动作结构的生理学基础：人体动作结构的基本形式，人体动作机构的动作系统，人体运动系统的技能特征，骨骼、关节、肌肉的特征。</p><p>2.人体运动的平衡与稳定</p><p>3.人体平衡的力学条件</p><p>4.肌肉力量训练的基础原理与应用</p><p>五：健康体适能</p><p>1.肌力与肌肉耐力</p><p>2.心肺功能</p><p>3.人体组合百分比</p><p>4.柔韧性测试</p><p>六：训练原则和训练计划的制定</p><p>1.健身计划制定：针对不同人群需要制定相对应的健身计划</p><p>2.饮食计划制定：针对不同人群饮食需求制定针对性的饮食计划</p><p><br/></p><p>七：健身行业介绍</p><p>1.健身教练的概念</p><p>2.健身教练的职责</p><p>3.健身教练的职业发展</p><p>4.健身教练必备素质</p><p><br/></p><p>私人教练基础实践（90课时）重点</p><p>私教课程实战技术及指导方法、针对身体肌肉的训练方式，包括表层肌肉，深层肌肉，固定器械使用，自由器械使用，以及肌肉拉伸，放松。私人健身教练不仅要掌握专业的力量训练，还要掌握常见的有氧训练方法，以及如何针对不同人群制定健身计划，实施健身计划，本课程有山西健美冠军刘云老师亲自授课</p><p>1、抗阻力训练：相关术语，抗阻力训练的原则，各肌肉抗阻力训练手段，器械使用（固定器械使用，自由器械使用）</p><p>2、伸展运动：静态拉伸和PNF拉伸，浅层肌肉（胸部、背部、腿部、肩部、手臂，臀部）拉伸方法</p><p>3、有氧运动：跑步技术，踏板技术，多功能仪，跳绳技术，有氧运动注意事项</p><p>4、形体训练</p><p>5、模拟教学</p><p>6、私教一对一教学、私教小团队教学演练</p><p><br/></p><p>普拉提训练课程（60课时）重点，难点</p><p>普拉提主要是锻炼人体深层的小肌肉，维持和改善外观正常活动姿势、达到身体平衡、创展躯干和肢体的活动范围和活动能力、强调对核心肌群的控制、加强人脑对肢体及骨骼肌肉组织的神经感应及支配，再配合正确的呼吸方法所进行的一项全身协调运动。</p><p>1、普拉提历史背景、发展、原则及概念</p><p>2、普拉提之呼吸</p><p>2、1评估与激活</p><p>2、2呼吸的机巧与应用</p><p>3、普拉提之健康的骨骼排列</p><p>3、1体态评估</p><p>3、2普拉提之有关脊柱的训练：针对椎体不稳、颈后大包、脊柱侧弯、平背、驼背等常见问题</p><p>3、3普拉提之有关骨盆的训练：针对骨盆倾斜、回旋等常见问题</p><p>3、4普拉提之有关肩胛的训练：针对翼状肩胛、耸肩、圆肩、手臂活动受限等常见问题</p><p>4、普拉提之稳定的深层核心</p><p>4、1横膈膜的训练及应用</p><p>4、2腹横机的训练及应用</p><p>4、3多裂肌的训练及应用</p><p>4、4骨盆底肌的训练及应用</p><p>5、普拉提之塑形主题课程</p><p>5、1腰腹塑形</p><p>5、2即时美臀</p><p>5、3美背训练</p><p>5、4告别X、O型腿</p><p>6、普拉提之孕前产后</p><p>6、1孕前训练</p><p>6、2产后骨盆底肌、腹直肌分离的恢复训练</p><p>6、3产后关节稳定训练</p><p>6、4产后如何快速恢身材</p><p>7、普拉提之中高级训练</p><p>8、普拉提之小器械的应用</p><p>9、普拉提之课程编排、训练计划的制定</p><p>10、普拉提之开单技巧&nbsp;</p><p><br/></p><p>功能性训练课程（90课时）&nbsp; 重点</p><p>功能性训练起源于损伤康复。物理治疗师在治疗运动员的损伤时通常得出这样的结论：损伤由于稳定肌功能欠佳，作用力转移至另一肌肉造成。一般来说，功能欠佳的肌肉为髋关节，脊柱或者肩胛-胸关节的稳定肌。这里就出现了一个明显的趋势：似乎总是相同的肌肉发生损伤。物理治疗师指出，薄弱环节常常存在于深层腹肌（腹横肌和腹内斜肌），髋关节稳定肌群（臀中肌，内收肌，腰方肌和髋关节外旋肌群）和肩胛骨后缩肌群（下斜方肌和菱形肌）之中。于是人们便开始重视物理治疗师所说的功能持续性欠佳的肌肉，以保证运动员以最正确最安全的技术完成基本的动作</p><p>1：健身球训练</p><p>2：悬挂训练</p><p>3：BOSO球训练</p><p>4：徒手锻炼</p><p>5：弹力带锻炼</p><p>6：敏捷梯训练</p><p>7：药球训练</p><p>8：泡沫轴训练，泡沫轴在运动康复中的应用</p><p>9：翻滚大轮胎的技术要领</p><p>10：功能性地胶训练</p><p>11：青少年体适能训练</p><p>12：特殊人群体适能训练</p>', null, null);
INSERT INTO `news_data` VALUES ('25', '26', '<p style=\"text-align: center;\"><span style=\"font-size: 20px; color: rgb(255, 0, 0);\"><strong>全能私教课程</strong></span></p><p><strong>私人健身教练基础理论（90课时）基础、重点</strong></p><p>中力健身学院针对零基础学院开展全能私人教练培训，新人需要从基础的理论知识开始学习，逐步掌握私人教练高级核心技能，基础知识中运动解剖学是必须掌握的专业理论知识，肌肉机构、功能对于后期掌握高级课程有重要的作用，只有掌握理论知识，才能从原理上掌握私人教练各项技能，以及在实施健身计划时，如何针对不同人群，例如老人、孕妇、甚至是儿童，制定针对性训练</p><p>一、运动解剖学</p><p>1.运动系统：骨骼系统和肌肉系统。骨骼，骨骼肌，训练动作的解剖学分析</p><p>2.呼吸系统：呼吸道，肺部，健身运动对呼吸系统的影响</p><p>3.心血管系统：心、血管，健身运动对心血管系统的影响</p><p>4.神经系统：神经系统概述，健身运动和神经系统，本体感受器</p><p>5.人体的生长发育：人体生长发育的规律，影响生长发育的因素，</p><p><br/></p><p>二：运动营养学</p><p>1.运动营养基础：宏量营养素，微量营养素，运动与水，运动与能量</p><p>2.健康膳食指导：运动、营养与健康、抗氧化、免疫、膳食平衡</p><p>3.营养与健身运动：健身运动与能量平衡，健身运动的合理膳食营养，不同健身人群营养需求</p><p>4.常见的运动营养补剂：增加肌肉合成代谢与肌力补剂，促进能量代谢的营养补剂，疲劳消除与体能恢复的补剂，减轻与控制体重的运动补剂，运动补剂补充的误区</p><p><br/></p><p>三、运动生理学</p><p>1.运动的能量代谢：运动状态下的能量代谢</p><p>2.肌肉活动：肌肉收缩与缩张原理，肌纤维类型与运动能力</p><p>3.血液循环：心脏生理，血管生理，心血管活动的调节，运动训练对心血管功能的影响</p><p>4.肌肉力量：肌肉力量的训练</p><p>5.有氧工作能力：有氧耐力训练</p><p>6.速度和无氧耐力：平衡、灵敏与柔韧、运动过长中人体机能状态的变化</p><p>7.健身运动与生理学：肥胖与体重控制，体适能与运动处方，慢性疾病患者与运动</p><p><br/></p><p>四：运动生物力学</p><p>1.人体动作结构的生理学基础：人体动作结构的基本形式，人体动作机构的动作系统，人体运动系统的技能特征，骨骼、关节、肌肉的特征。</p><p>2.人体运动的平衡与稳定</p><p>3.人体平衡的力学条件</p><p>4.肌肉力量训练的基础原理与应用</p><p><br/></p><p>五：健康体适能</p><p>1.肌力与肌肉耐力</p><p>2.心肺功能</p><p>3.人体组合百分比</p><p>4.柔韧性测试</p><p>六：训练原则和训练计划的制定</p><p>1.健身计划制定：针对不同人群需要制定相对应的健身计划</p><p>2.饮食计划制定：针对不同人群饮食需求制定针对性的饮食计划</p><p>七：健身行业介绍</p><p>1.健身教练的概念</p><p>2.健身教练的职责</p><p>3.健身教练的职业发展</p><p>4.健身教练必备素质</p><p><br/></p><p><strong>私人教练基础实践（90课时）重点</strong></p><p>私教课程实战技术及指导方法、针对身体肌肉的训练方式，包括表层肌肉，深层肌肉，固定器械使用，自由器械使用，以及肌肉拉伸，放松。私人健身教练不仅要掌握专业的力量训练，还要掌握常见的有氧训练方法，以及如何针对不同人群制定健身计划，实施健身计划，本课程有山西健美冠军刘云老师亲自授课</p><p>1、抗阻力训练：相关术语，抗阻力训练的原则，各肌肉抗阻力训练手段，器械使用（固定器械使用，自由器械使用）</p><p>2、伸展运动：静态拉伸和PNF拉伸，浅层肌肉（胸部、背部、腿部、肩部、手臂，臀部）拉伸方法</p><p>3、有氧运动：跑步技术，踏板技术，多功能仪，跳绳技术，有氧运动注意事项</p><p>4、形体训练</p><p>5、模拟教学</p><p>6、私教一对一教学、私教小团队教学演练</p><p><br/></p><p><strong>健身健美高级课程</strong></p><p>国家级健美运动员授课，针对后期想要从事健美事业的健身爱好者，如何针对弱项肌肉进行刺激，健美比赛的评分规则，动作标准等知识，其中针对局部训练，提升肌肉分离度等对于健身房增肌和减脂爱好，也有特殊效果</p><p>1.运动机能学</p><p>2.健身健美专业以及训练法则及实践</p><p>3.训练原则和方案设计</p><p>4.赛前脱脂、脱水、充碳</p><p>5.提升肌肉分离度、清晰度</p><p>6.健美造型</p><p>7.局部针对性训练</p><p>8：高级健身计划制定</p><p><br/></p><p><strong>普拉提训练课程（60课时）重点，难点</strong></p><p>普拉提主要是锻炼人体深层的小肌肉，维持和改善外观正常活动姿势、达到身体平衡、创展躯干和肢体的活动范围和活动能力、强调对核心肌群的控制、加强人脑对肢体及骨骼肌肉组织的神经感应及支配，再配合正确的呼吸方法所进行的一项全身协调运动。</p><p>1、普拉提历史背景、发展、原则及概念</p><p>2、普拉提之呼吸</p><p>2、1评估与激活</p><p>2、2呼吸的机巧与应用</p><p>3、普拉提之健康的骨骼排列</p><p>3、1体态评估</p><p>3、2普拉提之有关脊柱的训练：针对椎体不稳、颈后大包、脊柱侧弯、平背、驼背等常见问题</p><p>3、3普拉提之有关骨盆的训练：针对骨盆倾斜、回旋等常见问题</p><p>3、4普拉提之有关肩胛的训练：针对翼状肩胛、耸肩、圆肩、手臂活动受限等常见问题</p><p>4、普拉提之稳定的深层核心</p><p>4、1横膈膜的训练及应用</p><p>4、2腹横机的训练及应用</p><p>4、3多裂肌的训练及应用</p><p>4、4骨盆底肌的训练及应用</p><p>5、普拉提之塑形主题课程</p><p>5、1腰腹塑形</p><p>5、2即时美臀</p><p>5、3美背训练</p><p>5、4告别X、O型腿</p><p>6、普拉提之孕前产后</p><p>6、1孕前训练</p><p>6、2产后骨盆底肌、腹直肌分离的恢复训练</p><p>6、3产后关节稳定训练</p><p>6、4产后如何快速恢身材</p><p>7、普拉提之中高级训练</p><p>8、普拉提之小器械的应用</p><p>9、普拉提之课程编排、训练计划的制定</p><p>10、普拉提之开单技巧&nbsp;</p><p><br/></p><p><strong>功能性训练课程（90课时）&nbsp; 重点</strong></p><p>功能性训练起源于损伤康复。物理治疗师在治疗运动员的损伤时通常得出这样的结论：损伤由于稳定肌功能欠佳，作用力转移至另一肌肉造成。一般来说，功能欠佳的肌肉为髋关节，脊柱或者肩胛-胸关节的稳定肌。这里就出现了一个明显的趋势：似乎总是相同的肌肉发生损伤。物理治疗师指出，薄弱环节常常存在于深层腹肌（腹横肌和腹内斜肌），髋关节稳定肌群（臀中肌，内收肌，腰方肌和髋关节外旋肌群）和肩胛骨后缩肌群（下斜方肌和菱形肌）之中。于是人们便开始重视物理治疗师所说的功能持续性欠佳的肌肉，以保证运动员以最正确最安全的技术完成基本的动作</p><p>1：健身球训练</p><p>2：悬挂训练</p><p>3：BOSO球训练</p><p>4：徒手锻炼</p><p>5：弹力带锻炼</p><p>6：敏捷梯训练</p><p>7：药球训练</p><p>8：泡沫轴训练，泡沫轴在运动康复中的应用</p><p>9：翻滚大轮胎的技术要领</p><p>10：功能性地胶训练</p><p>11：青少年体适能训练</p><p>12：特殊人群体适能训练</p><p><br/></p><p><strong>关节功能康复及体态纠正课程（运动康复课程）（90课时）&nbsp; 重点，难点</strong></p><p>现代康复医学包括物理疗法、言语、矫正、心理、职业疗法、康复工作以及体育疗法。体育疗法是主动疗法、全身疗法、自然疗法，运动康复是新兴的体育、健康和医学交叉结合的前沿学科。采用适量的、定向或者有针对性的机体运动来帮助身体恢复到正常状态，运动康复是私人健身教练后期成为专业人才必须掌握的专业技能</p><p>一、脊柱关节康复</p><p>1．颈椎病症护理课程&nbsp;</p><p>2．改善高低肩课程</p><p>3.脊柱侧弯</p><p>二、腰骶康复</p><p>1．下背痛康复课程&nbsp; &nbsp;&nbsp;</p><p>2．腰肌劳损康复课程</p><p>3．腰椎间盘突出康复课程&nbsp;</p><p>4．腰骶关节康复课程</p><p>三、自由关节康复</p><p>1肩袖损伤康复课程&nbsp;</p><p>2肩周炎康复课程</p><p>3网球肘康复课程&nbsp; &nbsp;&nbsp;</p><p>4高尔夫球肘康复课程</p><p>5髋关节损伤康复&nbsp; &nbsp;</p><p>6腕关节损伤康复</p><p>7膝关节康复课程</p><p>四、体态纠正</p><p>1.上交叉综合症</p><p>2.下交叉综合症</p><p>3.探头</p><p>4.骨盆移位</p><p>5.不良腿型（O型腿、X型腿、XO型腿）</p><p>6.足部缺陷（高足弓、扁平足、拇指外翻等等）</p><p>五：小器械在运动康复中的应用</p><p>六：实战课程：运动康复在私教工作中的应用</p><p><br/></p><p><strong>健身房运营管理课程（30课时）创业课程</strong></p><p>如何在私人教练行业有更好的发展，现在健身产业的发展状况和发展方向，如何运营健身房和私教工作室。本课程对于后期创业的学生十分重要</p><p>1.健身房投资评估</p><p>2.如何开健身房、工作室</p><p>3.健身房、工作室运营管理</p><p>4.俱乐部客服体系</p><p>5.健身房运营体系 （会员流失、教练流失分析）</p><p><br/></p><p><strong>私教职业发展课程（20课时）实战课程</strong></p><p>如何在私人教练行业有更好的发展，现在健身产业的发展状况和发展方向，如何运营健身房和私教工作室。本课程对于后期创业的学生十分重要</p><p>1.健身行业发展</p><p>2.私人教练发展方向</p><p>3.私人教练发展技巧</p><p>4.私人教练创业</p><p>5.私人教练销售（俱乐部销售、网络销售）</p><p>6.私教管理</p><p><br/></p><p><strong>综合格斗课程</strong></p><p><strong>动感单车课程</strong></p>', null, null);
INSERT INTO `news_data` VALUES ('26', '27', '', null, null);
INSERT INTO `news_data` VALUES ('27', '28', '', null, null);
INSERT INTO `news_data` VALUES ('28', '29', '', null, null);
INSERT INTO `news_data` VALUES ('29', '30', '', null, null);
INSERT INTO `news_data` VALUES ('30', '31', '', null, null);
INSERT INTO `news_data` VALUES ('31', '32', '', null, null);
INSERT INTO `news_data` VALUES ('32', '33', '', null, null);
INSERT INTO `news_data` VALUES ('33', '34', '', null, null);
INSERT INTO `news_data` VALUES ('34', '35', '', null, null);
INSERT INTO `news_data` VALUES ('35', '36', '', null, null);
INSERT INTO `news_data` VALUES ('36', '37', '', null, null);
INSERT INTO `news_data` VALUES ('37', '38', '', null, null);
INSERT INTO `news_data` VALUES ('38', '39', '', null, null);
INSERT INTO `news_data` VALUES ('39', '40', '', null, null);
INSERT INTO `news_data` VALUES ('40', '41', '', null, null);
INSERT INTO `news_data` VALUES ('41', '42', '', null, null);
INSERT INTO `news_data` VALUES ('42', '43', '', null, null);
INSERT INTO `news_data` VALUES ('43', '44', '', null, null);
INSERT INTO `news_data` VALUES ('44', '45', '', null, null);
INSERT INTO `news_data` VALUES ('45', '46', '', null, null);
INSERT INTO `news_data` VALUES ('46', '47', '', null, null);
INSERT INTO `news_data` VALUES ('47', '48', '', null, null);
INSERT INTO `news_data` VALUES ('48', '49', '', null, null);
INSERT INTO `news_data` VALUES ('49', '50', '', null, null);
INSERT INTO `news_data` VALUES ('50', '51', '', null, null);
INSERT INTO `news_data` VALUES ('51', '52', '', null, null);
INSERT INTO `news_data` VALUES ('52', '53', '', null, null);
INSERT INTO `news_data` VALUES ('53', '54', '', null, null);
INSERT INTO `news_data` VALUES ('54', '55', '', null, null);
INSERT INTO `news_data` VALUES ('55', '56', '', null, null);
INSERT INTO `news_data` VALUES ('56', '57', '', null, null);
INSERT INTO `news_data` VALUES ('57', '58', '', null, null);
INSERT INTO `news_data` VALUES ('58', '59', '', null, null);
INSERT INTO `news_data` VALUES ('59', '60', '', null, null);
INSERT INTO `news_data` VALUES ('60', '61', '', null, null);
INSERT INTO `news_data` VALUES ('61', '62', '', null, null);
INSERT INTO `news_data` VALUES ('62', '63', '', null, null);
INSERT INTO `news_data` VALUES ('63', '64', '<p>十九大顺利闭幕，全民健身政策成为热门话题，健身在未来的几年内必将长尾行业发展排头兵。健身教练需求量会进一步增加，尤其是专业突出的私人健身教练，对于很多想要跨入健身教练行业的新人，证书是必须了解的行业知识，以下几种证书是你必须认识的</p><p><strong>1：国家健身教练职业资格证</strong></p><p>简称国职证书，这是健身行业唯一认可的国家证书，是体育总局颁发，无论是你是通过何种渠道参加考试，必须经过体育总局的七天培训，考试分为理论、实践和体能测试三个部分，证书共有初级、中级、高级和指导师四个级别！考试通过后在国家体育总局人才中心可以查询证书信息</p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20180410/1523358475662523.jpg\" title=\"1523358475662523.jpg\" alt=\"证书.jpg\" width=\"360\" height=\"218\" style=\"width: 360px; height: 218px;\"/></p><p><strong>2：CBBA证书</strong></p><p>这两年新人咨询该证书的次数越来越多，在三年前甚至无人问津的证书，证书获取的方式，参加CBBA协会的培训机构，就可以获取证书，CBBA证书是由中国健美协会颁发的证书，一般获取的都是高级证书。不过对于这种不需要参加国家考试，花钱就可以获取的证书，是无法得到行业认可的，不过如果你没有时间去参加培训，但是又想搞一个和健身教练相关的证书，可以考虑CBBA证书</p><p><strong>3：亚洲体适能证书</strong></p><p>在国职证书没有完全普及前，这是教练必考证书，虽然是一个机构证书。如果你咨询一些老教练的话，依然会说这个证书不错，国内早期从业者基本上考取的是亚洲体适能高级私教证书。最近几年和健身房合作进行证书培训，质量开始逐渐下降。所以证书不是卖的，而是要考试的，不过依然有很多健身房认可该证书</p><p><strong>4：其他体适能证书</strong></p><p>尤其是美国运动医学会证书，在国外这些证书考试是有工作经验限制，所以含金量比较高，但是在中国，就不是这样了，证书成为培训机构忽悠学生的工具，这是一种悲哀。有澳洲体适能，美国体适能以及欧洲体适能</p><p><strong>5：其他证书</strong></p><p>比如IFBB证书、IFBA证书等，这在国内已经是明码标价的证书，只要你花钱就可以拿到，不需要参加培训<br/></p><p>国内的证书繁多，但能够代表健身教练能力的没有，教练不仅要具备专业，更需要有良好的服务意识，而这需要有丰富的工作经验，所以新人需要的不仅是一个证书，而是要提升综合能力！<br/></p>', null, null);
INSERT INTO `news_data` VALUES ('64', '65', '<p>转眼间2017年最后一个月也快进入尾声了，在即将开始的2018年，健身教练会有哪些新的发展呢？</p><p><strong>专业依然是健身教练的核心</strong></p><p>十九大顺利召开，全民健身政策成为大会热门话题，国家领导人明确支出不仅要提升物质生活水平，更要提升精神文化生活，而健身无疑是最好的精神生活。提升健身行业质量，必须依靠健身教练！</p><p>现在健身行业发展迅速，健身房遍地开花，从当初的上千家，发展到国内拥有30000家健身房的规模，但依然无法满足健身人群需求。而健身教练技能更无法满足健身人群需求。</p><p>人们的生活富裕了，健康才是最关键的。健身不仅在一二线城市有更好的发展，在广大的三四线城市也开始起步，需要的不仅是多家健身房，更需要专业的健身教练，</p><p><img src=\"/ueditor/php/upload/image/20180410/1523358920833743.jpg\" title=\"1523358920833743.jpg\" alt=\"基础私教课程.jpg\" width=\"516\" height=\"340\" style=\"width: 516px; height: 340px;\"/></p><p><strong>专业，会员对教练的期许</strong></p><p>健身行业快速发展，人们健身意识也在增加，健身房不缺想要找教练的会员，缺少的专业教练。目前一线城市有一些所谓的健身教练，更多是销售为主，对于专业和会员服务差的太多。作为健身房和会员沟通的纽带，教练无法给会员带来健身效果，无法取得会员的信任，健身房会员流失，健身房难以为继！</p><p><br/></p><p>所以健身房需要的不是教练的数量，而是教练的质量！能够帮助健身房更好的维护会员，建立健身房与会员之间的信任！才能保证健身房良好运营</p><p>2018年健身行业势必迎来新的发展周期，对于教练会有更高的要求，想要从事健身教练的新人，你们准备好了吗</p><p><br/></p>', null, null);
INSERT INTO `news_data` VALUES ('65', '66', '<p><strong>中力健身学院2018年全新场地投入使用，每月一号、十五号正式开课！</strong></p><p><strong>提前预定课程，享受学费优惠政策</strong></p><p><strong>课程需要提前预定，详细预定流程如下</strong><br/></p><p>1：联系学校课程咨询部门老师提交个人资料（<strong>姓名，年龄，身高，体重，联系方式，身份证信息，收取快递地址</strong>）</p><p>2：课程咨询部填写预定课程资料，学员提交300元课程预定金（计算在学费内）</p><p>3：财务开预定课程收据，快递收据、教材、录取通知书</p><p>4：学员收取快递后查看相关资料，尤其是收据，拍照给课程咨询部老师，确认收取信息</p><p>5：开学前两天到校报到，学员购买车票后及时通知课程咨询部老师，学校将根据学员到校时间，后勤部门安排接站事宜</p><p>6：到校报到，办理入学手续</p><p><strong>本校学生宿舍、参加国家证书培训考试都是提前申报，请各位学员按照学校规定提前申报！</strong></p><p><strong><img src=\"/ueditor/php/upload/image/20180410/1523360607894412.jpg\" title=\"1523360607894412.jpg\" alt=\"1.jpg\" width=\"270\" height=\"468\" style=\"width: 270px; height: 468px;\"/></strong></p>', null, null);
INSERT INTO `news_data` VALUES ('66', '67', '<p>如今健身行业发展迅速，健身人群快速增加，健身需求更加多样化，对专业教练需求量更大，作为希望从事健身教练的新人，会有这样的疑问，健身教练是什么职业，以后的发展方向是什么？</p><p><strong>健身教练是技能也是服务行业</strong><br/></p><p>一名合格的健身教练不仅要具备专业的健身技能，更需要优秀的职业素质和良好的个人能力，不仅要指导会员健身，帮助会员实现健身目标，更要积极健康的引导会员养成良好的健身习惯，健身教练不是健美运动员，更不是健身爱好者，健身教练需要提升综合能力</p><p><img src=\"/ueditor/php/upload/image/20180410/1523361430174813.jpg\" title=\"1523361430174813.jpg\" alt=\"微信图片_20180329195956.jpg\" width=\"498\" height=\"390\" style=\"width: 498px; height: 390px;\"/></p><p>管理方向：相对健身教练，健身房更缺少管理人才，健身教练是健身房核心部门，如何管理好健身教练？关系到健身房能否运营下去吗。现在一二线城市，中大型健身房有20名左右健身教练，需要的主管、经理、店长、区域经理、私教总监等经验丰富的管理人员<br/></p><p>专业方向：健身行业在国内处于初级引入阶段，健身教练专业技能远达不到健身人群需求，服务于大众人群的运动康复理疗师、体能训练师、运动营养学专家等就更少了，所以现在基础好的健身教练会选择自己感兴趣的方向，继续学习<br/></p><p>创业类型：健身不仅在一线城市有了更好的发展，在广大的二、三线城市也开始起步，需要大量专业教练去更多地区开拓市场，健身行业在中国是年轻的职业，中国人口基数大，健身人群只有总人口的万分之一，有巨大的发展空间！<br/></p><p><strong>而对新人来说，首先你要成为一名合格的健身教练！而专业可以说是健身教练职业生命，给会员带来健身效果，你才有机会成为优秀的健身教练</strong><br/></p>', null, null);
INSERT INTO `news_data` VALUES ('67', '68', '<p><strong>关于中力健身学院课程预定问题</strong></p><p><strong>1：学习必须预定课程吗</strong></p><p>中力健身学院每月一号、十五号开课，节假日会有调整，为保障教学质量，班级人数有严格限制，人数满编后，多出学员属插班生，学费将按照原价收取，同时本校为国家健身教练职业资格证培训基地，学员提前身高国家证书，需要提交个人信息和报考费用</p><p><strong>2：假如我没有预定可以去学习吗</strong></p><p>可以学习，但学费将不在优惠，同时国家证书申报将延期，具体申报时间将根据学校名额安排</p><p><strong>3：预定金是报名费吗</strong></p><p>学校的预定金不是报名费，中力健身学院预定金计算在学费内，实际为申报国家健身教练职业资格证书费用，并非学校收取</p><p><strong>4：不预定的话，还给发快递吗</strong></p><p>学校的教材、收据、校服等相关学习资料只快递已经提交课程预定金学员，不对外</p><p><strong>5：我可以单独买教材学习吗</strong></p><p>中力健身学院教材为本校内部资料，不对外销售</p><p><strong>6：如何确认自己预定了课程呢</strong></p><p>预定课程后，学校财务会开预定课程收据，同时在官网可以查询自己课程预定信息</p><p><strong>如下图</strong>，输入自己的<strong>姓名，身份证号、联系方式</strong>即可查询到自己课程预定信息<br/></p><p>相关时间会有一定12小时误差，正常当日即可查询到自己课程预定信息</p><p><img src=\"/ueditor/php/upload/image/20180410/1523362721846620.jpg\" title=\"1523362721846620.jpg\" alt=\"QQ截图20180410201808.jpg\" width=\"557\" height=\"499\" style=\"width: 557px; height: 499px;\"/></p><p><br/></p>', null, null);
INSERT INTO `news_data` VALUES ('68', '73', '<p>中力健身学院课程需要提前预定，课程预定金300元，计算在学费内，学校将提前为学员申报国家健身教练职业资格证书培训考试名额</p>', null, null);
INSERT INTO `news_data` VALUES ('69', '74', '<p>中力健身学院上万家合作单位，学员入学签订就业协议，毕业前两周安排就业意向调查，学员填写就业意向调查表，根据学员意向城市安排工作，同时学校承诺终身就业负责！~</p>', null, null);
INSERT INTO `news_data` VALUES ('70', '75', '<p>学校就业是根据个人意向安排就业，目前主要和国内一二三线城市都有合作健身房，将根据您的个人意向安排就业！不过我们建议新人要现在一二线城市工作一段时间，积累工作经验后再回到老家地区，这样发展会更好</p>', null, null);

-- ----------------------------
-- Table structure for page_data
-- ----------------------------
DROP TABLE IF EXISTS `page_data`;
CREATE TABLE `page_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_m` text,
  `note_pc` text,
  `note` text,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_data
-- ----------------------------
INSERT INTO `page_data` VALUES ('1', null, null, '<p><strong>中力健身学院-零基础健身教练培训基地</strong>，退伍军人培训基地，国家健身教练职业资格证培训基地，以实战为核心，就业为导向，培养综合能力更加出色的私人健身教练</p><p><strong>校训：冠军私教，中力打造</strong></p><p><strong>宗旨：培养综合能力更加出色 的私人健身教练<br/></strong></p><p><strong>理念：以人为本，以实战为核心 就业为导向，规范健身市 场，培养出色健身教练</strong><br/></p><p><br/></p><p><span style=\"color: rgb(255, 0, 0); background-color: rgb(221, 217, 195);\"><strong>发展历程</strong></span></p><p>自成立以来，中力健身学院不断的为健身行业输送人才，为中国的健身事业添砖加瓦，从2015年开始，扩大规模，拥有器械训练区、有氧训练区、康复训练区等，同时组建更加强大的师资队伍，专业培训导师亲自授课，开始面向社会招收想成为专业教练的所有人群，给大家提供一个良好的学习环境，一个实现自己梦想的舞台</p><p>学院宗旨是致力规范中国健身培训市场，建立权威认证体系，使中国健身市场从无序走向有序，培养出具有专业技能，优秀职业素质和个人能力的私人健身教练</p><p><br/></p><p><span style=\"color: rgb(255, 0, 0); background-color: rgb(221, 217, 195);\"><strong>学院优势</strong></span></p><p><strong>1.新课程，新体系</strong></p><p>针对目前健身行业对健身教练技能要求的调查，以及当前出现的健身新技能，中力健身学院聘请健身行业专家和国内中高端健身房私教部经理、主管。共同打造全新特色课程体系，保障每一位学员都能学到必备的技能，保障每位学员毕业后能够更好的适应健身行业的发展</p><p><strong>2.理论与实践结合教学</strong></p><p>以理论为基础，以实践为导向，在理论中掌握动作原理，在实践中透析理论本质，两者相结合学习，解决学习中的任何疑点！</p><p><strong>3.采用1+2教学模式</strong></p><p>以私教课程为核心，辅助操课，保证学员初期进入工作岗位的稳定性、高收入，更快、更好的融进工作环境中。</p><p><strong>4.模拟式教学</strong></p><p>采用模拟式教学，在学习的同时学会运用。不仅要掌握专业的健身技能，还要清楚的表达出来，能够很好的指导他人进行训练，做到学以致用！</p><p><strong>5.师资力量雄厚</strong></p><p>学员的学习质量，工作质量，关系着中力健身学院的未来发展，组建国内一流培训团队，亲自给学员授课，保证教学质量，让每一位学员学习到最专业、最全面的健身技能！</p><p>教学老师要求：专科以上学历，具备五年以上教学经验，精通私人健身教练各项技能，例如，张玉全老师，多届山东省健美冠军，国家培训导师，国家一级指导员；更有国家健美队教练，多届全国健美冠军夏冬杰老师，从事健身健美行业培训多年，具有极其丰富的教学经验,</p><p>学员通过系统学习之后，参加考核，理论考核与实践考核全部通过，颁发证书！颁发的国家健身教练职业资格证书、高级私人教练证书，运动康复理疗师证书等，也是被业界人内认可的证书。对于每一位学员来讲，技能是第一位，但证书也是对自我技能的一种肯定，也是每位学员工作的敲门砖！</p><p><strong>7.周期拓展活动</strong></p><p>一个好的健身教练，不仅仅是专业技能过硬，还需要良好的个人能力，在遇到问题时候的思考、解决、交流能力，所以在培养学员专业技能的同时，中力健身学院定期拓展课外活动，让每一位学员都能积极的参与进来，开拓创新能力、提高沟通、合作能力，培养团队精神，更快的适应新的环境、更快的融入新的工作团队，这是每一个现代优秀教练的必修课！</p><p><strong>8.就业安排</strong></p><p>每位学员入学都是需要签订就业协议，毕业后，会根据每位学员的意向安排工作，你想在哪个城市工作，都会帮你安排联系，就是后期，能力提高了，想去更好的健身房或者应聘更高的职位，中力健身学院都会出面安排！目前，中力健身学院与全国600多家中高端健身房合作，保证每一位学员毕业之后都可以顺利的工作！</p><p><strong>9.免费重修</strong></p><p>健身行业在快速发展，健身技能更新加快，中力健身学院每年组织专家对课程进行更新，学员可以免费进行二次进修，保障学员始终能够跟得上行业发展，成为健身教练行业佼佼者</p><p><strong>10.顶级培训场地</strong></p><p>中力健身学院独立办学，独立器械训练区、有氧训练区、功能性训练区，篮球场，满足学员各种爱好，提升学员综合能力</p>', '72');

-- ----------------------------
-- Table structure for pic_data
-- ----------------------------
DROP TABLE IF EXISTS `pic_data`;
CREATE TABLE `pic_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `images` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic_data
-- ----------------------------
INSERT INTO `pic_data` VALUES ('1', '21', '/uploadfile/20180404/656248b4477c1a80602868f1c68f203f.png|/uploadfile/20180404/762e27163df9b478c814b2fbdab6dbb8.png|/uploadfile/20180404/0f15c42fe2cf338d7a231e6999b4de9e.png|/uploadfile/20180404/fda018098b11ac7b8172ece6be805d6f.png|/uploadfile/20180404/63f04eeb8cf450233f383256290f0980.png', '');

-- ----------------------------
-- Table structure for webtable
-- ----------------------------
DROP TABLE IF EXISTS `webtable`;
CREATE TABLE `webtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `webname` varchar(150) DEFAULT NULL,
  `tjcode` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webtable
-- ----------------------------
INSERT INTO `webtable` VALUES ('1', '中力健身学院-零基础健身教练培训基地【官网】', '健身教练培训，私人教练培训，健身教练证书，健身学校', '中力健身学院-零基础健身教练培训基地，退伍军人培训基地，以实战为核心，就业为导向，培养综合能力更加出色的私人健身教练，上万家合作单位提供就业保障，咨询热线：010-80320881', '123', '中力健身学院', '123');
