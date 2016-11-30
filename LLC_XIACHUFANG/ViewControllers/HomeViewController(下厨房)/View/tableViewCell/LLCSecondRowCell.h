//
//  LLCSecondRowCell.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLCVerticalButton.h"

@class LLCContentNavsModel;
@interface LLCSecondRowCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) LLCVerticalButton *but1;
@property (nonatomic, strong) LLCVerticalButton *but2;
@property (nonatomic, strong) LLCVerticalButton *but3;
@property (nonatomic, strong) LLCVerticalButton *but4;

- (void)setupWithModel:(LLCContentNavsModel *)model;



@end
