//
//  QLOc_jsDemo1.m
//  LQLDemo
//
//  Created by LQL on 2019/11/4.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLOc_jsDemo1.h"

#import "UIWebViewInterceptController.h"

#import "UIWebViewJavaScriptCoreController.h"
#import "UIWebViewJSExportController.h"

#import "WKWebViewInterceptController.h"

#import "WKWebViewWKUIDelegateController.h"
#import "WKWebViewWKScriptMessageHandlerController.h"
#import "JS_OC_JavaScriptCoreCtr.h"
@interface QLOc_jsDemo1 ()
@property(nonatomic,strong)NSArray *items;
@end

@implementation QLOc_jsDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
    switch (indexPath.row) {
        case 0:
        {
            UIWebViewInterceptController *viewController = [UIWebViewInterceptController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 1:
        {
            UIWebViewJavaScriptCoreController *viewController = [UIWebViewJavaScriptCoreController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 2:
        {
            UIWebViewJSExportController *viewController = [UIWebViewJSExportController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 3:
        {
            WKWebViewInterceptController *viewController = [WKWebViewInterceptController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 4:
        {
            WKWebViewWKScriptMessageHandlerController *viewController = [WKWebViewWKScriptMessageHandlerController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 5:
        {
            WKWebViewWKUIDelegateController *viewController = [WKWebViewWKUIDelegateController new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 6:
        {
            JS_OC_JavaScriptCoreCtr *viewController = [JS_OC_JavaScriptCoreCtr new];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        default:
            break;
    }
}
-(NSArray *)items{
    if (!_items) {
        _items = [NSArray arrayWithObjects:@"UIWebView-Intercept",@"UIWebView-JavaScriptCore",@"UIWebView-JSExport",@"WKWebView-Intercept",@"WKWebView-WKScriptMessageHandler",@"WKWebView-WKUIDelegate",@"JS_OC_JavaScriptCoreCtr", nil];
    }
    return _items;
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
