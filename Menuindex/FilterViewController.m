//
//  FilterViewController.m
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FilterViewController.h"

@implementation FilterViewController

@synthesize  delegate;

- (id) init
{
    self = [super initWithNibName:@"FilterView" bundle:nil];
    if (self)
    {
        
    }   
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(filterApply:)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    self.navigationItem.leftBarButtonItem = nil;
}

- (void) viewWillDisappear:(BOOL)animated
{
    
}

- (void)filterApply:(id)sender
{
    SearchFilterModel* sfm = [[SearchFilterModel alloc] init];
    sfm.hasTakeaway = hasTakeawaySwitch.enabled;
    [delegate filterDidApply:sfm];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)takeawaySwitchDidEdit:(id)sender {
}
- (void)dealloc {
    [hasTakeawaySwitch release];
    [super dealloc];
}
- (void)viewDidUnload {
    [hasTakeawaySwitch release];
    hasTakeawaySwitch = nil;
    [super viewDidUnload];
}
@end
