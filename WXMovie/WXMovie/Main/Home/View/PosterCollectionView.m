//
//  PosterCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterViewCell.h"
#import "IndexCollectionView.h"

@implementation PosterCollectionView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        indetify = @"PosterViewCell";
        
        [self registerClass:[PosterViewCell class] forCellWithReuseIdentifier:indetify];
//        IndexCollectionView *index = [[IndexCollectionView alloc] init];
        
//        [self addObserver:<#(NSObject *)#> forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>]
        
    }
    return self;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indetify forIndexPath:indexPath];

    cell.model = self.data[indexPath.item];

//    index = 10;
    
    return cell;
}
//cell点击时调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //点击当前显示页面，进行翻转
    if (indexPath.item == self.currentItem) {
        PosterViewCell *cell =(PosterViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
        [cell flips];
    }else{  //如果点击的是两侧的，，移动到中间
        //移动动画开启时，把选中取消
        collectionView.userInteractionEnabled = NO;
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        collectionView.allowsSelection = YES;
//        [self performSelector:@selector(abc:) withObject:@12 afterDelay:0.5];
//        [collectionView performSelector:@selector(allowsSelection) withObject:@YES afterDelay:0.4];
        self.currentItem = indexPath.item;
        //延迟调用该方法  设置为可选状态
        [self performSelector:@selector(setUserEnable:) withObject:collectionView afterDelay:0.4];
    }
}

- (void)setUserEnable:(UICollectionView *)collectionView{
    
    collectionView.userInteractionEnabled = YES;
    
}

//cell移除显示
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PosterViewCell *pCell =(PosterViewCell *)cell;
    
    [pCell reset];
}

@end
