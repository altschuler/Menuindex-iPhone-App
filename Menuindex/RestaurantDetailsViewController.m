//
//  RestaurantDetailsViewController.m
//  Menuindex
//
//  Created by zupa-sia on 14/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "SearchResultModel.h"
#import "FavoritesController.h"

@implementation RestaurantDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil restaurantId:(NSString*)restaurantIdOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        searchService = [[SearchService alloc] init];
        
        [searchService setDelegate:self];
        
        restaurantId = restaurantIdOrNil;
    }
    return self;
}

-(IBAction)addToFavoritesButtonDidTouch:(id)sender
{
    FavoritesEntryModel* favModel = [[FavoritesEntryModel alloc] init];
    favModel.restaurantId = restaurantId;
    
    [[FavoritesController getInstance] addFavorite:favModel];
    
    [self updateUI];
//    [favModel release];
}

-(void)didRecieveRestaurantDetails:(RestaurantDetailsModel *)details
{
    //[nameLabel setText:details.name];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self updateUI];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)updateUI
{
    if (restaurantId != nil)
    { 
        [nameLabel setText:restaurantId];
    
        BOOL isFavorite = [[FavoritesController getInstance] favoriteExistsForRestaurantWithId:restaurantId];
        
        addToFavoritesButton.hidden = isFavorite;
        favoriteIcon.hidden = !isFavorite;
           
    }
}

- (void)viewDidUnload
{
    [addToFavoritesButton release];
    addToFavoritesButton = nil;
    [favoriteIcon release];
    favoriteIcon = nil;
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
    [nameLabel release];
    [addToFavoritesButton release];
    [favoriteIcon release];
    [super dealloc];
}
@end
