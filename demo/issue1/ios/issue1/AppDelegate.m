/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#import "UserStatusManager.h"

@interface AppDelegate()

@property (nonatomic, weak) RCTBridge *bridge;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                            moduleProvider:nil
                                             launchOptions:launchOptions];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"issue1"
                                            initialProperties:nil];
  
  self.bridge = bridge;
  
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  rootViewController.title = @"DEMO";
  rootViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Event" style:UIBarButtonItemStylePlain target:self action:@selector(sendEvent)];
  
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  

  
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)sendEvent {
  // 方案一
  [[NSNotificationCenter defaultCenter] postNotificationName:@"UserStatusChange" object:nil];
  
  // 方案二
//  UserStatusManager *manager = [self.bridge moduleForName:@"UserStatusManager"];
//  [manager sendEvent];
}

@end
