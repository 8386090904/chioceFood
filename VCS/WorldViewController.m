//
//  WorldViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "WorldViewController.h"
#import "AFNetworking.h"
#import "BaseModel.h"
#import "URLS.h"
#import "ChioceCell.h"
#import "MJRefresh.h"
@interface WorldViewController ()

//@property (nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation WorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setUrl];
    [self  loadData];
    [self  addNextPage];
    [self  addRefresh];
    self.number =0;
//    self.tableV.rowHeight = 300;
}

//重写数据加载的方法


- (void)setUrl  {
    self.url = [NSString  stringWithFormat:KBASE,@"T1374487390547",(int)self.number*20];
}

- (void)setcell {
    UINib *nib=[UINib nibWithNibName:@"ChioceCell" bundle:nil];
    [self.tableV registerNib:nib forCellReuseIdentifier:@"cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChioceCell * cell = [tableView  dequeueReusableCellWithIdentifier:@"cell"];
    
    BaseModel * model = self.dataArr[indexPath.row];
    [cell  getCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 300;
}

- (void)loadData {
    AFHTTPSessionManager  * manager = [AFHTTPSessionManager  manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet  setWithObject:@"text/html"];
    [manager  GET:self.url  parameters:nil  success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray * arr = responseObject[@"T1374487390547"];
        for (NSDictionary  * dic in arr) {
            BaseModel * model = [[BaseModel  alloc]init];
            [model  setValuesForKeysWithDictionary:dic];
            [self.dataArr addObject:model];
            
//            NSLog(@"%@",model.title);
        }
        [self.tableV.header  endRefreshing];
        [self.tableV.footer  endRefreshing];
        
        [self.tableV  reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}




@end
