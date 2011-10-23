//
//  FavoritesTableCellControllerDelegate.h
//  Menuindex
//
//  Created by zupa-sia on 23/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FavoritesTableCellControllerDelegate <NSObject>

-(void)deleteButtonDidTouchFromCell:(UITableViewCell*)cell;

@end
