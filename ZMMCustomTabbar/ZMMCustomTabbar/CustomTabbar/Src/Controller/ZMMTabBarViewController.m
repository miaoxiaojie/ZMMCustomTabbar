//
//  ZMMTabBarViewController.m
//  ZMMCustomTabbar
//
//  Created by miao on 2019/9/19.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "ZMMTabBarViewController.h"
#import "ZMMTabBarLayout.h"
#import "ZMMTabBarViewInterface.h"
#import "ZMMTabbarFactory.h"
#import "ZMMTabBarButtonInterface.h"
#import "ZMMTabbarChildResource.h"
#import "ZMMTabBarViewDelegate.h"

@interface ZMMTabBarViewController ()<
UIScrollViewDelegate,
ZMMTabBarViewDelegate>

@property (nonatomic, strong) NSArray<UINavigationController *> *viewControllersArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, strong) UIView <ZMMTabBarViewInterface> *tabBarView;
@property (nonatomic, assign) NSUInteger selectedChildIndex;

@end

@implementation ZMMTabBarViewController

ZMMSINGLETONIMPLEMENT(ZMMTabBarViewController)

- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 80;
    tabFrame.origin.y = self.view.frame.size.height - 80;
    self.tabBar.frame = tabFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabBarView];
    [self.view addSubview:self.scrollView];
    [self p_setFrameViews];
    
}

- (void)p_setFrameViews
{
    [self.scrollView setFrame:[ZMMTabBarLayout getUIscrollViewFrame]];
    self.scrollView.contentSize = CGSizeMake([ZMMTabBarLayout getScreenSize].width * 3, [ZMMTabBarLayout getScreenSize].height);
    [self.tabBarView setFrame:[ZMMTabBarLayout getTabBarViewFrame]];
}

- (void)p_creatTabBarButtons
{
    NSMutableArray *ary = [[NSMutableArray alloc]initWithCapacity:1];
    NSInteger count = [self.viewControllersArray count];
    for (NSInteger num = 0; num < count; num++ ) {
        id<ZMMTabBarButtonInterface> item = [ZMMTabbarFactory getTabBarButton];
        [ary addObject:item];
    }
    [self.tabBarView setTabBarButtons:ary.copy];
    
}

//移除视图
- (void)p_clearViewControllers
{
    if (self.viewControllersArray) {
        NSArray *subViews = self.scrollView.subviews;
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}

- (void)p_clearScrollViewViews
{
    if (self.viewArray) {
        [self.viewArray removeAllObjects];
    }
    [self p_clearViewControllers];
}


- (void)p_addCenterViewControllerIndex:(NSInteger)centerIndex
{
    if (centerIndex >= self.viewControllersArray.count) {
        return;
    }
    NSInteger maxIndex = self.viewControllersArray.count - 1;
    NSInteger frontIndex = NSNotFound;
    NSInteger backIndex = NSNotFound;
    if (centerIndex == 0) {
        frontIndex = maxIndex;
    }
    if (centerIndex == maxIndex) {
        backIndex = 0;
    }
    if (frontIndex == NSNotFound) {
        frontIndex = centerIndex - 1;
    }
    if (backIndex == NSNotFound) {
        backIndex = centerIndex + 1;
    }
    if (backIndex == NSNotFound || frontIndex == NSNotFound) {
        return;
    }
    NSMutableArray *allViews = [[NSMutableArray alloc]initWithCapacity:1];
    [allViews addObject:[self.viewControllersArray[frontIndex] view]];
    [allViews addObject:[self.viewControllersArray[centerIndex] view]];
    [allViews addObject:[self.viewControllersArray[backIndex] view]];
    
    [self p_addViewsToScrollView:allViews];
    [self p_setPageOncenter];
}

- (void)p_addViewsToScrollView:(NSArray *)views
{
    [self p_clearScrollViewViews];
    [self.viewArray addObjectsFromArray:views];
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat scrollViewheight = CGRectGetHeight(self.scrollView.frame);
    
    for (NSInteger index = 0; index < self.viewArray.count; index++) {
        UIView *view = [self.viewArray objectAtIndex:index];
        CGRect viewFrame = CGRectMake(index * viewWidth, 0.0, viewWidth, scrollViewheight);
        [view setFrame:viewFrame];
        [self.scrollView addSubview:view];
    }
    
}

- (void)p_setPageOncenter
{
    CGPoint contentOffset =  CGPointMake(CGRectGetWidth(self.view.frame), 0.0);
    [self.scrollView setContentOffset:contentOffset animated:NO];
}

- (NSInteger)p_getCurrentViewControllerIndexbyPageIndex:(NSInteger)pageIndex
{
    if (pageIndex > self.viewArray.count) {
        return NSNotFound;
    }
    UIView *view = [self.viewArray objectAtIndex:pageIndex];
    NSInteger index = NSNotFound;
    for (UINavigationController *vc  in self.viewControllersArray) {
        if (vc.view == view) {
            index = [self.viewControllersArray indexOfObject:vc];
            break;
        }
    }
    
    return index;
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPageNum = floor((self.scrollView.contentOffset.x - self.scrollView.frame.size.width / 2) /
                                     self.scrollView.frame.size.width) + 1;
    
    if (currentPageNum >= self.viewArray.count) {
        return;
    }
    
    NSInteger realIndex = [self p_getCurrentViewControllerIndexbyPageIndex:currentPageNum];
    
    [self setSelectTabBarWith:realIndex];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
}

#pragma mark - ZMMTabBarViewDelegate


- (BOOL)tabBar:(id<ZMMTabBarViewInterface> )tabBar
    shouldSelectItemAtIndex:(NSInteger)index
{
    if (self.selectedChildIndex == index) {
        return NO;
    }

    return YES;
}


- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar willSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index
{
    [self.tabBarView tabBarDidSelectItem:item index:index];
}


- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar didSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index
{
    if (index < 0 || index > self.viewControllersArray.count) {
        return;
    }
    self.selectedChildIndex = index;
    [self p_addCenterViewControllerIndex:index];
    
}

#pragma mark - publicMethod

- (void)addChildViewControllers:(NSArray<UINavigationController *> *)viewControllers
{
    if (viewControllers.count == 0) {
        return;
    }
    [self p_clearViewControllers];
    self.viewControllersArray = [NSArray arrayWithArray:viewControllers];

}

- (void)setTabBarImagesWidthChildIds:(NSArray *)childIds
{
    NSArray *existTabBarButtons = [self.tabBarView tabBarButtons];
    if (existTabBarButtons.count == 0) {
        [self p_creatTabBarButtons];
    }
    
    NSMutableArray *selectImgArray = [NSMutableArray new];
    NSMutableArray *normalImgArray = [NSMutableArray new];
    
    for (NSString *childId in childIds) {
        NSDictionary *dict = [ZMMTabbarChildResource getTabImgNameWith:childId];
        
        NSString *selectImageName = [dict objectForKey:@"select"];
        if (selectImageName) {
            [selectImgArray addObject:selectImageName];
        }
        NSString *normalImageName = [dict objectForKey:@"normal"];
        if (normalImageName) {
            [normalImgArray addObject:normalImageName];
        }
    }
    
    NSArray *tabBarButtons = [self.tabBarView tabBarButtons];
    
    for (id<ZMMTabBarButtonInterface> item in tabBarButtons) {
        NSInteger index = [tabBarButtons indexOfObject:item];
        [item setSelectedName:selectImgArray[index] normalName:normalImgArray[index]];
    }
    
}

-(void)setSelectTabBarWith:(NSUInteger)index
{
    //设置4个tabbar选中
    [self.tabBarView setTabViewSelectedIndex:index];
    //UIScrollView 选中第几个
    [self p_addCenterViewControllerIndex:index];
    self.selectedChildIndex = index;
}

#pragma mark - setter/getter
- (UIScrollView *)scrollView
{
    if (_scrollView) {
        return _scrollView;
    }
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.bounces = NO;
    return _scrollView;
    
}

- (UIView<ZMMTabBarViewInterface> *)tabBarView{
    if (_tabBarView) {
        return _tabBarView;
    }
    _tabBarView = [ZMMTabbarFactory getTabBarView];
    [_tabBarView setDelegate:self];
    return _tabBarView;
}

-(NSMutableArray *)viewArray
{
    if (_viewArray) {
        return _viewArray;
    }
    _viewArray = [[NSMutableArray alloc]initWithCapacity:1];
    return _viewArray;
}


@end
