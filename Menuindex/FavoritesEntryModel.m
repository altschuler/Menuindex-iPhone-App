//
//  FavoritesEntryModel.m
//  Menuindex
//
//  Created by zupa-sia on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesEntryModel.h"

@implementation FavoritesEntryModel

@synthesize restaurantId;

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) 
    {
        self.restaurantId = [dict objectForKey:@"restaurantId"];
    }
    
    return self;
}

@end
