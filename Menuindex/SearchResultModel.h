//
//  SearchResultModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Locatable.h"

@interface SearchResultModel : NSObject <Locatable>
{
    NSString* restaurantId;
    NSString* name;
    NSString* nameExtension;
    BOOL hasTakeaway;
    BOOL hasDelivery;
    BOOL isOpen;
    
    NSString* addressStreet;
    NSString* addressHouseNumber;
    NSString* addressZip;
    NSString* addressCity;
    NSString* addressLatitude;
    NSString* addressLongitude;
    
    NSString* telephoneNumber;
    NSString* telephoneCountryCode;
    NSString* telephoneNote;
    
    double latitude;
    double longitude;
}

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@property (nonatomic, copy) NSString* restaurantId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* nameExtension;
@property (nonatomic) BOOL hasTakeaway;
@property (nonatomic) BOOL hasDelivery;
@property (nonatomic) BOOL isOpen;

@property (nonatomic, copy) NSString* addressStreet;
@property (nonatomic, copy) NSString* addressHouseNumber;
@property (nonatomic, copy) NSString* addressZip;
@property (nonatomic, copy) NSString* addressCity;

@property (nonatomic, copy) NSString* telephoneNumber;
@property (nonatomic, copy) NSString* telephoneCountryCode;
@property (nonatomic, copy) NSString* telephoneNote;

 
@end
