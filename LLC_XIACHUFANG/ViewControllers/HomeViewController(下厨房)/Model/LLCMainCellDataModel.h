//
//  LLCMainCellDataModel.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/7.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark --一级model--

@class LLCMainCellDataContentModel;

@interface LLCMainCellDataModel : NSObject

@property (nonatomic, strong) LLCMainCellDataContentModel *content;
@property (nonatomic, copy) NSString *status;

@end

#pragma mark --二级model--

@class LLCMainCellDataContentCursorModel,LLCMainCellDataContentIssuesModel;
@interface LLCMainCellDataContentModel : NSObject

@property (nonatomic, strong) LLCMainCellDataContentCursorModel *cursor;
@property (nonatomic, strong) NSArray<LLCMainCellDataContentIssuesModel *> *issues;
@property (nonatomic, copy) NSString *count;

@end


#pragma mark --三级model--

@interface LLCMainCellDataContentCursorModel : NSObject

@property (nonatomic, copy) NSString *has_next;
@property (nonatomic, copy) NSString *has_prev;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, copy) NSString *prev;

@end

@class LLCMainCellDataContentIssuesItemsModel,LLCMainCellDataContentIssuesToday_eventsModel;

@interface LLCMainCellDataContentIssuesModel : NSObject

@property (nonatomic, copy) NSString *issue_id;
@property (nonatomic, copy) NSString *items_count;
@property (nonatomic, copy) NSString *publish_date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<LLCMainCellDataContentIssuesItemsModel *> *items;
@property (nonatomic, strong) NSArray<LLCMainCellDataContentIssuesToday_eventsModel *> *today_events;

@end

#pragma mark --四级model--

@class LLCMainCellDataContentIssuesItemsContentsModel;

@interface LLCMainCellDataContentIssuesItemsModel : NSObject

@property (nonatomic, copy) NSString *column_name;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *publish_time;
@property (nonatomic, copy) NSString *kTemplate;
@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) LLCMainCellDataContentIssuesItemsContentsModel *contents;

@end

@interface LLCMainCellDataContentIssuesToday_eventsModel : NSObject


@end

#pragma mark --五级model--

@class LLCMainCellDataContentIssuesItemsContentsImageModel,LLCMainCellDataContentIssuesItemsContentsAuthorModel;

@interface LLCMainCellDataContentIssuesItemsContentsModel : NSObject

@property (nonatomic, copy) NSString *title_1st;
@property (nonatomic, copy) NSString *title_2nd;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *n_cooked;
@property (nonatomic, copy) NSString *n_dishes;
@property (nonatomic, copy) NSString *recipe_id;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *n_discussions;
@property (nonatomic, copy) NSString *salon_id;
@property (nonatomic, copy) NSString *whisper;

@property (nonatomic, strong) LLCMainCellDataContentIssuesItemsContentsAuthorModel *author;
@property (nonatomic, strong) LLCMainCellDataContentIssuesItemsContentsImageModel *image;

@end

#pragma mark --六级model--

@interface LLCMainCellDataContentIssuesItemsContentsImageModel : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;

@end

@interface LLCMainCellDataContentIssuesItemsContentsAuthorModel : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *photo;

@end