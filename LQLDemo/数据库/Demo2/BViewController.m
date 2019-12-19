//
//  BViewController.m
//  数据库oc
//
//  Created by hou on 2018/12/22.
//  Copyright © 2018 hou. All rights reserved.
//

#import "BViewController.h"
#import "SQliteManger.h"
#import "Student.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *ageTf;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //启动程序 打开数据库
    BOOL flag = [[SQliteManger shareIntance]openDB];
    if (flag) {
        NSLog(@"打开数据库成功");
    }else{
         NSLog(@"打开数据库失败！！");
    }
    
    
}

- (IBAction)addPerson:(UIButton *)sender {
    
//    [self updataData];

    
    Student *s = [[Student alloc]initWithName:self.nameTf.text age:self.ageTf.text.integerValue];

    if ([s insert]) {
        NSLog(@"数据插入成功");
    }else{
         NSLog(@"数据添加失败");
    }
}

-(void)updataData{
    NSString *updataSql = @"UPDATE t_student SET name = '西门庆' WHERE age > 80";
    bool falg = [[SQliteManger shareIntance]execSQL:updataSql];
    if (falg) {
        NSLog(@"数据更新成功");
    }else{
        NSLog(@"数据更新失败");
    }
}
@end
