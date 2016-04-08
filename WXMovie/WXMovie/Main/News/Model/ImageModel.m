//
//  ImageModel.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel


//- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic{
//    
//    NSDictionary *dic = @{@"id":@"imageID",
//                          @"image":@"image",
//                          @"type":@"type"
//                          };
//    
//    return dic;
//    
//}

- (void)setAttributes:(NSDictionary *)jsonDic{
    
    [super setAttributes:jsonDic];
    
    self.imageID = [jsonDic objectForKey:@"id"];
    
    
}


@end
