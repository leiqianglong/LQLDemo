//
//  BreathView.m
//  AnimationDemo
//
//  Created by LQL on 2019/10/29.
//  Copyright © 2019 com.lal. All rights reserved.
//
#import "BreathView.h"

@interface BreathView()
/// 花瓣容器图层
@property(nonatomic,strong)CAReplicatorLayer *containerLayer;
@property(nonatomic,strong)FirstPetalColor *fistColor;
@property(nonatomic,strong)LastPetalColor *lastColor;
@end

@implementation BreathView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.containerLayer.frame = self.bounds;
}
-(void)initUI{
    self.backgroundColor = [UIColor blackColor];
    self.petalCount = 6.0;
    self.petalMaxRadius = 80.0;
    self.petalMinRadius = 24.0;
    self.animationDuration = 5.5;
    self.fistColor = [[FirstPetalColor alloc]init];
    self.lastColor = [[LastPetalColor alloc]init];
    [self.layer addSublayer:self.containerLayer];
}
//CAReplicatorLayer是一个Layer容器，添加到容器上的子Layer可以复制若干份；
- (CAReplicatorLayer *)containerLayer{
    if (_containerLayer == nil) {
        _containerLayer = [CAReplicatorLayer layer];
        //复制的数量
        _containerLayer.instanceCount = self.petalCount;
        //设置颜色动画
        _containerLayer.instanceColor = [[UIColor colorWithRed:self.fistColor.red green:self.fistColor.green blue:self.fistColor.bule alpha:1.0]CGColor];
        _containerLayer.instanceRedOffset = (self.lastColor.red - self.fistColor.red) / self.petalCount;
        _containerLayer.instanceGreenOffset = (self.lastColor.green - self.fistColor.green) / self.petalCount;
        _containerLayer.instanceBlueOffset = (self.lastColor.bule - self.fistColor.bule) / self.petalCount;
        _containerLayer.instanceTransform = CATransform3DMakeRotation(-M_PI*2/self.petalCount, 0, 0, 1);
    }
    return _containerLayer;
}

-(CAShapeLayer *)createPetal:(CGPoint)center radius:(CGFloat)radius{
    CAShapeLayer *petal = [CAShapeLayer layer];
    petal.fillColor = [[UIColor whiteColor]CGColor];
    UIBezierPath *petalPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    petal.path = petalPath.CGPath;
    //指明我们使用滤色混合模式
    petal.compositingFilter = @"screenBlendMode";
    petal.frame = CGRectMake(0, 0, self.containerLayer.bounds.size.width, self.containerLayer.bounds.size.height);
    return petal;
}

-(void)animate{
    //获取花瓣
    CAShapeLayer *petalLayer = [self createPetal:CGPointMake(self.containerLayer.bounds.size.width/2, self.containerLayer.bounds.size.height/2) radius:self.petalMinRadius];
    //添加到containerlayer中
    [self.containerLayer addSublayer:petalLayer];
    //为了看清6个花瓣堆叠的样子，暂时设置0.75的不透明度
//    petalLayer.opacity = 0.75;
    //定义展开的关键帧动画
    CAKeyframeAnimation *moveAnitaion = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    //values和keyTimes一一对应，各个时刻的属性值
    moveAnitaion.values = @[@(petalLayer.position.x),
                            @(petalLayer.position.x - _petalMaxRadius),
                            @(petalLayer.position.x - _petalMaxRadius),
                            @(petalLayer.position.x)];
    moveAnitaion.keyTimes = @[@0.1,@0.4,@0.5,@0.95];

    //创建缩放动画
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@1, @(self.petalMaxRadius/self.petalMinRadius), @(self.petalMaxRadius/self.petalMinRadius), @1];
    scaleAnimation.keyTimes = @[@0.1,@0.4,@0.5,@0.95];
    
    //定义CAAnimationGroup，组合多个动画同时运行。这不待会还有一个"放大花瓣"嘛
    CAAnimationGroup *petalAnimationGroup = [[CAAnimationGroup alloc]init];
    petalAnimationGroup.duration = self.animationDuration;
    petalAnimationGroup.repeatCount = MAXFLOAT;
    //将动画属性添加到动画组中
    petalAnimationGroup.animations = @[moveAnitaion,scaleAnimation];
    [petalLayer addAnimation:petalAnimationGroup forKey:nil];
    
    
    //画板旋转 --- containerLayer添加旋转动画
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.duration = self.animationDuration;
    //从初始弧度-CGFloat.pi * 2 / CGFloat(petalCount) 旋转到CGFloat.pi * 2 / CGFloat(petalCount)，正好旋转了2π/3。
    rotateAnimation.values = @[@((-M_PI * 2) / self.petalCount),
                               @((-M_PI * 2) / self.petalCount),
                               @((M_PI * 2) / self.petalCount),
                               @((M_PI * 2) / self.petalCount),
                               @((-M_PI * 2) / self.petalCount)];
    
    rotateAnimation.keyTimes = @[@0.0, @0.1, @0.4, @0.5, @0.95];
    rotateAnimation.repeatCount = MAXFLOAT;
    [self.containerLayer addAnimation:rotateAnimation forKey:nil];

    //添加收回时候的残影效果
    CAShapeLayer *ghostPetalLayer = [self createPetal:CGPointMake(self.containerLayer.bounds.size.width/2.0-self.petalMaxRadius, self.containerLayer.bounds.size.height/2.0) radius:self.petalMaxRadius];
    [self.containerLayer addSublayer:ghostPetalLayer];
    ghostPetalLayer.opacity = 0.0;
    //设置动画
    CAKeyframeAnimation *fadeOutAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    fadeOutAnimation.values = @[@0.0,@0.3,@0.0];
    fadeOutAnimation.keyTimes = @[@0.45,@0.5,@0.8];
    
    CAKeyframeAnimation *ghostScaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    ghostScaleAnimation.values = @[@1.0,@1.0,@0.78];
    ghostScaleAnimation.keyTimes = @[@0.0,@0.5,@0.8];
    
    CAAnimationGroup *ghostAnimationGroup = [[CAAnimationGroup alloc]init];
    ghostAnimationGroup.duration = self.animationDuration;
    ghostAnimationGroup.repeatCount = MAXFLOAT;
    ghostAnimationGroup.animations = @[fadeOutAnimation,ghostScaleAnimation];
    [ghostPetalLayer addAnimation:ghostAnimationGroup forKey:nil];
}
@end


//添加颜色
/// 第一朵花瓣的颜色
/// 设定好第一朵花瓣和最后一朵花瓣的颜色后，如果花瓣数量大于2，那么中间花瓣的颜色将根据这两个颜色苹果进行平均过渡
@interface FirstPetalColor()

@end
@implementation FirstPetalColor

-(CGFloat)red{
    return 0.17;
}
- (CGFloat)green{
    return 0.59;
}
-(CGFloat)bule{
    return 0.60;
}
@end

/// 最后一朵花瓣的颜色
@interface LastPetalColor()


@end
@implementation LastPetalColor

-(CGFloat)red{
    return 0.31;
}
- (CGFloat)green{
    return 0.85;
}
-(CGFloat)bule{
    return 0.62;
}

@end
