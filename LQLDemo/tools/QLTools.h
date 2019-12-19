//
//  LHTools.h
//  LQLDemo
//
//  Created by LQL on 2019/8/9.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 延时函数
 @param time 延时时间 单位:s
 @param block 延时回调
 */
static inline void QLAfter(double time,void(^block)(void)){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) {
            block();
        }
    });
}

/**
 获取主线程
 @param block 成功回调
 */
static inline void QLDispatchMain(void (^block)(void))
{
    if ([NSThread isMainThread]) {
        if (block) {
            block();
        }
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/**
 发送通知
 @param name 通知名
 @param object 通知参数
 @param userInfo 传递参数
 */
static inline void QLPostNotification(NSString *name, id object, NSDictionary *userInfo)
{
    if ([NSThread currentThread].isMainThread) {
        [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
    } else {
        QLDispatchMain(^{
            [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
        });
    }
}

/**
 注册通知
 @param target 监听对象
 @param name 通知名
 @param selector 回调方法
 @param object 参数
 */
static inline void QLAddObserve(id target, NSString *name, SEL selector, id object)
{
    if ([NSThread currentThread].isMainThread) {
        [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:name object:object];
    } else {
        QLDispatchMain(^{
            [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:name object:object];
        });
    }
}

/**
 移除木条通知
 */
static inline void QLRemoveObserve(id target, NSString *name, id object)
{
    if ([NSThread currentThread].isMainThread) {
        [[NSNotificationCenter defaultCenter] removeObserver:target name:name object:object];
    } else {
        QLDispatchMain(^{
            [[NSNotificationCenter defaultCenter] removeObserver:target name:name object:object];
        });
    }
}

/**
 移除所有通知
 */
static inline void QLRemoveAllObserve(id target)
{
    QLRemoveObserve(target, nil, nil);
}


