#import "UserStatusManager.h"

@implementation UserStatusManager

RCT_EXPORT_MODULE();

- (instancetype)init {
  self = [super init];
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"UserStatusChange" object:nil];
  }
  
  return self;
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"UserStatusChanged"];
}

- (void)sendEvent
{
  [self sendEventWithName:@"UserStatusChanged" body:@{}];
}

- (void)receiveNotification:(NSNotification *)notification {
  [self sendEvent];
}

@end
