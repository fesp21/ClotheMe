//
//  JSONLoader.h
//  ClotheMe
//
//  Created by Alex Tsang on 7/20/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Crittercism.h"

@interface JSONLoader : NSObject

+ (NSString *)fileAsString:(NSString *)fileName withExtention:(NSString *)fileType;
+ (NSDictionary *)fileAsDictionary:(NSString *)fileName withExtention:(NSString *)fileType;

@end
