//
//  ZMMTabbarChildResource.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabbarChildResource.h"
#import "ZMMTabbarFactory.h"
#import "ZMMTableViewControllerInterface.h"

@implementation ZMMTabbarChildResource

+ (NSArray<__kindof id<ZMMTabbarChildControllerInterface>> *)getTabChildViewControllers
{
    NSArray *array = [self getLayoutData];
    NSMutableArray *tabItemVcArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    for (NSDictionary *dict in array) {
        id<ZMMTabbarChildControllerInterface> tabItemRootVc = [ZMMTabbarFactory getTabbarChildControllerWith:dict];
        NSString *childID = [dict objectForKey:@"childID"];
        id<ZMMTableViewControllerInterface> tableVC = [ZMMTabbarFactory getTableVCWithChildId:childID];
        [tabItemRootVc setTableViewController:tableVC];
        [tabItemRootVc addTableViewController];
        [tabItemVcArray addObject:tabItemRootVc];
        
    }
    return tabItemVcArray.copy;
}

+ (nonnull NSDictionary *)getTabImgNameWith:(nonnull NSString *)childID
{
    NSArray *array = [self getLayoutData];
    NSDictionary *result = [NSDictionary dictionary];
    for (NSDictionary *dict in array) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            NSString *ID = [dict objectForKey:@"childID"];
            if ([childID isEqualToString:ID]) {
                result = [dict objectForKey:@"tabImgName"];
            }
        }
    }
    return result;
}

+ (nonnull NSArray *)getLayoutData
{
    NSArray *array = @[@{
                           @"childID":@"1",
                           @"TitleData":@{
                                   @"TitleName":@"店铺"
                                   
                                   },
                           @"tabImgName":@{
                                   @"normal":@"store_btn_normal",
                                   @"select":@"store_btn_selected"
                                   
                                   }
                           
                           },
                       @{
                           @"childID":@"2",
                           @"TitleData":@{
                                   @"TitleName":@"消息"
                                   
                                   },
                           @"tabImgName":@{
                                   @"normal":@"message_btn_normal",
                                   @"select":@"message_btn_selected"
                                   
                                   }
                           },
                       @{@"childID":@"3",
                         @"TitleData":@{
                                 @"TitleName":@"购物车"
                                 
                                 },
                         @"tabImgName":@{
                                 @"normal":@"shoppingCart_btn_normal",
                                 @"select":@"shoppingCart_btn_selected"
                                 
                                 }
                         
                         },
                       @{@"childID":@"4",
                         @"TitleData":@{
                                 @"TitleName":@"我"
                                 
                                 },
                         @"tabImgName":@{
                                 @"normal":@"mine_btn_normal",
                                 @"select":@"mine_btn_selected"
                                 
                                 }
                         
                         },
                       ];
    return array;
}

+ (nonnull NSDictionary *)getTableViewDataWith:(nonnull NSString *)childID
{
    NSArray *array = [self getTableViewData];
    NSDictionary *result = [NSDictionary dictionary];
    for (NSDictionary *dict in array) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            NSString *ID = [dict objectForKey:@"childID"];
            if ([childID isEqualToString:ID]) {
                NSInteger index = [array indexOfObject:dict];
                result = [array objectAtIndex:index];
            }
        }
    }
    return result;
}

+ (nonnull NSArray *)getTableViewData
{
    NSArray *array = @[@{
                           @"childID":@"1",
                           @"TitleData":@{
                                   @"TitleName":@"店铺"
                                   
                                   },
                           @"content":@[@{
                                            @"picture":@"zmm-store-jingdo",
                                            @"title":@"京东"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-taobao",
                                            @"title":@"淘宝"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-suning",
                                            @"title":@"苏宁易购"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-qunawang",
                                            @"title":@"去哪网"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-pinduoduo",
                                            @"title":@"拼多多"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-meituanmaicai",
                                            @"title":@"美团买菜"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-store-tianmaochaoshi",
                                            @"title":@"天猫超市"
                                            
                                            },
                                        
                                        ]
                           
                           },
                       @{
                           @"childID":@"2",
                           @"TitleData":@{
                                   @"TitleName":@"消息"
                                   
                                   },
                           @"content":@[@{
                                            @"picture":@"zmm-message-radish",
                                            @"title":@"萝卜",
                                            @"content":@"下气、消食、利尿、润肺祛痰、解毒生津"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-message-watermelon",
                                            @"title":@"西瓜",
                                            @"content":@"解暑生津、利尿消肿、消除疲劳"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-message-pineapple",
                                            @"title":@"菠萝",
                                            @"content":@"清热解暑、利尿消肿、减肥瘦身"
                                            
                                            },
                                        @{
                                            @"picture":@"zmm-message-apple",
                                            @"title":@"苹果",
                                            @"content":@"补脑养血、宁神安眠"
                                            
                                            },
                                        
                                        ]
                           
                           },
                       @{@"childID":@"3",
                         @"TitleData":@{
                                 @"TitleName":@"购物车"
                                 
                                 },
                         @"content":@[@{
                                          @"picture":@"zmm-shoppingCart-catCanned.jpg",
                                          @"title":@"怡亲健康机能猫罐",
                                          @"color":@"口味：金枪鱼",
                                          @"price":@"$30"
                                          
                                          },
                                      @{
                                          @"picture":@"zmm-shoppingCart-camera.jpg",
                                          @"title":@"佳能微单高清数码相机",
                                          @"color":@"颜色：黑色",
                                          @"price":@"$250000"
                                          
                                          },
                                      @{
                                          @"picture":@"zmm-shoppingCart-plate.jpg",
                                          @"title":@"创意陶瓷西餐盘子",
                                          @"color":@"颜色：红色",
                                          @"price":@"$15"
                                          },
                                      @{
                                          @"picture":@"zmm-shoppingCart-mirror.jpg",
                                          @"title":@"家用圆形镜子",
                                           @"color":@"颜色：粉红色",
                                          @"price":@"$10"
                                          
                                          },
                                      
                                      ]
                         
                         },
                       @{@"childID":@"4",
                         @"TitleData":@{
                                 @"TitleName":@"我"
                                 
                                 },
                         @"content":@[@{
                                          @"text":@"  昵称:  我爱中华"
                                          
                                          },
                                      @{
                                          @"text":@"  简介:  你就是我的唯一"
                                          
                                          },
                                      @{
                                          @"text":@"  性别:  女"
                                          
                                          },
                                      @{
                                          @"text":@"  爱好:  旅游，摄影，看书"
                                          
                                          },
                                      
                                      ]
                         
                         },
                       ];
    return array;
}


@end
