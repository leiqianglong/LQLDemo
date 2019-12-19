//
//  Demo_16_Mutable_Rotation.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_16_Mutable_Rotation.h"

@interface Demo_16_Mutable_Rotation ()
@property (nonatomic, weak) IBOutlet UIView *outerView;
@property (nonatomic, weak) IBOutlet UIView *innerView;
@end

@implementation Demo_16_Mutable_Rotation

- (void)viewDidLoad {
    [super viewDidLoad];
    //rotate the outer layer 45 degrees
    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    self.outerView.layer.transform = outer;
    
    //rotate the inner layer -45 degrees
    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    self.innerView.layer.transform = inner;
    
    /*care:
     1、当旋转外部图层时，内部和外部一起旋转
     2、再次旋转内部时，抵消掉刚刚旋转的角度，但是不会影响外部
     */
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
