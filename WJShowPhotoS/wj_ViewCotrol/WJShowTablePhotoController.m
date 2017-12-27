//
//  WJShowTablePhotoController.m
//  从相册取相片
//
//  Created by 王俊 on 15/10/28.
//  Copyright © 2015年 王俊. All rights reserved.
//

#import "WJShowTablePhotoController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "WJPhotosCell.h"
#import "WJCollectionViewController.h"

@interface WJShowTablePhotoController ()

@property (nonatomic,strong)ALAssetsLibrary *assetsLibrary;
@property (nonatomic, strong)NSMutableArray *groups;

@end

@implementation WJShowTablePhotoController

@synthesize maxmunber;

- (ALAssetsLibrary *)assetsLibrary{
    if (_assetsLibrary == nil) {
        _assetsLibrary = [[ALAssetsLibrary alloc] init];
    }
    
    return _assetsLibrary;
}

- (NSMutableArray *)groups{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
       ALAssetsFilter * assetsFilter = [ALAssetsFilter allPhotos];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
               
                if(group){
                    
                     [group setAssetsFilter:assetsFilter];
                    
                    [_groups insertObject:group atIndex:0];
                    [self.tableView reloadData];
                    NSLog(@"********名字===%@",[group valueForProperty:ALAssetsGroupPropertyName]);
                }
                else{
                    
                    if (self.groups.count >0) {
                        
                        int k = 0;
                        
                        for (int l= 0; l < self.groups.count;l++) {
                            NSString *srfinfnf = [NSString stringWithFormat:@"%@",[[self.groups objectAtIndex:l] valueForProperty:ALAssetsGroupPropertyName]];
                            if ([srfinfnf isEqualToString:@"相机胶卷"] || [srfinfnf isEqualToString:@"所有照片"]) {
                                k = l;
                                srfinfnf = nil;
                                break;
                            }
                            
                            srfinfnf = nil;
                        }
                        
                        WJCollectionViewController *collectionVC = [[WJCollectionViewController alloc] init];
                        collectionVC.group = self.groups[k];
                        collectionVC.MaxNumber = self.maxmunber;
                        [self.navigationController pushViewController:collectionVC animated:NO];
                        collectionVC = nil;
                    }
                    else
                    {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"相册暂无图片" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                        [alertView show];
                        alertView = nil;
                    }
                }
            } failureBlock:^(NSError *error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"访问相册失败" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                [alertView show];
                alertView = nil;
            }];
            
            
        });
        
       
    }
    
      return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //设置导航的返回按钮
    UIBarButtonItem *backitme = [[UIBarButtonItem alloc] init];
    backitme.title = @"返回相册";
    self.navigationItem.backBarButtonItem = backitme;
    backitme = nil;
    
    [self groups];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    WJPhotosCell *cell = [WJPhotosCell groupCell:tableView];
    cell.group = [self.groups objectAtIndex:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WJCollectionViewController *collectionVC = [[WJCollectionViewController alloc] init];
    collectionVC.group = self.groups[indexPath.row];
    collectionVC.MaxNumber = self.maxmunber;
    [self.navigationController pushViewController:collectionVC animated:YES];
    collectionVC = nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
