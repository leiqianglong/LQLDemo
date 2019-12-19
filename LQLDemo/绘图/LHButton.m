//
//  LHButton.m
//  LQLDemo
//
//  Created by LQL on 2019/8/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "LHButton.h"

@implementation LHButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    UIColor *c1 = RGBCOLOR(82, 151, 246, 1);
    UIColor *c2 = RGBCOLOR(52, 92, 236, 1);
    gradientLayer.colors = @[(__bridge id)c1.CGColor,(__bridge id)c2.CGColor];
    gradientLayer.locations = @[@(0),@(1)];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.layer addSublayer:gradientLayer];
    
}
@end
