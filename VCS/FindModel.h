//
//  FindModel.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindModel : NSObject
/**ID*/
@property (nonatomic,copy)NSString * ID;
/**名称*/
@property (nonatomic,copy)NSString * title;
/**图片地址*/
@property (nonatomic,copy)NSString * thumb;
/**简介*/
@property (nonatomic,copy)NSString * jianjie;
/**收藏数*/
@property (nonatomic,copy)NSString * likes;
/**更新时间*/
@property (nonatomic,copy)NSString * edittime;


@end
