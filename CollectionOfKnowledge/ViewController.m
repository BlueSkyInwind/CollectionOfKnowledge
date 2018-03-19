//
//  ViewController.m
//  CollectionOfKnowledge
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 WangYongxin. All rights reserved.
//

#import "ViewController.h"
#import "Team.h"
#import "NSObject+YXKVO.h"

@interface ViewController ()

@property(nonatomic,strong)Team * team;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Team * team1 = [[Team alloc]init];
    _team = team1;
    
    //自定义KVO的实现
//    [_team addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    //系统KVO的方法
    [_team YX_addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@,%@",keyPath,change);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int a = 0;
    _team.number = @(a++);
    
    //对象中对象属性中值的改变
//    _team.person.name = [NSString stringWithFormat:@"%d",a++];
//    _team.person.age = a++;
    
    
    //对象中公共属性的调用  注意，KVO是监听不到成员变量的
//    _team->_name = [NSString stringWithFormat:@"%d",a++];
    
    
    //KVO监听数组的方式
//    NSMutableArray *tempArr = [_team mutableArrayValueForKey:@"arr"];
//    [tempArr addObject:@"112"];
    
    
   // KVO手动触发的应用
//      [_team willChangeValueForKey:@"serialNumber"];
//      _team.serialNumber = a++;
//      [_team didChangeValueForKey:@"serialNumber"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
