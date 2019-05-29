//
//  SecondProtocol.h
//  ProtocolDemo
//
//  Created by wangpf on 2019/5/21.
//  Copyright © 2019 wpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#import "MediatorManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SecondProtocol <NSObject>
- (UIViewController *)homePage:(NSString *)userID;
@end

NS_ASSUME_NONNULL_END
