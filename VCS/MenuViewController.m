//
//  MenuViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "MenuViewController.h"
#import "CuisineViewController.h"
#import "MenuDetailController.h"
#import "Micro.h"
@interface MenuViewController ()<clickBlickDelegate>
//声明两个添加控制器属性
@property (nonatomic,strong)CuisineViewController * cuisine;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  createCollection];
    self.title = @"菜谱";
//    self.view.backgroundColor =[UIColor  colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1];
}

#warning 这里的类经过封装    因此如果想要点击实现跳转 因为子Controller 没有导航栏 需要找到父Controller直接进行回调
- (void)createCollection
{
#warning 重点  这设置代理和block必须是同一个对象  否则不会执行
    self.cuisine = [[CuisineViewController alloc]init];
    [self.view  addSubview:self.cuisine.view];
    self.cuisine.Delegate = self;
}
- (void)pushNextPage:(NSString *)str {

    MenuDetailController * menu = [[MenuDetailController alloc]init];
    menu.path = str;
    menu.hidesBottomBarWhenPushed = YES;
    [self.navigationController  pushViewController:menu animated:YES];
    
}

@end
