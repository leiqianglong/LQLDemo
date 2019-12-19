//
//  UIView+QLCategory.h
//  ReadReport
//
//  Created by ZhangCc on 2017/11/22.
//  Copyright © 2017年 Zomcom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QLCategory)

@property (nonatomic, assign) CGFloat QL_x;

@property (nonatomic, assign) CGFloat QL_y;

@property (nonatomic, assign) CGFloat QL_width;

@property (nonatomic, assign) CGFloat QL_height;

@property (nonatomic, assign) CGSize QL_size;

@property (nonatomic, assign) CGPoint QL_origin;

@property (nonatomic, assign) CGFloat QL_centerX;

@property (nonatomic, assign) CGFloat QL_centerY;


//链式设置属性

/**
 设置圆角
 */
-(UIView *(^)(CGFloat))QL_cornerRadius;

/**
 设置阴影颜色
 */
-(UIView *(^)(UIColor *))QL_shadowColor;

/**
 设置阴影偏移
 */
-(UIView *(^)(CGSize))QL_shadowOffset;

/**
 设置阴影透明度
 */
-(UIView *(^)(CGFloat))QL_shadowOpacity;

/**
 设置阴影半径
 */
-(UIView *(^)(CGFloat))QL_shadowRadius;

/**
 设置是否离屏渲染
 */
-(UIView *(^)(BOOL))QL_masksToBounds;

/**
 设置线宽
 */
-(UIView *(^)(CGFloat))QL_borderWidth;

/**
 设置线颜色
 */
-(UIView *(^)(UIColor *))QL_borderColor;
/**
 设置既有圆角又有阴影的空间
 */
-(UIView *(^)(CGFloat,CGSize,UIColor*,CGFloat))QL_shadowCorner;

/**
 设置空间尺寸
 */
-(void(^)(CGFloat,CGFloat,CGFloat,CGFloat))QL_frame;
@end
