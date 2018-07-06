//
//  FunctionBridge.m
//  issue7
//
//  Created by zhangbin on 2018/7/6.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import "FunctionBridge.h"
#import "JSContext+LoadBundle.h"

@implementation FunctionBridge

+ (void)invokeJavaScriptFunctionsWithDifferentParams {
    JSContext *context = [JSContext contextWithBundle:@"function_param"];
    
    JSValue *paramNumberTestFunction = context[@"paramNumberTest"];
    [paramNumberTestFunction callWithArguments:@[@"a"]];
    [paramNumberTestFunction callWithArguments:@[@"a", @"b"]];
    [paramNumberTestFunction callWithArguments:@[@"a", @"b", @"c"]];
    
    JSValue *acceptStringParamFunction = context[@"acceptStringParam"];
    [acceptStringParamFunction callWithArguments:@[@"a"]];
    [acceptStringParamFunction callWithArguments:@[@"a", @(2)]];
    [acceptStringParamFunction callWithArguments:@[]];
    [acceptStringParamFunction callWithArguments:@[@(1)]];
    
    JSValue *acceptNumberParamFunction = context[@"acceptNumberParam"];
    [acceptNumberParamFunction callWithArguments:@[@(1)]];
    [acceptNumberParamFunction callWithArguments:@[@(1), @"b"]];
    [acceptNumberParamFunction callWithArguments:@[]];
    [acceptNumberParamFunction callWithArguments:@[@(YES)]];
    
    JSValue *acceptBoolParamFunction = context[@"acceptBoolParam"];
    [acceptBoolParamFunction callWithArguments:@[@(YES)]];
    [acceptBoolParamFunction callWithArguments:@[@(YES), @"b"]];
    [acceptBoolParamFunction callWithArguments:@[@[]]];
    [acceptBoolParamFunction callWithArguments:@[@(1)]];
    
    JSValue *acceptDateParamFunction = context[@"acceptDateParam"];
    [acceptDateParamFunction callWithArguments:@[[NSDate new]]];
    [acceptDateParamFunction callWithArguments:@[[NSDate new], @"b"]];
    [acceptDateParamFunction callWithArguments:@[@[]]];
    [acceptDateParamFunction callWithArguments:@[@"2018-06-01 15:33:22"]];
    
    JSValue *acceptArrayParamFunction = context[@"acceptArrayParam"];
    [acceptArrayParamFunction callWithArguments:@[@[@(1), @"b"]]];
    [acceptArrayParamFunction callWithArguments:@[]];
    [acceptArrayParamFunction callWithArguments:@[@"a"]];
    
    JSValue *acceptObjectParamFunction = context[@"acceptObjectParam"];
    [acceptObjectParamFunction callWithArguments:@[@{@"a": @(1)}]];
    [acceptObjectParamFunction callWithArguments:@[]];
    [acceptObjectParamFunction callWithArguments:@[@[]]];
    
    JSValue *acceptFunctionParamFunction = context[@"acceptFunctionParam"];
    [acceptFunctionParamFunction callWithArguments:@[acceptBoolParamFunction]];
    [acceptFunctionParamFunction callWithArguments:@[^(){
        NSLog(@"native block");
    }]];
    [acceptFunctionParamFunction callWithArguments:@[]];
    [acceptFunctionParamFunction callWithArguments:@[@"a"]];
}

+ (void)invokeJavaScriptFunctionsWithDifferentReturnValues {
    JSContext *context = [JSContext contextWithBundle:@"function_return_value"];
    
    JSValue *stringResultFunction = context[@"stringResult"];
    JSValue *jsString = [stringResultFunction callWithArguments:nil];
    NSLog(@"stringResult function result: %@", [jsString toString]);
    
    JSValue *numberResultFunction = context[@"numberResult"];
    JSValue *jsNumber = [numberResultFunction callWithArguments:nil];
    NSLog(@"stringResult function result: %@", [jsNumber toNumber]);
    
    JSValue *boolResultFunction = context[@"boolResult"];
    JSValue *jsBool = [boolResultFunction callWithArguments:nil];
    NSLog(@"boolResult function result: %@", [jsBool toBool]? @"YES" : @"NO");
    
    JSValue *dateResultFunction = context[@"dateResult"];
    JSValue *jsDate = [dateResultFunction callWithArguments:nil];
    NSLog(@"dateResult function result: %@", [jsDate toDate]);
    
    JSValue *arrayResultFunction = context[@"arrayResult"];
    JSValue *jsArray = [arrayResultFunction callWithArguments:nil];
    NSLog(@"arrayResult function result: %@", [jsArray toArray]);
    
    JSValue *objectResultFunction = context[@"objectResult"];
    JSValue *jsObject = [objectResultFunction callWithArguments:nil];
    NSLog(@"objectResult function result: %@", [jsObject toDictionary]);
    
    JSValue *funcResultFunction = context[@"funcResult"];
    JSValue *jsFunction = [funcResultFunction callWithArguments:nil];
    NSLog(@"funcResultFunction function result: %@", [jsFunction toString]);
}

@end
