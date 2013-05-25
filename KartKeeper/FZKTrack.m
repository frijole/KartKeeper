//
//  FZKTrack.m
//  KartKeeper
//
//  Created by Ian Meyer on 5/24/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import "FZKTrack.h"

@implementation FZKTrack

+ (FZKTrack *)track
{
    return [[FZKTrack alloc] init];
}

+ (FZKTrack *)trackWithName:(NSString *)newTrackName
{
    FZKTrack *rtnTrack = [FZKTrack track];
    
    rtnTrack.name = newTrackName;
    
    return rtnTrack;
}

#pragma mark - NSCoder
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name   forKey:@"kFZKCupNameKey"];

    [coder encodeBool:self.favorite forKey:@"kFZKTrackFavoriteKey"];
    [coder encodeBool:self.reject   forKey:@"kFZKTrackRejectKey"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
		self.name       = [decoder decodeObjectForKey:@"kFZKCupNameKey"];

        self.favorite   = [decoder decodeBoolForKey:@"kFZKTrackFavoriteKey"];
        self.reject     = [decoder decodeBoolForKey:@"kFZKTrackRejectKey"];
    }
    
    return self;
}

@end
