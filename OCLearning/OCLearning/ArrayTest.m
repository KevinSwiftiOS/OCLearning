//
//  ArrayTest.m
//  OCLearning
//
//  Created by ckq on 2019/3/31.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "ArrayTest.h"

@implementation ArrayTest
+(void)test{
    [self createArray];
    [self traversArray];
}
+(void)createArray{
    //创建不可变数组 nil是结束的标志 基本数据类型不能添加，只能是对象
    NSArray *array= [[NSArray alloc]initWithObjects:@1,@2, nil];
    NSLog(@"%@",array);
    //获取个数
    NSLog(@"length :%zd",array.count);
    //简化的创建数组方式 不需要添加nil
    array = @[@1,@2,@3];
        NSLog(@"%@",array);
//通过类方法创建 前面的array添加
    NSNumber *num = @1.1;
    array = [NSArray arrayWithObjects:@"one",@"two",array,num,nil];
    NSLog(@"length :%@",array);
    //取出数组中的元素 泛型
 id object = [array objectAtIndex:0];
     NSLog(@"is :%@",object);
}
//遍历数组
+(void)traversArray{
    //创建数组
    NSArray *array = @[@"1",@"2",@"3"];
    //最基本的遍历
    for(NSInteger i = 0; i < array.count;i++){
        NSLog(@"%@",array[i]);
    }
    //for in循环 快速枚举 不确定类型 不需要下标
    for (id object in array) {
        NSLog(@"%@",object);
    }
    //使用枚举器进行遍历
    NSEnumerator *enumerator = [array objectEnumerator];
    //像迭代器一样 一直执行到下一步
    id object = [enumerator nextObject];
    while (object) {
        NSLog(@"object is %@",object);
        object = [enumerator nextObject];
    }
}
@end
