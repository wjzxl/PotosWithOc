//
//  DateWithChange_manager.m
//  MIMI
//
//  Created by wangjun on 14-10-15.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import "DateWithChange_manager.h"

@implementation DateWithChange_manager


/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/

- (NSString *)Thedateddf:(NSString *)datasgtring  withFormate:(NSString *) formate;
{
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:datasgtring];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
       // NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
//        if (time<=60) {  //// 1分钟以内的
//            dateStr = @"刚刚";
//        }else if(time<=60*60){  ////  一个小时以内的
//            
//            int mins = time/60;
//            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
//            
//        }else
//        if(time<=60*60*24*2){   //// 在两天内的
//        
//            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
//            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
//            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
//            
//            [dateFormatter setDateFormat:@"HH:mm"];
//            if ([need_yMd isEqualToString:now_yMd]) {
//                //// 在同一天
//                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
//            }else{
//                ////  昨天
//                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
//            }
//        }else {
        
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy年MM月dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
       // }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

- (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24*2){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM/dd HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}

/*搭讪列表时间的转化*/
- (NSString *)showTheTimeForList:(NSString *)TimeString{
    
    NSDate *tempTime = [NSDate dateWithTimeIntervalSince1970:[TimeString longLongValue]/1000];
    
    NSDate *currentTime = [NSDate date];
    //NSLog(@"time************%@  ********%@",tempTime, currentTime);
    
    //获取对应时间下的年 月 日 时 分 秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *dataCompontent_now = [calendar components:unitFlags fromDate:currentTime];
    NSDateComponents *dataCompontent = [calendar components:unitFlags fromDate:tempTime];
    
    NSInteger year_now = [dataCompontent_now year];
    NSInteger month_now = [dataCompontent_now month];
    NSInteger day_now = [dataCompontent_now day];
    NSInteger week_now = [dataCompontent_now weekdayOrdinal];
    
    //NSLog(@"*******%d    %d   %d   %d    %d   %d  %d",year_now, month_now, day_now, week_now, [dataCompontent_now hour], [dataCompontent_now minute], [dataCompontent_now weekdayOrdinal]);
    
    NSInteger year_temp = [dataCompontent year];
    NSInteger month_temp = [dataCompontent month];
    NSInteger day_temp = [dataCompontent day];
    NSInteger week_temp = [dataCompontent weekday];
    NSInteger hour_temp = [dataCompontent hour];
    NSInteger minute_temp = [dataCompontent minute];
    
    if (year_now == year_temp) {
        
        if (month_now == month_temp) {
            
            if (day_now == day_temp) {
                
                return [self hoursWith:hour_temp andwithd:minute_temp];//[self HourAndMinuteDateStr:hour_temp and:minute_temp];
            }
            
            if (day_now-1 == day_temp) {
                
                return [self dayhourwithmite:hour_temp andwith:minute_temp];//[self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
                
            }
            
            if((day_now - day_temp) > 1 && (day_now-day_temp) < week_now){
                
                return [self Weekondday:week_temp];//[self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
            }
            
            return [self yearWith:year_temp andmonth:month_temp andDay:day_temp];//[self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
        }
        
        
        NSDateComponents *comps = [calendar components:unitFlags fromDate:tempTime toDate:currentTime options:0];
        NSInteger cha_month = [comps month];
        NSInteger cha_day = [comps day];
        
        if (cha_month > 0 || cha_day >= week_now) {
            
            return [self yearWith:year_temp andmonth:month_temp andDay:day_temp];//[self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
        }
        
        if (cha_day == 1) {
            
            return [self dayhourwithmite:hour_temp andwith:minute_temp];//[self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
        }
        
        return [self Weekondday:week_temp];//[self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
    }
    
    return [self yearWith:year_temp andmonth:month_temp andDay:day_temp];//[self YearAndHourAndMinuteDateStr:year_temp withM:month_temp withD:day_temp withH:hour_temp withM:minute_temp];
}//针对时间戳

- (NSString *)hoursWith:(NSInteger)hours andwithd:(NSInteger)mintue{
    NSString *ster = [NSString stringWithFormat:@"%@%ld:%@%ld",(hours >= 10 ? @"":@"0"),hours,(mintue >= 10 ? @"":@"0") ,mintue];
    return ster;
}

- (NSString *)dayhourwithmite:(NSInteger)hour  andwith:(NSInteger)mintue{
    return @"昨天";
}

- (NSString *)Weekondday:(NSInteger)weerk{
    NSArray *weekarr = [NSArray arrayWithObjects:@"周日",@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSString *ster = [NSString stringWithFormat:@"%@",[weekarr objectAtIndex:(weerk-1)]];
    weekarr = nil;
    
    return ster;
}

- (NSString *)yearWith:(NSInteger)years andmonth:(NSInteger)month  andDay:(NSInteger)day{
    NSInteger yeard = years%100;
    
    NSString *ster = [NSString stringWithFormat:@"%ld/%ld/%ld",yeard, month, day];
    return ster;
}

//首页的时间转化
- (NSString *)ShowHomeViewTimeApp:(NSString *)TimeString{
    NSDate *tempTime = [NSDate dateWithTimeIntervalSince1970:[TimeString longLongValue]/1000];
    
    NSDate *currentTime = [NSDate date];
    //NSLog(@"time************%@  ********%@",tempTime, currentTime);
    
    //获取对应时间下的年 月 日 时 分 秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *dataCompontent_now = [calendar components:unitFlags fromDate:currentTime];
    NSDateComponents *dataCompontent = [calendar components:unitFlags fromDate:tempTime];
    
    NSInteger year_now = [dataCompontent_now year];
    NSInteger month_now = [dataCompontent_now month];
    NSInteger day_now = [dataCompontent_now day];
    NSInteger week_now = [dataCompontent_now weekday];
    
    //NSLog(@"*******%d    %d   %d   %d    %d   %d  %d",year_now, month_now, day_now, week_now, [dataCompontent_now hour], [dataCompontent_now minute], [dataCompontent_now weekdayOrdinal]);
    
    NSInteger year_temp = [dataCompontent year];
    NSInteger month_temp = [dataCompontent month];
    NSInteger day_temp = [dataCompontent day];
    NSInteger week_temp = [dataCompontent weekday];
    NSInteger hour_temp = [dataCompontent hour];
    NSInteger minute_temp = [dataCompontent minute];
    
     NSArray *weekarr = [NSArray arrayWithObjects:@"星期日",@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    if (year_now == year_temp) {
        
        if (month_now == month_temp) {
            
            if (day_now == day_temp) {
                
                
                if (minute_temp<10) {
                    return [NSString stringWithFormat:@"%ld:0%ld",hour_temp,minute_temp];
                }
                
                return [NSString stringWithFormat:@"%ld:%ld",hour_temp,minute_temp];
            }
            
            if (day_now-1 == day_temp) {
                
                return @"昨天";
                
            }
            
            if((day_now - day_temp) > 1 && (day_now-day_temp) < week_now){
                
                return [NSString stringWithFormat:@"%@",[weekarr objectAtIndex:week_temp-1]];
            }
            
            return [NSString stringWithFormat:@"%ld月%ld日",month_temp,day_temp];
        }
        
        
        NSDateComponents *comps = [calendar components:unitFlags fromDate:tempTime toDate:currentTime options:0];
        NSInteger cha_month = [comps month];
        NSInteger cha_day = [comps day];
        
        if (cha_month > 0 || cha_day >= week_now) {
            
            return [NSString stringWithFormat:@"%ld月%ld日",month_temp,day_temp];
        }
        
        if (cha_day == 1) {
            
            return @"昨天";
        }
        
        return [NSString stringWithFormat:@"%@",[weekarr objectAtIndex:week_temp-1]];
    }
    
    return [NSString stringWithFormat:@"%ld/%ld/%ld",year_temp%100,month_temp,day_temp];
}

/*聊天界面时间的转化*/
- (NSString *)ShowTimeWithTheAppropriateStyle:(NSString *)TimeString{
    
    NSDate *tempTime = [NSDate dateWithTimeIntervalSince1970:[TimeString longLongValue]/1000];
    
    NSDate *currentTime = [NSDate date];
    //NSLog(@"time************%@  ********%@",tempTime, currentTime);
    
    //获取对应时间下的年 月 日 时 分 秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *dataCompontent_now = [calendar components:unitFlags fromDate:currentTime];
    NSDateComponents *dataCompontent = [calendar components:unitFlags fromDate:tempTime];
    
    NSInteger year_now = [dataCompontent_now year];
    NSInteger month_now = [dataCompontent_now month];
    NSInteger day_now = [dataCompontent_now day];
    NSInteger week_now = [dataCompontent_now weekday];
    
    //NSLog(@"*******%d    %d   %d   %d    %d   %d  %d",year_now, month_now, day_now, week_now, [dataCompontent_now hour], [dataCompontent_now minute], [dataCompontent_now weekdayOrdinal]);
    
    NSInteger year_temp = [dataCompontent year];
    NSInteger month_temp = [dataCompontent month];
    NSInteger day_temp = [dataCompontent day];
    NSInteger week_temp = [dataCompontent weekday];
    NSInteger hour_temp = [dataCompontent hour];
    NSInteger minute_temp = [dataCompontent minute];
    
   
    
    if (year_now == year_temp) {
        
        if (month_now == month_temp) {
            
            if (day_now == day_temp) {
                
                return [self HourAndMinuteDateStr:hour_temp and:minute_temp];
            }
            
            if (day_now-1 == day_temp) {
                
                return [self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
                
            }
            
            if((day_now - day_temp) > 1 && (day_now-day_temp) < week_now){

                return [self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
            }
            
            return [self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
        }
        
        
        NSDateComponents *comps = [calendar components:unitFlags fromDate:tempTime toDate:currentTime options:0];
        NSInteger cha_month = [comps month];
        NSInteger cha_day = [comps day];
        
        if (cha_month > 0 || cha_day >= week_now) {

            return [self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
        }
        
        if (cha_day == 1) {

            return [self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
        }
        
        return [self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
    }
    
    return [self YearAndHourAndMinuteDateStr:year_temp withM:month_temp withD:day_temp withH:hour_temp withM:minute_temp];
}//针对时间戳的

- (NSString *)ThtnewsDataWith:(NSString *)dataString{
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *tempTime = [dateFormatter1 dateFromString:dataString];
    
    dateFormatter1 = nil;
    
   // NSDate *currentTime = [NSDate date];
    // NSLog(@"time************%@  ********%@",tempTime, currentTime);
    
    //获取对应时间下的年 月 日 时 分 秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
   // NSDateComponents *dataCompontent_now = [calendar components:unitFlags fromDate:currentTime];
    NSDateComponents *dataCompontent = [calendar components:unitFlags fromDate:tempTime];
    
//    NSInteger year_now = [dataCompontent_now year];
//    NSInteger month_now = [dataCompontent_now month];
//    NSInteger day_now = [dataCompontent_now day];
//    NSInteger week_now = [dataCompontent_now weekdayOrdinal];
    
    NSInteger year_temp = [dataCompontent year];
    NSInteger month_temp = [dataCompontent month];
    NSInteger day_temp = [dataCompontent day];
    NSInteger week_temp = [dataCompontent weekday];
    NSInteger hour_temp = [dataCompontent hour];
    NSInteger minute_temp = [dataCompontent minute];
    
    NSArray *weekarr = [NSArray arrayWithObjects:@"周日",@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSString  *ster;
    
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"%ld年%ld月%ld日 (%@)凌晨0%ld:%@%ld",year_temp,month_temp,day_temp, [weekarr objectAtIndex:week_temp-1],hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        // ster = [NSString stringWithFormat:@"0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"%ld年%ld月%ld日 (%@)上午%@%ld:%@%ld",year_temp,month_temp,day_temp, [weekarr objectAtIndex:week_temp-1],(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >=10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"%@%ld:%@%ld",(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >=10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"%ld年%ld月%ld日 (%@)中午%ld:%@%ld",year_temp,month_temp,day_temp, [weekarr objectAtIndex:week_temp-1],hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"%ld年%ld月%ld日 (%@)下午0%ld:%@%ld",year_temp,month_temp,day_temp, [weekarr objectAtIndex:week_temp-1],(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    
    ster = [NSString stringWithFormat:@"%ld年%ld月%ld日 (%@)晚上%@%ld:%@%ld",year_temp,month_temp,day_temp, [weekarr objectAtIndex:week_temp-1],((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    
    return ster;
}

- (NSString*)ShowDateWithTheAppropriateStyle:(NSString *)DateString{
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *tempTime = [dateFormatter1 dateFromString:DateString];
    
    dateFormatter1 = nil;
    
    NSDate *currentTime = [NSDate date];
   // NSLog(@"time************%@  ********%@",tempTime, currentTime);
    
    //获取对应时间下的年 月 日 时 分 秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *dataCompontent_now = [calendar components:unitFlags fromDate:currentTime];
    NSDateComponents *dataCompontent = [calendar components:unitFlags fromDate:tempTime];
    
    NSInteger year_now = [dataCompontent_now year];
    NSInteger month_now = [dataCompontent_now month];
    NSInteger day_now = [dataCompontent_now day];
    NSInteger week_now = [dataCompontent_now weekdayOrdinal];
    
    
    
    NSInteger year_temp = [dataCompontent year];
    NSInteger month_temp = [dataCompontent month];
    NSInteger day_temp = [dataCompontent day];
    NSInteger week_temp = [dataCompontent weekday];
    NSInteger hour_temp = [dataCompontent hour];
    NSInteger minute_temp = [dataCompontent minute];
    
    // NSLog(@"*******%d    %d   %d   %d    ",[dataCompontent_now weekdayOrdinal], [dataCompontent_now weekday], [dataCompontent weekdayOrdinal], [dataCompontent weekday]);
    
    if (year_now == year_temp) {
        
        if (month_now == month_temp) {
            
            if (day_now == day_temp) {
                
                 return [self HourAndMinuteDateStr:hour_temp and:minute_temp];
            }
            
            if (day_now-1 == day_temp) {
                
                return [self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
                
            }
            
            if((day_now - day_temp) > 1 && (day_now-day_temp) < week_now){

                 return [self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
            }
            
             return [self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
            
        }
        
        
        NSDateComponents *comps = [calendar components:unitFlags fromDate:tempTime toDate:currentTime options:0];
        NSInteger cha_month = [comps month];
        NSInteger cha_day = [comps day];
        
        if (cha_month > 0 || cha_day >= week_now) {

             return [self MonthAndHourAndMinuteDateStr:month_temp with:day_temp and:hour_temp andwith:minute_temp];
        }
        
        if (cha_day == 1) {
            
              return [self DayAndHourAndMinuteDateStr:hour_temp and:minute_temp];
        }
        
        return [self WeeKAndHourAndMinuteDateStr:week_temp with:hour_temp and:minute_temp];
    }
    
    return [self YearAndHourAndMinuteDateStr:year_temp withM:month_temp withD:day_temp withH:hour_temp withM:minute_temp];
}//针对日期的

//计算到小时的日期
- (NSString *)HourAndMinuteDateStr:(NSInteger)hour_temp and:(NSInteger)minute_temp{
    NSString *ster = nil;
    
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"凌晨0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        // ster = [NSString stringWithFormat:@"0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"上午%@%ld:%@%ld",(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >=10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"%@%ld:%@%ld",(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >=10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"中午%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"下午0%ld:%@%ld",(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        //ster = [NSString stringWithFormat:@"0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    ster = [NSString stringWithFormat:@"晚上%@%ld:%@%ld",((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
//    ster = [NSString stringWithFormat:@"%@%ld:%@%ld",((hour_temp-12) >= 10 ? @"":@"0"),hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    return ster;
}

//计算到天
-(NSString *)DayAndHourAndMinuteDateStr:(NSInteger)hour_temp and:(NSInteger)minute_temp{
    NSString *ster = nil;
    
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"昨天 凌晨0%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"昨天 上午%@%ld:%@%ld",(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"昨天 中午%ld:%@%ld",hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"昨天 下午0%ld:%@%ld",(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    ster = [NSString stringWithFormat:@"昨天 晚上%@%ld:%@%ld",((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    
    
    return ster;
}

//计算到周
- (NSString *)WeeKAndHourAndMinuteDateStr:(NSInteger)week_temp with:(NSInteger)hour_temp and:(NSInteger)minute_temp{
    NSString *ster = nil;
    NSArray *weekarr = [NSArray arrayWithObjects:@"周日",@"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"%@ 凌晨0%ld:%@%ld",[weekarr objectAtIndex:(week_temp-1)],hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"%@ 上午%@%ld:%@%ld",[weekarr objectAtIndex:(week_temp-1)],(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"%@ 中午%ld:%@%ld",[weekarr objectAtIndex:(week_temp-1)],hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"%@ 下午0%ld:%@%ld",[weekarr objectAtIndex:(week_temp-1)],(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    ster = [NSString stringWithFormat:@"%@ 晚上%@%ld:%@%ld",[weekarr objectAtIndex:(week_temp-1)],((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    weekarr = nil;
    
    //ster = [NSString stringWithFormat:@"%@",[weekarr objectAtIndex:(week_temp-1)]];
    
    return ster;
    
}

//计算到月
- (NSString *)MonthAndHourAndMinuteDateStr:(NSInteger)month_temp with:(NSInteger)day_temp and:(NSInteger)hour_temp andwith:(NSInteger)minute_temp{
    NSString *ster = nil;
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"%@%ld月%@%ld日 凌晨0%ld:%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"%@%ld月%@%ld日 上午%@%ld:%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"%@%ld月%@%ld日 中午%ld:%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"%@%ld月%@%ld日 下午0%ld:%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    ster = [NSString stringWithFormat:@"%@%ld月%@%ld日 晚上%@%ld:%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    
//    ster = [NSString stringWithFormat:@"%@%ld/%@%ld",(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp];
    
    return ster;
    
}

//计算到年
- (NSString *)YearAndHourAndMinuteDateStr:(NSInteger)year_temp withM:(NSInteger)month_temp withD:(NSInteger)day_temp withH:(NSInteger)hour_temp withM:(NSInteger)minute_temp{
    NSString *ster = nil;
    if(hour_temp < 6 && hour_temp >=0){
        ster = [NSString stringWithFormat:@"%ld年%@%ld月%@%ld日 凌晨0%ld:%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,hour_temp,(minute_temp >= 10 ? @"":@"0"),minute_temp];
        return ster;
    }
    
    if (hour_temp >=6 && hour_temp <12){
        ster = [NSString stringWithFormat:@"%ld年%@%ld月%@%ld日 上午%@%ld:%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,(hour_temp >= 10 ? @"":@"0"),hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=12 && hour_temp <13){
        ster = [NSString stringWithFormat:@"%ld年%@%ld月%@%ld日 中午%ld:%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,hour_temp,(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    if (hour_temp >=13 && hour_temp < 18){
        ster = [NSString stringWithFormat:@"%ld年%@%ld月%@%ld日 下午0%ld:%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
        return ster;
    }
    
    ster = [NSString stringWithFormat:@"%ld年%@%ld月%@%ld日 晚上%@%ld:%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp,((hour_temp-12) >= 10 ? @"":@"0"),(hour_temp-12),(minute_temp >= 10 ? @"":@"0") ,minute_temp];
    
//    ster = [NSString stringWithFormat:@"%ld/%@%ld/%@%ld",year_temp,(month_temp >= 10 ? @"":@"0"),month_temp,(day_temp >= 10 ? @"":@"0"),day_temp];
    
    return ster;
    
}

@end
