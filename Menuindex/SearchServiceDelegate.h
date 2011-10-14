//
//  PSearchService.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchServiceDelegate <NSObject>
    
@required
-(void) didRecieveSearchResult: (NSArray*)result;

@end
