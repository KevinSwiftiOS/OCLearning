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
//自定义构造化方法
-(instancetype)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex;

@end

NS_ASSUME_NONNULL_END
