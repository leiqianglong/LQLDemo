//
//  Demo_48_Draw_CoreGraphics_View.m
//  LQLDemo
//
//  Created by LQL on 2019/10/22.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_48_Draw_CoreGraphics_View.h"

@implementation Demo_48_Draw_CoreGraphics_View

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.path = [UIBezierPath bezierPath];
        self.path.lineJoinStyle = kCGLineCapRound;
        self.path.lineCapStyle = kCGLineCapRound;
        self.path.lineWidth = 3.0f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //draw path
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    [self.path stroke];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取初始位置
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [self.path moveToPoint:point];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取触点位置
    CGPoint point = [[touches anyObject] locationInView:self];
    
    [self.path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

@end
