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
    NSString* searchQuery = [[NSString alloc] initWithFormat:@"http://10.13.37.124:7538/data/restaurant/%@",resultId];
    NSURL* searchURL = [NSURL URLWithString:searchQuery];
    
    NSString* searchResponse = [[NSString alloc] initWithContentsOfURL:searchURL];
    
    NSArray* results = [resultParser parseDetailsString:searchResponse];
    
    [delegate didRecieveSearchResult:results];
}

-(void)searchForQuery:(NSString *)query
{
    NSString* searchQuery = [[NSString alloc] initWithFormat:@"http://10.13.37.124:7538/data/search/%@",query];
    NSURL* searchURL = [NSURL URLWithString:searchQuery];
    
    NSString* searchResponse = [[NSString alloc] initWithContentsOfURL:searchURL];
    
    NSArray* results = [resultParser parseResultString:searchResponse];
    
    [delegate didRecieveSearchResult:results];
}

@end
