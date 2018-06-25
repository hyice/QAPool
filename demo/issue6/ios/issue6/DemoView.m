//
//  DemoView.m
//  issue6
//
//  Created by zhangbin on 2018/6/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "DemoView.h"
#import <React/RCTComponent.h>

@interface DemoView ()

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, strong) UIButton *changeValueButton;

@property (nonatomic, copy) RCTDirectEventBlock onChangeValue;

@end

@implementation DemoView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  
  if (self) {
    [self initViews];
  }
  
  return self;
}

- (void)initViews {
  [self addSubview:self.promptLabel];
  [self addSubview:self.valueLabel];
  [self addSubview:self.changeValueButton];
  
  self.promptLabel.frame = CGRectMake(0, 0, 100, 40);
  self.valueLabel.frame = CGRectMake(100, 0, 100, 40);
  self.changeValueButton.frame = CGRectMake(0, 50, 100, 50);
}

#pragma mark - events
- (void)changeButtonPressed:(UIButton *)button {
  int value = arc4random() * 100 % 101;
  self.valueLabel.text = [NSString stringWithFormat:@"%d", value];
  
  if (self.onChangeValue) {
    self.onChangeValue(@{@"value": @(value)});
  }
}

#pragma mark - getters
- (UILabel *)promptLabel {
  if (!_promptLabel) {
    _promptLabel = [UILabel new];
    _promptLabel.text = @"native value:";
    _promptLabel.font = [UIFont systemFontOfSize:16];
    _promptLabel.textColor = [UIColor whiteColor];
  }
  
  return _promptLabel;
}

- (UILabel *)valueLabel {
  if (!_valueLabel) {
    _valueLabel = [UILabel new];
    _valueLabel.font = [UIFont systemFontOfSize:16];
    _valueLabel.textColor = [UIColor whiteColor];
  }
  
  return _valueLabel;
}

- (UIButton *)changeValueButton {
  if (!_changeValueButton) {
    _changeValueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _changeValueButton.backgroundColor = [UIColor redColor];
    [_changeValueButton setTitle:@"Chang" forState:UIControlStateNormal];
    [_changeValueButton addTarget:self
                           action:@selector(changeButtonPressed:)
                 forControlEvents:UIControlEventTouchUpInside
     ];
  }
  
  return _changeValueButton;
}

@end
