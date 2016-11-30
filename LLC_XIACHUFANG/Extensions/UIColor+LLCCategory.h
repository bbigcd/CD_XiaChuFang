//
//  UIColor+LLCCategory.h
//  LLC_XIACHUFANG
//
//  Created by bigcd on 16/9/11.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LLCCategory)
/*
 *  @return 底部tabBar被选中颜色
 */
+ (UIColor *)tabBarIconSeletedColor;
/**
 *  @return 我界面个人资料头部背景颜色
 */
+ (UIColor *)meInformationTopBackgroundColor;
/**
 *  @return 我界面个人资料底部背景颜色
 */
+ (UIColor *)meInformationBottomBackgroundColor;
/**
 *  @return 我界面个人资料Button文字中数字颜色
 */
+ (UIColor *)meInformationButtonStringColor;
/**
 *  @return 主页和信箱界面背景色
 */
+ (UIColor *)homeAndMailBoxBackgoundColor;
/**
 *  @return 搜索框背景色
 */
+ (UIColor *)searchBarTintColorBackgoundColor;
/**
 *  @return pageControl的选中颜色
 */
+ (UIColor *)cCurrentPageIndicatorTintColor;
/**
 *  @return pageControl的未选中颜色
 */
+ (UIColor *)cPageIndicatorTintColor;

@end
