//
//  LLCHomeCellManager.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const kFirstCellID;
UIKIT_EXTERN NSString * const kSecondCellID;
UIKIT_EXTERN NSString * const kThirdCellID;
UIKIT_EXTERN NSString * const kTemplate1CellID;
UIKIT_EXTERN NSString * const kTemplate2CellID;
UIKIT_EXTERN NSString * const kTemplate4CellID;
UIKIT_EXTERN NSString * const kTemplate5CellID;
UIKIT_EXTERN NSString * const kTemplate6CellID;
UIKIT_EXTERN NSString * const kTemplate9CellID;

@class LLCMainCellDataContentIssuesItemsModel;

@interface LLCHomeCellManager : NSObject

+ (CGFloat)heightOfTableViewCellWithModel:(LLCMainCellDataContentIssuesItemsModel *)model;

+ (NSString *)cellIDWithReceiveModel:(LLCMainCellDataContentIssuesItemsModel *)model;

+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView
                            withCellID:(NSString *)cellID
                       withReceiveItem:(id)receiveModel
                         withIndexPath:(NSIndexPath *)indexPath;
@end
