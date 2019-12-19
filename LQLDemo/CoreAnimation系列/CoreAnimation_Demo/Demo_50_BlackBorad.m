
//
//  Demo_50_BlackBorad.m
//  LQLDemo
//
//  Created by LQL on 2019/10/22.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_50_BlackBorad.h"
#import "Demo_50_BlackBorad_View.h"
@interface Demo_50_BlackBorad ()

@end

@implementation Demo_50_BlackBorad

- (void)viewDidLoad {
    [super viewDidLoad];
    Demo_50_BlackBorad_View *view = [[Demo_50_BlackBorad_View alloc]initWithFrame:self.view.frame];
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
