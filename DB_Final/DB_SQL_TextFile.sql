CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryTitle` varchar(120) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryTitle_UNIQUE` (`CategoryTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (4,'地方創生'),(10,'攝影'),(3,'教育'),(9,'新春賀喜'),(7,'時尚'),(1,'科技'),(5,'空間'),(2,'遊戲'),(8,'音樂'),(6,'飲食');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_comment` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `ProposalID` int NOT NULL,
  `CommentMemberID` int NOT NULL,
  `CommentCreateTime` datetime NOT NULL,
  `MemberComment` text NOT NULL,
  `ProposerResponse` text,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `CommentMemberID_idx` (`CommentMemberID`),
  KEY `ProposalID_idx` (`ProposalID`),
  CONSTRAINT `CommentMemberID` FOREIGN KEY (`CommentMemberID`) REFERENCES `tb_member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProposalIDAtComment` FOREIGN KEY (`ProposalID`) REFERENCES `tb_proposal` (`ProposalID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (1,5,9,'2021-12-14 00:00:00','不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)',0),(2,1,10,'2022-04-07 00:00:00','GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～',0),(3,1,3,'2022-04-08 00:00:00','請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?','',0),(4,5,4,'2021-12-15 00:00:00','讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～',0),(5,4,8,'2013-08-22 00:00:00','加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！',0),(6,10,1,'2022-05-25 00:00:00','上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )',0),(7,1,2,'2022-04-09 00:00:00','我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com',0),(8,2,6,'2022-03-25 00:00:00','請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)',0),(9,1,7,'2022-04-10 00:00:00','有機會可以早點出貨嗎？6/1要等很久','',0),(10,3,1,'2022-05-06 00:00:00','請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收',0);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_faq`
--

DROP TABLE IF EXISTS `tb_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_faq` (
  `FAQID` int NOT NULL AUTO_INCREMENT,
  `ProposalID` int NOT NULL,
  `LastEditorID` int DEFAULT NULL,
  `Question` text NOT NULL,
  `Answer` text NOT NULL,
  `FAQCreateTime` datetime NOT NULL,
  `LastUpdateTime` datetime NOT NULL,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`FAQID`),
  KEY `ProposalID_idx` (`ProposalID`),
  KEY `LastEditorID_idx` (`LastEditorID`),
  CONSTRAINT `LastEditorIDAtFAQ` FOREIGN KEY (`LastEditorID`) REFERENCES `tb_member` (`MemberID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ProposalIDAtFAQ` FOREIGN KEY (`ProposalID`) REFERENCES `tb_proposal` (`ProposalID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_faq`
--

LOCK TABLES `tb_faq` WRITE;
/*!40000 ALTER TABLE `tb_faq` DISABLE KEYS */;
INSERT INTO `tb_faq` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 16:13:00','2022-05-24 17:13:00',0),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 14:03:00','2022-05-24 15:03:00',0),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 14:03:00','2022-05-24 15:03:00',0),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 14:28:00','2022-05-23 15:28:00',0),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 14:28:00','2022-05-23 15:28:00',0),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 14:18:00','2022-05-23 15:18:00',0),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 20:30:00','2022-05-24 21:30:00',0),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00','2022-05-15 14:36:00',0),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 14:06:00','2022-05-19 15:06:00',0),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00','2022-05-19 15:06:00',0);
/*!40000 ALTER TABLE `tb_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_followingrecord`
--

DROP TABLE IF EXISTS `tb_followingrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_followingrecord` (
  `FollowingRecordID` int NOT NULL AUTO_INCREMENT,
  `ProposalID` int NOT NULL,
  `MemberID` int NOT NULL,
  `FollowingRecordCreateTime` datetime NOT NULL,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`FollowingRecordID`),
  KEY `ProposalID_idx` (`ProposalID`),
  KEY `MemberID_idx` (`MemberID`),
  CONSTRAINT `MemberIDAtFollowingProposalRecord` FOREIGN KEY (`MemberID`) REFERENCES `tb_member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProposalIDAtFollowingProposalRecord` FOREIGN KEY (`ProposalID`) REFERENCES `tb_proposal` (`ProposalID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_followingrecord`
--

LOCK TABLES `tb_followingrecord` WRITE;
/*!40000 ALTER TABLE `tb_followingrecord` DISABLE KEYS */;
INSERT INTO `tb_followingrecord` VALUES (1,6,9,'2022-05-25 00:00:00',0),(2,1,10,'2022-04-06 00:00:00',0),(3,1,3,'2022-04-06 00:00:00',0),(4,5,4,'2021-12-12 00:00:00',0),(5,4,8,'2013-08-21 00:00:00',0),(6,10,1,'2022-05-24 00:00:00',0),(7,1,2,'2022-04-06 00:00:00',0),(8,2,6,'2022-03-23 00:00:00',0),(9,1,7,'2022-04-06 00:00:00',0),(10,3,1,'2022-05-04 00:00:00',0);
/*!40000 ALTER TABLE `tb_followingrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_member`
--

DROP TABLE IF EXISTS `tb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_member` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Phone` varchar(64) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Salt` char(64) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_member`
--

LOCK TABLES `tb_member` WRITE;
/*!40000 ALTER TABLE `tb_member` DISABLE KEYS */;
INSERT INTO `tb_member` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號'),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號'),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號'),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號'),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號'),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號'),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號'),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號'),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號'),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號');
/*!40000 ALTER TABLE `tb_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_membercredential`
--

DROP TABLE IF EXISTS `tb_membercredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_membercredential` (
  `MemberCredentialID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `HashedPassword` varchar(200) NOT NULL,
  PRIMARY KEY (`MemberCredentialID`,`MemberID`),
  KEY `MemberId_idx` (`MemberID`),
  CONSTRAINT `MemberIdAtMemberCredential` FOREIGN KEY (`MemberID`) REFERENCES `tb_member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_membercredential`
--

LOCK TABLES `tb_membercredential` WRITE;
/*!40000 ALTER TABLE `tb_membercredential` DISABLE KEYS */;
INSERT INTO `tb_membercredential` VALUES (1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802');
/*!40000 ALTER TABLE `tb_membercredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proposal`
--

DROP TABLE IF EXISTS `tb_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_proposal` (
  `ProposalID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int NOT NULL,
  `ProposalTitle` varchar(120) NOT NULL,
  `Content` text,
  `AccumulatedAmount` int unsigned NOT NULL,
  `Goal` int unsigned NOT NULL,
  `Status` int unsigned NOT NULL,
  `ViewedClicks` int unsigned NOT NULL,
  `ProposalCreateTime` datetime NOT NULL,
  `OnGoingTime` datetime DEFAULT NULL,
  `DueTime` datetime DEFAULT NULL,
  `IsPostponed` tinyint NOT NULL,
  `IsDeactivated` tinyint NOT NULL,
  PRIMARY KEY (`ProposalID`),
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `CategoryIDAtProposal` FOREIGN KEY (`CategoryID`) REFERENCES `tb_category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proposal`
--

LOCK TABLES `tb_proposal` WRITE;
/*!40000 ALTER TABLE `tb_proposal` DISABLE KEYS */;
INSERT INTO `tb_proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022-04-06 00:00:00','2022-04-06 00:00:00','2022-07-05 00:00:00',0,0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimóo 情緒平衡軟糖 ✧ 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',377200,200000,2,251,'2022-03-23 00:00:00','2022-03-23 00:00:00','2022-06-21 00:00:00',0,0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022-05-04 00:00:00','2022-05-04 00:00:00','2022-08-02 00:00:00',0,0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013-08-21 00:00:00','2013-08-21 00:00:00','2013-11-19 00:00:00',0,1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021-12-12 00:00:00','2021-12-12 00:00:00','2022-03-12 00:00:00',1,1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,2,63,'2022-05-25 00:00:00','2022-05-25 00:00:00','2022-08-23 00:00:00',0,0),(7,3,'謎路⼈Way of Puzzle 2022【It\'s All I Have】專輯發⾏企劃','',45651,400000,2,31,'2022-05-23 00:00:00','2022-05-23 00:00:00','2022-08-21 00:00:00',0,0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022-03-22 00:00:00',NULL,NULL,0,0),(9,10,'SIRUI 75mm ​變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021-07-20 00:00:00','2021-07-20 00:00:00','2021-10-18 00:00:00',1,1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022-05-24 00:00:00','2022-05-24 00:00:00','2022-08-22 00:00:00',1,1);
/*!40000 ALTER TABLE `tb_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proposalmember`
--

DROP TABLE IF EXISTS `tb_proposalmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_proposalmember` (
  `ProposalMemberID` int NOT NULL AUTO_INCREMENT,
  `ProposalID` int NOT NULL,
  `MemberID` int NOT NULL,
  `ProposalMemberCreateTime` datetime NOT NULL,
  `IsMainProposer` tinyint NOT NULL,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`ProposalMemberID`),
  KEY `MemberID_idx` (`MemberID`),
  KEY `ProposalID_idx` (`ProposalID`),
  CONSTRAINT `MemberIDAtProposalMember` FOREIGN KEY (`MemberID`) REFERENCES `tb_member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProposalIDAtProposalMember` FOREIGN KEY (`ProposalID`) REFERENCES `tb_proposal` (`ProposalID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proposalmember`
--

LOCK TABLES `tb_proposalmember` WRITE;
/*!40000 ALTER TABLE `tb_proposalmember` DISABLE KEYS */;
INSERT INTO `tb_proposalmember` VALUES (1,4,8,'2013-08-21 00:00:00',1,0),(2,1,7,'2022-04-06 00:00:00',1,0),(3,2,6,'2022-03-23 00:00:00',1,0),(4,7,3,'2022-05-23 00:00:00',1,0),(5,3,4,'2022-05-04 00:00:00',1,0),(6,10,1,'2022-05-24 00:00:00',1,0),(7,6,4,'2022-05-25 00:00:00',1,0),(8,6,3,'2022-05-26 00:00:00',0,0),(9,5,9,'2021-12-12 00:00:00',1,0),(10,8,2,'2022-03-22 00:00:00',1,0),(11,9,10,'2021-07-20 00:00:00',1,0),(12,10,8,'2022-05-25 00:00:00',0,0);
/*!40000 ALTER TABLE `tb_proposalmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proposaloption`
--

DROP TABLE IF EXISTS `tb_proposaloption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_proposaloption` (
  `ProposalOptionID` int NOT NULL AUTO_INCREMENT,
  `ProposalID` int NOT NULL,
  `ProposalOptionTitle` varchar(120) NOT NULL,
  `PricePerEach` int NOT NULL,
  `Description` text NOT NULL,
  `QuantityLimit` int DEFAULT NULL,
  PRIMARY KEY (`ProposalOptionID`,`ProposalID`),
  KEY `ProposalID_idx` (`ProposalID`),
  CONSTRAINT `ProposalIDAtProposalOption` FOREIGN KEY (`ProposalID`) REFERENCES `tb_proposal` (`ProposalID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proposaloption`
--

LOCK TABLES `tb_proposaloption` WRITE;
/*!40000 ALTER TABLE `tb_proposaloption` DISABLE KEYS */;
INSERT INTO `tb_proposaloption` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。',50),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ ',100),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 ',1000),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物',100),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 ',200),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款',100),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕',200),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 ',100),(9,4,'原畫畫作一件10號',15000,'原畫畫作',200),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimóo情緒平衡軟糖 1 盒',200);
/*!40000 ALTER TABLE `tb_proposaloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sponserrecord`
--

DROP TABLE IF EXISTS `tb_sponserrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sponserrecord` (
  `SponserRecordID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `ProposalOptionID` int NOT NULL,
  `Amount` int unsigned NOT NULL,
  `SponserRecordCreateTime` datetime NOT NULL,
  `IsDeleted` tinyint NOT NULL,
  PRIMARY KEY (`SponserRecordID`),
  KEY `MemberID_idx` (`MemberID`),
  KEY `ProposalOptionID_idx` (`ProposalOptionID`),
  CONSTRAINT `MemberIDAtSponserRecord` FOREIGN KEY (`MemberID`) REFERENCES `tb_member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProposalOptionIDAtSponserRecord` FOREIGN KEY (`ProposalOptionID`) REFERENCES `tb_proposaloption` (`ProposalOptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sponserrecord`
--

LOCK TABLES `tb_sponserrecord` WRITE;
/*!40000 ALTER TABLE `tb_sponserrecord` DISABLE KEYS */;
INSERT INTO `tb_sponserrecord` VALUES (1,9,4,800,'2021-12-12 00:00:00',0),(2,10,1,2290,'2022-04-06 00:00:00',0),(3,3,1,2290,'2022-04-06 00:00:00',0),(4,4,4,800,'2021-12-12 00:00:00',0),(5,8,9,15000,'2013-08-21 00:00:00',0),(6,1,5,18800,'2022-05-24 00:00:00',0),(7,2,1,2290,'2022-04-06 00:00:00',0),(8,6,10,690,'2022-03-23 00:00:00',0),(9,7,1,2290,'2022-04-06 00:00:00',0),(10,1,2,1790,'2022-05-04 00:00:00',0);
/*!40000 ALTER TABLE `tb_sponserrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateProposal`(
	IN inMemberID int, 
    IN inTitle varchar(120), 
    IN inContent TEXT, 
    IN inGoal int, 
    IN inCategoryID int,
    OUT outAffectedRowNum int,
    OUT outMessage TEXT
)
BEGIN
	-- 資料出錯時可以rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	ROLLBACK;
	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated' INTO outMessage;
    SELECT 0 INTO outAffectedRowNum;
	END;
    
    -- 確定沒有已存在的proposal標題或是內容
    IF NOT EXISTS( 
        SELECT ProposalID
        FROM tb_proposal
		WHERE ProposalTitle = inTitle OR Content = inContent
	) THEN 
		-- 開始創建
		START TRANSACTION;
			-- 創建proposal
			INSERT INTO tb_proposal (CategoryID, ProposalTitle, Content, AccumulatedAmount, Goal, Status, ViewedClicks, ProposalCreateTime, IsPostponed, IsDeactivated)
				VALUES(inCategoryID, inTitle, inContent, 0, inGoal, 1, 0, CURRENT_TIMESTAMP(), 0, 0);
			-- 輸出前語法影響列數
            SELECT row_count() INTO outAffectedRowNum;
            -- 將創建的proposalID存入變數
            SELECT LAST_INSERT_ID() INTO @var_tempproposalID;
			-- 將創建者設為proposalmember，且因為是創建者，故IsMainProposer為1
			INSERT INTO tb_proposalmember (ProposalID, MemberID, ProposalMemberCreateTime, IsMainProposer, IsDeleted)
				VALUES(@var_tempproposalID, inMemberID, CURRENT_TIMESTAMP(), 1, 0);
			-- 輸出前語法影響列數
            SELECT outAffectedRowNum + row_count() INTO outAffectedRowNum;
        -- 創建完成
        COMMIT WORK;
        -- 更改成功訊息
		SELECT 'Create Proposal success' INTO outMessage;
		-- 最終table輸出
        SELECT tb_proposal.ProposalID as proposal_id,
				tb_proposal.ProposalTitle as proposal_title,
				tb_proposal.Content as proposal_content,
				tb_proposal.AccumulatedAmount as amount,
				tb_proposal.Goal as goal,
				tb_proposal.Status as status,
				tb_proposal.ViewedClicks as viewed_num,
				tb_proposal.ProposalCreateTime as create_date,
				tb_proposal.DueTime as due_date,
				tb_category.CategoryTitle as category
		FROM tb_proposal
		INNER JOIN tb_category ON tb_proposal.CategoryID = tb_category.CategoryID
		WHERE tb_proposal.ProposalID = @var_tempproposalID;
	ELSE
		SELECT 'The proposal already exist' INTO outMessage;
        SELECT 0 INTO outAffectedRowNum;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteMember`(
	IN inMemberID int,
    OUT outAffectedRowNum int,
    OUT outMessage TEXT
)
BEGIN
	-- 資料出錯時可以rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	ROLLBACK;
	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated' INTO outMessage;
    SELECT 0 INTO outAffectedRowNum;
	END;
    -- 確認帳號存在
    IF EXISTS( 
        SELECT MemberID
        FROM tb_member
		WHERE MemberID = inMemberID
	) THEN 
		-- 確認該帳號並非仍然非屬於proposalmember之一
		IF NOT EXISTS (
			SELECT ProposalMemberID
            FROM tb_proposalmember
            WHERE MemberID = inMemberID
            AND IsDeleted = 0
		)THEN
			-- 刪除帳號連帶刪除的各項紀錄如下(因為ER設計為CASCADE): Membercredential、Followingrecord、 SponsorRecord 、 Comment 、ProposalMember
			-- 若剛好是FAQ的last editor 該欄位會set NULL
            -- 開始刪除
            START TRANSACTION;
                -- 刪除帳號
                DELETE FROM tb_member 
                WHERE MemberID = inMemberID;
                SELECT row_count() INTO outAffectedRowNum;
			-- 刪除成功
			COMMIT WORK;
			SELECT 'DELETE SUCCESS' INTO outMessage;
		ELSE
			SELECT 'DELETE FAILED: You are still a proposal member, thus, you cannot delete your account' INTO outMessage;
			SELECT 0 INTO outAffectedRowNum;
        END IF;
	ELSE
		SELECT 'DELETE FAILED: The member does not exist' INTO outMessage;
		SELECT 0 INTO outAffectedRowNum;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN inMemberID int,
    OUT outRowFound	int
)
BEGIN
	SELECT tb_followingrecord.MemberID as member_id,
			tb_proposal.ProposalID as proposal_id,
			tb_proposal.ProposalTitle as proposal_title,
			tb_proposal.AccumulatedAmount as proposal_amount,
			tb_proposal.Goal as proposal_goal
	FROM tb_followingrecord
	INNER JOIN tb_proposal ON tb_followingrecord.ProposalID = tb_proposal.ProposalID
	WHERE tb_followingrecord.MemberID = inMemberID
    AND tb_followingrecord.IsDeleted = 0;  -- 該追蹤紀錄尚未被使用者刪除
    
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN inMemberID int,
    OUT outRowFound	int
)
BEGIN
	SELECT tb_sponserrecord.MemberID as member_id,
			tb_proposal.ProposalID as proposal_id, 
            tb_proposal.ProposalTitle as proposal_title, 
            tb_proposaloption.ProposalOptionTitle as proposal_option_title, 
            tb_sponserrecord.Amount as amount,
            tb_proposal.Status as status
    FROM tb_sponserrecord 
		INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
		INNER JOIN tb_proposal ON tb_proposaloption.ProposalID = tb_proposal.ProposalID
    WHERE tb_sponserrecord.MemberID = inMemberID
    AND tb_sponserrecord.IsDeleted = 0;  -- 該贊助紀錄尚未被使用者刪除
    
    -- 輸出總共找到的列數
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN inRatio float,
    OUT outRowFound	int
)
BEGIN
	SELECT * FROM
		(SELECT ProposalID as proposal_id,
				ProposalTitle as proposal_title,
				AccumulatedAmount as proposal_amount,
				Goal as goal,
				-- 取小數點後兩位，不四捨五入
                TRUNCATE((AccumulatedAmount / Goal), 2) as ratio
		FROM tb_proposal
		-- Status 2 或 3 即為募資中、已到期
		WHERE Status!= 1
		-- 還未超過30天
		AND IsDeactivated = 0)temp
	WHERE temp.ratio > inRatio
	-- 依 ratio 大至小排列
	ORDER BY temp.ratio DESC; 
    
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalsByKeyword`(
	IN inKeyword varchar(64),
    OUT outRowFound	int
)
BEGIN
	-- 以使用者輸入的關鍵字模糊查詢Proposals
    SELECT ProposalID as proposal_id,
			ProposalTitle as proposal_title,
            DueTime as due_date,
			AccumulatedAmount as proposal_amount
    FROM tb_proposal
    WHERE ProposalTitle LIKE concat('%', inKeyword, '%');

    -- 輸出總共找到的列數
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetRecommendedProposals`(
	IN inMemberID int,
    OUT outRowFound	int
)
BEGIN
	-- 若存在符合條件的proposal
	IF EXISTS(
		SELECT * FROM tb_proposal
			WHERE Status = 2 -- 提案狀態必須是2
			AND ProposalID NOT IN(
				-- 為memberID不曾贊助過的提案
				SELECT DISTINCT tb_proposaloption.ProposalID 
				FROM tb_sponserrecord
				INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
				WHERE tb_sponserrecord.MemberID = 3)
			AND ProposalID NOT IN(
				-- 推薦內容不可以是自己的提案
				SELECT DISTINCT ProposalID 
				FROM tb_proposalmember
				WHERE MemberID = 3)
			AND ProposalID IN(
				-- 贊助同樣提案的人所贊助的提案
				SELECT DISTINCT tb_proposaloption.ProposalID 
					FROM tb_sponserrecord
					INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
					WHERE tb_sponserrecord.MemberID IN(
						-- 贊助同樣提案的人
						SELECT DISTINCT tb_sponserrecord.MemberID
						FROM tb_sponserrecord
						INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
						WHERE tb_sponserrecord.MemberID != 3 
						AND tb_proposaloption.ProposalID IN (
							-- MemberID贊助過的提案
							SELECT DISTINCT tb_proposaloption.ProposalID 
							FROM tb_sponserrecord
							INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
							WHERE tb_sponserrecord.MemberID = 3)))
	)THEN 
		SELECT ProposalID as proposal_id,
				ProposalTitle as propoal_title,
				Status as status,
				ViewedClicks as viewed_num
		-- 從符合條件的選取
		FROM (SELECT * FROM tb_proposal
				WHERE Status = 2 -- 提案狀態必須是2
				AND ProposalID NOT IN(
					-- 為memberID不曾贊助過的提案
					SELECT DISTINCT tb_proposaloption.ProposalID 
					FROM tb_sponserrecord
					INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
					WHERE tb_sponserrecord.MemberID = 3)
				AND ProposalID NOT IN(
					-- 推薦內容不可以是自己的提案
					SELECT DISTINCT ProposalID 
					FROM tb_proposalmember
					WHERE MemberID = 3)
				AND ProposalID IN(
					-- 贊助同樣提案的人所贊助的提案
					SELECT DISTINCT tb_proposaloption.ProposalID 
						FROM tb_sponserrecord
						INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
						WHERE tb_sponserrecord.MemberID IN(
							-- 贊助同樣提案的人
							SELECT DISTINCT tb_sponserrecord.MemberID
							FROM tb_sponserrecord
							INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
							WHERE tb_sponserrecord.MemberID != 3 
							AND tb_proposaloption.ProposalID IN (
								-- MemberID贊助過的提案
								SELECT DISTINCT tb_proposaloption.ProposalID 
								FROM tb_sponserrecord
								INNER JOIN tb_proposaloption ON tb_sponserrecord.ProposalOptionID = tb_proposaloption.ProposalOptionID
								WHERE tb_sponserrecord.MemberID = 3))))temp
		ORDER BY ViewedClicks DESC
		LIMIT 5;
	-- 沒有符合條件的proposal，則輸出推薦點閱率 (viewed_num) 最多的前五項提案
	ELSE 
		SELECT ProposalID as proposal_id,
			ProposalTitle as propoal_title,
			Status as status,
			ViewedClicks as viewed_num
		FROM tb_proposal
        WHERE Status = 2
		ORDER BY ViewedClicks DESC
		LIMIT 5;
	END IF;
	
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUnrepliedComments`(
	IN inMemberID int,
    OUT outRowFound	int
)
BEGIN
	SELECT tb_proposalmember.MemberID as member_id,
			tb_proposal.ProposalID as proposal_id, 
            tb_proposal.ProposalTitle as proposal_title,
            tb_comment.CommentID as comment_id,
            tb_comment.MemberComment as member_comment,
            tb_comment.CommentCreateTime as comment_time,
            tb_comment.ProposerResponse as proposer_response
    FROM tb_proposalmember 
		INNER JOIN tb_proposal ON tb_proposalmember.ProposalID = tb_proposal.ProposalID
		INNER JOIN tb_comment ON tb_proposal.ProposalID = tb_comment.ProposalID
    WHERE tb_proposalmember.MemberID = inMemberID
    AND tb_comment.ProposerResponse = ''
    AND tb_comment.IsDeleted = 0;  -- 該贊助紀錄尚未被使用者刪除
    
    -- 輸出總共找到的列數
    SELECT found_rows() INTO outRowFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(
	IN inEmail varchar(64), 
    IN inHashedpwd varchar(200),
    OUT status_code int
)
BEGIN
	-- 宣告變數
	DECLARE dbHashedPwd varchar(200);
    
	-- 先確認帳號是否存在
	IF EXISTS (
		SELECT Email
		FROM tb_member
		INNER JOIN tb_membercredential ON tb_member.MemberID = tb_membercredential.MemberID
		WHERE tb_member.Email = inEmail
	)THEN
		-- 若帳號有存在，將資料庫對應此帳號的密碼存進變數
		SELECT HashedPassword INTO dbHashedPwd
		FROM tb_member
		INNER JOIN tb_membercredential ON tb_member.MemberID = tb_membercredential.MemberID
		WHERE tb_member.Email = inEmail;
    
		-- 接著確認使用者輸入之密碼是否正確
        -- 登入成功
		IF dbHashedPwd = inHashedpwd THEN 
			SELECT 1 INTO status_code;
		-- 登入失敗(密碼有誤)
		ELSE
			SELECT 2 INTO status_code;
		END IF;
	ELSE
		-- 登入失敗(查無帳號)
		SELECT 3 INTO status_code;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterMember`(
	IN inEmail varchar(64), 
    IN inHashedPwd varchar(200), 
    IN inSalt char(64), 
    IN inName varchar(64), 
    IN inAddress varchar(255), 
    IN inPhone varchar(64),
    OUT outAffectedRowNum int,
    OUT outMessage TEXT
)
BEGIN
	-- 資料出錯時可以rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	ROLLBACK;
	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated' INTO outMessage;
    SELECT 0 INTO outAffectedRowNum;
	END;

	-- 確定沒有已存在的member account (email)
    IF NOT EXISTS( 
        SELECT Email
        FROM tb_member
		WHERE Email = inEmail
	) THEN 
		-- 開始創建
		START TRANSACTION;
			-- 創建member
			INSERT INTO tb_member (Name, Phone, Email, Salt, Address)
				VALUES(inName, inPhone, inEmail, inSalt, inAddress);
			-- 輸出前語法影響列數
            SELECT row_count() INTO outAffectedRowNum;
            -- 將創建的memberID存入變數
			SELECT LAST_INSERT_ID() INTO @var_tempmemberID;
            -- 創建membercredential資料
			INSERT INTO tb_membercredential (MemberID, HashedPassword)
				VALUES(@var_tempmemberID, inHashedPwd);
			-- 輸出前語法影響列數
            SELECT outAffectedRowNum + row_count() INTO outAffectedRowNum;
		-- 創建完成
        COMMIT WORK;
        -- 更改成功訊息
		SELECT 'Create member success' INTO outMessage;
		-- 最終table輸出
		SELECT tb_member.MemberID as member_id,
				tb_member.Name as name,
				tb_member.Email as email,
				tb_membercredential.HashedPassword as password,
				tb_member.Salt as salt,
				tb_member.Phone as phone,
				tb_member.Address as address
		FROM tb_member
		INNER JOIN tb_membercredential ON tb_member.MemberID = tb_membercredential.MemberID
		WHERE tb_member.MemberID = @var_tempmemberID;
	ELSE 
		SELECT 'The account already exist' INTO outMessage;
        SELECT 0 INTO outAffectedRowNum;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProposalStatus`(
	IN inProposalID int, 
    IN inStatus int,
    OUT outAffectedRowNum int
)
BEGIN
	-- 宣告變數
    DECLARE CurrentStatus int;

    -- 將proposal現在的status放入變數CurrentStatus
    SELECT Status 
    INTO CurrentStatus
    FROM tb_proposal
    WHERE ProposalID = inProposalID;

    -- Status只能按順序更新
    -- 更新只有由1變2，或者是2變3，共兩種可能
    -- 若更新為status 2 則需加入ongoingdate與duedate
    IF inStatus = 2 AND CurrentStatus = 1 THEN
        UPDATE tb_proposal
        SET Status = inStatus, 
			OnGoingTime = CURRENT_TIMESTAMP(), 
			DueTime = DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
        WHERE ProposalID = inProposalID;
        
		-- 輸出影響列數
        SELECT row_count() INTO outAffectedRowNum;
        
        -- 印出結果
        SELECT ProposalID as proposal_id, 
				Status as status
        FROM tb_proposal
        WHERE ProposalID = inProposalID;
        
	ELSEIF inStatus = 3 AND CurrentStatus = 2 THEN
        UPDATE tb_proposal
        SET Status = inStatus 
        WHERE ProposalID = inProposalID;
        
		-- 輸出影響列數
        SELECT row_count() INTO outAffectedRowNum;
        
        -- 印出結果
        SELECT ProposalID as proposal_id, 
				Status as status
        FROM tb_proposal
        WHERE ProposalID = inProposalID;
    
    ELSE -- 以上可能性都不是
		SELECT 0 INTO outAffectedRowNum;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdatePwd`(
	IN inMemberID int,
    IN inHashedPwd varchar(200), 
    IN inSalt char(64), 
    OUT outAffectedRowNum int,
    OUT outMessage TEXT
)
BEGIN
	-- 資料出錯時可以rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	ROLLBACK;
	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated' INTO outMessage;
    SELECT 0 INTO outAffectedRowNum;
	END;
    
    -- 確認member_id存在
	IF EXISTS( 
        SELECT MemberID
        FROM tb_member
		WHERE MemberID = inMemberID
	) THEN
		-- 確認新輸入的salt和hashedpwd是否與原本的不同
        IF NOT EXISTS (
		    SELECT tb_member.MemberID
            FROM tb_member
            INNER JOIN tb_membercredential
		    ON tb_member.MemberID = tb_membercredential.MemberID
		    WHERE tb_member.Salt = inSalt OR tb_membercredential.HashedPassword = inHashedPwd
		) THEN
			-- 開始更新
            START TRANSACTION;
				UPDATE tb_member, tb_membercredential
				SET tb_member.Salt = inSalt,
					tb_membercredential.HashedPassword = inHashedPwd
				WHERE
					tb_member.MemberID = tb_membercredential.MemberID
					AND tb_member.MemberID = inMemberID;
				-- 輸出前語法影響列數
				SELECT row_count() INTO outAffectedRowNum;
			-- 更新完成
			COMMIT WORK;
			-- 更改成功訊息
			SELECT 'Update Password success' INTO outMessage;
			-- 最終table輸出
			SELECT tb_member.MemberID as member_id,
					tb_member.Name as name,
					tb_member.Email as email,
					tb_membercredential.HashedPassword as password,
					tb_member.Salt as salt,
					tb_member.Phone as phone,
					tb_member.Address as address
			FROM tb_member
			INNER JOIN tb_membercredential ON tb_member.MemberID = tb_membercredential.MemberID
			WHERE tb_member.MemberID = inMemberID;
		ELSE
			SELECT 'Password or salt no changes detected' INTO outMessage;
            SELECT 0 INTO outAffectedRowNum;
		END IF;
	ELSE
		SELECT 'The member does not exist' INTO outMessage;
        SELECT 0 INTO outAffectedRowNum;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 16:00:24
