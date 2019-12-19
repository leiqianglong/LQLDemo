//
//  BaseViewController.m
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake((kWidth - 100)/2, kHeight/2 - 100, 100, 100)];
    _bgView.backgroundColor = [UIColor colorWithHexString:@"FF6BA0"];
    //    _bgView.layer.cornerRadius = 1.0f;
    //    _bgView.layer.masksToBounds = YES;
    [self.view addSubview:_bgView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((kWidth - 80)/2, kHeight - 150, 80, 40);
    btn.backgroundColor = [UIColor colorWithHexString:@"30acff"];
    btn.layer.cornerRadius = 8.0;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[self imageWithColor:[UIColor colorWithHexString:@"128ee1"]] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (UIImage *)imageWithColor:(UIColor *)color {
    NSParameterAssert(color != nil);
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
