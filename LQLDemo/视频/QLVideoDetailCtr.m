//
//  QLVideoDetailCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLVideoDetailCtr.h"
#import "PlayerContainerViewController.h"
@interface QLVideoDetailCtr ()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIView *movieView;
@property (nonatomic, strong) PlayerContainerViewController *playerContainerVC;
@end

@implementation QLVideoDetailCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.image = [UIImage imageNamed:@"123.jpg"];
    self.backgroundImageView.clipsToBounds = YES;
//    self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.backgroundImageView];
    
//    CGRect frame = self.view.bounds;
//    frame.size.height = self.backgroundImageView.image.size.height*self.backgroundImageView.bounds.size.width/self.backgroundImageView.image.size.width;
//    self.backgroundImageView.frame = frame;
    
    self.movieView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 211)];
    [self.view addSubview:self.movieView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn setFrame:CGRectMake(10, 30, 35, 35)];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    //
    self.playerContainerVC = [[PlayerContainerViewController alloc] initWithView:self.movieView viewController:self];
    self.playerContainerVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:self.playerContainerVC]; //增加子容器
    [self.movieView addSubview:self.playerContainerVC.view];
}

- (void)backBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
