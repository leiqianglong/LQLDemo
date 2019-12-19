//
//  DrawController.m
//  LQLDemo
//
//  Created by LQL on 2019/7/31.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "DrawController.h"
#import "UIView+JHDrawCategory.h"
#import "DrawController2.h"
#import "RunCircleController.h"
@interface DrawController ()

@end

@implementation DrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, NavigationBarHeight, self.view.frame.size.width, self.view.frame.size.height-NavigationBarHeight)];
    bgView.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:bgView];
    
    //1.0画线
    [bgView jh_drawLineFromPoint:CGPointMake(10, 10)
                         toPoint:CGPointMake(200, 10)
                       lineColor:[UIColor redColor]
                      lineHeight:3];
    
    [bgView jh_drawLineFromPoint:CGPointMake(10, 30)
                         toPoint:CGPointMake(200, 30)
                       lineColor:[UIColor greenColor]
                      lineHeight:6];
    
    //2.画虚线
    [bgView jh_drawDashLineFromPoint:CGPointMake(10, 50)
                             toPoint:CGPointMake(240, 50)
                           lineColor:[UIColor orangeColor]
                           lineWidth:3
                          lineHeight:3
                           lineSpace:3
                            lineType:0];//type: 0 - cube, 1 - round
    
    [bgView jh_drawDashLineFromPoint:CGPointMake(10, 60)
                             toPoint:CGPointMake(240, 60)
                           lineColor:[UIColor purpleColor]
                           lineWidth:10
                          lineHeight:6
                           lineSpace:3
                            lineType:1];//type: 0 - cube, 1 - round
    
    [bgView jh_drawDashLineFromPoint:CGPointMake(10, 80)
                             toPoint:CGPointMake(240, 80)
                           lineColor:[UIColor redColor]
                           lineWidth:5
                          lineHeight:5
                           lineSpace:5
                            lineType:0];//type: 0 - cube, 1 - round
    
    
    //3.画五角星
    for (int i = 0; i < 5; i++) {
        [bgView jh_drawPentagram:CGPointMake(20*(i+1), 100)
                          radius:10
                           color:randomColor
                            rate:0.9];//rate: 0.3 ~ 1.1
    }
    
    //4.画矩形
    [bgView jh_drawRect:CGRectMake(10, 140, 350, 40)
              lineColor:[UIColor orangeColor]
              lineWidth:2
             lineHeight:3
               lineType:1//type: 0 - cube, 1 - round
                 isDash:NO
              lineSpace:0];
    [bgView jh_drawRect:CGRectMake(10, 190, 350, 40)
              lineColor:[UIColor greenColor]
              lineWidth:6
             lineHeight:3
               lineType:1//type: 0 - cube, 1 - round
                 isDash:YES
              lineSpace:4];
    
    //5.矩形渐变
    [bgView jh_gradientLayer:CGRectMake(10, 240, 100, 100)
                       color:@[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]]
                    location:@[@0.2,@0.5,@1.0]
                   direction:CAGradientLayerDirection_FromLeftToRight];
    [bgView jh_gradientLayer:CGRectMake(120, 240, 100, 100)
                       color:@[[UIColor blueColor],[UIColor redColor],[UIColor yellowColor]]
                    location:@[@0.1,@0.5,@1.0]
                   direction:CAGradientLayerDirection_FromTopToBottom];
    [bgView jh_gradientLayer:CGRectMake(220, 240, 100, 100)
                       color:@[[UIColor blueColor],[UIColor yellowColor],[UIColor redColor]]
                    location:@[@0.2,@0.7,@1.0]
                   direction:CAGradientLayerDirection_FromCenterToEdge];
    [bgView jh_gradientLayer:CGRectMake(10, 340, 100, 100)
                       color:@[[UIColor blueColor],[UIColor yellowColor],[UIColor redColor]]
                    location:@[@0.2,@0.7,@1.0]
                   direction:CAGradientLayerDirection_FromTopLeftToBottomRight];
    [bgView jh_gradientLayer:CGRectMake(120, 340, 100, 100)
                       color:@[[UIColor blueColor],[UIColor yellowColor],[UIColor redColor]]
                    location:@[@0.2,@0.7,@1.0]
                   direction:CAGradientLayerDirection_FromTopRightToBottomLeft];
    
    [bgView jh_gradientLayer:CGRectMake(240, 340, 100, 100)
                       color:@[[UIColor blueColor],[UIColor redColor]]
                  startPoint:CGPointMake(0, 0)
                    endPoint:CGPointMake(1, 1)
                    location:@[@0.2,@0.7]
                        type:0];
    
    //6.
    [bgView jh_drawOval:CGRectMake(10, 450, 50, 50) lineColor:[UIColor magentaColor] lineWidth:2 lineHeight:2 lineType:1 isDash:NO lineSpace:3];
    [bgView jh_drawOval:CGRectMake(70, 450, 50, 50) lineColor:[UIColor cyanColor] lineWidth:2 lineHeight:2 lineType:1 isDash:YES lineSpace:3];
     [bgView jh_drawOval:CGRectMake(140, 450, 70, 50) lineColor:[UIColor brownColor] lineWidth:2 lineHeight:2 lineType:1 isDash:YES lineSpace:3];
    
    [bgView jh_drawRoundRect:CGRectMake(10, 520, 50, 50) lineColor:randomColor lineWidth:10 lineHeight:20 lineType:0 isDash:NO lineSpace:4 radius:8];
    
    [bgView jh_drawRoundRect:CGRectMake(200, 520, 50, 50) roundingCorners:UIRectCornerTopLeft lineColor:[UIColor orangeColor] lineWidth:3 lineHeight:5 lineType:1 isDash:NO lineSpace:1 radius:6];

    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth-80, NavigationBarHeight+10, 80, 30)];
    btn.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    [btn setTitle:@"运动圈" forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(gotoRunCirle) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:(UIBarButtonItemStyleDone) target:self action:@selector(next)];
    
}

-(void)next{
    DrawController2 *vc = [[DrawController2 alloc]init];
    self.navigationController.push(vc);
}
-(void)gotoRunCirle{
    RunCircleController *vc = [[RunCircleController alloc]init];
    self.navigationController.push(vc);
}
@end
