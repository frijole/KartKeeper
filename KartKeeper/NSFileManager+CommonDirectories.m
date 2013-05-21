//
//  NSFileManager+CommonDirectories.m
//  KartKeeper
//
//  Created by Ian on 5/20/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import "NSFileManager+CommonDirectories.h"

@implementation NSFileManager (CommonDirectories)

+ (NSString *)documentDirectoryPath
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)cachesDirectoryPath
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)bundleDirectoryPath
{
	return [[NSBundle mainBundle] bundlePath];
}

@end
