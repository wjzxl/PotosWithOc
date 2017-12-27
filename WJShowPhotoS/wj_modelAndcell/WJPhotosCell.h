//
//  WJPhotosCell.h
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface WJPhotosCell : UITableViewCell

@property (nonatomic, strong)ALAssetsGroup *group;

+(instancetype)groupCell:(UITableView *)tableView;

@end
