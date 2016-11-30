//
//  LLCTemplate2Cell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/8.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCTemplate1Cell.h"

@implementation LLCTemplate1Cell


- (UILabel *)testLabel {
    if(_testLabel == nil) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.text = @"哈哈";
        [self.contentView addSubview:_testLabel];
        [_testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
        }];
    }
    return _testLabel;
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
