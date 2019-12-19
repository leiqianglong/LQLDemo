//
//  QLVideoListCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLVideoListCtr.h"
#import "PlayerContainerViewController.h"
@interface QLVideoListCtr ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) PlayerContainerViewController *playerContainerVC;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation QLVideoListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}


- (PlayerContainerViewController *)playerContainerVC
{
    if (!_playerContainerVC) {
        _playerContainerVC = [[PlayerContainerViewController alloc] initWithView:nil viewController:self];
        _playerContainerVC.view.backgroundColor = [UIColor blackColor];
        _playerContainerVC.displayMiniRect = CGRectMake(10, self.view.bounds.size.height - 100 - 10, 160, 90);
        [self addChildViewController:self.playerContainerVC]; //增加子容器
    }
    return _playerContainerVC;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 211;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
 
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.indexPath = indexPath;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.playerContainerVC showDisplayNormalInView:cell.contentView];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath compare:self.indexPath] == NSOrderedSame) {
        [self.playerContainerVC showMiniDisplay:YES];
    }
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
