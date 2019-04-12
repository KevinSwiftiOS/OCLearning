//
//  Person.h
//  RunTime
//
//  Created by ckq on 2019/4/12.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
+(instancetype)person;
@end

NS_ASSUME_NONNULL_END
