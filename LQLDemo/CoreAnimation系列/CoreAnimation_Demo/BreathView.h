//
//  BreathView.h
//  AnimationDemo
//
//  Created by LQL on 2019/10/29.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BreathView : UIView
//花瓣数量
@property(nonatomic,assign) CGFloat petalCount;
/// 花瓣最大半径
@property(nonatomic,assign)CGFloat petalMaxRadius;
/// 花瓣最小半径
@property(nonatomic,assign)CGFloat petalMinRadius;
/// 动画总时间
@property(nonatomic,assign)double animationDuration;
-(void)animate;
@end




@interface FirstPetalColor : NSObject
@property(nonatomic,assign)CGFloat red;
@property(nonatomic,assign)CGFloat green;
@property(nonatomic,assign)CGFloat bule;
@end

@interface LastPetalColor : NSObject
@property(nonatomic,assign)CGFloat red;
@property(nonatomic,assign)CGFloat green;
@property(nonatomic,assign)CGFloat bule;
@end

NS_ASSUME_NONNULL_END
