//
//  HomeViewController.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class PosterView;

@interface HomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableV; // 列表视图
    PosterView *_posterV;  //海报视图
}
@end
