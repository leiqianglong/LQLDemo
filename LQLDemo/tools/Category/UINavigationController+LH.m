//
//  UINavigationController+LH.m
//  LQLDemo
//
//  Created by LQL on 2019/8/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "UINavigationController+LH.h"

@implementation UINavigationController (LH)


-(UINavigationController *(^)(UIViewController *))push
{
    return ^(UIViewController *vc){
        [self pushViewController:vc animated:YES];
        return self;
    };
    
}
@end
