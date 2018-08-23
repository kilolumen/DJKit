//
//  NSDictionary+DJAddition.m
//  DJKitDemo
//
//  Created by lidongjie on 2018/8/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "NSDictionary+DJAddition.h"
#import "NSArray+DJAddition.h"

NS_ASSUME_NONNULL_BEGIN


@implementation NSDictionary (DJAddition)

- (nullable NSString *)dj_toSortedJsonString {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSDictionary *tempDict = [self copy];
    NSArray *sortedKeys = [[tempDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in sortedKeys) {
        id value = tempDict[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [array addObject:[NSString stringWithFormat:@"\"%@\":%@", key, [(NSDictionary *)value dj_toSortedJsonString]]];
        } else if ([value isKindOfClass:[NSArray class]]) {
            [array addObject:[NSString stringWithFormat:@"\"%@\":%@", key, [(NSArray *)value dj_toSortedJsonString]]];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            if ([value isKindOfClass:[@YES class]]) {
                [array addObject:[NSString stringWithFormat:@"\"%@\":%@", key, ([value boolValue] ? @"true" : @"false")]];
            } else {
                [array addObject:[NSString stringWithFormat:@"\"%@\":%@", key, value]];
            }
        } else {
            [array addObject:[NSString stringWithFormat:@"\"%@\":\"%@\"", key, value]];
        }
    }
    return [NSString stringWithFormat:@"{%@}", [array componentsJoinedByString:@","]];
}

@end

NS_ASSUME_NONNULL_END
