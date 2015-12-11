//
//  AppDelegate.m
//  ChioceFood
//
//  Created by qianfeng on 15/12/11.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseTabBarController * tab = [[BaseTabBarController  alloc]init];
    self.window.rootViewController = tab;
//    NSLog(@"%@",NSHomeDirectory());

    //启动页停留
        [NSThread sleepForTimeInterval:2.0];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    }

- (void)applicationDidEnterBackground:(UIApplication *)application {
  }

- (void)applicationWillEnterForeground:(UIApplication *)application {
   }

- (void)applicationDidBecomeActive:(UIApplication *)application {
   }

- (void)applicationWillTerminate:(UIApplication *)application {
   }

@end
