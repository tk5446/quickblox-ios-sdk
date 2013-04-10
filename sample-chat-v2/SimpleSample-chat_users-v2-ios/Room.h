//
//  Room.h
//  SimpleSample-chat_users-v2-ios
//
//  Created by Glebus on 11.04.13.
//  Copyright (c) 2013 Quickblox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Room : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *messages;
@property (nonatomic, retain) NSSet *opponents;
@end

@interface Room (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inMessagesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromMessagesAtIndex:(NSUInteger)idx;
- (void)insertMessages:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeMessagesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInMessagesAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceMessagesAtIndexes:(NSIndexSet *)indexes withMessages:(NSArray *)values;
- (void)addMessagesObject:(NSManagedObject *)value;
- (void)removeMessagesObject:(NSManagedObject *)value;
- (void)addMessages:(NSOrderedSet *)values;
- (void)removeMessages:(NSOrderedSet *)values;
- (void)addOpponentsObject:(NSManagedObject *)value;
- (void)removeOpponentsObject:(NSManagedObject *)value;
- (void)addOpponents:(NSSet *)values;
- (void)removeOpponents:(NSSet *)values;

@end
