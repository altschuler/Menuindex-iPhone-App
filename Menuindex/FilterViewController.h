//
//  FilterViewController.h
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewDelegate.h"
#import "SearchFilterModel.h"

@interface FilterViewController : UIViewController
{
    IBOutlet UISwitch* hasTakeawaySwitch;
    IBOutlet UISwitch *isOpenSwitch;
    
    SearchFilterModel* searchFilterModel;
    
    id<FilterViewDelegate> delegate;
}

@property (nonatomic, assign) id<FilterViewDelegate> delegate;
@property (nonatomic, retain) SearchFilterModel* searchFilterModel;

- (IBAction)closeButtonDidTouch:(id)sender;
- (IBAction)filterUIChanged:(id)sender;

- (void)updateFilterModel;

@end
