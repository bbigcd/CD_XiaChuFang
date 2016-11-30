//
//  LLCVerticalButton.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/26.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCVerticalButton.h"

@implementation LLCVerticalButton

- (void)setup
{
    // 去点击高亮
    self.adjustsImageWhenHighlighted = NO;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// 强制使用initWithFrame初始化
- (instancetype)init{
    if (self = [super init]) {
//        NSAssert(NO, @"please use initWithFrame");
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

// 在xib中
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

// 重写布局
- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = ((ScreenWidth / 4) - 45) / 2;
    self.imageView.y = self.height * 0.1;
    self.imageView.width = 45;
    self.imageView.height = 45;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.height * 0.45;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:kFontSize];
}


@end
