//
//  DXAppDelegate.m
//  MVVM
//
//  Created by 123456 on 2017/12/11.
//  Copyright © 2017年 DXin. All rights reserved.
//

#import "DXAppDelegate.h"
#import "DXTabBarController.h"

@interface DXAppDelegate ()

@end

@implementation DXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 延长启动页面时间
//    [NSThread sleepForTimeInterval:3.0];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    DXTabBarController *tabBarVC = [DXTabBarController tabBarController];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyWindow];
    return YES;
}

@end
