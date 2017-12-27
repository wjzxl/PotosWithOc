//
//  WJ_NavTableViewController.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJ_NavTableViewController : UINavigationController

@property (nonatomic, strong)void(^didFinshOriginPics)(NSArray *Pics,NSArray *Selsectmodel);

@property (nonatomic, strong)void(^didFinshThumbnailsPics)(NSArray *Pics);

@property (nonatomic, strong)void(^didcancalPics)(BOOL isbool);

@property (nonatomic, assign)NSInteger ChooseNumber;

- (id)intwithFramwith:(NSInteger)number;

@end
