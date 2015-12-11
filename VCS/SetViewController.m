//
//  SetViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/24.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "SetViewController.h"
#import "Micro.h"
#import "ErweimaViewController.h"
#import "MapViewController.h"
@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * dataArr;
@property (nonatomic,strong)NSArray * images;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self   tableView];
    [self   createHeadview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)createHeadview{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT/3)];
    UIImageView * imaV= [[UIImageView  alloc]initWithImage:[UIImage  imageNamed:@"bg.JPEG"]];
    imaV.frame = view.frame;
    [view addSubview:imaV];
    self.tableView.tableHeaderView = view;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static  NSString * reuseID = @"reuse  id";
    
    UITableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleSubtitle   reuseIdentifier:reuseID];
    }
    cell.textLabel.text = self.dataArr[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage   imageNamed:self.images[indexPath.section][indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArr.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        ErweimaViewController * erweima = [[ErweimaViewController alloc]init];
        [self.navigationController  pushViewController:erweima animated:YES];
        
    }else if (indexPath.section == 1) {
        MapViewController* map = [[MapViewController alloc]init];
        [self.navigationController pushViewController:map animated:YES];
        
    }

}



- (UITableView *)tableView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (!_tableView) {
        _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 64, SWIDTH, SHEIGHT - 64) style:UITableViewStyleGrouped];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.scrollEnabled = NO;
        [self.view  addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        
       self.images = @[@[@"menu_ico_center_on"],@[@"ico_cnleft_food"],@[@"ico_cnleft_shop"]];
        _dataArr = @[@[@"关于我们"],@[@"附近美食"]];
    }
    return _dataArr;
}


@end
