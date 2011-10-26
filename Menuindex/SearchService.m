//
//  SearchService.m
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchService.h"
#import "SearchResultModel.h"
#import "MenuCardModel.h"
#import "MenuCardGroupModel.h"
#import "MenuCardEntryModel.h"

@implementation SearchService

@synthesize delegate;

- (id)init
{
    self = [super init];
    if (self) 
    {
        resultParser = [[ResultParser alloc] init];
    }
    
    return self;
}

-(void) getDetailsFromId:(NSString *)resultId
{
//    NSString* searchQuery = [[NSString alloc] initWithFormat:@"http://10.13.37.124:7538/data/restaurant/%@",resultId];
//    NSURL* searchURL = [NSURL URLWithString:searchQuery];
//    
//    NSString* searchResponse = [[NSString alloc] initWithContentsOfURL:searchURL];
//    
//    NSArray* results = [resultParser parseDetailsString:searchResponse];
//    
//    [delegate didRecieveSearchResult:results];
}
 
- (void) searchForQuery:(NSString*)query withFilter:(SearchFilterModel*)filter
{
   // NSString* searchQuery = [[NSString alloc] initWithFormat:@"http://10.13.37.124:7538/data/search/%@",query];
  //  NSURL* searchURL = [NSURL URLWithString:searchQuery];
    
   // NSString* searchResponse = [[NSString alloc] initWithContentsOfURL:searchURL];
    
    NSMutableString* searchResponse = [NSMutableString string];
                                       
    [searchResponse appendString:@"<ArrayOfRestaurantSearchResult xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>    <RestaurantSearchResult RestaurantId='5' Name='Grønhøj Strand Camping' HasTakeaway='false' HasDelivery='false' IsOpen='false'>    <Address Street='Kettrupvej' HouseNumber='125' Zip='9480' City='Løkken' Latitude='57.320949554443359' Longitude='9.6763448715209961'/><Phone Number='12341234' CountryCode='45' Note='karryes'/></RestaurantSearchResult><RestaurantSearchResult RestaurantId='6' Name='La Sosta Pizzaria ' NameExtension='Og Grillbar' HasTakeaway='false' HasDelivery='false' IsOpen='false'><Address Street='Carlshøjvej' HouseNumber='49' Zip='2800' City='Kongens Lyngby' Latitude='55.778587341308594' Longitude='12.515510559082031'/>    <Phone Number='45870479' CountryCode='45' Note='afhentning'/>    </RestaurantSearchResult>    <RestaurantSearchResult RestaurantId='9' Name='Center Pizza House V/ Mustafa Kiraz' NameExtension='dsd' HasTakeaway='false' HasDelivery='false' IsOpen='false'>    <Address Street='Ugandavej' HouseNumber='111' Zip='2770' City='Kastrup' Latitude='55.603546142578125' Longitude='12.585481643676758'/>    <Phone Number='0' CountryCode='45' Note='Eventuel bemærkning'/>    </RestaurantSearchResult>    <RestaurantSearchResult RestaurantId='12' Name='Ali Baba' NameExtension='gsdfgsdfg' HasTakeaway='false' HasDelivery='false' IsOpen='false'>    <Address Street='sdfgsdfg' HouseNumber='12' Zip='3480' City='Fredensborg' Latitude='55.974685668945312' Longitude='12.405835151672363'/>    <Phone Number='48482030' CountryCode='45' Note='Eventuel beskrivelse'/></RestaurantSearchResult></ArrayOfRestaurantSearchResult>"];
    
    
    NSArray* results = [resultParser parseResultString:searchResponse];
    
    
    [delegate didRecieveSearchResult:results];
}

-(void)dealloc
{
    [resultParser release];
    [super dealloc];
}

@end
