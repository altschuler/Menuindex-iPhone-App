//
//  FavoritesTableCellController.m
//  Menuindex
//
//  Created by zupa-sia on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesTableCellController.h"

@implementation FavoritesTableCellController

@synthesize nameLabel;
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        
    }
    return self;
}

- (IBAction)deleteButtonDidTouch:(id)sender 
{   
    [delegate deleteButtonDidTouchFromCell:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc 
{
    [nameLabel release];
    [super dealloc];
}
@end
