//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageV;
}
@property(nonatomic,copy)NSString *url;

@end
