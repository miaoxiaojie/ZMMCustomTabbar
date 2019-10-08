//
//  ZMMRootViewController.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMRootViewController.h"
#import "ZMMTabBarLayout.h"

@interface ZMMRootViewController ()

@property (nonatomic, strong) UIViewController   *tabbarVc;

@end

@implementation ZMMRootViewController


#pragma mark - publicMethod

- (void)setTabbarViewController:(UIViewController *)tabbarVc
{
    CGSize mainSize = [ZMMTabBarLayout getScreenSize];
    tabbarVc.view.frame = CGRectMake(0, 0, mainSize.width, mainSize.height);
    [self.view addSubview:tabbarVc.view];
}

@end
