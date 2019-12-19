//
//  ViewController.m
//  LQLDemo
//
//  Created by LQL on 2019/7/31.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "ViewController.h"
#import "DrawController.h"

#import "DataBaseController.h"
#import "CController.h"
#import "WelcomeViewController.h"
#import "CoreAnimationCtr.h"
#import "WeiBoPersonalCenterCtr.h"
#import "GCDBaseViewController.h"
#import "NSThreadViewController.h"
#import "DynamicActionCtr.h"
#import "BIgImgTableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSMutableArray *controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DEMO";

    QLAfter(5, ^{
        NSLog(@"延迟了5s了啊.....");
    });
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseID];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(self.controllers[indexPath.row]) alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = self.arr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSArray *)arr{
    if (!_arr) {
        _arr = [NSArray arrayWithObjects:@"绘图",@"数据库",@"C_C++学习",@"UICollectionView功能",@"CoreAnimation系列",@"微博个人中心",@"GCD基础篇",@"NSThread基础",@"重力感应",@"超大图片优化内存显示",nil];
    }
    return _arr;
}
-(NSMutableArray *)controllers{
    if (!_controllers) {
        _controllers = [NSMutableArray arrayWithObjects:@"DrawController",@"DataBaseController", @"CController",@"WelcomeViewController",@"CoreAnimationCtr",@"WeiBoPersonalCenterCtr",@"GCDBaseViewController",@"NSThreadViewController",@"DynamicActionCtr",@"BIgImgTableViewController",nil];
    }
    return _controllers;
}

@end
