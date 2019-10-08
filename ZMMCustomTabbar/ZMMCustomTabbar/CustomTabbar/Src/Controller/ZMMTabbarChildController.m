//
//  ZMMTabbarChildController.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabbarChildController.h"
#import "ZMMTableViewControllerInterface.h"
#import "ZMMTabBarLayout.h"

@interface ZMMTabbarChildController ()

@property (nonatomic, strong) NSDictionary  *tabItemVcData;
@property (nonatomic, strong) id<ZMMTableViewControllerInterface> curTableVC;


@end

@implementation ZMMTabbarChildController

- (nullable instancetype)initWithTabChildVcData:(nonnull NSDictionary *)aDict
{
    if (self = [super init]) {
        
        _tabItemVcData = aDict;
       
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.view.frame = [ZMMTabBarLayout getUIscrollViewFrame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

#pragma mark - privateMethod

- (void)p_addLayoutTableVc
{
    UIViewController *tableVC = [_curTableVC getViewController];
    tableVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:tableVC.view];
}

#pragma mark - publicMethod

- (nullable UIViewController *)getViewController
{
    return self;
}

- (nonnull NSString *)getTabbarChildID
{
    return [_tabItemVcData objectForKey:@"childID"];
}

- (void)setTableViewController:(id<ZMMTableViewControllerInterface>)tableVc
{
    _curTableVC = tableVc;
}

- (void)addTableViewController
{
     [self p_addLayoutTableVc];
}

@end
