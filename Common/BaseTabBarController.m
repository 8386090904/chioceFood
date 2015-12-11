//
//  BaseTabBarController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/18.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "BaseTabBarController.h"
#import "FindViewController.h"
#import "SetViewController.h"
#import "MainViewController.h"
#import "MenuViewController.h"
#import "BaseNavigationController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  addControllers];
}

- (void)addControllers {
    MainViewController * mainVC = [[MainViewController alloc]init];
    MenuViewController * menuVC = [[MenuViewController alloc]init];
    FindViewController *fineVC = [[FindViewController alloc]init];
    SetViewController * setVC = [[SetViewController alloc]init];
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:mainVC,menuVC,fineVC,setVC, nil];
    NSArray * imgArr = @[@"index",@"surprise",@"find",@"me"];
    NSArray * titleArr = @[@"主页",@"菜谱",@"发现",@"设置"];
    
    [arr   enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController * vc = obj;
        BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
        
        [arr  replaceObjectAtIndex:idx withObject:nav];
        
        NSString * normalName = [NSString  stringWithFormat:@"z_home_menu_ico_%@",imgArr[idx]];
        UIImage  * normalImage = [UIImage  imageNamed:normalName];
        normalImage = [normalImage  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.image = normalImage;
        
        
        NSString * selectName = [NSString  stringWithFormat:@"z_home_menu_ico_%@_active",imgArr[idx]];
        UIImage  * selectImage = [UIImage  imageNamed:selectName];
        selectImage = [selectImage  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = selectImage;
        
        
        nav.title = titleArr[idx];
        [nav.tabBarItem  setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor  redColor]} forState:UIControlStateSelected];
    }];
    self.selectedIndex = 0;
    self.viewControllers = arr;
    

}



@end
