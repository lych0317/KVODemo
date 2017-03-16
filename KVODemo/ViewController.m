//
//  ViewController.m
//  KVODemo
//
//  Created by yuanchao Li on 2017/3/16.
//  Copyright © 2017年 yuanchao Li. All rights reserved.
//

#import "ViewController.h"
#import "Person+Age.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [[Person alloc] init];
    
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    p.name = @"leo";
    p.age = 28;
    
    NSLog(@"name : %@, age : %@", p.name, @(p.age));
    
    [p removeObserver:self forKeyPath:@"name" context:nil];
    [p removeObserver:self forKeyPath:@"age" context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath : %@, object : %@, change : %@", keyPath, object, change);
}

@end
