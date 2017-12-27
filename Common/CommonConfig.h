//
//  CommonConfig.h
//  Couppie
//
//  Created by alexkung on 12/10/26.
//  Copyright (c) 2012年 com.sourcenetwork. All rights reserved.
//


#import "HUDManager.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "URLConfig.h"
//#import "DateWithChange_manager.h"

//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是IOS7 系统对应的视图起点
#define IOS7_TOP_Y ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 :0)

#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) // 判断是否是IOS6的系统

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) // 判断是否是IOS7的系统

#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.2) // 判断是否是IOS8的系统

//动态获取设备高度
//#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IPHONE_HEIGHT self.view.frame.size.height
//动态获取设备宽度
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width

#define IPHONE_B_HEIGHT [UIScreen mainScreen].bounds.size.height

//Frame高度
#define IPHONE_F_Height self.view.frame.size.height
//Frame宽度
#define IPHONE_F_WIDTH self.view.frame.size.width

#define Scale_Num IPHONE_WIDTH/375.0
#define ScaleY_Num IPHONE_HEIGHT/667.0

//设置颜色
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//设置颜色与透明度
#define HEXCOLORAL(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//#define PATH_OF_CACHE       [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define PATH_OF_CACHE   [PATH_OF_APP_HOME stringByAppendingPathComponent:@"Library/Caches"]

#define BGCOLOR [UIColor colorWithHexString:@"#F4F4F4"]
#define NoColor [UIColor clearColor]
#define WhiteColor [UIColor whiteColor]
#define OrangeColor [UIColor orangeColor]
#define BlackColor [UIColor blackColor]
#define CyankColor [UIColor cyanColor]
//#define screen_Iphone4S [UIScreen mainScreen].bounds.size.height<=480? YES:NO
//#define IS320Width [UIScreen mainScreen].bounds.size.width<=320? YES:NO


//颜色
#define ThemeColor [UIColor colorWithHexString:@"#E56032"]//主题色
#define DGraphColor [UIColor colorWithHexString:@"#E5E5E5"]//缺省图片背景
#define MainGroupBackColor [UIColor colorWithHexString:@"#F3F5F7"]//主背景色
#define NavGationyColor [UIColor colorWithHexString:@"#212936"]//导航栏背景色
#define PureWhiteColor [UIColor colorWithHexString:@"#FFFFFF"]//纯白色
#define LvseColor      [UIColor colorWithHexString:@"#2ECC71"]//绿色
#define LanseColor     [UIColor colorWithHexString:@"#1DA9FF"]//蓝色
#define collectTBColor     [UIColor colorWithHexString:@"#BDC3C7"]//我的收藏的收藏时间的底色，灰底（冷蓝）


//文字颜色
#define WenZiHeightColor [UIColor colorWithHexString:@"#E56032"]//高亮
#define WenZiBlackColor [UIColor colorWithHexString:@"#000000"]//较强1
#define WenZiBackColor_2 [UIColor colorWithHexString:@"#202020"]//较强2
#define WenZiBackColor_3 [UIColor colorWithHexString:@"#303030"]//较强3
#define WenZiZhongColor [UIColor colorWithHexString:@"#606060"]//中度1
#define WenZiZhongColor_2 [UIColor colorWithHexString:@"#909090"]//中度2
#define WenZiRouColor [UIColor colorWithHexString:@"#B0B0B0"]//较弱1
#define WenZiRouColor_2 [UIColor colorWithHexString:@"#D0D0D0"]//较弱2

//线条/边框颜色
#define LineKColor [UIColor colorWithHexString:@"#D7D7D7"]//线条边框颜色
#define LineKColor3 [UIColor colorWithHexString:@"#EEEEEE"]//线条边框颜色
#define LineKColor2 [UIColor colorWithHexString:@"#EDEDED"]//线条边框颜色

#define LineHeight 0.5//线条高度

#define recordVBColor [[UIColor colorWithHexString:@"#212936"] colorWithAlphaComponent:0.9]//录音界面的背景色
#define recordTextColor [UIColor colorWithHexString:@"#ababab"]//录音界面的图形字体颜色。。。
#define recordOrangeColor [UIColor colorWithHexString:@"#E56032"]//橙色点

//背景遮罩颜色
#define ZheZhaoBackColor [UIColor colorWithHexString:@"#4D0000"]//30%黑色背景遮罩1
#define ZheZhaoBackColor_1 [UIColor colorWithHexString:@"#7F0000"]//50%黑色背景遮罩1
#define ZheZhaoBackColor_2 [UIColor colorWithHexString:@"#C00000"]//75%黑色背景遮罩1
#define TouKuangColor [UIColor colorWithHexString:@"#F5F7F8"]//顶部框颜色
#define CellChooseColor [UIColor colorWithHexString:@"#EFEFEF"]//cell选中颜色
#define chunselalaColor [UIColor colorWithHexString:@"#7F7F7F"]//cell选中颜色

//导航返回按钮的
#define DHTitleEdgeInsets UIEdgeInsetsMake(1, 6, 0, 0)
#define DHRightTitleEdgeInsets UIEdgeInsetsMake(1, -6, 0, 0)
#define DHImageEdgeInsets UIEdgeInsetsMake(1, -4, 0, 0)

#define imageUIImage(imageName) [UIImage imageNamed:imageName]
#define imagePath(imageName, png) [[NSBundle mainBundle] pathForResource:imageName ofType:png]
#define imageWithFilePath(imageName) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]]


#define LL_AccessToken [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"user_token"]]
#define LL_Client_Key @"j8w5Pb72yB"
#define LL_UserId [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"user_userID"]]


//根目录
#define ROOTPATH NSHomeDirectory()

//获取Documents目录路径
#define DOCUMENTSPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//获取Library目录路径
#define LIBRARYPATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//获取Cache目录路径
#define CACHEPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//获取Tmp目录路径
#define TMPPATH NSTemporaryDirectory()

//系统设置Plist
#define AcTyListKey   @"activityTypeList" //活动标签对应的key
#define GrouPListKey   @"groupTagList" //群标签对应的key
#define GroupTypeKey   @"groupTypeList" //群类型标签对应的key
#define RegionLisKey   @"regionList"  //地区标签对应的key

//数据库命名
#define FMDB_NAME @"LaiLe.sqlite"

//表格对应的数据定义
//表名的定义
#define CONVERSATION_Table @"conversation_table"
#define GROUP_Table        @"group_table"
#define MESSAGE_Table      @"message_table"
#define PROPERTY_Table     @"property_table"
#define REGION_Table       @"region_table"
#define REMARK_Table       @"remark_table"
#define USER_Table         @"user_table"
#define BLACKLISTLDS_Table @"blacklistlds_table"
#define MGroup_Table       @"mgroup_table"

//创建表格的属性配置
#define CONVERSATION_Create @"CREATE TABLE conversation_table (id INTEGER PRIMARY KEY AUTOINCREMENT,cID text, createTime text, userId text, needSendNick text, needSendHead text, tId text, cType text, isTop text, topTime text, updateTime text, isNoTip text, tipMsg text, noReadCount text, status text,conversationId text,chatBg text)"
#define CONVERSATION_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"userId", @"needSendNick", @"needSendHead", @"tId", @"cType", @"isTop", @"topTime", @"updateTime", @"isNoTip", @"tipMsg", @"noReadCount", @"status", @"conversationId", @"chatBg", nil]


#define GROUP_Create        @"CREATE TABLE group_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, groupId text, groupType text, name text, squareSPic text, sPic text, updateTime text, intro text, pic text, groupNum text, startTime text, endTime text, typeId text, typeName text, areaId text, address text, lon text, lat text,permission text)"
#define GROUP_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"groupId", @"groupType", @"name", @"squareSPic", @"sPic", @"updateTime", @"intro", @"pic", @"groupNum", @"startTime", @"endTime", @"typeId", @"typeName", @"areaId", @"address", @"lon", @"lat", @"permission", nil]

#define MGROUP_Create        @"CREATE TABLE mgroup_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, groupId text, groupType text, userId text, newPublishCount text, newNoticeCount text, newApplyCount text, totalCount text, isTop text, updateTime text,topTime text)"
#define MGROUP_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"groupId", @"groupType", @"userId", @"newPublishCount", @"newNoticeCount", @"newApplyCount", @"totalCount", @"isTop", @"updateTime", @"topTime", nil]

#define MESSAGE_Create        @"CREATE TABLE message_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, userId text, tId text, fId text, mType text, sType text, msg text, fHead text, fNick text, mId text, status text, conversationId text, isRead text,isReadOne text,sTime text)"
#define MESSAGE_ARR    [NSArray arrayWithObjects:@"id",@"cID", @"createTime", @"userId", @"tId", @"fId", @"mType", @"sType", @"msg", @"fHead", @"fNick", @"mId", @"status", @"conversationId", @"isRead", @"isReadOne", @"sTime", nil]


#define PROPERTY_Create        @"CREATE TABLE property_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text, createTime text, name text, propValue text)"
#define PROPERTY_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"name", @"propValue", nil]


#define REGION_Create        @"CREATE TABLE region_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, rId text, pId text, name text, rType text, path text, cCode text, lCode text, vCode text)"
#define REGION_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"rId", @"pId", @"name", @"rType", @"path", @"cCode", nil]


#define REMARK_Create        @"CREATE TABLE remark_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, userId text, toUserId text, remark text, updateTime text)"
#define REMARK_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"userId", @"toUserId", @"remark", @"updateTime", nil]

//
#define USER_Create        @"CREATE TABLE user_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, userId text, nickname text, head text, updateTime text,name text, username text, phone text, personalizedSignature text, countryCode text, userType text, email text, headBig text,liveAreaId text,sex text,birthday text)"
#define USER_ARR    [NSArray arrayWithObjects:@"cID", @"createTime", @"userId", @"nickname", @"head", @"updateTime",@"name", @"username",@"phone", @"personalizedSignature", @"countryCode", @"userType", @"email", @"headBig", @"liveAreaId",@"sex", @"birthday", nil]

#define BLACKLISTLDS_Create   @"CREATE TABLE blacklistlds_table (id INTEGER PRIMARY KEY AUTOINCREMENT, cID text,createTime text, userId text, blackUserId text)"
#define BLACKLISTLDS_ARR     [NSArray arrayWithObjects:@"cID", @"createTime", @"userId", @"blackUserId", nil]


//为试图添加任意角
/*UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(120, 10, 80, 80)];
 view2.backgroundColor = [UIColor redColor];[self.view addSubview:view2];
 
 UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
 
 CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
 maskLayer.frame = view2.bounds;
 maskLayer.path = maskPath.CGPath;
 
 view2.layer.mask = maskLayer;*/














