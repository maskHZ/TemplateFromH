//
//  AppDelegate.h
//  TemplateFromH
//
//  Created by 石浩 on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

