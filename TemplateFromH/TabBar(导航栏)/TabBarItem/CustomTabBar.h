//
//  CustomTabBar.h
//  TemplateFromH
//
//  Created by January on 2019/5/17.
//  Copyright © 2019 January. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTabBar : UITabBar

/**
 TabBar凸起按钮
 */
@property (nonatomic, strong) UIButton *plusItem;

/**
 TabBar标题
 */
@property (nonatomic, strong) UILabel  *plusTitle;

/**
 中间按钮图片
 */
@property (nonatomic, strong) UIImage *plusImage;

/**
 中间按钮选中图片
 */
@property (nonatomic, strong) UIImage *plusSelectedImage;

/**
 中间按钮偏移量，默认是居中
 */
@property (nonatomic, assign) CGFloat plusOffsetY;

/**
 中间按钮的宽和高，默认使用图片宽高
 */
@property (nonatomic, assign) CGFloat plusWidth, plusHeight;
@end

NS_ASSUME_NONNULL_END
