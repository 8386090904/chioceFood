//
//  FindViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "FindViewController.h"
#import "AFNetworking.h"
#import "FindModel.h"
#import "FindCell.h"
#import "Micro.h"
#import "MJRefresh.h"
#import "FindDetailController.h"
@interface FindViewController ()
@property (nonatomic,assign)int  page;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableV.frame = CGRectMake(0, 0, SWIDTH, SHEIGHT-49);
    self.page =1;
    [self addRefresh];
    [self  addNextPage];
    [self.tableV.header  beginRefreshing];
    self.title= @"发现";
}

//上拉加载  下拉刷新
- (void)addRefresh {
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        self.page=1;
        [self.dataArr  removeAllObjects];
        [self  loadDataWithPage:self.page];
    }];
    // 根据下拉的程度, 修改透明度
    //    header.automaticallyChangeAlpha = YES;
    self.tableV.header = header;
}

- (void)addNextPage {
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter  footerWithRefreshingBlock:^{
        
        self.page++;
//        [self  setUrl];
        [self  loadDataWithPage:self.page];
    }];
    
    self.tableV.footer = footer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDataWithPage:(int)page {
    NSString * str = [NSString  stringWithFormat:@"http://ibaby.ipadown.com/api/food/food.topic.list.php?p=%d&pagesize=10&order=addtime",page];
    AFHTTPSessionManager  * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    [manager GET:str parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray * arr = [dict objectForKey:@"results"];
        //遍历这个数组
        [arr  enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary * dic = (NSDictionary *)obj;
            FindModel * model = [[FindModel  alloc]init];
            [model  setValuesForKeysWithDictionary:dic];
            [self.dataArr  addObject:model];
        }];
        
        
        [self.tableV.header  endRefreshing];
        [self.tableV.footer  endRefreshing];
     
        [self.tableV  reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)setcell {
    [self.tableV  registerNib:[UINib  nibWithNibName:@"FindCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FindCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    FindModel * model  = self.dataArr[indexPath.row];
    [cell  getCellWithModel:model];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 180;
}

//点击推送到详情页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FindModel  * model = self.dataArr[indexPath.row];
    FindDetailController  * detail = [[FindDetailController alloc]init];
    detail.mod = model;
    [self.navigationController  pushViewController:detail animated:YES];
}

@end
