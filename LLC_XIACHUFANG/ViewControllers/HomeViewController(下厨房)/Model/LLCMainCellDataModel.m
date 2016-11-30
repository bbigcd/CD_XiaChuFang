//
//  LLCMainCellDataModel.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/7.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainCellDataModel.h"

#pragma mark --一级model--

@implementation LLCMainCellDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : @"LLCMainCellDataContentModel"};
}

@end

#pragma mark --二级model--

@implementation LLCMainCellDataContentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cursor" : @"LLCMainCellDataContentCursorModel",
             @"issues" : [LLCMainCellDataContentIssuesModel class]};
}

@end


#pragma mark --三级model--

@implementation LLCMainCellDataContentCursorModel

@end

@implementation LLCMainCellDataContentIssuesModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"items" : [LLCMainCellDataContentIssuesItemsModel class],
             @"today_events" : [LLCMainCellDataContentIssuesToday_eventsModel class]};
}

@end

#pragma mark --四级model--

@implementation LLCMainCellDataContentIssuesItemsModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID" : @"id",
             @"kTemplate" : @"template"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : @"LLCMainCellDataContentIssuesItemsContentsModel"};
}

@end

@implementation LLCMainCellDataContentIssuesToday_eventsModel


@end

#pragma mark --五级model--

@implementation LLCMainCellDataContentIssuesItemsContentsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"author" : @"LLCMainCellDataContentIssuesItemsContentsAuthorModel",
             @"image" : @"LLCMainCellDataContentIssuesItemsContentsImageModel"};
}

@end

#pragma mark --六级model--

@implementation LLCMainCellDataContentIssuesItemsContentsImageModel


@end

@implementation LLCMainCellDataContentIssuesItemsContentsAuthorModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}

@end
