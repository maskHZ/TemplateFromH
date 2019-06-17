//
//  UIImage+CaptureScreen.h
//  TemplateFromH
//
//  Created by January on 2019/5/20.
//  Copyright © 2019 January. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CaptureScreen)
//根据view截取图片
+(UIImage*) imageByCaptureScreenView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
