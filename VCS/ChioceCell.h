//
//  ChioceCell.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BaseModel;
@interface ChioceCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

-(void)getCellWithModel:(BaseModel *)model;

@end
