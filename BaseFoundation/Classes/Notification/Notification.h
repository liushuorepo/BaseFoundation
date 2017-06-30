//
//  Notification.h
//  alaxiaoyou
//
//  Created by Andy on 2016/12/29.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSNotification

+ (void)postNotification:(NSString *)name;
+ (void)postNotification:(NSString *)name object:(NSObject *)obj;
+ (void)postNotification:(NSString *)name object:(NSObject *)obj userInfo:(NSDictionary *)info;

+ (void)addNotification:(NSString *)name observer:(id)observer selector:(SEL)selector;
+ (void)addNotification:(NSString *)name observer:(id)observer selector:(SEL)selector object:(NSObject *)obj;

+ (void)removeNotification:(NSString *)name observer:(id)observer;
+ (void)removeNotificationObserver:(id)observer;

@end
