//
//  PropertyObject.m
//  issue7
//
//  Created by zhangbin on 2018/7/5.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import "PropertyObject.h"

@implementation PropertyObject

- (void)hello {
    NSLog(@"hello from native");
}

- (void)helloTo:(NSString *)name {
    NSLog(@"hello to %@ from native", name);
}

- (void)helloTo:(NSString *)name andTo:(NSString *)anotherName {
    NSLog(@"hello to %@ and to %@ from native", name, anotherName);
}

- (void)thisIsNotExported {
    NSLog(@"xxxxxxxxx");
}

@end
