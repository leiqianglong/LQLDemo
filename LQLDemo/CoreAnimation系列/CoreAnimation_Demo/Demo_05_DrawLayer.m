//
//  Demo_05_DrawLayer.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_05_DrawLayer.h"

@interface Demo_05_DrawLayer ()<CALayerDelegate>
@property(nonatomic,strong)CALayer *blueLayer;
@end

@implementation Demo_05_DrawLayer

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"Custom Drawing";
    
   self.blueLayer = [CALayer layer];
   self.blueLayer.frame = CGRectMake(50, 100, 100, 100);
   self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
   self.blueLayer.delegate = self;
    
    self.blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:self.blueLayer];
    
    [self.blueLayer display];
}

- (void)dealloc {
    NSLog(@"%@ dealloc resumed", NSStringFromClass([self class]));
    self.blueLayer.delegate = nil;//这里代理需要手动释放
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
/*
 “注意一下一些有趣的事情：
 
 我们在blueLayer上显式地调用了-display。不同于UIView，当图层显示在屏幕上时，CALayer不会自动重绘它的内容。它把重绘的决定权交给了开发者。
 尽管我们没有用masksToBounds属性，绘制的那个圆仍然沿边界被裁剪了。这是因为当你使用CALayerDelegate绘制寄宿图的时候，并没有对超出边界外的内容提供绘制支持。
     现在你理解了CALayerDelegate，并知道怎么使用它。但是除非你创建了一个单独的图层，你几乎没有机会用到CALayerDelegate协议。因为当UIView创建了它的宿主图层时，它就会自动地把图层的delegate设置为它自己，并提供了一个-displayLayer:的实现，那所有的问题就都没了。”
 
 */
@end
