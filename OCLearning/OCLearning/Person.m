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
        self.name = name;
        self.sex = sex;
        self.age = age;
    }
    return self;
}
//
//-(void)setName:(NSString *)name{
//    self.name = name;
//}
//-(void)setAge:(NSInteger *)age{
//    self.age = age;
//}
//-(void)setSex:(NSString *)sex{
//    self.sex = sex;
//}
//-(NSString *)name{
//    return self.name;
//}
//-(NSString *)sex
//{
//    return self.sex;
//}
//-(NSInteger)age{
//    return self.age;
//}



-(NSString *)description{
    return [NSString stringWithFormat:@"name = %@,age = %zd,sex = %@",self.name,self.age,self.sex];
}
@end
