//
//  Student.m
//  数据库oc
//
//  Created by hou on 2018/12/22.
//  Copyright © 2018 hou. All rights reserved.
//

#import "Student.h"
#import "SQliteManger.h"
@implementation Student
-(instancetype)initWithName:(NSString *)name age:(NSInteger) age{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}
-(BOOL)insert{
    NSString *inserSql = [NSString stringWithFormat:@"INSERT INTO t_student (name,age) VALUES ('%@',%ld);",self.name,self.age];
   return [[SQliteManger shareIntance]execSQL:inserSql];
}
@end
