//
//  LLCMainDataModel.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/4.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainDataModel.h"

#pragma mark --一级model--
@implementation LLCMainDataModel

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : @"LLCContentModel"};
}


@end

#pragma mark --二级model--
@implementation LLCContentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"navs" : [LLCContentNavsModel class],
             @"content" : @"LLCContentPopEventsModel"};
}

@end


#pragma mark --三级model--

@implementation LLCContentNavsModel


@end

@implementation LLCContentPopEventsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"events" : [LLCContentPopEventsEventsModel class]};
}

@end

#pragma mark --四级model--

@implementation LLCContentPopEventsEventsModel
// 由于id是系统的关键字，所以需要作出替换
// 将model属性名映射到JSON的Key
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"dishes" : @"LLCContentPopEventsEventsDishesModel",
             @"customization" : @"LLCContentPopEventsEventsCustomizationModel"};
}


@end

#pragma mark --五级model--

@implementation LLCContentPopEventsEventsDishesModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"dishes" : [LLCContentPopEventsEventsDishesDishesModel class]};
}

@end


@implementation LLCContentPopEventsEventsCustomizationModel

@end

#pragma mark --六级model--

@implementation LLCContentPopEventsEventsDishesDishesModel


@end