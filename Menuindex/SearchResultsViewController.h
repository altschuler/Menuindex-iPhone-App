//
//  SearchResultsViewController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SearchServiceDelegate.h"
#import "SearchService.h"
#import "AnnotationMap.h"

@interface SearchResultsViewController : UIViewController<UITableViewDataSource, 
UITableViewDelegate, 
SearchServiceDelegate, 
UITextFieldDelegate,
AnnotationMapDelegate>
{
    IBOutlet UITextField *searchTextField;
    IBOutlet UITableView *resultsTableView;
    
    SearchService* searchService;
    NSArray* searchResults;
    NSString* initialSearchQuery;
    AnnotationMap* annotationMap;
    NSMutableArray* mapAnnotations;
    
}
- (IBAction)mapViewButtonDidTouch:(id)sender;

- (IBAction)listViewButtonDidTouch:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString*)searchQueryOrNil;

-(void)showFilterModal;

@end
