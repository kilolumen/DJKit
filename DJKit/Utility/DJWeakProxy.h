//
//  DJWeakProxy.h
//  DJKitDemo
//
//  Created by lidongjie on 2018/5/21.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DJWeakProxy : NSProxy

@property (nonatomic, readonly, weak, nullable) id target;

- (instancetype)initWithTarget:(id)target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
