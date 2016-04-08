//
//  PhotoScrollView.m
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageV];
        
        //设置放大倍数
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 1;
        
        //设置代理对象
        self.delegate = self;
        //双击进行缩放
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 2; //点击的次数
        tap.numberOfTouchesRequired = 1; //点击的手指数
        [self addGestureRecognizer:tap];
        
        
        //添加单击事件
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [self addGestureRecognizer:tap1];
        
        
        [tap1 requireGestureRecognizerToFail:tap];
        
        
    }
    return self;
}

- (void)tapAction1:(UITapGestureRecognizer *)tap{
    
//    NSLog(@"单击事件");
    //发送一个通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tapAction1" object:self];
    
    
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    if (self.zoomScale > 1) {
//        [self setZoomScale:1];
        [self setZoomScale:1 animated:YES];
        
    }else{
        
        [self setZoomScale:2 animated:YES];
        
    }
   
    
}

- (void)setUrl:(NSString *)url{
    _url = url;
    
    [_imageV setImageWithURL:[NSURL URLWithString:_url]];
    
}


#pragma mark - UIScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return _imageV;
    
}


@end
