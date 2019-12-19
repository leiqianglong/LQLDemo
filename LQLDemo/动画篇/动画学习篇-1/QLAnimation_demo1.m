//
//  Animation_demo1.m
//  LQLDemo
//
//  Created by LQL on 2019/11/4.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLAnimation_demo1.h"
#import "JJGiftView.h"
@interface QLAnimation_demo1 ()
@property (nonatomic, strong) JJGiftView *giftView;
@end

@implementation QLAnimation_demo1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.giftView = [[JJGiftView alloc] init];
    self.giftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.giftView];
    [self.giftView startAnimation];
}



@end
