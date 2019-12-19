//
//  Demo_01_Layer.m
//  LQLDemo
//
//  Created by LQL on 2019/10/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_01_Layer.h"

@interface Demo_01_Layer ()


@end

@implementation Demo_01_Layer

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 80, 200, 200)];
    v.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v];
    
    //创建一个layer层添加到 v 视图之上
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [[UIColor blueColor] CGColor];
    [v.layer addSublayer:blueLayer];
  
    
    
    
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
