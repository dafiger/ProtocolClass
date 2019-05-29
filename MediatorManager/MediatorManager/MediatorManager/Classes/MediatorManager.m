//
//  MediatorManager.m
//  ProtocolDemo
//
//  Created by wangpf on 2019/5/23.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "MediatorManager.h"

@implementation MediatorManager
#pragma mark - 获取单例
+ (MediatorManager *)sharedInstance
{
    static dispatch_once_t predicate = 0;
    static MediatorManager *instance = nil;
    dispatch_once( &predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (id)init
{
    self = [super init];
    if(self){
        NSLog(@"MediatorManager单例初始化");
        self.serviceDict = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - 注册协议
- (void)registerService:(Protocol *)proto forService:(Class)serviceClass {
    NSString *protoName = NSStringFromProtocol(proto);
    NSString *className = NSStringFromClass(serviceClass);
    if (protoName.length && className.length) {
        NSLog(@"注册协议success：<%@:%@>", protoName, className);
        [self.serviceDict setObject:className forKey:protoName];
    }else{
        NSLog(@"注册协议fail：<%@:%@>", protoName, className);
    }
}

#pragma mark - 通过协议获取类
- (id)fetchService:(Protocol *)proto {
    NSString *protoName = NSStringFromProtocol(proto);
    NSString *className = [self.serviceDict objectForKey:protoName];
    Class serviceClass = NSClassFromString(className);
    id obj = [[serviceClass alloc] init];
    
    if ([obj conformsToProtocol:proto]){
        NSLog(@"通过协议找到 class");
        return obj;
    }else{
        NSLog(@"通过协议未找到 class");
        return nil;
    }
}

#pragma mark - 动态注册协议，直接获取类
+ (id)moduleInstanceFromProtocol:(Protocol *)protocol {
    static NSMutableDictionary *moduleDict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moduleDict = [NSMutableDictionary dictionary];
    });
    
    NSString *protoName = NSStringFromProtocol(protocol);
    NSString *className = [moduleDict objectForKey:protoName];
    if ([className isKindOfClass:[NSNull class]] ||
        className == nil ||
        className.length == 0) {
        className = [protoName stringByReplacingOccurrencesOfString:@"Protocol" withString:@""];
        className = [NSString stringWithFormat:@"%@Entry",className];
        NSLog(@"注册协议success：<%@:%@>", protoName, className);
        [moduleDict setObject:className forKey:protoName];
    }
    Class moduleClass = NSClassFromString(className);
    id obj = [[moduleClass alloc] init];
    
    if ([obj conformsToProtocol:protocol]){
        NSLog(@"通过协议找到 class");
        return obj;
    }else{
        NSLog(@"通过协议未找到 class");
        return nil;
    }
}

@end
