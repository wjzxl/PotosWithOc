//
//  DateWithChange_manager.h
//  MIMI
//
//  Created by wangjun on 14-10-15.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateWithChange_manager : NSObject

/*聊天里面的时间的转化*/
- (NSString *)ShowHomeViewTimeApp:(NSString *)TimeString;
- (NSString *)ShowTimeWithTheAppropriateStyle:(NSString *)TimeString;//针对时间戳的

- (NSString*)ShowDateWithTheAppropriateStyle:(NSString *)DateString;//针对日期的

/*搭讪列表的时间转化*/
- (NSString *)showTheTimeForList:(NSString *)TimeString;//针对时间戳

- (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate;

- (NSString *)Thedateddf:(NSString *)datasgtring  withFormate:(NSString *) formate;

- (NSString *)ThtnewsDataWith:(NSString *)dataString;

@end
