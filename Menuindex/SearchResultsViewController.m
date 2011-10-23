//
//  SearchResultsViewController.m
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "SearchResultsViewController.h"
#import "SearchService.h"
#import "SearchResultModel.h"
#import "SearchResultTableCellController.h"
#import "RestaurantDetailsViewController.h"
#import "RestaurantMapAnnotation.h"
#import "FilterViewController.h"
#import "SearchFilterModel.h"

@implementation SearchResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    annotationMap = [[AnnotationMap alloc] initWithMapViewFrame:resultsTableView.frame delegate:self];
    [self.view insertSubview:annotationMap.annotationMapView atIndex:20];
    annotationMap.annotationMapView.alpha = 0;
    
    //Do we have a query to search for?
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString *)searchQueryOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Søgeresultat";
        
        mapAnnotations = [[NSMutableArray alloc] init];
        
        searchService = [[SearchService alloc] init];
        [searchService setDelegate:self];
        
        initialSearchQuery = searchQueryOrNil;
        [initialSearchQuery retain];
        
        UIBarButtonItem *filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Filtrér" style:UIBarButtonItemStylePlain target:self action:@selector(showFilterModal)];          
        self.navigationItem.rightBarButtonItem = filterButton;
        
        [filterButton release];
    }
    return self;
}

-(void)filterDidApply:(SearchFilterModel*)filter
{
    NSLog(@"Set filter: %d", filter.hasTakeaway);
}

-(void)showFilterModal
{
    FilterViewController* filterViewController = [[FilterViewController alloc] init];
    
    [filterViewController setDelegate:self];
    
    [self.navigationController pushViewController:filterViewController animated:YES];
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    //NSLog(view.description);
}

-(void)viewDidAppear:(BOOL)animated
{
    if (initialSearchQuery != nil)
    {
        [searchTextField setText:initialSearchQuery];
        [searchService searchForQuery:initialSearchQuery];
    }
}

- (IBAction)mapViewButtonDidTouch:(id)sender 
{
    [UIView beginAnimations:nil context:NULL];
    annotationMap.annotationMapView.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)listViewButtonDidTouch:(id)sender 
{
    [UIView beginAnimations:nil context:NULL];
    annotationMap.annotationMapView.alpha = 0;
    [UIView commitAnimations];
}

-(void)didRecieveSearchResult:(NSArray *)result
{
    searchResults = result;
    
    [annotationMap setNewAnnotations:searchResults];
    [annotationMap fitZoomToAnnotations];
    
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
    
    RestaurantDetailsViewController*  rdvc = [[RestaurantDetailsViewController alloc] initWithNibName:@"RestaurantDetailsView" bundle:nil restaurantId:srm.restaurantId];

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.navigationController pushViewController:rdvc animated:YES];
    
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
    
    SearchResultTableCellController* cell = (SearchResultTableCellController*)[tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil)
    {
        NSArray* cellViews = [[NSBundle mainBundle] loadNibNamed:@"TableCells" owner:nil options:nil];
        
        for (id cellView in cellViews)
        {
            if ([cellView isKindOfClass:[SearchResultTableCellController class]])
            {
                cell = (SearchResultTableCellController*)cellView;
                break;
            }
        }
    }
    
    SearchResultModel* searchResultModel = [searchResults objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = searchResultModel.name;
    NSString* address = [[NSString alloc] initWithFormat:@"%@ %@, %@ %@",searchResultModel.addressStreet,searchResultModel.addressHouseNumber,searchResultModel.addressZip,searchResultModel.addressCity];
    cell.adressLabel.text = address;
    
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
