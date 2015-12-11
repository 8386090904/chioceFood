//
//  DetailCell.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "DetailCell.h"
#import "DetailModel.h"
#import "UIKit+AFNetworking.h"

#import "Micro.h"

@implementation DetailCell


//
//- (void)awakeFromNib {
//    
//        _button = [UIButton  buttonWithType:UIButtonTypeCustom];
//        [_button  setImage:[UIImage  imageNamed:@"fav1"] forState:UIControlStateNormal];
//        _button.frame = CGRectMake(SWIDTH-50, 10, 30, 30);
//        [self.contentView  addSubview:_button];
//        [_button  addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)click:(UIButton *)button {
//    [self.delegate changeButtonState];
//
//    
//    
//    
//}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)getCellWithModel:(DetailModel *)model {
    [self.icon  setImageWithURL:[NSURL  URLWithString:model.thumb] placeholderImage:nil];
    self.titleLabel.text = model.title;
    self.descLabel.text = model.category;
    self.adaptLabel.text = model.age;
    self.abilityLabel.text = model.effect;

}


@end
