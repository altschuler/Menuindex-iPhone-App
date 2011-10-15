//
//  SearchResultsViewController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchServiceDelegate.h"
#import "SearchService.h"

@interface SearchResultsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, SearchServiceDelegate, UITextFieldDelegate>
{
    IBOutlet UITextField *searchTextField;
    
    SearchService* searchService;
    NSArray* searchResults;
    NSString* initialSearchQuery;
    
    IBOutlet UITableView *resultsTableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString*)searchQueryOrNil;

@end
