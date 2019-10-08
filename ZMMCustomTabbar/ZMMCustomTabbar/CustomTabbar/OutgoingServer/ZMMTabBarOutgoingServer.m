//
//  ZMMTabBarOutgoingServer.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabBarOutgoingServer.h"
#import "ZMMTabBarViewController.h"
#import "ZMMTabBarViewControllerInterface.h"
#import "ZMMTabbarFactory.h"
#import "ZMMTabbarChildResource.h"
#import "ZMMRootVcManagerInterface.h"

@implementation ZMMTabBarOutgoingServer


+(UIViewController *)getRootVC
{
    UITabBarController <ZMMTabBarViewControllerInterface> *tabBarVC = [ZMMTabbarFactory getTabBarControllerWithViewControllers:[ZMMTabbarChildResource getTabChildViewControllers]];
    id<ZMMRootVcManagerInterface> rootVCManager = [ZMMTabbarFactory getRootVcManager];
    [rootVCManager rootVcAddTabBarViewControllerWithTabBarVc:tabBarVC];
    
    return [rootVCManager getRootViewController];
}

+(void)setSelectTabBarWith:(NSUInteger)index
{
    ZMMTabBarViewController<ZMMTabBarViewControllerInterface> *tabBarVC = [ZMMTabBarViewController sharedInstance];
    [tabBarVC setSelectTabBarWith:index];
}

@end
