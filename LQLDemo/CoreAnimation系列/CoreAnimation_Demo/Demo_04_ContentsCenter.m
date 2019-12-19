//
//  Demo_04_ContentsCenter.m
//  LQLDemo
//
//  Created by LQL on 2019/10/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_04_ContentsCenter.h"

@interface Demo_04_ContentsCenter ()
@property (nonatomic, weak) IBOutlet UIView *button1;
@property (nonatomic, weak) IBOutlet UIView *button2;
@end

@implementation Demo_04_ContentsCenter

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"图层的contentsCenter属性";
    /*
     “contentsCenter其实是一个CGRect，它定义了一个固定的边框和一个在图层上可拉伸的区域。 改变contentsCenter的值并不会影响到寄宿图的显示”
     */
    
    UIImage *image = [UIImage imageNamed:@"loading_1"];
    
    [self addStretchableImage:image withContentCenter:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.button1.layer];
    
    [self addStretchableImage:image withContentCenter:CGRectMake(0, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //set contentsCenter
    layer.contentsCenter = rect;
}

@end
