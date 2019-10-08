//
//  ZMMTabBarViewDelegate.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZMMTabBarViewInterface;
@protocol ZMMTabBarButtonInterface;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMTabBarViewDelegate <NSObject>

@required

/**
 否允许事件点击(防止点击本身)
 @param tabBar 要点击tabBar
 @return YES/NO
 */
- (BOOL)tabBar:(id<ZMMTabBarViewInterface> )tabBar
    shouldSelectItemAtIndex:(NSInteger)index;

/**
将要被点击

 @param tabBar 将要点击tabBar
 @param item item
 */
- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar willSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index;

/**
 item 被点击

 @param tabBar 点击之后tabBar
 @param item item
 */
- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar didSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
