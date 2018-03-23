//
//  AppDelegate.m
//  MyCode
//
//  Created by 张振飞 on 2017/2/1.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    //设置分享配置
    [self setShareConfig];
    
    //设置iqmanager
    [self setIQManagerConfig];
    NSLog(@"test2");
    
    return YES;
}

#pragma mark 设置分享配置
- (void)setShareConfig{
    
    /* 打开调试日志 */
//    [[UMSocialManager defaultManager] openLog:YES];
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"592e85294544cb6534000256"];
    //设置微信appkey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx9de46746d4e98c4d" appSecret:@"1228345864461579c3b9fe9b226f62c3" redirectURL:@"http://mobile.umeng.com/social"];
}

#pragma mark 设置iqmanager
- (void)setIQManagerConfig{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
