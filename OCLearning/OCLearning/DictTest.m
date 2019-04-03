//
//  DictTest.m
//  OCLearning
//
//  Created by ckq on 2019/4/3.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "DictTest.h"

@implementation DictTest
+(void)test{
    [self createDict];
    [self traverseDict];
    [self mutableDict];
}
+(void)createDict{
    //创建不可变字典 key建议使用nsstring类型的 方便于查找 使用value和key value,key出现 末尾用Nil结束
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2",nil];
    NSLog(@"%@",dict);
    //最简化创建
    dict = @{@"name":@"tom",
             @"name":@"ckq", //当相同Key时，会自动选择第一个
             @"nickname":@"tangmu",
                @"age":@12  //转换成nsnumber对象 不需要添加nil
             };
      NSLog(@"%@",dict);
    //取出值
    NSString *name = [dict objectForKey:@"name"]; //不存在返回nil
    NSLog(@"name%@",name);
    NSNumber *age = dict[@"age"];
    NSLog(@"age = %@",age);
    NSLog(@"alll keys  = %@",[dict allKeysForObject:@"tom"]);
    //通过value找到对应的key
    //获取所有的Key和value
    NSLog(@"age = %@",dict.allKeys);
      NSLog(@"age = %@",dict.allValues);
    dict = @{@"name":@"Tom",
             @"infoDict":@[@1,@2]
             };
    //嵌套其余的类型
}
//遍历字典
+(void)traverseDict{
    NSDictionary *dict = @{@"name":@"Tom",@"nickname":@"tony",@"age":@20};
    //通过for in循环遍历
    for(NSString *key in dict){
        NSLog(@"%@:%@",key,dict[key]);
    }
    //遍历value
    for(id object in dict.allValues){
        NSLog(@"value is object",object);
    }
}
+(void)mutableDict{
    //创建空的可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //从其他字典添加键值对
    [dict addEntriesFromDictionary:@{@"name":@"tom",@"age":@12}];
     //添加一对键值对
    [dict setObject:@167 forKey:@"height"];
    //修改键值对
    [dict setObject:@30 forKey:@"age"];
    //执行删除操作
    [dict removeObjectForKey:@"age"];
    //删除所有键值对
    [dict removeAllObjects];
    [dict setValue:nil forKey:@"age"]; //会执行智能操作，当设置为nil的时候，会自动删除，当设置的值不会nil的时候，会自动添加和修改。
    NSLog(@"mutable is %@",dict);
}
@end
