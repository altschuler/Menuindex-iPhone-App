//
//  SearchFilterModel.m
//  Menuindex
//
//  Created by zupa-sia on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchFilterModel.h"

@implementation SearchFilterModel

@synthesize hasTakeaway;
@synthesize isOpen;

- (id)init
{
    self = [super init];
    if (self) 
    {
        
    }
    
    return self;
}

-(void) logFilter
{
    NSLog(@"hasTakeaway: %d\nisOpen: %d", hasTakeaway, isOpen);
}

@end
