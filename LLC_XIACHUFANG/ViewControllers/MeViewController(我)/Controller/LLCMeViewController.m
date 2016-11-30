//
//  LLCMeViewController.m
//  LLC_XIACHUFANG
//
//  Created by bigcd on 16/9/10.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCMeViewController.h"
#import "LLCMeInforHorizontalButton.h"

@interface LLCMeViewController ()
<UITableViewDelegate,
UITableViewDataSource>

/** UITableView */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LLCMeViewController

static NSString * const ID = @"Cell";

- (UITableView *)tableView {
    if(_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        [_tableView setRowHeight:(ScreenHeight - 108) * 0.576f];
        [_tableView setSectionHeaderHeight:50];
        [_tableView setTableFooterView:[[UIView alloc] init]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    
    [self setupNavigationBarItem];
    [self setupTableHeadView];
    
    [self.tableView reloadData];
    
    
    
}

#pragma mark -- UIViewController --

- (void)setupNavigationBarItem
{
    UIBarButtonItem *addFriendItem = [UIBarButtonItem itemWithImage:@"navFindFriendsImage" target:self action:@selector(rightBarButtonItemLeft)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"rightPageSetting" target:self action:@selector(rightBarButtonItemsRight)];
    self.navigationItem.rightBarButtonItems = @[settingItem, addFriendItem];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"homepageCreateRecipeButton" target:self action:@selector(leftBarButtonItem)];
}

- (void)setupTableHeadView
{
    CGFloat headViewHeight = (ScreenHeight - 108) * 0.424f;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, headViewHeight)];
    view.backgroundColor = [UIColor meInformationTopBackgroundColor];
    self.tableView.tableHeaderView = view;
    
    LLCMeInforHorizontalButton *but = [[LLCMeInforHorizontalButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    [but setTitle:@"100关注" forState:UIControlStateNormal];
    
//    [view addSubview:but];
}










#pragma mark -- UITableViewDataSource --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = @"joe7";
    return cell;
}

#pragma mark -- UIBarButtonItem -- action

- (void)leftBarButtonItem
{
    
}

- (void)rightBarButtonItemLeft
{
    
}

- (void)rightBarButtonItemsRight
{
    
}


@end
