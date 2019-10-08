//
//  ZMMRootVcManager.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMRootVcManagerInterface.h"

/**
 rootVC 管理类
 */
NS_ASSUME_NONNULL_BEGIN

@interface ZMMRootVcManager : NSObject<ZMMRootVcManagerInterface>

ZMMSINGLETONDECLEAR(ZMMMainRootVcManager)

@end

NS_ASSUME_NONNULL_END
