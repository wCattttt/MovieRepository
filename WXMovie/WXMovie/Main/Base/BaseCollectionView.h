//
//  BaseCollectionView.h
//  WXMovie
//
//  Created by imac on 15/9/16.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSString *indetify;
}
@property(nonatomic,assign)NSInteger pageWidth;//每一页的宽度
@property(nonatomic,retain)NSArray *data;// 数据

@property(nonatomic,assign)NSInteger currentItem;//当前显示的页码


@end
