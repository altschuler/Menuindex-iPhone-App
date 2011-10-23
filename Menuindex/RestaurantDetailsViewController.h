//
//  RestaurantDetailsViewController.h
//  Menuindex
//
//  Created by zupa-sia on 14/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchService.h"
#import "SearchServiceDelegate.h"
#import "SearchResultModel.h"
#import "RestaurantDetailsModel.h"

@interface RestaurantDetailsViewController : UIViewController <SearchServiceDelegate>
{
    IBOutlet UILabel* nameLabel;
    IBOutlet UIButton* addToFavoritesButton;
    IBOutlet UIView* favoriteIcon;
    
    SearchService* searchService;
    SearchResultModel* detailsModel;
    NSString* restaurantId;
}

-(void)updateUI;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil restaurantId:(NSString*)restaurantIdOrNil;

- (IBAction)addToFavoritesButtonDidTouch:(id)sender;

@end
