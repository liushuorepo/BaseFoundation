//
//  UIImage+reSize.h
//  alaxiaoyou
//
//  Created by Andy on 2017/5/18.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (reSize)

//自定义图片尺寸
- (UIImage *)reSizeImageToSize:(CGSize)reSize;
//等比例缩放
- (UIImage *)scaleImageToScale:(float)scaleSize;

@end
