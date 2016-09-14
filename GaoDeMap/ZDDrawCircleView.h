//
//  ZDDrawCircleView.h
//  GaoDeMap
//
//  Created by asia wang on 16/9/13.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDDrawCircleView : UIView
@property (nonatomic,assign,readonly) CGPoint startPoint;
@property (nonatomic,assign,readonly) CGPoint endPoint;

@property (nonatomic,assign) BOOL isCircle; // 围栏样式yes->圆 no->矩形
@end
