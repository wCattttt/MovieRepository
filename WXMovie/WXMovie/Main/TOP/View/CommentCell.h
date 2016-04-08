//
//  CommentCell.h
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentModel;

@interface CommentCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_userImageV;
    
    __weak IBOutlet UIImageView *_imageV;
    
    __weak IBOutlet UIImageView *_bgImageView;
    
    __weak IBOutlet UILabel *_nickName;
    
    
    __weak IBOutlet UILabel *_commentLabel;
    __weak IBOutlet UILabel *_ratingLabel;
    
}

@property(nonatomic,retain)CommentModel *model;

@end
