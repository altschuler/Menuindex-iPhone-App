//
//  SearchResultModel.h
//  MenuindexTest
//
//  Created by zupa-sia on 06/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResultModel : NSObject
{
    NSString* resultId;
    NSString* title;
}

-(id) initWithTitle:(NSString*)titleOrNil andResultId:(NSString*)resultIdOrNil;

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* resultId;

@end
