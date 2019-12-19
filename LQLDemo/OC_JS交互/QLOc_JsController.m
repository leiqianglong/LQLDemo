//
//  QLOc_JsController.m
//  LQLDemo
//
//  Created by LQL on 2019/11/4.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLOc_JsController.h"
#import "QLOc_jsDemo1.h"
#import "QLVideoCtr.h"
@interface QLOc_JsController ()
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,strong)NSMutableArray *controllers;
@end

@implementation QLOc_JsController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"其他";
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
    UIViewController *viewController = nil;
    viewController = [[NSClassFromString(self.controllers[indexPath.row]) alloc]init];
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.title = self.items[indexPath.row];
    QLPUSH(viewController);
}
-(NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray arrayWithObjects:@"oc_js交互",@"视频", nil];
    }
  return _items;
}
-(NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray arrayWithObjects:@"QLOc_jsDemo1",
                        @"QLVideoCtr", nil];
    }
    return _controllers;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
