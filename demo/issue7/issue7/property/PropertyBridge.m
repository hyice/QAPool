//
//  PropertyBridge.m
//  issue7
//
//  Created by zhangbin on 2018/7/5.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import "PropertyBridge.h"
#import "JSContext+LoadBundle.h"
#import "PropertyObject.h"

JSValueRef functionToInjectToJavaScript(
    JSContextRef ctx,
    JSObjectRef function,
    JSObjectRef thisObject,
    size_t argumentCount,
    const JSValueRef arguments[],
    JSValueRef *exception
) {
    NSLog(@"hello from native C method");
    return JSValueMakeUndefined(ctx);
}

@implementation PropertyBridge

+ (void)accessJavaScriptProperties {
    JSContext *context = [JSContext contextWithBundle:@"property"];
    
    // access module/global property by evaluateScript
    JSValue *jsString = [context evaluateScript:@"stringInModule"];
    NSString *string = [jsString toString];
    NSLog(@"stringInModule: %@ class: %@", string, [string class]);
    
    JSValue *jsNumber = [context evaluateScript:@"numberInGlobal"];
    NSNumber *number = [jsNumber toNumber];
    NSLog(@"numberInGlobal: %@ class: %@", number, [number class]);
    
    // access global property by keyed subscript
    JSValue *jsBool = [context objectForKeyedSubscript:@"boolInGlobal"];
    BOOL boolValue = [jsBool toBool];
    NSLog(@"boolInGlobal: %@", boolValue ? @"YES" : @"NO");
    
    JSValue *jsDate = context[@"dateInGlobal"];
    NSDate *date = [jsDate toDate];
    NSLog(@"dateInGlobal: %@ class: %@", date, [date class]);
    
    // get the whole global object
    JSValue *jsGlobal = context.globalObject;
    NSDictionary *global = [jsGlobal toDictionary];
    NSLog(@"global object: %@ class: %@", global, [global class]);
    
    // get property from global object
    NSArray *array = global[@"arrayInGlobal"];
    NSLog(@"arrayInGlobal: %@", array);
    
    // get property from global object with C API
    JSValueRef exception;
    JSValueRef jsObjectRef = JSObjectGetProperty(
                                                  context.JSGlobalContextRef,
                                                  JSContextGetGlobalObject(context.JSGlobalContextRef),
                                                  JSStringCreateWithUTF8CString("objectInGlobal"),
                                                  &exception
                                                  );
    JSValue *jsObject = [JSValue valueWithJSValueRef:jsObjectRef inContext:context];
    NSDictionary *object = [jsObject toDictionary];
    NSLog(@"objectInGlobal: %@ class: %@", object, [object class]);
    
    // get function from JavaScript and excute it with params
    JSValue *jsFunc = context[@"funcInGlobal"];
    NSLog(@"funcInGlobal: %@", jsFunc);
    [jsFunc callWithArguments:@[@"abc"]];
}

+ (void)addJavaScriptProperties {
    JSContext *context = [JSContext new];
    
    // add module/global property by evaluateScript
    [context evaluateScript:@"const native_stringInModule = 'this is a string created in native'"];
    [context evaluateScript:@"this.native_numberInGlobal = 3"];
    
    // add global property by keyed subscript
    context[@"native_boolInGlobal"] = @(YES);
    [context setObject:[NSDate new] forKeyedSubscript:@"native_dateInGlobal"];
    
    // operate on globalObject
    [context.globalObject setValue:@[@"string", @(3), @(YES)] forProperty:@"native_arrayInGlobal"];
    
    // add object with C API
    JSContextRef contextRef = context.JSGlobalContextRef;
    JSObjectRef objectRef = JSObjectMake(contextRef, 0, 0);
    JSObjectSetProperty(contextRef, objectRef, JSStringCreateWithUTF8CString("createdBy"), JSValueMakeString(contextRef, JSStringCreateWithUTF8CString("It's so hard!")), 0, 0);
    
    JSObjectSetProperty(contextRef, JSContextGetGlobalObject(contextRef), JSStringCreateWithUTF8CString("native_objectInGlobal"), objectRef, 0, 0);
    
    // add custom object with JSExport
    context[@"native_customObjectInGlobal"] = [PropertyObject new];
    
    // add function with block
    context[@"native_functionWithBlock"] = ^(NSString *name) {
        NSLog(@"hello %@", name);
    };
    
    // add function with C API
    JSObjectRef cAPIFunctionRef = JSObjectMakeFunctionWithCallback(contextRef, NULL, functionToInjectToJavaScript);
    JSObjectSetProperty(contextRef, JSContextGetGlobalObject(contextRef), JSStringCreateWithUTF8CString("native_functionWithCAPI"), cAPIFunctionRef, 0, 0);
}

@end
