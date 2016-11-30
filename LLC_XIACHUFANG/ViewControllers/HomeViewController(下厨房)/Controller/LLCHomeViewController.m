//
//  LLCHomeViewController.m
//  LLC_XIACHUFANG
//
//  Created by bbigcd on 16/9/6.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "LLCHomeViewController.h"
#import "LLCSearchBar.h"
#import "LLCActionView.h"
#import "LLCMainScrollView.h"
#import "LLCVerticalButton.h"
#import "LLCMainDataModel+LLCRequest.h"
#import "LLCMainCellDataModel+LLCRequest.h"
#import "UIImageView+WebCache.h"

#import "LLCFirstRowCell.h"
#import "LLCSecondRowCell.h"
#import "LLCThirdRowCell.h"
#import "LLCTemplate1Cell.h"
#import "LLCTemplate2Cell.h"
#import "LLCTemplate4Cell.h"
#import "LLCTemplate5Cell.h"
#import "LLCTemplate6Cell.h"
#import "LLCTemplate9Cell.h"

#import "LLCHomeCellManager.h"

@interface LLCHomeViewController ()
<UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate,
UIScrollViewDelegate>
{
    LLCMainDataModel *mainDataModel;
    LLCMainCellDataModel *mainCellDataModel;
}
@property (nonatomic, strong) UITableView *tableView;
/** UIPageControl*/
@property (nonatomic, strong) UIPageControl *pageControl;
/** 第二个srollView*/
@property (nonatomic, strong) UIScrollView *secondScrollView;


@end

@implementation LLCHomeViewController

/**
 *  懒加载的好处，当内存不足时，一些懒加载的资源会在需用用到的时候重新分配内存
 */
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerClass:[LLCFirstRowCell  class] forCellReuseIdentifier:kFirstCellID];
        [_tableView registerClass:[LLCSecondRowCell class] forCellReuseIdentifier:kSecondCellID];
        [_tableView registerClass:[LLCThirdRowCell  class] forCellReuseIdentifier:kThirdCellID];
        [_tableView registerClass:[LLCTemplate1Cell class] forCellReuseIdentifier:kTemplate1CellID];
        [_tableView registerClass:[LLCTemplate2Cell class] forCellReuseIdentifier:kTemplate2CellID];
        [_tableView registerClass:[LLCTemplate4Cell class] forCellReuseIdentifier:kTemplate4CellID];
        [_tableView registerClass:[LLCTemplate5Cell class] forCellReuseIdentifier:kTemplate5CellID];
        [_tableView registerClass:[LLCTemplate6Cell class] forCellReuseIdentifier:kTemplate6CellID];
        [_tableView registerClass:[LLCTemplate9Cell class] forCellReuseIdentifier:kTemplate9CellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加搜索框
    LLCSearchBar *searchBar = [LLCSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    [self.navigationItem setTitleView:searchBar];
    [self setupNavigationBarItem];
    
//    [self tableView];//先为tableView分配内存空间（实例化）
    
    // 下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                     refreshingAction:@selector(MJRefreshTableViewData)];
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
}

// 下拉刷新触发方法
- (void)MJRefreshTableViewData{
    // 由于首页有两个接口请求，分别是头部信息请求，和Cell内容请求
    // 使用队列请求方式较好
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [LLCMainDataModel fetchTableViewHeaderDataWithCompletionBlock:^(id returnValue) {
        mainDataModel = [LLCMainDataModel yy_modelWithJSON:returnValue];
        dispatch_group_leave(group);//队列组内本块完成
    } withFailureBlock:^(NSError *error) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [LLCMainCellDataModel fetchTableViewCellDataWithCompletionBlock:^(id returnValue) {
        mainCellDataModel = [LLCMainCellDataModel yy_modelWithJSON:returnValue];
        dispatch_group_leave(group);
    } withFailureBlock:^(NSError *error) {
        dispatch_group_leave(group);
    }];
    
    // 监听队列组是否完成，并在完成后回到主线程刷新UI
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        [self refreshTableViewHeaderUI];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}


/**
 * 早餐：早上：6：00-12：00 午餐：12：00-6：00 晚餐：6：00-次日4：00
 */
- (void)setContentOffset{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"a"];//获取当前时间是上午还是下午
    NSString *date = [formatter stringFromDate:[NSDate date]];
    
    if ([date isEqualToString:@"AM"]) {//早上 AM
        [formatter setDateFormat:@"hh"];
        NSInteger currentHour = [[formatter stringFromDate:[NSDate date]] integerValue];
        
        if (currentHour > 4) {//早餐
            [self.secondScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }else{//晚餐
            [self.secondScrollView setContentOffset:CGPointMake(2 * self.secondScrollView.width, 0) animated:YES];
        }
    }else if ([date isEqualToString:@"PM"]){//下午 PM
        [formatter setDateFormat:@"hh"];
        NSInteger currentHour = [[formatter stringFromDate:[NSDate date]] integerValue];
        
        if (currentHour < 6) {//午餐
            [self.secondScrollView setContentOffset:CGPointMake(self.secondScrollView.width, 0) animated:YES];
        }else{//晚餐
            [self.secondScrollView setContentOffset:CGPointMake(2 * self.secondScrollView.width, 0) animated:YES];
        }
    }
    
}


- (void)setupNavigationBarItem{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"homepageCreateRecipeButton" target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"buylistButtonImage" target:self action:@selector(rightBarButtonItemClick)];
}

#pragma mark --UIViewController--


#pragma mark --action sheet--

- (void)leftBarButtonItemClick{
    NSLog(@"左边");
}

- (void)rightBarButtonItemClick{
    NSLog(@"右边");
}

- (void)fourButtonClick:(UIButton *)sender{
    switch (sender.tag) {
        case 100:
            NSLog(@"100");
            break;
        case 200:
            NSLog(@"200");
            break;
        case 300:
            NSLog(@"300");
            break;
        case 400:
            NSLog(@"400");
            break;
        default:
            break;
    }
}

- (void)leftViewClick{
    NSLog(@"left");
}

- (void)rightViewClick{
    NSLog(@"right");
}

#pragma mark --UITableViewDelegate--
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 140;
        }else if(indexPath.row == 1){
            return 90;
        }else{
            return 90;
        }
    }else{
        LLCMainCellDataContentIssuesModel *issue = mainCellDataModel.content.issues[indexPath.section - 1];
        return [LLCHomeCellManager heightOfTableViewCellWithModel:issue.items[indexPath.row]];
    }
}

#pragma mark --UITableViewDataSource--

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [mainCellDataModel.content.count integerValue] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        LLCMainCellDataContentIssuesModel *issue = mainCellDataModel.content.issues[section-1];
        return issue.items.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [LLCHomeCellManager cellWithTableView:tableView
                                                           withCellID:kFirstCellID
                                                      withReceiveItem:mainDataModel.content
                                                        withIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        LLCMainCellDataContentIssuesModel *model = mainCellDataModel.content.issues[indexPath.section -1];
        LLCMainCellDataContentIssuesItemsModel *item = model.items[indexPath.row];
        
        NSString *cellID = [LLCHomeCellManager cellIDWithReceiveModel:item];
        UITableViewCell *cell = [LLCHomeCellManager cellWithTableView:tableView
                                                           withCellID:cellID
                                                      withReceiveItem:mainCellDataModel.content
                                                        withIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}


#pragma mark --UIScrollViewDelegate--
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    // 取 滚动的横向距离 与屏幕宽度的整数倍
    double i = offset.x / scrollView.width;
    
    // 将这个整数倍作为被选中的小圆点的下标
    self.pageControl.currentPage = round(i);
}

#pragma mark --UISearchBarDelegate--
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return NO;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"%s", __func__);
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"%s", __func__);
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s", __func__);
}

@end
