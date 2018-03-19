//
//  Team.h
//  CollectionOfKnowledge
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 WangYongxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Team : NSObject{
    @public
    NSString * _name;
}

@property (nonatomic,assign)int serialNumber;
@property (nonatomic,strong)NSNumber * number;
@property (nonatomic,strong)Person * person;
@property (nonatomic,strong)NSMutableArray * arr;

@end
