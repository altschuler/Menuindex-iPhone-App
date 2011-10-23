//
//  PSearchService.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestaurantDetailsModel.h"

@protocol SearchServiceDelegate <NSObject>
    
@optional
-(void) didRecieveSearchResult: (NSArray*)result;

@optional
-(void)didRecieveRestaurantDetails:(RestaurantDetailsModel *)details;
@end
