//
//  NewsViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "NewsViewController.h"
#import "StarView.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "ImageViewController.h"
#import "NewsDetailViewController.h"

#define kImageViewHeight 150

@interface NewsViewController ()
{
    NSMutableArray *_data;
    UIImageView *_imageV;  //头条图片
    UILabel *_label; //头条的标题
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    _tableView.backgroundColor = [UIColor clearColor];
    
    
    [self creatHeaderView];
    //1.加载数据
    [self requestData];
    
    
}
//给头条视图设置数据
- (void)loadHeaderData{
    
    NewsModel *model = _data[0];
    
    NSString *urlStr = model.image;
    NSURL *url = [NSURL URLWithString:urlStr];
    [_imageV setImageWithURL:url];
    
    _label.text = model.title;
    
    
}
//创建头条视图
- (void)creatHeaderView{
    //创建头条图片
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kImageViewHeight)];
    [self.view insertSubview:_imageV belowSubview:_tableView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, kImageViewHeight - 20, kScreenWidth, 20)];
   _label.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    _label.font = [UIFont systemFontOfSize:15];
    [self.view insertSubview:_label belowSubview:_tableView];
    
}
- (void)requestData{
    
    NSArray *arr = [WXDataService requestData:@"news_list"];
    //初始化数组
    _data = [NSMutableArray array];
    //便利数组保存Model
    for (NSDictionary *dic in arr) {
        
        NewsModel *model = [[NewsModel alloc] init];
        //给Model的属性赋值
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.type = dic[@"type"];
        model.newsID = dic[@"id"];
        model.image = dic[@"image"];
        
        [_data addObject:model];
    }
    
    [self.tableView reloadData];
    [self loadHeaderData];

}

     
#pragma mark - UITableView Datasource
//设置数组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    
    return _data.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
/*        //根据tag值取得cell的子视图
        UIImageView *imageV = (UIImageView *)[cell.contentView viewWithTag:300];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:301];
        //给imageView子视图赋值
        NewsModel *model = _data[indexPath.row];
        NSString *imageStr = model.image;
        NSURL *url = [NSURL URLWithString:imageStr];
        [imageV setImageWithURL:url];
        
        label.text = model.title;
        //设置背景颜色，并设置透明度
        label.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];*/
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    //加载storyboard中的cell  需要设置ID
    static NSString *identifier = @"NewsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    cell.model = _data[indexPath.row + 1];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return kImageViewHeight;
    }
    
    return 70;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = _data[indexPath.row + 1];
    NSInteger type = [model.type integerValue];
    
    if (type == 0) {  //普通文字新闻
//        NewsDetailViewController *newsDetail = [[NewsDetailViewController alloc] init];
        NSLog(@"%@",self.tabBarController);
        NSLog(@"%@",[self.storyboard instantiateInitialViewController]);
//        利用storyboard创建的对象，不是把storyboard内对象拿过来，而是直接利用该类来创建该类的新对象
//        UIStoryboard
        //storyboard属性是定义在UIViewController内，通过UIStoryboard加载的控制器  属性有值
//        NSLog(@"%@",self.storyboard);
        NewsDetailViewController *newsDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
        
        
//        NewsDetailViewController *newsDetail1=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];

        //显示newsDetail控制器隐藏标签栏
        newsDetail.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newsDetail animated:YES];
        
    }else if (type == 1){  //图片新闻
    
        ImageViewController *imageVC =[self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
        
        imageVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:imageVC animated:YES];
        
        
    }else if (type == 2){  //视频新闻
        
    }
    
    
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
    if (offSetY >  0) {  //向上滑动
        _imageV.top = -offSetY * 0.5;
    }else{   //向下滑动
        
        //放大后图片的高度
        CGFloat height = -offSetY + kImageViewHeight;
        
//        放大后图片的高度  ／ 图片原来高度  ＝ 放大后图片的宽度  ／ 图片原来宽度
        //确定放大的比列
        CGFloat scale = height / kImageViewHeight;
        
        CGFloat width = kScreenWidth * scale;
        
        CGRect frame = CGRectMake(-(width - kScreenWidth) / 2, 0, width, height);
        
//        _imageV.size = CGSizeMake(width, height);
        
        _imageV.frame = frame;
        
    }
    
    _label.bottom = _imageV.bottom;

    
}

@end
