//
//  TopViewController.h
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    
    __weak IBOutlet UICollectionView *_collectionV;
}
@end
