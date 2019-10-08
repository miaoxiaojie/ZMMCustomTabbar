//
//  ZMMTabBarViewControllerInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMTabBarViewControllerInterface <NSObject>

/**
 设置TabBarViewController 子控制器
 
 @param viewControllers 自控制器数组
 */
- (void)addChildViewControllers:(NSArray<UINavigationController *> *)viewControllers;

/**
  设置TabBarImages

 @param childIds 每个子控制的IDs
 */
- (void)setTabBarImagesWidthChildIds:(NSArray *)childIds;


/**
 设置选中的初始化值

 @param index 初始值
 */
-(void)setSelectTabBarWith:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
