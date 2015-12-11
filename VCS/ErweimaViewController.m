//
//  ErweimaViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/12/10.
//  Copyright © 2015年 fhl. All rights reserved.
//

#import "ErweimaViewController.h"
//生成二维码
#import "QRCodeGenerator.h"
#import "Micro.h"

@interface ErweimaViewController ()

@property (nonatomic,strong)UIImageView * imagev;

@end

@implementation ErweimaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1 ];
    
    
    UIBarButtonItem  * item = [[UIBarButtonItem  alloc]initWithTitle:@" 返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = item;


    //生成二维码
   self.imagev=[[UIImageView  alloc]initWithFrame:CGRectMake((SWIDTH-200)/2, SHEIGHT/10 , 200, 200)];
    
    _imagev.image = [QRCodeGenerator  qrImageForString:@"二维码" imageSize:600];
    
    [self.view  addSubview:_imagev];
    
    [self  createLabel];
    
}

- (void)backClick {
    [self.navigationController  popViewControllerAnimated:YES];
}

- (void)createLabel {
    UILabel  * label = [[UILabel  alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.imagev.frame), SWIDTH-40, 200)];
    [self.view addSubview:label];
   
    label.numberOfLines = 0;
    label.text = @"    本APP主要是用于介绍健康和美食方面的咨询，健康生活，享受美食!!!";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
