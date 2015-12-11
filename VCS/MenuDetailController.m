//
//  MenuDetailController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/20.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "MenuDetailController.h"
#import "AFNetworking.h"
#import "BaseModel.h"
#import "MJRefresh.h"
#import "MenusCell.h"
#import "BaseWebView.h"
#import "MMProgressHUD.h"
#import "Micro.h"

@interface MenuDetailController ()
@property (nonatomic, assign)int num;
@end

@implementation MenuDetailController


//- (void)viewWillAppear:(BOOL)animated {
//[self  loadDataAndNumber:0];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  addRefresh];
    [self  addNextPage];
    [self  setcell];
    [self.tableV.header beginRefreshing];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableV.frame = CGRectMake(0, 64, SWIDTH, SHEIGHT-64);

}

- (void)setcell
{
    UINib  * nib = [UINib  nibWithNibName:@"MenusCell" bundle:nil];
    [self.tableV  registerNib:nib forCellReuseIdentifier:@"cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MenusCell * cell =[tableView  dequeueReusableCellWithIdentifier:@"cell" ];
    MenusModel * model = self.dataArr[indexPath.row];
    [cell  getCellWithModel:model];
    return cell;
    
}
//选中跳转到webView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenusModel * model = self.dataArr[indexPath.row];
    int  code = [model.code  intValue];
    NSString * webUrl = [NSString  stringWithFormat:@"http://m.xiangha.com/caipu/%d.html",code];
    BaseWebView * web = [[BaseWebView  alloc]init];
    web.webPath = webUrl;
    [self.navigationController  pushViewController:web animated:YES];
}

- (void)loadDataAndNumber:(int)number {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager  manager];
   
    [MMProgressHUD setPresentationStyle:   MMProgressHUDPresentationStyleExpand];
    [MMProgressHUD  showDeterminateProgressWithTitle:nil status:@"加载..."];
    
    NSString * url = [self.path  substringToIndex:self.path.length-1];
    NSString * newurl = [NSString  stringWithFormat:@"%@%d",url,number];
    
    NSLog(@"%@",newurl);
    [manager  GET:newurl  parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (self.num==1) {
            
            [self.dataArr  removeAllObjects];
        }
        
      NSDictionary * dict  = [responseObject  objectForKey:@"data"];
        NSArray * arr = dict[@"dishs"];
        for (NSDictionary  * dic in arr) {
            MenusModel * model = [[MenusModel  alloc]init];
            [model  setValuesForKeysWithDictionary:dic];
            [self.dataArr addObject:model];
        }
        
        [self.tableV.header  endRefreshing];
        [self.tableV.footer  endRefreshing];
//        NSLog(@"MENU%@",self.dataArr);
        [self.tableV  reloadData];
        [MMProgressHUD  dismissAfterDelay:1];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [MMProgressHUD  dismissAfterDelay:1];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//上拉加载  下拉刷新
- (void)addRefresh {
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        _num =1;
//        [self.dataArr  removeAllObjects];
        [self  loadDataAndNumber:_num];
    }];
    // 根据下拉的程度, 修改透明度
    // header.automaticallyChangeAlpha = YES;
    self.tableV.header = header;
    
}

- (void)addNextPage {
MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter  footerWithRefreshingBlock:^{
        _num++;
        [self  loadDataAndNumber:_num];
    }];
    
    self.tableV.footer = footer;
}

@end
