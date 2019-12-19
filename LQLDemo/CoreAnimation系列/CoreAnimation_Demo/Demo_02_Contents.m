//
//  Demo_02_Contents.m
//  LQLDemo
//
//  Created by LQL on 2019/10/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_02_Contents.h"

@interface Demo_02_Contents ()
@property(nonatomic,strong)NSArray<NSString *> *arrs;
@end

@implementation Demo_02_Contents

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图层的contentsGravity属性";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat itemW = kWidth / 3.0;
 
    for (int i = 0; i < self.arrs.count; i++) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake((i%3) * itemW, (i / 3) * itemW + 100, itemW, itemW)];
        v.backgroundColor = randomColor;
        [self.view addSubview:v];
        [self addContentsGravity:self.arrs[i] andViewLayer:v.layer];
        [self addTitleLable:self.arrs[i] andView:v];
    }
    

}
-(void)addContentsGravity:(NSString *)key andViewLayer:(CALayer *)layer{
    
    
    UIImage *image = [UIImage imageNamed:@"bg"];
         layer.contents = (__bridge id _Nullable)(image.CGImage);
    /*
     “UIView大多数视觉相关的属性比如contentMode，对这些属性的操作其实是对对应图层的操作。”
     
     view.contentMode = UIViewContentModeScaleAspectFit;
     “和cotentMode一样，contentsGravity的目的是为了决定内容在图层的边界中怎么对齐，我们将使用kCAGravityResizeAspect，它的效果等同于UIViewContentModeScaleAspectFit， 同时它还能在图层中等比例拉伸以适应图层的边界。”
     */
    
    /*
     kCAGravityCenter  图片和图层中心对齐
     kCAGravityTop     图片和图层底部对齐
     kCAGravityBottom  图片和图层顶部对齐
     kCAGravityLeft    图片左边和图层左边对齐
     kCAGravityRight   图片右边和图层右边对齐
     kCAGravityTopLeft  图片和图层对齐左下角
     kCAGravityTopRight  图片和图层对齐右下角
     kCAGravityBottomLeft  图片和图层对齐左上角
     kCAGravityBottomRight  图片和图层对齐左下角
     kCAGravityResize    不设置contentsGravity属性时，其默认的枚举类型即为 kCAGravityResize。
     kCAGravityResizeAspect 图片会依据图层大小等比例缩放，适应图层大小，不会超出图层显示
     kCAGravityResizeAspectFill 等比例的缩放，在缩小时，缩小到长和宽有一个和图层一致就停止缩小。放大时。等到长和宽都达到图层的边界就停止放大，不使用图层大小，会超出图层显示。
     */
        layer.contentsGravity = key;
        /*
         “如果contentsScale设置为1.0，将会以每个点1个像素绘制图片，如果设置为2.0，则会以每个点2个像素绘制图片，这就是我们熟知的Retina屏幕。”
         */
    //    v.layer.contentsGravity = kCAGravityCenter;
        layer.contentsScale = [UIScreen mainScreen].scale;
        /*
         “默认情况下，UIView仍然会绘制超过边界的内容或是子视图，在CALayer下也是这样的。
        UIView有一个叫做clipsToBounds的属性可以用来决定是否显示超出边界的内容，
         CALayer对应的属性叫做masksToBounds，把它设置为YES，就不会显示超出边界的部分”
         */
        layer.masksToBounds = YES;
}
-(void)addTitleLable:(NSString *)title andView:(UIView *)layerView{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,layerView.frame.size.width,20)];
    [layerView addSubview:lab];
    lab.text = title;
    lab.textColor = [UIColor redColor];
}
-(NSArray<NSString *> *)arrs{
    if (!_arrs) {
        _arrs = [NSArray arrayWithObjects:kCAGravityCenter,kCAGravityTop,kCAGravityBottom,kCAGravityLeft,kCAGravityRight,kCAGravityTopLeft,kCAGravityTopRight,kCAGravityBottomLeft,kCAGravityBottomRight,kCAGravityResize,kCAGravityResizeAspect,kCAGravityResizeAspectFill, nil];
    }
    return _arrs;
}

@end
