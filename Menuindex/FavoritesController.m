//
//  FavoritesController.m
//  Menuindex
//
//  Created by zupa-sia on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesController.h"
#import "FavoritesEntryModel.h"

@implementation FavoritesController

@synthesize favoritesList;
static FavoritesController* sharedSingleton;

- (id)init
{
    self = [super init];
    if (self) 
    {
        favoritesList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(BOOL)favoriteExistsForRestaurantWithId:(NSString*)restaurantId
{
    for (FavoritesEntryModel* favModel in favoritesList) 
    {
        if ([favModel.restaurantId isEqualToString:restaurantId])
        {
            return YES;
        }
    }
    
    return NO;
}

-(void)removeFavoriteWithRestaurantId:(NSString*)restaurantId
{
    for (FavoritesEntryModel* favModel in favoritesList) 
    {
        if ([favModel.restaurantId isEqualToString:restaurantId])
        {
            [favoritesList removeObject:favModel];
            break;
        }
    }
}

- (void) addFavorite:(FavoritesEntryModel *)favModel
{
    [favoritesList addObject:favModel];
}

-(BOOL)loadFavoritesFromDisk
{  
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:@"Favorites.plist"];
    
    NSArray* favRaw = [[NSArray alloc] initWithContentsOfFile:path];
    
    if (favRaw == nil)
        return NO;
    
    for (NSDictionary* favDict in favRaw) 
    {
        FavoritesEntryModel* favModel = [[FavoritesEntryModel alloc] initWithDict:favDict];
        
        [favoritesList addObject:favModel];
    }
    
    //    [path release];
    //    [favRaw release];
    
    return YES;
}

-(BOOL)writeFavoritesToDisk
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:@"Favorites.plist"];
    
    NSMutableArray* favArr = [[NSMutableArray alloc] init];
    
    for (FavoritesEntryModel* favEntryModel in favoritesList) 
    {
        NSMutableDictionary* favDict = [[NSMutableDictionary alloc] init];
        [favDict setValue:favEntryModel.restaurantId  forKey:@"restaurantId"];
        [favArr addObject:favDict];
    }
    
    BOOL writeSuccess = [favArr writeToFile:path atomically:YES];
    
    if (!writeSuccess)
    {
        NSLog(@"Write failed");
    }
    
    //    [path release];
    //    [favArr release];
    
    return writeSuccess;
}

- (void) dealloc
{
    [favoritesList release];
    [favoritesFilePath release];
    [super dealloc];
}


+(FavoritesController*)getInstance
{
    return sharedSingleton;
}

+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sharedSingleton = [[FavoritesController alloc] init];
        [sharedSingleton loadFavoritesFromDisk];
    }
}

@end
