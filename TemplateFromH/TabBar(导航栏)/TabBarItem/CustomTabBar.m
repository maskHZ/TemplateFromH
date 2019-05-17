//
//  CustomTabBar.m
//  TemplateFromH
//
//  Created by January on 2019/5/17.
//  Copyright © 2019 January. All rights reserved.
//

#import "CustomTabBar.h"

#define JTabBarItemHeight    49.0f

@implementation CustomTabBar

/**
 初始化Item

 @param frame 位置大小
 @return J
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIButton *plusItem = [[UIButton alloc] init];
        
        plusItem.adjustsImageWhenHighlighted = NO; // 去除选择时高亮
        
        plusItem.layer.masksToBounds = YES;
        
        [self addSubview:plusItem];
        
        self.plusItem = plusItem;
    }
    return self;
}

/**
 布局子视图
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (!_plusWidth || !_plusHeight || _plusWidth < 10.0f || _plusHeight < 10.0f) {
        _plusWidth = AutoFitCG(50.0f);
        
        _plusHeight = AutoFitCG(50.0f);
    }
    // 设置位置
    _plusItem.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _plusWidth)/2.0, -_plusHeight/2.0 + self.plusOffsetY, _plusWidth, _plusHeight);
    
    _plusItem.layer.cornerRadius = _plusWidth/2;
    
    // 置顶
    [self bringSubviewToFront:self.plusItem];
}

#pragma mark - 设置plusBtn图片
- (void)setPlusImage:(UIImage *)plusImage{
    _plusImage = plusImage;
    // 如果设置了宽高则使用设置的大小
    if (self.plusWidth <= 0 && self.plusHeight <= 0){
        //根据图片调整button的位置(默认居中，如果图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
        _plusWidth = plusImage.size.width;
        
        _plusHeight = plusImage.size.height;
        
    }
    [_plusItem setBackgroundImage:plusImage forState:UIControlStateNormal];
}

- (void)setPlusSelectedImage:(UIImage *)plusSelectedImage {
    _plusSelectedImage = plusSelectedImage;
    
    [_plusItem setBackgroundImage:plusSelectedImage forState:UIControlStateSelected];
}
#pragma mark - 处理超出区域点击无效的问题
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    } else {
        //转换坐标
        CGPoint tempPoint = [self convertPoint:point toView:self.plusItem];
        
        //判断点击的点是否在按钮区域内
        if ([self.plusItem pointInside:tempPoint withEvent:event]) {
            return self.plusItem;
        } else {
            return [super hitTest:point withEvent:event];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
