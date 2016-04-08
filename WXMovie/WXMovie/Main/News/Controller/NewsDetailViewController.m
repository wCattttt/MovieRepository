//
//  NewsDetailViewController.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
{
    UIActivityIndicatorView *_activity;
}
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    webView.backgroundColor = [UIColor greenColor];
    //自动适配屏幕
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    /*
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    webView.request = request;
    [webView loadRequest:request];
    */
    [self.view addSubview:webView];
    
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"html"];
    
    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:s baseURL:nil];*/
    
    
    NSDictionary *dic = [WXDataService requestData:news_detail];
    
    /*	
     "title" : "\"银河护卫队\"库珀配音浣熊 灭霸成反派幕后首脑",
     "content" :
     "time" : "2013-8-31 15:01:54",
     "source" : "Mtime时光网",
     "author" : "gmzyq 哈麦",
     "editor" : "ZR",
     */
    //读取json内的数据
    NSString *title = [dic objectForKey:@"title"];
    NSString *content = [dic objectForKey:@"content"];
    NSString *time = [dic objectForKey:@"time"];
    NSString *source = [dic objectForKey:@"source"];
    NSString *author = [dic objectForKey:@"author"];
    NSString *editor = [dic objectForKey:@"editor"];
    
    //加载html
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //子标题
    NSString *subTitle = [NSString stringWithFormat:@"%@,%@",source,time];
    //作者
    NSString *author1 = [NSString stringWithFormat:@"%@,%@",author,editor];
    //拼接完整的htnl
    NSString *htmlString = [NSString stringWithFormat:s,title,subTitle,content,author1];
    //webView加载数据
    [webView loadHTMLString:htmlString baseURL:nil];
    
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    [_activity stopAnimating];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:_activity];
    self.navigationItem.rightBarButtonItem = btn;
    
    
}
#pragma mark - UIWebView Delegate
//开始加载时调用
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [_activity startAnimating];
    
}
//加载结束时，调用
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activity stopAnimating];
}

@end
