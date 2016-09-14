//
//  ViewController.m
//  GaoDeMap
//
//  Created by asia wang on 16/9/12.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import "ViewController.h"
#import "ZDMapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)mapClick:(id)sender {
    ZDMapViewController *zdMapView = [[ZDMapViewController alloc] init];
    [self.navigationController pushViewController:zdMapView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
