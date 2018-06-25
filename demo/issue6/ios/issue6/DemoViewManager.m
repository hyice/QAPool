//
//  DemoViewManager.m
//  issue6
//
//  Created by zhangbin on 2018/6/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "DemoViewManager.h"
#import "DemoView.h"

@implementation DemoViewManager

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(onChangeValue, RCTDirectEventBlock)

- (UIView *)view {
  return [DemoView new];
}

@end
