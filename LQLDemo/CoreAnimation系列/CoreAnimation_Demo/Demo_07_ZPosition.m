//
//  Demo_07_ZPosition.m
//  LQLDemo
//
//  Created by LQL on 2019/10/21.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "Demo_07_ZPosition.h"

@interface Demo_07_ZPosition ()
@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@end

@implementation Demo_07_ZPosition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"zPosition";
    /*
     Z坐标轴:
      和UIView严格的二维坐标系不同，CALayer存在于一个三维空间当中。除了我们已经讨论过的position和anchorPoint属性之外，CALayer还有另外两个属性，zPosition和anchorPointZ，二者都是在Z轴上描述图层位置的浮点类型。
     注意这里并没有更深的属性来描述由宽和高做成的bounds了，图层是一个完全扁平的对象，你可以把它们想象成类似于一页二维的坚硬的纸片，用胶水粘成一个空洞，就像三维结构的折纸一样。
     
     zPosition属性在大多数情况下其实并不常用。在第五章，我们将会涉及CATransform3D，你会知道如何在三维空间移动和旋转图层，除了做变换之外，zPosition最实用的功能就是改变图层的显示顺序了。
     
     */
   self.orangeView.layer.zPosition = 1.0f;
}



@end
