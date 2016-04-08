//
//  WXDataService.h
//  01 HomeTask
//
//  Created by wei.chen on 15/10/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataService : NSObject

/*
 urlstring : 接口的URL
 method ：请求方式
 params ：请求参数
 block  ：请求完成回调的block
 */
+ (void)requestURL:(NSString *)urlstring
        httpMethod:(NSString *)method
            params:(NSDictionary *)params
  completionHandle:(void(^)(id result))block;

@end
