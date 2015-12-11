//
//  MainViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "MainViewController.h"
#import "HealthController.h"
#import "ChoiceFoodController.h"
#import "WorldViewController.h"
#import "SCNavTabBarController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏系统导航条  三个各面可以实现滚动
//    self.navigationController.navigationBarHidden = YES;
    [self  createViewControllers];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)createViewControllers {
    HealthController * health = [[HealthController alloc]init];
    ChoiceFoodController * choice = [[ChoiceFoodController alloc]init];
    WorldViewController * world = [[WorldViewController alloc]init];
    health.title = @"健康资讯";
    choice.title = @"美食精选";
    world.title =  @"中外精华";
    SCNavTabBarController * sc = [[SCNavTabBarController  alloc]init];
    sc.subViewControllers =@[health,choice,world];
    sc.navTabBarColor = [UIColor colorWithRed:200/255.f green:50/255.f blue:30/255.f alpha:1];
//        self.view.backgroundColor = [UIColor  colorWithRed:200/255.f green:50/255.f blue:30/255.f alpha:0.8];
    [sc  addParentController:self];

}



@end
