//
//  SecondViewController.m
//  Menuindex
//
//  Created by zupa-sia on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "MapInfoBoxView.h"

@implementation MapViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Kort";
        
        annotationMap = [[AnnotationMap alloc] initWithMapViewFrame:self.view.frame delegate:self];
        [self.view insertSubview:annotationMap.annotationMapView belowSubview:centerButton];
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationWithId:(NSString*)annotationId
{
    NSLog(@"ID: %@", annotationId);
}

- (IBAction)centerButtonDidTouch:(id)sender
{
    annotationMap.annotationMapView.showsUserLocation = YES;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
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
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
