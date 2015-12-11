//
//  MenusCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/20.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "MenusCell.h"
#import "BaseModel.h"
#import "UIKit+AFNetworking.h"

@implementation MenusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)getCellWithModel:(MenusModel *)model {
    [self.icon  setImageWithURL:[NSURL   URLWithString:model.img] placeholderImage:nil];
    
    self.nameLabel.text = model.name;
    self.descLabel.text = model.burdens;
    self.FrivateLabel.text =  [NSString  stringWithFormat:@"跟帖：%@",model.favorites ];
    self.clickLabel.text =  [NSString  stringWithFormat:@"总收藏：%ld",   (long)model.allClick.integerValue ];

}


@end
