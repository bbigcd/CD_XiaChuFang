//
//  LLCMeInforHorizontalButton.m
//  LLC_XIACHUFANG
//
//  Created by bigcd on 16/9/13.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMeInforHorizontalButton.h"

@implementation LLCMeInforHorizontalButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

// 在xib中的初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// 重写布局，主要是调整文字中的数字
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger titleLabelLength = self.titleLabel.text.length;
    NSRange range = NSMakeRange(0, titleLabelLength - 2);
    
    NSString *titleLabel = self.titleLabel.text;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:titleLabel];
    //设置：数字显示成橙色
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor meInformationButtonStringColor] range:range];
    titleLabel = [str copy];
    self.titleLabel.text = titleLabel;

}

@end
