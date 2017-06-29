//
//  XYSearchBar.m
//  alaxiaoyou
//
//  Created by Andy on 2017/3/6.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "XYSearchBar.h"

@implementation XYSearchBar

- (void)drawRect:(CGRect)rect {
    //iOS7.0及之后，UISearchbar视图里包含的是一个UIView视图,然后UIView视图里面才是UISearchBarBackground和UISearchBarTextField两个视图
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 0) {
            self.barTintColor = [UIColor whiteColor];
            //去掉UISearchBarBackground
            [[view.subviews objectAtIndex:0] removeFromSuperview];
            //自定义UISearchBarTextField
            UIView *searchField = [view.subviews lastObject];
            searchField.backgroundColor = [UIColor whiteColor];
            break;
        }
    }
    //ios7.0之后
    UIView *view = self.subviews[0];
    for (UIView *sub in [view subviews]) {
        if ([sub isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancelBtn = (UIButton *)sub;
            [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
        }
    }
}

@end
