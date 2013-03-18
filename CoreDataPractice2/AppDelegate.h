//
//  AppDelegate.h
//  CoreDataPractice2
//
//  Created by Sohaib Muhammad on 18/03/2013.
//  Copyright (c) 2013 coeus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreDataViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) CoreDataViewController *coreDataController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
