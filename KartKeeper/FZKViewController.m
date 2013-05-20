//
//  FZKViewController.m
//  KartKeeper
//
//  Created by Ian on 5/20/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import "FZKViewController.h"

@interface FZKViewController ()

@end

@implementation FZKViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	
	self.title = @"CTGP Track List";
	
	self.tracks = @[@{@"Mushroom Cup":@[@"Luigi Circuit", @"Moo Moo Meadows", @"Mushroom Gorge", @"Toad's Factory"]}, @{@"Flower Cup":@[@"Mario Circuit", @"Coconut Mall", @"DK's Snowboard Cross", @"Wario's Gold Mine"]}, @{@"Star Cup":@[@"Daisy Circuit", @"Koopa Cape", @"Maple Treeway", @"Grumble Volcano"]}, @{@"Special Cup":@[@"Dry Dry Ruins", @"Moonview Highway", @"Bowser's Castle", @"Rainbow Road"]}, @{@"Shell Cup":@[@"GCN Peach Beach", @"DS Yoshi Falls", @"SNES Ghost Valley 2", @"N64 Mario Raceway"]}, @{@"Banana Cup":@[@"N64 Sherbet Land", @"GBA Shy Guy Beach", @"DS Delfino Square", @"GCN Waluigi Stadium"]}, @{@"Leaf Cup":@[@"DS Desert Hills", @"GBA Bowser Castle 3", @"N64 DK's Jungle Parkway", @"GCN Mario Circuit"]}, @{@"Lightning Cup":@[@"SNES Mario Circuit 3", @"DS Peach Gardens", @"GCN DK Mountain", @"N64 Bowser's Castle"]}, @{@"Blooper Cup":@[@"GBA Lakeside Park", @"GBA Cheep Cheep Island", @"ASDF_Course", @"Space Road"]}, @{@"Mega Mushroom Cup":@[@"Sunset Forest", @"Sunset Desert", @"Kartwood Creek", @"Haunted Woods"]}, @{@"Thundercloud Cup":@[@"GBA Riverside Park", @"SNES Choco Island 2", @"Jungle Safari", @"Beagle Plains"]}, @{@"POW Cup":@[@"DS Figure-8 Circuit", @"N64 Yoshi Valley", @"DS Waluigi Pinball", @"GCN Daisy Cruiser"]}, @{@"Bob-Omb Cup":@[@"GBA Bowser Castle 4", @"Illusion Canyon", @"DS Wario Stadium", @"Wario's Lair"]}, @{@"Fake Item Cup":@[@"SNES Mario Circuit 1", @"Green Hill Zone", @"Sunset Circuit", @"DS Cheep Cheep Beach"]}, @{@"Golden Mushroom Cup":@[@"GCN Yoshi Circuit", @"Goldwood Forest", @"N64 Royal Raceway", @"Putt Putt Raceway"]}, @{@"Spring Cup":@[@"DS Airship Fortress", @"Bowser Jr.'s Fort", @"N64 Choco Mountain", @"Star Slope"]}, @{@"Fireball Cup":@[@"Thwomp Cave", @"SNES Bowser Castle 2", @"GCN Bowser Castle", @"Incendia Castle"]}, @{@"Red Shell Cup":@[@"Lavaflow Volcano", @"Unnamed Valley", @"Pipe Underworld", @"Beach Gardens"]}, @{@"Blue Shell Cup":@[@"Thunder City", @"Lunar Speedway", @"N64 Banshee Boardwalk", @"Fishdom Island"]}, @{@"Bullet Bill Cup":@[@"SM64 Whomp's Fortress", @"Punch City", @"Delfino Island", @"Six King Labyrinth"]}, @{@"Chain Chomp Cup":@[@"GCN Luigi Circuit", @"Chomp Canyon", @"Chomp Valley", @"Daisy's Palace"]}, @{@"Mii Outfit C Cup":@[@"Codename: BIGBOX", @"Luigi's Island", @"GBA Cheep Cheep Island", @"Rezway"]}, @{@"Poison Mushroom Cup":@[@"Desert Mushroom Ruins", @"Yoshi Lagoon", @"GCN Wario Colosseum", @"Mushroom Peaks"]}, @{@"Ice Flower Cup":@[@"Penguin Canyon", @"Northpole Slide", @"Icy Mountains", @"GCN Sherbet Land"]}, @{@"Propellor Cup":@[@"GBA Sky Garden", @"Cloud Carpet", @"Volcanic Skyway (RC1)", @"Volcanic Skyway (RC3)"]}, @{@"Hammer Bro Cup":@[@"Thwomp Desert", @"Desert Bone", @"Stronghold Castle", @"Bowser's Fortress"]}, @{@"Wiggler Cup":@[@"GBA Ribbon Road", @"DS Luigi's Mansion", @"DK Jungle Tour", @"Rocky Cliff"]}, @{@"Penguin Suit Cup":@[@"DS Nokonoko Beach", @"DS Mario Circuit", @"Faraway Land", @"Icy Vulcan Valley"]}, @{@"Bee Mushroom Cup":@[@"GBA Sky Garden", @"Sky Courtyard", @"Icy Mountaintop", @"GBA Cheese Land"]}, @{@"Rock Mushroom Cup":@[@"Dry Coast", @"SNES Bowser Castle 3", @"Underground Sky", @"Misty Ruins"]}, @{@"1UP Cup":@[@"Snowy Circuit", @"Water Island", @"Calidae Desert", @"N64 Kalimari Desert"]}, @{@"Feather Cup":@[@"SNES Rainbow Road", @"Kinoko Cave", @"GCN Baby Park", @"Rainbow Dash Road"]}, @{@"Shine Sprite Cup":@[@"GBA Bowser Castle 1", @"Thwomp Factory", @"Green Grassroad", @"Mikoopa's Citadel"]}, @{@"Yoshi Egg Cup":@[@"GBA Mario Circuit", @"Rezway 2", @"Sunset Ridge", @"N64 Moo Moo Farm"]}, @{@"Stone Tanooki Cup":@[@"Stone Route", @"Snowy Circuit 2", @"Helado Mountain", @"Christmas Dream"]}, @{@"Birdo Egg Cup":@[@"Tree Circuit", @"N64 Koopa Troopa Beach", @"Sandcastle Park", @"Mushroom Valley"]}, @{@"Bowser Shell Cup":@[@"Punch City (RC2)", @"GCN Mushroom City", @"Coastal Island", @"Factory Course"]}, @{@"Metal Mushroom Cup":@[@"F-Zero Big Blue", @"F-Zero White Land 1", @"Sparkly Road", @"N64 Frappe Snowland"]}, @{@"Luigi Fireball Cup":@[@"GBA Luigi Circuit", @"Rooster Island", @"Petite Park", @"N64 Rainbow Road - Lunar Edition"]}, @{@"Pencil Cup":@[@"Red Loop", @"Green Loop", @"Blue Loop", @"Yellow Loop"]}, @{@"Grand Star Cup":@[@"Lunar Spaceway", @"Seaside Resort", @"GCN Mushroom Bridge", @"Sacred Fogcoast"]}, @{@"Boo Cup":@[@"GBA Boo Lake", @"Forsaken Mansion", @"Darkness Temple", @"Temple Bay"]}, @{@"Spin Drill Cup":@[@"Rock Rock Ridge", @"Alpine Mountain", @"SM64 Bob-Omb Battlefield", @"Volcano Beach 2"]}, @{@"Star Bits Cup":@[@"SADX Twinkle Circuit", @"Galaxy Base", @"Rosalina's Snow World", @"Digitally Enhanced"]}, @{@"Fire Cup":@[@"SNES Bowser Castle 1", @"SNES Bowser Castle 2 (v2)", @"SNES Bowser Castle 3 (v2)", @"Lava Road"]}, @{@"Cheep-Cheep Cup":@[@"SNES Koopa Beach 1", @"Sky Beach", @"Love Beach", @"Piranha Plant Pipeline"]}, @{@"Ice Bro Cup":@[@"Iceway", @"Alpine Circuit", @"DS DK Pass", @"GBA Snow Land"]}, @{@"Golden Flower Cup":@[@"Green Park", @"Jungle Island", @"Strobenz Desert", @"White Garden"]}, @{@"Question Block Cup":@[@"Retro Raceway", @"N64 Luigi Raceway", @"Abe Abbott Raceway", @"SNES Choco Island 1"]}, @{@"Cloud Flower Cup":@[@"Seasonal Circuit", @"Sunshine Yard", @"Lakeside Hill", @"Bouncy Farm"]}, @{@"Brick Block Cup":@[@"Cliff Village", @"Coral Cape", @"Delfino Circuit", @"Crystal Dungeon"]}, @{@"Blue Coin Cup":@[@"Aquadrom Stage", @"Athletic Raceway", @"Kirio Raceway", @"Penguin Cave"]}, @{@"Green Star Cup":@[@"Magma Island", @"DKR Ancient Lake", @"N64 Toad's Turnpike", @"N64 Wario Stadium"]}, @{@"Rainbow Cup":@[@"SNES Rainbow Road", @"GBA Rainbow Road", @"GCN Rainbow Road", @"SNES Rainbow Road"]}];
	
	return self;
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.tracks count]; // number of cups
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSDictionary *tmpCupDict = [self.tracks objectAtIndex:section];
	return [[tmpCupDict allKeys] lastObject];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *rtnCell = [tableView dequeueReusableCellWithIdentifier:@"kartCell"];
	
	if ( !rtnCell )
	{
		rtnCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kartCell"];
	}
	
	NSDictionary *tmpCupDict = [self.tracks objectAtIndex:indexPath.section];
	NSArray *tmpTracks = [tmpCupDict objectForKey:[[tmpCupDict allKeys] lastObject]];
	
	[rtnCell.textLabel setText:[tmpTracks objectAtIndex:indexPath.row]];

	return rtnCell;
}

@end
