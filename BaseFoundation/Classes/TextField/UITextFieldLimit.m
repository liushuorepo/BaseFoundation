//
//  UITextFieldLimit.m
//  alaxiaoyou
//
//  Created by Andy on 2016/11/23.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "UITextFieldLimit.h"

@implementation UITextFieldLimit

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLimit:MAXFLOAT];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                    name:UITextFieldTextDidChangeNotification object:self];
    }
    return self;
}

- (void)textFiledEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
        if (toBeString.length > self.limit) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.limit];
            if (rangeIndex.length == 1) {
                textField.text = [toBeString substringToIndex:self.limit];
            }else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.limit)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
