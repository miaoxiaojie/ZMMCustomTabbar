//
//  ZMMTabbarChildControllerInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZMMTableViewControllerInterface;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMTabbarChildControllerInterface <NSObject>


/**
 获得自己

 @return 自己
 */
- (nullable UIViewController *)getViewController;


/**
 获得ID

 @return ID
 */
- (nonnull NSString *)getTabbarChildID;


/**
 设置TableVC

 @param tableVc  tableVc
 */
- (void)setTableViewController:(id<ZMMTableViewControllerInterface>)tableVc;


/**
 添加tableVC
 */
- (void)addTableViewController;


@end

NS_ASSUME_NONNULL_END
