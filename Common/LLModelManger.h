//
//  LLModelManger.h
//  LLZB
//
//  Created by Do on 15/2/3.
//  Copyright (c) 2015年 Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

void bd_g_decrypt(double bd_lat, double bd_lon, double *gg_lat, double *gg_lon);
void bd_g_encrypt(double gg_lat, double gg_lon, double *bd_lat, double *bd_lon);

@interface LLModelManger : NSObject{
    NSMutableDictionary *PlistContentDic;
    NSMutableDictionary *beizhuNameDic;
}
+ (LLModelManger *)shareInstance;
//计算字数
+ (NSInteger)numberOfStringInUpper:(UILabel *)label stringToSeperate:(NSString *)str;
//计算文本高
- (CGSize )getContentStr:(NSString *)text widthSize:(CGFloat)width heightSize:(CGFloat)height FontOfSize:(UIFont *)fontSize;
//数组排序
- (NSArray *)getSortingArray:(NSArray *)array;
//截取全屏
- (UIImage *)imageFromView:(UIView*)theView;

- (UIImage *)imageWithColorwiwi:(UIColor *)color;

//时间戳
- (NSString *)sendTimeChou;

//当前时间
- (NSString *)getCurrentTime;
//accessToken错误
- (void)AccessTokenLogOut;

- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize spache:(int)num;

//针对本项目指定的计算的高度方法
- (CGFloat)celllabell:(NSString *)contenstr and:(NSString *)ishow  with:(CGFloat)width siallshow:(NSInteger)nuiall;

- (CGFloat)celllpicl:(NSArray *)contenArr with:(CGFloat)width;

- (CGFloat)cellvote:(NSArray *)contenctArr andnumber:(NSArray *)numberArr with:(NSString *)ishow with:(CGFloat)width hhehe:(NSDictionary *)voteDic;

- (CGFloat)cellVideo:(NSDictionary *)contenctDic with:(CGFloat)width;

- (CGFloat)cellRecord:(NSDictionary *)contenctDic with:(CGFloat)width;

- (CGFloat)cellAddress:(NSDictionary *)contencDic with:(NSString *)ishow with:(CGFloat)width;

- (CGFloat)cellScheduledata:(NSDictionary *)contencDic with:(NSString *)ishow with:(CGFloat)width;

//对plist文件的储存，获取处理，更新
- (void)SaveTheContentToPlist:(NSDictionary *)Dic;

- (NSMutableArray *)getThePlistContent:(NSString *)Keys;

- (void)getTheAllContentFromPlist;
-(void)initPlayerchushushua;

//执行两个动画
- (void)anmintiondnd:(UIImageView *)imagview;

//草稿plist
- (void)saveThecaoGaoDicForPlist:(NSDictionary *)SaveDic;

//获取草稿里面的数据
- (NSDictionary *)getCaoGaoDataPlist;

- (void)getTheBeizhuminglala;//获取备注名
- (NSString *)tongguokeyGetName:(NSString *)keyName;
- (void)qingkongBeizhuming;

- (CGFloat)jisuantheGaodulala:(NSDictionary *)alldic with:(NSString *)ishows withdgth:(CGFloat)width_XX andhdtht:(NSInteger)fromView;

- (CGFloat)jisuanzdhejutidegaodulala:(NSDictionary *)contenDic withtheh:(NSString *)isType withTheWith:(CGFloat)withDth;

@end
