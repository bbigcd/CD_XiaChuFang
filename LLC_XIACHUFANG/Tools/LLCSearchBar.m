//
//  LLCSearchBar.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/26.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCSearchBar.h"

@implementation LLCSearchBar

+ (LLCSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder{
    // 1.初始化
    LLCSearchBar *searchBar = [[LLCSearchBar alloc]init];
    
    // 2.设置图片
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"]
       forSearchBarIcon:UISearchBarIconSearch
                  state:UIControlStateNormal];
    
    // 3.设置占位符字和闪烁条的颜色
    [searchBar setTintColor:[UIColor searchBarTintColorBackgoundColor]];
    searchBar.placeholder = placeholder;
    
    // 4.设置背景色
    UIView *searchBarSub = searchBar.subviews[0];
    for (UIView *subView in searchBarSub.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            [subView setBackgroundColor:kLLCColorWithRGB(247, 247, 240)];
        }
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subView removeFromSuperview];
        }
    }
    
    return searchBar;
}

@end
