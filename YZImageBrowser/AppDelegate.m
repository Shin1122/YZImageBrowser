//
//  AppDelegate.m
//  YZImageBrowser
//
//  Created by Xin.YaZhuang on 2019/8/23.
//  Copyright © 2019 Shin. All rights reserved.
//

#import "AppDelegate.h"
#import <BUAdSDK/BUAdSDK.h>

@interface AppDelegate ()<BUSplashAdDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [BUAdSDKManager setAppID:@"5028412"];
//    [BUAdSDKManager setIsPaidApp:NO];
//    [BUAdSDKManager setLoglevel:BUAdSDKLogLevelDebug];
//
//    CGRect frame = [UIScreen mainScreen].bounds;
//    BUSplashAdView *splashView = [[BUSplashAdView alloc] initWithSlotID:@"900721489" frame:frame];
//    splashView.delegate = self;
//    UIWindow *keyWindow = [UIApplication sharedApplication].windows.firstObject;
//    [splashView loadAdData];
//    [keyWindow.rootViewController.view addSubview:splashView];
//    splashView.rootViewController = keyWindow.rootViewController;
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
