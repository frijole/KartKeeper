//
//  FZKDataStore.h
//  KartKeeper
//
//  Created by Ian Meyer on 5/24/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FZKCup.h"

@interface FZKDataStore : NSObject

+ (NSArray *)cups;

+ (BOOL)loadFromDisk;
+ (BOOL)saveToDisk;

@end
