//
//  WelcomeViewController.m
//  LQLDemo
//
//  Created by LQL on 2019/9/3.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = self.imgView.bounds;
    [self.imgView addSubview:visualEffectView];
}

- (IBAction)oneBtn:(id)sender {
}

- (IBAction)secBtn:(id)sender {
}

@end
