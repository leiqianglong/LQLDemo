//
//  UILabel+category.h
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (category)

/**
 链式设置label字体
 */
-(UILabel *(^)(NSString *))QL_text;
/**
 链式设置label字体大小
 */
-(UILabel *(^)(float))QL_font;
/**
 链式设置label字体对齐方式
 */
-(UILabel *(^)(NSTextAlignment))QL_textAlignment;
/**
 链式设置label字体颜色
 */
-(UILabel *(^)(UIColor *))QL_textColor;
/**
  链式设置label字体行数
  */
-(UILabel *(^)(NSInteger))QL_numberOfLines;
/**
 链式设置label背景色
 */
-(UILabel *(^)(UIColor *))QL_bgColor;
@end

NS_ASSUME_NONNULL_END
