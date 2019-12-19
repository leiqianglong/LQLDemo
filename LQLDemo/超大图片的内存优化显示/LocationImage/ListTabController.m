//
//  ListTabController.m
//  LQLDemo
//
//  Created by LQL on 2019/12/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "ListTabController.h"
#import "YPLargeImageView.h"
#import "YPTableViewCell.h"
#import "YPTableViewCell2.h"
#import "UIImageView+largeImage.h"
@interface ListTabController ()

@end

@implementation ListTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"YPTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"YPTableViewCell"];
    UINib *nib2 = [UINib nibWithNibName:@"YPTableViewCell2" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"YPTableViewCell2"];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.displayType == 21) {
        YPTableViewCell *cell =  [YPTableViewCell cellWithTableView:tableView indexPath:indexPath];
        NSString *name = [NSString stringWithFormat:@"img1.jpg"];
        [cell.largeImage yp_setImageName:name];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        YPTableViewCell2 *cell =  [YPTableViewCell2 cellWithTableView:tableView indexPath:indexPath];
        NSString *name = [NSString stringWithFormat:@"img1.jpg"];
        [cell.mImageView yp_setLargeImage:[UIImage imageNamed:name]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}


@end
