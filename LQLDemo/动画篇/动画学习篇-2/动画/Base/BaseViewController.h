//
//  BaseViewController.h
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BasicType){
    BasicTypePosition = 0,
    BasicTypeOpacity,
    BasicTypeScale,
    BasicTypeRotate,
    BasicTypeBackground
};

typedef NS_ENUM(NSInteger, KeyType){
    KeyTypeKeyFrame = 0,
    KeyTypePath,
    KeyTypeShake
};

typedef NS_ENUM(NSInteger, GroupType){
    GroupTypeSameTime = 0,
    GroupTypeContinue
};

typedef NS_ENUM(NSInteger, TransitionType){
    TransitionTypeFade = 0,
    TransitionTypeMoveIn,
    TransitionTypePush,
    TransitionTypeReveal,
    TransitionTypeCube,
    TransitionTypeSuck,
    TransitionTypeOglFile,
    TransitionTypeRipple,
    TransitionTypeCurl,
    TransitionTypeUnCurl,
    TransitionTypeCaOpen,
    TransitionTypeCaClose
};
@interface BaseViewController : UIViewController
@property(nonatomic,strong) UIView *bgView;
@end

NS_ASSUME_NONNULL_END
