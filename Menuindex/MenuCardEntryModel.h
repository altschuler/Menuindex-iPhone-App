//
//  MenuCardEntryModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuCardEntryModel : NSObject
{
    NSString* entryTitle;
    NSString* entryDescription;
    NSNumber* entryPrice;
}

@property (nonatomic, retain) NSString* entryTitle;

@property (nonatomic, retain) NSString* entryDescription;

@property (nonatomic, retain) NSNumber* entryPrice;

@end
