//
//  UIImage+reSize.m
//  alaxiaoyou
//
//  Created by Andy on 2017/5/18.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "UIImage+reSize.h"

@implementation UIImage (reSize)

//自定义图片尺寸
- (UIImage *)reSizeImageToSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [self drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}
//等比例缩放
- (UIImage *)scaleImageToScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scaleSize, self.size.height * scaleSize));
    [self drawInRect:CGRectMake(0, 0, self.size.width * scaleSize, self.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
                                
@end
