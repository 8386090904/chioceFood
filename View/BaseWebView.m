//
//  BaseWebView.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "BaseWebView.h"
#import "Micro.h"
#import "MMProgressHUD.h"

@interface BaseWebView ()

@end

@implementation BaseWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  createWeb];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem  * item = [[UIBarButtonItem  alloc]initWithTitle:@" 返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = item;
}



- (void)createWeb {
//    UIBarButtonItem  * item = [[UIBarButtonItem  alloc]initWithTitle:@" 返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
//    self.navigationItem.leftBarButtonItem = item;
//    [MMProgressHUD setPresentationStyle: MMProgressHUDPresentationStyleDrop];
//    [MMProgressHUD   showDeterminateProgressWithTitle:nil status:@"为您加载中..."];
    
    self.web = [[UIWebView  alloc]initWithFrame:CGRectMake(0,64, SWIDTH, SHEIGHT)];
    NSURL * weburl = [NSURL  URLWithString:self.webPath];
    NSURLRequest * request = [NSURLRequest  requestWithURL:weburl];
    [self.web  loadRequest:request];
    [self.web  setScalesPageToFit:YES];
    [self.view  addSubview:self.web];
}
- (void)backClick {
    [self.navigationController  popViewControllerAnimated:YES];

    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
