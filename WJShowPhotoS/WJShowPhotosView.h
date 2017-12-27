//
//  WJShowPhotosView.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/30.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewImage.h"

@interface WJShowPhotosView : UIView<UIScrollViewDelegate,PhotoViewImageDelegate>{
    UIScrollView *mainscrollView;
    PhotoViewImage *ImgCenterVC;
    PhotoViewImage *ImgLeftVC;
    PhotoViewImage *ImgRightVC;
}

@property (nonatomic, strong)NSMutableArray *ImageArrs;

@property (nonatomic, assign)NSInteger selectCurrent;

@property (nonatomic, assign)NSInteger ImageType;//1.网络 2.本地 3.混合

- (void)addcontentToView;

- (void)showOnViewFromRootView;


@end
