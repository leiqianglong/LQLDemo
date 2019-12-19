//
//  WeiBoPersonalCenterCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "WeiBoPersonalCenterCtr.h"
#import "QQPersonalCenterCtr.h"
@interface WeiBoPersonalCenterCtr ()

@end

@implementation WeiBoPersonalCenterCtr
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 微博个人中心  只需要继承RootViewController 控制器即可实现功能
    
}
//重写父类方法
-(void)NavHeadback{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)NavHeadToRight{
    QLPUSH([[QQPersonalCenterCtr alloc]init]);
}
@end
