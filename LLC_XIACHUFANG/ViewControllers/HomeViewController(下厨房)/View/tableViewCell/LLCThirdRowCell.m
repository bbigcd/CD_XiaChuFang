//
//  LLCThirdRowCell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCThirdRowCell.h"

@implementation LLCThirdRowCell

- (UIScrollView *)scrollView {
    if(_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [self.contentView addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        _scrollView.contentSize = CGSizeMake(ScreenWidth + 2, _scrollView.height);
    }
    return _scrollView;
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
