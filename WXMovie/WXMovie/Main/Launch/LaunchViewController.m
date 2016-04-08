//
//  LaunchViewController.m
//  WXMovie
//
//  Created by imac on 15/9/18.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()
{
    NSMutableArray *_data;
    NSInteger _index;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgImageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgImageV.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:bgImageV];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default"]];
    
    //加载图片
    [self _loadImages];
    
    //开始动画
    [self _startAnitation];
    
}

- (void)_loadImages{
    
    CGFloat width = kScreenWidth / 4;
    CGFloat height = kScreenHeight / 6;
    
    CGFloat x = 0, y = 0;
    
    _data = [NSMutableArray array];
    
    for (int i = 0; i < 16; i++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]];
        imageV.image = image;
        imageV.alpha = 0;
        [_data addObject:imageV];
        
        [self.view addSubview:imageV];
        
        if (i <= 3) {
            x = i * width;
            y = 0;
        }else if (i > 3 && i <= 7){
            x = kScreenWidth - width;
            y = (i - 3) *height;
        }else if (i > 7 && i <= 11){
            x = kScreenWidth - (i - 7) *width;
            y = kScreenHeight - height;
        }else if (i > 11 && i <16){
            
            x = 0;
            y = kScreenHeight - (i - 10) * height;
            
        }
        
        imageV.origin = CGPointMake(x, y);
        
    }
    
    
}

- (void)_startAnitation{
    //判断循环条件
    if (_index >= _data.count) {
        
        [self _showMain];
        
        return;
    }
    
    
    UIImageView *imageV = _data[_index];
//动画显示
    [UIView animateWithDuration:0.2 animations:^{
       
        imageV.alpha = 1;
        
    }];
//    更新循环变量
    _index ++;
    
    
//    [self _startAnitation];
//    延迟调用
    [self performSelector:@selector(_startAnitation) withObject:nil afterDelay:0.2];
    
    
}
- (void)_showMain{
//    获取到Main.storyBoard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    获取storyBoard内的控制器
    UIViewController *vc = [storyBoard instantiateInitialViewController];
//    拿到主window
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = vc;
    //更改视图大小
    vc.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.3 animations:^{
        
        vc.view.transform = CGAffineTransformIdentity;
        
    }];
    
    
}

//设置状态栏隐藏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
