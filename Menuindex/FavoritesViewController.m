//
//  FavoritesViewController.m
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesViewController.h"
#import "FavoritesTableCellController.h"
#import "FavoritesEntryModel.h"
#import "RestaurantDetailsViewController.h"

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Favoritter";
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [FavoritesController getInstance].favoritesList.count;
}

-(UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseId = @"FavoriteCell";
    
    FavoritesTableCellController* cell = (FavoritesTableCellController*)[tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil)
    {
        NSArray* cellViews = [[NSBundle mainBundle] loadNibNamed:@"TableCells" owner:nil options:nil];
        
        for (id cellView in cellViews)
        {
            if ([cellView isKindOfClass:[FavoritesTableCellController class]])
            {
                cell = (FavoritesTableCellController*)cellView;
                break;
            }
        }
    }
    
    FavoritesEntryModel* fav = [[FavoritesController getInstance].favoritesList objectAtIndex:indexPath.row];
    
    NSString* label = [[NSString alloc] initWithFormat:@"Restaurant: %@", fav.restaurantId];
    
    cell.nameLabel.text = label;
    [cell setDelegate:self];
    [label release];
    
    return cell;
}

-(void)deleteButtonDidTouchFromCell:(UITableViewCell *)cell
{
    NSIndexPath* indexPath = [favoritesTableView indexPathForCell:cell];
    
    FavoritesEntryModel* fav = [[FavoritesController getInstance].favoritesList objectAtIndex:indexPath.row];
    
    [[FavoritesController getInstance] removeFavoriteWithRestaurantId:fav.restaurantId];
    
    [favoritesTableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FavoritesEntryModel* favModel = [[FavoritesController getInstance].favoritesList objectAtIndex:indexPath.row];
    
    RestaurantDetailsViewController*  rdvc = [[RestaurantDetailsViewController alloc] initWithNibName:@"RestaurantDetailsView" bundle:nil restaurantId:favModel.restaurantId];
    
    [self.navigationController pushViewController:rdvc animated:YES];
}

- (IBAction)nearbyButtonDidTouch:(id)sender
{
    
}

- (IBAction)allButtonDidTouch:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void) viewWillAppear:(BOOL)animated
{
    [favoritesTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [favoritesTableView release];
    favoritesTableView = nil;
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
    [favoritesTableView release];
    [super dealloc];
}
@end
