//
//  HeadScroll.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "HeadScroll.h"
#import "Micro.h"
#import "UIKit+AFNetworking.h"

@interface HeadScroll ()

@property (nonatomic,strong)UIScrollView * scroll;
@end

@implementation HeadScroll

- (void)getViewWithImageArr:(NSMutableArray *)imagArr {
    self.scroll = [[UIScrollView  alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, 200)];
    
    for (int i =0; i<imagArr.count; i++) {
        UIImageView * imagV = [[UIImageView  alloc]initWithFrame:CGRectMake(SWIDTH*i,0 , SWIDTH, 200)];
        [imagV  setImageWithURL:[NSURL  URLWithString:imagArr[i]] placeholderImage:nil];
        self.scroll.contentOffset = CGPointMake(SWIDTH*i, 0);
        [self.scroll  addSubview:imagV];
        
    }
    self.scroll.pagingEnabled = YES;
    self.scroll.showsHorizontalScrollIndicator= NO;
    self.scroll.contentSize = CGSizeMake(SWIDTH*imagArr.count, 200);
    [self  addSubview:self.scroll];

}




@end
