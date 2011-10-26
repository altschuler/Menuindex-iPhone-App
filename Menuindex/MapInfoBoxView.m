//
//  MapInfoBoxView.m
//  Menuindex
//
//  Created by zupa-sia on 23/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapInfoBoxView.h"

@implementation MapInfoBoxView
@synthesize nameLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)closeButtonDidTouch:(id)sender 
{
    [self removeFromSuperview];
}

- (void)dealloc {
    [nameLabel release];
    [super dealloc];
}
@end
