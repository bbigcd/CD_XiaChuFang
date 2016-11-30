//
//  LLCFirstRowCell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCFirstRowCell.h"


@interface LLCFirstRowCell ()



@end

@implementation LLCFirstRowCell

- (UIImageView *)leftImageView {
    if(_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(@0);
            make.width.equalTo(@((ScreenWidth - 1) / 2));
        }];
        // label
        [self initWithTitle:@"本周流行菜谱" withSuperView:self.leftImageView];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView {
    if(_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(@0);
            make.width.equalTo(@((ScreenWidth - 1) / 2));
        }];
        
        // icon
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.rightImageView addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.rightImageView);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        iconImageView.image = [UIImage imageNamed:HomePageFirstCellRightIconImage];
        
        
        // label
        [self initWithTitle:@"查看好友并关注" withSuperView:self.rightImageView];
    }
    return _rightImageView;
}

- (void)firstRowCellBindReceiveImageViewURl:(NSString *)url{
    NSURL *URL = [NSURL URLWithString:url];
    [self.leftImageView sd_setImageWithURL:URL placeholderImage:kPlaceholderImage];
    
    self.rightImageView.image = [UIImage imageNamed:HomePageFirstCellRightImageView];
}

- (void)initWithTitle:(NSString *)title withSuperView:(UIImageView *)superView{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    [superView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(superView).mas_equalTo(@-15);
        make.centerX.equalTo(superView);
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
