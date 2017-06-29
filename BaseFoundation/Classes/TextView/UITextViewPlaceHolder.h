//
//  UITextViewPlaceHolder.h
//  alaxiaoyou
//
//  Created by Andy on 2016/11/23.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextViewPlaceHolder : UITextView

//IBInspectable: 让你的自定义 UIView 的属性出现在 IB 中 Attributes inspector
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
