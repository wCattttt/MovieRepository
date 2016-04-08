//
//  StarView.h
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *yellowView;  //黄色星星
    UIView *grayView;// 灰色星星
}
@property(nonatomic,assign)float rating;

@end
