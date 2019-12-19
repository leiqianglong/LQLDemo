//
//  Demo_37_Autoreverses.m
//  LQLDemo
//
//  Created by LQL on 2019/10/22.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_37_Autoreverses.h"

@interface Demo_37_Autoreverses ()
@property (nonatomic, strong) UIView *containerView;
@end

@implementation Demo_37_Autoreverses

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
    [self.view addSubview:self.containerView];
    
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake(150 - 64, 150);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed: @"door"].CGImage;
    [self.containerView.layer addSublayer:doorLayer];
    
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = perspective;
    
    //apply swinging animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}

@end
