//
//  FirstEntry.m
//  ProtocolDemo
//
//  Created by wangpf on 2019/5/23.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "FirstEntry.h"

@implementation FirstEntry

// 添加initComponent接口，将自身注册到Mediator中
//+ (void)load{
//    @autoreleasepool {
//        [[MediatorManager sharedInstance] registerService:@protocol(FirstProtocol) forService:[self class]];
//    }
//}

- (UIViewController *)homePage:(NSString *)userID {
    NSLog(@"Find FirstVC");
    FirstVC *vc = [[FirstVC alloc] init];
    vc.userID = @"FirstVC";
    return vc;
}

@end
