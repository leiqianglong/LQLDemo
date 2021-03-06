//
//  Demo_09_ShadowPath.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_09_ShadowPath.h"

@interface Demo_09_ShadowPath ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView1;
@property (weak, nonatomic) IBOutlet UIImageView *layerView2;
@end

@implementation Demo_09_ShadowPath

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形。我们可以通过这个属性单独于图层形状之外指定阴影的形状。”
     */
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView2.layer.shadowOpacity = 0.5f;
    
    //    self.layerView1.layer.shadowColor = [UIColor orangeColor].CGColor;
    //    self.layerView2.layer.shadowColor = [UIColor redColor].CGColor;
    
    //create a square shadow
    CGMutablePathRef squarePath = CGPathCreateMutable();
    //添加矩形区域
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRetain(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    //圆形区域
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
