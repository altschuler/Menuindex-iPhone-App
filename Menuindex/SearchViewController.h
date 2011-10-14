//
//  FirstViewController.h
//  Menuindex
//
//  Created by zupa-sia on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *searchTextField;
    
}

-(IBAction)backgroundTouch:(id)sender;

@end
