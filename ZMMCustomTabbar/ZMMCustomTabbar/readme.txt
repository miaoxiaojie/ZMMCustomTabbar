
tabbar 设计

1.功能
 (1)4个TabBarVc可以左右滑动
 (2)tabBarItem 可以随意定制，比如title image badgeValue
2.视图的层级
  UIWindow -- UINavigationController -- ZMMRootViewController -- ZMMTabBarViewController -- UINavigationController --  ZMMTabbarChildController (自控制器) -- ZMMTableViewController


3.外边暴露的方法
  （1)获得 rootVC
   (2)选中第几个Tabbar

4.TabBarViewController 如何添加到 rootVC 上面

 将创建好带有子控制的tabBarVC 通过 ZMMRootVcManager 管理器 添加到 rootVC
 通过管理器ZMMRootVcManager 获得 rootVC 然后把 rootVC 添加到 UINavigationController

5.ZMMTabBarViewController 功能

  UITabBarController 由内容+底部Tab 组成可加入多个ViewController，每个对应底部一个tabBarItem

  (1) 里面有 ZMMTabBarView 和  UIScrollView
      ZMMTabBarView 里面包含 ZMMTabBarButton
      子控制器的view 添加到 UIScrollView
  (2) UIScrollView 的循环轮播
  (3) 当UIScrollView滑动的时候滑动到当前页相应的TabBarButton 也要选中第几个
      同理当TabBarButton 选中的那一个，对应的子控制器也要选中到那一页
  (4) 注意：当TabBarButton 点击的时候要判断是否点击的还是本身

6. ZMMTabBarViewDelegate

  本身系统有五个代理，这里我只写了两个，一个是将要开始点击，一个是点击结束 ，又多添加一个判断是否能够点击


/**
否允许事件点击(防止点击本身)
@param tabBar 要点击tabBar
@return YES/NO
*/
- (BOOL)tabBar:(id<ZMMTabBarViewInterface> )tabBar
shouldSelectItemAtIndex:(NSInteger)index;

/**
将要被点击

@param tabBar 将要点击tabBar
@param item item
*/
- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar willSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index;

/**
item 被点击

@param tabBar 点击之后tabBar
@param item item
*/
- (void)tabBar:(id<ZMMTabBarViewInterface>)tabBar didSelectItem:(id<ZMMTabBarButtonInterface>)item index:(NSInteger)index;




