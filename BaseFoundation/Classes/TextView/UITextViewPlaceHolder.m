//
//  UITextViewPlaceHolder.m
//  alaxiaoyou
//
//  Created by Andy on 2016/11/23.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "UITextViewPlaceHolder.h"

@interface UITextViewPlaceHolder()

@property (nonatomic, retain) UILabel *placeHolderLabel;

@end

@implementation UITextViewPlaceHolder

CGFloat const UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION = 0.25;

- (void)awakeFromNib{
    [super awakeFromNib];
    
    // Use Interface Builder User Defined Runtime Attributes to set
    // placeholder and placeholderColor in Interface Builder.
    if (!self.placeholder) {
        [self setPlaceholder:@""];
    }
    
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification{
    
    if([[self placeholder] length] == 0) {
        return;
    }
    
    [UIView animateWithDuration:UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION animations:^{
        if ([[self text] length] == 0) {
            [[self viewWithTag:999] setAlpha:1];
        } else {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 ) {
        if (!_placeHolderLabel) {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, self.bounds.size.width - 16, 0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 ) {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
