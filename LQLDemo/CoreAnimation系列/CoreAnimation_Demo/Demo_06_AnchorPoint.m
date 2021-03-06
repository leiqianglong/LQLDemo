//
//  Demo_06_AnchorPoint.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_06_AnchorPoint.h"

@interface Demo_06_AnchorPoint ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property (nonatomic,weak) CALayer *secondLayer;
@property (nonatomic,weak) CALayer *mintueLayer;
@property (nonatomic,weak) CALayer *hourLayer;

@property (nonatomic,strong) NSTimer *timer;
@end

#define kClockW _clockView.bounds.size.width //时钟背景图的的宽度
#define angle2radion(angle) ((angle) / 180.0 * M_PI)
// 1秒6度(秒针)
#define perSecondA 6

// 1分钟6度(分针)
#define perMintueA 6

// 1小时30度（时针）
#define perHourA 30

// 每分钟时针转(30 / 60 °)
#define perMinHourA 0.5
@implementation Demo_06_AnchorPoint
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
      self.title = @"AnchorPoint";
    
    [self configHourLayer];
    [self configMinLayer];
    [self configSecondLayer];

    //添加定时器
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [self timeChange];
}

- (void)timeChange {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    
    NSLog(@"%.0ld时--%.0ld份--%.0ld秒",(long)components.hour,(long)components.minute,(long)components.second);
    //calculate hour hand angle
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    
    //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    _secondLayer.transform = CATransform3DMakeRotation(secsAngle, 0, 0, 1);
    _mintueLayer.transform = CATransform3DMakeRotation(minsAngle, 0, 0, 1);
    _hourLayer.transform = CATransform3DMakeRotation(hoursAngle, 0, 0, 1);
    
}
//设置秒针
- (void)configSecondLayer {
    CALayer *secLayer = [CALayer layer];
    secLayer.backgroundColor = [UIColor redColor].CGColor;
    
    //设置锚点
    secLayer.anchorPoint = CGPointMake(0.5, 0.9); //layer的锚点  默认值都是 （0.5，0.5）
    secLayer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);//position都代表了相对于父图层anchorPoint(图层的中心点)所在的位置
    secLayer.bounds = CGRectMake(0, 0, 2, kClockW * 0.5 - 30);
    
    _secondLayer = secLayer;
    [self.clockView.layer addSublayer:_secondLayer];
    
}
//设置分针
- (void)configMinLayer {
    CALayer *minLayer = [CALayer layer];
    minLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    //设置锚点
    minLayer.anchorPoint = CGPointMake(0.5, 0.9);
    minLayer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    minLayer.bounds = CGRectMake(0, 0, 4, kClockW * 0.5 - 40);
    minLayer.cornerRadius = 2;
    _mintueLayer = minLayer;
    [self.clockView.layer addSublayer:_mintueLayer];
    
}
//设置时针
- (void)configHourLayer {
    
    CALayer * layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor blackColor].CGColor ;
    
    // 设置锚点
    layer.anchorPoint = CGPointMake(0.5, 0.9);
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    layer.bounds = CGRectMake(0, 0, 6, kClockW * 0.5 - 50);
    layer.cornerRadius = 6;
    
    [_clockView.layer addSublayer:layer];
    
    _hourLayer = layer;
}
@end
