//
//  ZDBaseMapViewController.h
//  GaoDeMap
//
//  Created by asia wang on 16/9/13.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDMapKey.h"
#import <MAMapKit/MAMapKit.h>

@interface ZDBaseMapViewController : UIViewController<MAMapViewDelegate>
@property (nonatomic,strong) MAMapView *mapView;

- (void)clearMapView;
@end
