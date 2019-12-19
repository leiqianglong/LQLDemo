//
//  Demo_03_ContentsRect.m
//  LQLDemo
//
//  Created by LQL on 2019/10/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_03_ContentsRect.h"

@interface Demo_03_ContentsRect ()
@property (nonatomic, weak) IBOutlet UIView *coneView;
@property (nonatomic, weak) IBOutlet UIView *shipView;
@property (nonatomic, weak) IBOutlet UIView *iglooView;
@property (nonatomic, weak) IBOutlet UIView *anchorView;
@end

@implementation Demo_03_ContentsRect

- (void)viewDidLoad {
    [super viewDidLoad];
       self.title = @"图层的contentsRect属性";
    /*
     图层的这个属性决定了显示图层的那一部分，它使用的是单位坐标，比如
     self.centerLayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5)就是显示图片的左上角这四分之一的区域。
     */
    UIImage *image = [UIImage imageNamed:@"loading_1"];
    //set igloo sprite 左上角
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.iglooView.layer];
    //set cone sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.coneView.layer];
    //set anchor sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.anchorView.layer];
    //set spaceship sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.shipView.layer];
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    layer.contentsGravity = kCAGravityCenter;
    layer.contentsRect = rect;
}

@end
