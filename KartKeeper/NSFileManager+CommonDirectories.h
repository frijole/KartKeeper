//
//  NSFileManager+CommonDirectories.h
//  KartKeeper
//
//  Created by Ian on 5/20/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (CommonDirectories)

+ (NSString *)documentDirectoryPath;
+ (NSString *)cachesDirectoryPath;
+ (NSString *)bundleDirectoryPath;

@end
