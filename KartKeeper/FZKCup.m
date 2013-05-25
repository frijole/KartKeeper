//
//  FZKCup.m
//  KartKeeper
//
//  Created by Ian Meyer on 5/24/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import "FZKCup.h"

@implementation FZKCup

+ (FZKCup *)cup
{
    return [[FZKCup alloc] init];
}

+ (FZKCup *)cupWithName:(NSString *)newCupName andTracks:(NSArray *)newCupTracks
{
    FZKCup *rtnCup = [FZKCup cup];
    
    rtnCup.name = newCupName;
    rtnCup.tracks = newCupTracks;
    
    return rtnCup;
}

#pragma mark - NSCoder
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name   forKey:@"kFZKCupNameKey"];
    [coder encodeObject:self.tracks forKey:@"kFZKCupTracksKey"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
		self.name   = [decoder decodeObjectForKey:@"kFZKCupNameKey"];
        self.tracks = [decoder decodeObjectForKey:@"kFZKCupTracksKey"];
    }
    
    return self;
}

@end
