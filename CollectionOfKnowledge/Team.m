//
//  Team.m
//  CollectionOfKnowledge
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 WangYongxin. All rights reserved.
//

#import "Team.h"

@implementation Team

-(instancetype)init{
    self = [super init];
    if (self) {
        _arr = [NSMutableArray array];
        _person = [[Person alloc]init];
    }
    return self;
}

/**
 KVO中 提供依赖键的方法
 
 对象中对象属性中值的改变
 */
+(NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    NSSet * set = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"person"]) {
        NSArray * arr = @[@"_person.name",@"_person.age"];
        set = [set setByAddingObjectsFromArray:arr];
    }
    return set;
}

/**
 这个类KVO是否自动触发的设置

 手动触发的时候类的属性改变时需要调用：willChangeValueForKey: 和 didChangeValueForKey:
 */
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"serialNumber"]) {
        return NO;
    }
    return true;
}


@end
