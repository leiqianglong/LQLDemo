//
//  QLUIButton.m
//  LQLDemo
//
//  Created by LQL on 2019/9/3.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QLUIButton.h"

@interface  QLUIButton()
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat horizontalPadding;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@end
@implementation QLUIButton


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.borderWidth) {
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = self.borderWidth;
    }
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderColor = self.borderColor.CGColor;
}
- (CGSize) intrinsicContentSize {
    CGSize contentSize = [super intrinsicContentSize] ;
    contentSize.width += self.horizontalPadding * 2 ;
    return contentSize ;
}
@end
