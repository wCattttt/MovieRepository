//
//  MovieDetailView.m
//  WXMovie
//
//  Created by imac on 15/9/16.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "MovieDetailView.h"
#import "StarView.h"
#import "MovieModel.h"

@implementation MovieDetailView

- (void)setModel:(MovieModel *)model{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}


-(void)layoutSubviews{

    [super layoutSubviews];
//    为每一个子视图进行赋值
    _titleLabel.text = [NSString stringWithFormat:@"标题：%@",_model.title];
    _sourceLabel.text = [NSString stringWithFormat:@"原标题:%@",_model.original_title];
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",_model.year];
    [_imageV setImageWithURL:[NSURL URLWithString:[_model.images objectForKey:@"medium"]]];
    _ratingV.rating = [_model.average floatValue];
    _ratingLabel.text = [NSString stringWithFormat:@"%.2f",_model.average.floatValue];
    
}

@end
