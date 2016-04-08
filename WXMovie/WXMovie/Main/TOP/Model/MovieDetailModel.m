//
//  MovieDetailModel.m
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

-(void)setAttributes:(NSDictionary *)jsonDic{
    
    [super setAttributes:jsonDic];
    
    self.releaseLocation = [jsonDic objectForKey:@"release"];
    
}

@end
