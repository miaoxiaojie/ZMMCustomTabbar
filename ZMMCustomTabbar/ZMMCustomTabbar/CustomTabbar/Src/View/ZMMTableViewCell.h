//
//  ZMMTableViewCell.h
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/25.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMTableViewCell : UITableViewCell

/**
 返回cell

 @param aTableView UITableView
 @return cell
 */
+(id)cellForTableView:(UITableView *)aTableView;

/**
cellId

 @return cellId
 */
+(NSString*)cellIdentifier;

/**
 画视图

 @param childID 标识
 */
- (void)drawViewsWith:(nonnull NSString *)childID;

/**
 设置数据

 @param aDict 数据
 */
- (void)setTableViewCellData:(nonnull NSDictionary *)aDict;


@end

NS_ASSUME_NONNULL_END
