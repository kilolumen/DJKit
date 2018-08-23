//
//  NSString+SHA1.m
//  DJKitDemo
//
//  Created by lidongjie on 2018/8/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "NSString+SHA1.h"

@implementation NSString (SHA1)

- (NSString *)dj_sha1 {
    //这两句容易造成中文字符串转data时会造成数据丢失
    //const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:self.length];
    // instead of
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
