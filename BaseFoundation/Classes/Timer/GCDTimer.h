//
//  GCDTimer.h
//  alaxiaoyou
//
//  Created by Andy on 2017/3/30.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDTimer : NSObject

@property (nonatomic, strong) dispatch_block_t block;
@property (nonatomic, strong) dispatch_source_t source;

+ (GCDTimer *)repeatTimerWithTimeInterval:(NSTimeInterval)seconds block:(dispatch_block_t)block;

@end
