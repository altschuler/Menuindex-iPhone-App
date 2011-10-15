//
//  ResultParser.h
//  Menuindex
//
//  Created by zupa-sia on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchResultModel.h"

@interface ResultParser : NSObject <NSXMLParserDelegate>
{
    NSXMLParser* xmlParser;
    SearchResultModel* currentSearchResultModel;
    NSMutableArray* resultList;
}

- (NSArray*) parseResultString:(NSString*)rawResponse;
- (NSArray*) parseDetailsString:(NSString*)rawResponse;
- (NSString*)stringFromDict:(NSDictionary*)dict key:(NSString*)keyValue;
@end
