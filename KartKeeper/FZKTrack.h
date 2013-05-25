//
//  FZKTrack.h
//  KartKeeper
//
//  Created by Ian Meyer on 5/24/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZKTrack : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;

@property (nonatomic) BOOL favorite; // star
@property (nonatomic) BOOL reject; // poo

+ (FZKTrack *)track;
+ (FZKTrack *)trackWithName:(NSString *)newTrackName;

@end
