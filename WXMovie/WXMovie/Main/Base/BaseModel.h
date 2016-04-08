//
//  BaseModel.h
//  WXMovie
//
//  Created by wei.chen on 13-9-3.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (id)initContentWithDic:(NSDictionary *)jsonDic;
- (void)setAttributes:(NSDictionary *)jsonDic;
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;

@end
