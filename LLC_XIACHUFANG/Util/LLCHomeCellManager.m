//
//  LLCHomeCellManager.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCHomeCellManager.h"
#import "LLCMainCellDataModel.h"
#import "LLCFirstRowCell.h"
#import "LLCSecondRowCell.h"
#import "LLCThirdRowCell.h"
#import "LLCTemplate1Cell.h"
#import "LLCTemplate2Cell.h"
#import "LLCTemplate4Cell.h"
#import "LLCTemplate5Cell.h"
#import "LLCTemplate6Cell.h"
#import "LLCTemplate9Cell.h"
#import "LLCMainDataModel.h"

static CGFloat const kTemplate1CellHeight = 270;
static CGFloat const kTemplate2CellHeight = 220;
static CGFloat const kTemplate4CellHeight = 320;
static CGFloat const kTemplate5CellHeight = 250;
static CGFloat const kTemplate6CellHeight = 250;
static CGFloat const kTemplate9CellHeight = 250;


NSString * const kFirstCellID = @"kFirstCellID";
NSString * const kSecondCellID = @"kSecondCellID";
NSString * const kThirdCellID = @"kThirdCellID";
NSString * const kTemplate1CellID = @"kTemplate1CellID";
NSString * const kTemplate2CellID = @"kTemplate2CellID";
NSString * const kTemplate4CellID = @"kTemplate4CellID";
NSString * const kTemplate5CellID = @"kTemplate5CellID";
NSString * const kTemplate6CellID = @"kTemplate6CellID";
NSString * const kTemplate9CellID = @"kTemplate9CellID";

@implementation LLCHomeCellManager


+ (CGFloat)heightOfTableViewCellWithModel:(LLCMainCellDataContentIssuesItemsModel *)model{
    NSInteger index = [model.kTemplate integerValue];
    switch (index) {
        case 1:
            return kTemplate1CellHeight;
            break;
        case 2:
            return kTemplate2CellHeight;
            break;
        case 4:
            return kTemplate4CellHeight;
            break;
        case 5:
            return kTemplate5CellHeight;
            break;
        case 6:
            return kTemplate6CellHeight;
            break;
        case 9:
            return kTemplate9CellHeight;
            break;
        default:
            return 0;
            break;
    }
}

+ (NSString *)cellIDWithReceiveModel:(LLCMainCellDataContentIssuesItemsModel *)model{
    NSInteger index = [model.kTemplate integerValue];
    switch (index) {
        case 1:
            return kTemplate1CellID;
            break;
        case 2:
            return kTemplate2CellID;
            break;
        case 4:
            return kTemplate4CellID;
            break;
        case 5:
            return kTemplate5CellID;
            break;
        case 6:
            return kTemplate6CellID;
            break;
        case 9:
            return kTemplate9CellID;
            break;
        default:
            return kTemplate1CellID;
            break;
    }
}


+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView
                            withCellID:(NSString *)cellID
                       withReceiveItem:(id)receiveModel
                         withIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LLCFirstRowCell *cell = (LLCFirstRowCell *)[tableView dequeueReusableCellWithIdentifier:kFirstCellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            LLCContentModel *model = receiveModel;
            [cell firstRowCellBindReceiveImageViewURl:model.pop_recipe_picurl];
            return cell;
        }else if(indexPath.row == 1){
            LLCSecondRowCell *cell = (LLCSecondRowCell *)[tableView dequeueReusableCellWithIdentifier:kSecondCellID];
            LLCContentNavsModel *model = receiveModel;
            [cell setupWithModel:model];
            return cell;
        }else{
            LLCThirdRowCell *cell = (LLCThirdRowCell *)[tableView dequeueReusableCellWithIdentifier:kThirdCellID];
            
            return cell;
        }
    }else
    {
        if ([cellID isEqualToString: kTemplate1CellID]) {
            LLCTemplate1Cell *cell = (LLCTemplate1Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];

            return cell;
        }
        
        if ([cellID isEqualToString: kTemplate2CellID]) {
            LLCTemplate2Cell *cell = (LLCTemplate2Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            
            return cell;
        }
        
        if ([cellID isEqualToString: kTemplate4CellID]) {
            LLCTemplate4Cell *cell = (LLCTemplate4Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            
            return cell;
        }
        
        if ([cellID isEqualToString: kTemplate5CellID]) {
            LLCTemplate5Cell *cell = (LLCTemplate5Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            
            return cell;
        }
        
        if ([cellID isEqualToString: kTemplate6CellID]) {
            LLCTemplate6Cell *cell = (LLCTemplate6Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            
            return cell;
        }
        
        if ([cellID isEqualToString: kTemplate9CellID]) {
            LLCTemplate9Cell *cell = (LLCTemplate9Cell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            
            return cell;
        }
    }
    
    return nil;
}

#pragma mark -- action method --
- (void)test{
    NSLog(@"点击了按钮");
}

@end
