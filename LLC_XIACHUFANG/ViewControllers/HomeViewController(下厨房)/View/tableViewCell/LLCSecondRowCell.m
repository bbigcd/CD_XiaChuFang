//
//  LLCSecondRowCell.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/10/9.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCSecondRowCell.h"
#import "LLCMainDataModel.h"


@implementation LLCSecondRowCell

- (UIScrollView *)scrollView {
    if(_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [self.contentView addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        _scrollView.backgroundColor = [UIColor homeAndMailBoxBackgoundColor];
    }
    return _scrollView;
}

// 调用方法
- (void)setupWithModel:(LLCContentModel *)model{
    self.scrollView.contentSize = CGSizeMake(ScreenWidth + 2, _scrollView.height);
    [self setupWithButton:self.but1 WithTag:100 WithTitle:model.navs[0].name WithImageUrl:model.navs[0].picurl];
    [self setupWithButton:self.but2 WithTag:200 WithTitle:model.navs[1].name WithImageUrl:model.navs[1].picurl];
    [self setupWithButton:self.but3 WithTag:300 WithTitle:model.navs[2].name WithImageUrl:model.navs[2].picurl];
    [self setupWithButton:self.but4 WithTag:400 WithTitle:model.navs[3].name WithImageUrl:model.navs[3].picurl];
}


// button 的公共设置
- (void)setupWithButton:(UIButton *)button
                WithTag:(NSInteger)tag
              WithTitle:(NSString *)title
           WithImageUrl:(NSString *)urlString{
    [button setTag:tag];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:title forState:UIControlStateNormal];
    NSURL *url = [NSURL URLWithString:urlString];
    [button.imageView sd_setImageWithURL:url placeholderImage:kPlaceholderImage];
    [button addTarget:self action:@selector(buttonsTapManager:) forControlEvents:UIControlEventTouchUpInside];
}


- (LLCVerticalButton *)but1 {
    if(_but1 == nil) {
        _but1 = [[LLCVerticalButton alloc] init];
        [self.scrollView addSubview:_but1];
        [_but1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth / 4, 90));
        }];
    }
    return _but1;
}

- (LLCVerticalButton *)but2 {
    if(_but2 == nil) {
        _but2 = [[LLCVerticalButton alloc] init];
        [self.scrollView addSubview:_but2];
        [_but2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.mas_equalTo(_but1.mas_right).equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth / 4, 90));
        }];
    }
    return _but2;
}

- (LLCVerticalButton *)but3 {
    if(_but3 == nil) {
        _but3 = [[LLCVerticalButton alloc] init];
        [self.scrollView addSubview:_but3];
        [_but3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.mas_equalTo(_but2.mas_right).equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth / 4, 90));
        }];
    }
    return _but3;
}

- (LLCVerticalButton *)but4 {
    if(_but4 == nil) {
        _but4 = [[LLCVerticalButton alloc] init];
        [self.scrollView addSubview:_but4];
        [_but4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.mas_equalTo(_but3.mas_right).equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth / 4, 90));
        }];
    }
    return _but4;
}

// 绑定的统一点击方法，根据tag分发
- (void)buttonsTapManager:(id)sender{
    if (![sender isKindOfClass:[UIButton class]]){
        return;
    }
    switch ([(UIButton *)sender tag]) {
        case 100:  [self onTapButton1];  return;
        case 200:  [self onTapButton2];  return;
        case 300:  [self onTapButton3];  return;
        case 400:  [self onTapButton4];  return;
    }
}

- (void)onTapButton1{
    NSLog(@"1");
}

- (void)onTapButton2{
    NSLog(@"2");
}

- (void)onTapButton3{
    NSLog(@"3");
}

- (void)onTapButton4{
    NSLog(@"4");
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
