//
//  ChoiceFoodController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "ChoiceFoodController.h"
#import "URLS.h"
#import "Micro.h"
#import "AFNetworking.h"
#import "BaseModel.h"
#import "ChioceCell.h"
#import "NSString+URLEncoding.h"
#import "MJRefresh.h"



@interface ChoiceFoodController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChoiceFoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  setUrl];
    [self  loadData];
    [self  addNextPage];
    [self  addRefresh];
    self.number =0;
  
}

- (void)setcell {
  [self.tableV registerNib:[UINib  nibWithNibName:@"ChioceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChioceCell *  cell = [tableView  dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    BaseModel * model = self.dataArr[indexPath.row];
    
    [cell  getCellWithModel:model];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (void)setUrl  {
    self.url = [NSString  stringWithFormat:KBASE,@"T1374487390547",(int)self.number*20];
}

- (void)loadData {
   NSString * url   = [NSString  stringWithFormat:KBASE,@"T1388389837722",(int)self.number*20];
    AFHTTPSessionManager  * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet  setWithObject:@"text/html"];
    [manager  GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray * arr = responseObject[@"T1388389837722"];
        for (NSDictionary  * dic in arr) {
                BaseModel * model = [[BaseModel  alloc]init];
                [model  setValuesForKeysWithDictionary:dic];
                [self.dataArr addObject:model];
            }
        [self.tableV.header  endRefreshing];
        [self.tableV.footer  endRefreshing];
                  [self.tableV  reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"shiz%@",error);
    }];

}


@end
