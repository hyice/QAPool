//
//  JSContext+LoadBundle.h
//  issue7
//
//  Created by zhangbin on 2018/7/5.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface JSContext (LoadBundle)

+ (instancetype)contextWithBundle:(NSString *)bundleName;

@end
