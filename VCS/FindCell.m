//
//  FindCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "FindCell.h"
#import "UIKit+AFNetworking.h"
#import "FindModel.h"

@implementation FindCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)getCellWithModel:(FindModel *)model {
    [self.icon  setImageWithURL:[NSURL     URLWithString:model.thumb] placeholderImage:nil];
    self.titleLabel.text = model.title;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
