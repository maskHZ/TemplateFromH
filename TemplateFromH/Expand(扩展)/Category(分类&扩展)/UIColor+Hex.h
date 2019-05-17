//
//  UIColor+Hex.h
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *) colorWithHexString: (NSString *)color;

+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

+ (UIColor *)colorWithHex:(NSString *)hexColor ;

+ (NSString *) getColor:(NSArray*) colorArray WithIndex:(int)index;


@end

NS_ASSUME_NONNULL_END
