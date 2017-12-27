//
//  WJCollectionViewController.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAssetsGroup;

@interface WJCollectionViewController : UICollectionViewController

@property (nonatomic, strong)ALAssetsGroup *group;

@property (nonatomic, assign)NSInteger MaxNumber;

@end
