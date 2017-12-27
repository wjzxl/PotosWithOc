//
//  WJAssetModel.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJAssetModel.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation WJAssetModel

- (void)originalImageOfURL:(void (^)(UIImage *))returnImage{
    ALAssetsLibrary *libd = [[ALAssetsLibrary alloc] init];
    [libd assetForURL:self.imageURL resultBlock:^(ALAsset *asset) {
        
        NSLog(@"hehhehe====%@",self.imageURL);
        
        ALAssetRepresentation *rep = [asset defaultRepresentation];
        CGImageRef imageref = [rep fullResolutionImage];;
        UIImage *imagesd = [UIImage imageWithCGImage:imageref scale:1 orientation:(UIImageOrientation)rep.orientation];
        if (imagesd) {
            returnImage(imagesd);
            
            NSLog(@"ueueuuueueue");
        }
        else{
            returnImage([UIImage imageWithCGImage:asset.aspectRatioThumbnail]);
        }
        
    } failureBlock:^(NSError *error) {
        NSLog(@"hahahahha");
    }];
}

- (void)thumidloriginalImageOfURL:(void (^)(UIImage *))returnImage{
    ALAssetsLibrary *libd = [[ALAssetsLibrary alloc] init];
    [libd assetForURL:self.imageURL resultBlock:^(ALAsset *asset) {
        //ALAssetRepresentation *rep = asset.defaultRepresentation;
        CGImageRef imageref = asset.thumbnail;
        UIImage *imagesd = [UIImage imageWithCGImage:imageref scale:1 orientation:(UIImageOrientation)UIImageOrientationUp];
        if (imagesd) {
            returnImage(imagesd);
        }
        
    } failureBlock:^(NSError *error) {
        
    }];
}

@end
