//
//  ViewController.h
//  ChioceFood
//
//  Created by qianfeng on 15/12/11.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//接口网址
@property (nonatomic,assign)NSInteger number;
@property (nonatomic,strong)NSString * ID;
@property (nonatomic,copy)NSString * url;
- (void)setUrl;
@property (nonatomic,strong)NSMutableArray * dataArr;
@property (nonatomic,strong)UITableView * tableV;
//广告下载接口
- (void)loadAdData;
- (void)addRefresh;
- (void)setcell;
- (void)addNextPage;
- (void)loadData;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

