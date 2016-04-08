//
//  ImageViewController.h
//  WXMovie
//
//  Created by imac on 15/9/12.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "BaseViewController.h"

@interface ImageViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    __weak IBOutlet UICollectionView *_collectionV;
    
    
}
@end
