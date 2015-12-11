//
//  ViewController.m
//  ChioceFood
//
//  Created by qianfeng on 15/12/11.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "Micro.h"
#import "AFNetworking.h"
#import "URLS.h"
#import "BaseModel.h"
#import "BaseCell.h"
#import "MJRefresh.h"
#import "BaseWebView.h"
#import "MMProgressHUD.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign)BOOL  isrefresh;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor =[UIColor  colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1];
    self.view.backgroundColor = [UIColor  blackColor];
//    [ViewController  preferredStatusBarStyle:UIStatusBarStyleLightContent];
    
}

//上拉加载  下拉刷新
- (void)addRefresh {
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        self.number =0;
        self.isrefresh = YES;
        [self  setUrl];
        [self  loadData];
    }];
    // 根据下拉的程度, 修改透明度
    //    header.automaticallyChangeAlpha = YES;
    self.tableV.header = header;
}

- (void)addNextPage {
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter  footerWithRefreshingBlock:^{
        self.isrefresh = NO;
        self.number++;
        [self  setUrl];
        [self  loadData];
    }];
    
    self.tableV.footer = footer;
}

//子类重写这个方法更换数据源
- (void)setUrl {
    self.ID = @"T1414389941036";
    self.url  = [NSString  stringWithFormat:KBASE,self.ID,(int)self.number*20];
    NSLog(@"%@",self.url);
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseWebView  * webView = [[BaseWebView  alloc]init];
    BaseModel * model = self.dataArr[indexPath.row];
    
    webView.webPath = model.url;
    if (model.url) {
        [self.navigationController  pushViewController:webView animated:YES];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static  NSString * cellID = @"cellId";
    BaseCell  * cell = [tableView  dequeueReusableCellWithIdentifier:cellID];
    
    BaseModel * model = self.dataArr[indexPath.row];
    
    [cell  getCellWithModel:model];
    return cell;
}

- (void)loadAdData {
    
}
- (void)loadData {
    [MMProgressHUD setPresentationStyle: MMProgressHUDPresentationStyleDrop];
    [MMProgressHUD   showDeterminateProgressWithTitle:nil status:@"为您加载中..."];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager  manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer  serializer];
    
    [manager  GET:self.url  parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary  * dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
#warning 这里清空数组只能再GET方法里面执行  因为这里是一个子线程  请求数据的同时如果写在外面主线程仍然在执行 此时数据清空cell读不到数组造成越界
        if (self.isrefresh == YES) {
            [self.dataArr  removeAllObjects];
        }
        
        NSArray * arr = [dict  objectForKey:self.ID];
        for (NSDictionary  * dic in arr) {
            BaseModel * model = [[BaseModel  alloc]init];
            [model  setValuesForKeysWithDictionary:dic];
            [self.dataArr addObject:model];
        }
        
        [self.tableV.header  endRefreshing];
        [self.tableV.footer  endRefreshing];
        NSLog(@"%@",self.dataArr);
        [self.tableV  reloadData];
        [MMProgressHUD  dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [MMProgressHUD  dismiss];
    }];
    
    
}

- (void)setcell {
    UINib *nib=[UINib nibWithNibName:@"BaseCell" bundle:nil];
    [self.tableV registerNib:nib forCellReuseIdentifier:@"cellId"];
}


- (UITableView *)tableV {
    if (!_tableV) {
        _tableV = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        [self  setcell];
        [self.view  addSubview:_tableV];
    }
    return _tableV;
    
}
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray  alloc]init];
    }
    return _dataArr;
}

@end
