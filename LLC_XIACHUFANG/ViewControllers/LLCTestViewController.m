//
//  LLCTestViewController.m
//  LLC_XIACHUFANG
//
//  Created by chendi on 16/9/29.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCTestViewController.h"
#import "LLCActionView.h"

@interface LLCTestViewController ()

@end

@implementation LLCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    CGRect frame = CGRectMake(0, 64, ScreenWidth / 2, 110);
//    UIImage *image1 = [UIImage imageNamed:@"xiachufang_tab_big_icon"];
//    UIImage *image2 = [UIImage imageNamed:@"feedsNoFriendsIcon"];
//    NSString *urlString = @"http://s2.cdn.xiachufang.com/40dbc27a894911e6a9a10242ac110002_1614w_1080h.jpg?imageView2/1/w/280/h/216/interlace/1/q/90";
//    LLCActionView *view = [[LLCActionView alloc] initWithFrame:frame title:@"本周菜谱" backgroundImageUrl:[NSURL URLWithString:urlString] rightIconImage:image1];
//    [view addTarget:self action:@selector(selectorClick)];
//    [self.view addSubview:view];
    
    
}

- (void)selectorClick{
    NSLog(@"0000");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
