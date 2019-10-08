//
//  ZMMTableViewController.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/24.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTableViewController.h"
#import "ZMMTableViewCell.h"
#import "ZMMTabbarChildResource.h"
#import "ZMMTabBarLayout.h"

@interface ZMMTableViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, copy) NSString *childID;

@end

@implementation ZMMTableViewController


- (instancetype)initWithChildID:(NSString *)childID
{
    if (self = [super init]) {
        self.childID = childID;
        NSDictionary *dict = [ZMMTabbarChildResource getTableViewDataWith:self.childID];
        self.list = [dict objectForKey:@"content"];
        [self p_initTableView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)p_initTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                          style:UITableViewStylePlain];
    tableView.frame = CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height - 44 - 80);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    tableView.bounces = NO;
    if ([self.childID isEqualToString:@"4"] || [self.childID isEqualToString:@"3"] ) {
        tableView.backgroundColor = [UIColor colorWithRed:236/255.0
                                                    green:236/255.0
                                                     blue:236/255.0
                                                    alpha:1];
    }
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.childID isEqualToString:@"1"]) {
        return 27.f;
    }
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ZMMTabBarLayout getTableCellHeightWith:self.childID];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.childID isEqualToString:@"1"]) {
        UIView *pView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 27.f)];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(12.f, 0, self.view.frame.size.width - 12.f, 25.f)];
        NSDictionary *aDict = [self.list objectAtIndex:section];
        NSString *titleName = [aDict objectForKey:@"title"];
        lable.text = titleName;
        lable.textColor = [UIColor blackColor];
        lable.font = [UIFont systemFontOfSize:15.f];
        [pView addSubview:lable];
        return pView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMMTableViewCell  *cell = [ZMMTableViewCell cellForTableView:tableView];
    [cell drawViewsWith:self.childID];
    [cell setTableViewCellData:[self.list objectAtIndex:indexPath.section]];
    return cell;
}

#pragma mark - publicMethod

- (UIViewController *)getViewController
{
    return self;
}


@end
