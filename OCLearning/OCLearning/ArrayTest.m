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
    [self sortArray];
    [self otherMethod];
    [self mutableArray];
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
+(void)sortArray{
    //乱序数组的创建
    NSArray *array = @[@"5",@"3",@"4",@"1",@"2"];
    //排序 选择器 字符串中提供compare方法
    NSArray *resultArray = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",resultArray);
    
    Person1 *person1 = [Person1 personWithName:@"a" age:1];
    Person1 *person2 = [Person1 personWithName:@"r" age:2];
    Person1 *person3 = [Person1 personWithName:@"b" age:3];
    Person1 *person4 = [Person1 personWithName:@"d" age:4];
    Person1 *person5 = [Person1 personWithName:@"c" age:5];
    //创建数组
    NSArray *personArray = @[person1,person2,person3,person4,person5];
    resultArray = [personArray sortedArrayUsingSelector:@selector(comparePerson:)];
    NSLog(@"%@",resultArray);
    //使用自定义的排序方式 指定对应的排序名字 和是否升序 yes是升序 no是降序
    NSSortDescriptor *desc1 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSSortDescriptor *desc2 = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:TRUE];
    resultArray = [personArray sortedArrayUsingDescriptors:@[desc1,desc2]];
    NSLog(@"result%@",resultArray);
}
+(void)otherMethod{
    //通过数组索引值访问 和首尾元素访问
    NSArray *array = @[@"1",@"2",@"3",@"4"];
    NSLog(@"first object:%@",array.firstObject);
    NSLog(@"first object:%@",array.lastObject);
    //元素的拼接 分割后随后进行拼接
    NSString *string = @"i love you";
    NSArray *array1 = [string componentsSeparatedByString:@" "];
    //进行连接
    NSString *string1 = [array1 componentsJoinedByString:@"-"];
    NSLog(@"%@",string1);
}
+(void)mutableArray{
    //可变数组
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@1];
    [array addObject:@"2"];
    //在某一个索引位置上插入元素
    [array insertObject:@2 atIndex:1];
        //删除某个元素 会找到所有为2的 并删除
    //清空元素
    [array removeAllObjects];
    [array removeObject:@2];
    //替换的对象
    [array replaceObjectAtIndex:1 withObject:@"2"];
    NSLog(@"array is %@",array);
 

}
@end
