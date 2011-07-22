//
//  Ebay.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ebay.h"

@implementation Ebay

+ (double)averagePriceForProduct:(NSString *)description {
	NSDictionary *privatedatadc = [JSONLoader fileAsDictionary:@"PrivateInfo/info" withExtention:@"json"];
    NSString *ebayApiURL = [NSString stringWithFormat:@"http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=%@&GLOBAL-ID=EBAY-US&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=%@&paginationInput.entriesPerPage=3",[[privatedatadc objectForKey:@"EbayData"] objectForKey:@"Key"],description];
    NSMutableURLRequest *ebayApiRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:ebayApiURL]];
	[ebayApiRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
	// Submit the api request synchronously
	NSData *ebayApiResponseData = nil;
    if(!(ebayApiResponseData = [NSURLConnection sendSynchronousRequest:ebayApiRequest returningResponse:nil error:nil])) {
        return 0;
    }
    
	NSDictionary *ebayApiResponseDictionary = [[CrittercismCJSONDeserializer deserializer] deserializeAsDictionary:ebayApiResponseData error:nil];
    
    NSArray *products = [[[[[ebayApiResponseDictionary objectForKey:@"findItemsByKeywordsResponse"] objectAtIndex:0] objectForKey:@"searchResult"] objectAtIndex:0] objectForKey:@"item"];
    
    double averagePrice = 0.0;
    int productCount = 0;
    
    for(NSDictionary* product in products) {
        averagePrice += [[[[[[product objectForKey:@"sellingStatus"] objectAtIndex:0] objectForKey:@"currentPrice"] objectAtIndex:0] objectForKey:@"__value__"] floatValue];
        productCount++;
    }
    
    averagePrice = averagePrice/productCount;
    
    return averagePrice;
}

+ (NSURL *)urlForProduct:(NSString *)description {
	NSDictionary *privatedatadc = [JSONLoader fileAsDictionary:@"PrivateInfo/info" withExtention:@"json"];
    NSString *ebayApiURL = [NSString stringWithFormat:@"http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=%@&GLOBAL-ID=EBAY-US&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=%@&paginationInput.entriesPerPage=3",[[privatedatadc objectForKey:@"EbayData"] objectForKey:@"Key"],description];
    NSMutableURLRequest *ebayApiRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:ebayApiURL]];
	[ebayApiRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];

    NSData *ebayApiResponseData = nil;
    if(!(ebayApiResponseData = [NSURLConnection sendSynchronousRequest:ebayApiRequest returningResponse:nil error:nil])) {
        return 0;
    }

	NSDictionary *ebayApiResponseDictionary = [[CrittercismCJSONDeserializer deserializer] deserializeAsDictionary:ebayApiResponseData error:nil];
    
    NSArray *products = [[[[[ebayApiResponseDictionary objectForKey:@"findItemsByKeywordsResponse"] objectAtIndex:0] objectForKey:@"searchResult"] objectAtIndex:0] objectForKey:@"item"];
    
    for(NSDictionary* product in products) {
        return [NSURL URLWithString:[[product objectForKey:@"viewItemURL"] objectAtIndex:0]];
    }
    
    return nil;
}

@end
