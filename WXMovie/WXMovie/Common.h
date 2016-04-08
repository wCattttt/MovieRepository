//
//  Common.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#ifndef WXMovie_Common_h
#define WXMovie_Common_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "UIImageView+WebCache.h"  //加载网络图片
#import "UIViewExt.h"  //uiView的扩展方法
#import "WXDataService.h"  //加载数据

#define us_box @"us_box"  //主页显示的数据
#define top250 @"top250"  //top页面显示数据
#define news_list @"news_list"  //新闻页面
#define image_list @"image_list"  //图片新闻数据
#define news_detail @"news_detail"  //新闻数据

#define movie_detail @"movie_detail"  //电影详细数据
#define movie_comment @"movie_comment"  //电影评论数据

#import "UIViewController+HUD.h"    // 提示

#endif
