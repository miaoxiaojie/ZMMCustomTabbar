//
//  ZMMTableViewController.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/24.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMMTableViewControllerInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTableViewController : UIViewController<ZMMTableViewControllerInterface>

/**
 子TableViewController的标识

 @param childID 标识
 @return self
 */
- (instancetype)initWithChildID:(NSString *)childID;

@end

NS_ASSUME_NONNULL_END
