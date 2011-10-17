//
//  RestaurantDetailsViewController.h
//  Menuindex
//
//  Created by zupa-sia on 14/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchService.h"
#import "SearchServiceDelegate.h"
#import "SearchResultModel.h"

@interface RestaurantDetailsViewController : UIViewController <SearchServiceDelegate>{
    IBOutlet UILabel *nameLabel;
    SearchService* searchService;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchResultModel:(SearchResultModel*)srm;

@end
