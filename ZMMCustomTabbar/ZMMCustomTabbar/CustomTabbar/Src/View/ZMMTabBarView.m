//
//  ZMMTabBarView.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/20.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabBarView.h"
#import "ZMMTabBarButtonInterface.h"
#import "ZMMTabBarLayout.h"
#import "ZMMTabBarViewDelegate.h"

@interface ZMMTabBarView()

@property (nonatomic, strong) NSArray<__kindof id<ZMMTabBarButtonInterface>>  *buttons;
@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, strong) UIControl *selectedItem;
@property (nonatomic, weak) id<ZMMTabBarViewDelegate> tabBarDelegate;


@end

@implementation ZMMTabBarView

#pragma mark - privateMethod

- (void)p_drawSubViews
{
    if (self.subviews.count > 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    self.buttonWidth = [ZMMTabBarLayout getItemWidth:_buttons.count];
    CGFloat buttonHeight = [ZMMTabBarLayout getItemHeight];
    
    for (id <ZMMTabBarButtonInterface> item in _buttons) {
        
        NSInteger index = [_buttons indexOfObject:item];
        
        if ([item conformsToProtocol:@protocol(ZMMTabBarButtonInterface)]) {
            
            UIControl *control = [item getTabBarButton];
            [control setFrame:CGRectMake(index * self.buttonWidth, 0, self.buttonWidth, buttonHeight)];
            [item setImageViewArea: CGSizeMake(30, 30)];
            [control addTarget:self action:@selector(p_tabBarItemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:control];
        }

    }
}

- (BOOL)p_isSuperWorld:(NSUInteger)index
{
    return (index >= _buttons.count) ? YES : NO;
}

//设置所有为未点击状态
- (void)p_resetAllButtonsToUnselected
{
    for (UIControl <ZMMTabBarButtonInterface> *item in _buttons) {
        [item setSelected:NO];
    }
}

//设置选中为点击状态
- (void)p_resetSelectButton:(UIControl *)selectButton
{
    _selectedItem = selectButton;
    [_selectedItem setSelected:YES];
}

- (void)p_tabBarItemDidClicked:(id)sender
{
    if (![sender conformsToProtocol:@protocol(ZMMTabBarButtonInterface)]) {
        return;
    }
    id<ZMMTabBarButtonInterface> item = (id<ZMMTabBarButtonInterface>)sender;
    
    NSInteger index = [self.buttons indexOfObject:item];
    
    BOOL shouldSelected = [self p_isShouldSelectItemAtIndex:index];
    if (!shouldSelected) {
        return;
    }
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar: willSelectItem: index:)]) {
        [self.tabBarDelegate tabBar:self willSelectItem:item index:index];
    }
 
}

- (BOOL)p_isShouldSelectItemAtIndex:(NSInteger)aIndex
{
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar: shouldSelectItemAtIndex:)]) {
        
        BOOL shouldSelect = [self.tabBarDelegate tabBar:self shouldSelectItemAtIndex:aIndex];
        return shouldSelect;
        
    }
    return YES;
}

#pragma mark - publicMethod

- (void)setTabBarButtons:(NSArray<__kindof id<ZMMTabBarButtonInterface>> *)buttons
{
    if (buttons == _buttons) {
        return;
    }
    
    if (_buttons) {
        [_buttons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    self.buttons = buttons;
    
    [self p_drawSubViews];
}

- (NSArray<__kindof id<ZMMTabBarButtonInterface>> *)tabBarButtons
{
    return [_buttons copy];
}

- (void)setTabViewSelectedIndex:(NSUInteger)index
{
    if ([self p_isSuperWorld:index]) {
        return;
    }
    id<ZMMTabBarButtonInterface> item = [self.buttons objectAtIndex:index];
    UIControl *control = [item getTabBarButton];
    
    if (control == _selectedItem) {
        return;
    }
    [self p_resetAllButtonsToUnselected];
    [self p_resetSelectButton:control];
    
}

- (void)setDelegate:(id<ZMMTabBarViewDelegate>)delegate
{
    self.tabBarDelegate = delegate;
}

- (void)tabBarDidSelectItem:(id<ZMMTabBarButtonInterface>)item
                      index:(NSInteger)index
{
    if ([item getTabBarButton] == _selectedItem) {
        return ;
    }
    [self p_resetAllButtonsToUnselected];
    [self p_resetSelectButton:[item getTabBarButton]];
   
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar: didSelectItem: index:)]) {
        [self.tabBarDelegate tabBar:self didSelectItem:item index:index];
    }
}


@end
