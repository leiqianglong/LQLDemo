//
//  CombinationViewController.h
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, CombinationAniType){
    CombinationAniTypeAdd = 0,
    CombinationAniTypeDingDing,
    CombinationAniTypeDianZan,
    CombinationAniTypeBezier,
};


@interface CombinationViewController : UIViewController
- (instancetype)initWithType:(CombinationAniType)type;
@end

NS_ASSUME_NONNULL_END
