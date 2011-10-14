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
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(DetailsModel*) getDetailsFromId:(NSString *)resultId
{
    DetailsModel* dm = [[DetailsModel alloc] init];
    
    if ([resultId isEqualToString:@"1"])
    {
        dm.name = @"Woot restaurant";
        dm.description = @"Very nice place warm & cool";
        dm.openingHours = @"Mon-Tue: 10am - 11pm";
    }
    else if ([resultId isEqualToString:@"2"])
    {
        dm.name = @"La Conte";
        dm.description = @"Lorem ipsum";
        dm.openingHours = @"Mon-Fri: pm";
    }
    else
    {
        dm.name = @"La Casa";
        dm.description = @"Awesome sauce";
        dm.openingHours = @"Mon-Tue: 1am - 2pm";
    }
    
    MenuCardModel* mcm = [[MenuCardModel alloc] init];
    mcm.menuTitle = @"Take away";
    
    MenuCardEntryModel* mcem1 = [[MenuCardEntryModel alloc] init];
    mcem1.entryTitle = @"Spaghetti bolognese";
    mcem1.entryDescription = @"Med kødsovs af lort";
    mcem1.entryPrice = [NSNumber numberWithFloat:56.5];
    
    MenuCardEntryModel* mcem2 = [[MenuCardEntryModel alloc] init];
    mcem2.entryTitle = @"Hytteost";
    mcem2.entryDescription = @"Mel ost mle ost";
    mcem2.entryPrice = [NSNumber numberWithFloat:35];
    
    MenuCardGroupModel* mcgm1 = [[MenuCardGroupModel alloc] init];
    mcgm1.groupTitle = @"Pizza";
    mcgm1.groupEntries = [[NSArray alloc] initWithObjects:mcem1,mcem2, nil];
    
    MenuCardGroupModel* mcgm2 = [[MenuCardGroupModel alloc] init];
    mcgm2.groupTitle = @"Sandwich";
    mcgm2.groupEntries = [[NSArray alloc] initWithObjects:mcem2,mcem1,mcem2,mcem1,mcem2,mcem1, nil];
    
    NSArray* groups = [[NSArray alloc] initWithObjects:mcgm1,mcgm2,nil];
    
    mcm.groups = groups;
    
    NSArray* menuCards = [[NSArray alloc] initWithObjects:mcm, nil];
    dm.menuCards = menuCards;
    
    return dm;
}

-(void)searchForQuery:(NSString *)query
{
    NSLog(@"Search by query: %@", query);
    
    SearchResultModel* srm1 = [[SearchResultModel alloc] initWithTitle:@"Pizzahuset" andResultId:@"1"];
    
    SearchResultModel* srm2 = [[SearchResultModel alloc] initWithTitle:@"Asminderød Kro" andResultId:@"2"];
    
    SearchResultModel* srm3 = [[SearchResultModel alloc] initWithTitle:@"Karlsson Mad" andResultId:@"3"];
    
    
    NSArray* results;
    if ([query isEqualToString:@""]) {
        results = [[NSArray alloc] init];
    }
    else
    {
        results = [[NSArray alloc] initWithObjects:srm1, srm2, srm3, nil];
    }
    
    [delegate didRecieveSearchResult:results];

}

@end
