//
//  BaseCollectionViewCell.m
//  alaxiaoyou
//
//  Created by Andy on 2016/12/13.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

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
