//
//  LLModelManger.m
//  LLZB
//
//  Created by Do on 15/2/3.
//  Copyright (c) 2015年 Liu. All rights reserved.
//

#import "LLModelManger.h"
#import "CommonConfig.h"
#import <AVFoundation/AVFoundation.h>


@implementation LLModelManger

const double x_pi2 = 3.14159265358979324 * 3000.0 / 180.0;

- (void)dealloc{
    PlistContentDic = nil;
    beizhuNameDic = nil;
}

-(id) init{
    if (self = [super init]){
        PlistContentDic = [[NSMutableDictionary alloc] init];
        beizhuNameDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}
+ (LLModelManger* )shareInstance{
    static LLModelManger *_LLModel= nil;
    if (_LLModel == nil){
        _LLModel = [[LLModelManger alloc] init];
    }
    return _LLModel;
}
#pragma mark - 计算label可以显示多少个字数
+ (NSInteger)numberOfStringInUpper:(UILabel *)label stringToSeperate:(NSString *)str{
    CGRect container = label.frame;
    CGSize detailSize;
    for (int i = 0; i < [str length]; i ++) {
        NSString *textStr = [str substringToIndex:i+1];
        NSDictionary *attribute = @{NSFontAttributeName: label.font};
        detailSize = [textStr boundingRectWithSize:CGSizeMake(container.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
        
        if (detailSize.height > container.size.height) {
            return i;
        }
    }
    container.size.height = detailSize.height;
    [label setFrame:container]; //调整高度
    return [str length];
}
#pragma mark - 计算文本宽高 -
- (CGSize)getContentStr:(NSString *)text widthSize:(CGFloat)width heightSize:(CGFloat)height FontOfSize:(UIFont *)fontSize
{
    CGSize requiredSize;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:fontSize}
                                     context:nil];
    requiredSize = rect.size;
    return requiredSize;
}
#pragma mark - 截取全屏
- (UIImage *)imageFromView:(UIView*)theView
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (UIImage *)imageWithColorwiwi:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

#pragma mark - 数组排序
- (NSArray *)getSortingArray:(NSArray *)array{
    // 返回一个排好序的数组，原来数组的元素顺序不会改变
    // 指定元素的比较方法：compare:
    NSArray *array2 = [array sortedArrayUsingSelector:@selector(compare:)];
    return array2;
}

#pragma mark - 获取当前时间
- (NSString *)getCurrentTime{
    //现在时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentTime = [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate date]]];
    formatter = nil;
    return currentTime;
}
#pragma mark - AccessToken错误
- (void)AccessTokenLogOut{
    NSUserDefaults *_userDefa = [NSUserDefaults standardUserDefaults];
//    [_userDefa setObject:@"" forKey:@"user_diction"];//字典
    [_userDefa setBool:NO forKey:@"isLogin"];//登录
    [_userDefa setObject:@"" forKey:@"access_token"];//accesstoken值
    [_userDefa setObject:@"" forKey:@"user_id"];//用户手机号即用户ID
    [_userDefa setObject:nil forKey:@"userInfoDic"];//用户个人信息，头像，地址，性别，昵称，
    [_userDefa setObject:@"" forKey:@"headportrait"];//头像
    [_userDefa synchronize];
    
}


- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize spache:(int)num
{
    
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    [paragraphStyle setLineSpacing:num];
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    paragraphStyle = nil;
    
    
    return labelSize;
}


- (CGFloat)celllabell:(NSString *)contenstr and:(NSString *)ishow with:(CGFloat)width siallshow:(NSInteger)nuiall{
    CGFloat allHeight = 0;
    
    CGSize lanbsizedf = [self labelAutoCalculateRectWith:contenstr FontSize:15 MaxSize:CGSizeMake(width, 10000) spache:2];
    
    if (nuiall == 3) {
        allHeight = allHeight+lanbsizedf.height;
    }
    else
    {
        if (lanbsizedf.height > 100 && [ishow intValue] == 0) {
            
            allHeight = allHeight + 95;
        }
        else
        {
            allHeight = allHeight + lanbsizedf.height;
        }
        
        
        if(lanbsizedf.height > 100){
            allHeight = allHeight +35;
        }
    }
    
    return allHeight;
}

- (CGFloat)celllpicl:(NSArray *)contenArr with:(CGFloat)width{
   CGFloat  allHeight = 0;
    
    if (contenArr.count == 1) {
        
        NSString *widjfg = [NSString stringWithFormat:@"%@",[[contenArr objectAtIndex:0] objectForKey:@"tw"]];
        NSString *hidjfg = [NSString stringWithFormat:@"%@",[[contenArr objectAtIndex:0] objectForKey:@"th"]];
        
        CGFloat shijiaW = [widjfg floatValue];
        CGFloat shijiaH = [hidjfg floatValue];
        
        CGFloat shianheighg=0;
        CGFloat shiahahddgao = 0;
        
        if (shijiaW >width) {
            
            shianheighg = width;
            shiahahddgao = shijiaH*(width/shijiaW);
            
        }
        
        if (shijiaW <= width) {
            shianheighg = shijiaW;
            shiahahddgao  = shijiaH;
        }
        
        widjfg = nil;
        hidjfg = nil;
        
        allHeight = allHeight + shiahahddgao;
        
    }
    else
    {
//        allHeight = allHeight + (contenArr.count > 3?2:1)*(80+15);
        
        allHeight = allHeight + (contenArr.count >6?3:(contenArr.count > 3?2:1))*(80+15);
    }
    
    return allHeight;
    
}

- (CGFloat)cellvote:(NSArray *)contenctArr andnumber:(NSArray *)numberArr with:(NSString *)ishow with:(CGFloat)width hhehe:(NSDictionary *)voteDic{
    
    CGFloat  allHeight = 0;
    
    
    CGFloat chushdhd = 22+24+7;
    
    CGSize linshbiaoti = [[LLModelManger shareInstance] labelAutoCalculateRectWith:[NSString stringWithFormat:@"Q：%@",[voteDic objectForKey:@"topic"]] FontSize:16 MaxSize:CGSizeMake(width-32, 10000) spache:0];
    
   
    if (linshbiaoti.height > 22) {
       
        chushdhd = linshbiaoti.height+24+7;
    }
   
    
    
    NSString *dhhdhdh = [NSString stringWithFormat:@"%@",[voteDic objectForKey:@"desc"]];
    
    if ([dhhdhdh length] >0 && ![dhhdhdh isEqualToString:@"(null)"]) {
        CGSize  lahnheight = [[LLModelManger shareInstance] labelAutoCalculateRectWith:dhhdhdh FontSize:14 MaxSize:CGSizeMake(width-32, 10000) spache:0];
        if (lahnheight.height > 20) {
            
            chushdhd = chushdhd +lahnheight.height+20;
        }
        else
        {
            chushdhd = chushdhd +20+20;
        }
    }
    else
    {
        chushdhd = chushdhd + 20;
    }
    
    allHeight = allHeight + chushdhd+50*(contenctArr.count)+3;
    
    return allHeight;
}

- (CGFloat)cellVideo:(NSDictionary *)contenctDic with:(CGFloat)width{
    
    CGFloat  allHeight = 0;
    
     allHeight = allHeight +width-16;
    
    return allHeight;
}

- (CGFloat)cellRecord:(NSDictionary *)contenctDic with:(CGFloat)width{
    
    CGFloat  allHeight = 0;
    
     allHeight = allHeight +122;
    
    return allHeight;
}

- (CGFloat)cellAddress:(NSDictionary *)contencDic with:(NSString *)ishow with:(CGFloat)width{
    
    CGFloat  allHeight = 0;
    
    allHeight = allHeight +219;
    
    return allHeight;
}

- (CGFloat)cellScheduledata:(NSDictionary *)contencDic with:(NSString *)ishow with:(CGFloat)width{
    
    CGFloat  allHeight = 0;
    
    allHeight = allHeight + 17+16;
    
    CGSize lahdbfg = [self labelAutoCalculateRectWith:[contencDic objectForKey:@"address"] FontSize:15 MaxSize:CGSizeMake(width-33-8,10000) spache:0];
    
    allHeight = allHeight + (lahdbfg.height >17?lahdbfg.height:17)+12;
    
    allHeight = allHeight + 17+16;
    
    if ([ishow isEqualToString:@"1"]) {
        
        allHeight = allHeight + 19+16;
    }
    
    CGSize lahdbfg3 = [self labelAutoCalculateRectWith:[contencDic objectForKey:@"intro"] FontSize:15 MaxSize:CGSizeMake(width-33-8,10000) spache:0];
   
    
    allHeight = allHeight +lahdbfg3.height + 8;
    
    return allHeight;
}

//时间戳
- (NSString *)sendTimeChou{
    NSDate *deta = [NSDate date];
    
    NSString *sendtimeme =  [NSString stringWithFormat:@"%lld", (long long)[deta timeIntervalSince1970]*1000];
    
    return sendtimeme;
}

#pragma mark-------系统属性列表的管理
- (void)SaveTheContentToPlist:(NSDictionary *)Dic{
    
    [PlistContentDic removeAllObjects];
    
    NSString *filename=[DOCUMENTSPATH stringByAppendingPathComponent:@"SyS.plist"];
    BOOL isdir = NO;
    
    NSFileManager* fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:filename isDirectory:&isdir]) {
         [fm createFileAtPath:filename contents:nil attributes:nil];
        
        [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:filename]];
    }
    
    NSDictionary *dicmgh = [NSDictionary dictionaryWithContentsOfFile:filename];
    [PlistContentDic addEntriesFromDictionary:dicmgh];
    dicmgh = nil;
    
    NSArray *KeyArr = [NSArray arrayWithArray:[Dic allKeys]];
    
    for (NSString *keystr in KeyArr) {
        [PlistContentDic setObject:[Dic objectForKey:keystr] forKey:keystr];
    }
    
    NSDictionary *savedic = [[NSDictionary alloc] initWithDictionary:PlistContentDic];
    
    if (![savedic writeToFile:filename atomically:YES]) {
        NSLog(@"***********失败");
    }
    savedic = nil;
    KeyArr = nil;
    filename = nil;
    
    //NSLog(@"+===============%@",PlistContentDic);
}

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        //NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

- (NSMutableArray *)getThePlistContent:(NSString *)Keys{
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
    
    if(PlistContentDic.count == 0){
        [self getTheAllContentFromPlist];
    }
    
    [dataArr addObjectsFromArray:[NSArray arrayWithArray:[PlistContentDic objectForKey:Keys]]];
    
    return dataArr;
    
}

- (void)getTheAllContentFromPlist{
    [PlistContentDic removeAllObjects];
    
    NSString *filename=[DOCUMENTSPATH stringByAppendingPathComponent:@"SyS.plist"];
    NSDictionary *dicmgh = [NSDictionary dictionaryWithContentsOfFile:filename];
    [PlistContentDic addEntriesFromDictionary:dicmgh];
    dicmgh = nil;
    
     // NSLog(@"+=====读出来==%@",PlistContentDic);
}

//草稿plist
- (void)saveThecaoGaoDicForPlist:(NSDictionary *)SaveDic{
    NSString *filename=[DOCUMENTSPATH stringByAppendingPathComponent:@"CaoGao.plist"];
    BOOL isdir = NO;
    
    NSFileManager* fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:filename isDirectory:&isdir]) {
        [fm createFileAtPath:filename contents:nil attributes:nil];
        
        [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:filename]];
    }
    
    if (![SaveDic writeToFile:filename atomically:YES]) {
        NSLog(@"***********失败");
    }
    
    filename = nil;
}

//获取草稿里面的数据
- (NSDictionary *)getCaoGaoDataPlist{
    NSString *filename=[DOCUMENTSPATH stringByAppendingPathComponent:@"CaoGao.plist"];
    NSDictionary *dicmgh = [NSDictionary dictionaryWithContentsOfFile:filename];
    
    return dicmgh;
}

-(void)initPlayerchushushua{
    //初始化播放器的时候如下设置
    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,
                            sizeof(sessionCategory),
                            &sessionCategory);
    
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                             sizeof (audioRouteOverride),
                             &audioRouteOverride);
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //默认情况下扬声器播放
    
    [audioSession setActive:YES error:nil];
    audioSession = nil;
}

- (void)anmintiondnd:(UIImageView *)imagview{
    
    imagview.transform = CGAffineTransformMakeScale(0.2, 0.2);
    imagview.hidden = NO;
    
    [UIView animateWithDuration:0.8 animations:^{
        imagview.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
        }
        completion:^(BOOL finished){
            imagview.hidden = YES;
    }];
}



//火星转百度坐标
void bd_g_encrypt(double gg_lat, double gg_lon, double *bd_lat, double *bd_lon)
{
    double x = gg_lon, y = gg_lat;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi2);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi2);
    *bd_lon = z * cos(theta) + 0.0065;
    *bd_lat = z * sin(theta) + 0.006;
}
//百度坐标转火星
void bd_g_decrypt(double bd_lat, double bd_lon, double *gg_lat, double *gg_lon)
{
    double x = bd_lon - 0.0065, y = bd_lat - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi2);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi2);
    *gg_lon = z * cos(theta);
    *gg_lat = z * sin(theta);
}


- (CGFloat)jisuantheGaodulala:(NSDictionary *)alldic with:(NSString *)ishows withdgth:(CGFloat)width_XX andhdtht:(NSInteger)fromView{
    NSArray *nuberg = [NSArray arrayWithArray:[alldic objectForKey:@"publishList"]];
   CGFloat allHeight = 0;
    BOOL ishaveSP = NO;
    BOOL ishavePic = NO;
    
    for (int  kj = 0; kj < nuberg.count; kj++) {
        NSDictionary *jutiDic = [NSDictionary dictionaryWithDictionary:[nuberg objectAtIndex:kj]];
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"2"]){
            ishavePic = YES;
            break;
        }
        
        jutiDic = nil;
    }
    
    for (int  k = 0; k < nuberg.count; k++) {
        
        NSDictionary *jutiDic = [NSDictionary dictionaryWithDictionary:[nuberg objectAtIndex:k]];
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"1"]){
            
            CGSize lanbsizedf = [self labelAutoCalculateRectWith:[jutiDic objectForKey:@"content"] FontSize:16 MaxSize:CGSizeMake(width_XX, 10000) spache:3];
            
            if (fromView == 3) {
                allHeight = allHeight + lanbsizedf.height+16;
            }
            else
            {
                if (lanbsizedf.height > 86 && [ishows intValue] == 0) {
                    
                    allHeight = allHeight + 86;
                }
                else
                {
                    allHeight = allHeight + lanbsizedf.height;
                }
            }
            
            
            if (fromView !=3) {
                
                  allHeight = allHeight+16;
                
                if(lanbsizedf.height > 86){
                    
                    if ([ishows intValue] == 0) {
                        allHeight = allHeight +28;
                    }
                    else
                    {
                        allHeight = allHeight +20;
                    }
                }
            }
        }
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"3"]){
            
            allHeight = allHeight+40+20;
        }
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"4"]){
            
            if (!ishavePic) {
                allHeight = allHeight + 200+20;
            }
            
            ishaveSP = YES;
        }
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"2"]){
            
            NSMutableArray *conretentArr = [NSMutableArray arrayWithArray:[jutiDic objectForKey:@"pics"]];
            
            int chushizhi =0;
            
            if (ishaveSP) {
                [conretentArr insertObject:@"1" atIndex:0];
                chushizhi = 1;
            }
            
            if (conretentArr.count == 1) {
                
                NSString *widjfg = [NSString stringWithFormat:@"%@",[[conretentArr objectAtIndex:0] objectForKey:@"tw"]];
                NSString *hidjfg = [NSString stringWithFormat:@"%@",[[conretentArr objectAtIndex:0] objectForKey:@"th"]];
                
                CGFloat shijiaW = [widjfg floatValue];
                CGFloat shijiaH = [hidjfg floatValue];
                
                CGFloat shianheighg=0;
                CGFloat shiahahddgao = 0;
                
                if (shijiaW >240 && shijiaH >160) {
                    
                    shianheighg = 240;
                    shiahahddgao = 160;
                }
                
                if (shijiaW <240 && shijiaH >160) {
                    
                    shianheighg = shijiaW;
                    shiahahddgao = 160;
                }
                
                if (shijiaW <=240 && shijiaH <=160) {
                    
                    shianheighg = shijiaW;
                    shiahahddgao = shijiaH;
                }
                
                if (shijiaW >240 && shijiaH <160) {
                    
                    shianheighg = 240;
                    shiahahddgao = shijiaH;
                }
                
                widjfg = nil;
                hidjfg = nil;
                
                allHeight = allHeight + shiahahddgao +20;
                
            }
            else
            {
                allHeight = allHeight +15+(conretentArr.count >6?3:(conretentArr.count > 3?2:1))*(93+5);
            }
            
            conretentArr= nil;
            
        }
        
        if([[jutiDic objectForKey:@"publishType"] isEqualToString:@"5"]){
            
            CGSize lanbsizedf = [self labelAutoCalculateRectWith:[jutiDic objectForKey:@"address"] FontSize:14 MaxSize:CGSizeMake(width_XX-60, 10000) spache:0];
            
            CGFloat linshikaung;
            CGFloat linshgao;
            
            if (lanbsizedf.height >20) {
                linshikaung = width_XX;
                linshgao = 16+lanbsizedf.height;
            }
            else
            {
                linshikaung = lanbsizedf.width+60;
                linshgao = 36;
            }
            
            allHeight = allHeight+linshgao+20;
        }
        //释放生成的字典
        jutiDic = nil;
    }
    
    return allHeight;
}

- (CGFloat)jisuanzdhejutidegaodulala:(NSDictionary *)contenDic withtheh:(NSString *)isType withTheWith:(CGFloat)withDth{
   CGFloat allHeight = 0;
    
    allHeight = allHeight +24+19+14;
    
    
    allHeight = allHeight + 20+15;
    
    
    CGSize lahdbfg = [[LLModelManger shareInstance] labelAutoCalculateRectWith:[contenDic objectForKey:@"address"] FontSize:14 MaxSize:CGSizeMake(withDth-33-12,10000) spache:0];
    
    allHeight = allHeight + (lahdbfg.height >20?lahdbfg.height:20)+12;
    
    if ([isType isEqualToString:@"1"]) {
        NSDictionary *dicdhhf = [NSDictionary dictionaryWithDictionary:[contenDic objectForKey:@"contact"]];
        if (dicdhhf.allKeys.count != 0) {
            
            allHeight = allHeight + 17+15;
        }
    }
    else
    {
        NSArray *dichag = [NSArray arrayWithArray:[contenDic objectForKey:@"contact"]];
        if (dichag.count >0) {
            
            NSDictionary *dhjff = [NSDictionary dictionaryWithDictionary:[dichag lastObject]];
            if (dhjff.allKeys.count >0) {
            
            allHeight = allHeight + 17+15;
            }
            
            dhjff = nil;
        }
    }

    
    CGSize lahdbfg3 = [[LLModelManger shareInstance] labelAutoCalculateRectWith:[contenDic objectForKey:@"content"] FontSize:14 MaxSize:CGSizeMake(withDth-33-12,10000) spache:5];
    
    allHeight = allHeight +lahdbfg3.height + 15;
    
    return allHeight;
}

@end
