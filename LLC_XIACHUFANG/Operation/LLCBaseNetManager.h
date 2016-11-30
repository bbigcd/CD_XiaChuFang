//
//  LLCBaseNetManager.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/18.
//  Copyright © 2016年 bbigcd. All rights reserved.
//  AF是设计理念是网络请求应该共用一个manager

#import <Foundation/Foundation.h>
#import "Config.h"

@interface LLCBaseNetManager : NSObject


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;


+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;


/**
 *  为了应付某些服务器对于中文字符串不支持的情况，需要转化字符串为带有%号形势
 *
 *  @param path   请求的路径，即 ? 前面部分
 *  @param params 请求的参数，即 ? 号后面部分
 *
 *  @return 转化 路径+参数 拼接出的字符串中的中文为 % 号形势
 */
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params;

@end
