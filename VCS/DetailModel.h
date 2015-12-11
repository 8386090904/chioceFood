//
//  DetailModel.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (nonatomic,copy)NSString * ID;
@property (nonatomic,copy)NSString * category;
@property (nonatomic,copy)NSString * age;
@property (nonatomic,copy)NSString * effect;
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * thumb;
//不需要数据进行赋值  我定义属性
@property (nonatomic,copy)NSString *  isfav;

@end
