//
//  NewsCell.m
//  WXMovie
//
//  Created by imac on 15/9/9.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"

@implementation NewsCell

- (void)awakeFromNib {
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //取得model内的属性，为视图赋值
    NSString *imageString = _model.image;
    NSURL *url = [NSURL URLWithString:imageString];
    [_imageV setImageWithURL:url];
    
    _titleLabel.text = _model.title;
    _subTitleLabel.text = _model.summary;
    
    NSInteger type = [_model.type integerValue];
    if (type == 0) {  //普通新闻
        _typeImageV.hidden = YES;
        _subTitleLabel.left = _imageV.right + 5;
    }else if (type == 1) { //图片新闻
        _typeImageV.hidden = NO;
        _typeImageV.image = [UIImage imageNamed:@"sctpxw"];
        _subTitleLabel.left = _typeImageV.right +5;
    }else if (type == 2){  //视频新闻
        _typeImageV.hidden = NO;
        _subTitleLabel.left = _typeImageV.right +5;
        _typeImageV.image = [UIImage imageNamed:@"scspxw"];
    }
    
    
}
@end
