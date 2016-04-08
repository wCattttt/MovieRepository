//
//  TopViewCell.h
//  WXMovie
//
//  Created by imac on 15/9/11.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class MovieModel;

@interface TopViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *_imageV;
    
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet StarView *_ratingV;
    __weak IBOutlet UILabel *_ratingLabel;
    
}

@property(nonatomic,retain)MovieModel *model;

@end
