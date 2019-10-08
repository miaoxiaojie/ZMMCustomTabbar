//
//  ZMMRootViewControllerInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ZMMRootViewControllerInterface <NSObject>

/**
 TabBarVc 放到rootVC 上

 @param tabbarVc TabBarVc
 */
- (void)setTabbarViewController:(UIViewController *)tabbarVc;

@end

NS_ASSUME_NONNULL_END
