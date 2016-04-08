//
//  UIView+Ext.m
//  WXMovie
//
//  Created by imac on 15/9/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "UIView+Ext.h"

@implementation UIView (Ext)

- (void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width{
    
    return self.frame.size.width;
    
}

@end
