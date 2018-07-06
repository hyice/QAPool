//
//  ViewController.m
//  issue7
//
//  Created by zhangbin on 2018/7/3.
//  Copyright © 2018年 hyice. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "PropertyBridge.h"
#import "FunctionBridge.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Bridge Demo";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - events
- (void)accessJavaScriptProperties {
    [PropertyBridge accessJavaScriptProperties];
}

- (void)addPropertiesToJavaScript {
    [PropertyBridge addJavaScriptProperties];
}

- (void)invokeJavaScriptFunctionsWithDifferentParams {
    [FunctionBridge invokeJavaScriptFunctionsWithDifferentParams];
}

- (void)invokeJavaScriptFunctionsWithDifferentReturnValues {
    [FunctionBridge invokeJavaScriptFunctionsWithDifferentReturnValues];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *action = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"action"];
    [self performSelector:NSSelectorFromString(action) withObject:nil];
}

#pragma mark - getters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
                        @{@"title": @"Access Properties In JavaScript", @"action": NSStringFromSelector(@selector(accessJavaScriptProperties))},
                        @{@"title": @"Add Properties To JavaScript", @"action": NSStringFromSelector(@selector(addPropertiesToJavaScript))},
                        @{@"title": @"Invoke JS Functions With Different Params", @"action": NSStringFromSelector(@selector(invokeJavaScriptFunctionsWithDifferentParams))},
                        @{@"title": @"Invoke JS Functions With Different Return Values", @"action": NSStringFromSelector(@selector(invokeJavaScriptFunctionsWithDifferentReturnValues))}
        ];
    }
    
    return _dataSource;
}

@end
