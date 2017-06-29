//
//  BaseView.m
//  alaxiaoyou
//
//  Created by Andy on 2016/11/1.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}


- (void)setupSubviews{
    //留给子类重写
}

@end
