//
//  FlutterModule.m
//  DemoRNFlutter
//
//  Created by Rafał Adasiewicz on 17/06/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FlutterModule.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DemoRNFlutter-Swift.h"

@implementation FlutterModule
  
  RCT_EXPORT_MODULE();
  
  +(BOOL)requiresMainQueueSetup {
    return YES;
  }

  RCT_EXPORT_METHOD(showFlutterView) {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      [((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController presentViewController: [[SampleViewController alloc] init] animated:YES completion:nil];
    }];
  }
  
  @end
