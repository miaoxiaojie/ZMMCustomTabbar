//
//  AppDelegate.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMMTabbarFactory.h"
#import "ZMMRootVcManagerInterface.h"
#import "ZMMTabBarViewControllerInterface.h"
#import "ZMMTabbarChildResource.h"
#import "ZMMTabBarOutgoingServer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self p_loadAppRootViewController];
    
    return YES;
}

#pragma mark - Private Method

- (void)p_loadAppRootViewController
{
    //初始化窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *rootVc = [ZMMTabBarOutgoingServer getRootVC];
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:rootVc];
    [ZMMTabBarOutgoingServer setSelectTabBarWith:0];
    [rootNav setNavigationBarHidden:YES];
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
    
}

@end
