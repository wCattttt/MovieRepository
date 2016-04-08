//
//  MovieCell.h
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@class StarView;

@interface MovieCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_imgeView;
    __weak IBOutlet UILabel *_ratingLabel;
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_yearLabel;
    
    __weak IBOutlet StarView *_ratingView;
    
}

@property(nonatomic,retain)MovieModel *model;  //cell显示的电影数据

@end
