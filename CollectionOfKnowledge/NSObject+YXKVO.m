//
//  NSObject+YXKVO.m
//  CollectionOfKnowledge
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 WangYongxin. All rights reserved.
//


//OC的方法调用里面有两个隐藏参数 ！
// self 方法的调用者 ， _cmd方法编号

//OC的方法有两个部分组成 1、SEL 方法编号  2、IMP方法的实现

#import "NSObject+YXKVO.h"
#import <objc/message.h>

@implementation NSObject (YXKVO)

-(void)YX_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    //生成动态创建类的类名
    NSString * oldClass = NSStringFromClass(self.class);
    NSString * newClass = [@"YXKVO_" stringByAppendingString:oldClass];
    //创建类
    Class myClass = objc_allocateClassPair(self.class, newClass.UTF8String, 0);
    //注册类
    objc_registerClassPair(myClass);
    //添加setName: 重写 (两种写法)
    
    //方法一：
//    class_addMethod(myClass, @selector(setNumber:), (IMP)haha, "");
    //方法二：
    IMP objectIMP = class_getMethodImplementation(self.class, @selector(setObject:));
    class_addMethod(myClass, @selector(setNumber:), objectIMP, "");
    
    //修改类型
    object_setClass(self, myClass);
}

void haha(id haha ,SEL hehe , NSString * newName){
    NSLog(@"%@,%@,%@",haha,NSStringFromSelector(hehe),newName);
}

-(void)setObject:(NSString *)newName{
    NSLog(@"%@",newName);
}



@end



