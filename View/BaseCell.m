//
//  BaseCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "BaseCell.h"
#import "UIKit+AFNetworking.h"
#import "BaseModel.h"

@implementation BaseCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)getCellWithModel:(BaseModel *)model {
    [self.icon setImageWithURL:[NSURL  URLWithString:model.imgsrc] placeholderImage:nil];
    
    self.titleLable.text = model.title;
    self.timeLabel.text = model.source;
    self.countLabel.text =  [NSString  stringWithFormat:@"跟帖数：%@",model.replyCount];
    self.descLabel.text = model.digest;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
