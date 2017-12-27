//
//  WJAssetModel.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface WJAssetModel : NSObject

@property (nonatomic, strong)UIImage *thumbnail;//缩略图
@property (nonatomic, strong)UIImage *mohutupian;//
@property (nonatomic,strong)NSURL *imageURL;//原图链接
@property (nonatomic, assign)BOOL isSelectd;//是否已经被选中

@property (nonatomic, strong)ALAsset *LinshiSeet;

- (void)originalImageOfURL:(void(^)(UIImage *image))returnImage;//返回原图

- (void)thumidloriginalImageOfURL:(void(^)(UIImage *image))returnImage;//返回原图

@end;