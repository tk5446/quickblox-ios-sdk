//
//  Room+Ext.m
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 11.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import "Room+Ext.h"

@implementation Room (Ext)

- (void)addMessagesObject:(NSManagedObject *)value {
    [self willChangeValueForKey:@"messages"];
    NSMutableOrderedSet *messages = [self.messages mutableCopy];
    [messages addObject:value];
    self.messages = messages;
    [self didChangeValueForKey:@"messages"];
}

@end
