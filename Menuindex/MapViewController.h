//
//  SecondViewController.h
//  Menuindex
//
//  Created by zupa-sia on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnotationMap.h"
#import "AnnotationMapDelegate.h"

@interface MapViewController : UIViewController<AnnotationMapDelegate>
{
    AnnotationMap* annotationMap;
    IBOutlet UIButton* centerButton;
}

- (IBAction)centerButtonDidTouch:(id)sender;

@end
