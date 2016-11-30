//
//  LLCActionView.h
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/29.
//  Copyright © 2016年 bbigcd. All rights reserved.
//  带有点击方法的UIView

#import <UIKit/UIKit.h>

@interface LLCActionView : UIView

/** 万能初始化方法*/
- (instancetype)initWithTitle:(NSString *)title;
/** 添加点击方法*/
- (void)addTarget:target action:(SEL)action;
/** 背景图为后台提供url*/
- (void)setupBackgroundImageWithUrl:(NSURL *)url;
/** 背景图为本地*/
- (void)setupBackgroundImageWithImage:(UIImage *)image withIconImage:(UIImage *)iconimage;

@end
