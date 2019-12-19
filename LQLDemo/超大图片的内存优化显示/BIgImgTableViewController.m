//
//  BIgImgTableViewController.m
//  LQLDemo
//
//  Created by LQL on 2019/12/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "BIgImgTableViewController.h"
#import "LoadLocationImgController.h"
#import "ListTabController.h"
@interface BIgImgTableViewController ()
@property (nonatomic, copy)NSArray <NSArray *>*dataList;

@end

@implementation BIgImgTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MainViewControllerCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray <NSString *>*titles = @[@"本地加载图片",@"下载加载图片",@"下载加载图片(表格内使用)"];
    return titles[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainViewControllerCell" forIndexPath:indexPath];
    cell.textLabel.text  = self.dataList[indexPath.section][indexPath.row];
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 18.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section < 2) {
        LoadLocationImgController *imageVC = [LoadLocationImgController new];
        imageVC.displayType = indexPath.section * 10 + indexPath.row;
        [self.navigationController pushViewController:imageVC animated:YES];
    }
    else {
        ListTabController *tableVC = [[ListTabController alloc]init];
        tableVC.displayType = indexPath.section * 10 + indexPath.row;
        [self.navigationController pushViewController:tableVC animated:YES];
    }
}
#pragma mark - set get

- (NSArray <NSArray *>*)dataList {
    if (!_dataList) {
        _dataList = @[@[@"UIKit-setImage",@"苹果推荐的分片比例裁剪方式",@"CATiledLayer方式"],@[@"SDImage",@"苹果推荐的分片比例裁剪方式",@"CATiledLayer"],@[@"苹果推荐的分片比例裁剪方式",@"CATiledLayer方式"]];
    }
    return _dataList;
}

@end
