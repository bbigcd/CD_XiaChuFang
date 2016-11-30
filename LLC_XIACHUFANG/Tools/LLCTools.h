//
//  LLCTools.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/27.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCTools : NSObject
/*
 *  @return 获取传入日期属于礼拜几
 */
+ (NSString *)getWeekDay:(NSDate *)date;
/*
 *  @return 返回设备名字的小写，用于网络请求传设备系统类型
 */
+ (NSString *)getDeviceSystemName;
/*
 *  @return 返回设备名字的小写，用于网络请求传设备系统类型
 */
+ (NSString *)getDeviceSystemUUIDString;
@end
