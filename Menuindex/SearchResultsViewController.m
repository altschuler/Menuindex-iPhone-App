//
//  SearchResultsViewController.m
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultsViewController.h"
#import "SearchService.h"
#import "SearchResultModel.h"
#import "SearchResultTableViewCellController.h"
#import "RestaurantDetailsViewController.h"

@implementation SearchResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Do we have a query to search for?
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    if (initialSearchQuery != nil)
    {
        [searchTextField setText:initialSearchQuery];
        [searchService searchForQuery:initialSearchQuery];
    }
    
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString *)searchQueryOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Søgeresultat";
        
        searchService = [[SearchService alloc] init];
        [searchService setDelegate:self];
        
        initialSearchQuery = searchQueryOrNil;
        [initialSearchQuery retain];
    }
    return self;
}

-(void)didRecieveSearchResult:(NSArray *)result
{
    searchResults = result;
    
    [resultsTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searchResults == nil)
    {
        return 0;
    }
    
    return searchResults.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultModel* srm = [searchResults objectAtIndex:indexPath.row];
    
    RestaurantDetailsViewController*  rdvc = [[RestaurantDetailsViewController alloc] initWithNibName:@"RestaurantDetailsView" bundle:nil searchResultModel:srm];

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [[self navigationController] pushViewController:rdvc animated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [searchTextField resignFirstResponder];
    
    [searchService searchForQuery:textField.text];
    
    return YES;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseId = @"SearchResultCell";
    
    SearchResultTableViewCellController* cell = (SearchResultTableViewCellController*)[tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil)
    {
        NSArray* nibArray = [[NSBundle mainBundle] loadNibNamed:@"SearchResultTableCell" owner:nil options:nil];
        
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        
        for (id nib in nibArray)
        {
            if ([nib isKindOfClass:[SearchResultTableViewCellController class]])
            {
                cell = (SearchResultTableViewCellController*)nib;
                break;
            }
        }
    }
    
    SearchResultModel* searchResultModel = [searchResults objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = searchResultModel.name;
    cell.adressLabel.text = searchResultModel.restaurantId;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [searchTextField release];
    searchTextField = nil;
    [resultsTableView release];
    resultsTableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [searchTextField release];
    [resultsTableView release];
    [super dealloc];
}
@end
