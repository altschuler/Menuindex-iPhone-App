//
//  AnnotationMapView.m
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnnotationMap.h"
#import "RestaurantMapAnnotation.h"
#import "Locatable.h"
#import "MapInfoBoxView.h"

@implementation AnnotationMap

@synthesize annotationMapView;
@synthesize annotations;

- (id)initWithMapViewFrame:(CGRect)frame delegate:(id<AnnotationMapDelegate>)delegateOrNil
{
    self = [super init];
    if (self) 
    {    
        annotationMapView = [[MKMapView alloc] initWithFrame:frame];
        [annotationMapView setDelegate:self];
        
        annotations = [[NSMutableArray alloc] init];
        
        delegate = delegateOrNil;
    }
    
    return self;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"RestaurantAnnotation"];
    annView.pinColor = 1;
    annView.animatesDrop = TRUE;
    annView.canShowCallout = YES;
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:self
                    action:@selector(annotationSelected:)
          forControlEvents:UIControlEventTouchUpInside];
    annView.rightCalloutAccessoryView = rightButton;
    
    [rightButton release];
    
    return annView;
}

-(void)annotationSelected:(id)sender
{
   id annView = [[sender superview] superview];
    RestaurantMapAnnotation* rma = [annView annotation];
    [delegate mapView:annotationMapView didSelectAnnotationWithId:rma.ID];
}

-(void) setNewAnnotations:(NSArray *)objects
{
    [annotationMapView removeAnnotations:[annotationMapView annotations]];
    
    for (id<MKAnnotation> ann in annotations) 
    {
        [ann release];
    }
    
    [annotations removeAllObjects];
    
    for (id<Locatable> loc in objects) 
    {
        CLLocationCoordinate2D coord = {.latitude = loc.latitude, .longitude = loc.longitude};
        RestaurantMapAnnotation* r = [[RestaurantMapAnnotation alloc] initWithCoordinate:coord];
        r.title = loc.title;
        r.subtitle = loc.subtitle;
        r.ID = loc.ID;
        [annotations addObject:r];
        
        [r release];
    }
    
    [annotationMapView addAnnotations:annotations];
}

- (void) fitZoomToAnnotations
{
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in annotationMapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(zoomRect)) {
            zoomRect = pointRect;
        } else {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
    [annotationMapView setVisibleMapRect:zoomRect animated:YES];
}

@end
