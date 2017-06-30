//
//  Notification.m
//  alaxiaoyou
//
//  Created by Andy on 2016/12/29.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "Notification.h"

@implementation Notification

+ (void)postNotification:(NSString *)name{
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:nil];
}

+ (void)postNotification:(NSString *)name object:(NSObject *)obj{
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:obj];
}

+ (void)postNotification:(NSString *)name object:(NSObject *)obj userInfo:(NSDictionary *)info{
    [[NSNotificationCenter defaultCenter]postNotificationName:name object:obj userInfo:info];
}

+ (void)addNotification:(NSString *)name observer:(id)observer selector:(SEL)selector{
    [[NSNotificationCenter defaultCenter]addObserver:observer selector:selector name:name object:nil];
}

+ (void)addNotification:(NSString *)name observer:(id)observer selector:(SEL)selector object:(NSObject *)obj{
    [[NSNotificationCenter defaultCenter]addObserver:observer selector:selector name:name object:obj];
}

+ (void)removeNotification:(NSString *)name observer:(id)observer{
    [[NSNotificationCenter defaultCenter]removeObserver:observer name:name object:nil];
}

+ (void)removeNotificationObserver:(id)observer{
    [[NSNotificationCenter defaultCenter]removeObserver:observer];
}

@end
