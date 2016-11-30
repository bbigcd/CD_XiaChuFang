//
//  LLCMainScrollView.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/28.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMainScrollView.h"
#import "UIImageView+WebCache.h"

@interface LLCMainScrollView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@end


@implementation LLCMainScrollView

- (instancetype)init{
    if (self = [super init]) {
        NSAssert(NO, @"请使用initWithFrame初始化");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).mas_offset(@10);
    }];
    
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.textColor = [UIColor grayColor];
    _numberLabel.font = [UIFont systemFontOfSize:kFontSize];
    [self addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_titleLabel.mas_bottom).mas_offset(@6);
    }];
    
    _leftImageView = [[UIImageView alloc] init];
    [self addSubview:_leftImageView];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(@16);
        make.bottom.equalTo(self).mas_offset(@-10);
        make.size.mas_offset(CGSizeMake(56, 56));
    }];
    
    _rightImageView = [[UIImageView alloc] init];
    [self addSubview:_rightImageView];
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(@-16);
        make.bottom.equalTo(self).mas_offset(@-10);
        make.size.mas_offset(CGSizeMake(56, 56));
    }];
    
    
}

- (void)setupTitleLabel:(NSString *)titleLabel withNumberLabel:(NSString *)numberLabel{
    self.titleLabel.text = [NSString stringWithFormat:@"一 %@ 一", titleLabel];
    self.numberLabel.text = [NSString stringWithFormat:@"%@作品", numberLabel];
}

- (void)setupLeftImage:(UIImage *)leftImage withRightImageUrl:(NSURL *)rightImageUrl{
    [self.leftImageView setImage:leftImage];
    [self.rightImageView sd_setImageWithURL:rightImageUrl placeholderImage:kPlaceholderImage];
}

@end
