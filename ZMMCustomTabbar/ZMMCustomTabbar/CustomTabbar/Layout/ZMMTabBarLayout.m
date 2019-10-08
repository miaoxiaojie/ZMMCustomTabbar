//
//  ZMMTabBarLayout.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabBarLayout.h"

@implementation ZMMTabBarLayout

+ (CGSize)getScreenSize
{
    static CGSize size;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        size = [[UIScreen mainScreen] bounds].size;
    });
    return size;
}

+ (CGFloat)getTabBarViewHeight
{
    return 80;
}

+ (CGRect)getUIscrollViewFrame
{
    CGSize mainSize = [self getScreenSize];
    CGFloat height = mainSize.height - [self getTabBarViewHeight];
    CGRect frame = CGRectMake(0, 0, mainSize.width, height);
    return frame;
}

+ (CGRect)getTabBarViewFrame
{
    CGSize appScreenSize = [self getScreenSize];
    CGFloat tabBarStartY = appScreenSize.height - [self getTabBarViewHeight];
    CGRect tabBarViewFrame = CGRectMake(0, tabBarStartY, appScreenSize.width, [self getTabBarViewHeight]);
    return tabBarViewFrame;
}

+ (CGFloat)getItemWidth:(NSUInteger)count
{
   
    return [self getScreenSize].width / count;
}

+ (CGFloat)getItemHeight
{
    return 50;
}

+ (CGFloat)getTableCellHeightWith:(nonnull NSString *)childId
{
    
    if ([childId isEqualToString:@"1"]) {
        return 120;
    }else if ([childId isEqualToString:@"2"]) {
        return 90;
    }else if ([childId isEqualToString:@"3"]) {
        return 100;
    }
    return 44;
}

@end
