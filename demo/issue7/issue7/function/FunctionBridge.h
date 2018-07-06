//
//  FunctionBridge.h
//  issue7
//
//  Created by zhangbin on 2018/7/6.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunctionBridge : NSObject

+ (void)invokeJavaScriptFunctionsWithDifferentParams;
+ (void)invokeJavaScriptFunctionsWithDifferentReturnValues;

@end
