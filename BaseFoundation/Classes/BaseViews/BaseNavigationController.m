//
//  BaseNavigationController.m
//  alaxiaoyou
//
//  Created by Andy on 2016/11/2.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //ios7.0下的导航栏默认是半透明的，设为NO
//    self.navigationBar.translucent = NO;
//    //设置导航栏字体颜色
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_TEXT_BLACK}];
//    //设置导航栏背景颜色
//    self.navigationBar.barTintColor = [UIColor whiteColor];
//    //去掉透明后导航栏下边的黑边（单页面）
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

/**
 这个方法只会在类第一次使用的时候调用
 */
+ (void)initialize{
    [super initialize];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    //ios7.0下的导航栏默认是半透明的，设为NO
    navBar.translucent = NO;
    //设置导航栏字体颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    //设置导航栏背景颜色
    navBar.barTintColor = [UIColor whiteColor];
    //去掉透明后导航栏下边的黑边（全局作用域）
    [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[[UIImage alloc] init]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
