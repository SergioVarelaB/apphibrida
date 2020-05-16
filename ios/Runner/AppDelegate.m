#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
@import GoogleMaps;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  [GMSServices provideAPIKey:@"AIzaSyBsNUuK7CDu-Vrd2bwJX0GsaDxP429qk28"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
