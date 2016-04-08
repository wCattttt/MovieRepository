//
//  WXDataService.m
//  WXMovie
//
//  Created by imac on 15/9/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "WXDataService.h"

@implementation WXDataService
+(id)requestData:(NSString *)filePath{
    //获取json文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    //用NSJSONSerialization解析json数据
    id dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return dic;
}
@end
