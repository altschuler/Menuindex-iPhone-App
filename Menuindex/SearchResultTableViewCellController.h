//
//  SearchResultTableViewCellController.h
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCellController : UITableViewCell {
    IBOutlet UILabel* adressLabel;
    IBOutlet UILabel* nameLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *adressLabel;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;

@end
