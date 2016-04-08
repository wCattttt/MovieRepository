//
//  PhotoCell.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PhotoCell.h"
//#import "PhotoScrollView.h"

@implementation PhotoCell

-(void)awakeFromNib{
        [self creatSubView];
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self creatSubView];

    }
    return self;
}

- (void)creatSubView{
    //创建UIScrollView子视图
    _scrollV = [[PhotoScrollView alloc] initWithFrame:self.bounds];
//    _scrollV.url = self.urlStr;
    [self.contentView addSubview:_scrollV];
}

- (void)setUrlStr:(NSString *)urlStr{
//    _urlStr = urlStr;
    
    _scrollV.url = urlStr;
    
}

@end
