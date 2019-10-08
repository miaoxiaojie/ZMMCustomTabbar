//
//  ZMMTabbarFactory.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabbarFactory.h"
#import "ZMMRootVcManager.h"
#import "ZMMRootViewController.h"
#import "ZMMTabBarViewController.h"
#import "ZMMTabbarChildController.h"
#import "ZMMTabBarLayout.h"
#import "ZMMTabBarView.h"
#import "ZMMTabBarButton.h"
#import "ZMMTableViewController.h"

@implementation ZMMTabbarFactory

+ (id<ZMMRootVcManagerInterface>)getRootVcManager
{
    ZMMRootVcManager *manager = [ZMMRootVcManager sharedInstance];
    return manager;
}

+ (UIViewController <ZMMRootViewControllerInterface> *)getRootViewController
{
    ZMMRootViewController *rootVc = [[ZMMRootViewController alloc]init];
    CGSize mainSize = [ZMMTabBarLayout getScreenSize];
    [rootVc.view setFrame:CGRectMake(0, 0, mainSize.width, mainSize.height)];
    return rootVc;
}

+ (UITabBarController <ZMMTabBarViewControllerInterface> *)getTabBarControllerWithViewControllers:(nullable NSArray<id<ZMMTabbarChildControllerInterface>> *)viewControllers
{
    ZMMTabBarViewController *tabBarVC = [ZMMTabBarViewController sharedInstance];
    [tabBarVC addChildViewControllers:[self p_addNavToRootVcs:viewControllers]];
    NSMutableArray *childIds = [NSMutableArray array];
    for (id<ZMMTabbarChildControllerInterface> childVC in viewControllers) {
        NSString *childId = [childVC getTabbarChildID];
        [childIds addObject:childId];
    }
    [tabBarVC setTabBarImagesWidthChildIds:childIds];
    return tabBarVC;
}

+ (UIViewController <ZMMTabbarChildControllerInterface> *)getTabbarChildControllerWith:(nonnull NSDictionary *)aDict
{
    ZMMTabbarChildController *VC = [[ZMMTabbarChildController alloc]initWithTabChildVcData:aDict];
    return VC;
}

#pragma mark - privateMethod

+ (NSArray<UINavigationController *> *)p_addNavToRootVcs:(NSArray<id<ZMMTabbarChildControllerInterface>> *)viewControllers
{
    
    NSMutableArray *vcs = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSInteger index = 0; index < viewControllers.count; index++ )
    {
        id<ZMMTabbarChildControllerInterface> tabbarChildVC = [viewControllers objectAtIndex:index];
        UIViewController *vc = [tabbarChildVC getViewController];
        UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:vc];
        [rootNav setNavigationBarHidden:YES];
        rootNav.view.autoresizesSubviews = NO;
        [vcs addObject:rootNav];
    }
    return vcs;
}

+ (UIView <ZMMTabBarViewInterface> *)getTabBarView
{
    ZMMTabBarView *tabBarView = [[ZMMTabBarView alloc]init];
    return tabBarView;
}

+ (UIControl <ZMMTabBarButtonInterface> *)getTabBarButton
{
    ZMMTabBarButton *tabbarButton = [[ZMMTabBarButton alloc]init];
    return tabbarButton;
}

+(UIViewController <ZMMTableViewControllerInterface> *)getTableVCWithChildId:(NSString *)childId
{
    ZMMTableViewController *tableVC = [[ZMMTableViewController alloc]initWithChildID:childId];
    return tableVC;
}

@end
