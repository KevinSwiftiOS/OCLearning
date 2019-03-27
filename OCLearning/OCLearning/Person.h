//
//  Person.h
//  OCLearning
//
//  Created by ckq on 2019/3/26.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
    NSString *_sex;
}
//set和get方法
-(void)setName:(NSString *)name;
-(void)setAge:(NSInteger *)age;
-(void)setSex:(NSString *)sex;
//取值 get方法
-(NSString *)name;
-(NSString *)sex;
-(NSInteger)age;

//自定义构造化方法
-(instancetype)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex;

@end

NS_ASSUME_NONNULL_END
