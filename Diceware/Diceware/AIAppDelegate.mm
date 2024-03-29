//
//  AIAppDelegate.m
//  Diceware
//
//  Created by Asim Ihsan on 28/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AIAppDelegate.h"
#import "AIRandomManager.h"
#import "AIPasswordViewController.h"

#import "Logging/DDLog.h"
#import "Logging/DDTTYLogger.h"

@implementation AIAppDelegate

@synthesize window, passwordViewController;

- (void)dealloc
{
    [passwordViewController release];
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    LOG_V("entry.");
    
    // -------------------------------------------------------------------------
    //  Initialize the logger. We add a TTY (terminal) logger, and in the
    //  future will probably add e.g. file-based, S3-backup logging.
    // -------------------------------------------------------------------------
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // -------------------------------------------------------------------------    

    // -------------------------------------------------------------------------
    //  Initialize the window and the current root view controller, the password
    //  view controller.
    // -------------------------------------------------------------------------    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    self.passwordViewController = [[AIPasswordViewController alloc] initWithNibName:nil bundle:nil];
    [self.window addSubview:self.passwordViewController.view];
    [self.window makeKeyAndVisible];
    // -------------------------------------------------------------------------    
    
    LOG_V("exit");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
