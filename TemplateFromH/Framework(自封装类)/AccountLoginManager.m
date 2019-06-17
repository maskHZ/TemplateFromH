//
//  AccountLoginManager.m
//  TemplateFromH
//
//  Created by January on 2019/5/21.
//  Copyright © 2019 January. All rights reserved.
//

#import "AccountLoginManager.h"
#import "AppHeader.h"
#import "LoginView.h"

@implementation AccountLoginManager

/**
 显示登录登录框
 */
+ (void) showLoginView
{
    // 将登录框添加到最上层
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 浮层框
    UIView *floatView = [[UIView alloc]init];
    
    [floatView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f]];
    
    [window addSubview:floatView];
    
    [floatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(window);
    }];
    
    
    // 登录框
    LoginView *loginView = [[LoginView alloc]init];
    
    [floatView addSubview:loginView];
    
    loginView.layer.cornerRadius = AutoFitCG(5);
    
    loginView.layer.masksToBounds = YES;
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(AutoFitCG(120));
        make.centerX.mas_equalTo(floatView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(JScreenWidth/1.3, JScreenWidth/1.2));
    }];
    
}
@end
