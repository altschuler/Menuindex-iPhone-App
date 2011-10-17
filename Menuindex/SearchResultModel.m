//
//  SearchResultModel.m
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultModel.h"

@implementation SearchResultModel

@synthesize restaurantId;
@synthesize name;
@synthesize nameExtension;
@synthesize hasTakeaway;
@synthesize hasDelivery;
@synthesize isOpen;

@synthesize addressStreet;
@synthesize addressHouseNumber;
@synthesize addressZip;
@synthesize addressCity;

@synthesize telephoneNumber;
@synthesize telephoneCountryCode;
@synthesize telephoneNote;

@synthesize latitude;
@synthesize longitude;

- (id)initWithTitle:(NSString*)titleOrNil andResultId:(NSString*)resultIdOrNil
{
    if ([self init]) {
        restaurantId = resultIdOrNil;
        name = titleOrNil;
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
