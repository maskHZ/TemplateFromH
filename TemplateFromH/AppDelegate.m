//
//  AppDelegate.m
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    RootTabBarController *rootTabBar = [[RootTabBarController alloc] init];
    
    self.window.rootViewController = rootTabBar;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark 当应用程序即将从活动状态移动到非活动状态时发送 或者当用户退出应用程序并开始转换到后台状态时
/**
 使用此方法暂停正在进行的任务，禁用定时器，并使图形呈现回调无效。游戏应该使用这种方法暂停游戏。

 @param application H
 */
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

#pragma mark 使用此方法可以释放共享资源、保存用户数据、使计时器失效，并存储足够的应用程序状态信息，以便在以后终止应用程序时将其恢复到当前状态
/**
 如果您的应用程序支持后台执行，则调用此方法而不是applicationWillTerminate:当用户退出时。

 @param application H
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

#pragma mark 在这里，您可以撤消在进入后台时所做的许多更改
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

#pragma mark 如果应用程序以前在后台，可以选择刷新用户界面。
/**
 重新启动应用程序处于非活动状态时暂停(或尚未启动)的任何任务

 @param application H
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

#pragma mark 在应用程序即将终止时调用。适当时保存数据
/**
 在应用程序终止之前保存应用程序托管对象上下文中的更改

 @param application H
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
}

@end
