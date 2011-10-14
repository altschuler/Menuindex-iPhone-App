//
//  MenuCardModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 07/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuCardModel : NSObject
{
    NSString* menuId;
    NSString* menuTitle;
    NSArray* groups;
}

@property (nonatomic, copy) NSString* menuId;

@property (nonatomic, copy) NSString* menuTitle;

@property (nonatomic, retain) NSArray* groups;

@end
