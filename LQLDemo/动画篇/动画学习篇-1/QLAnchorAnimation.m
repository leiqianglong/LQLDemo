//
//  QLAnchorAnimation.m
//  LQLDemo
//
//  Created by LQL on 2019/11/4.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLAnchorAnimation.h"

@interface QLAnchorAnimation ()
@property (nonatomic, strong) UIButton *alertButton;
@end

@implementation QLAnchorAnimation

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alertButton.frame = CGRectMake(kWidth * 0.5 - 50.0, kWidth * 0.5 - 50.0, 100.0, 100.0);
    alertButton.center = self.view.center;
    [alertButton addTarget:self action:@selector(alertButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    alertButton.backgroundColor = [UIColor redColor];
    alertButton.layer.cornerRadius = 50.0;
    alertButton.layer.masksToBounds = YES;
    [self.view addSubview:alertButton];
    self.alertButton = alertButton;
}

#pragma mark -  Object Private Function

- (void)alertButtonDidClick:(UIButton *)button
{
    //创建帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1.0;
    //创建动画属性数组
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.alertButton.layer addAnimation:animation forKey:nil];
}

@end
