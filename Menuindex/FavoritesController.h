//
//  FavoritesController.h
//  Menuindex
//
//  Created by zupa-sia on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesEntryModel.h"

@interface FavoritesController : NSObject
{
    NSString* favoritesFilePath;
    NSMutableArray* favoritesList;
}

@property (nonatomic, retain) NSMutableArray* favoritesList;

+(FavoritesController*)getInstance;

-(void)addFavorite:(FavoritesEntryModel*)favModel;

-(void)removeFavoriteWithRestaurantId:(NSString*)restaurantId;

-(BOOL)writeFavoritesToDisk;

-(BOOL)loadFavoritesFromDisk;

-(BOOL)favoriteExistsForRestaurantWithId:(NSString*)restaurantId;

@end
