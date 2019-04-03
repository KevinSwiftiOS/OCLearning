//
//  Person1.m
//  OCLearning
//
//  Created by ckq on 2019/4/2.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "Person1.h"

@implementation Person1
+(instancetype)personWithName:(NSString *)name age:(NSUInteger)age{
    Person1 *person1 = [[self alloc]init];
    person1.age = age;
    person1.name = name;
    return person1;
}
-(NSComparisonResult)comparePerson:(Person1 *)person{
    //根据name来进行自动排序
    return [self.name compare:person.name];
}
-(NSString *)description{

    return [NSString stringWithFormat:@"name = %@,age = %zd",_name,_age];
}
@end
