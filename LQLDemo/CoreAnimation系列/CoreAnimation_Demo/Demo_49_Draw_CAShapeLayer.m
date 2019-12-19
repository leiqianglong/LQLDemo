//
//  Demo_49_Draw_CAShapeLayer.m
//  LQLDemo
//
//  Created by LQL on 2019/10/22.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_49_Draw_CAShapeLayer.h"
#import "Demo_49_Draw_CAShapeLayer_View.h"
@interface Demo_49_Draw_CAShapeLayer ()

@end

@implementation Demo_49_Draw_CAShapeLayer

- (void)viewDidLoad {
    [super viewDidLoad];
    Demo_49_Draw_CAShapeLayer_View *view = [[Demo_49_Draw_CAShapeLayer_View alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
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
