//
//  UILabel+category.m
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "UILabel+category.h"

@implementation UILabel (category)

-(UILabel *(^)(NSString *))QL_text{
    return ^(NSString *str){
        self.text = str;
        return self;
    };
}
-(UILabel *(^)(float))QL_font{
    
    return ^(float font){
        self.font = [UIFont systemFontOfSize:font];
        return self;
    };
}
-(UILabel *(^)(NSTextAlignment))QL_textAlignment{
    return ^(NSTextAlignment aligment){
        self.textAlignment = aligment;
        return self;
    };
}
-(UILabel *(^)(UIColor *))QL_textColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
-(UILabel *(^)(NSInteger))QL_numberOfLines{
    return ^(NSInteger number){
        self.numberOfLines = number;
        return self;
    };
}
-(UILabel *(^)(UIColor *))QL_bgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
@end
