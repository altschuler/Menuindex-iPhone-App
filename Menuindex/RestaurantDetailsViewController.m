//
//  RestaurantDetailsViewController.m
//  Menuindex
//
//  Created by zupa-sia on 14/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "SearchResultModel.h"

@implementation RestaurantDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchResultModel:(SearchResultModel*)srm
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        searchService = [[SearchService alloc] init];
        
        [searchService setDelegate:self];
        
        if (srm != nil)
        {
            [nameLabel setText:srm.name];
            [searchService getDetailsFromId:srm.restaurantId];
        }
    }
    return self;
}

-(void)didRecieveRestaurantDetails:(DetailsModel *)details
{
    [nameLabel setText:details.name];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
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
    [super dealloc];
}
@end
