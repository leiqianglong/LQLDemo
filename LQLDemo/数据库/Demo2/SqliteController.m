//
//  SqliteController.m
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "SqliteController.h"
#import <sqlite3.h>
#import "ShopModel.h"
#import "BViewController.h"
@interface SqliteController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextField *shopTf;
@property (weak, nonatomic) IBOutlet UITextField *pricTf;
@property(nonatomic,assign) sqlite3 *db;
@property(nonatomic,strong)NSMutableArray *shops;
@end

@implementation SqliteController
-(NSMutableArray *)shops{
    if (!_shops) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:(UIBarButtonItemStyleDone) target:self action:@selector(next)];
    
    UISearchBar *searBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    searBar.delegate = self;
    self.tableview.tableHeaderView = searBar;
    
    [self initDB];
    
    [self selectData];
}

- (IBAction)add:(UIButton *)sender {
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_shop(name,price) VALUES('%@',%f);",self.shopTf.text,self.pricTf.text.doubleValue];
    
    sqlite3_exec(self.db, sql.UTF8String, NULL, NULL, NULL);
    
    ShopModel *model = [[ShopModel alloc]init];
    model.name = self.shopTf.text;
    model.price = self.pricTf.text;
    [self.shops addObject:model];
    [self.tableview reloadData];
    
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self selectForKeyWordsData:searchText];
    
    NSLog(@"%@",searchText);
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shops.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
    }
    ShopModel *model = self.shops[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.price;
    return cell;
}

-(void)initDB{
    //链接数据库
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shops.sqlite"];
    NSLog(@"%@",filePath);
    //数据库对象实例
    
    int status = sqlite3_open(filePath.UTF8String, &_db);
    
    if (status == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        //创表
        const char *sql = "CREATE TABLE IF NOT EXISTS t_shop (id integer PRIMARY KEY,name text NOT NULL,price real);";
        char *errmsg = NULL;
        sqlite3_exec(self.db, sql, NULL, NULL, &errmsg);
        if (errmsg) {
            //创建表失败
            NSLog(@"创建表失败-- %s",errmsg);
        }else{
            NSLog(@"创建表失成功");
        }
        
    }else{
        NSLog(@"打开数据库失败");
    }
}

//c查询数据
-(void)selectForKeyWordsData:(NSString *)keyWords{
    [self.shops removeAllObjects];
    NSString *sql = [NSString stringWithFormat:@"SELECT name,price FROM t_shop WHERE name LIKE '%%%@%%' OR price LIKE '%%%@%%';",keyWords,keyWords];
    sqlite3_stmt *stm = NULL;//用来去查询结果的
    //准备
    int state = sqlite3_prepare_v2(self.db, sql.UTF8String, -1, &stm, NULL);
    if (state == SQLITE_OK) {
        while ( sqlite3_step(stm) == SQLITE_ROW) {//成功去出一条数据
            const char *name = (const char *)sqlite3_column_text(stm, 0);
            const char *price = (const char *)sqlite3_column_text(stm, 1);
            ShopModel *model = [[ShopModel alloc]init];
            model.name = [NSString stringWithUTF8String:name];
            model.price = [NSString stringWithUTF8String:price];
            [self.shops addObject:model];
        }
    }
    
    [self.tableview reloadData];
}

//c查询数据
-(void)selectData{
    const char *sql = "SELECT name,price FROM t_shop;";
    sqlite3_stmt *stm = NULL;//用来去查询结果的
    //准备
    int state = sqlite3_prepare_v2(self.db, sql, -1, &stm, NULL);
    if (state == SQLITE_OK) {
        while ( sqlite3_step(stm) == SQLITE_ROW) {//成功去出一条数据
            const char *name = (const char *)sqlite3_column_text(stm, 0);
            const char *price = (const char *)sqlite3_column_text(stm, 1);
            ShopModel *model = [[ShopModel alloc]init];
            model.name = [NSString stringWithUTF8String:name];
            model.price = [NSString stringWithUTF8String:price];
            [self.shops addObject:model];
        }
    }
}


//-(void)creatTab{
//    NSMutableString *sql = [NSMutableString string];
//    for (int i = 0; i < 1000; i++) {
//        NSString *name = [NSString stringWithFormat:@"iPhone%d",i];
//        double price = arc4random() % 1000 + 100;
//        int leftCount = arc4random() % 1000;
//        [sql appendFormat:@"insert into t_shop(name,price,left_count) values ('%@',%f,%d);\n",name,price,leftCount];
//    }
//
//    [sql writeToFile:@"/Users/hou/Desktop/shops.sql" atomically:YES encoding:NSUTF8StringEncoding error:nil];
//
//    NSLog(@"\n %@",sql);
//
//}- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {


- (void)next {
    
    [self.navigationController pushViewController:[[BViewController alloc]init] animated:true];
}


@end
