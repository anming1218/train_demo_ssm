/*
 Navicat Premium Data Transfer

 Source Server         : huipu
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : train

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 06/10/2020 21:53:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_answer
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer`;
CREATE TABLE `tb_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `qid` int(0) NOT NULL,
  `lid` int(0) NOT NULL,
  PRIMARY KEY (`id`, `qid`, `lid`) USING BTREE,
  INDEX `qid`(`qid`) USING BTREE,
  INDEX `lid`(`lid`) USING BTREE,
  CONSTRAINT `tb_answer_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `tb_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_answer_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answer
-- ----------------------------
INSERT INTO `tb_answer` VALUES (2, 14, 10);
INSERT INTO `tb_answer` VALUES (3, 15, 7);
INSERT INTO `tb_answer` VALUES (5, 16, 10);
INSERT INTO `tb_answer` VALUES (6, 17, 10);
INSERT INTO `tb_answer` VALUES (7, 18, 10);
INSERT INTO `tb_answer` VALUES (8, 19, 10);
INSERT INTO `tb_answer` VALUES (9, 20, 10);
INSERT INTO `tb_answer` VALUES (10, 21, 11);
INSERT INTO `tb_answer` VALUES (4, 22, 10);
INSERT INTO `tb_answer` VALUES (11, 23, 7);
INSERT INTO `tb_answer` VALUES (12, 24, 7);

-- ----------------------------
-- Table structure for tb_knowledgeoflaw
-- ----------------------------
DROP TABLE IF EXISTS `tb_knowledgeoflaw`;
CREATE TABLE `tb_knowledgeoflaw`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `frequency` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_knowledgeoflaw
-- ----------------------------
INSERT INTO `tb_knowledgeoflaw` VALUES (11, '其他', '被治安拘留15天会不会留案底', '因为做了违法或是不好的事情而被治安拘留了15天，虽然治安拘留不是坐牢，但也是限制人身自由，也触犯了法律，有些人害怕自己干净的档案会因此受到影响，在自己的档案上留下案底。那么被治安拘留15天会不会留案底？', '被治安拘留15天会不会留案底？一般不会。“治安拘留15天”属于行政处罚，不是刑事处罚，不会留有案底，只会在公安机关留有记录。案底：一般指某人过去犯法或犯罪行为的记录。又称犯罪人员犯罪记录制度，在我国法律中一般指有过刑事犯罪前科的档案记录，而该犯罪档案一般存放至公安部门保存。治安机关指某人过去犯法或犯罪行为的记录。（又称为\"前科\"）是个人的刑事犯罪记录，存于当地或上至国家级的档案中，是自然人的历史另类表现。\r\n\r\n处罚依据\r\n\r\n华律网\r\n\r\n对于行政违法行为，按照法律应当被拘留的，会被行政机关处以行政拘留的处罚。而最常见的行政拘留[1]的产生往往是违反了《治安管理处罚法》的规定，由公安机关决定和执行，通常称治安拘留。该法第二条规定：扰乱公共秩序，妨害公共安全，侵犯人身权利、财产权利，妨害社会管理，具有社会危害性，依照《中华人民共和国刑法》的规定构成犯罪的，依法追究刑事责任;尚不够刑事处罚的，由公安机关依照本法给予治安管理处罚。\r\n\r\n治安拘留处罚程序\r\n\r\n调查\r\n\r\n公安机关对报案、控告、举报或者违反治安管理行为人主动投案，以及其他行政主管部门、司法机关移送的违反治安管理案件，应当及时受理，并进行登记。\r\n\r\n决定\r\n\r\n治安案件调查结束后，公安机关应当根据不同情况，分别作出以下处理：\r\n\r\n(一)确有依法应当给予治安管理处罚的违法行为的，根据情节轻重及具体情况，作出处罚决定;\r\n\r\n(二)依法不予处罚的，或者违法事实不能成立的，作出不予处罚决定;\r\n\r\n(三)违法行为已涉嫌犯罪的，移送主管机关依法追究刑事责任;\r\n\r\n(四)发现违反治安管理行为人有其他违法行为的，在对违反治安管理行为作出处罚决定的同时，通知有关行政主管部门处理。                            ', 0);
INSERT INTO `tb_knowledgeoflaw` VALUES (12, '其他', '家人赌博报警有什么后果', '我国法律明确规定禁止赌博活动，而平时打麻将娱乐，涉及到小量资金的，不认定为赌博。公民发现赌博行为的，可以向公安机关报案，如果发现家人赌博，向公安机关报案有什么后果?', '一、家人赌博报警有什么后果\r\n\r\n家人赌博向公安机关按的，公安机关会对赌博进行查处，不构成犯罪的，给予赌博者治安管理处罚，构成犯罪的，追究刑事责任。\r\n\r\n《治安管理处罚法》\r\n\r\n第七十条 以营利为目的，为赌博提供条件的，或者参与赌博赌资较大的，处五日以下拘留或者五百元以下罚款;情节严重的，处十日以上十五日以下拘留，并处五百元以上三千元以下罚款。\r\n\r\n《刑法》\r\n\r\n第三百零三条 【赌博罪】以营利为目的，聚众赌博或者以赌博为业的，处三年以下有期徒刑、拘役或者管制，并处罚金。\r\n\r\n【开设赌场罪】开设赌场的，处三年以下有期徒刑、拘役或者管制，并处罚金;情节严重的，处三年以上十年以下有期徒刑，并处罚金。\r\n\r\n二、网上开设赌博罪共犯的认定\r\n\r\n明知是赌博网站，而为其提供下列服务或者帮助的，属于开设赌场罪的共同犯罪，依照刑法第三百零三条第二款的规定处罚：\r\n\r\n(一)为赌博网站提供互联网接入、服务器托管、网络存储空间、通讯传输通道、投放广告、发展会员、软件开发、技术支持等服务，收取服务费数额在2万元以上的;\r\n\r\n(二)为赌博网站提供资金支付结算服务，收取服务费数额在1万元以上或者帮助收取赌资20万元以上的;\r\n\r\n(三)为10个以上赌博网站投放与网址、赔率等信息有关的广告或者为赌博网站投放广告累计100条以上的。\r\n\r\n实施前款规定的行为，数量或者数额达到前款规定标准5倍以上的，应当认定为刑法第三百零三条第二款规定的“情节严重”。\r\n\r\n发现家人有参与赌博的行为后，向公安机关报案的，公安机关会对赌博行为进行调查，如果赌博行为不构成刑事犯罪的，给予赌博人员治安管理处罚，如果构成犯罪的，按赌博罪追究刑事责任。                            ', 0);
INSERT INTO `tb_knowledgeoflaw` VALUES (13, '合同事务', '劳务派遣员工工伤应该找谁赔偿', '劳务派遣是一种新型用工方式，劳务派遣适用的工作有明确的规定，一般是适用临时性、辅助性或者替代性的工作岗位上实施，而劳务人员在工作中可能会受伤，劳务人员受工伤要找谁赔偿?', '  一、劳务派遣员工工伤应该找谁赔偿\r\n\r\n劳务派遣人员在工作中受伤的，应该找劳务派遣公司赔偿，劳务派遣公司与劳务派遣人员有签订劳动合同。\r\n\r\n二、相关法律规定\r\n\r\n《劳动合同法》\r\n\r\n第五十八条 【劳务派遣单位、用工单位及劳动者的权利义务】劳务派遣单位是本法所称用人单位，应当履行用人单位对劳动者的义务。劳务派遣单位与被派遣劳动者订立的劳动合同，除应当载明本法第十七条规定的事项外，还应当载明被派遣劳动者的用工单位以及派遣期限、工作岗位等情况。\r\n\r\n劳务派遣单位应当与被派遣劳动者订立二年以上的固定期限劳动合同，按月支付劳动报酬;被派遣劳动者在无工作期间，劳务派遣单位应当按照所在地人民政府规定的最低工资标准，向其按月支付报酬。\r\n\r\n《工伤保险条例》\r\n\r\n第十七条 职工发生事故伤害或者按照职业病防治法规定被诊断、鉴定为职业病，所在单位应当自事故伤害发生之日或者被诊断、鉴定为职业病之日起30日内，向统筹地区社会保险行政部门提出工伤认定申请。遇有特殊情况，经报社会保险行政部门同意，申请时限可以适当延长。\r\n\r\n用人单位未按前款规定提出工伤认定申请的，工伤职工或者其近亲属、工会组织在事故伤害发生之日或者被诊断、鉴定为职业病之日起1年内，可以直接向用人单位所在地统筹地区社会保险行政部门提出工伤认定申请。\r\n\r\n按照本条第一款规定应当由省级社会保险行政部门进行工伤认定的事项，根据属地原则由用人单位所在地的设区的市级社会保险行政部门办理。\r\n\r\n用人单位未在本条第一款规定的时限内提交工伤认定申请，在此期间发生符合本条例规定的工伤待遇等有关费用由该用人单位负担。\r\n\r\n依据《劳动合同法》、《工伤保险条例》等法律的规定，劳务派遣人员在工作中受伤的，可以向劳务派遣单位主张赔偿，劳务派遣单位应该为劳务派遣人员申请工伤认定。                          ', 0);
INSERT INTO `tb_knowledgeoflaw` VALUES (14, '刑事辩护', '人肉搜索是否违法', '在现实生活中人肉搜索是比较多的行为，人肉搜索是指对被搜索人的各种信息进行收集和公开的行为，人肉搜索涉及到比较多的法律问题，那么人肉搜索是否违法', '一、人肉搜索是否违法\r\n\r\n人肉搜索行为是违法的，人肉搜索涉及侵犯个人隐私、侵犯他人名誉、侮辱诽谤他人等的违法犯罪行为。\r\n\r\n二、相关法律规定\r\n\r\n《计算机信息网络国际联网安全保护管理办法》\r\n\r\n第五条\r\n\r\n任何单位和个人不得利用国际联网制作、复制、查阅和传播下列信息：(一)煽动抗拒、破坏宪法和法律、行政法规实施的;(二)煽动颠覆国家政权，推翻社会主义制度的;(三)煽动分裂国家、破坏国家统一的;(四)煽动民族仇恨、民族歧视，破坏民族团结的;(五)捏造或者歪曲事实，散布谣言，扰乱社会秩序的;(六)宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖，教唆犯罪的;(七)公然侮辱他人或者捏造事实诽谤他人的;(八)损害国家机关信誉的;(九)其他违反宪法和法律、行政法规的。\r\n\r\n《最高人民法院关于审理利用信息网络侵害人身权益民事纠纷案件适用法律若干问题的规定》\r\n\r\n第十二条 网络用户或者网络服务提供者利用网络公开自然人基因信息、病历资料、健康检查资料、犯罪记录、家庭住址、私人活动等个人隐私和其他个人信息，造成他人损害，被侵权人请求其承担侵权责任的，人民法院应予支持。但下列情形除外：\r\n\r\n(一)经自然人书面同意且在约定范围内公开;\r\n\r\n(二)为促进社会公共利益且在必要范围内;\r\n\r\n(三)学校、科研机构等基于公共利益为学术研究或者统计的目的，经自然人书面同意，且公开的方式不足以识别特定自然人;\r\n\r\n(四)自然人自行在网络上公开的信息或者其他已合法公开的个人信息;\r\n\r\n(五)以合法渠道获取的个人信息;\r\n\r\n(六)法律或者行政法规另有规定。\r\n\r\n网络用户或者网络服务提供者以违反社会公共利益、社会公德的方式公开前款第四项、第五项规定的个人信息，或者公开该信息侵害权利人值得保护的重大利益，权利人请求网络用户或者网络服务提供者承担侵权责任的，人民法院应予支持。\r\n\r\n国家机关行使职权公开个人信息的，不适用本条规定。                            ', 1);
INSERT INTO `tb_knowledgeoflaw` VALUES (15, '交通事故', '隔夜醉酒驾车的如何处罚', '现代社会，依旧存在隔夜醉酒驾车这种现象。根据我国法律被认为醉酒驾车必然会受到处罚。对于隔夜醉酒驾车与醉酒驾车存在差异，主要就是有隔夜。那隔夜醉酒驾车该怎么认定呢？', '隔夜醉驾，一般是指前一天晚上饮酒，第二天处于醉酒状态实施驾驶的行为。\r\n\r\n危险驾驶罪属于故意犯罪，主观上要求机动车驾驶人明知醉酒驾驶或追逐竞驶行为对公共安全的危害进而放任该种危险。\r\n\r\n醉驾行为认定的标准遵循的是“一般人标准”。每一个人的酒精耐受性不等，立法与司法只能规定一定的血液酒精含量标准作为酒驾或醉驾标准。隔夜醉驾行为人因前一天晚上过量饮酒，第二天“酒醒”后开车如仍被检测为酒精含量达到醉酒标准，从客观上分析，该种行为同样对道路交通安全构成危险;从主观上分析，行为人对是否饮酒以及酒后不能开车均存在认识，至于行为人自认为已经脱离醉酒状态的错误判断属于认识错误范畴，不影响行为人醉酒驾驶故意的认定。\r\n\r\n司法实践中，隔夜醉驾行为如果不认定为危险驾驶罪并加以处罚，则行为人均会倾向于援引“隔夜”甚至“隔数夜”醉驾来规避刑罚，这有违立法原意。而且，隔夜醉驾行为若不认定为犯罪，则是否“隔夜”将给司法认定带来极大困难。\r\n\r\n综合上述，小编整理有关隔夜醉酒驾车的相关内容。由此可见，隔夜醉酒驾车有时候也会受到处罚。我国对醉酒驾车的行为查处的很严，一旦被抓住肯定是要依法追究行为人的法律责任。具体就包括行政责任与刑事责任。', 0);

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题类型',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题标题',
  `details` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题详情',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `telnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回答',
  `statu` int(0) NULL DEFAULT NULL COMMENT '0：审核中 1：已审核 2：已解答',
  `creatby` int(0) NOT NULL COMMENT '申请人',
  `frequency` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '查看次数',
  PRIMARY KEY (`id`, `creatby`) USING BTREE,
  INDEX `creatby`(`creatby`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `tb_question_ibfk_1` FOREIGN KEY (`creatby`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (14, '合同事务', ' 劳动合同与社保', '去年4月份入职一家公司，签订了一年的劳动合同。今年4月劳动合同到期后公司没有续签，但实际仍在公司正常工作，直至上个星期（6月下旬）公司突然通知不继续履行劳动关系（公司以缺乏资金、减轻压力为由突然通知员工不用去上班了。）劳动合同关系始于2019年4月，今年4月合同到期后没有续签，5、6月份仍然在公司正常工作，期间工资照常发放。问题如下： 1.公司以资金短缺为由通知员工不再去公司上班，是否属于公司单方面解除劳动合同？如是，可否要求获得1.5个月工资（在职超过1年不到1年半）的经济补偿金和1个月工资的（解除劳动关系）代通知金？ 2.合同今年4月到期后没有续签，是否视作公司未与员工签订劳动合同，可否要求5、6月份工资双倍赔偿？ 3.公司自2019年4月签订劳动合同以来一直未按规定给员工缴纳五险一金，可否要求公司补缴入职14个月以来的社保，并赔偿1.5个月工资（在职超过1年不到1年半）的经济补偿金？ 望指教，谢谢！                            ', '李翔宇', '12345678901', '1、应该是违法解除，你可以获得经济赔偿；经济赔偿的标准是经济补偿的2倍；2、未签书面劳动合同可以要求公司支付双倍工资；3、公司应缴未缴社会保险，可以向劳动行政部门投诉，要求公司补缴，但是不存在赔偿经济补偿金的说法，因为你第一项已经要求了经济赔偿。 ', 2, 6, 0);
INSERT INTO `tb_question` VALUES (15, '合同事务', '被通知裁员', '坐标：深圳 2020年5月下旬通知被裁员，按n 1赔付。但公司拒付《薪酬确认书》里提到的年度目标奖金（有具体的奖金数额），同时拒付2019年全年加班累计超200个小时的加班费。已经跟HR谈了2次，仍被通知不可能支付这两部份。说接下来还有1次沟通。我已经做好仲裁 上法院的准备，我想咨询下，目前我有公司发的薪酬确认书 2019年打卡记录，是否可以做为充分证据？即使是仲裁，我也想请专业律师在场。当时入职的时候公司为了不支付加班费，让员工签署了自愿加班的协议，但作为新入职员工来讲我们其实不得不签。                            ', '李翔宇', '12345678901', NULL, 1, 6, 0);
INSERT INTO `tb_question` VALUES (16, '合同事务', '未缴纳社保离职赔偿', '入职七个月,公司未缴纳社保,现在公司要搬去外地,导致我失业,我想要申请赔偿,公司不想给我赔偿,给的答复是社保可以给我补缴,可以依然在上海单独为我找工位工作.但是现在这个事情已经出了,我继续留在这肯定会对我有影响,我不想接受这个方案,这种情况我可以以不缴社保为理由离职并且申请赔偿吗                            ', '李翔宇', '12345678901', NULL, 1, 6, 0);
INSERT INTO `tb_question` VALUES (17, '债务债权', '网贷催收问题 ', '有网贷催收人员上门，我问他们代表的是什么公司，他们却说不知道，该怎么办？                            ', '黄斌', '01234567890', '\r\n有暴力行为建议立刻报警。 ', 2, 8, 1);
INSERT INTO `tb_question` VALUES (18, '婚姻家庭', '婚姻问题', '男方出钱买的房子但是名字写的是女方的名字，目前还没有结婚，双方现在闹矛盾分开了，最终房子房子归谁                            ', '黄斌', '01234567890', NULL, 1, 8, 1);
INSERT INTO `tb_question` VALUES (19, '其他', '房屋用途及外墙漏水问题 ', '16年购买商住房一间，处于楼房最边缘位置。 18年因为楼与楼之间相连处出现裂痕，外墙漏水，当时开发商指定的物业水泥填补裂缝解决问题。 现在同一面墙的另一处又开始漏水，且只有雨天漏水，现在的物业与开发商沟通无果。 问题如下： 1.竣工日期15年，房屋是否在保？ 2..如果要起诉开发商需要哪些材料？ 3.所购商住房土地用途：商住办/房屋用途：店铺的房屋是否可以作为住宅使用？               ', '黄斌', '01234567890', '\r\n1、在保修期内，如果不是人为的原因造成的漏水，开发商要承担全部责任。根据《房屋建筑工程质量保修办法》第七条规定:第1条第(二)款有屋面防水工程、有防水要求的卫生间、房间和外墙面的防渗漏,为5年，第(四)款电气管线、给排水管道、设备安装为2年，从工程竣工验收合格之日起计算。 2、漏水肯定不是物业造成的，但如果物业在这里面有疏于管理的情况,或是出现了问题后没有及时处理，导致损失扩大或出现了更严重的问题，那么物业要承担责任。前者比如管道堵塞，虽然不是物业干的，但根据物业管理合同和相关规定，物业公司应定期进行检查和清理，如果没做到,那就可以追究物业的 责任;后者比如楼上违法装修，物业未制止，那么就可以找物业要求赔偿损失。 ', 2, 8, 1);
INSERT INTO `tb_question` VALUES (20, '婚姻家庭', '和前任没领证结婚，生了一儿一女，和现任在一起后他骚扰现任', ' 我和前任没有结婚领证，在一起六年了，生了一儿一女，现在因为感情破裂分开了，但是我和现任在一起后他就找上了我现任，发信息威胁，还跑到我们上班的地方闹，说要打他什么的，我现任什么错都没有，他就一直说他是第三者，我是和他分开后才和现任在一起的，如果我要上法院我该怎么做                           ', '黄斌', '01234567890', '你前任的行为涉嫌寻衅滋事，如果他继续闹的话建议你报警处理；另外，你前任如果散播诸如小三之类的言论，可能对你的现任名誉造成损害，你现任可以到法院提起诽谤罪的自诉 ', 2, 8, 1);
INSERT INTO `tb_question` VALUES (21, '合同事务', '父母在单位工作20多年一直临时工待遇，单位没有给予签约劳动合同咋办？', '父母以及他们十几位工友在某单位工作多年，其中我爸妈92年开始，在单位工作至今27年，单位一直没有给予签订劳动合同，并且一直是临时工待遇。今年2月份底父母一会他们十几位工友收到单位的解聘书，妈妈还有两年才退休，爸爸还有十年退休。 多年前单位领导瞒报信息，导致我父母以及十几位工友没有进入到正式员工系统库，所以一直没有得到正式工待遇，而其他入库的正式工月薪五、六千还有各种福利，我爸妈扣完社保只有一千多，现又遭单位解聘，没有收入，日子不好过。我自己也查了资料，在单位工作十年就已视为签订无固定期限劳动合同，为什么单位给予的待遇还是临时工待遇？ 所以想请问：这其中的工资福利能否补偿？又会补偿多少？怎样走法律程序才正确？父母多年来工资的发放清单都保存很完整，其他十几位工友也都是一样的情况，想用法律的武器，解决我爸妈和这些叔叔阿姨们受到的不公平待遇。                            ', '用户user', '34567890120', NULL, 1, 9, 1);
INSERT INTO `tb_question` VALUES (22, '房产纠纷', '叔叔很早离婚，所有房产归我叔叔但没过户他已死', '叔叔很早离婚，判决书上写所有房产都归我叔叔但没有过户，他已死，女儿从不来往，这房子他妹妹有份可以分吗                            ', '用户user', '34567890120', '叔叔已过世，那么房产属于遗产了，在没有遗嘱的情况下是按法定继承来，有第一顺位继承人（叔叔的父母、子女、配偶）的情况下，由第一顺位继承人继承。那叔叔的妹妹是第二顺位，第一顺位还有人的，第二顺位不能继承。 ', 2, 9, 1);
INSERT INTO `tb_question` VALUES (23, '劳动工伤', '能算工伤吗，反而给我解除了劳动合同，公司有责任吗，可以起诉公司吗 ', '我在厂里上班时间，为工作事与同事发生争执打架受重伤二级，脾脏摘除，肋骨两根骨折，能算工伤吗，公司不但没给关心补助问候，反而给我解除了劳动合同，公司有责任吗，可以起诉公司吗                            ', '用户user', '34567890120', '属于工伤，建议采取如下措施：1、单位不申请，你可自行申请工伤认定，2、工伤认定后，申请工伤等级鉴定。3、确定工伤等级后，要求享有工伤待遇。4、单位不给予工伤待遇，可以申请劳动仲裁。5、注意工伤认定期限为一年。6、若需要帮助，可来电或当面咨询。 ', 2, 9, 1);
INSERT INTO `tb_question` VALUES (24, '请选择问题类型', '工资在外。年终奖高达三十万。却不给奖金。我应该怎么办。 ', '我是被聘用的售楼处的总监。工资在外。年终奖高达三十万。但没到年底他们却以各种借口解聘我。却不给奖金。我应该怎么办。                            ', '用户user', '34567890120', '\r\n你好，可以起诉赔付 ', 2, 9, 2);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `grade` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (5, 'wam', '1234', '男', '1999-02-03', 2);
INSERT INTO `tb_user` VALUES (6, 'lxy', '1234', '男', '1999-07-22', 0);
INSERT INTO `tb_user` VALUES (7, 'lcx', '1234', '男', '1998-06-18', 1);
INSERT INTO `tb_user` VALUES (8, 'hb', '1234', '男', '1999-07-06', 0);
INSERT INTO `tb_user` VALUES (9, 'user', '1234', '女', '2018-06-06', 0);
INSERT INTO `tb_user` VALUES (10, 'lawyer', '1234', '女', '1969-11-28', 1);
INSERT INTO `tb_user` VALUES (11, 'faguan', '1234', '男', '1969-11-28', 1);

SET FOREIGN_KEY_CHECKS = 1;