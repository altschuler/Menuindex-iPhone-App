//
//  FavoritesViewController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesController.h"
#import "FavoritesTableCellControllerDelegate.h"

@interface FavoritesViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, FavoritesTableCellControllerDelegate>
{
    IBOutlet UITableView *favoritesTableView;
}

- (IBAction)nearbyButtonDidTouch:(id)sender;
- (IBAction)allButtonDidTouch:(id)sender;

@end
