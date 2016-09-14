//
//  ZDBaseMapViewController.m
//  GaoDeMap
//
//  Created by asia wang on 16/9/13.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import "ZDBaseMapViewController.h"

@interface ZDBaseMapViewController ()

@end

@implementation ZDBaseMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initMapView];
}

- (void)initMapView {
    self.mapView = [[MAMapView alloc] init];
    self.mapView.frame = self.view.bounds;
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    if (!self.mapView.isShowsUserLocation) {
        [self.mapView isShowsUserLocation];
    }
    self.mapView.visibleMapRect = MAMapRectMake(220880104, 101476980, 272496, 466656);
}


- (void)clearMapView
{
    self.mapView.showsUserLocation = NO;
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.mapView removeOverlays:self.mapView.overlays];
    
    self.mapView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
