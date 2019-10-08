//
//  ZMMRootVcManagerInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZMMTabBarViewControllerInterface;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMRootVcManagerInterface <NSObject>

@required

/**
 获得RootVC

 @return RootVC
 */
- (UIViewController *)getRootViewController;

/**
 tabbarVC 添加到 rootVC

 @param tabBarVc tabbarVC
 */
- (void)rootVcAddTabBarViewControllerWithTabBarVc:(UITabBarController <ZMMTabBarViewControllerInterface> *)tabBarVc;

@end

NS_ASSUME_NONNULL_END
