//
//  ZMMTabBarOutgoingServer.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZMMTabBarViewControllerInterface;

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabBarOutgoingServer : NSObject

/**
 获得 rootVC

 @return rootVC
 */
+(UIViewController *)getRootVC;

/**
 选中第几个Tabbar

 @param index 第几个
 */
+(void)setSelectTabBarWith:(NSUInteger)index;


@end

NS_ASSUME_NONNULL_END
