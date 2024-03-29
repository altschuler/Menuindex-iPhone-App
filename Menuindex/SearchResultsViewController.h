//
//  SearchResultsViewController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FilterViewDelegate.h"
#import "SearchServiceDelegate.h"
#import "SearchService.h"
#import "AnnotationMap.h"
#import "FilterViewController.h"

@interface SearchResultsViewController : UIViewController<UITableViewDataSource, 
UITableViewDelegate, 
SearchServiceDelegate, 
UITextFieldDelegate,
AnnotationMapDelegate,
FilterViewDelegate>
{
    IBOutlet UITextField *searchTextField;
    IBOutlet UITableView *resultsTableView;
    
    FilterViewController* filterViewController;
    SearchService* searchService;
    NSArray* searchResults;
    NSString* initialSearchQuery;
    AnnotationMap* annotationMap;
    NSMutableArray* mapAnnotations;
    
}
- (IBAction)mapViewButtonDidTouch:(id)sender;

- (IBAction)listViewButtonDidTouch:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString*)searchQueryOrNil;

-(void)showFilterView;

@end
