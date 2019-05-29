//
//  ViewController.m
//  Project_iOS
//
//  Created by wpf on 2019/4/8.
//  Copyright © 2019 dafiger. All rights reserved.
//

#import "ViewController.h"

//#import "MediatorManager.h"
#import "FirstProtocol.h"
#import "SecondProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gotoFirst:@"123"];
    [self gotoSecond:@"abc"];
    [self gotoFirst:@"456"];
    [self gotoSecond:@"efg"];
}

- (void)gotoFirst:(NSString *)userID {
    //    id obj = [[MediatorManager sharedInstance] fetchService:@protocol(FirstProtocol)];
    //    id obj = [MediatorManager moduleInstanceFromProtocol:@protocol(FirstProtocol)];
    id obj = PRGetModuleInstance(FirstProtocol);
    UIViewController *firstVC = [obj homePage:userID];
    if ([firstVC isKindOfClass:[UIViewController class]]) {
        NSLog(@"找到 firstVC");
    }
}

- (void)gotoSecond:(NSString *)userID {
    //    id obj = [[MediatorManager sharedInstance] fetchService:@protocol(SecondProtocol)];
    //    id obj = [MediatorManager moduleInstanceFromProtocol:@protocol(SecondProtocol)];
    id obj = PRGetModuleInstance(SecondProtocol);
    UIViewController *secondVC = [obj homePage:userID];
    if ([secondVC isKindOfClass:[UIViewController class]]) {
        NSLog(@"找到 secondVC");
    }
}


@end
