//
//  WJPhotosCell.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJPhotosCell.h"
#define MARGIN 10

@implementation WJPhotosCell

//- (void)awakeFromNib {
//    // Initialization code
//}

+ (instancetype)groupCell:(UITableView *)tableView{
    NSString *reusedid = @"groupCell";
    WJPhotosCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedid];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedid];
    }
    
    UILabel *lanbgg = [[UILabel alloc] initWithFrame:CGRectMake(0, 87.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    lanbgg.backgroundColor = [UIColor blackColor];
    lanbgg.alpha = 0.2;
    [cell.contentView addSubview:lanbgg];
    lanbgg = nil;
    
    return cell;
}

- (void)setGroup:(ALAssetsGroup *)group{
    NSString *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
    if ([groupName isEqualToString:@"Camera Roll"]) {
        groupName = @"相机";
    }
    else if ([groupName isEqualToString:@"My Photo Stream"]){
        groupName = @"我的照片";
    }
    
    [group setAssetsFilter:[ALAssetsFilter allPhotos]];
    NSInteger groupCount = [group numberOfAssets];
    self.textLabel.text = [NSString stringWithFormat:@"%@(%ld)",groupName,groupCount];
    UIImage *iagdge = [UIImage imageWithCGImage:group.posterImage];
    [self.imageView setImage:iagdge];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellHright = self.frame.size.height-2*MARGIN;
    self.imageView.frame = CGRectMake(MARGIN, MARGIN, cellHright, cellHright);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
