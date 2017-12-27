//
//  WJCollectionViewController.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJCollectionViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "WJAssetModel.h"
#import "WJ_NavTableViewController.h"
#import "WJScrollViewPicView.h"
#import "HUDManager.h"
#import "UIColor+RGB.h"
#import "CommonConfig.h"

#define MARGIN 5
#define COL 4
#define kWidth [UIScreen mainScreen].bounds.size.width


@interface wjCollectionCell : UICollectionViewCell

@property (nonatomic, weak)UIButton *selectedButton;

@end

@implementation wjCollectionCell

@end


//主体
@interface WJCollectionViewController ()

@property (nonatomic, strong)NSMutableArray *AssetModelsArr;

@property (nonatomic, strong)NSMutableArray *SelectedModelsArr;

@property (nonatomic, strong)NSMutableArray *SelectedImagesArr;

@end

@implementation WJCollectionViewController

@synthesize MaxNumber;

static NSString * const reuseIdentifier = @"Cell";

- (void)dealloc{
    self.AssetModelsArr = nil;
    self.SelectedImagesArr = nil;
    self.SelectedModelsArr = nil;
    
    self.group = nil;
}

//设置类型
- (instancetype)init{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumInteritemSpacing = MARGIN;
    flowlayout.minimumLineSpacing = MARGIN;
    CGFloat cellHeight = (kWidth - (COL + 1) * MARGIN)/COL;
    flowlayout.itemSize = CGSizeMake(cellHeight, cellHeight);
    flowlayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    return [super initWithCollectionViewLayout:flowlayout];
}

- (NSMutableArray *)AssetModelsArr{
    if (_AssetModelsArr == nil) {
        _AssetModelsArr = [NSMutableArray array];
    }
    return _AssetModelsArr;
}

- (NSMutableArray *)SelectedModelsArr{
    if (_SelectedModelsArr == nil) {
        _SelectedModelsArr = [NSMutableArray array];
    }
    return _SelectedModelsArr;
}

- (NSMutableArray *)SelectedImagesArr{
    if (_SelectedImagesArr == nil) {
        _SelectedImagesArr = [NSMutableArray array];
    }
    return _SelectedImagesArr;
}

- (void)setGroup:(ALAssetsGroup *)group{
    _group = group;
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result == nil) {
            return;
        }
        
        if (![[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
            return;
        }
        
        WJAssetModel *modelsd = [[WJAssetModel alloc] init];
        modelsd.LinshiSeet = result;
        modelsd.thumbnail = [UIImage imageWithCGImage:result.thumbnail];
       // NSLog(@"************%lf    %lf",[UIImage imageWithCGImage:result.aspectRatioThumbnail].size.width,[UIImage imageWithCGImage:result.aspectRatioThumbnail].size.height);
        
       //modelsd.mohutupian = [UIImage imageWithCGImage:[[result defaultRepresentation] fullScreenImage]];
        modelsd.imageURL  = result.defaultRepresentation.url;
        [self.AssetModelsArr addObject:modelsd];
        modelsd = nil;
        
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
     self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.view.backgroundColor = WhiteColor;
    
    NSLog(@"+++++++++++++%ld ====%lf     ===%lf",self.MaxNumber,kWidth,IPHONE_HEIGHT);
    
    // Register cell classes
    [self.collectionView registerClass:[wjCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.frame = CGRectMake(0, 0, kWidth, IPHONE_HEIGHT-44);
    self.collectionView.alwaysBounceHorizontal = NO;
//    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 2);
//    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, -2);
  //  self.collectionView.contentSize = CGSizeMake(self.view.width, ((_model.count + 3) / 4) * self.view.width);
    [self.view addSubview:self.collectionView];
    
    UILabel *linkbigf = [[UILabel alloc] initWithFrame:CGRectMake(0, IPHONE_HEIGHT-44-0.5, kWidth, 0.5)];
    linkbigf.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self.view addSubview:linkbigf];
    linkbigf = nil;
    
    UIView *bootomView = [[UIView alloc] initWithFrame:CGRectMake(0, IPHONE_HEIGHT-44, kWidth, 44)];
    bootomView.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:255.0/255.0f blue:255.0/255.0f alpha:1.0];
    [self.view addSubview:bootomView];
    bootomView = nil;
    
    UIButton *butYulanBut = [UIButton buttonWithType:UIButtonTypeSystem];
    butYulanBut.frame = CGRectMake(0, IPHONE_HEIGHT-44, 50, 44);
    butYulanBut.backgroundColor = [UIColor clearColor];
    [butYulanBut setTitle:@"预览" forState:UIControlStateNormal];
    [butYulanBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butYulanBut addTarget:self action:@selector(yulanbut) forControlEvents:UIControlEventTouchUpInside];
    butYulanBut.enabled = NO;
    butYulanBut.tag = 200;
    butYulanBut.titleLabel.font = [UIFont systemFontOfSize:15.0];
    butYulanBut.alpha = 0.3;
    [self.view addSubview:butYulanBut];
    butYulanBut = nil;
    
    
    UIButton *butsendBut = [UIButton buttonWithType:UIButtonTypeSystem];
    butsendBut.frame = CGRectMake(kWidth-50, IPHONE_HEIGHT-44, 50, 44);
    butsendBut.backgroundColor = [UIColor clearColor];
    [butsendBut setTitle:@"确定" forState:UIControlStateNormal];
    [butsendBut setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [butsendBut addTarget:self action:@selector(surechoosesend) forControlEvents:UIControlEventTouchUpInside];
    butsendBut.enabled = NO;
    butsendBut.tag = 300;
    butsendBut.titleLabel.font = [UIFont systemFontOfSize:15.0];
    butsendBut.alpha = 0.3;
    [self.view addSubview:butsendBut];
    butsendBut = nil;
    
    UILabel *landbffhf = [[UILabel alloc] initWithFrame:CGRectMake(kWidth-59, IPHONE_HEIGHT-44+14, 16, 16)];
    landbffhf.backgroundColor = [UIColor greenColor];
    landbffhf.tag = 400;
    landbffhf.userInteractionEnabled = NO;
    landbffhf.font = [UIFont systemFontOfSize:14.0];
    landbffhf.textAlignment = NSTextAlignmentCenter;
    landbffhf.textColor = [UIColor whiteColor];
    landbffhf.layer.masksToBounds = YES;
    landbffhf.layer.cornerRadius = 8;
    landbffhf.hidden = YES;
    [self.view addSubview:landbffhf];
    landbffhf = nil;
    
    UIBarButtonItem *rightBarbut = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(sureChoose)];
    self.navigationItem.rightBarButtonItem = rightBarbut;
    rightBarbut = nil;
    
    if (self.AssetModelsArr.count !=0) {
        
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.AssetModelsArr.count - 1 inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
    }
    
    // Do any additional setup after loading the view.
}

//预览
- (void)yulanbut{
    WJScrollViewPicView *scrollVC = [[WJScrollViewPicView alloc] init];
    scrollVC.ImageArrs = self.SelectedModelsArr;
    scrollVC.selectCurrent = 0;
    [self.navigationController pushViewController:scrollVC animated:YES];
    scrollVC = nil;
}

//确定
- (void)surechoosesend{
    
    if ([self.navigationController isKindOfClass:[WJ_NavTableViewController class]]) {
        WJ_NavTableViewController *navViewd = (WJ_NavTableViewController *)self.navigationController;
    
        [HUDManager showHUDWithToShowStr:nil HUDMode:MBProgressHUDModeIndeterminate autoHide:NO afterDelay:0 userInteractionEnabled:NO];
        
        for (int i = 0; i < self.SelectedModelsArr.count; i++) {
                            WJAssetModel *modlejd = self.SelectedModelsArr[i];
           // NSLog(@"djjfdjfjfj");
//            UIImage *thidif =[UIImage imageWithCGImage:[modlejd.LinshiSeet thumbnail]];
            UIImage *scrolimagdg = [UIImage imageWithCGImage:[[modlejd.LinshiSeet defaultRepresentation] fullResolutionImage] scale:1 orientation:(UIImageOrientation)[modlejd.LinshiSeet defaultRepresentation].orientation];
            
            [self.SelectedImagesArr addObject:[self fixOrientation:scrolimagdg]];
            
            scrolimagdg = nil;
            
            if (i==self.SelectedModelsArr.count-1) {
                
                [HUDManager hideHUD];
                
                if (navViewd.didFinshOriginPics) {
                    navViewd.didFinshOriginPics(self.SelectedImagesArr,self.SelectedModelsArr);
                }
                
                // NSLog(@"000000000");
            }
        }//
        
    }
    
      [self dismissViewControllerAnimated:YES completion:nil];
}



//要旋转图像的代码：
- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

//判断底部按钮的情况
- (void)changeTheState{
    
    UIButton *yulanbut = (UIButton *)[self.view viewWithTag:200];
    UIButton *sendbut = (UIButton *)[self.view viewWithTag:300];
    UILabel *labedkf  = (UILabel *)[self.view viewWithTag:400];
    
    if (self.SelectedModelsArr.count >0) {
        yulanbut.enabled = YES;
        yulanbut.alpha = 1.0;
        
        sendbut.enabled = YES;
        sendbut.alpha = 1.0;
        
        labedkf.hidden = NO;
        labedkf.text = [NSString stringWithFormat:@"%ld",self.SelectedModelsArr.count];
    }
    else
    {
        yulanbut.enabled = NO;
        yulanbut.alpha = 0.3;
        
        sendbut.enabled = NO;
        sendbut.alpha = 0.3;
        
        labedkf.hidden = YES;
        labedkf.text = [NSString stringWithFormat:@""];
    }
}

- (void)sureChoose{
   
     WJ_NavTableViewController *navViewd = (WJ_NavTableViewController *)self.navigationController;
    
    if (navViewd.didcancalPics) {
        navViewd.didcancalPics(NO);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.AssetModelsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    wjCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    WJAssetModel *models = self.AssetModelsArr[indexPath.item];
    
    if (cell.backgroundView == nil) {
        UIImageView *imagdhf = [[UIImageView alloc] init];
        cell.backgroundView = imagdhf;
    }
    
    UIImageView *backVC = (UIImageView *)cell.backgroundView;
    backVC.contentMode = UIViewContentModeScaleAspectFill;
    backVC.image = models.thumbnail;
    
    if (cell.selectedButton == nil) {
        UIButton *selectButton = [[UIButton alloc] init];
        [selectButton setImage:[UIImage imageNamed:@"ll_NO_chooose"] forState:UIControlStateNormal];
        [selectButton setImage:[UIImage imageNamed:@"ll_YES_chooose"] forState:UIControlStateSelected];
        CGFloat width = cell.bounds.size.width;
        selectButton.frame = CGRectMake(width - 26, 1, 25, 25);
        [cell.contentView addSubview:selectButton];
        cell.selectedButton = selectButton;
        [selectButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        selectButton = nil;
    }
    
    cell.selectedButton.tag = indexPath.item+10;
    cell.selectedButton.selected = models.isSelectd;
    
    return cell;
}

- (void)buttonClicked:(UIButton *)sender{
    
    if (self.SelectedModelsArr.count >=self.MaxNumber && !sender.selected) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"只能选择%ld张",self.MaxNumber] delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        [alertView show];
        alertView = nil;
        
        return;
    }
    
    sender.selected = !sender.selected;
    WJAssetModel *modejdf = (WJAssetModel*)self.AssetModelsArr[sender.tag-10];
    if (sender.selected == YES) {
        
        modejdf.isSelectd = YES;
        
        [self.SelectedModelsArr addObject:modejdf];
    }
    else
    {
       
        modejdf.isSelectd = NO;
        [self.SelectedModelsArr removeObject:modejdf];
    }
    
    [self changeTheState];
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   // NSLog(@"************点击了第%ld个Cell",indexPath.item+1);
    
//  __block NSMutableArray *linshiArr = [NSMutableArray arrayWithCapacity:0];
//    
//    for (int i = 0; i < self.AssetModelsArr.count; i++) {
//        WJAssetModel *modlejd = self.AssetModelsArr[i];
//        
//        [modlejd originalImageOfURL:^(UIImage *image) {
//            
//            [linshiArr addObject:image];
//            
//            if (i == self.AssetModelsArr.count-1) {
//                JZAlbumViewController *condtggh = [[JZAlbumViewController alloc] init];
//                condtggh.imgArr = [NSMutableArray arrayWithArray:linshiArr];
//                condtggh.currentIndex = indexPath.item;
//                [self.navigationController pushViewController:condtggh animated:YES];
//                condtggh = nil;
//               
//                linshiArr = nil;
//            }
//            
//        }];
//    }
//    WJPhotoBrowser *browservc = [[WJPhotoBrowser alloc] init];
//    browservc.AssetModelArr = self.AssetModelsArr;
//    browservc.currentIndex = indexPath.item;
//    [browservc showTheView];
    
//    WJScrollViewPicView *scrollVC = [[WJScrollViewPicView alloc] init];
//    scrollVC.ImageArrs = self.AssetModelsArr;
//    scrollVC.selectCurrent = indexPath.item;
//    [self.navigationController pushViewController:scrollVC animated:YES];
//    scrollVC = nil;
   
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
