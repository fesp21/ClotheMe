//
//  main.m
//  ClotheMe
//
//  Created by Alex Tsang on 7/16/11.
//  Copyright 2011 Altsa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClotheMeAppDelegate.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([ClotheMeAppDelegate class]));
    [pool release];
    return retVal;
}
