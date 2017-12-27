//
//  WJ_NavTableViewController.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJ_NavTableViewController.h"
#import "WJShowTablePhotoController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "CommonConfig.h"
#import "UIColor+RGB.h"

@interface WJ_NavTableViewController ()

@end

@implementation WJ_NavTableViewController

@synthesize ChooseNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init{
    if (self = [super initWithRootViewController:[self wjphotosTable]]) {
        UINavigationBar *navbar = [UINavigationBar appearance];
        navbar.barTintColor = NavGationyColor;
        navbar.tintColor = [UIColor whiteColor];
        
        [navbar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
        [UIColor whiteColor], NSForegroundColorAttributeName,nil]];
        
    }
    
    return self;
}

- (id)intwithFramwith:(NSInteger)number{
    
    self.ChooseNumber = number;
    
   return  [self init];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    return [self init];
}

- (WJShowTablePhotoController *)wjphotosTable{
    
    NSLog(@"+++++++++++++%ld",self.ChooseNumber);
    
    WJShowTablePhotoController *photoTable = [[WJShowTablePhotoController alloc] init];
    photoTable.navigationItem.title = @"选择相册";
    photoTable.maxmunber = self.ChooseNumber;
    
    UIBarButtonItem *canitemsbar = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dissSuperView)];
    photoTable.navigationItem.leftBarButtonItem = canitemsbar;
    canitemsbar = nil;
    
    return photoTable;
}

- (void)dissSuperView{
    if (self.didcancalPics) {
        self.didcancalPics(NO);
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

@end
