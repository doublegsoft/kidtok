/*
** ██╗░░██╗██╗██████╗░████████╗░█████╗░██╗░░██╗
** ██║░██╔╝██║██╔══██╗╚══██╔══╝██╔══██╗██║░██╔╝
** █████═╝░██║██║░░██║░░░██║░░░██║░░██║█████═╝░
** ██╔═██╗░██║██║░░██║░░░██║░░░██║░░██║██╔═██╗░
** ██║░╚██╗██║██████╔╝░░░██║░░░╚█████╔╝██║░╚██╗
** ╚═╝░░╚═╝╚═╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝
*/
#import "AppDelegate.h"

//#import "VC/WelcomeViewController.h"
#import "VC/VideoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//  WelcomeViewController* welcome = [[WelcomeViewController alloc] init];
//  self.window.rootViewController = welcome;
//  [self.window makeKeyAndVisible];
//  return YES;
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  VideoViewController *vc = [VideoViewController new];
  self.window.rootViewController = vc;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
