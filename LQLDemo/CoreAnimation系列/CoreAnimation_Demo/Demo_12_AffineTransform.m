//
//  Demo_12_AffineTransform.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_12_AffineTransform.h"

@interface Demo_12_AffineTransform ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)
@implementation Demo_12_AffineTransform

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     当对图层应用变换矩阵，图层矩形内的每一个点都被相应地做变换，从而形成一个新的四边形的形状。CGAffineTransform中的“仿射”的意思是无论变换矩阵用什么值，图层中平行的两条线在变换之后任然保持平行
     */
    [UIView animateWithDuration:2 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeRotation(RADIANS_TO_DEGREES(45));
        self.imageView.layer.affineTransform = transform;
    }];
 
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
