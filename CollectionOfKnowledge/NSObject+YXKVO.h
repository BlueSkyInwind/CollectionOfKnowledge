//自定义KVO的监听方法
//  NSObject+YXKVO.h
//  CollectionOfKnowledge
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 WangYongxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YXKVO)

-(void)YX_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nonnull)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;


@end
