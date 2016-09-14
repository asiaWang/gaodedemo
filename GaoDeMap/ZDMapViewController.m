//
//  ZDMapViewController.m
//  GaoDeMap
//
//  Created by asia wang on 16/9/13.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import "ZDMapViewController.h"
#import "ZDDrawCircleView.h"

@interface ZDMapViewController()
@property (nonatomic, strong) MAAnnotationView *userLocationAnnotationView;
@property (nonatomic, strong) ZDDrawCircleView *drawLayerView;
@end

@implementation ZDMapViewController

- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    
    MAAnnotationView *view = views[0];
    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc]init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"userPosition"];
        pre.lineWidth = 3;
        
        [self.mapView updateUserLocationRepresentation:pre];
        view.calloutOffset = CGPointMake(0, 0);
        view.canShowCallout = NO;
        self.userLocationAnnotationView = view;
        
    }
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    if (!updatingLocation && self.userLocationAnnotationView != nil) {
        [UIView animateWithDuration:0.3 animations:^{
            double degree = userLocation.heading.trueHeading;
            self.userLocationAnnotationView.transform = CGAffineTransformMakeRotation(degree *M_PI / 180.f);
        }];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    [self.mapView setZoomLevel:16.1 animated:YES];
    
    if (!self.drawLayerView) {
        self.drawLayerView = [[ZDDrawCircleView alloc]initWithFrame:self.view.bounds];
        [self.mapView addSubview:self.drawLayerView];
        self.drawLayerView.isCircle = NO;
    }
}

@end
