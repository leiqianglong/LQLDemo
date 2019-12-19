//
//  QLAnimationCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/4.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLAnimationCtr.h"
#import "QLAnimationListController.h"
#import "MainViewController.h"
@interface QLAnimationCtr ()
@property(nonatomic,strong)NSArray *items;
@property(nonatomic,strong)NSArray *controles;
@end

@implementation QLAnimationCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseID];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = nil;
    viewController = [[NSClassFromString(self.controles[indexPath.row]) alloc]init];
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.title = self.items[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
-(NSArray *)items{
    if (!_items) {
        _items = [NSArray arrayWithObjects:@"动画学习篇-1",@"动画学习篇-2", nil];
    }
    return _items;
}
-(NSArray *)controles{
    if (!_controles) {
        _controles = [NSArray arrayWithObjects:@"QLAnimationListController",@"MainViewController", nil];
    }
    return _controles;
}
@end
