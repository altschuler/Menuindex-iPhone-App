//
//  MapInfoBoxView.h
//  Menuindex
//
//  Created by zupa-sia on 23/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapInfoBoxView : UIView 
{
    UILabel *nameLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;

- (IBAction)closeButtonDidTouch:(id)sender;

@end
