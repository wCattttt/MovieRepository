//
//  BaseCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/16.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (id)initWithFrame:(CGRect)frame{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    flowLayout.itemSize = CGSizeMake(_pageWidth, self.height);
    flowLayout.minimumLineSpacing = 0;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
        //隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        

        //滑动减速时，减速快
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    
    //    self.contentInset = UIEdgeInsetsMake(0, (kScreenWidth - _pageWidth)/2, 0, (kScreenWidth - _pageWidth)/2);
    
    //    flowLayout.sectionInset =UIEdgeInsetsMake(0, (kScreenWidth - _pageWidth)/2, 0, (kScreenWidth - _pageWidth)/2);
    
    return self;
    
}

#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
    return nil;
}
//为item设置大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(_pageWidth, self.height);
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //    0 - 125   0     125 － 249 ／250  0
    //    126 - 375 1     250 － 499 ／ 250   1
    //    376 - ...  2    501 － 750  ／250  2
    
    
    //    targetContentOffset->x = 0;
    //1.计算要显示的cell的索引值
    NSInteger index = (targetContentOffset->x +self.pageWidth/2)/_pageWidth;
    
    //    NSLog(@"--%f",velocity.x);
    
    if (_currentItem == index) {
        //2判断速度，如果大则进入下一个
        if (velocity.x > 0.5 && index < _data.count - 1) {
            index ++;
        }else if (velocity.x < -0.5 && index > 0){
            index--;
        }
    }
    //3设置下一个的偏移量
    targetContentOffset->x = _pageWidth *index;
    
    //    NSLog(@"scrollView%f",scrollView.contentOffset.x);
    //    NSLog(@"%f",targetContentOffset->x);
    
    //4纪录当前页
    self.currentItem = index;
    
}
//设置第一个单元格向右偏移的距离 ，，最后一个向左偏移
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, (kScreenWidth - _pageWidth)/2, 0, (kScreenWidth - _pageWidth)/2);
    
}

@end
