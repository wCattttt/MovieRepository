//
//  PhotoViewController.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController


@property(nonatomic,retain)NSArray *imageUrls;

@property(nonatomic,retain)NSIndexPath *indexPath; //要显示的图片的索引

@end
