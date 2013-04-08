//
//  DataManager.m
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 04.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (id)manager {
    static dispatch_once_t once;
    static id managerInstance;
    dispatch_once(&once, ^{
        managerInstance = [self new];
    });
    return managerInstance;
}

@end
