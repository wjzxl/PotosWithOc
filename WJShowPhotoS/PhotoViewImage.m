//
//  PhotoViewImage.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/30.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "PhotoViewImage.h"

@implementation PhotoViewImage

- (void)dealloc{
    MainscrollView = nil;
    MBHud = nil;
}

- (id)initWithFrame:(CGRect)frame withUrl:(NSString *)ImgUrl{
    self = [super initWithFrame:frame];
    if (self) {
        //添加scrollView
        MainscrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        MainscrollView.delegate = self;
        MainscrollView.minimumZoomScale = 1;
        MainscrollView.maximumZoomScale = 2;
        MainscrollView.showsHorizontalScrollIndicator = NO;
        MainscrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:MainscrollView];
        //添加图片
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageView setUserInteractionEnabled:YES];
        [MainscrollView addSubview:self.imageView];
        
        //添加手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
        
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        doubleTap.numberOfTapsRequired = 2;//需要点两下
        twoFingerTap.numberOfTouchesRequired = 2;//需要两个手指touch
        
        [self.imageView addGestureRecognizer:singleTap];
        [self.imageView addGestureRecognizer:doubleTap];
        [self.imageView addGestureRecognizer:twoFingerTap];
        [singleTap requireGestureRecognizerToFail:doubleTap];//如果双击了，则不响应单击事件
        
        [MainscrollView setZoomScale:1];
        
        actifhhff = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((self.frame.size.width-40)/2, (self.frame.size.height-40)/2, 40, 40)];
        actifhhff.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self addSubview:actifhhff];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)Imgimage{
    self = [super initWithFrame:frame];
    if (self) {
        //添加scrollView
        MainscrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        MainscrollView.delegate = self;
        MainscrollView.backgroundColor =[UIColor clearColor];
        MainscrollView.minimumZoomScale = 1;
        MainscrollView.maximumZoomScale = 2;
        MainscrollView.showsHorizontalScrollIndicator = NO;
        MainscrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:MainscrollView];
        //添加图片
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageView setUserInteractionEnabled:YES];
        self.imageView.backgroundColor = [UIColor clearColor];
        [MainscrollView addSubview:self.imageView];
        
        //添加手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
        
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        doubleTap.numberOfTapsRequired = 2;//需要点两下
        twoFingerTap.numberOfTouchesRequired = 2;//需要两个手指touch
        
        [self.imageView addGestureRecognizer:singleTap];
        [self.imageView addGestureRecognizer:doubleTap];
        [self.imageView addGestureRecognizer:twoFingerTap];
        [singleTap requireGestureRecognizerToFail:doubleTap];//如果双击了，则不响应单击事件
        
        [MainscrollView setZoomScale:1];
        
        
        
    }
    return self;
}

- (void)reductionOldSize{
     [MainscrollView setZoomScale:1];
}

- (void)setImageWithIma:(UIImage *)image{
     self.imageView.image = image;
}

- (void)setImageWithFile:(NSString *)strFile{
 
    self.imageView.image = [[UIImage alloc] initWithContentsOfFile:strFile];
}

- (void)ishaveremovTheacHUd:(BOOL)booHiden{
    actifhhff.hidden = booHiden;
    if (booHiden) {
        [actifhhff stopAnimating];
    }
    else
    {
        [actifhhff startAnimating];
    }
}

- (void)setImageWithURL:(NSString *)photoUrl{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    BOOL isCached = [manager cachedImageExistsForURL:[NSURL URLWithString:photoUrl]];

     //[self ishaveremovTheacHUd:NO];
    
    if (!isCached) {//没有缓存
//        MBHud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//        MBHud.mode = MBProgressHUDModeIndeterminate;
//        MBHud.userInteractionEnabled = NO;
        NSLog(@"****************zhixinglema");
        
        [self ishaveremovTheacHUd:NO];
        
        
    }
    else
    {
         NSLog(@"****************=========");
    }
//    else{
//        //[MBHud hide:YES];
//        
//        [self ishaveremovTheacHUd:YES];
//    }
    
//    if(self.imageView.image){
//        [actifhhff stopAnimating];
//        actifhhff.hidden = YES;
//    }
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:[UIImage imageNamed:@"moren_ditulala.jpg"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize){
//        MBHud.progress = ((float)receivedSize)/expectedSize;
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
       // NSLog(@"图片加载完成")
        
         NSLog(@"****************zhixinglema=====");
        
        if (image == nil) {
           self.imageView.image = [UIImage imageNamed:@"shibaide_LL"];
        }
        else
        {
            self.imageView.image = image;
        }
        
        [self ishaveremovTheacHUd:YES];
    }];
}

#pragma mark - UIScrollViewDelegate
//scroll view处理缩放和平移手势，必须需要实现委托下面两个方法,另外 maximumZoomScale和minimumZoomScale两个属性要不一样
//1.返回要缩放的图片
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
//2.重新确定缩放完后的缩放倍数
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark - 图片的点击，touch事件
-(void)handleSingleTap:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"单击");
    if (gestureRecognizer.numberOfTapsRequired == 1) {
        [self.delegate HiddennavtopAndtoolbottom];
    }
}

-(void)handleDoubleTap:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"双击");
    if (gestureRecognizer.numberOfTapsRequired == 2) {
        if(MainscrollView.zoomScale == 1){
            float newScale = [MainscrollView zoomScale] *2;
            CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
            [MainscrollView zoomToRect:zoomRect animated:YES];
        }else{
            float newScale = [MainscrollView zoomScale]/2;
            CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
            [MainscrollView zoomToRect:zoomRect animated:YES];
        }
    }
}

-(void)handleTwoFingerTap:(UITapGestureRecognizer *)gestureRecongnizer{
    float newScale = [MainscrollView zoomScale]/2;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecongnizer locationInView:gestureRecongnizer.view]];
    [MainscrollView zoomToRect:zoomRect animated:YES];
}


#pragma mark - 缩放大小获取方法
-(CGRect)zoomRectForScale:(CGFloat)scale withCenter:(CGPoint)center{
    CGRect zoomRect;
    //大小
    zoomRect.size.height = [MainscrollView frame].size.height/scale;
    zoomRect.size.width = [MainscrollView frame].size.width/scale;
    //原点
    zoomRect.origin.x = center.x - zoomRect.size.width/2;
    zoomRect.origin.y = center.y - zoomRect.size.height/2;
    return zoomRect;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
