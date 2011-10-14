//
//  DetailsModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsModel : NSObject
{
    NSString* name;
    NSString* description;
    NSString* openingHours;
    NSArray* menuCards;
}

-(NSString*) getGroupTitleForMenuCard:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil;

-(NSArray*) getGroupsInMenuCard:(NSInteger)menuCardId;

-(NSArray*) getEntriesForMenuCardGroup:(NSInteger)menuCardId groupId:(NSInteger)groupIdOrNil;

-(NSString*) getTitleForMenuCard:(NSInteger)menuCardId;


@property (nonatomic, copy) NSString* name;

@property (nonatomic, copy) NSString* description;

@property (nonatomic, copy) NSString* openingHours;

@property (nonatomic, retain) NSArray* menuCards;

@end
