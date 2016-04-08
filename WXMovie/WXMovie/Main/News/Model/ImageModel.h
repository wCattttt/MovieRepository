//
//  ImageModel.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface ImageModel : BaseModel
/*
 {
 "id": 2238621,
 "image": "http://img31.mtime.cn/pi/2013/02/04/093444.29353753_1280X720.jpg",
 "type": 6
 },
 */


@property(nonatomic,retain)NSNumber *imageID;//图片ID
@property(nonatomic,copy)NSString *image;  //图片的URL
@property(nonatomic,retain)NSNumber *type;  //图片类型

@end
