//
//  FilterViewController.m
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FilterViewController.h"

@implementation FilterViewController

@synthesize  delegate, searchFilterModel;

- (id) init
{
    self = [super initWithNibName:@"FilterView" bundle:nil];
    if (self)
    {
        searchFilterModel = [[SearchFilterModel alloc] init];
    }   
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)closeButtonDidTouch:(id)sender
{
    [delegate filterShouldClose];
}

- (IBAction)filterUIChanged:(id)sender 
{
    [self updateFilterModel];
    [delegate filterDidUpdate:searchFilterModel]; 
}

- (void) viewWillDisappear:(BOOL)animated
{
}

-(void)updateFilterModel
{
    searchFilterModel.hasTakeaway = hasTakeawaySwitch.isOn;
    searchFilterModel.isOpen = isOpenSwitch.isOn;
}

- (void)filterApply:(id)sender
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)dealloc 
{
    [hasTakeawaySwitch release];
    [isOpenSwitch release];
    [super dealloc];
}

- (void)viewDidUnload 
{
    [hasTakeawaySwitch release];
    hasTakeawaySwitch = nil;
    [isOpenSwitch release];
    isOpenSwitch = nil;
    [super viewDidUnload];
}
@end
