//
//  AppDefine.h
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h

// 当前TabBar显示数量
#define JTabBarItemNumber 3

// App内主题颜色
#define JThemeColor @"#c8f0f8"

// App内区分颜色
#define JBetweenColor @"#e95459"

// 定义高度
#define JScreenSize [UIScreen mainScreen].bounds.size

#define JScreenWidth JScreenSize.width

#define JScreenHeight JScreenSize.height

// 获得RGB颜色
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define RGBColor(r, g, b) RGBAColor(r,g,b,1.0)

// 获取状态栏的高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

// 适配模式计算各型号手机Float比例值
#define AutoFitCG(num) [NSNumber CGFloatAutoFit:(num)]

#endif /* AppDefine_h */
