//
//  SearchService.h
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailsModel.h"
#import "SearchServiceDelegate.h"

@interface SearchService : NSObject
{
    id <SearchServiceDelegate> delegate;
}

@property (retain) id <SearchServiceDelegate> delegate;

- (void) searchForQuery:(NSString*)query;

- (DetailsModel*) getDetailsFromId:(NSString*)resultId;

@end
