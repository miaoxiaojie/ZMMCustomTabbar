//
//  ZMMTabbarChildResource.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMTabbarChildControllerInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabbarChildResource : NSObject


/**
 获得子控制器

 @return 子控制器
 */
+ (NSArray<__kindof id<ZMMTabbarChildControllerInterface>> *)getTabChildViewControllers;


/**
 获得TabImgName

 @param childID childID
 @return 字典
 */
+ (nonnull NSDictionary *)getTabImgNameWith:(nonnull NSString *)childID;

/**
 获得TableVC数据

 @param childID childID
 @return 数据
 */
+ (nonnull NSDictionary *)getTableViewDataWith:(nonnull NSString *)childID;

@end

NS_ASSUME_NONNULL_END
