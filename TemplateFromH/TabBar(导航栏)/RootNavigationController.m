//
//  RootNavigationController.m
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import "RootNavigationController.h"
#import "AppHeader.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 初始化Navigation
 */
+ (void)initialize
{
    [self setNavigationItemTheme];
    
    [self setNavigationBarTheme];
}

/**
 设置Nav Item
 */
+ (void)setNavigationItemTheme
{
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    
    textAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:AutoFitCG(15)];
    
    [barItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
}

/**
 设置Nav Bar
 */
+ (void)setNavigationBarTheme
{
    // 取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    navBar.translucent = NO;
    // 设置导航栏背景颜色
    //    NSString *bgName = kStatusBarHeight > 20 ? @"navigation_bg_x": @"navigation_bg";
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"navigation_bg"] forBarMetrics:UIBarMetricsDefault];
    // 设置背景色
    navBar.barTintColor =  [UIColor colorWithHexString:JThemeColor];
    
    // 设置左右按钮颜色
    navBar.tintColor = [UIColor blackColor];
    
    // 设置导航栏标题颜色
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    
    textAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];// 标题颜色
    
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:AutoFitCG(20)];
    
    [navBar setTitleTextAttributes:textAttributes];
}


/**
 返回操作
 */
-(void)popself
{
    [self.view endEditing:YES];
    
    [self popViewControllerAnimated:YES];
}

/**
 跳转操作
 
 @param viewController 指定VC
 @param animated 是否使用动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 0){
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigation_back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(popself)];
        
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [super pushViewController:viewController animated:animated];
    
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    
    self.tabBarController.tabBar.frame = frame;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
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
