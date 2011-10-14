//
//  MenuCardGroupModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuCardGroupModel : NSObject
{
    NSString* groupTitle;
    NSArray* groupEntries;
}

@property (nonatomic, retain) NSString* groupTitle;

@property (nonatomic, retain) NSArray* groupEntries;
@end
