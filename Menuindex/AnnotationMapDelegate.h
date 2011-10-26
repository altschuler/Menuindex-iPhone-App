//
//  AnnotationMapDelegate.h
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnnotationMapDelegate <NSObject>

- (void)mapView:(MKMapView *)mapView didSelectAnnotationWithId:(NSString*)annotationId;

@end
