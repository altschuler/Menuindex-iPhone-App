//
//  RestaurantMapAnnotation.m
//  Menuindex
//
//  Created by zupa-sia on 16/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RestaurantMapAnnotation.h"

@implementation RestaurantMapAnnotation

@synthesize ID;
@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
    }
    
    return self;
}

- (id) initWithCoordinate:(CLLocationCoordinate2D)coord
{
    coordinate = coord;
    self = [super init];
    return self;
}

@end
