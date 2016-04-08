//
//  NewsCell.h
//  WXMovie
//
//  Created by imac on 15/9/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;

@interface NewsCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_imageV;
    
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_subTitleLabel;
    
    __weak IBOutlet UIImageView *_typeImageV;
    
}

@property(nonatomic,retain)NewsModel *model;

@end
