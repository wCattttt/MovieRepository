//
//  HomeViewController.m
//  WXMovie
//
//  Created by imac on 15/9/7.
//  Copyright © 2015年 mac . All rights reserved.
//

#import "HomeViewController.h"
#import "MovieModel.h"
#import "MovieCell.h"
#import "PosterView.h"
#import "MyDataService.h"


@interface HomeViewController ()
{
    UIView *view;
    NSMutableArray *_data;// 数据
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"电影";
//    self.view.backgroundColor = [UIColor redColor];
   
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
 /*
    view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view1.backgroundColor = [UIColor greenColor];
    [view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [view addSubview:view2];*/
    
    //1.创建按钮
    [self _creatNavi];
    //2.创建列表视图
    [self _creatTableView];
    //3.创建海报视图
    [self _creatPostreView];
    
    //4.数据请求
    [self _requestData];
    

    
}


- (void) _requestData{
    
    /*
    //初始化数据的存储数组
    _data = [NSMutableArray array];
    //获取json文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    //用NSJSONSerialization解析json数据
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    */
    
    _data = [NSMutableArray array];
    [self showHudInView:self.view hint:@"加载中..."];
    [MyDataService requestURL:@"/v2/movie/us_box" httpMethod:@"GET" params:nil completionHandle:^(id result) {
        [self hideHud];
//        [self showSuccess:@"加载成功"];
        
        NSArray *subArr = [result objectForKey:@"subjects"];
        
        for (NSDictionary *subDic in subArr) {
            NSDictionary *dic1 = [subDic objectForKey:@"subject"];
            MovieModel *model = [[MovieModel alloc] init];
            /*@property(nonatomic,copy)NSString *title;  //标题
             @property(nonatomic,retain)NSNumber *average; //评分
             @property(nonatomic,copy)NSString *year;//上映年份
             @property(nonatomic,retain)NSDictionary *images;//图片
             @property(nonatomic,copy)NSString *original_title; //英文名称
             @property(nonatomic,retain)NSNumber *collect_count;//收藏数
             @property(nonatomic,copy)NSString *subtype;//类型
             @property(nonatomic,copy)NSString *movieID; //电影ID
             */
            model.title = [dic1 objectForKey:@"title"];
            model.images = [dic1 objectForKey:@"images"];
            model.year = [dic1 objectForKey:@"year"];
            model.average = [[dic1 objectForKey:@"rating"] objectForKey:@"average"];
            model.original_title = [dic1 objectForKey:@"original_title"];
            model.collect_count = [dic1 objectForKey:@"collect_count"];
            model.subtype = [dic1 objectForKey:@"subtype"];
            model.movieID = [dic1 objectForKey:@"id"];
            
            [_data addObject:model];
        }
        
        [_tableV reloadData];
        //把数据给_posterV
        _posterV.data = _data;
        
        
    }];
    
}
- (void)_creatNavi{
    //1.创建背景视图
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //2.创建两个UIButton
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = bgView.bounds;
    btn1.tag = 100;
    btn1.hidden = YES;
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(flips:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = bgView.bounds;
    btn2.hidden = NO;
    btn2.tag = 101;
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(flips:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btn2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:bgView];
}

- (void)_creatTableView{
    
    _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.rowHeight = 120;
    _tableV.hidden = YES;
    _tableV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableV];
    
    
}
- (void)_creatPostreView{
    _posterV = [[PosterView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49)];
    _posterV.hidden= NO;
    _posterV.backgroundColor = [UIColor redColor];
//    _posterV.data = _data;
    [self.view addSubview:_posterV];
    
}

- (void)flips:(UIButton *)sender {
    //获取到翻转的视图
    UIView *bgV = sender.superview;
    
    UIButton *btn1 = (UIButton *)[bgV viewWithTag:100];
    UIButton *btn2 = (UIButton *)[bgV viewWithTag:101];
    //翻转按钮
    [self flipsView:bgV withLeft:btn1.hidden];
    //翻转海报视图与列表视图
    [self flipsView:self.view withLeft:btn1.hidden];
    

    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    
    //交换显示海报视图与列表视图
    _tableV.hidden = !_tableV.hidden;
    _posterV.hidden = !_posterV.hidden;
    
}

- (void)flipsView:(UIView *)forView withLeft:(BOOL)flag{
    
    //判断翻转的动画
    UIViewAnimationOptions fli = flag ? UIViewAnimationOptionTransitionFlipFromLeft :
    UIViewAnimationOptionTransitionFlipFromRight;
    
    //实现翻转
    [UIView transitionWithView:forView duration:0.5 options:fli animations:^{
        [forView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"MovieCell";
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil] lastObject];
    }
    
    cell.model = _data[indexPath.row];
    
    return cell;
    
    
}
@end
