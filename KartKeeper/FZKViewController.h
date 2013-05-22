//
//  FZKViewController.h
//  KartKeeper
//
//  Created by Ian on 5/20/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FZKViewControllerFilterSelectionIndex) {
    FZKViewControllerFilterSelectionIndexAll,
    FZKViewControllerFilterSelectionIndexFavorites,
    FZKViewControllerFilterSelectionIndexRejects
};

@interface FZKViewController : UITableViewController

@property (nonatomic, weak) UISegmentedControl *filterControl;

@property (nonatomic, strong) NSArray *tracks;

@property (nonatomic, strong) NSMutableArray *favorites;
@property (nonatomic, strong) NSMutableArray *rejects;



@end
