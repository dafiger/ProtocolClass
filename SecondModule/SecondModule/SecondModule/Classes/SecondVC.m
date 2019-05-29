//
//  SecondVC.m
//  ProtocolDemo
//
//  Created by wangpf on 2019/5/21.
//  Copyright © 2019 wpf. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self gotoFirst:@"123"];
    
    // Do any additional setup after loading the view.
}

- (void)gotoFirst:(NSString *)userID {
    //    id obj = [[MediatorManager sharedInstance] fetchService:@protocol(FirstProtocol)];
    //    id obj = [MediatorManager moduleInstanceFromProtocol:@protocol(FirstProtocol)];
//#ifdef PRGetModuleInstance
//    id obj = PRGetModuleInstance(FirstProtocol);
//    UIViewController *firstVC = [obj homePage:userID];
//    if ([firstVC isKindOfClass:[UIViewController class]]) {
//        NSLog(@"SecondVC 准备调用 firstVC");
//    }
//#endif
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
