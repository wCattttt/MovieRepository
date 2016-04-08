//
//  NewsViewController.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
