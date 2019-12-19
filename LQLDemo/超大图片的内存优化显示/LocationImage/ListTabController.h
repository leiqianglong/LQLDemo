//
//  ListTabController.h
//  LQLDemo
//
//  Created by LQL on 2019/12/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TBblock)(void);
@interface ListTabController : UITableViewController
@property(nonatomic, strong) TBblock viewDidAppearHandler;
@property(nonatomic, assign) NSInteger displayType;
@end

NS_ASSUME_NONNULL_END
