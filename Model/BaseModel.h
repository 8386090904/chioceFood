//
//  BaseModel.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
/**简介*/
@property (nonatomic,copy)NSString * digest;
/**跟帖数*/
@property (nonatomic,strong)NSNumber * replyCount;
/**资料来源*/
@property (nonatomic,copy)NSString * source;
/**名称*/
@property (nonatomic,copy)NSString * title;
/**跳转页面的路径*/
@property (nonatomic,copy)NSString * url;
/**图片地址*/
@property (nonatomic,copy)NSString  * imgsrc;


@end


@interface MenusModel : NSObject
/**id*/
@property (nonatomic,copy)NSString * code;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * img;
/**简介*/
@property (nonatomic,copy)NSString * burdens;
/**点击*/
@property (nonatomic,strong)NSNumber * allClick;
/**收藏*/
@property (nonatomic,strong)NSNumber * favorites;



@end