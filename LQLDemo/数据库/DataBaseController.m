//
//  DataBaseController.m
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "DataBaseController.h"
#import "QLDataController.h"
#import "SqliteController.h"
@interface DataBaseController ()

@end

@implementation DataBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)fmdademo1:(id)sender {
    QLDataController *vc = [[QLDataController alloc]init];
    QLPUSH(vc);
}
- (IBAction)sqliteClick:(id)sender {
    SqliteController *vc = [[SqliteController alloc]init];
    QLPUSH(vc);
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
