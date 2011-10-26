//
//  FirstViewController.m
//  Menuindex
//
//  Created by zupa-sia on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultsViewController.h"

@implementation SearchViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Søg";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    SearchResultsViewController* searchResultVC = [[SearchResultsViewController alloc] initWithNibName:@"SearchResultsView" bundle:nil searchQuery:textField.text];
    
    [searchTextField resignFirstResponder];
    
    [self.navigationController pushViewController:searchResultVC animated:YES];

    [searchResultVC release];
    
    return YES;
}

-(IBAction)backgroundTouch:(id)sender
{
    [searchTextField resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [searchTextField release];
    searchTextField = nil;
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [searchTextField release];
    [super dealloc];
}
@end
