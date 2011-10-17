//
//  DetailsModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchResultModel.h"

@interface DetailsModel : SearchResultModel
{
    NSArray* openingHours;
    NSArray* menuCards;
}

@property (nonatomic, retain) NSArray* menuCards;
@property (nonatomic, retain) NSArray* openingHours;

-(NSString*) getGroupTitleForMenuCard:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil;

-(NSArray*) getGroupsInMenuCard:(NSInteger)menuCardId;

-(NSArray*) getEntriesForMenuCardGroup:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil;

-(NSString*) getTitleForMenuCard:(NSInteger)menuCardId;

@end
