//
//  CuisineCell.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuModel;
@interface CuisineCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)getCellModel:(MenuModel *)model;

@end
