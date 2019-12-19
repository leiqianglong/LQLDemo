//
//  SQliteManger.m
//  数据库oc
//
//  Created by hou on 2018/12/22.
//  Copyright © 2018 hou. All rights reserved.
//

#import "SQliteManger.h"
#import <sqlite3.h>

@interface SQliteManger()
@property(nonatomic,assign) sqlite3 *db;

@end

@implementation SQliteManger
static id _instance;
+(instancetype)shareIntance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}
-(BOOL)openDB{
    NSString *filePaht = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"mysql.sqlite"];

    NSLog(@"sql路径%@",filePaht);
    //打开一个数据库，t如果存在直接打开，不存在先创建后打开
    int state = sqlite3_open(filePaht.UTF8String, &_db);
    if (state != SQLITE_OK) {
        NSLog(@"数据库打开失败");
        return NO;
    }
    //打开数据库成功创建表
   return [self creatTable];
}

-(BOOL)creatTable{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS 't_student' ('id' integer NOT NULL PRIMARY KEY AUTOINCREMENT,'name' text,'age' integer );";
   return [self execSQL:sql];
}
-(BOOL)execSQL:(NSString *)sql{
    int state = sqlite3_exec(self.db, sql.UTF8String, NULL, NULL, NULL);
    if (state == SQLITE_OK) {
        return YES;
    }
    return NO;
}
@end
