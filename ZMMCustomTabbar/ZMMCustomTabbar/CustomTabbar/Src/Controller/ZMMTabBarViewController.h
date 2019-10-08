//
//  ZMMTabBarViewController.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMMTabBarViewControllerInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabBarViewController : UITabBarController<ZMMTabBarViewControllerInterface>

ZMMSINGLETONDECLEAR(ZMMTabBarViewController)

@end

NS_ASSUME_NONNULL_END
