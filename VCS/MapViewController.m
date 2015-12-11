//
//  MapViewController.m
//  FB_ChoiceFood
//
//  Created by qianfeng on 15/12/8.
//  Copyright © 2015年 fhl. All rights reserved.
//

#import "MapViewController.h"

#import  <MapKit/MapKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface MapViewController ()<MKMapViewDelegate>
- (void)createMapView;//创建地图
- (void)createAnnotation;//创建标注
//- (void)createCustomAnnotation;//自定义标注
//- (void)createOverlay;//创建图层
@property (nonatomic,strong)MKMapView * mapView;
@property (nonatomic,strong)CLLocationManager * manager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMapView];
    [self createAnnotation];
    
    UIBarButtonItem  * item = [[UIBarButtonItem  alloc]initWithTitle:@" 返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)backClick {
    [self.navigationController  popViewControllerAnimated:YES];
}


- (void)createMapView {
    self.mapView = [[MKMapView  alloc]initWithFrame:self.view.bounds];
    [self.view  addSubview:self.mapView];
    
    self.mapView.mapType = MKMapTypeStandard;//标准地图
    self.mapView.delegate = self;
    
    self.manager = [[CLLocationManager  alloc]init];
    if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_manager requestWhenInUseAuthorization];
    }
    
    self.mapView.scrollEnabled = YES;
    self.mapView.zoomEnabled = YES;
    
    CLLocationCoordinate2D  center = CLLocationCoordinate2DMake(40.1250230000,116.2577710000);
    self.mapView.region = MKCoordinateRegionMakeWithDistance(center, 10000, 10000);
    
    
    if ([CLLocationManager  locationServicesEnabled]==YES) {
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = MKUserTrackingModeFollow;//尾随模式
    }
    
}
//创建大头针
- (void)createAnnotation {
    MKPointAnnotation * annotation1 = [[MKPointAnnotation  alloc]init];
    annotation1.title = @"北科";
    annotation1.subtitle = @"2号楼";
    annotation1.coordinate = CLLocationCoordinate2DMake(40.1250230000,116.2577710000);
    [_mapView  addAnnotation:annotation1];
}
//确定大头针的显示样式
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView  * anno;
//    if ([annotation  isKindOfClass:[MKUserLocation  class]]== YES) {
       anno = [[MKAnnotationView  alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        
        anno.contentMode = UIViewContentModeScaleToFill;
        UIImage * image = [UIImage  imageNamed:@"marker_inside_pink.png"];
        NSData  * data = UIImagePNGRepresentation(image);
        image = [UIImage    imageWithData:data scale:9];
        anno.image = image;
        
       
        anno.canShowCallout = YES;
        anno.centerOffset = CGPointMake(0, -20);
        anno.annotation = annotation;
//    }
    return anno;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
