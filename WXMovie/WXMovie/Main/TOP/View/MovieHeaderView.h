//
//  MovieHeaderView.h
//  WXMovie
//
//  Created by wei.chen on 14-1-21.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieDetailModel;
@interface MovieHeaderView : UIView {
    
    IBOutlet UIImageView *movieImg;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *directorLabel;
    IBOutlet UILabel *actorLabel;
    IBOutlet UILabel *typeLabel;
    IBOutlet UILabel *releaseLabel;
    IBOutlet UIView *imgView;
    
    NSMutableArray *imgs;
}

@property(nonatomic,retain)MovieDetailModel *movieDetail;

@end
