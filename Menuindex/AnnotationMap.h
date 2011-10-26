//
//  AnnotationMapView.h
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
#import "AnnotationMapDelegate.h"

@interface AnnotationMap : NSObject <MKMapViewDelegate>
{
    MKMapView* annotationMapView;
    NSMutableArray* annotations;
    id<AnnotationMapDelegate> delegate;
}

@property (nonatomic, readonly) MKMapView* annotationMapView;
@property (nonatomic, retain) NSMutableArray* annotations;

- (id)initWithMapViewFrame:(CGRect)frame delegate:(id<AnnotationMapDelegate>)delegateOrNil;

-(void) fitZoomToAnnotations;
-(void) setNewAnnotations:(NSArray*)objects;
-(void)annotationSelected:(id)sender;

@end
