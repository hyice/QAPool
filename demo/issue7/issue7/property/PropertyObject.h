//
//  PropertyObject.h
//  issue7
//
//  Created by zhangbin on 2018/7/5.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol PropertyExport <JSExport>
- (void)hello;
- (void)helloTo:(NSString *)name;
JSExportAs(helloToMany, - (void)helloTo:(NSString *)name andTo:(NSString *)anotherName);
@end

@interface PropertyObject : NSObject <PropertyExport>

@end
