//
//  FavoritesTableCellController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesTableCellControllerDelegate.h"

@interface FavoritesTableCellController : UITableViewCell 
{
    IBOutlet UILabel* nameLabel;
    id<FavoritesTableCellControllerDelegate> delegate; 
}

@property (nonatomic, assign) id<FavoritesTableCellControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;

- (IBAction)deleteButtonDidTouch:(id)sender;

@end
