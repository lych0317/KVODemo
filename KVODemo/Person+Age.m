//
//  Person+Age.m
//  KVODemo
//
//  Created by yuanchao Li on 2017/3/16.
//  Copyright © 2017年 yuanchao Li. All rights reserved.
//

#import "Person+Age.h"
#import <objc/runtime.h>

@implementation Person (Age)

- (void)setAge:(NSUInteger)age {
    objc_setAssociatedObject(self, @selector(age), @(age), OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger)age {
    return [objc_getAssociatedObject(self, @selector(age)) integerValue];
}

@end
