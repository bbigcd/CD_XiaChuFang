//
//  LLCFirstRowCell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCFirstRowCell.h"
#import "UIButton+WebCache.h"

@implementation LLCFirstRowCell

- (UIButton *)leftBtn {
    if(_leftBtn == nil) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(@0);
            make.width.equalTo(@((ScreenWidth - 1) / 2));
        }];
        // label
        [self initWithTitle:@"本周流行菜谱" withSuperView:_leftBtn];
        
        // click
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if(_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(@0);
            make.width.equalTo(@((ScreenWidth - 1) / 2));
        }];
        
        // icon
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.rightBtn addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_rightBtn);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        iconImageView.image = [UIImage imageNamed:HomePageFirstCellRightIconImage];
        
        
        // label
        [self initWithTitle:@"查看好友并关注" withSuperView:_rightBtn];
        
        // click
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (void)leftBtnClick{
    NSLog(@"left");
}

- (void)rightBtnClick{
    NSLog(@"right");
}

- (void)firstRowCellBindReceiveImageViewURl:(NSString *)url{
    NSURL *URL = [NSURL URLWithString:url];
    [self.leftBtn sd_setImageWithURL:URL forState:UIControlStateNormal placeholderImage:kPlaceholderImage];
    
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:HomePageFirstCellRightImageView] forState:UIControlStateNormal];
}

- (void)initWithTitle:(NSString *)title withSuperView:(UIButton *)superView{
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
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
