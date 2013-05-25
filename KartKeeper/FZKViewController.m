//
//  FZKViewController.m
//  KartKeeper
//
//  Created by Ian on 5/20/13.
//  Copyright (c) 2013 Fuzz Productions. All rights reserved.
//

#import "FZKViewController.h"

#import "FZKDataStore.h"
#import "FZKCup.h"

@interface FZKViewController ()
{
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
    
    CGPoint *_scrollUndoPosition;
}

@property (nonatomic, strong) NSArray *tracks;

@end

@implementation FZKViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	
	self.title = @"KartKeeper CTGP";
    
	
//	UISegmentedControl *tmpTrackListFilter = [[UISegmentedControl alloc] initWithItems:@[@"Standard", @"Wacky"]];
//	[tmpTrackListFilter setSegmentedControlStyle:UISegmentedControlStyleBar];
//	[tmpTrackListFilter setSelectedSegmentIndex:1];
//	[self.navigationItem setTitleView:tmpTrackListFilter];

	// toolbar
	UISegmentedControl *tmpFavoritesFilter = [[UISegmentedControl alloc] initWithItems:@[@"All Tracks", @"Favorites", @"Rejects"]];
	[tmpFavoritesFilter addTarget:self action:@selector(filterSelectionChanged:) forControlEvents:UIControlEventValueChanged];
    [tmpFavoritesFilter setSegmentedControlStyle:UISegmentedControlStyleBar];
	[tmpFavoritesFilter setSelectedSegmentIndex:FZKViewControllerFilterSelectionIndexAll];
	CGRect tmpFavoritesFrame = tmpFavoritesFilter.frame;
	tmpFavoritesFrame.size.width = 250;
	[tmpFavoritesFilter setFrame:tmpFavoritesFrame];
    [self setFilterControl:tmpFavoritesFilter];
	
	// UIBarButtonItem *tmpLeftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
	UIBarButtonItem *tmpLeftSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	UIBarButtonItem *tmpFavoritesControl = [[UIBarButtonItem alloc] initWithCustomView:tmpFavoritesFilter];
	UIBarButtonItem *tmpRightSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	// UIBarButtonItem *tmpRightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];

	[self setToolbarItems:@[tmpLeftSpace, tmpFavoritesControl, tmpRightSpace]];
	
    // set the data source for the table!
    self.dataSource = [FZKDataStore cups];
    
    // and set up a search bar and filter
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    [searchBar sizeToFit];
    [searchBar setDelegate:self];
    [searchBar setPlaceholder:@"Search"];;
    // [searchBar setScopeButtonTitles:@[@"All",@"Favorites", @"Rejects"]]; // to add tabs to modal search presentation. overkill for now.
    [self.tableView setTableHeaderView:searchBar];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    [searchDisplayController setDelegate:self];
    [searchDisplayController setSearchResultsDataSource:self];
    [searchDisplayController setSearchResultsDelegate:self];
	
    
	return self;
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    // we don't want to scroll to the *top*, becuase that'll expose the serach bar.
    // so we're going to go to the first row ourselves
    [self.tableView setContentOffset:CGPointMake(0, 44) animated:YES];

    // so we don't need to do the usual
    return NO;
}

#pragma mark - Utilities
- (void)filterSelectionChanged:(UISegmentedControl *)sender
{   // set a filter predicate based on the selected segment
    
    switch ( sender.selectedSegmentIndex )
    {
        case FZKViewControllerFilterSelectionIndexFavorites:
            // set a filter for favorites.
            self.filterPredicate = [self favoriteFilterPredicate];
            break;
            
        case FZKViewControllerFilterSelectionIndexRejects:
            // set a filter for rejects.
            self.filterPredicate = [self rejectFilterPredicate];
            break;
            
        case FZKViewControllerFilterSelectionIndexAll:
        default:
            // make sure no filter is set
            self.filterPredicate = nil;
            break;
    }
    
    // if the search bar is showing, hide it
    if ( self.tableView.contentOffset.y < 44 )
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    
    // reload all sections
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView])]
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (NSPredicate *)favoriteFilterPredicate
{
    return [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
            {
                BOOL testStatus = NO; // default fail
                
                if ( [evaluatedObject respondsToSelector:@selector(favorite)] ) // check for a `favorite` accessor method
                    testStatus = [evaluatedObject favorite]; // and test against it
                
                return testStatus;
            }];
}

- (NSPredicate *)rejectFilterPredicate
{
    return [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
            {
                BOOL testStatus = NO; // default fail
                
                if ( [evaluatedObject respondsToSelector:@selector(reject)] ) // check for a `reject`  accessor method
                    testStatus = [evaluatedObject reject]; // and test against it
                
                return testStatus;
            }];
}

- (NSPredicate *)searchFilterPredicateForString:(NSString *)searchString
{
    return [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchString];
}

- (UIView *)star
{
	UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
	[tmpLabel setTextAlignment:NSTextAlignmentCenter];
	[tmpLabel setBackgroundColor:[UIColor clearColor]];
	
	[tmpLabel setText:@"🌟"];
	
	return tmpLabel;
}

- (UIView *)poo
{
	UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
	[tmpLabel setTextAlignment:NSTextAlignmentCenter];
	[tmpLabel setBackgroundColor:[UIColor clearColor]];
	
	[tmpLabel setText:@"💩"];
	
	return tmpLabel;
}

#pragma mark - Filtering
#pragma mark - UISearchDisplayController Delegate Methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self setupFilterForString:searchString];

    return YES;
}

-(void)setupFilterForString:(NSString*)filterString
{
    if ( filterString.length > 0 )
    {
        // see if we need to combine our search filter with a tab-based filter
        switch ( self.filterControl.selectedSegmentIndex ) {
            case FZKViewControllerFilterSelectionIndexFavorites:
                // search the favorites
                self.filterPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[[self favoriteFilterPredicate], [self searchFilterPredicateForString:filterString]]];
                break;
                
            case FZKViewControllerFilterSelectionIndexRejects:
                // search the rejects
                self.filterPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[[self rejectFilterPredicate], [self searchFilterPredicateForString:filterString]]];
                break;
                
            case FZKViewControllerFilterSelectionIndexAll:
            default:
                // just search by name
                self.filterPredicate = [self searchFilterPredicateForString:filterString];
                break;
                
        }
    }
    else
    { 
        // make sure we have clean cup and track data in the data source
        self.dataSource = [FZKDataStore cups];
        
        // and a filter predicate based on the tab bar
        [self filterSelectionChanged:self.filterControl];
    }

    // reload all sections
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView])]
                  withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // make sure we have clean cup and track data in the data source
    self.dataSource = [FZKDataStore cups];
    
    // and that the filter predicate is based on the tab bar
    [self filterSelectionChanged:self.filterControl];

    // and finally, reload all sections
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView])]
                  withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Scroll View
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [searchBar resignFirstResponder];
}

#pragma mark - Table View

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.dataSource count]; // number of cups
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rtnCount = 0;
	
    if ( [[self.dataSource objectAtIndex:section] isKindOfClass:[FZKCup class]] )
    {
        FZKCup *tmpCup = (FZKCup *)[self.dataSource objectAtIndex:section];

        if ( self.filterPredicate )
            rtnCount = [tmpCup.tracks filteredArrayUsingPredicate:self.filterPredicate].count;
        else
            rtnCount = tmpCup.tracks.count;
    }
    
    return rtnCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *rtnString = nil;

    if ( [[self.dataSource objectAtIndex:section] isKindOfClass:[FZKCup class]] )
    {
        FZKCup *tmpCup = (FZKCup *)[self.dataSource objectAtIndex:section];
        rtnString = tmpCup.name;
    }
    
    return rtnString;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *rtnCell = [tableView dequeueReusableCellWithIdentifier:@"kartCell"];
	
	if ( !rtnCell )
	{
		rtnCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kartCell"];
	}
    
    // temporary pointer to the array we're using for this section
	NSArray *tmpSectionArray = nil;
    
    if ( [[self.dataSource objectAtIndex:indexPath.section] isKindOfClass:[FZKCup class]] )
    {
        FZKCup *tmpCup = (FZKCup *)[self.dataSource objectAtIndex:indexPath.section];
        
        if ( self.filterPredicate )
            tmpSectionArray = [tmpCup.tracks filteredArrayUsingPredicate:self.filterPredicate] ;
        else
            tmpSectionArray = tmpCup.tracks;
        
        
        FZKTrack *tmpTrack = [tmpSectionArray objectAtIndex:indexPath.row];
        
        if ( [tmpTrack isKindOfClass:[FZKTrack class]] )
        {
            [rtnCell.textLabel setText:tmpTrack.name];
            
            if ( tmpTrack.favorite )
            {
                // add star
                [rtnCell setAccessoryView:self.star];
            }
            else if ( tmpTrack.reject )
            {
                // add poo
                [rtnCell setAccessoryView:self.poo];
            }
            else
            {
                [rtnCell setAccessoryView:nil];
            }
            
        }
        
    }

	
	return rtnCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rtnHeight = 44.0f; // default
    
    return rtnHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( [[self.dataSource objectAtIndex:indexPath.section] isKindOfClass:[FZKCup class]] )
    {
        // temporary pointer to the array we're using for this section
        NSArray *tmpSectionArray = nil;

        FZKCup *tmpCup = (FZKCup *)[self.dataSource objectAtIndex:indexPath.section];
        
        if ( self.filterPredicate )
            tmpSectionArray = [tmpCup.tracks filteredArrayUsingPredicate:self.filterPredicate] ;
        else
            tmpSectionArray = tmpCup.tracks;
        
        
        FZKTrack *tmpTrack = [tmpSectionArray objectAtIndex:indexPath.row];
        
        if ( [tmpTrack isKindOfClass:[FZKTrack class]] )
        {
            // edit the track!
            if ( tmpTrack.favorite )
            {
                tmpTrack.favorite = NO;
                tmpTrack.reject = YES;
            }
            else if ( tmpTrack.reject )
            {
                tmpTrack.reject = NO;
                tmpTrack.favorite = NO;
            }
            else
            {
                tmpTrack.favorite = YES;
                tmpTrack.reject = NO;
            }
        }
    }
    
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
