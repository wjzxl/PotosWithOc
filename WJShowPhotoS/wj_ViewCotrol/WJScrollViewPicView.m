//
//  WJScrollViewPicView.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/29.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJScrollViewPicView.h"
#import "WJAssetModel.h"
#import "ShowPhotoView.h"

#define kWidthOfScreen [[UIScreen mainScreen] bounds].size.width
#define kHeightOfScreen [[UIScreen mainScreen] bounds].size.height
#define kImageViewCount 3

@interface WJScrollViewPicView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,ShowPhotoViewDelegate>
{
    UIScrollView *mainscrollView;
    ShowPhotoView *ImgCenterVC;
    UIImageView *ImgLeftVC;
    UIImageView *ImgRightVC;
    
    UIView *NavTopView;
    UIView *ToolBottomView;
    
    CGFloat ZoomXing;
}

@end

@implementation WJScrollViewPicView

- (void)dealloc{
    //self.ImageArrs = nil;
    
    mainscrollView = nil;
    ImgCenterVC.imageView.image = nil;
    ImgCenterVC = nil;
    
    ImgLeftVC.image = nil;
    ImgLeftVC = nil;
    
    ImgRightVC.image = nil;
    ImgRightVC = nil;
    
    NavTopView = nil;
    ToolBottomView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBarHidden = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self mainscrollViewUI];
    [self setNav];
    [self setbottom];
    [self initwithThedefual];
    
}

- (void)mainscrollViewUI{
    mainscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainscrollView.delegate = self;
    mainscrollView.backgroundColor = [UIColor clearColor];
    mainscrollView.pagingEnabled = YES;
    mainscrollView.showsHorizontalScrollIndicator = NO;
    mainscrollView.showsVerticalScrollIndicator = NO;
    mainscrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    [self.view addSubview:mainscrollView];
    
    //初始化三个imageView
    ImgLeftVC = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    ImgLeftVC.contentMode = UIViewContentModeScaleAspectFit;
    [mainscrollView addSubview:ImgLeftVC];
    
    ImgCenterVC = [[ShowPhotoView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height) withPhotoImage:nil];
    ImgCenterVC.delegate = self;
    [mainscrollView addSubview:ImgCenterVC];
    
    
    ImgRightVC = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    ImgRightVC.contentMode = UIViewContentModeScaleAspectFit;
    [mainscrollView addSubview:ImgRightVC];
    
    //为中间的图片添加手势
    
}

- (void)initwithThedefual{
    [self changetheCurrentImageIndex:self.selectCurrent];
}

- (void)setNav{
    NavTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    NavTopView.backgroundColor = [UIColor clearColor];
    NavTopView.userInteractionEnabled = YES;
    [self.view addSubview:NavTopView];
    
    UIView *backgroup = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    backgroup.backgroundColor = [UIColor grayColor];
    backgroup.userInteractionEnabled = YES;
    backgroup.alpha= 0.3;
    [NavTopView addSubview:backgroup];
    backgroup = nil;
    
    UIButton *butBack = [UIButton buttonWithType:UIButtonTypeSystem];
    butBack.frame =CGRectMake(0, 20, 50, 44);
    [butBack setTitle:@"返回" forState:UIControlStateNormal];
    [butBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [butBack addTarget:self action:@selector(fanhuiBack:) forControlEvents:UIControlEventTouchUpInside];
    [NavTopView addSubview:butBack];
    butBack = nil;

    UILabel *labeld = [[UILabel alloc] initWithFrame:CGRectMake(0, 31, self.view.frame.size.width, 20)];
    labeld.backgroundColor = [UIColor clearColor];
    labeld.tag = 500;
    labeld.text = [NSString stringWithFormat:@"%ld/%ld",self.selectCurrent+1,self.ImageArrs.count];
    labeld.font = [UIFont systemFontOfSize:16];
    labeld.textAlignment = NSTextAlignmentCenter;
    labeld.textColor = [UIColor whiteColor];
    labeld.userInteractionEnabled = NO;
    [NavTopView addSubview:labeld];
    labeld = nil;
    
}


- (void)setbottom{
    ToolBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    ToolBottomView.backgroundColor = [UIColor clearColor];
    ToolBottomView.userInteractionEnabled = YES;
    ToolBottomView.hidden = YES;
    [self.view addSubview:ToolBottomView];
    
    UIView *backgroup = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    backgroup.backgroundColor = [UIColor grayColor];
    backgroup.userInteractionEnabled = YES;
    backgroup.alpha= 0.3;
    [ToolBottomView addSubview:backgroup];
    backgroup = nil;
    
    UIButton *butBack = [UIButton buttonWithType:UIButtonTypeSystem];
    butBack.frame =CGRectMake(self.view.frame.size.width-50, 0, 50, 44);
    [butBack setTitle:@"发送" forState:UIControlStateNormal];
    [butBack setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [butBack addTarget:self action:@selector(sendbackd:) forControlEvents:UIControlEventTouchUpInside];
    [ToolBottomView addSubview:butBack];
    butBack = nil;
}

//单击
- (void)fingerIncident:(UITapGestureRecognizer *)sender{
    
    
}

#pragma ShowPhotoViewDelegate
- (void)HiddennavtopAndtoolbottom{
    if (NavTopView.hidden == YES) {
        
        NavTopView.hidden = NO;
       // ToolBottomView.hidden = NO;
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^{
            NavTopView.frame = CGRectMake(0,-64, kWidthOfScreen, 64);
           // ToolBottomView.frame = CGRectMake(0, kHeightOfScreen, kWidthOfScreen, 44);
        } completion:^(BOOL finished) {
            NavTopView.hidden = YES;
           // ToolBottomView.hidden = YES;
            
            NavTopView.frame = CGRectMake(0,0, kWidthOfScreen, 64);
           // ToolBottomView.frame = CGRectMake(0, kHeightOfScreen-44, kWidthOfScreen, 44);
        }];
    }
}

- (void)changetheCurrentImageIndex:(NSUInteger)currentImageIndex {

    WJAssetModel *model1 = (WJAssetModel *)self.ImageArrs[(currentImageIndex-1+self.ImageArrs.count)%self.ImageArrs.count];
    [model1 thumidloriginalImageOfURL:^(UIImage *image) {
        ImgLeftVC.image = nil;
        ImgLeftVC.image = image;
    }];
    
    
    WJAssetModel *model2 = (WJAssetModel *)self.ImageArrs[(currentImageIndex+1)%self.ImageArrs.count];
    [model2 thumidloriginalImageOfURL:^(UIImage *image) {
        ImgRightVC.image = nil;
        ImgRightVC.image = image;
    }];
    
    
    WJAssetModel *model = (WJAssetModel *)self.ImageArrs[currentImageIndex];
    [model originalImageOfURL:^(UIImage *image) {
        ImgCenterVC.imageView.image = nil;
        ImgCenterVC.imageView.image = image;
        mainscrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    }];
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        
//        // 计算PI值到100万位。和示例1的calcPI:完全一样，唯一区别是现在它在后台线程上执行了。
//    
//        
//        // 计算完成后，因为有UI操作，所以需要切换回主线程。一般原则：
//        // 1. UI操作必须在主线程上完成。2. 耗时的同步网络、同步IO、运算等操作不要在主线程上跑，以避免阻塞
//        // dispatch_get_main_queue()会返回关联到主线程的那个任务队列。
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//          		
//        });
//    });
   // self.selectCurrent = currentImageIndex;
   
    UILabel *textNumber = (UILabel *)[NavTopView viewWithTag:500];
    textNumber.text = [NSString stringWithFormat:@"%ld/%ld",self.selectCurrent+1,self.ImageArrs.count];
}

- (void)fanhuiBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendbackd:(UIButton *)sender{
    
}

- (void)reloadImage{
    CGPoint contentOffset = [mainscrollView contentOffset];
    if (contentOffset.x > self.view.frame.size.width) { //向左滑动
        self.selectCurrent = (self.selectCurrent + 1) % self.ImageArrs.count;
    } else if (contentOffset.x < self.view.frame.size.width) { //向右滑动
        self.selectCurrent = (self.selectCurrent - 1 + self.ImageArrs.count) % self.ImageArrs.count;
    }
    
    [self changetheCurrentImageIndex:self.selectCurrent];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [ImgCenterVC reductionTheScale];
    [self reloadImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
