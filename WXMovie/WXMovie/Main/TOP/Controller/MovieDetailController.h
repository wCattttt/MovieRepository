//
//  MovieDetailController.h
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "BaseViewController.h"

@interface MovieDetailController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableV;
}

@property(nonatomic,assign)NSInteger currentIndex; //当前选中的单元格索引

@end
