//
//  UIView+QLCategory.m
//  ReadReport
//
//  Created by ZhangCc on 2017/11/22.
//  Copyright © 2017年 Zomcom. All rights reserved.
//

#import "UIView+QLCategory.h"

@implementation UIView (QLCategory)

- (void)setQL_x:(CGFloat)QL_x {
    CGRect frame = self.frame;
    frame.origin.x = QL_x;
    self.frame = frame;
}

- (CGFloat)QL_x {
    return self.frame.origin.x;;
}

- (void)setQL_y:(CGFloat)QL_y {
    CGRect frame = self.frame;
    frame.origin.x = QL_y;
    self.frame = frame;
}

- (CGFloat)QL_y {
     return self.frame.origin.y;
}

- (void)setQL_width:(CGFloat)QL_width {
    CGRect frame = self.frame;
    frame.size.width = QL_width;
    self.frame = frame;
}

- (CGFloat)QL_width {
    return self.frame.size.width;
}

- (void)setQL_height:(CGFloat)QL_height {
    CGRect frame = self.frame;
    frame.size.height = QL_height;
    self.frame = frame;
}

- (CGFloat)QL_height {
    return self.frame.size.height;
}

- (void)setQL_size:(CGSize)QL_size {
    CGRect frame = self.frame;
    frame.size = QL_size;
    self.frame = frame;
}

- (CGSize)QL_size {
    return self.frame.size;
}

- (void)setQL_origin:(CGPoint)QL_origin {
    CGRect frame = self.frame;
    frame.origin = QL_origin;
    self.frame = frame;
}

- (CGPoint)QL_origin {
    return self.frame.origin;
}

- (void)setQL_centerX:(CGFloat)QL_centerX {
    CGPoint center = self.center;
    center.x = QL_centerX;
    self.center = center;
}

- (CGFloat)QL_centerX {
    return self.center.x;
}

-(void)setQL_centerY:(CGFloat)QL_centerY {
    CGPoint center = self.center;
    center.x = QL_centerY;
    self.center = center;
}

- (CGFloat)QL_centerY {
    return self.center.y;
}


//链式设置view的 圆角
-(UIView *(^)(CGFloat))QL_cornerRadius{
    return ^(CGFloat r){
        self.layer.cornerRadius = r;
        return self;
    };
}
-(UIView *(^)(UIColor *))QL_shadowColor{
    return ^(UIColor *color){
        self.layer.shadowColor = color.CGColor;
        return self;
    };
}
-(UIView *(^)(CGSize))QL_shadowOffset{
    return ^(CGSize size){
        self.layer.shadowOffset = size;
        return self;
    };
}
-(UIView *(^)(CGFloat))QL_shadowOpacity{
    return ^(CGFloat opacity){
        self.layer.shadowOpacity = opacity;
        return self;
    };
}
-(UIView *(^)(CGFloat))QL_shadowRadius{
    return ^(CGFloat r){
        self.layer.shadowRadius = r;
        return self;
    };
}

-(UIView *(^)(BOOL))QL_masksToBounds{
    return ^(BOOL bounds){
        self.layer.masksToBounds = bounds;
        return self;
    };
}
-(UIView *(^)(CGFloat))QL_borderWidth{
    return ^(CGFloat w){
        self.layer.borderWidth = w;
        return self;
    };
}
-(UIView *(^)(UIColor *))QL_borderColor{
    return ^(UIColor *color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}
-(UIView *(^)(CGFloat,CGSize,UIColor*,CGFloat))QL_shadowCorner{
    return ^(CGFloat r,CGSize size,UIColor *color,CGFloat op){
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowOffset = size;
        self.layer.shadowColor  =  color.CGColor;
        self.layer.shadowOpacity = op;
        CALayer *sublayer =[CALayer layer];
        sublayer.frame = self.bounds;
        sublayer.backgroundColor = [UIColor purpleColor].CGColor;
        sublayer.cornerRadius = r;
        sublayer.masksToBounds = YES;
        [self.layer addSublayer:sublayer];
        return self;
    };
}


-(void(^)(CGFloat,CGFloat,CGFloat,CGFloat))QL_frame{
    return ^(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        self.frame = CGRectMake(x, y, w, h);
    };
}

@end
