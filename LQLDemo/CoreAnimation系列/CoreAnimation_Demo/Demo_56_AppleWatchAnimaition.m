//
//  Demo_56_AppleWatchAnimaition.m
//  LQLDemo
//
//  Created by LQL on 2019/10/30.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_56_AppleWatchAnimaition.h"
#import "BreathView.h"
@interface Demo_56_AppleWatchAnimaition ()
@property(nonatomic,strong)BreathView *breatheView;
@end

@implementation Demo_56_AppleWatchAnimaition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AppleWatch的呼吸动效";
    self.breatheView = [[BreathView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.breatheView];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.breatheView animate];
    
    
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
