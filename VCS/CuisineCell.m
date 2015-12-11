//
//  CuisineCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "CuisineCell.h"

#import "UIKit+AFNetworking.h"
#import "MenuModel.h"



@implementation CuisineCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)getCellModel:(MenuModel *)model {
    [self.icon  setImageWithURL:[NSURL  URLWithString:model.icon] placeholderImage:nil];
    self.titleLabel.text = model.title;
}


@end
