//
//  Person.m
//  archiver
//
//  Created by ckq on 2019/4/11.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "Person.h"

@implementation Person
//解档操作
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        //进行解档操作
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
        _sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return  self;
}
//完成属性归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_sex forKey:@"sex"];
}

@end
