//
//  LLCTools.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/27.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCTools.h"

@interface LLCTools()

@property (nonatomic, strong) NSString *week;

@end

@implementation LLCTools

+ (NSString *)getWeekDay:(NSDate *)date{
    // 用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"M月dd日"];
    // 得出某年某月 EEEE格式为英文礼拜数
    NSString *weekString = [dateFormatter stringFromDate:date];
    
    // 获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSDateComponents用于指定一个日期,提供时间组件组成一个日期和时间:小时,分钟,秒,日,月,年,等等
    // NSCalendarUnit枚举
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    // 获取传入日期是礼拜几，得到的是NSInteger（0->7）
    NSInteger week = [components weekday];
    // 转中文，拼接
    switch (week) {
        case 1:
            weekString = [weekString stringByAppendingString:@" 星期天"];
            break;
        case 2:
            weekString = [weekString stringByAppendingString:@" 星期一"];
            break;
        case 3:
            weekString = [weekString stringByAppendingString:@" 星期二"];
            break;
        case 4:
            weekString = [weekString stringByAppendingString:@" 星期三"];
            break;
        case 5:
            weekString = [weekString stringByAppendingString:@" 星期四"];
            break;
        case 6:
            weekString = [weekString stringByAppendingString:@" 星期五"];
            break;
        case 7:
            weekString = [weekString stringByAppendingString:@" 星期六"];
            break;
        default:
            break;
    }
    // 返回一个日期字符串, 例："9月27日 星期二"
    return weekString;
}

+ (NSString *)getDeviceSystemName{
    NSString *string = nil;
    NSString *systemNameString = [UIDevice currentDevice].systemName;
    NSArray *array = [systemNameString componentsSeparatedByString:@" "];
    string = [array[0] lowercaseString];
    return string;
}

+ (NSString *)getDeviceSystemUUIDString{
    NSString *string = nil;
    string = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return string;
}

@end
