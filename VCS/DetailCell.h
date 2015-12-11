//
//  DetailCell.h
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/23.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailModel;

//@protocol DetailCellClickDelegate <NSObject>
//
//- (void)changeButtonState;
//
//@end



@interface DetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *adaptLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilityLabel;

//@property (nonatomic,strong) UIButton  * button;

- (void)getCellWithModel:(DetailModel *)model;

//@property (nonatomic,weak) id<DetailCellClickDelegate>delegate;

@end
