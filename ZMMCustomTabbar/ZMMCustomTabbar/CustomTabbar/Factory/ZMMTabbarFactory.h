//
//  ZMMTabbarFactory.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZMMRootVcManagerInterface;
@protocol ZMMRootViewControllerInterface;
@protocol ZMMTabBarViewControllerInterface;
@protocol ZMMTabbarChildControllerInterface;
@protocol ZMMTabBarViewInterface;
@protocol ZMMTabBarButtonInterface;
@protocol ZMMTableViewControllerInterface;

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabbarFactory : NSObject

/**
  rootVC 管理类

 @return RootVcManager
 */
+ (id<ZMMRootVcManagerInterface>)getRootVcManager;

/**
 获得rootVC

 @return rootVC
 */
+ (UIViewController <ZMMRootViewControllerInterface> *)getRootViewController;

/**
 获得UITabBarController

 @param viewControllers 自控制器
 @return UITabBarController
 */
+ (UITabBarController <ZMMTabBarViewControllerInterface> *)getTabBarControllerWithViewControllers:(nullable NSArray<id<ZMMTabbarChildControllerInterface>> *)viewControllers;

/**
 获得TabbarChildController

 @param aDict 数据
 @return TabbarChildController
 */
+ (UIViewController <ZMMTabbarChildControllerInterface> *)getTabbarChildControllerWith:(nonnull NSDictionary *)aDict;


/**
 获得TabBarView

 @return TabBarView
 */
+ (UIView <ZMMTabBarViewInterface> *)getTabBarView;


/**
 获得TabBarButton

 @return TabBarButton
 */
+ (UIControl <ZMMTabBarButtonInterface> *)getTabBarButton;

/**
 获得TableViewController

 @param childId 标识
 @return TableViewController
 */
+(UIViewController <ZMMTableViewControllerInterface> *)getTableVCWithChildId:(NSString *)childId;


@end

NS_ASSUME_NONNULL_END
