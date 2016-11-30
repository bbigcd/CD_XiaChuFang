//
//  LLCMainDataModel.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/4.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark --一级model--
// 向前声明类型
@class LLCContentModel;

@interface LLCMainDataModel : NSObject
/** 状态码*/
@property (nonatomic, copy) NSString *status;
/** 内容*/
@property (nonatomic, strong) LLCContentModel *content;

@end

#pragma mark --二级model--
@class LLCContentNavsModel, LLCContentPopEventsModel;

@interface LLCContentModel : NSObject
/** 主页左上角图片url*/
@property (nonatomic, copy) NSString *pop_recipe_picurl;

@property (nonatomic, strong) NSArray<LLCContentNavsModel *> *navs;

@property (nonatomic, strong) LLCContentPopEventsModel *pop_events;

@end

#pragma mark --三级model--

@interface LLCContentNavsModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picurl;
@property (nonatomic, copy) NSString *url;

@end

@class LLCContentPopEventsEventsModel;
@interface LLCContentPopEventsModel : NSObject

@property (nonatomic, copy) NSString *count;
@property (nonatomic, strong) NSArray<LLCContentPopEventsEventsModel *> *events;

@end

#pragma mark --四级model--
@class LLCContentPopEventsEventsDishesModel,LLCContentPopEventsEventsCustomizationModel;

@interface LLCContentPopEventsEventsModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *n_dishes;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) LLCContentPopEventsEventsDishesModel *dishes;
@property (nonatomic, strong) LLCContentPopEventsEventsCustomizationModel *customization;


@end

#pragma mark --五级model--
@class LLCContentPopEventsEventsDishesDishesModel;

@interface LLCContentPopEventsEventsDishesModel : NSObject

@property (nonatomic, strong) NSArray<LLCContentPopEventsEventsDishesDishesModel *> *dishes;

@end


@interface LLCContentPopEventsEventsCustomizationModel : NSObject

@end

#pragma mark --六级model--

@interface LLCContentPopEventsEventsDishesDishesModel : NSObject

@property (nonatomic, copy) NSString *thumbnail_280;

@end