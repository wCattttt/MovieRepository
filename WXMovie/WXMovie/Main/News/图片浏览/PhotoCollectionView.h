//
//  PhotoCollectionView.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSString *identify;  //复用使用的ID
}
@property(nonatomic,retain)NSArray *urls;
@property(nonatomic,assign)NSInteger currentItem;//当前显示的页码
@end
