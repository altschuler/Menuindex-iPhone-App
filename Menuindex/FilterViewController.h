//
//  FilterViewController.h
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewDelegate.h"

@interface FilterViewController : UIViewController
{
    IBOutlet UISwitch* hasTakeawaySwitch;
    id<FilterViewDelegate> delegate;
}

@property (nonatomic, assign) id<FilterViewDelegate> delegate;

@end
