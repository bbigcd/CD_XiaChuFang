//
//  LLCFirstRowCell.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLCFirstRowCell : UITableViewCell

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

- (void)firstRowCellBindReceiveImageViewURl:(NSString *)url;


@end
