//
//  IndexViewCell.h
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;

@interface IndexViewCell : UICollectionViewCell
{
    UIImageView *_imageV;
}
@property(nonatomic,retain)MovieModel *model;

@end
