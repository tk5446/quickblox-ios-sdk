//
//  DataManager.m
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 04.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import "DataManager.h"
#import "GSCoreDataController.h"

@implementation DataManager

+ (id)manager {
    static dispatch_once_t once;
    static id managerInstance;
    dispatch_once(&once, ^{
        managerInstance = [self new];
    });
    return managerInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        [[QBChat instance] setDelegate:self];
    }
    return self;
}


#pragma mark -
#pragma mark Setter/Getter

- (void)setCurrentUser:(QBUUser *)currentUser {
    _currentUser = currentUser;
    
    if (currentUser) {
        [self.currentUser setPassword:[[BaseService sharedService] token]];
        [[QBChat instance] loginWithUser:self.currentUser];
    }
}

- (void)loadRooms {
    [[QBChat instance] requestAllRooms];
}

#pragma mark -
#pragma mark QBChatDelegate

- (void)chatDidLogin {
    [self loadRooms];
}

- (void)chatDidReceiveListOfRooms:(NSArray *)rooms {
    self.rooms = rooms;

    [rooms enumerateObjectsUsingBlock:^(QBChatRoom *room, NSUInteger idx, BOOL *stop) {
        NSManagedObject *roomObject = [GSCoreDataController createEntityWithName:@"Room"];
        [roomObject setValue:[NSDate date] forKey:@"date"];
        [roomObject setValue:room.name forKey:@"name"];
    }];
}

@end
