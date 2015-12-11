//
//  CuisineViewController.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "BaseMenuViewController.h"
#import "MenuDetailController.h"

//typedef void (^Block) (NSString *);

@protocol clickBlickDelegate <NSObject>

- (void)pushNextPage:(NSString *)str;

@end


@interface CuisineViewController : BaseMenuViewController

//
//@property (nonatomic,copy) void (^clickblock) (NSString *) ;
@property (nonatomic,strong)id <clickBlickDelegate>Delegate;
@end
