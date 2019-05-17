//
//  RootTabBarController.m
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import "RootTabBarController.h"
#import "CustomTabBar.h"
#import "NowViewController.h"
#import "EverViewController.h"
#import "AfterViewController.h"
#import "RootNavigationController.h"

@interface RootTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) CustomTabBar *plusTabBar;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * 设置凸起按钮
     */
    self.plusTabBar = [[CustomTabBar alloc] init];
    
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.plusTabBar.translucent = NO;
    
    self.plusTabBar.plusImage = [UIImage imageNamed:@"tabbar_icon_plusItem"];
    
    [self.plusTabBar.plusItem addTarget:self action:@selector(plusAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setValue:self.plusTabBar forKey:@"tabBar"];
    
    /*
     * 初始化
     */
    [self initTabBar];
    
    [self addChildViewControllers];
    
    // Do any additional setup after loading the view.
}

#pragma mark 初始化TabBar
- (void)initTabBar
{
    // TabBar 正常颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:AutoFitCG(11.0f)],NSForegroundColorAttributeName : RGBColor(136, 136, 136)} forState:UIControlStateNormal];
    
    // TabBar 选中颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:JBetweenColor]} forState:UIControlStateSelected];
    
    // 使用图片设置tabbar背景
    // NSString *tabBarBgName = kStatusBarHeight > 20 ? @"tabbar_bg_x": @"tabbar_bg";
    
    // [self.tabBar setBackgroundImage:[UIImage imageNamed: tabBarBgName]];
    
    // 设置tabbar背景色
    [self.tabBar setBarTintColor:[UIColor colorWithHex:JThemeColor]];
    
    self.tabBar.translucent = NO;
    
    //tabBar线的颜色
    [self setTabBarShadowOpacity];
    
    self.delegate = self;
}

#pragma mark 设置TabBar灰色线条为阴影
- (void)setTabBarShadowOpacity{
    // 绘制Image
    CGRect rect = CGRectMake(0, 0, JScreenWidth, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setBackgroundImage:img];
    
    [self.tabBar setShadowImage:img];
    
    self.tabBar.layer.shadowColor = [UIColor colorWithHex:JBetweenColor].CGColor;
    
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    
    self.tabBar.layer.shadowOpacity = 0.5;//阴影透明度，默认0
}
#pragma mark 添加子视图控制器
- (void)addChildViewControllers{
    
    //曾经
    RootNavigationController *everVC = [self addChildViewController:@"EverViewController" title:@"曾经" imageName:@"First_icon_uncheck" selectedImageName:@"First_icon_selected"];
    
    //现在 站位
    RootNavigationController *nowVC = [self addChildViewController:@"NowViewController" title:@"" imageName:@"1" selectedImageName:@"1"];
    
    //以后
    RootNavigationController *afterVC = [self addChildViewController:@"AfterViewController" title:@"以后" imageName:@"Third_icon_uncheck" selectedImageName:@"Third_icon_selected"];
    
    [self addChildViewController:everVC];
    
    [self addChildViewController:nowVC];
    
    [self addChildViewController:afterVC];
    
    
}

#pragma mark UITabBarControllerDelegate-添加子视图控制器详细方法
- (RootNavigationController *)addChildViewController:(NSString *)childVCString title:(NSString *)title imageName:(NSString *)icon selectedImageName:(NSString *)selectedIcon
{
    // 获取子视图
    Class childClass = NSClassFromString(childVCString);
    
    UIViewController *childController = [[childClass alloc] init];
    
    // TabBarItem 设置相关
    UITabBarItem *item = childController.tabBarItem;
    
    UIImage *iconImage = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectIconImage = [[UIImage imageNamed:selectedIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // TabBarItem 默认图片
    item.image = iconImage;
    
    // TabBarItem 选中图片
    item.selectedImage = selectIconImage;
    
    // 子视图标题
    childController.title = title;
    
    // 将子视图添加导航条
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:childController];
    
    return nav;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

#pragma mark 重写选中事件， 处理中间按钮选中问题
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    _plusTabBar.plusItem.selected = (tabBarController.selectedIndex == self.viewControllers.count/2);
    
    if (tabBarController.selectedIndex == self.viewControllers.count/2){
        // 旋转
        [self rotationAnimation];
    }else {
        // 停止旋转
        [self.plusTabBar.plusItem.layer removeAllAnimations];
    }
}

#pragma mark 旋转动画
- (void)rotationAnimation{
    if ([@"key" isEqualToString:[self.plusTabBar.plusItem.layer animationKeys].firstObject]){
        return;
    }
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [self.plusTabBar.plusItem.layer addAnimation:rotationAnimation forKey:@"key"];
}
#pragma mark 中间按钮的点击事件
- (void)plusAction:(UIButton *)button{
    // 选中按钮所在tabbarVC
    NSInteger count = self.viewControllers.count;
    self.selectedIndex = count/2;//关联中间按钮
    [self tabBarController:self didSelectViewController:self.viewControllers[self.selectedIndex]];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
