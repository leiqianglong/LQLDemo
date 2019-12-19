//
//  SQliteManger.h
//  数据库oc
//
//  Created by hou on 2018/12/22.
//  Copyright © 2018 hou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQliteManger : NSObject

+(instancetype)shareIntance;
-(BOOL)openDB;
-(BOOL)execSQL:(NSString *)sql;
@end

NS_ASSUME_NONNULL_END
