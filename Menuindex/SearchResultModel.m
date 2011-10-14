//
//  SearchResultModel.m
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultModel.h"

@implementation SearchResultModel

@synthesize resultId;
@synthesize title;

- (id)initWithTitle:(NSString*)titleOrNil andResultId:(NSString*)resultIdOrNil
{
    if ([self init]) {
        resultId = resultIdOrNil;
        title = titleOrNil;
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
