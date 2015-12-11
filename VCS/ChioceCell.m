//
//  ChioceCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "ChioceCell.h"
#import "UIKit+AFNetworking.h"
#import "BaseModel.h"
#import "NSString+URLEncoding.h"


@implementation ChioceCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)getCellWithModel:(BaseModel *)model {
    self.titleLabel.text = model.title;
    self.descLabel.text = model.digest;
//    [self.icon  setImageWithURL:[NSURL  URLWithString:model.imgsrc] placeholderImage:nil];
    NSData  * data = [NSData  dataWithContentsOfURL:[NSURL  URLWithString:model.imgsrc]];
    self.icon.image = [UIImage  imageWithData:data];
    self.sourceLabel.text = model.source;
    self.countLabel.text = [NSString  stringWithFormat:@"跟帖数：%@",model.replyCount];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
