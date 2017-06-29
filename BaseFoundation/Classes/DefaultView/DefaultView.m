//
//  DefaultView.m
//  alaxiaoyou
//
//  Created by Andy on 2017/6/6.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "DefaultView.h"
#import "Masonry.h"

@implementation DefaultView

- (void)setupSubviews {

    [self addSubview:self.img];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-60);
    }];
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.img.mas_bottom).offset(20);
    }];
}

- (void)setUpButtonWith:(NSString *)title{
    [self.img mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(-120);
    }];
    [self.button setTitle:title forState:UIControlStateNormal];
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.height.equalTo(@40);
    }];
    [self layoutIfNeeded];
}

- (UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.backgroundColor = [UIColor clearColor];
        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont systemFontOfSize:14.f];
        _label.textColor = [UIColor lightGrayColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
    }
    return _label;
}

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor clearColor];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)btnClick:(UIButton *)button{
    self.clickBlock();
}

@end
