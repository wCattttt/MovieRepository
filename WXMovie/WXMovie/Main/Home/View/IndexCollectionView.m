//
//  IndexCollectionView.m
//  WXMovie
//
//  Created by imac on 15/9/15.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "IndexCollectionView.h"
#import "MovieModel.h"
#import "IndexViewCell.h"

@implementation IndexCollectionView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        indetify = @"IndexViewCell";
        
        [self registerClass:[IndexViewCell class] forCellWithReuseIdentifier:indetify];
        
    }
    return self;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indetify forIndexPath:indexPath];
    
    cell.model = self.data[indexPath.item];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
   
        self.currentItem = indexPath.item;

}
@end
