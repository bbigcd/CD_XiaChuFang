//
//  LLCTemplate2Cell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/8.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCTemplate2Cell.h"

@implementation LLCTemplate2Cell

- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _bgImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_bgImageView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgImageView).mas_equalTo(@44);
            make.right.equalTo(_bgImageView).mas_equalTo(@-44);
            make.top.equalTo(_bgImageView).mas_equalTo(@80);
        }];
        
        _titleLabel.font = [UIFont systemFontOfSize:24];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;// 自动换行
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        [_bgImageView addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(@0);
            make.top.equalTo(_titleLabel.mas_bottom).mas_equalTo(@22);
        }];
        
        _numberLabel.font = [UIFont systemFontOfSize:16];
        _numberLabel.textColor = [UIColor whiteColor];
    }
    return _numberLabel;
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
