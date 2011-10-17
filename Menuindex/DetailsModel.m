//
//  DetailsModel.m
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsModel.h"
#import "MenuCardModel.h"
#import "MenuCardGroupModel.h"

@implementation DetailsModel

@synthesize menuCards;
@synthesize openingHours;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(NSArray*) getEntriesForMenuCardGroup:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil
{
    MenuCardModel* mcm = [menuCards objectAtIndex:menuCardId];
    MenuCardGroupModel* mcgm = [mcm.groups objectAtIndex:groupIdOrNil];
    return mcgm.groupEntries;
}

-(NSString*) getGroupTitleForMenuCard:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil
{
    MenuCardModel* mcm = [menuCards objectAtIndex:menuCardId];
    MenuCardGroupModel* mcgm = [mcm.groups objectAtIndex:groupIdOrNil];
    
    return mcgm.groupTitle;
}

-(NSArray*) getGroupsInMenuCard:(NSInteger)menuCardId
{
    MenuCardModel* mcm = [menuCards objectAtIndex:menuCardId];
    return mcm.groups;
    
}

-(NSString*) getTitleForMenuCard:(NSInteger)menuCardId
{
    MenuCardModel* mcm = [menuCards objectAtIndex:menuCardId];
    return mcm.menuTitle;
}

@end
