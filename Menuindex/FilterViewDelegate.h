//
//  FilterViewDelegate.h
//  Menuindex
//
//  Created by zupa-sia on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchFilterModel.h"

@protocol FilterViewDelegate <NSObject>

@required
-(void)filterDidUpdate:(SearchFilterModel*)filter;

@required
-(void)filterShouldClose;

@end
