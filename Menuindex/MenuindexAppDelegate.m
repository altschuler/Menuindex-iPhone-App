//
//  MenuindexAppDelegate.m
//  Menuindex
//
//  Created by zupa-sia on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuindexAppDelegate.h"
#import "SearchViewController.h"
#import "MapViewController.h"
#import "FavoritesViewController.h"
#import "FavoritesController.h"

@implementation MenuindexAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Check for and create (if neccessary) the favorites.plist file
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* dataPath = [documentsDirectory stringByAppendingPathComponent:@"Favorites.plist"];
    
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        NSString* resourceaPath = [[NSBundle mainBundle] pathForResource:@"Favorites" ofType:@"plist"];
        [[NSFileManager defaultManager] copyItemAtPath:resourceaPath toPath:dataPath error:NULL];
    }
    
    //Search Flow
    UIViewController* searchVC = [[SearchViewController alloc] initWithNibName:@"SearchView" bundle:nil];
    UINavigationController* searchNC = [[UINavigationController alloc] initWithRootViewController:searchVC];
    
    //Map Flow
    UIViewController* mapVC = [[MapViewController alloc] initWithNibName:@"MapView" bundle:nil];
    UINavigationController* mapNC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    //Favorites Flow
    UIViewController* favVC = [[FavoritesViewController alloc] initWithNibName:@"FavoritesView" bundle:nil];
    UINavigationController* favNC = [[UINavigationController alloc] initWithRootViewController:favVC];
    
    NSArray* viewCons = [[NSArray alloc] initWithObjects:searchNC,mapNC,favNC, nil];
    
    self.tabBarController.viewControllers = viewCons;
    
    //for debugging. clear the favorites file.
   // [[FavoritesController getInstance] writeFavoritesToDisk];
    
    
    [viewCons release];
    [mapVC release];
    [favVC release];
    [searchVC release];
    [mapNC release];
    [favNC release];
    [searchNC release];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
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
    [[FavoritesController getInstance] writeFavoritesToDisk];
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
    [[FavoritesController getInstance] writeFavoritesToDisk];
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
