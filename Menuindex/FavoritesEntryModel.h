//
//  FavoritesEntryModel.h
//  Menuindex
//
//  Created by zupa-sia on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesEntryModel : NSObject
{
    NSString* restaurantId;
}

@property (nonatomic, copy) NSString* restaurantId;

-(id)initWithDict:(NSDictionary*)dict;

@end
