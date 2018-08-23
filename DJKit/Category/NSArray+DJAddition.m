//
//  NSArray+DJAddition.m
//  DJKitDemo
//
//  Created by lidongjie on 2018/8/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "NSArray+DJAddition.h"

@implementation NSArray (DJAddition)

- (nullable NSString *)dj_toSortedJsonString {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSArray *tempArray = [self copy];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *value in tempArray) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            [array addObject:[(NSDictionary *)value b2b_toSortedJsonString]];
        } else if ([value isKindOfClass:[NSArray class]]) {
            [array addObject:[(NSArray *)value b2b_toSortedJsonString]];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            if ([value isKindOfClass:[@YES class]]) {
                [array addObject:([value boolValue] ? @"true" : @"false")];
            } else {
                [array addObject:[NSString stringWithFormat:@"%@", value]];
            }
        } else {
            [array addObject:[NSString stringWithFormat:@"\"%@\"", value]];
        }
    }
    return [NSString stringWithFormat:@"[%@]", [array componentsJoinedByString:@","]];
}

@end
