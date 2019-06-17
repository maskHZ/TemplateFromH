//
//  JHCollectionViewCell.m
//  TemplateFromH
//
//  Created by January on 2019/5/20.
//  Copyright © 2019 January. All rights reserved.
//

#import "JHCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>

@implementation JHCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
-(void)layoutSubviews
{
    self.imageView.frame = self.bounds;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds cornerRadius:self.imgCornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    _imageView.layer.mask = maskLayer;
}

-(UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

@end
