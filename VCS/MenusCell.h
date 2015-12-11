//
//  MenusCell.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/20.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenusModel;

@interface MenusCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *FrivateLabel;

@property (weak, nonatomic) IBOutlet UILabel *clickLabel;

-(void)getCellWithModel:(MenusModel *)model;

@end
