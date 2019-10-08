//
//  ZMMTabbarChildController.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMMTabbarChildControllerInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabbarChildController : UIViewController<ZMMTabbarChildControllerInterface>


/**
 设置数据

 @param aDict 数据
 @return self 
 */
- (nullable instancetype)initWithTabChildVcData:(nonnull NSDictionary *)aDict;

@end

NS_ASSUME_NONNULL_END
