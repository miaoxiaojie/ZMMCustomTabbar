//
//  ZMMTabBarViewInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZMMTabBarButtonInterface;
@protocol ZMMTabBarViewDelegate;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMTabBarViewInterface <NSObject>

@required

/**
设置TabBarButton

 @param buttons buttons
 */
- (void)setTabBarButtons:(NSArray<__kindof id<ZMMTabBarButtonInterface>> *)buttons;

/**
 获得tabItem
 
 @return 数据
 */
- (NSArray<__kindof id<ZMMTabBarButtonInterface>> *)tabBarButtons;


/**
 选中tabItem
 
 @param index 第几个
 */
- (void)setTabViewSelectedIndex:(NSUInteger)index;

/**
 设置代理

 @param delegate 代理
 */
- (void)setDelegate:(id<ZMMTabBarViewDelegate>)delegate;

/**
 选中tabBarItem

 @param item item
 @param index 第几个
 */
- (void)tabBarDidSelectItem:(id<ZMMTabBarButtonInterface>)item
                      index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
