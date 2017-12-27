//
//  PhotoViewImage.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/30.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@protocol PhotoViewImageDelegate <NSObject>

-(void)HiddennavtopAndtoolbottom;

@end

@interface PhotoViewImage : UIView<UIScrollViewDelegate>
{
    UIScrollView *MainscrollView;
    MBProgressHUD *MBHud;
    UIActivityIndicatorView *actifhhff;
}

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, weak) id<PhotoViewImageDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withUrl:(NSString *)ImgUrl;

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)Imgimage;

- (void)setImageWithIma:(UIImage *)image;

- (void)setImageWithURL:(NSString *)photoUrl;

- (void)setImageWithFile:(NSString *)strFile;

- (void)reductionOldSize;

- (void)ishaveremovTheacHUd:(BOOL)booHiden;

@end
