//
//  SearchService.h
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestaurantDetailsModel.h"
#import "SearchServiceDelegate.h"
#import "ResultParser.h"
#import "SearchFilterModel.h"

@interface SearchService : NSObject <NSXMLParserDelegate>
{
    id <SearchServiceDelegate> delegate;
    ResultParser* resultParser;
}

@property (retain) id <SearchServiceDelegate> delegate;

- (void) searchForQuery:(NSString*)query withFilter:(SearchFilterModel*)filter;

- (void) getDetailsFromId:(NSString*)resultId;

@end
