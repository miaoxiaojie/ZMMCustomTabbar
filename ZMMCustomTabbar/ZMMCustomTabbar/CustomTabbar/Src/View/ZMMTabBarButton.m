//
//  ZMMTabBarButton.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabBarButton.h"

@interface ZMMTabBarButton()
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UIImageView *normalImageView;

@end

@implementation ZMMTabBarButton

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.exclusiveTouch = YES;
    }
    return self;
    
}

#pragma mark - publicMethod

- (UIControl *)getTabBarButton
{
    return self;
}

- (void)setImageViewArea:(CGSize)size
{
    CGRect imageViewFrame = CGRectMake((self.bounds.size.width - size.width) / 2, (self.bounds.size.height - size.height) / 2, size.width, size.height);
    [self.normalImageView setFrame:imageViewFrame];
    [self.selectedImageView setFrame:imageViewFrame];
}

- (void)setSelectedName:(NSString *)selectedName
             normalName:(NSString *)normalName
{
    [self.selectedImageView setImage:[UIImage imageNamed:selectedName]];
    [self.normalImageView setImage:[UIImage imageNamed:normalName]];
}


#pragma mark - setter/getter

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    [self.selectedImageView setHidden:!selected];
    [self.normalImageView setHidden:selected];
   
}

-(UIImageView *)selectedImageView
{
    if (_selectedImageView) {
        return _selectedImageView;
    }
    _selectedImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:_selectedImageView];
    return _selectedImageView;
}

-(UIImageView *)normalImageView
{
    if (_normalImageView) {
        return _normalImageView;
    }
    _normalImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:_normalImageView];
    return _normalImageView;
}



@end
