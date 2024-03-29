//
//  TopViewCell.m
//  WXMovie
//
//  Created by imac on 15/9/11.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "TopViewCell.h"
#import "MovieModel.h"
#import "StarView.h"

@implementation TopViewCell

-(void)awakeFromNib{
    
//     _titleLabel.textColor = [UIColor yellowColor];
//     _titleLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    
}
- (void)setModel:(MovieModel *)model{
    
    if (_model != model) {
        _model = model;
        //告诉系统去布局子视图
        [self setNeedsLayout];
    }
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    //图片的设置
    NSDictionary *images = _model.images;
    NSString *imageString = [images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:imageString];
    [_imageV setImageWithURL:url];
    
    _ratingV.rating = [_model.average floatValue];
    
    _titleLabel.text = _model.title;
    
    NSString *rating = [NSString stringWithFormat:@"%.1f",[_model.average floatValue]];
    
    _ratingLabel.text = rating;
    
}

@end
