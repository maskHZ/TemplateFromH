//
//  UIImage+CaptureScreen.m
//  TemplateFromH
//
//  Created by January on 2019/5/20.
//  Copyright © 2019 January. All rights reserved.
//

#import "UIImage+CaptureScreen.h"

@implementation UIImage (CaptureScreen)
//根据view截取图片
+(UIImage*) imageByCaptureScreenView:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
