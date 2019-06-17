/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation AppDelegate

  FlutterPluginAppLifeCycleDelegate *_lifeCycleDelegate;
  
- (instancetype)init {
  if (self = [super init]) {
    _lifeCycleDelegate = [[FlutterPluginAppLifeCycleDelegate alloc] init];
  }
  return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
  [self.flutterEngine runWithEntrypoint:nil];

  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"DemoRNFlutter"
                                            initialProperties:nil];

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  return [_lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}
  
  // Returns the key window's rootViewController, if it's a FlutterViewController.
  // Otherwise, returns nil.
- (FlutterViewController*)rootFlutterViewController {
  UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
  if ([viewController isKindOfClass:[FlutterViewController class]]) {
    return (FlutterViewController*)viewController;
  }
  return nil;
}
  
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  [super touchesBegan:touches withEvent:event];
  
  // Pass status bar taps to key window Flutter rootViewController.
  if (self.rootFlutterViewController != nil) {
    [self.rootFlutterViewController handleStatusBarTouches:event];
  }
}
  
- (void)applicationDidEnterBackground:(UIApplication*)application {
  [_lifeCycleDelegate applicationDidEnterBackground:application];
}
  
- (void)applicationWillEnterForeground:(UIApplication*)application {
  [_lifeCycleDelegate applicationWillEnterForeground:application];
}
  
- (void)applicationWillResignActive:(UIApplication*)application {
  [_lifeCycleDelegate applicationWillResignActive:application];
}
  
- (void)applicationDidBecomeActive:(UIApplication*)application {
  [_lifeCycleDelegate applicationDidBecomeActive:application];
}
  
- (void)applicationWillTerminate:(UIApplication*)application {
  [_lifeCycleDelegate applicationWillTerminate:application];
}
  
- (void)application:(UIApplication*)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings {
  [_lifeCycleDelegate application:application
didRegisterUserNotificationSettings:notificationSettings];
}
  
- (void)application:(UIApplication*)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
  [_lifeCycleDelegate application:application
didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}
  
- (void)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
  [_lifeCycleDelegate application:application
     didReceiveRemoteNotification:userInfo
           fetchCompletionHandler:completionHandler];
}
  
- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options {
  return [_lifeCycleDelegate application:application openURL:url options:options];
}
  
- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
  return [_lifeCycleDelegate application:application handleOpenURL:url];
}
  
- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
  sourceApplication:(NSString*)sourceApplication
         annotation:(id)annotation {
  return [_lifeCycleDelegate application:application
                                 openURL:url
                       sourceApplication:sourceApplication
                              annotation:annotation];
}
  
- (void)application:(UIApplication*)application
performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0) {
  [_lifeCycleDelegate application:application
     performActionForShortcutItem:shortcutItem
                completionHandler:completionHandler];
}
  
- (void)application:(UIApplication*)application
handleEventsForBackgroundURLSession:(nonnull NSString*)identifier
  completionHandler:(nonnull void (^)(void))completionHandler {
  [_lifeCycleDelegate application:application
handleEventsForBackgroundURLSession:identifier
                completionHandler:completionHandler];
}
  
- (void)application:(UIApplication*)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
  [_lifeCycleDelegate application:application performFetchWithCompletionHandler:completionHandler];
}
  
- (void)addApplicationLifeCycleDelegate:(NSObject<FlutterPlugin>*)delegate {
  [_lifeCycleDelegate addDelegate:delegate];
}

@end
