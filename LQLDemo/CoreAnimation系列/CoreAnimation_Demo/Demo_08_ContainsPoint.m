//
//  Demo_08_ContainsPoint.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_08_ContainsPoint.h"

@interface Demo_08_ContainsPoint ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;
@end

@implementation Demo_08_ContainsPoint

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
    _layerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.layerView];
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    /*
    CALayer并不关心任何响应链事件，所以不能直接处理触摸事件或者手势。但是它有一系列的方法帮你处理事件：-containsPoint:和-hitTest:。
        containsPoint:接受一个在本图层坐标系下的CGPoint，如果这个点在图层frame范围内就返回YES。
    */
    
//    //方法一：
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//
//    if ([self.layerView.layer containsPoint:point]) {//
//        NSLog(@"Inside Blue Layer");
//    } else {
//        NSLog(@"Inside Yellow Layer");
//    }
    
    //方法二：
    /*
     -hitTest:方法同样接受一个CGPoint类型参数，而不是BOOL类型，它返回图层本身，或者包含这个坐标点的叶子节点图层。这意味着不再需要像使用-containsPoint:那样，人工地在每个子图层变换或者测试点击的坐标。如果这个点在最外面图层的范围之外，则返回nil。
     */
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Yellow Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    
}


@end
