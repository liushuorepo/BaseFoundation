//
//  XYEdgeInsetsButton.h
//  alaxiaoyou
//
//  Created by mac on 17/1/16.
//  Copyright © 2017年 MoDeguang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HYButtonEdgeInsetsStyle) {
    HYButtonEdgeInsetsStyleImageLeft,
    HYButtonEdgeInsetsStyleImageRight,
    HYButtonEdgeInsetsStyleImageTop,
    HYButtonEdgeInsetsStyleImageBottom
};

@interface XYEdgeInsetsButton : UIButton

#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger edgeInsetsStyle;
#else
@property (nonatomic) HYButtonEdgeInsetsStyle edgeInsetsStyle;
#endif
@property (nonatomic) IBInspectable CGFloat imageTitleSpace;

@end
