//
//  MovieCell.m
//  WXMovie
//
//  Created by imac on 15/9/8.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MovieCell.h"
#import "MovieModel.h"
#import "StarView.h"


@implementation MovieCell

- (void)awakeFromNib {
    
    self.backgroundColor = [UIColor clearColor];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _titleLabel.text = _model.title;
    _ratingLabel.text = [_model.average stringValue];
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    
    //图片的设置
    NSDictionary *images = _model.images;
    NSString *imageString = [images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:imageString];
    [_imgeView setImageWithURL:url];
    
    _ratingView.rating = [_model.average floatValue];
    
}


@end
