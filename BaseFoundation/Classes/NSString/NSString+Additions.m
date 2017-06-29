//
//  NSString+Additions.m
//  Additions
//
//  Created by jimzhao on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Additions.h"
#import <CommonCrypto/CommonDigest.h>

NSString *getSafeString(NSString *inStr) {
  if (inStr == NULL || inStr.length == 0) {
    return @"";
  } else {
    return inStr;
  }
}

@implementation NSString(Additions)

#pragma mark ---- tools for string

+ (NSString *)UUID {
  NSString *result = nil;
  
  CFUUIDRef   uuid;
  CFStringRef uuidStr;
	
  uuid = CFUUIDCreate(NULL);
  assert(uuid != NULL);
	
  uuidStr = CFUUIDCreateString(NULL, uuid);
  assert(uuidStr != NULL);
  
  result = [NSString stringWithString:(__bridge NSString *)uuidStr];
	
  CFRelease(uuidStr);
  CFRelease(uuid);
	
  return result;
}

- (NSString *)md5 {
  const char *zcSrc = [self UTF8String];  
  
  unsigned char zcDes[16];  
  CC_MD5( zcSrc, (int)strlen(zcSrc), zcDes );
  
  return [NSString stringWithFormat:  
          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  
          zcDes[0], zcDes[1], zcDes[2], zcDes[3],   
          zcDes[4], zcDes[5], zcDes[6], zcDes[7],  
          zcDes[8], zcDes[9], zcDes[10], zcDes[11],  
          zcDes[12], zcDes[13], zcDes[14], zcDes[15]  
          ]; 
}

- (NSString* )formattedPhoneNumber {
    if (self.length == 0 || [self length] > 32)
        return @"";
    char* cp = (char*)[self UTF8String];
    char chNum[33] = {0};
    int j = 0;
    for (int i = 0;i < [self length]; i++) {
        char ch = cp[i];
        if ((ch >= '0' && ch <= '9')) {
            chNum[j++] = ch;
        }
    }
    chNum[j] = '\0';
    return [NSString stringWithUTF8String:chNum];
}

#pragma mark ----- operation for URL relatived

- (NSString *)urlStringValueForQueryKey:(NSString *)key {
  NSString *result = nil;
  
  NSURL * url = [NSURL URLWithString:self];
  NSArray *queries = [url.query componentsSeparatedByString:@"&"];
  
  for (NSString *queryPair in queries) {
    NSArray *pairs = [queryPair componentsSeparatedByString:@"="];
    if (2 == [pairs count]) {
      NSString *tmpKey = [pairs objectAtIndex:0];
      NSString *tmpVal = [pairs objectAtIndex:1];
      
      if (NSOrderedSame == [tmpKey compare:key options:NSCaseInsensitiveSearch]) {
        result = tmpVal;
        break;
      }
    }
  }
  
  return result;
}

- (NSString *)urlUTF8Decode {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlUTF8Encode {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8));
    return result;
}

- (NSString *)urlGBKEncode {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingDOSChineseSimplif));
    return result;
}

- (NSString *)urlRelativePath {
    NSURL *url = [NSURL URLWithString:self];
    if (url != nil) {
        return [url relativePath];
    } else {
        return nil;
    }
}

- (NSURL*)toURL {
  if (self == nil) {
    return nil;
  }
  return [NSURL URLWithString:self];
}

#pragma mark ----- operation for characters in string

- (char)safeCharacterAtIndex:(NSUInteger)index {
    if (self.length <= index) {
        return EOF;
    } else {
        return (char)[self characterAtIndex:index];
    }
}

- (NSString *)safeString {
    if (self.length == 0 || [self isEqualToString:@"(null)"]) {
        return @"";
    } else {
        return self;
    }
}


- (BOOL)containsString:(NSString *)string {
	return !NSEqualRanges([self rangeOfString:string], NSMakeRange(NSNotFound, 0));
}

- (NSString *)trimPrefixBlank {
    NSString *result = nil;
    
    NSInteger i = 0;
    NSInteger length = [self length];
    while ( (i < length) && (' ' ==[self characterAtIndex:i]) )
        ++i;
    
    if (i < length)
        result = [self substringFromIndex:i];
    
    return result;
}
- (BOOL)isASCIIString {
    if (self == nil) {

        return YES;
    }
    const char *utf8Str = [self UTF8String];
    for (int i = 0; i < strlen(utf8Str); i++) {
        char ch = utf8Str[i];
        bool flag = isascii(ch);
        if (!flag) {
            return NO;
        }
    }
    return YES;
}

- (unsigned int)hexInteger {
    unsigned int result = 0;
    
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    if (![scanner scanHexInt:&result])
        result = 0;
    
    return result;
}


#pragma mark - HTML Methods

- (NSString *)escapeHTML {
	NSMutableString *s = [NSMutableString string];
	
	NSUInteger start = 0;
	NSUInteger len = [self length];
	NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"<>&\""];
	
	while (start < len) {
		NSRange r = [self rangeOfCharacterFromSet:chs options:0 range:NSMakeRange(start, len-start)];
		if (r.location == NSNotFound) {
			[s appendString:[self substringFromIndex:start]];
			break;
		}
		
		if (start < r.location) {
			[s appendString:[self substringWithRange:NSMakeRange(start, r.location-start)]];
		}
		
		switch ([self characterAtIndex:r.location]) {
			case '<':
				[s appendString:@"&lt;"];
				break;
			case '>':
				[s appendString:@"&gt;"];
				break;
			case '"':
				[s appendString:@"&quot;"];
				break;
        //			case '…':
        //				[s appendString:@"&hellip;"];
        //				break;
			case '&':
				[s appendString:@"&amp;"];
				break;
		}
		
		start = r.location + 1;
	}
	
	return s;
}


- (NSString *)unescapeHTML {
  if (self.length <= 0) {
    return nil;
  }
  
	NSMutableString *s = [NSMutableString string];
	NSMutableString *target = [NSMutableString stringWithString:self];
	NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"&"];
	
	while ([target length] > 0) {
		NSRange r = [target rangeOfCharacterFromSet:chs];
		if (r.location == NSNotFound) {
			[s appendString:target];
			break;
		}
		
		if (r.location > 0) {
			[s appendString:[target substringToIndex:r.location]];
			[target deleteCharactersInRange:NSMakeRange(0, r.location)];
		}
		
		if ([target hasPrefix:@"&lt;"]) {
			[s appendString:@"<"];
			[target deleteCharactersInRange:NSMakeRange(0, 4)];
		} else if ([target hasPrefix:@"&gt;"]) {
			[s appendString:@">"];
			[target deleteCharactersInRange:NSMakeRange(0, 4)];
		} else if ([target hasPrefix:@"&quot;"]) {
			[s appendString:@"\""];
			[target deleteCharactersInRange:NSMakeRange(0, 6)];
		} else if ([target hasPrefix:@"&#39;"]) {
			[s appendString:@"'"];
			[target deleteCharactersInRange:NSMakeRange(0, 5)];
		} else if ([target hasPrefix:@"&amp;"]) {
			[s appendString:@"&"];
			[target deleteCharactersInRange:NSMakeRange(0, 5)];
		} else if ([target hasPrefix:@"&hellip;"]) {
			[s appendString:@"…"];
			[target deleteCharactersInRange:NSMakeRange(0, 8)];
		} else {
			[s appendString:@"&"];
			[target deleteCharactersInRange:NSMakeRange(0, 1)];
		}
	}
  
	return s;
}

- (NSString*)escapeNewLine {
  if ([self containsString:@"\n"]) {
    NSArray *array = [self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSMutableString *retStr = [NSMutableString string];
    for (NSString *str in array) {
      if (str.length > 0) {
        [retStr appendFormat:@"%@\n", str];
      }
    }
    
    if ([retStr hasSuffix:@"\n"]) {
      [retStr replaceCharactersInRange:NSMakeRange(retStr.length-1, 1) withString:@""];
    }
    
    return retStr;
  }
  
  return self;
}

- (BOOL)isLegalEmail {
  if ([self containsString:@"@"] && [self containsString:@"."]) {
    NSString *emailRegex = @"^[[:alnum:]!#$%&'*+/=?^_`{|}~-]+((\\.?)[[:alnum:]!#$%&'*+/=?^_`{|}~-]+)*@[[:alnum:]-]+(\\.[[:alnum:]-]+)*(\\.[[:alpha:]]+)+$";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
  }
  
  return NO;
}

- (BOOL)isLegalMobilePhone {
  if (self.length == 0 || [self length] > 16) {
    return NO;
  }
  
  NSString *phoneRegex = @"^(1([34578][0-9]))\\d{8}$";
  NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
  BOOL matches = [test evaluateWithObject:self];
  return matches;
}

- (BOOL)isLegalPhone {
  if (self.length == 0 || [self length] > 16) {
    return NO;
  }
  
  NSString *tmpStr = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
  BOOL isLegal = YES;
  
  for (int i = 0;i < [tmpStr length]; i++) {
    char ch = (char)[tmpStr characterAtIndex:i];
    if ((ch >= '0' && ch <= '9')) {
      ;
    } else {
      isLegal = NO;
      break;
    }
  }
  
  return isLegal;
}
//身份证号
- (BOOL)isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL matches = [identityCardPredicate evaluateWithObject:self];
    return matches;
}

#pragma mark ----  获取URL的指定参数对应值
- (NSString *)paramValueOfUrlwithParam:(NSString *) param {
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",param];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:self
                                      options:0
                                        range:NSMakeRange(0, [self length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [self substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        return tagValue;
    }
    return nil;
}
////是否包含表情
//- (BOOL)isContainsEmoji{
//    NSString *emojiRegex = @"[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]";
//    NSPredicate *emojiPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emojiRegex];
//    return [emojiPredicate evaluateWithObject:self];
//}
////特殊字符判断
//- (BOOL)isContainSpecialCharacter {
//    NSString *regex = @"[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    return [predicate evaluateWithObject:self];
//}
//不包含特殊字符
- (BOOL)notContainSpecialCharacter{
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5]";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
//是否包含表情
- (BOOL)isContainsEmoji{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar high = [substring characterAtIndex: 0];
                                
                                // Surrogate pair (U+1D000-1F9FF)
                                if (0xD800 <= high && high <= 0xDBFF) {
                                    const unichar low = [substring characterAtIndex: 1];
                                    const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
                                    
                                    if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                                        returnValue = YES;
                                    }
                                    
                                    // Not surrogate pair (U+2100-27BF)
                                } else {
                                    if (0x2100 <= high && high <= 0x27BF){
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

@end

