//
//  CoreAnimationCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/10/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "CoreAnimationCtr.h"

@interface CoreAnimationCtr ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation CoreAnimationCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreAnimation系列学习";
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
     }
     cell.textLabel.text = self.dataArray[indexPath.row];
     return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id viewController = nil;
//    if (indexPath.row == 51) {
   
//    } else {
        viewController = [[NSClassFromString(self.dataArray[indexPath.row]) alloc]init];
//    }
    [self.navigationController pushViewController:viewController animated:YES];
}


- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @"Demo_01_Layer",
                      @"Demo_02_Contents",
                      @"Demo_03_ContentsRect",
                      @"Demo_04_ContentsCenter",
                      @"Demo_05_DrawLayer",
                      @"Demo_06_AnchorPoint",
                      @"Demo_07_ZPosition",
                      @"Demo_08_ContainsPoint",
                      @"Demo_09_ShadowPath",
                      @"Demo_10_Mask",
                      @"Demo_11_ShouldRasterize",
                      @"Demo_12_AffineTransform",
                      @"Demo_13_Mix_AffineTransform",
                      @"Demo_14_CATransform3D",
                      @"Demo_15_SublayerTransform",
                      @"Demo_16_Mutable_Rotation",
                      @"Demo_17_Mutable_Rotation_3D",
                      @"Demo_18_Cube",
                      @"Demo_19_CAShapeLayer",
                      @"Demo_20_CATextLayer",
                      @"Demo_21_CATransformLayer",
                      @"Demo_22_CAGradientLayer",
                      @"Demo_23_CAReplicatorLayer",
                      @"Demo_24_CAEmitterLayer",
                      @"Demo_25_CAEAGLLayer",
                      @"Demo_26_IntentAnimation",
                      @"Demo_27_IntentAnimation_Principle",
                      @"Demo_28_PresentationLayer",
                      @"Demo_29_CAKeyframeAnimation",
                      @"Demo_30_CAKeyfraneAnimationWithUIBezierPath",
                      @"Demo_31_VirtualProperty",
                      @"Demo_32_CAAnimationGroup",
                      @"Demo_33_Transition",
                      @"Demo_34_RenderInContext",
                      @"Demo_35_CancleAnimation",
                      @"Demo_36_DurationAndRepeatCount",
                      @"Demo_37_Autoreverses",
                      @"Demo_38_TimeOffsetAndSpeed",
                      @"Demo_39_TimeOff",
                      @"Demo_40_TimingFunction",
                      @"Demo_41_TimingFunctions",
                      @"Demo_42_CAMediaTimingFunction",
                      @"Demo_43_ComplexAnimationLine",
                      @"Demo_44_LineBuffer",
                      @"Demo_45_NSTimerEaseOutBall",
                      @"Demo_46_CADisplayLink",
                      @"Demo_47_ViewController",
                      @"Demo_48_Draw_CoreGraphics",
                      @"Demo_49_Draw_CAShapeLayer",
                      @"Demo_50_BlackBorad",
                      @"Demo_51_imageIO",
                      @"Demo_52_CATiledLayer",
                      @"Demo_53_NSCache",
                      @"Demo_54_DrawRectByCAShapeLayer",
                      @"Demo_55_ReduceLayer",
                      @"Demo_56_AppleWatchAnimaition",
                      nil];
    }
    return _dataArray;
}

@end

