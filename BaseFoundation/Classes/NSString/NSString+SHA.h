//
//  NSString+SHA.h
//  alaxiaoyou
//
//  Created by Andy on 2017/3/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHA)

- (NSString *)sha1;
- (NSString *)sha224;
- (NSString *)sha256;
- (NSString *)sha384;
- (NSString *)sha512;

@end
