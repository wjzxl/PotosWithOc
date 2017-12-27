# PotosWithOc
模仿微信发相册图片
可以多选，查看图片，放大缩小，预览
-----------------------------
------------------------------
调用相册的代码实例：
----------------------
----------------------
WJ_NavTableViewController *navViewsf = [[WJ_NavTableViewController alloc] intwithFramwith:9];
[navViewsf setDidFinshOriginPics:^(NSArray *Pics,NSArray *Selsectmodel) {
NSLog(@"原图：%@",Pics);


}];

[navViewsf setDidcancalPics:^(BOOL isbool) {

}];

[self presentViewController:navViewsf animated:YES completion:nil];
navViewsf = nil;
