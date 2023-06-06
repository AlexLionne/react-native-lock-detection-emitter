#import "notify.h"
#import "RNLockDetection.h"

RNLockDetection * ref;

@implementation RNLockDetection

- (id) init
{
    self = [super init];
    ref = self;
    return self;
}
// Register the events for React Native
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"LockStatusChange"];
}
// function called to send the event to JavaScript
- (void)lockStatusChanged:(NSString *)phoneStatus
{
  NSString *newLockedStatus = phoneStatus;
  [self sendEventWithName:@"LockStatusChange" body:@{@"phoneStatus": newLockedStatus}];

}

RCT_EXPORT_MODULE(RNLockDetection);
RCT_EXPORT_METHOD(registerForDeviceLockNotification) {
    int notify_token = 0;
    notify_register_dispatch("com.apple.springboard.lockstate", &notify_token, dispatch_get_main_queue(), ^(int token) {
        uint64_t state = UINT64_MAX;
        notify_get_state(token, &state);

        if (state == 0) {
            [ref lockStatusChanged:@"UNLOCKED"];
        } else {
            [ref lockStatusChanged:@"LOCKED"];
        }
    });
}
@end
