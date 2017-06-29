//
//  SimpleWebViewController.m
//  alaxiaoyou
//
//  Created by Andy on 2016/11/15.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "SimpleWebViewController.h"

@interface SimpleWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) NSURLRequest *request;

@end

@implementation SimpleWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:self.request];
    
    // Do any additional setup after loading the view.
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _webView.backgroundColor = [UIColor clearColor];
        [_webView sizeToFit];
        _webView.delegate = self;
    }
    return _webView;
}

- (NSURLRequest *)request{
    if (!_request) {
        _request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.urlString]];
    }
    return _request;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    //获取当前页面的title
    if (self.title == nil) {
        self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSLog(@"error:%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
