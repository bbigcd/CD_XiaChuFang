//
//  LLCActionView.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/29.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCActionView.h"
#import "UIButton+WebCache.h"

@interface LLCActionView ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImageView *rightIconImageView;

@property (nonatomic, assign) SEL action;
@property (nonatomic, weak) id target;

@end

@implementation LLCActionView


- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        self.title = title;
        [self setupButton];
        [self setupLabelAndImageView];
    }
    return self;
}

- (void)setupButton{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = self.bounds;
    [self.button setAdjustsImageWhenHighlighted:NO];//去点击变暗
    
    [self addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)setupLabelAndImageView{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.text = self.title;
    [self.button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.button).mas_equalTo(@-15);
        make.centerX.equalTo(self.button);
    }];
    
    if ([self.title isEqualToString:@"查看好友并关注"]) {
        self.rightIconImageView = [[UIImageView alloc] init];
        
        [self.button addSubview:_rightIconImageView];
        
        [_rightIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(label.mas_top).mas_equalTo(@-15);
            make.centerX.mas_equalTo(self.button);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }
}



- (void)buttonAction {
    // 执行action
    [self.target performSelector:self.action withObject:self afterDelay:0];
}

// target-action回调
- (void)addTarget:(id)target action:(SEL)action {
    self.target = target;
    self.action = action;
}


- (void)setupBackgroundImageWithUrl:(NSURL *)url{
    [self.button sd_setBackgroundImageWithURL:url
                                     forState:UIControlStateNormal
                             placeholderImage:kPlaceholderImage];
}

- (void)setupBackgroundImageWithImage:(UIImage *)image withIconImage:(UIImage *)iconimage{
    [self.button setBackgroundImage:image forState:UIControlStateNormal];
    [self.rightIconImageView setImage:iconimage];
}

// *初始化两次之后点击混乱，注释这两个方法没事了
// 重写下面两个方法，防止View的点击事件被其它View覆盖
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *reView = [super hitTest:point withEvent:event];
//    
//    CGPoint point1 = [self.button convertPoint:point1 toView:self];
//    if ([self.button hitTest:point1 withEvent:event]) {
//        return self.button;
//    }
//    return reView;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    [super pointInside:point withEvent:event];
//    return YES;
//}

@end
