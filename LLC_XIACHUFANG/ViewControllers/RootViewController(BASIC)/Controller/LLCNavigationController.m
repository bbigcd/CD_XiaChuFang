//
//  LLCNavigationController.m
//  LLC_XIACHUFANG
//
//  Created by bigcd on 16/9/12.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCNavigationController.h"

@interface LLCNavigationController ()

@end

@implementation LLCNavigationController
/**
 * 当第一次使用这个类的时候会调用一次
 */
+ (void)initialize{
    // 当导航栏用在LLCNavigationController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    // 属性带有appearance的对象，可以全局设置统一格式，而上述方法可以全局的同时局部差异。
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTranslucent:NO];//全局不透明
}

- (void)viewDidLoad {
    
}

@end
