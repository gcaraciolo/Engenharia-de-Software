//
//  AppDelegate.h
//  Biblioteca Unicap
//
//  Created by Guilherme Caraciolo on 4/26/15.
//  Copyright (c) 2015 alunos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <RESideMenu.h>
#import "ESLeftMenuViewController.h"
#import "ESBuscarAcervoViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, strong) ESLeftMenuViewController        *leftMenuController;
@property (nonatomic, strong) ESBuscarAcervoViewController    *buscarAcervoController;
@property (nonatomic, strong) UINavigationController          *navigationController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

