//
//  JSContext+LoadBundle.m
//  issue7
//
//  Created by zhangbin on 2018/7/5.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import "JSContext+LoadBundle.h"

@implementation JSContext (LoadBundle)

+ (instancetype)contextWithBundle:(NSString *)bundleName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    JSContext *context = [JSContext new];
    [context evaluateScript:script];
    
    return context;
}

@end
