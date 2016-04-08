//
//  PosterViewCell.h
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@class MovieDetailView;

@interface PosterViewCell : UICollectionViewCell
{
    UIImageView *_imageV; //海报
    MovieDetailView *_detailView; //电影详情
}
@property(nonatomic,retain)MovieModel *model;
//翻转
- (void)flips;
//复原
- (void)reset;

@end
