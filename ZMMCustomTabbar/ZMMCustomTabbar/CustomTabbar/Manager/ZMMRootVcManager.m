//
//  ZMMRootVcManager.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMRootVcManager.h"
#import "ZMMRootViewControllerInterface.h"
#import "ZMMTabbarFactory.h"
#import "ZMMTabBarViewControllerInterface.h"

@interface ZMMRootVcManager()

@property (nonatomic, strong) UIViewController <ZMMRootViewControllerInterface> * rootVC;

@end

@implementation ZMMRootVcManager

ZMMSINGLETONIMPLEMENT(ZMMMainRootVcManager)

- (instancetype)init
{
    if (self = [super init]) {
        
        self.rootVC = [ZMMTabbarFactory getRootViewController];
        
    }
    
    return self;
}

#pragma mark - publicMethod
- (UIViewController *)getRootViewController
{
    return _rootVC;
}

- (void)rootVcAddTabBarViewControllerWithTabBarVc:(UITabBarController <ZMMTabBarViewControllerInterface> *)tabBarVc
{
    [self.rootVC setTabbarViewController:tabBarVc];
    
}

@end
