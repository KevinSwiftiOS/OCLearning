//
//  Person.m
//  OCLearning
//
//  Created by ckq on 2019/3/26.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "Person.h"

@implementation Person
//实现
-(instancetype)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex{
    //完成父类的对象
    self = [super init];
    if(self){  //判断对象操作
        _name = name;
        _age = age;
        _sex = sex;
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"name = %@,age = %zd,sex = %@",_name,_age,_sex];
}
@end
