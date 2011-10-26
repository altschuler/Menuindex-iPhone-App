//
//  SearchFilterModel.h
//  Menuindex
//
//  Created by zupa-sia on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchFilterModel : NSObject
{
    BOOL hasTakeaway;
    BOOL isOpen;
}

@property (nonatomic) BOOL hasTakeaway;
@property (nonatomic) BOOL isOpen;

-(void)logFilter;

@end
