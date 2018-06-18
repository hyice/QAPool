#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface UserStatusManager : RCTEventEmitter <RCTBridgeModule>

- (void)sendEvent;

@end
