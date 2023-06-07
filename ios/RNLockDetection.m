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
static void displayStatusChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    /*CFStringRef nameCFString = (CFStringRef)name;
    NSString *lockState = (NSString*)nameCFString;
    NSLog(@"Darwin notification NAME = %@",name);

    if([lockState isEqualToString:@"com.apple.springboard.lockcomplete"])
    {
          [ref lockStatusChanged:@"LOCKED"];
    }
    else
    {
         [ref lockStatusChanged:@"UNLOCKED"];
    }*/
}

RCT_EXPORT_MODULE(RNLockDetection);
RCT_EXPORT_METHOD(registerForDeviceLockNotification) {
   /*
       CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
                                       NULL, // observer
                                       displayStatusChanged, // callback
                                       CFSTR("com.apple.springboard.lockcomplete"), // event name
                                       NULL, // object
                                       CFNotificationSuspensionBehaviorDeliverImmediately);

       CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
                                       NULL, // observer
                                       displayStatusChanged, // callback
                                       CFSTR("com.apple.springboard.lockstate"), // event name
                                       NULL, // object
                                       CFNotificationSuspensionBehaviorDeliverImmediately);
   */
}
@end
