//
//  DynamicActionCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/7.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "DynamicActionCtr.h"
#import "YYView.h"
#import "GravityViewController.h"
@interface DynamicActionCtr ()

@property (strong, nonatomic) UIDynamicAnimator *animator;

@property (strong, nonatomic) NSMutableArray<CAShapeLayer *> *layers;
@end

@implementation DynamicActionCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width, 40)];
    [btn setTitle:@"Gravity" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(showGravity) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    NSInteger count = 5;
    CGFloat itemW = 30;
    CGFloat dotY = 30;
    NSMutableArray <UIView *>* dots = [NSMutableArray array];
    NSMutableArray <UIView *>* items = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        CGFloat X = self.view.center.x + (i - count / 2.0) * itemW;
        CGFloat dotX = X + itemW * 0.5;
        CGFloat Y = 200;
        
        if (i == 0) {
            if (count > 1) {
                Y = sqrt((200 - dotY) * (200 - dotY) - X * X) + dotY;
            }
            X = 0;
        }
        YYView *view = [[YYView alloc] initWithFrame:CGRectMake(X, Y, itemW, itemW)];
        view.layer.cornerRadius = itemW / 2;
        view.layer.borderWidth = 1;
        view.layer.borderColor = UIColor.lightGrayColor.CGColor;
        view.layer.masksToBounds = YES;
        [self.view addSubview:view];
        
        UIView *dot = [[UIView alloc] init];
        dot.bounds = CGRectMake(0, 0, 1, 1);
        dot.center = CGPointMake(dotX, dotY);
        dot.backgroundColor = UIColor.redColor;
        [self.view addSubview:dot];
        
        
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:view offsetFromCenter:UIOffsetMake(0, -view.bounds.size.height * 0.5) attachedToAnchor:dot.center];
        [_animator addBehavior:attachment];
        
        [items addObject:view];
        [dots addObject:dot];
    }
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:items];
    [_animator addBehavior:gravity];
    
    UICollisionBehavior *collision=[[UICollisionBehavior alloc] initWithItems:items];
    [_animator addBehavior:collision];
    
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    itemBehavior.elasticity = 1;
    itemBehavior.allowsRotation = YES;
    [_animator addBehavior:itemBehavior];
    
    
    _layers = [NSMutableArray array];
    __weak __typeof__(self)wself = self;
    gravity.action = ^{
        for (NSInteger i = 0; i < dots.count; i ++) {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:dots[i].center];
            [path addLineToPoint:CGPointMake(items[i].center.x, items[i].center.y - itemW * 0.5)];
            path.lineWidth = 1;
            
            if (wself.layers.count <= i) {
                CAShapeLayer *layer = [CAShapeLayer layer];
                layer.strokeColor = UIColor.darkGrayColor.CGColor;
                
                [wself.view.layer addSublayer:layer];
                [wself.layers addObject:layer];
            }
            
            wself.layers[i].path = path.CGPath;
            [wself.animator updateItemUsingCurrentState:items[i]];
        }
    };
    
    
}

- (void)showGravity{
    GravityViewController *gravity = [[GravityViewController alloc] init];
    [self showDetailViewController:gravity sender:nil];
}

@end
