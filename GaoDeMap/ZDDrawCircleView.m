//
//  ZDDrawCircleView.m
//  GaoDeMap
//
//  Created by asia wang on 16/9/13.
//  Copyright © 2016年 asia wang. All rights reserved.
//

#import "ZDDrawCircleView.h"

@interface ZDDrawCircleView()
@property (nonatomic,strong) CAShapeLayer *shapLayer;
@property (nonatomic,assign,readwrite) CGPoint startPoint;
@property (nonatomic,assign,readwrite) CGPoint endPoint;
@end

@implementation ZDDrawCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.01];
        [self initGestures];
        
    }
    return self;
}

- (void)initGestures {
    self.isCircle = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesturePan:)];
    [self addGestureRecognizer:panGesture];
}

- (void)panGesturePan:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.startPoint = [sender locationInView:self];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentPoint = [sender locationInView:self];
            CGFloat xw = currentPoint.x - self.startPoint.x;
            CGFloat hw = currentPoint.y - self.startPoint.y;
            CGFloat distense = sqrt(xw *xw) + sqrt(hw *hw);
            if (distense > 0) {
                [self drawCircleRadius:distense currentPoint:currentPoint];
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            self.endPoint = [sender locationInView:self];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            break;
        default:
            NSLog(@"do nothings");
            break;
    }
}

- (void)drawCircleRadius:(CGFloat)radius currentPoint:(CGPoint)currentPoint {
    
    [UIView animateWithDuration:0.2 animations:^{
        if (self.shapLayer != nil) {
            [self.shapLayer removeFromSuperlayer];
            _shapLayer = nil;
        }
        
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        UIBezierPath *path;
        if (self.isCircle) {
            path = [UIBezierPath bezierPath];
            [path addArcWithCenter:self.startPoint radius:radius startAngle:0.0 endAngle:180 clockwise:YES];
        }else{
            CGFloat xw = (currentPoint.x - self.startPoint.x) > 0 ? (currentPoint.x - self.startPoint.x):( self.startPoint.x - currentPoint.x);
            CGFloat hw = (currentPoint.y - self.startPoint.y) > 0 ? (currentPoint.y - self.startPoint.y):(self.startPoint.y - currentPoint.y);
            
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.startPoint.x, self.startPoint.y, xw, hw) cornerRadius:0];
        }
        [path stroke];
        shapLayer.path = [path CGPath];
        shapLayer.strokeColor = [UIColor blueColor].CGColor;
        shapLayer.fillColor = [UIColor clearColor].CGColor;
        shapLayer.lineWidth = 2.0;
        self.shapLayer = shapLayer;
        [self.layer addSublayer:self.shapLayer];
    }];
}
@end
