//
//  MenuCardViewController.m
//  Menuindex
//
//  Created by zupa-sia on 23/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuCardViewController.h"

@implementation MenuCardViewController

- (id)init
{
    self = [super initWithNibName:@"MenuCardView" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)closeButtonDidTouch:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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
@end
