//
//  DrawController3.m
//  LQLDemo
//
//  Created by LQL on 2019/8/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "DrawController3.h"

@interface DrawController3 ()

@end

@implementation DrawController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self copyAnimation];
    [self scaleAnimation];
}


#pragma mark
- (void)copyAnimation {
    UIView *animationView = [UIView new];
    animationView.frame = CGRectMake((kWidth-300)/2, 100, 200, 200);
//    animationView.center = self.view.center;
    animationView.backgroundColor = [UIColor grayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];

    CAShapeLayer *animationLayer = [[CAShapeLayer alloc] init];
    animationLayer.backgroundColor = [UIColor orangeColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 15, 15);
    animationLayer.cornerRadius = 10;
    animationLayer.masksToBounds = YES;
    animationLayer.position = CGPointMake(animationView.bounds.size.width/2, 50);
    animationLayer.borderColor = [UIColor whiteColor].CGColor;
    animationLayer.transform = CATransform3DMakeScale(0.0, 0.0, 1);

    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.duration = 1.0;
    transformAnim.repeatCount = HUGE;
    transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 1)];

    [animationLayer addAnimation:transformAnim forKey:@"keee"];

    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = CGRectMake(0, 0, animationView.bounds.size.width, animationView.bounds.size.width);
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceDelay = 0.05;
    CGFloat angle = (2.0*M_PI) / (20.0);
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);

    [animationView.layer addSublayer:replicatorLayer];
}
#pragma mark
- (void)scaleAnimation {
    UIView *animationView = [UIView new];
    animationView.frame = CGRectMake(0, 400, kWidth, 200);
    animationView.backgroundColor = [UIColor lightGrayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];
    
    CAShapeLayer *animationLayer = [[CAShapeLayer alloc] init];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius = 10;
    animationLayer.position = CGPointMake(kWidth/2, 100);
    
    // 放大的动画
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(10, 10, 1)];
    transformAnim.duration = 1;
    
    
    // 透明度动画(其实也可以直接设置CAReplicatorLayer的instanceAlphaOffset来实现)
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = @(1);
    alphaAnim.toValue = @(0);
    alphaAnim.duration = 1;
    
    
    CAAnimationGroup *animGroup = [[CAAnimationGroup alloc] init];
    animGroup.animations = @[transformAnim, alphaAnim];
    animGroup.duration = 1;
    animGroup.repeatCount = MAXFLOAT;
    [animationLayer addAnimation:animGroup forKey:@"rrr"];
    
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 3;  //三个复制图层
    replicatorLayer.instanceDelay = 0.2;  // 复制间隔0.3秒
    [animationView.layer addSublayer:replicatorLayer];
    
    
}
@end
