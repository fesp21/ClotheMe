//
//  Ebay.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONLoader.h"

@interface Ebay : NSObject

+ (double)averagePriceForProduct:(NSString *)description;
+ (NSURL *)urlForProduct:(NSString *)description;

@end
