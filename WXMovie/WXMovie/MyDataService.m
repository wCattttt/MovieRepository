//
//  WXDataService.m
//  01 HomeTask
//
//  Created by wei.chen on 15/10/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MyDataService.h"

#define BASE_URL @"https://api.douban.com"  //--->ip--->服务器

@implementation MyDataService

+ (void)requestURL:(NSString *)urlstring //
        httpMethod:(NSString *)method
            params:(NSDictionary *)params   //{token:weoriuwoi2323,status:test}
  completionHandle:(void(^)(id result))block {
    
    //1.url
    urlstring = [BASE_URL stringByAppendingFormat:@"%@",urlstring];
    NSURL *url = [NSURL URLWithString:urlstring];
    
    //2.request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 30;
    request.HTTPMethod = method;
    
    //3.处理请求参数
    //1>拼接请求参数(格式：&拼接)：key1=value1&key2=value2&..
    NSMutableString *paramsSTR = [NSMutableString string];
    
    __block int index = 0;
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if (index > 0) {
            [paramsSTR appendString:@"&"];
        }
        
        [paramsSTR appendFormat:@"%@=%@",key,obj];
        
        index++;
    }];
    
    
    //2>添加请求参数
    /*
     1.GET 请求参数拼接到URL后面
     2.POST 请求参数添加到请求体中
     */
    if ([method isEqualToString:@"GET"]) {
        
        //paramsSTR: token=2weli9we99x&stuts=sendweibo
        //url:https://api.weibo.com/2/statuses/home_timeline.json
        //url:https://api.weibo.com/2/statuses/home_timeline.json?count=20
        
        NSString *separe = url.query?@"&":@"?";
        
        NSString *paramsURL = [NSString stringWithFormat:@"%@%@%@",urlstring,separe,paramsSTR];
        request.URL = [NSURL URLWithString:paramsURL];
    }
    else if([method isEqualToString:@"POST"]) {
        
        NSData *bodyData = [paramsSTR dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:bodyData];
    }
    
    //3.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil) {
            NSLog(@"请求网络失败:%@",error);
            return;
        }
        
        //1.解析数据
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //2.回到主线程，回调block
        dispatch_async(dispatch_get_main_queue(), ^{
           
            block(result);
            
        });
        
    }];
    
    //5.发送任务
    [task resume];
}


@end
