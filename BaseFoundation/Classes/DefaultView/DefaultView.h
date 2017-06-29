//
//  DefaultView.h
//  alaxiaoyou
//
//  Created by Andy on 2017/6/6.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "BaseView.h"

typedef void(^ClickBlock)();

@interface DefaultView : BaseView

@property (copy, nonatomic) ClickBlock clickBlock;
@property (strong, nonatomic) UIImageView *img;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;

- (void)setUpButtonWith:(NSString *)title;

@end
