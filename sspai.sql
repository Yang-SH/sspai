/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.22-log : Database - sspai
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sspai` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `sspai`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `admin` */

insert  into `admin`(`id`,`account`,`password`) values (1,'admin','admin');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `content` mediumtext COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `pic_path` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
  `user_id` int(11) NOT NULL COMMENT '创建用户id',
  `comment_num` int(11) DEFAULT NULL COMMENT '评论数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `topic_id` int(11) DEFAULT NULL COMMENT '专题id',
  `article_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stats` int(11) DEFAULT NULL COMMENT '状态',
  `is_chosen` tinyint(1) DEFAULT NULL COMMENT '是否精选',
  PRIMARY KEY (`id`),
  KEY `fk_tiopic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_tiopic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `article` */

insert  into `article`(`id`,`content`,`pic_path`,`user_id`,`comment_num`,`create_time`,`topic_id`,`article_name`,`stats`,`is_chosen`) values (3,'今天凌晨，苹果正式发布了 iPhone X、iPhone 8 / 8 Plus，以及第三代 Apple Watch 和 Apple TV 4K。如果你没有熬夜看发布会，不用担心，少数派不仅整理了发布会的要点，还连夜赶制了发布会要点的信息图，让你用最简单直观的方式迅速了解新 iPhone。\r\n\r\n','/upload/topic_1.jpg',1,4,'2017-09-13 12:48:30',1,'近万元的 iPhone X 买不买？一张图看完苹果发布会新品 | 一图流',1,1),(4,'苹果发布了 iPhone X、iPhone 8 / 8 Plus，以及第三代 Apple Watch 和 Apple TV 4K。如果你没有熬夜看发布会，不用担心，少数派整理了发布会的要点，让你在 3 分钟内迅速了解昨晚苹果发布会的内容。\r\n\r\n另外你还可以阅读我们精心制作的一图流：近万元的 iPhone X 买不买？一张图看完苹果发布会新品 | 一图流\r\n\r\n3 分钟速读版\r\niPhone X\r\n\r\nX 读作「10 / ten」，第一款「全面屏」iPhone，取消了 Home 键；\r\n前后玻璃 + 不锈钢边框的外观，5.8” 屏幕比 Plus 更大，但机身小于 Plus；\r\n首次使用 OLED 屏幕，分辨率达到 2436 × 1125（458ppi）；\r\n使用超视网膜显示屏（Super Retina），支持 HDR 和 True Tone 技术；\r\n搭载 6 核 A11 仿生处理器，续航比 iPhone 7 提升 2 小时；\r\n没有 Touch ID，全新 Face ID（面容识别）让你看一下手机就能解锁；\r\n后置竖排双摄像头，都有光学防抖，人像模式加入专业打光功能——人像光效；\r\n前置摄像头升级为原深感摄像头，也能拍景深照片，还能识别面部表情做动态 Emoji（官方叫动话表情）；\r\n支持无线充电，发布了可同时充 3 个设备的 AirPower 充电枕，但今年买不到；\r\n支持 AR 应用；\r\n只有银色、深空灰两种颜色，64GB、256GB 两档可选，价格分别为 8388 元、9688 元；\r\n10 月 27 日开始预售，11 月 3 日正式发售，了解详情。\r\niPhone 8 和 8 Plus\r\n\r\n采用「玻璃面板 + 铝合金边框」设计；\r\n只有双摄像头的 iPhone 8 Plus 支持人像光效模式；\r\n支持无线充电；\r\n屏幕支持 True Tone 技术，但不支持 HDR；\r\n同样搭载 A11 芯片，续航时间没变化；\r\n深空灰、金色、银色三种颜色可选；\r\n64 GB、256GB 两种版本可选，iPhone 8 5888 元起售，8 Plus 6688 元起售；\r\n9 月 15 日开始预售，22 日正式开售，了解详情。\r\nApple Watch Series 3\r\n\r\n新增蜂窝网络款，使用虚拟 SIM 卡，支持国内运营商；\r\nS3 双核处理器、W2 无线芯片；\r\n普通版外观无变化，蜂窝网络款均采用红色表冠；\r\n新增多款表带；\r\n普通款 2588 元起，蜂窝网络款 3188 元起；\r\n9 月 15 日开始预售，22 日正式发售；\r\n首发地区包括中国，中国联通会率先支持，移动和电信今年稍后推出，了解详情。\r\n以下部分是本次发布会的详细介绍：\r\niPhone X\r\niPhone X 以「One More Thing」的方式压轴登场，这是第一款采用「全面屏」设计的 iPhone，第一款使用 OLED 屏幕的 iPhone，也是第一款取消 Home 键设计的 iPhone。\r\n\r\n\r\n外观\r\n\r\niPhone X 提供银色和深空灰两种颜色，机身外观和 iPhone 7 类似，并采用了 iPhone 4 时代「前后玻璃 + 金属边框」的设计，前后玻璃面板强化层的厚度比以往增加 50%，是至今为止最坚固的玻璃材料。手机同样达到了和 iPhone 7 一致的 IP67 防水防尘等级。\r\n\r\n\r\n不锈钢边框采用被称为特别设计的「手术级不锈钢」，为了保证不锈钢边框与玻璃颜色保持一致，苹果在深空灰机型上还运用了一项被称为「物理气相沉积」的工艺。\r\n\r\n\r\n作为一款「全面屏」手机，除了顶部放置听筒、前置摄像头和各种传感器的「刘海」部分，iPhone X 前面板被一块 5.8” 的 OLED 屏幕占据，虽然屏幕比 5.5” 的 Plus 更大，但体积和重量都介于 iPhone 8 和 iPhone 8 Plus 之间。\r\n\r\n制图：少数派\r\n制图：少数派\r\n取消了 Home 键后，iPhone X 将一部分 Home 键的功能（唤醒 Apple Pay、Siri 等）移到了侧边的电源键上，电源键的名称也相应被改为「侧边按键」，而经典的 Touch ID 功能则彻底被取消，被 Face ID 面部识别技术所取代。\r\n\r\n交互变化\r\n\r\n当你在一个应用内部时，从底部向上轻扫，即可返回主屏幕。\r\n\r\n\r\n当你需要启用多任务时，只需向上轻扫并停顿一下，就能激活多任务界面。\r\n\r\n\r\n打开控制中心的手势则更改为从屏幕右上角向下轻扫。\r\n\r\n\r\n如果你想要激活 Siri，只需长按侧边键。\r\n\r\n\r\nApple Pay 的打开方式更改为连按两下侧边按键。\r\n\r\n\r\nFace ID（面容 ID）\r\n\r\n取消了 Touch ID 的 iPhone X 采用了全新的 Face ID 技术，苹果宣称它的识别准确度很高，并且拥有比 Touch ID 更高的安全性。\r\n\r\n利用藏在前面板「刘海」里的点阵投影器，iPhone X 可以在面部投射 30000 多个肉眼不可见的光点，绘制出独一无二的面谱，所有面谱信息都会保存在本地的安全芯片内，确保不被盗用。\r\n\r\n\r\n利用机器学习技术，即使用户改变发型、戴眼镜帽子或者留胡子，Face ID 都能准确识别，并且可以有效杜绝使用面具或照片冒充机主解锁 iPhone 的可能。搭配可以发射红外光线的泛光感应元件，Face ID 即使在黑暗环境也能准确识别人脸。\r\n\r\n\r\nFace ID 支持注视感知功能，只有传感器检测到你注视 iPhone X 时才会解锁。另外，Face ID 也可用来显示通知和信息，在你阅读内容时保持屏幕常亮，或调低闹钟或铃声的音量。\r\n\r\n\r\n不过，发布会现场 Craig 演示用 Face ID 解锁 iPhone X 时，在一开始出现了两次未能解锁成功的情况，虽然后来他又演示了多次成功解锁，但 Face ID 实际表现还是得等到后续更多的真机体验才能见分晓，少数派会对此保持关注。\r\n\r\n屏幕技术\r\n\r\niPhone X 是苹果第一款采用 OLED 屏幕的手机。它搭载了一块 5.8 英寸的广色域 OLED 屏幕，使用了超视网膜显示屏技术（Super Retina Display），分辨率达到了 2436 × 1125 (458ppi)，以及 1,000,000:1 的对比度。\r\n\r\n\r\n苹果在官网介绍 iPhone X 的屏幕时，除了特地强调这是「首款达到 iPhone 设计标准的 OLED 屏幕」，还提到其采用了「创新的折叠和电路堆叠技术」，为了让这块屏幕更贴合机身曲线。\r\n\r\n「折叠」技术是真的把屏幕折起了一段\r\n「折叠」技术是真的把屏幕折起了一段\r\n同时，iPhone X 屏幕还能够实现 HDR 显示，支持播放「杜比视界」和 HDR10 标准视频。\r\n\r\n\r\n与 iPad Pro 一样，iPhone X 屏幕也使用了原彩显示（True Tone）技术，使屏幕可以根据环境自动调节白平衡。\r\n\r\n但可能让很多人忍不住吐槽的是，iPhone X 顶部的「刘海」在全屏播放视频会始终存在，甚至在发布会上演示的 AR 游戏中，游戏的按钮还会被部分遮挡。少数派认为，后续第三方视频类 App 和游戏可能会对此作专门适配，否则，出现像看视频画面会缺一小块、玩王者荣耀技能键被遮挡的问题，实在会有些奇怪。\r\n\r\niPhone X 的刘海挡住了游戏界面中的部分按钮\r\niPhone X 的刘海挡住了游戏界面中的部分按钮\r\n性能\r\n\r\n续航时间：iPhone X 的续航时间比 iPhone 7 提升了 2 个小时。\r\n\r\n\r\nA11 仿生处理器：新的 A11 仿生六核处理器（两颗高性能核心和四枚高能效核心）。相比 A10X Fusion，能效核心速度最高提升了 70%，性能核心速度最高提升了 25 %。iPhone X 采用了苹果全新设计的三核心图形处理器，与 A10 Fusion 相比，速度提升了 30 %。\r\n\r\n\r\n无线充电：在玻璃背板的帮助下，iPhone X 首次支持了无线充电功能。你可以使用市面上支持 Qi 标准的无线充电器为它充电。\r\n\r\n\r\n此外，苹果还推出了一款能够同时为三部设备无线充电的 AirPower 充电枕，但苹果没有公布这款充电枕的具体发售时间，只表示将于 2018 年内发售。\r\n\r\n\r\n相机\r\n\r\n后置相机：和去年 iPhone 7 Plus 的「左右双摄」不同，今年的 iPhone X 使用了上下双 1200 万摄像头的方案。其中一颗为 f/1.8 的广角镜头，另一颗为 f/2.4 的长焦镜头，两个镜头都配备了光学防抖。iPhone X 采用了支持慢速同步的 4-LED 原彩（True Tone） 闪光灯，支持 2 倍光学变焦和 10 倍数码变焦。\r\n\r\n\r\n去年新加入的人像模式在今年也得到了升级。 iPhone X 相机加入了人像光效（Portrait Lighting） 模式，它可以在使用人像模式时生成各种影棚级的打光效果，为你拍出更漂亮的人像照片。\r\n\r\n\r\n另外，iPhone X 的视频拍摄功能也得到了升级。现在你可以拍摄 4K 60fps 视频，以及 1080p 240fps 的慢动作视频。\r\n\r\n\r\n前置相机：由于 Face ID 的加入，iPhone X 得到了全新设计的新前置相机——原深感摄像头。它由一颗 700 万像素摄像头以及多个精密传感器构成，让你能够在前置相机上使用人像模式和新加入的人像光效。\r\n\r\n\r\nAnimoji：在 A11「仿生引擎」芯片和原深感摄像头的配合下，苹果还为 iPhone X 开发了一个有趣的功能，前置相机能捕捉并分析 50 多种不同的肌肉运动，并将这些面部表情适配到了 12 款不同 Emoji 表情上，让这些 Emoji 表情也能实时演示你的表情神态，你可以利用它录制一段有趣的小视频，并且通过 iMessage 发送给朋友。\r\n\r\n\r\nAR\r\n\r\n自从 WWDC17 上苹果发布 ARKit 开发套件，开发者基于 iOS 设备做的各种 AR 演示层出不穷，少数派此前分享过很多或有趣、或实用的 ARKit 实例（点此去看）。发布会上，苹果再次在新 iPhone 上展示了它的 AR 实力：\r\n\r\n在运动场上放一头霸王龙\r\n在运动场上放一头霸王龙\r\n在运动场上看球位置不好，看不清自己喜欢的队员在哪？用摄像头对准那个位置，你就能看到队员头上的大头像：\r\n\r\nPhil 展示球赛中的 AR\r\nPhil 展示球赛中的 AR\r\n一直以来，都有星座应用让你可以举着 iPad 查看星座的位置，但那不过是类似全景图和陀螺仪的结合，你并没有真的看着星空观察星座。现在这个问题也解决了：\r\n\r\n对着真正的天空，观察真正的星座\r\n对着真正的天空，观察真正的星座\r\n容量和售价\r\n\r\niPhone X 起步容量为 64GB，同时还提供 256GB 版本。10 月 27 日下午 3:01 开始预购 ，11 月 3 日开始发售。前往官网了解详情\r\n\r\n\r\niPhone 8 / 8 Plus\r\n作为「S 代升级版」，这两款 iPhone 并没有按照惯例称为 iPhone 7s/7s Plus，而是直接称作 iPhone 8/8 Plus。\r\n\r\n两款新手机大小和 7/7Plus 相同，续航能力也几乎没有区别，屏幕仅增加了 True Tone 技术，可以根据周围环境自动调节白平衡。\r\n\r\n机身采用了「玻璃面板 + 铝合金边框」的设计，同样支持无线充电功能，机身有 3 种颜色可选，取消了之前的亮黑和磨砂黑，加入了重新设计的深空灰和金色。\r\n\r\n\r\n摄像头部分，iPhone 8 / 8 Plus 由于没有采用原深感摄像头，所以并不支持前置摄像头人像模式，人像光效模式也只有 iPhone 8 Plus 的后置摄像头支持。\r\n\r\n\r\niPhone 8 / 8 Plus 有 64 GB 和 256GB 两种版本可选。将于 9 月 15 日下午 3:01 开始预售，22 日正式开售，前往官网了解详情。\r\n\r\nApple Watch Series 3\r\n今年 Apple Watch 也进行了升级，在宣布新产品之前，Tim Cook 对所有人宣布 Apple Watch 已经超过了 Rolex，成为排名世界第一的手表，不过他没提到具体是销量还是利润。随后他便宣布了新一代的 Apple Watch 命名为 Apple Watch Series 3。\r\n\r\nApple Watch Series 3 的配置升级到了 S3 双核处理器以及 W2 无线芯片，比前一代芯片提升了 50% 的能效。续航为 18 小时，与前代保持一致。\r\n\r\n此外，Apple Watch 首次新增了蜂窝网络款，使用的是虚拟 SIM 卡，屏幕的一部分将作为天线。你现在可以独立使用 Apple Watch 直接打电话或者收听 Apple Music 等操作。\r\n\r\n\r\n在外观上，Apple Watch Series 3 普通款与前代手表没有任何区别，蜂窝网络款则均采用了红色的表冠。\r\n\r\n在发布会的吐槽中，开发者 @Saic 对红色表冠设计进行了调侃（下图），还有不少朋友表示，接下来适用于表冠的红色贴纸可能会畅销。\r\n\r\n\r\nApple Watch Series 3 将在 9 月 15 日开始接受预订，9 月 22 日正式发售，首发地区包括中国。而蜂窝网络款的 Apple Watch，只有中国联通在首发行列，而且仅适用于归属地为上海、广东、河南、湖北、湖南和天津的手机账号。中国移动和中国电信的版本将在今年稍后推出。\r\n\r\n售价方面，国行 Apple Watch Series 3 为 2588 元起售，蜂窝网络款则为 3188 元起售。\r\n\r\n此外，Apple Watch 也新增多款表带，你可以在 苹果官网 进行选购。\r\n\r\n\r\nApple TV 4K\r\nApple TV 也在这次发布会上得到了升级，支持 4K HDR 视频播放。处理器升级为 A10X，以及支持蓝牙 5.0。\r\n\r\n\r\nApple TV 4K 在美国官网售价为 179 美元（32GB）和 199 美元（64GB）。前往官网了解详情\r\n\r\n少数派接下来仍会持续报道新 iPhone 和 iOS 11 的方方面面，请继续关注 少数派带你看新 iPhone 专题 和 iOS 11 具透专题 。也欢迎你通过 少数派 iOS App、官方微博 和微信公众号（sspaime）获取最新内容。','/upload/topic_3.jpg',1,0,'2017-09-13 21:02:04',1,'oppo',1,1),(5,'测试文章内容1','/upload/topic_2.jpg',2,0,'2017-11-12 11:33:07',1,'测试文章1',1,1),(6,'测试文章内容1','/upload/topic_3.jpg',1,0,'2017-11-12 11:33:58',1,'测试文章1',1,1),(7,'213','/upload/topic_1.jpg',1,0,'2017-11-12 11:34:28',2,'请问',0,0),(8,'电风扇发射点发','/upload/topic_2.jpg',2,0,'2017-11-12 11:35:17',2,'梵蒂冈梵蒂冈',1,1),(9,'我是测试内容','/upload/topic_3.jpg',1,0,'2017-09-13 21:02:04',1,'我是测试数据的名称',1,0),(10,'我是测试内容2','/upload/topic_2.jpg',1,0,'2017-11-14 22:46:11',1,'我是测试名称2',1,0),(17,'我是测试内容2','/upload/topic_1.jpg',2,NULL,'2017-11-15 21:25:08',2,'我是测试内容2',1,0);

/*Table structure for table `article_sort` */

DROP TABLE IF EXISTS `article_sort`;

CREATE TABLE `article_sort` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `sort_id` int(11) NOT NULL COMMENT '分类id',
  PRIMARY KEY (`article_id`,`sort_id`),
  KEY `sort_id` (`sort_id`),
  CONSTRAINT `article_sort_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_sort_ibfk_2` FOREIGN KEY (`sort_id`) REFERENCES `sort` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `article_sort` */

insert  into `article_sort`(`article_id`,`sort_id`) values (3,1),(3,2);

/*Table structure for table `attention_topic` */

DROP TABLE IF EXISTS `attention_topic`;

CREATE TABLE `attention_topic` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `attention_topic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `attention_topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `attention_topic` */

insert  into `attention_topic`(`user_id`,`topic_id`) values (1,1);

/*Table structure for table `attention_user` */

DROP TABLE IF EXISTS `attention_user`;

CREATE TABLE `attention_user` (
  `user_id` int(11) NOT NULL,
  `other_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`other_user_id`),
  KEY `other_user_id` (`other_user_id`),
  CONSTRAINT `attention_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `attention_user_ibfk_2` FOREIGN KEY (`other_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `attention_user` */

insert  into `attention_user`(`user_id`,`other_user_id`) values (1,1),(1,2);

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `user_id` int(50) NOT NULL,
  `article_id` int(50) NOT NULL,
  PRIMARY KEY (`user_id`,`article_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `collection` */

insert  into `collection`(`user_id`,`article_id`) values (1,3),(2,17);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `comment` */

insert  into `comment`(`id`,`user_id`,`content`,`create_time`,`article_id`) values (35,1,'我是第一','2017-11-16 15:08:49',17),(36,43,'hfdhjshflajsdf','2017-11-16 15:12:05',17),(37,43,'asdfsdfdsf','2017-11-16 15:14:13',17),(38,1,'123','2017-11-16 15:15:42',17),(39,1,'123','2017-11-16 15:37:35',7),(40,1,'adsf','2017-11-16 15:37:48',17),(41,1,'asfsdfsd','2017-11-16 15:38:59',17),(42,1,'123','2017-11-16 16:29:53',3),(43,1,'weiiefngn','2017-11-16 16:44:22',17);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `use_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `feedback` */

/*Table structure for table `letter` */

DROP TABLE IF EXISTS `letter`;

CREATE TABLE `letter` (
  `id` int(11) NOT NULL,
  `recevice` int(11) DEFAULT NULL,
  `send_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recevice` (`recevice`),
  KEY `send_id` (`send_id`),
  CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`recevice`) REFERENCES `user` (`id`),
  CONSTRAINT `letter_ibfk_2` FOREIGN KEY (`send_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `letter` */

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `like_id` int(11) NOT NULL,
  `like_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `like_num` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `like` */

insert  into `like`(`id`,`like_id`,`like_type`,`like_num`,`user_id`,`create_time`) values (2,4,'article',98,2,'2017-11-12 13:25:49'),(3,3,'article',NULL,22,'2017-11-12 13:39:40'),(4,3,'article',NULL,24,'2017-11-12 13:39:57'),(6,3,'article',NULL,1,'2017-11-16 16:29:27');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `reply` */

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `report_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `report` */

/*Table structure for table `sort` */

DROP TABLE IF EXISTS `sort`;

CREATE TABLE `sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类的id',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '分类的名称',
  `stats` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sort` */

insert  into `sort`(`id`,`name`,`stats`) values (1,'apple',1),(2,'android手机',1),(3,'手机',1),(4,'iPhone8',1),(5,'法国和',1),(6,'测试分类0',1),(7,'测试分类1',1),(8,'测试分类3',1),(9,'测试分类4',1),(10,'测试分类5',1),(11,'测试分类6',1),(12,'测试分类7',1),(13,'测试分类8',1),(14,'测试分类9',1),(15,'测试分类10',1),(16,'测试分类11',1),(17,'测试分类12',1),(18,'测试分类13',1),(19,'测试分类14',1),(20,'测试分类15',1),(21,'测试分类16',1),(22,'测试分类17',1),(23,'测试分类18',1),(24,'测试分类19',1),(25,'测试分类20',1),(26,'测试分类21',1),(27,'效率工具',1),(28,'手机摄影',1),(29,'生活方式',1),(30,'游戏',1),(31,'硬件',1);

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `sort_id` int(11) DEFAULT NULL,
  KEY `sort_id` (`sort_id`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`sort_id`) REFERENCES `sort` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tag` */

insert  into `tag`(`sort_id`) values (27),(28),(29),(30),(31);

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题id',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '专题的名称',
  `article_num` int(11) NOT NULL COMMENT '专题中的文章数',
  `pic_path` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '专题图片地址',
  `is_suggest` tinyint(1) DEFAULT NULL COMMENT '是否推荐',
  `stats` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `topic` */

insert  into `topic`(`id`,`name`,`article_num`,`pic_path`,`is_suggest`,`stats`) values (1,'apple 手机',3,'/upload/topic_3.jpg',1,1),(2,'android',0,'/upload/topic_2.jpg',1,1),(4,'实用工具',0,'/upload/topic_1.jpg',1,1),(5,'测试数据0',0,'/upload/topic_3.jpg',0,0),(6,'测试数据1',1,'/upload/topic_2.jpg',0,0),(7,'测试数据2',2,'/upload/topic_1.jpg',0,1),(8,'测试数据3',3,'/upload/topic_3.jpg',0,1),(9,'测试数据4',4,'/upload/topic_2.jpg',0,1),(10,'测试数据5',5,'/upload/topic_1.jpg',0,1),(11,'测试数据6',6,'/upload/topic_3.jpg',0,1),(12,'测试数据7',7,'/upload/topic_2.jpg',0,1),(13,'测试数据8',8,'/upload/topic_1.jpg',0,1),(14,'测试数据9',9,'/upload/topic_3.jpg',0,1),(15,'测试数据10',10,'/upload/topic_2.jpg',0,1),(16,'测试数据11',11,'/upload/topic_1.jpg',0,1),(17,'测试数据12',12,'/upload/topic_3.jpg',0,1),(18,'测试数据13',13,'/upload/topic_2.jpg',0,1),(19,'测试数据14',14,'/upload/topic_1.jpg',0,1),(20,'测试数据15',15,'/upload/topic_3.jpg',0,1),(21,'测试数据16',16,'/upload/topic_2.jpg',0,1),(22,'测试数据17',17,'/upload/topic_1.jpg',0,1),(23,'测试数据18',18,'/upload/topic_3.jpg',0,1),(24,'测试数据19',19,'/upload/topic_2.jpg',0,1),(25,'测试数据20',20,'/upload/topic_1.jpg',NULL,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ç”¨æˆ·ç¼–å·',
  `nickname` varchar(20) COLLATE utf8_bin NOT NULL COMMENT 'æ˜µç§°',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'é‚®ç®±',
  `password` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'å¯†ç ',
  `introduce` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ä¸ªäººç®€ä»‹',
  `good_at` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ“…é•¿é¢†åŸŸ',
  `total_num` int(11) DEFAULT NULL COMMENT 'æ€»å­—æ•°',
  `head_path` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤´åƒåœ°å€',
  `attention_num` int(10) DEFAULT NULL COMMENT 'å…³æ³¨æ•°',
  `followed_num` int(10) DEFAULT NULL COMMENT 'è¢«å…³æ³¨æ•°',
  `stats` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`nickname`,`email`,`password`,`introduce`,`good_at`,`total_num`,`head_path`,`attention_num`,`followed_num`,`stats`) values (1,'我们不一样2','123@qq.com','1234','写bug','写bug',NULL,'/upload/face-2.jpg',NULL,NULL,1),(2,'删库','2810669295@qq.com','123','删库','删库',NULL,'/upload/face-1.jpg',NULL,NULL,1),(22,'测试用户0','01234@qq','password0',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(23,'测试用户1','11234@qq','password1',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(24,'测试用户2','21234@qq','password2',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(25,'测试用户3','31234@qq','password3',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(26,'测试用户4','41234@qq','password4',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(27,'测试用户5','51234@qq','password5',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(28,'测试用户6','61234@qq','password6',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(29,'测试用户7','71234@qq','password7',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(30,'测试用户8','81234@qq','password8',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(31,'测试用户9','91234@qq','password9',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(32,'测试用户10','101234@qq','password10',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(33,'测试用户11','111234@qq','password11',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(34,'测试用户12','121234@qq','password12',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(35,'测试用户13','131234@qq','password13',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(36,'测试用户14','141234@qq','password14',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(37,'测试用户15','151234@qq','password15',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(38,'测试用户16','161234@qq','password16',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(39,'测试用户17','171234@qq','password17',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(40,'测试用户18','181234@qq','password18',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(41,'测试用户19','191234@qq','password19',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(42,'测试','asdf','123','123','123',123,'/upload/face-1.jpg',NULL,NULL,1),(43,'dd','dd@qq.com','123','123','123',123,'/upload/face-1.jpg',NULL,NULL,1),(44,'doudou','456@qq.com','123','123','123',123,'/upload/face-1.jpg',NULL,NULL,1),(45,'110','110@qq.com','110',NULL,NULL,NULL,'/upload/face-1.jpg',NULL,NULL,1),(47,'120','120@qq.com','123',NULL,NULL,NULL,'/upload/face-2.jpg',NULL,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
