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
#import "NavigationTopView.h"

@implementation SearchResultsViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchQuery:(NSString *)searchQueryOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Søgeresultat";
        
        NSArray* viewsInNib = [[NSBundle mainBundle] loadNibNamed:@"Misc" owner:nil options:nil];
        
        NavigationTopView* navigationTopView;
        for (id view in viewsInNib) 
        {
            if ([view isKindOfClass:[NavigationTopView class]])
            {
                navigationTopView = view;
                break;
            }
        }
        self.navigationItem.titleView = navigationTopView;
        [navigationTopView release];
        
        mapAnnotations = [[NSMutableArray alloc] init];
        
        searchService = [[SearchService alloc] init];
        [searchService setDelegate:self];
        
        initialSearchQuery = searchQueryOrNil;
        [initialSearchQuery retain];
        
        UIBarButtonItem *filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Filtrér" style:UIBarButtonItemStylePlain target:self action:@selector(showFilterView)];          
        self.navigationItem.rightBarButtonItem = filterButton;
        
        [filterButton release];
    }
    return self;
}

#pragma mark - View delegate methods
- (void)viewDidLoad
{   
    annotationMap = [[AnnotationMap alloc] initWithMapViewFrame:resultsTableView.frame delegate:self];
    
    [self.view insertSubview:annotationMap.annotationMapView atIndex:20];
    annotationMap.annotationMapView.alpha = 0;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated
{
    if (initialSearchQuery != nil)
    {
        [searchTextField setText:initialSearchQuery];
        [searchService searchForQuery:initialSearchQuery withFilter:filterViewController.searchFilterModel];
        initialSearchQuery = nil;
    }
}

#pragma mark - Filter delegate methods
-(void)filterDidUpdate:(SearchFilterModel*)filter
{
    //TODO apply to search
}

-(void)filterShouldClose
{
    [UIView beginAnimations:nil context:NULL];
    
    CGPoint pos = filterViewController.view.center;
    pos.x = -filterViewController.view.bounds.size.width/2;
    filterViewController.view.center = pos;
    
    [UIView commitAnimations];
    
    [filterViewController.view removeFromSuperview];
}

-(void)showFilterView
{   
    if (filterViewController == nil)
    {
        filterViewController = [[FilterViewController alloc] init];
        
        [filterViewController setDelegate:self];
        CGPoint initPos = filterViewController.view.center;
        initPos.x = -filterViewController.view.bounds.size.width/2;
        filterViewController.view.center = initPos;
        
        [self.view insertSubview:filterViewController.view atIndex:20];
    }
    
    [UIView beginAnimations:nil context:NULL];
    
    CGPoint pos = filterViewController.view.center;
    pos.x = filterViewController.view.bounds.size.width/2;
    filterViewController.view.center = pos;
    
    [UIView commitAnimations];
}

#pragma mark - Map delegate methods
-(void)mapView:(MKMapView *)mapView didSelectAnnotationWithId:(NSString *)annotationId
{
    RestaurantDetailsViewController*  rdvc = [[RestaurantDetailsViewController alloc] initWithNibName:@"RestaurantDetailsView" bundle:nil restaurantId:annotationId];
    
    [self.navigationController pushViewController:rdvc animated:YES];
    
    [rdvc release];
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
    
    [rdvc release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [searchTextField resignFirstResponder];
    
    [searchService searchForQuery:textField.text withFilter:filterViewController.searchFilterModel];
    
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

    [address release];
    
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
    [searchService release];
    searchService = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{
    [searchService release];
    [searchTextField release];
    [resultsTableView release];
    [super dealloc];
}
@end
