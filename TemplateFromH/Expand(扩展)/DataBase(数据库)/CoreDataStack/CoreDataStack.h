//
//  CoreDataStack.h
//  TemplateFromH
//
//  Created by January on 2019/5/16.
//  Copyright © 2019 January. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

NS_ASSUME_NONNULL_END
