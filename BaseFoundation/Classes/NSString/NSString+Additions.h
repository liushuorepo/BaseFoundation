//
//  NSString+Additions.h
//  Additions
//
//  Created by jimzhao on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Additions.h"

NSString *getSafeString(NSString *inStr);

@interface NSString(Additions)

#pragma mark ---- tools for string

+ (NSString *)UUID;

- (NSString *)md5;

- (NSString *)formattedPhoneNumber;

#pragma mark ----- operation for URL relatived

- (NSString *)urlStringValueForQueryKey:(NSString *)key;

- (NSString *)urlUTF8Decode;

- (NSString *)urlUTF8Encode;

- (NSString *)urlGBKEncode;

- (NSString *)urlRelativePath;

- (NSURL*)toURL;
#pragma mark ----- operation for characters in string

- (char)safeCharacterAtIndex:(NSUInteger)index;

- (NSString *)safeString;

- (BOOL)containsString:(NSString *)string;

- (NSString *)trimPrefixBlank;

- (BOOL)isASCIIString;

- (unsigned int)hexInteger;

- (NSString *)escapeHTML;

- (NSString *)unescapeHTML;

- (NSString*)escapeNewLine;

#pragma mark ---- legal judge

- (BOOL)isLegalEmail;

- (BOOL)isLegalPhone;
- (BOOL)isLegalMobilePhone;
//身份证号
- (BOOL)isValidateIdentityCard;

#pragma mark ----  获取URL的指定参数对应值
- (NSString *)paramValueOfUrlwithParam:(NSString *) param;

////是否包含表情
//- (BOOL)isContainsEmoji;
////是佛包含特殊字符
//- (BOOL)isContainSpecialCharacter;
//不包含特殊字符
- (BOOL)notContainSpecialCharacter;
//是否包含表情
- (BOOL)isContainsEmoji;

@end
