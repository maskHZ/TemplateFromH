//
//  NSString+Judge.m
//  TemplateFromH
//
//  Created by January on 2019/5/17.
//  Copyright © 2019 January. All rights reserved.
//

#import "NSString+Judge.h"

@implementation NSString (Judge)

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

+ (NSString*) getRmoveNilString:(NSString *)string
{
    if (string == nil) {
        return @"";
    }
    if (string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if([string length] == 0) { //string isempty or nil
        return @"";
    }
    if([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) { //string is all whitespace
        return @"";
    }
    if ([string isEqualToString:@"<null>"]) {
        return @"";
    }
    return string;
}

#pragma mark 分割字符串为数组
- (NSArray *)separateStringByCharacter:(NSString *)string
{
    NSArray *array=[self componentsSeparatedByString:string];
    
    return array;
}

#pragma mark 是否空字符串
- (BOOL)isEmptyString
{
    return ([self trimString].length == 0);
}

+ (BOOL)isEmptyString:(NSString *)string
{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if([string length] == 0) { //string isempty or nil
        return YES;
    }
    if([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) { //string is all whitespace
        return YES;
    }
    return NO;
}

#pragma mark 是否空字符串
+ (BOOL)isBlankString:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
