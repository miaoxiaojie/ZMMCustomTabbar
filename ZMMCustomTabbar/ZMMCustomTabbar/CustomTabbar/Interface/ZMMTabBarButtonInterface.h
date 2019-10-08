//
//  ZMMTabBarButtonInterface.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMTabBarButtonInterface <NSObject>


/**
 获得自己

 @return 自己
 */
- (UIControl *)getTabBarButton;


/**
 可视区域的面积

 @param size 面积
 */
- (void)setImageViewArea:(CGSize)size;

/**
 设置图片名字

 @param selectedName 选中图片名字
 @param normalName 正常图片名字
 */
- (void)setSelectedName:(NSString *)selectedName
             normalName:(NSString *)normalName;


@end

NS_ASSUME_NONNULL_END
