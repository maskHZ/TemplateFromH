//
//  NSString+Judge.h
//  TemplateFromH
//
//  Created by January on 2019/5/17.
//  Copyright © 2019 January. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Judge)

- (NSString *)trimString;

+ (NSString *)GetUUID;

+ (NSString*) getRmoveNilString:(NSString *)string;

- (NSArray *)separateStringByCharacter:(NSString *)string;

- (BOOL)isEmptyString;

+ (BOOL)isEmptyString:(NSString *)string;

+ (BOOL)isBlankString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
