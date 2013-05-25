//
//  FZKCup.h
//  KartKeeper
//
//  Created by Ian Meyer on 5/24/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FZKTrack.h"

@interface FZKCup : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *tracks;

+ (FZKCup *)cup;
+ (FZKCup *)cupWithName:(NSString *)newCupName andTracks:(NSArray *)newCupTracks;

@end
