//
//  ResultParser.m
//  Menuindex
//
//  Created by zupa-sia on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultParser.h"

@implementation ResultParser

- (id)init
{
    self = [super init];
    if (self) 
    {
        
    }
    
    return self;
}

- (NSArray*) parseResultString:(NSString *)rawResponse
{
    resultList = [[NSMutableArray alloc] init];
    
    xmlParser = [[NSXMLParser alloc] initWithData:[rawResponse dataUsingEncoding:NSUTF8StringEncoding]];
    
    [xmlParser setDelegate:self];
    [xmlParser parse];
    
    return resultList;
}

-(NSArray*)parseDetailsString:(NSString *)rawResponse
{
    resultList = [[NSMutableArray alloc] init];
    
    xmlParser = [[NSXMLParser alloc] initWithData:[rawResponse dataUsingEncoding:NSUTF8StringEncoding]];
    
    [xmlParser setDelegate:self];
    [xmlParser parse];
    
    return resultList; 
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    SearchResultModel* srm = [[SearchResultModel alloc] init];
    
    if ([elementName isEqualToString:@"RestaurantSearchResult"])
    {   
        srm.restaurantId = [self stringFromDict:attributeDict key:@"RestaurantId"];
        srm.name = [self stringFromDict:attributeDict key:@"Name"];
        
        [resultList addObject:srm];
    }
    else if ([elementName isEqualToString:@"Address"])
    {
        SearchResultModel* srm = [resultList lastObject];
        srm.addressZip = [self stringFromDict:attributeDict key:@"Zip"];    
        srm.addressStreet = [self stringFromDict:attributeDict key:@"Street"];
        srm.addressHouseNumber = [self stringFromDict:attributeDict key:@"HouseNumber"];
        srm.addressCity = [self stringFromDict:attributeDict key:@"City"]; 
        srm.latitude = [[self stringFromDict:attributeDict key:@"Latitude"] doubleValue];
        srm.longitude = [[self stringFromDict:attributeDict key:@"Longitude"] doubleValue]; 
        
    }
}

- (NSString*)stringFromDict:(NSDictionary*)dict key:(NSString*)keyValue
{
    return [(NSString*)[dict objectForKey:keyValue] copy];
}

@end
