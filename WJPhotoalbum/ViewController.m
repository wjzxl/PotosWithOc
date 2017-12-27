//
//  ViewController.m
//  WJPhotoalbum
//
//  Created by 王俊 on 2017/12/26.
//  Copyright © 2017年 王俊. All rights reserved.
//

#import "ViewController.h"
#import "WJ_NavTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"相册";
    
    UIButton *butPhoto = [[UIButton alloc] initWithFrame:CGRectMake(0, 125, 80, 40)];
    butPhoto.backgroundColor = [UIColor orangeColor];
    [butPhoto setTitle:@"相册" forState:UIControlStateNormal];
    [butPhoto setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [butPhoto addTarget:self action:@selector(xiangceCiclik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butPhoto];
    
}

-(void)xiangceCiclik:(UIButton *)sender{
    WJ_NavTableViewController *navViewsf = [[WJ_NavTableViewController alloc] intwithFramwith:9];
    [navViewsf setDidFinshOriginPics:^(NSArray *Pics,NSArray *Selsectmodel) {
        NSLog(@"原图：%@",Pics);
        
        
    }];
    
    [navViewsf setDidcancalPics:^(BOOL isbool) {
        
    }];
    
    [self presentViewController:navViewsf animated:YES completion:nil];
    navViewsf = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
