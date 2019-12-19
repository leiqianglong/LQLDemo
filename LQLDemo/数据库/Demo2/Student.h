//
//  Student.h
//  数据库oc
//
//  Created by hou on 2018/12/22.
//  Copyright © 2018 hou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger age;

-(instancetype)initWithName:(NSString *)name age:(NSInteger) age;
-(BOOL)insert;
@end

