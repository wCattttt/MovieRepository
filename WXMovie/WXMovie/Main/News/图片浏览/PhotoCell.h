//
//  PhotoCell.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
//@class PhotoScrollView;
#import "PhotoScrollView.h"

@interface PhotoCell : UICollectionViewCell



@property(nonatomic,copy)NSString *urlStr;
@property(nonatomic,retain)PhotoScrollView *scrollV;


@end
