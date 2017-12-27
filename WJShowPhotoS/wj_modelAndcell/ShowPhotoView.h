//
//  ShowPhotoView.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/30.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowPhotoViewDelegate <NSObject>


-(void)HiddennavtopAndtoolbottom;

@end


@interface ShowPhotoView : UIView

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, weak) id<ShowPhotoViewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame withPhotoUrl:(NSString *)photoUrl;

-(id)initWithFrame:(CGRect)frame withPhotoImage:(UIImage *)image;

- (void)setImageWithIma:(UIImage *)image;

- (void)setImageWithURL:(NSString *)photoUrl;

- (void)reductionTheScale;

@end
