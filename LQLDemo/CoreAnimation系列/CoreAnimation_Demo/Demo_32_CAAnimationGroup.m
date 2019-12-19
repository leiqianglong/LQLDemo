//
//  Demo_32_CAAnimationGroup.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_32_CAAnimationGroup.h"

@interface Demo_32_CAAnimationGroup ()

@end

@implementation Demo_32_CAAnimationGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(20, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(80, 25) controlPoint2:CGPointMake(200, 200)];//通过3点画弧线
    
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.fillColor = [UIColor whiteColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 4;
    pathLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:pathLayer];
    
    //add a colored layer
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 50 , 50);
    colorLayer.position = CGPointMake(20, 150);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    //create the position animation
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    
    //create the color animation
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    //create group animation
    CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
    group.animations = @[animation1,animation2];
    group.duration = 4.0f;
    [colorLayer addAnimation:group forKey:nil];
    
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
