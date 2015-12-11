//
//  HealthController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "HealthController.h"
#import "HeadScroll.h"
#import "AFNetworking.h"
#import "URLS.h"
#import "Micro.h"

@interface HealthController ()
@property (nonatomic,strong)NSMutableArray * ImagArr;
@property (nonatomic,strong)HeadScroll * header;
@end

@implementation HealthController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  loadAdData];
    [self  tableV];
    [self  setUrl];
    [self  loadData];
    [self  addNextPage];
    [self  addRefresh];
    self.number = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
 
}


- (void)loadAdData {
    
    AFHTTPSessionManager  * manager = [AFHTTPSessionManager  manager];
    [manager  GET:KHEALTH parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * dict = responseObject[@"result"];
        NSDictionary * dic = dict[@"recipe"];
        NSArray * arr = dic[@"list"];
        
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary * dic = obj;
            NSString * str = [dic   objectForKey:@"Img"];
            [self.ImagArr  addObject:str];
        }];
        
        //添加滚动视图到表头
        [self.header  getViewWithImageArr:self.ImagArr];
        self.tableV.tableHeaderView = self.header;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-  (HeadScroll *)header {
    if (!_header) {
        _header = [[HeadScroll alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, 200)];
        
    }return _header;
}
- (NSMutableArray *)ImagArr {
    if (!_ImagArr) {
        _ImagArr = [[NSMutableArray  alloc]init];
    }return _ImagArr;
}

@end
