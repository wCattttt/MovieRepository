//
//  TopViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "TopViewController.h"
#import "MovieModel.h"
#import "TopViewCell.h"
#import "MovieDetailController.h"
#import "TopViewController.h"
#import "MyDataService.h"

@interface TopViewController ()
{
    NSMutableArray *_data;
}
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    _collectionV.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_main@2x"]];
    
    //加载数据
    [self requestData];
    
}

- (void)requestData{
    
//    //加载数据
//    NSDictionary *jsonDic =[WXDataService requestData:top250];
    [self showHudInView:self.view hint:@"加载中..."];
    [MyDataService requestURL:@"/v2/movie/top250" httpMethod:@"GET" params:nil completionHandle:^(NSDictionary *result) {
        [self hideHud];
//        [self showSuccess:@"加载成功"];
        NSArray *subjects = result[@"subjects"];
        
        _data = [NSMutableArray arrayWithCapacity:result.count];
        
        for (NSDictionary *dic in subjects) {
            MovieModel *model = [[MovieModel alloc] init];
            
            model.title = [dic objectForKey:@"title"];
            model.images = [dic objectForKey:@"images"];
            model.year = [dic objectForKey:@"year"];
            model.average = [[dic objectForKey:@"rating"] objectForKey:@"average"];
            model.original_title = [dic objectForKey:@"original_title"];
            model.collect_count = [dic objectForKey:@"collect_count"];
            model.subtype = [dic objectForKey:@"subtype"];
            model.movieID = [dic objectForKey:@"id"];
            
            [_data addObject:model];
            
        }
        //刷新数据
        [_collectionV reloadData];
        
    }];
    

    
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.model = _data[indexPath.item];
    return cell;
}
//点击cell时候  调用该方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    TopViewCell *cell = (TopViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    /**
     
     
     :returns: <#return value description#>
     */
    MovieDetailController *movieDetail = [[MovieDetailController alloc] init];
    movieDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:movieDetail animated:YES];
    
}





@end
