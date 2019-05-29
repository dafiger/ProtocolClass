//
//  MediatorManager.h
//  ProtocolDemo
//
//  Created by wangpf on 2019/5/23.
//  Copyright © 2019 wpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediatorManager : NSObject

@property(nonatomic, strong) NSMutableDictionary *serviceDict;
#pragma mark - 获取单例
+ (MediatorManager *)sharedInstance;
#pragma mark - 注册协议
- (void)registerService:(Protocol *)proto forService:(Class)serviceClass;
#pragma mark - 通过协议获取类
- (Class)fetchService:(Protocol *)proto;

#pragma mark - 动态注册协议，直接获取类
+ (id)moduleInstanceFromProtocol:(Protocol *)protocol;
#define PRGetModuleInstance(PRModuleProtocol) ((id<PRModuleProtocol>)([MediatorManager moduleInstanceFromProtocol:@protocol(PRModuleProtocol)]))

///**根据传入的组件协议返回实现该协议的类的对象*/
//NS_INLINE id PRModuleInstanceFromProtocol(Protocol *protocol) {
//    NSString *className = NSStringFromProtocol(protocol);
//    className = [className stringByReplacingOccurrencesOfString:@"Protocol" withString:@""];
//    Class aClass = NSClassFromString(className);
//    static NSMutableDictionary *modulesDictionary = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        modulesDictionary = [NSMutableDictionary dictionary];
//    });
//    id module = modulesDictionary[className];
//    if (!module) {
//        module = [[aClass alloc]init];
//        modulesDictionary[className] = module;
//    }
//    if ([module conformsToProtocol:protocol]){
//        return module;
//    }
//    return nil;
//}
//
//#define PRGetModuleInstance(PRModuleProtocol) ((id<PRModuleProtocol>)(PRModuleInstanceFromProtocol(@protocol(PRModuleProtocol))))


@end

NS_ASSUME_NONNULL_END
