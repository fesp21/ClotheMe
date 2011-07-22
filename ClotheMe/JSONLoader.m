//
//  JSONLoader.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/20/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import "JSONLoader.h"

@implementation JSONLoader

+(NSString *)fileAsString:(NSString *)fileName withExtention:(NSString *)fileType {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];  
    NSString *fileContents = nil;
    if(filePath) {
        fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
    return fileContents;
}

+(NSDictionary *)fileAsDictionary:(NSString *)fileName withExtention:(NSString *)fileType {
    NSString *fileContents = [self fileAsString:fileName withExtention:fileType];
    NSData *fileData = [fileContents dataUsingEncoding:NSUTF8StringEncoding];
    return [[[[CrittercismCJSONDeserializer deserializer] deserializeAsDictionary:fileData error:nil] copy] autorelease];
}

@end
