//
//  NSNumber+AutoFit.m
//  TemplateFromH
//
//  Created by January on 2019/5/17.
//  Copyright © 2019 January. All rights reserved.
//

#import "NSNumber+AutoFit.h"

@implementation NSNumber (AutoFit)

+ (CGFloat)CGFloatAutoFit:(CGFloat)num {
    CGFloat min = [UIScreen mainScreen].bounds.size.height < [UIScreen mainScreen].bounds.size.width ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
    return min / 414 * num;
}

@end
