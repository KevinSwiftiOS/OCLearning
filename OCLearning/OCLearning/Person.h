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
//{
//    NSString *_name;
//    NSInteger _age;
//    NSString *_sex;
//}
//属性生成器，自动生成get和set方法， 自动生成私有变量，并在变量前加上_
//对属性的相关约束。例如nonatomic,atomic等。
@property (nonatomic,weak,readonly) NSString *name; //自动生成私有属性 _name;
@property NSInteger age;
@property NSString *sex;


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
+(instancetype)person;
-(void)setName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
