//
//  WJShowPhotosView.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/30.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJShowPhotosView.h"
#import "UIImageView+WebCache.h"

@implementation WJShowPhotosView

- (void)dealloc{
    mainscrollView = nil;
    ImgCenterVC = nil;
    ImgLeftVC = nil;
    ImgRightVC = nil;
    
    _ImageArrs = nil;
    
}

- (void)addcontentToView{
    
    //清除缓存
   // [[SDImageCache sharedImageCache] clearDisk];
    
    [self mainscrollViewUI];
    [self initwithThedefual];
}

- (void)showOnViewFromRootView{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)mainscrollViewUI{
    mainscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    mainscrollView.delegate = self;
    mainscrollView.backgroundColor = [UIColor clearColor];
    mainscrollView.pagingEnabled = YES;
    mainscrollView.showsHorizontalScrollIndicator = NO;
    mainscrollView.showsVerticalScrollIndicator = NO;
    mainscrollView.contentSize = CGSizeMake(self.frame.size.width*(self.ImageArrs.count >=3?3:self.ImageArrs.count), self.frame.size.height);
    [self addSubview:mainscrollView];
    
    //初始化三个imageView
    ImgLeftVC = [[PhotoViewImage alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) withUrl:nil];
    ImgLeftVC.backgroundColor = [UIColor clearColor];
    //[ImgLeftVC ishaveremovTheacHUd:YES];
    ImgLeftVC.delegate= self;
    [mainscrollView addSubview:ImgLeftVC];
    
    ImgCenterVC = [[PhotoViewImage alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) withUrl:nil];
    ImgCenterVC.backgroundColor = [UIColor clearColor];
    ImgCenterVC.delegate = self;
  //  [ImgCenterVC ishaveremovTheacHUd:YES];
    [mainscrollView addSubview:ImgCenterVC];
    
    
    ImgRightVC = [[PhotoViewImage alloc] initWithFrame:CGRectMake(self.frame.size.width*2, 0, self.frame.size.width, self.frame.size.height) withUrl:nil];
    ImgRightVC.backgroundColor = [UIColor clearColor];
    ImgRightVC.delegate = self;
   // [ImgRightVC ishaveremovTheacHUd:YES];
    [mainscrollView addSubview:ImgRightVC];
    
    //为中间的图片添加手势
    
}

- (void)initwithThedefual{
    if (self.ImageArrs.count >=3) {
        [self changetheCurrentImageIndex:self.selectCurrent];
    }
    else {
        [self addTheoneimagetudefaa];
    }
}

- (void)addTheoneimagetudefaa{
    
    NSString *righturl = [NSString stringWithFormat:@"%@",self.ImageArrs[0]];
    [self showthOnethendOrstar:ImgLeftVC and:righturl];
    righturl = nil;
    
    if (self.ImageArrs.count ==2) {
        NSString *centte = [NSString stringWithFormat:@"%@",self.ImageArrs[1]];
        [self showthOnethendOrstar:ImgCenterVC and:centte];
        centte = nil;
    }
    
    mainscrollView.contentOffset = CGPointMake(self.frame.size.width*self.selectCurrent, 0);
    
    //NSLog(@"*************%ld   == %ld",self.ImageArrs.count,self.selectCurrent);
}

#pragma ShowPhotoViewDelegate
- (void)HiddennavtopAndtoolbottom{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)changetheCurrentImageIndex:(NSUInteger)currentImageIndex {
    
    if(self.ImageType == 3)
    {
        if (self.selectCurrent == 0) {
            
            NSString *lefturl = [NSString stringWithFormat:@"%@",self.ImageArrs[self.selectCurrent]];
            [self showthOnethendOrstar:ImgLeftVC and:lefturl];
            lefturl = nil;
            
            NSString *centerUrl = [NSString stringWithFormat:@"%@",self.ImageArrs[(self.selectCurrent+1)%self.ImageArrs.count]];
            [self showthOnethendOrstar:ImgCenterVC and:centerUrl];
            centerUrl = nil;
            
            return;
        }
        
        if (self.selectCurrent == self.ImageArrs.count-1) {
            
            NSString *righturl = [NSString stringWithFormat:@"%@",self.ImageArrs[self.selectCurrent]];
            [self showthOnethendOrstar:ImgRightVC and:righturl];
            righturl = nil;
            
            NSString *centerUrl = [NSString stringWithFormat:@"%@",self.ImageArrs[(self.selectCurrent-1+self.ImageArrs.count)%self.ImageArrs.count]];
            [self showthOnethendOrstar:ImgCenterVC and:centerUrl];
            centerUrl = nil;
            
            mainscrollView.contentOffset = CGPointMake(self.frame.size.width*2, 0);
            
            return;
        }
        
         NSString *lefturl = [NSString stringWithFormat:@"%@",self.ImageArrs[(currentImageIndex-1+self.ImageArrs.count)%self.ImageArrs.count]];
        [self ShowTheBigImg:ImgLeftVC and:lefturl];
        lefturl = nil;
        
        
        NSString *righturl = [NSString stringWithFormat:@"%@",self.ImageArrs[(currentImageIndex+1)%self.ImageArrs.count]];
        [self ShowTheBigImg:ImgRightVC and:righturl];
        righturl = nil;
        
        NSString *centerUrl = [NSString stringWithFormat:@"%@",self.ImageArrs[currentImageIndex]];
        [self ShowTheBigImg:ImgCenterVC and:centerUrl];
        centerUrl = nil;
        
    }
    

}

//混合处理
- (void)ShowTheBigImg:(PhotoViewImage *)PhotoView and:(NSString *)FileAddress{
    
//    NSLog(@"**************************************************%@",FileAddress);
    
    if (PhotoView.imageView.image) {
        PhotoView.imageView.image = nil;
    }
    
    if ([FileAddress rangeOfString:@"http://"].location !=NSNotFound) {
        [PhotoView setImageWithURL:FileAddress];
    }
    else if ([FileAddress rangeOfString:@"/var/mobile"].location !=NSNotFound){
        [PhotoView setImageWithFile:FileAddress];
    }
    else
    {
       UIImage *centerImg = [UIImage imageNamed:FileAddress];
        [PhotoView setImageWithIma:centerImg];
    }
    
     mainscrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    
}


//好的处理
- (void)linshiHandleleft{
    NSString *lefturl = [NSString stringWithFormat:@"%@",self.ImageArrs[self.selectCurrent]];
    [self showthOnethendOrstar:ImgLeftVC and:lefturl];
    lefturl = nil;
}


- (void)linshiHandright{
    NSString *righturl = [NSString stringWithFormat:@"%@",self.ImageArrs[self.selectCurrent]];
    [self showthOnethendOrstar:ImgRightVC and:righturl];
    righturl = nil;
}


- (void)showthOnethendOrstar:(PhotoViewImage *)PhotoView and:(NSString *)FileAddress{
    if (PhotoView.imageView.image) {
        PhotoView.imageView.image = nil;
    }
    
    if ([FileAddress rangeOfString:@"http://"].location !=NSNotFound) {
        [PhotoView setImageWithURL:FileAddress];
    }
    else if ([FileAddress rangeOfString:@"/var/mobile"].location !=NSNotFound){
        [PhotoView setImageWithFile:FileAddress];
    }
    else
    {
        UIImage *centerImg = [UIImage imageNamed:FileAddress];
        [PhotoView setImageWithIma:centerImg];
    }
}

- (void)reloadImage{
    CGPoint contentOffset = [mainscrollView contentOffset];
    
    if (self.ImageArrs.count >=3) {
        if (contentOffset.x > self.frame.size.width) { //向左滑动
            
            if (self.selectCurrent == self.ImageArrs.count-1) {
                return;
            }
            else
            {
                self.selectCurrent = (self.selectCurrent + 1) % self.ImageArrs.count;
            }
            
            if (self.selectCurrent == self.ImageArrs.count-1) {
                [self linshiHandright];
                return;
            }
        } else if (contentOffset.x < self.frame.size.width) { //向右滑动
            
            if (self.selectCurrent == 0) {
                return;
            }
            else
            {
                self.selectCurrent = (self.selectCurrent - 1 + self.ImageArrs.count) % self.ImageArrs.count;
            }
            
            if (self.selectCurrent == 0) {
                
                [self linshiHandleleft];
                
                return;
            }
        }
        else if (contentOffset.x == self.frame.size.width){
            if (self.selectCurrent == self.ImageArrs.count-1) {
                self.selectCurrent = (self.selectCurrent - 1 + self.ImageArrs.count) % self.ImageArrs.count;
                
            }
            
            if (self.selectCurrent == 0) {
                self.selectCurrent = (self.selectCurrent + 1) % self.ImageArrs.count;
            }
        }
        
        [self changetheCurrentImageIndex:self.selectCurrent];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [ImgCenterVC reductionOldSize];
    [ImgLeftVC reductionOldSize];
    [ImgRightVC reductionOldSize];
    [self reloadImage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
