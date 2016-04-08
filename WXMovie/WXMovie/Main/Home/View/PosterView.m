//
//  PosterView.m
//  WXMovie
//
//  Created by imac on 15/9/14.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#import "MovieModel.h"

@implementation PosterView
{
    UIControl *_maskView;  //遮盖视图
}

- (void)dealloc
{
    //移除KVO
    [_posterCollectionV removeObserver:self forKeyPath:@"currentItem"];
    [_indexCollectionV removeObserver:self forKeyPath:@"currentItem"];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        创建头部视图
        [self _creatHeaderView];
        
        //创建海报
        [self _creatPosterCollectionView];
        
        //添加KVO  监听currentItem属性值的变化
        [_posterCollectionV addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        [_indexCollectionV addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 30, kScreenWidth, 30)];
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        
    }
    return self;
}
#pragma mark - KVO 方法
- (void)observeValueForKeyPath:(NSString *)keyPath //被观察的属性
                      ofObject:(id)object //被观察的对象
                        change:(NSDictionary *)change //属性改变值
                       context:(void *)context{
    
    //获取变化之后的值
    NSInteger index = [[change objectForKey:@"new"] integerValue];
    //把数值型参数转化为NSIndexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    if ([keyPath isEqualToString:@"currentItem"]) {
        if ([object isKindOfClass:[PosterCollectionView class]] && _indexCollectionV.currentItem != index) {
                //滚动到指定位置
                [_indexCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
                _indexCollectionV.currentItem = index;

        }else if ([object isKindOfClass:[IndexCollectionView class]] && _posterCollectionV.currentItem != index){
            //滚动到指定位置
            [_posterCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            _posterCollectionV.currentItem = index;
        }
    }
//更换标题
    MovieModel *model = _data[index];
    _label.text = model.title;
    
    
}

- (void)_creatHeaderView{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -125, kScreenWidth, 150)];
    //_headerView.backgroundColor = [UIColor blackColor];
    [self addSubview:_headerView];
    //创建背景视图
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    [_headerView addSubview:imageV];
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    //拉伸图片，设置拉伸点
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    imageV.image = image;
    //创建button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake((_headerView.width - 25)/2, _headerView.height - 25, 25, 25)];
    [btn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 100;
    [_headerView addSubview:btn];
    //轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    //设置轻扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipe];
    
//    创建索引视图
    
    _indexCollectionV = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    _indexCollectionV.pageWidth = 100;
    [_headerView addSubview:_indexCollectionV];
    
    
}
- (void)_creatPosterCollectionView{
    
    _posterCollectionV = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, 25, kScreenWidth, self.height - 25 - 30)];
    _posterCollectionV.pageWidth = 250;
//    [self addSubview:_posterCollectionV];
    [self insertSubview:_posterCollectionV belowSubview:_headerView];
    
}

- (void)setData:(NSArray *)data{
    _data = data;
    
    _posterCollectionV.data = _data;
    _indexCollectionV.data =_data;
    
    [_posterCollectionV reloadData];
    [_indexCollectionV reloadData];
    
    
    //给第一个标题赋值
    if (_data.count > 0) {
        MovieModel *model = _data[0];
        _label.text = model.title;
        
    }
    
}

//向下轻扫事件
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe{
    
    //当遮盖视图隐藏时，或者不存在时，向下滑响应
    if (_maskView.hidden == YES ||_maskView == nil) {
        
        [self _showHeaderView];

    }
    
//    _headerView.top = 0;
}

- (void)btnAction:(UIButton *)btn{
    if (!btn.selected) {
        [self _showHeaderView];
    }else{
        [self _hiddenHeaderView];
    }
}
//隐藏
- (void)_hiddenHeaderView{
    //隐藏头部视图
    [UIView animateWithDuration:0.3 animations:^{
        _headerView.top = -125;
    }];
    //更改button的显示图标
    UIButton *btn = (UIButton *)[_headerView viewWithTag:100];
    btn.selected = !btn.selected;
    //把遮盖视图隐藏
    _maskView.hidden = YES;
}
//显示
- (void)_showHeaderView{
    //显示头部视图
    [UIView animateWithDuration:0.3 animations:^{
        _headerView.top = 0;
    }];
    //更改button的显示图标
    UIButton *btn = (UIButton *)[_headerView viewWithTag:100];
    btn.selected = !btn.selected;
    //第一次显示头部视图时， 创建遮盖视图
    if (_maskView == nil) {
        _maskView = [[UIControl alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headerView];
    }
    _maskView.hidden = NO;
}
//遮盖视图的点击事件
- (void)maskAction:(UIControl *)con{
    [self _hiddenHeaderView];
}
@end
