//
//  QLVideoCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLVideoCtr.h"
#import "QLVideoDetailCtr.h"
#import "QLVideoListCtr.h"
@interface QLVideoCtr ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,strong)NSMutableArray *controllers;
@end

@implementation QLVideoCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频相关";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = nil;
    vc = [[NSClassFromString(self.controllers[indexPath.row]) alloc]init];
    vc.title = self.items[indexPath.row];
    QLPUSH(vc);
}
-(NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray arrayWithObjects:@"详情",@"列表", nil];
    }
    return _items;
}
-(NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray arrayWithObjects:@"QLVideoDetailCtr",
                        @"QLVideoListCtr", nil];
    }
    return _controllers;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
