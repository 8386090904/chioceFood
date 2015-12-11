//
//  CuisineViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/11/19.
//  Copyright (c) 2015年 fhl. All rights reserved.
//

#import "CuisineViewController.h"
#import "Micro.h"
#import "URLS.h"
#import "AFNetworking.h"
#import "MenuModel.h"
#import "CuisineCell.h"
#import "MenuDetailController.h"
#import "MMProgressHUD.h"
@interface CuisineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//菜系
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)NSMutableArray * dataArr;


@end

@implementation CuisineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  collectionView];
    
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection =  UICollectionViewScrollDirectionVertical;
        
        layout.itemSize = CGSizeMake(SWIDTH/3-10,SWIDTH/3-10);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64,SWIDTH , SHEIGHT-49-64) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource  =self;
        _collectionView.backgroundColor = [UIColor  whiteColor];
        [_collectionView  registerNib:[UINib  nibWithNibName:@"CuisineCell" bundle:nil]forCellWithReuseIdentifier:@"cell"];
        
        //组头的注册
        [_collectionView  registerClass:[UICollectionReusableView   class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
        
        
        [self.view  addSubview:_collectionView];
    }
    
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArr[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   CuisineCell *   cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MenuModel  * model = self.dataArr[indexPath.section][indexPath.item];
    [cell  getCellModel:model];
    
    return cell;

}


//组头  需要复用和注册

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView * view = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"view" forIndexPath:indexPath];
    
    NSArray *   arr = @[@"家常小味",@"八大菜系",@"地方特色",@"美味主食"];
    for (UILabel  * label in view.subviews) {
    
        [label  removeFromSuperview];
    
    }
        UILabel * label = [[UILabel  alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, 30)];
        label.text = arr[indexPath.section];
        label.textColor = [UIColor  whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont  systemFontOfSize:15];
    label.backgroundColor = [UIColor  redColor];
        [view   addSubview:label];
    
        return view;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuModel * model = self.dataArr[indexPath.section][indexPath.row];
//    self.clickblock(model.url);
    [self.Delegate pushNextPage:model.url];
    
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return   UIEdgeInsetsMake(5, 5, 5, 5);
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray  alloc]init];
        
        [MMProgressHUD setPresentationStyle:   MMProgressHUDPresentationStyleExpand];
        [MMProgressHUD  showDeterminateProgressWithTitle:nil status:@"加载..."];
        NSString  * path = [[NSBundle   mainBundle]pathForResource:@"group" ofType:@"plist"];
        NSArray  * arr = [NSArray  arrayWithContentsOfFile:path];
        [arr  enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSMutableArray  * menu = [[NSMutableArray alloc]init];
            for (NSDictionary  * dic in obj) {
                MenuModel * model = [[MenuModel  alloc]init];
                [model  setValuesForKeysWithDictionary:dic];
                [menu  addObject:model];
            }
            [self.dataArr  addObject:menu];
//            NSLog(@"%ld",self.dataArr.count);
            
        }];
        [MMProgressHUD  dismissAfterDelay:1];
        [self.collectionView  reloadData];
    }
    return _dataArr;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

    return   CGSizeMake(SWIDTH,	 30);
}

@end
