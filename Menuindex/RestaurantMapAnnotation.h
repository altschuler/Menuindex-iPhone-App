//
//  RestaurantMapAnnotation.h
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface RestaurantMapAnnotation : NSObject <MKAnnotation>
{
    NSString* ID;
    NSString* title;
    NSString* subtitle;
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString* ID;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id) initWithCoordinate:(CLLocationCoordinate2D)coord;

@end
