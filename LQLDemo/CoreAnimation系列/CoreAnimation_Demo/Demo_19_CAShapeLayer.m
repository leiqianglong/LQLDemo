//
//  Demo_19_CAShapeLayer.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_19_CAShapeLayer.h"
#import <AVFoundation/AVFoundation.h>

@interface Demo_19_CAShapeLayer ()
@property (nonatomic, strong) UIView *containerView;//视频播放t容器
@end

@implementation Demo_19_CAShapeLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(175, 100)];
    //添加一个圆
    [path addArcWithCenter:CGPointMake(150, 100)
                    radius:25
                startAngle:0
                  endAngle:2*M_PI
                 clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor greenColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    
    
    //一下代码顺带讲下 AVPlayerLayer
    /*
     尽管它不是Core Animation框架的一部分（AV前缀看上去像），AVPlayerLayer是有别的框架（AVFoundation）提供的，它和Core Animation紧密地结合在一起，提供了一个CALayer子类来显示自定义的内容类型。
     AVPlayerLayer是用来在iOS上播放视频的。他是高级接口例如MPMoivePlayer的底层实现，提供了显示视频的底层控制。AVPlayerLayer的使用相当简单：你可以用+playerLayerWithPlayer:方法创建一个已经绑定了视频播放器的图层，或者你可以先创建一个图层，然后用player属性绑定一个AVPlayer实例。
     */
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(30, 300, 300, 200)];
    [self.view addSubview:self.containerView];
    NSString *url = @"https://nie.v.netease.com/r/video/20190810/39d108cb-3a65-4036-a574-48dff2a8764e.mp4";
    NSURL *URL = [NSURL URLWithString:url];
    
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    //正常模式
//    //set player layer frame and attach it to our view
//    playerLayer.frame = self.containerView.bounds;
//    [self.containerView.layer addSublayer:playerLayer];
//
//    //play the video
//    [player play];
    
    
    //旋转模式
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
    
    //transform layer
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, -M_PI_4, 1, 1, 0);
    playerLayer.transform = transform;
    
    //add rounded corners and border
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    playerLayer.borderColor = [UIColor redColor].CGColor;
    playerLayer.borderWidth = 5.0;
    
    //play the video
    [player play];
    
    
    
}


@end
