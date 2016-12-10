//
//  AppDelegate.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/11/25.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LVTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[LVTabBarController  alloc]init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
