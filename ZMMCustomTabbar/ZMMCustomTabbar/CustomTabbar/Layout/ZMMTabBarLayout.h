//
//  ZMMTabBarLayout.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTabBarLayout : NSObject

+ (CGSize)getScreenSize;
+ (CGFloat)getTabBarViewHeight;
+ (CGRect)getUIscrollViewFrame;
+ (CGRect)getTabBarViewFrame;
+ (CGFloat)getItemWidth:(NSUInteger)count;
+ (CGFloat)getItemHeight;
+ (CGFloat)getTableCellHeightWith:(nonnull NSString *)childId;

@end

NS_ASSUME_NONNULL_END
