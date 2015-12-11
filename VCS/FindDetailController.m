//
//  FindDetailController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "FindDetailController.h"
#import "Micro.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "DetailModel.h"
#import "DetailCell.h"
#import "BaseWebView.h"



@class FindModel;
@interface FindDetailController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * table;
@property (nonatomic,strong)NSMutableArray *dataSource;

//@property (nonatomic,strong)DetailModel * model;
//@property (nonatomic,strong)DetailCell  * cell;
//@property (nonatomic,weak)NSIndexPath * index;
@end

@implementation FindDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self  createTable];
    [self  createHeaderView];
    [self  loadData];
    self.view.backgroundColor = [UIColor  whiteColor];
    
//    UIButton * button = [UIButton  buttonWithType:UIButtonTypeCustom];
//    button.titleLabel.text = @"返回";
//    UIBarButtonItem * item = [[UIBarButtonItem  alloc]initWithCustomView:button];
//    self.navigationItem.leftBarButtonItem = item;
//    
    
    
}
//创建视图
- (void)createHeaderView {
    
    UIImageView * imgV = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 64, SWIDTH, 200)];
    [imgV setImageWithURL:[NSURL   URLWithString:self.mod.thumb] placeholderImage:nil];
    
    self.table.tableHeaderView = imgV;
}


- (void)createTable{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SWIDTH  , SHEIGHT) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table  registerNib:[UINib  nibWithNibName:@"DetailCell" bundle:nil]forCellReuseIdentifier:@"detail"];
    
    [self.view  addSubview:self.table];
}

- (void)loadData {
    AFHTTPSessionManager  * manager =[AFHTTPSessionManager  manager];
    manager.responseSerializer = [AFHTTPResponseSerializer  serializer];
    
    NSString * urlstr = [NSString stringWithFormat:@"http://ibaby.ipadown.com/api/food/food.topic.detail.php?id=%@", self.mod.ID];
    [manager GET:urlstr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary  * dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray  * arr = [dict objectForKey:@"tlist"];
        NSDictionary * dir = arr[0];
        NSArray * arr1 = [dir  objectForKey:@"list"];
        
        for (NSDictionary * dic in arr1) {
            DetailModel  * model = [[DetailModel  alloc]init];
           
            [model setValuesForKeysWithDictionary:dic];
            //对模型进行标记
//            model.isfav = NO;
         
            [self.dataSource  addObject:model];
            
        }
        [self.table  reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return  self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailCell * cell = [tableView  dequeueReusableCellWithIdentifier:@"detail"];
     DetailModel *  model = self.dataSource[indexPath.row];
//     _cell.delegate = self;
//    _index = indexPath;
    
   
    [cell   getCellWithModel: model];
    return cell;
}
////调用这个协议方法
//- (void)changeButtonState {
//    DetailModel * model = _dataSource[_index.row];
//    NSLog(@"%ld",_index.row);
//    
//    NSString * isfav = model.isfav;
//    //模型没有被收藏
//    if (isfav == nil) {
//
//        BOOL ret = [[FBDataBaseManager  sharedManager]addRecord:model];
//        if (ret ==YES) {
//            model.isfav = @"1";
//            UIAlertView  * alert  =[[UIAlertView  alloc]initWithTitle:@"提示" message:@"已经收藏成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert  show];
//        }
//
//    }
//    else//模型被收藏了
//    {
//        model.isfav =nil;
//    }
//
//    [self.table  reloadData];
//}

//选中回调
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseWebView  * webview = [[BaseWebView  alloc]init];
    DetailModel * model = self.dataSource[indexPath.row];
    
    NSString *url=[NSString stringWithFormat:@"http://ibaby.ipadown.com/api/food/food.show.detail.php?id=%@",model.ID];
    webview.webPath = url;
    [self.navigationController  pushViewController:webview animated:YES];

}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray  alloc]init];
    }
    return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
