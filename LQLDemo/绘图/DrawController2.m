//
//  DrawController2.m
//  LQLDemo
//
//  Created by LQL on 2019/8/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "DrawController2.h"
#import "LHButton.h"
#import "DrawController3.h"
@interface DrawController2 ()
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UIView *clockView;
@end

@implementation DrawController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"动起来" style:(UIBarButtonItemStylePlain) target:self action:@selector(animation)];
    [self dashboardView];
    [self gradientColorLayer];
    [self customerButton];
    [self animation];
}

-(void)animation{
    CGFloat progress = (arc4random_uniform(40)+60)/100.0;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.removedOnCompletion = NO;
    animation.repeatCount = 1;
    animation.autoreverses = YES;
    animation.duration = 1.0f * progress;
    animation.fromValue = @(-0.2*M_PI);
    animation.toValue = @(1.4 * M_PI * progress - 0.2*M_PI);
    [self.clockView.layer addAnimation:animation forKey:@"dsgsdg"];
    
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.fillMode = kCAFillModeForwards;
    checkAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    checkAnimation.removedOnCompletion = NO;
    checkAnimation.duration = 1.0 * progress;
    checkAnimation.repeatCount = 1;
    checkAnimation.autoreverses = YES;
    checkAnimation.fromValue = @(0.0);
    checkAnimation.toValue = @(1.0 * progress);
    [self.progressLayer addAnimation:checkAnimation forKey:@"checkAnimation"];
    
    
}
- (void)dashboardView {
    //尺寸大小
    CGFloat itemWH = 300;
    //渐变背景
    CALayer *gradientLayer = [CALayer layer];
    gradientLayer.frame = CGRectMake((kWidth-itemWH)*0.5,(kHeight-itemWH)*0.5, itemWH, itemWH);
    //渐变图层
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    gradLayer.frame = CGRectMake(0, 0, itemWH, itemWH);
    //这里的颜色值一定要桥接转换一下 ,要不然显示不出来
    gradLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor, (__bridge id)[UIColor redColor].CGColor];
    gradLayer.locations = @[@(0),@(0.8)];
    gradLayer.startPoint = CGPointMake(0, 0.5);
    gradLayer.endPoint = CGPointMake(1, 0.5);
    [gradientLayer addSublayer:gradLayer];
    [self.view.layer addSublayer:gradientLayer];
    
    //开始角度
    CGFloat startA = -M_PI - 0.2 * M_PI; //(-180° - 180°/5) == -216°
    //结束角度
    CGFloat endA = 0.2 * M_PI;// 216°
    
    //圆心
    CGPoint center = CGPointMake(kWidth*0.5, kHeight*0.5);
    //画最外圈的大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:itemWH * 0.5
                                                    startAngle:startA
                                                      endAngle:endA
                                                     clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineCap = kCALineCapButt;//path端点样式字符串常量--无端点
    layer.lineWidth = 4;//线宽
    layer.strokeColor = [UIColor whiteColor].CGColor; //描边颜色
    layer.fillColor = [UIColor clearColor].CGColor;// 路径内部填充颜色
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
    
    //内圈圆弧
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center
                                                         radius:itemWH * 0.5-70
                                                     startAngle:startA
                                                       endAngle:endA
                                                      clockwise:YES];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.lineCap = kCALineCapSquare;//path端点样式字符串常量--方形
    layer2.lineWidth = 4;//线宽
    layer2.strokeColor = [UIColor whiteColor].CGColor; //描边颜色
    layer2.fillColor = [UIColor clearColor].CGColor;// 路径内部填充颜色
    layer2.path = path2.CGPath;
    [self.view.layer addSublayer:layer2];
    
    //中间圆弧
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center
                                                         radius:10
                                                     startAngle:startA
                                                       endAngle:endA
                                                      clockwise:YES];
    CAShapeLayer *layer3 = [CAShapeLayer layer];
    layer3.lineCap = kCALineCapSquare;//path端点样式字符串常量--方形
    layer3.lineWidth = 6;//线宽
    layer3.strokeColor = [UIColor whiteColor].CGColor; //描边颜色
    layer3.fillColor = [UIColor clearColor].CGColor;// 路径内部填充颜色
    layer3.path = path3.CGPath;
    [self.view.layer addSublayer:layer3];
    
    
    //进度圆弧
    UIBezierPath *path4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(itemWH*0.5, itemWH*0.5)
                                                         radius:(itemWH - 70)*0.5
                                                     startAngle:startA
                                                       endAngle:endA
                                                      clockwise:YES];
    CAShapeLayer *layer4 = [CAShapeLayer layer];
    layer4.lineCap = kCALineCapButt;
    layer4.fillColor = [UIColor clearColor].CGColor;
    layer4.strokeColor = [UIColor whiteColor].CGColor;
    layer4.lineWidth = 70;
    layer4.path = path4.CGPath;
    layer4.strokeEnd = 0;//线条的结束位置(0~1，对应于path而言，默认为1)
    gradientLayer.mask = layer4;
    //记录圆环图层
    self.progressLayer = layer4;
    
    
    //指针
    UIView *clockView = [[UIView alloc]initWithFrame:CGRectMake((kWidth-140)*0.5, (kHeight-2)*0.5, 140, 2)];
    clockView.backgroundColor = [UIColor whiteColor];
    clockView.layer.anchorPoint = CGPointMake(1.08, 0.5);
    [self.view addSubview:clockView];
    self.clockView = clockView;
    clockView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -0.2*M_PI);
    
    //刻度 --- 分成 70等分
    CGFloat perAngle = 1.4 * M_PI / 70;
    for (NSInteger i = 0; i < 71; i++) {
        CGFloat startAngel = (startA +perAngle * i);//没份的角度
        CGFloat endAngel = startAngel + perAngle/5;
        CGFloat middleAngel = startAngel - endAngel; //刻度的宽度
        
        UIBezierPath *tickPath = nil;
        CAShapeLayer *perLayer = [CAShapeLayer layer];
        perLayer.strokeColor = [UIColor whiteColor].CGColor;
        
        if (i % 5 == 0) {
            tickPath = [UIBezierPath bezierPathWithArcCenter:center radius:150 - 7.5
                                                  startAngle:(startAngel + middleAngel*0.5)
                                                    endAngle:(endAngel + middleAngel*0.5)
                                                   clockwise:YES];
            perLayer.lineWidth = 15.0;
            
            //为大刻度添加数字标记
            CGPoint point = [self calculateTextPositonWithArcCenter:center Angle:-(startAngel + endAngel) * 0.5];
            NSString *tickText = [NSString stringWithFormat:@"%ld",i * 2];
            
            UILabel *text = [[UILabel alloc]init];
            text.text = tickText;
            text.font = [UIFont systemFontOfSize:10];
            text.textColor = [UIColor whiteColor];
            text.textAlignment = NSTextAlignmentCenter;
            CGFloat w = [text sizeThatFits:CGSizeZero].width;
            CGFloat h = [text sizeThatFits:CGSizeZero].height;
            text.frame = CGRectMake(point.x - w/2, point.y - h/2, w, h);
            [self.view addSubview:text];
            
        }else{
            tickPath = [UIBezierPath bezierPathWithArcCenter:center radius:150 - 5
                                                  startAngle:(startAngel + middleAngel*0.5)
                                                    endAngle:(endAngel + middleAngel*0.5)
                                                   clockwise:YES];
            perLayer.lineWidth = 5.0;
        }
        perLayer.path = tickPath.CGPath;
        [self.view.layer addSublayer:perLayer];
        
    }
}

// 计算位置,默认半径125
- (CGPoint)calculateTextPositonWithArcCenter:(CGPoint)center Angle:(CGFloat)angel {
    CGFloat x = 125 * cosf(angel);
    CGFloat y = 125 * sinf(angel);
    return CGPointMake(center.x + x, center.y - y);
}

#pragma mark 渐变图层
- (void)gradientColorLayer {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.locations = @[@(0),@(1)];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.frame = CGRectMake(10, kHeight-100, 100, 100);
    [self.view.layer addSublayer:gradientLayer];
}
#pragma mark 自定义按钮
-(void)customerButton{
    LHButton *btn = [[LHButton alloc]initWithFrame:CGRectMake(120, kHeight-90, 150, 70)];
    btn.layer.cornerRadius = 35;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"gotoAnimation" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(gotoAnimaiton) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
}
-(void)gotoAnimaiton{
    DrawController3 *vc = [[DrawController3 alloc]init];
    self.navigationController.push(vc);
}


@end
