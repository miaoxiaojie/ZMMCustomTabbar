//
//  ZMMTableViewCell.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/25.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTableViewCell.h"
#import "ZMMTabBarLayout.h"

@interface ZMMTableViewCell ()

@property (copy, nonatomic) NSString *childID;
@property (strong, nonatomic) UIImageView *goodImageView;

@property (strong, nonatomic) UIImageView *logoImageView;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *contentLable;

@property (strong, nonatomic) UIImageView *goodsImageView;
@property (strong, nonatomic) UILabel *goodsName;
@property (strong, nonatomic) UILabel *goodsColoe;
@property (strong, nonatomic) UILabel *goodsPrice;

@property (strong, nonatomic) UILabel *mineLable;

@end

@implementation ZMMTableViewCell


+(id)cellForTableView:(UITableView *)aTableView{
    
    NSString *identiferId = [self cellIdentifier];
    UITableViewCell *tabelCell = [aTableView dequeueReusableCellWithIdentifier:identiferId];
    if(nil == tabelCell)
    {
        tabelCell = [[self alloc]initWithCellIndetifier:identiferId];
    }
    return tabelCell;
}

+(NSString*)cellIdentifier{
    
    return NSStringFromClass([self class]);
    
}

-(id)initWithCellIndetifier:(NSString *)aReuseId{
    
    return  [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:aReuseId];
    
}

- (void)drawViewsWith:(nonnull NSString *)childID
{
    self.childID = childID;
    if ([childID isEqualToString:@"1"]) {
        [self p_storeDrawViews];
    }
    else if ([childID isEqualToString:@"2"]) {
        [self p_messageDrawVies];
    }else if ([childID isEqualToString:@"3"]) {
        [self p_shoppingCartViews];
    }else if ([childID isEqualToString:@"4"]) {
        [self p_creatMineVies];
    }
        
}

- (void)p_storeDrawViews
{
    
    self.goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10,[ZMMTabBarLayout getScreenSize].width - 20,[ZMMTabBarLayout getTableCellHeightWith:self.childID] - 20)];
    self.goodImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.goodImageView];

}


- (void)p_messageDrawVies
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 10,[ZMMTabBarLayout getScreenSize].width - 20,[ZMMTabBarLayout getTableCellHeightWith:self.childID] - 20)];
    bgView.backgroundColor = [UIColor grayColor];
    bgView.layer.cornerRadius = 5;
    bgView.alpha = 0.1;
    [self addSubview:bgView];
    self.logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,25,40, 40)];
    [self addSubview:self.logoImageView];
    
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 15, [ZMMTabBarLayout getScreenSize].width - 50 - 10, 30)];
    self.titleLable.font = [UIFont boldSystemFontOfSize:16];
    [self addSubview:self.titleLable];
    
    self.contentLable = [[UILabel alloc]initWithFrame:CGRectMake(50,40, self.titleLable.frame.size.width, 30)];
    self.contentLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.contentLable];
}

- (void)p_shoppingCartViews
{
    self.backgroundColor = [UIColor colorWithRed:236/255.0
                                           green:236/255.0
                                            blue:236/255.0
                                           alpha:1];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 10,[ZMMTabBarLayout getScreenSize].width - 20,[ZMMTabBarLayout getTableCellHeightWith:self.childID] - 10)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    [self addSubview:bgView];
    
    self.goodsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 70, [ZMMTabBarLayout getTableCellHeightWith:self.childID] - 30)];
    [self addSubview:self.goodsImageView];
    
    self.goodsName = [[UILabel alloc]initWithFrame:CGRectMake(100, 15,[ZMMTabBarLayout getScreenSize].width - 20 - self.goodsImageView.frame.size.width, 20)];
    self.goodsName.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsName];
    
    self.goodsColoe = [[UILabel alloc]initWithFrame:CGRectMake(100, 40,100,20)];
    self.goodsColoe.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.goodsColoe];
    
    self.goodsPrice = [[UILabel alloc]initWithFrame:CGRectMake(100, 65,100,20)];
    self.goodsPrice.font = [UIFont boldSystemFontOfSize:16];
    self.goodsPrice.textColor = [UIColor colorWithRed:231/255.0
                                                green:42/255.0
                                                 blue:48/255.0
                                                alpha:1];
    [self addSubview:self.goodsPrice];
    
}

- (void)p_creatMineVies
{
    self.backgroundColor = [UIColor colorWithRed:236/255.0
                                           green:236/255.0
                                            blue:236/255.0
                                           alpha:1];
    self.mineLable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,[ZMMTabBarLayout getScreenSize].width, 43)];
    self.mineLable.backgroundColor = [UIColor whiteColor];
    self.mineLable.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.mineLable];
}

#pragma mark - publicMethod

- (void)setTableViewCellData:(nonnull NSDictionary *)aDict
{
    if ([self.childID isEqualToString:@"1"]) {
        self.goodImageView.image = [UIImage imageNamed:[aDict objectForKey:@"picture"]];
    }else if ([self.childID isEqualToString:@"2"]) {
        self.logoImageView.image = [UIImage imageNamed:[aDict objectForKey:@"picture"]];
        self.titleLable.text = [aDict objectForKey:@"title"];
        self.contentLable.text = [aDict objectForKey:@"content"];
    } else if ([self.childID isEqualToString:@"3"]) {
        self.goodsImageView.image = [UIImage imageNamed:[aDict objectForKey:@"picture"]];
        self.goodsName.text = [aDict objectForKey:@"title"];
        self.goodsColoe.text = [aDict objectForKey:@"color"];
        self.goodsPrice.text = [aDict objectForKey:@"price"];
    }else if ([self.childID isEqualToString:@"4"]) {
        self.mineLable.text = [aDict objectForKey:@"text"];
    }
}

@end
