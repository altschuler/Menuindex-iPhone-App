//
//  SearchResultTableViewCellController.m
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultTableCellController.h"

@implementation SearchResultTableCellController

@synthesize nameLabel;
@synthesize adressLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc 
{
    [adressLabel release];
    [nameLabel release];
    [super dealloc];
}
@end
