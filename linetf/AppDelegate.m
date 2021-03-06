//
//  AppDelegate.m
//  linetf
//
//  Created by student on 10/24/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
   }


- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
   
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"linetf"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                   
                    
                                      NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
      
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
