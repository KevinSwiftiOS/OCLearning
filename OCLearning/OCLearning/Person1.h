//
//  Person1.h
//  OCLearning
//
//  Created by ckq on 2019/4/2.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person1 : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;
//工厂方法，用于对象的创建
+(instancetype)personWithName:(NSString *)name age:(NSUInteger)age;
//定义排序方法 返回p枚举的排序结果
-(NSComparisonResult)comparePerson:(Person1 *)person;
@end

NS_ASSUME_NONNULL_END
